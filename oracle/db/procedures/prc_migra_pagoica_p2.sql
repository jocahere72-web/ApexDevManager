
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_PAGOICA_P2" ( p_id_entdad         in  number
                                                 , p_id_usrio         in  number
                                                 , p_cdgo_clnte       in  number) as


cursor c0(r_cdgo_clnte number,
          r_id_entdad  number) is
    select m.clmna40  id_bnco,
           m.clmna41  id_cnta_bnco,
           m.clmna5   fcha_cntrol,
           count(*) cntdad, sum(m.clmna3) ttal
      from migra.MG_G_INTERMEDIA_PAGOICA m
     where m.CDGO_CLNTE        = r_cdgo_clnte and
           m.ID_ENTDAD         = r_id_entdad and
           m.cdgo_estdo_rgstro = 'L' and
           m.clmna47           = 'dK'
    group by m.clmna40, m.clmna41, m.clmna5
    order by m.clmna5, m.clmna40, m.clmna41;


cursor c1(r_cdgo_clnte       number,
          r_id_entdad        number,
          r_id_bnco          varchar2,
          r_id_cnta_bnco     varchar2,
          r_fcha_cntrol      varchar2) is
  select t.id_intrmdia, t.id_entdad,t.cdgo_clnte,
         t.clmna1, t.clmna2, t.clmna3, t.clmna4, t.clmna5, t.clmna6,
         t.clmna7, t.clmna8, t.clmna9, t.clmna10, t.clmna11, t.clmna12,
         t.clmna13, t.clmna14, t.clmna15, t.clmna16, t.clmna17,
         t.cdgo_estdo_rgstro,
         t.clmna46, -- = v_mnsje_rspsta,
         t.clmna47, -- = v_error,
         t.clmna48, -- = v_id_sjto_impsto,
         t.clmna49, -- = v_id_orgen
         t.clmna50 -- = v_tpo_dcnto
    from migra.MG_G_INTERMEDIA_PAGOICA t
   where t.CDGO_CLNTE        = r_cdgo_clnte and
         t.ID_ENTDAD         = r_id_entdad and
         t.clmna40           = r_id_bnco and
         t.clmna41           = r_id_cnta_bnco and
         t.clmna5            = r_fcha_cntrol and
         t.cdgo_estdo_rgstro = 'L' and
         t.clmna47           = 'dK'
  order by t.id_intrmdia;



--Tipo para el Estandar de Error: Retirar tipos si se incluye el PRC en el pkg_mg_migracion

v_mnsje_rspsta      varchar2(4000);


--v_cdgo_clnte        df_s_clientes.cdgo_clnte%type;
v_id_impsto         df_c_impuestos.id_impsto%type;
v_id_impsto_sbmpsto df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;

v_crga_dtlle        boolean;
v_crea_dtlle        boolean;
v_cnfrma_rcdos      boolean;

v_id_rcdo           re_g_recaudos.id_rcdo%type;
v_id_rcdo_cntrol    re_g_recaudos_control.id_rcdo_cntrol%type;
v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;
v_id_orgen          re_g_recaudos.id_orgen%type;
v_tpo_orgen         re_g_recaudos.cdgo_rcdo_orgn_tpo%type;

--v_id_cnvnio         re_g_recaudos.id_cnvnio%type;

v_obsrvcion         re_g_recaudos.obsrvcion%type;
v_cdgo_frma_pgo     re_g_recaudos.cdgo_frma_pgo%type;
v_cdgo_rcdo_estdo   re_g_recaudos.cdgo_rcdo_estdo%type;
v_mnsje             re_g_recaudos.mnsje_rspsta%type;

v_txto              varchar2(4000);
v_cntdor            number;

v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);
v_archvo_error      varchar2(200);
v_fcha_hra          varchar2(50);

v_estdo_fnal        varchar2(1);
v_estdo_crge        varchar2(1);
begin

  v_fcha_hra     := to_char(SYSDATE,'yyyymmdd_hh24miss');

  v_archvo_log   := 'PRC_MIGRA_PAGOICA_P2_LOG_'||v_fcha_hra||'.txt';
  v_archvo_cmmit := 'PRC_MIGRA_PAGOICA_P2_COMMIT_'||v_fcha_hra||'.txt';
  v_archvo_error := 'PRC_MIGRA_PAGOICA_P2_ERROR_'||v_fcha_hra||'.txt';
  v_cntdor       := 0;

  --v_cdgo_clnte        := p_cdgo_clnte;
  v_id_impsto         := 102;
  v_id_impsto_sbmpsto := 1022;



  GENESYS.sitpr001('Iniciando proceso de revision de pagos ICA (PRC_MIGRA_PAGOICA_P2)', v_archvo_log);

  v_cntdor := 0;

  v_txto := 'Se inicia proceso de cargue de pagos-recuados ';

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

  for r0 in c0(p_cdgo_clnte, p_id_entdad) loop
    GENESYS.sitpr001('Procesando control: '||r0.id_bnco||'-'||r0.id_cnta_bnco||'-'||r0.fcha_cntrol, v_archvo_log);

    v_crga_dtlle := true;
    v_crea_dtlle := false;

    begin
      insert into re_g_recaudos_control
            (cdgo_clnte, id_impsto, id_impsto_sbmpsto,
             id_bnco, id_bnco_cnta, fcha_cntrol, obsrvcion,
             cntdad_rcdos, vlor_rcdos,
             cdgo_rcdo_orgen, id_prcso_crga,
             id_usrio, fcha_rgstro)
      values(p_cdgo_clnte, v_id_impsto, v_id_impsto_sbmpsto,
             r0.id_bnco, r0.id_cnta_bnco, to_date(r0.fcha_cntrol,'dd/mm/yyyy'), 'MIGRADO',
             r0.cntdad, r0.ttal,
             'AC', null,
             p_id_usrio, to_date(r0.fcha_cntrol,'dd/mm/yyyy'))
      returning ID_RCDO_CNTROL
           into v_id_rcdo_cntrol;
    exception
      when others then
        v_crga_dtlle   := false;
        v_mnsje_rspsta := ' . No se pudo registrar control: '||r0.id_bnco||'-'||r0.id_cnta_bnco||'-'||r0.fcha_cntrol||': '||sqlcode||'-'||sqlerrm;
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
        continue;
    end;

    v_mnsje_rspsta := 'Control creado: '||v_id_rcdo_cntrol;
    GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);

    if v_crga_dtlle then

      v_crea_dtlle   := false;
      v_cnfrma_rcdos := false;

      for r1 in c1(p_cdgo_clnte, p_id_entdad, r0.id_bnco, r0.id_cnta_bnco, r0.fcha_cntrol) loop
        GENESYS.sitpr001('Procesando recaudo: '||r1.id_intrmdia||'-'||r1.clmna2||' ('||r1.clmna49||')- '||r1.clmna10||' ('||r1.clmna48||')', v_archvo_log);

        v_cntdor := v_cntdor + 1;

        if (v_cntdor-1)/1000 = trunc((v_cntdor-1)/1000) then
          v_txto := 'Se han procesado '||(v_cntdor-1)||' registros';

          -- escribir a log
          GENESYS.sitpr001(v_txto, v_archvo_cmmit);
        end if;

        v_id_sjto_impsto := r1.clmna48;
        v_id_orgen       := r1.clmna49;
        v_id_rcdo        := null;
        v_mnsje_rspsta   := 'Cargado';

        -- Estado
        v_cdgo_rcdo_estdo := 'AP';
        v_mnsje           := 'Aplicado';

        if r1.clmna6 <> 'S' then
          v_cdgo_rcdo_estdo := 'AN';
          v_mnsje           := 'Anulado';
        end if;

        -- forma de recaudo
        v_cdgo_frma_pgo := 'EF';

        if r1.clmna12 > 0 then
          v_cdgo_frma_pgo := 'EF';
        else
          if r1.clmna13 > 0 then
            v_cdgo_frma_pgo := 'TR';
          else
            if r1.clmna14 > 0 then
              v_cdgo_frma_pgo := 'CH';
            else
              if r1.clmna15>0 then
                v_cdgo_frma_pgo := 'CH';
              end if;
            end if;
          end if;
        end if;

        v_obsrvcion := 'Migrado: Archivo cargue'||r1.clmna9||', vigencia '||r1.clmna11;

        if r1.clmna16 > 0 then
          v_obsrvcion := '. Convenio: '||r1.clmna16||', cuotas '||r1.clmna17;
        end if;

        v_tpo_orgen := 'DL';

        --if r1.clmna50 in ('DAB','DNO','DCO') then
        --  v_tpo_orgen := 'DC';
        --end if;

        v_estdo_fnal := 'S';
        v_estdo_crge := 'S';

        begin
          insert into re_g_recaudos
                (id_rcdo_cntrol, id_sjto_impsto, cdgo_rcdo_orgn_tpo, id_orgen,
                 fcha_rcdo, fcha_ingrso_bnco,
                 vlor,
                 obsrvcion,
                 cdgo_frma_pgo,
                 cdgo_rcdo_estdo, fcha_apliccion, mnsje_rspsta,
                 id_usrio_aplco, id_sldo_fvor, id_cnvnio)
          values(v_id_rcdo_cntrol, v_id_sjto_impsto, v_tpo_orgen, v_id_orgen,
                 to_date(r1.clmna4,'dd/mm/yyyy'), to_date(r1.clmna5,'dd/mm/yyyy'),
                 r1.clmna3,
                 v_obsrvcion,
                 v_cdgo_frma_pgo,
                 v_cdgo_rcdo_estdo, to_date(r1.clmna4,'dd/mm/yyyy'), v_mnsje,
                 p_id_usrio, null, null)
          returning ID_RCDO
           into v_id_rcdo;
        exception
          when others then
            v_mnsje_rspsta := r1.id_intrmdia||' . No se pudo registrar recaudo: '||SQLCODE||'-'||SQLERRM;
            v_estdo_fnal   := 'L';
            v_estdo_crge   := 'N';
        end;

        begin
          update migra.MG_G_INTERMEDIA_PAGOICA m
             set m.clmna42           = v_id_rcdo_cntrol,
                 m.clmna43           = v_id_rcdo,
                 m.clmna44           = v_estdo_crge,
                 m.clmna45           = v_mnsje_rspsta,
                 m.cdgo_estdo_rgstro = v_estdo_fnal
           where m.id_intrmdia       = r1.id_intrmdia
             and m.cdgo_clnte        = p_cdgo_clnte
             and m.id_entdad         = p_id_entdad
             and m.cdgo_estdo_rgstro = 'L'
             and m.clmna47           = 'dK';
        end;

        v_crea_dtlle := true;

        if v_estdo_crge = 'S' then
          v_cnfrma_rcdos := true;
        end if;
      end loop;
    end if;

    if v_crea_dtlle then

      if v_cnfrma_rcdos then
        v_mnsje_rspsta := 'Confirmando creacion de control: '||v_id_rcdo_cntrol;
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);
      else

        v_mnsje_rspsta := 'Reversa creacion de control: '||v_id_rcdo_cntrol||' no cargo recaudos';
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);

        begin
          delete from re_g_recaudos_control gc where gc.id_rcdo_cntrol = v_id_rcdo_cntrol;
        end;
      end if;

      commit;
    else

      rollback;
      v_mnsje_rspsta := 'Rechazando creacion de control: '||v_id_rcdo_cntrol||' sin detalle';
      GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);
    end if;

  end loop;

  v_txto := 'Se procesaron '||v_cntdor||' registros ';
  GENESYS.sitpr001(v_txto, v_archvo_cmmit);


exception
  when others then
    v_mnsje_rspsta := '. No fue posible realizar la migracion de recaudos ICA (PRC_MIGRA_PAGOICA_P2).' ||sqlcode||'-'||sqlerrm;
    GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
end PRC_MIGRA_PAGOICA_P2;

/

