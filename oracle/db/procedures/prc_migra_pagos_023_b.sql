
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_PAGOS_023_B" as


cursor c0(r_cdgo_clnte number,
          r_id_entdad  number) is
  select b.*,
            (select c.id_bnco_cnta
               from DF_C_BANCOS_CUENTA c
              where c.id_bnco = b.id_bnco and
                    c.nmro_cnta = nvl(b.clmna5,'Cuenta No Definida')) id_bnco_cnta
    from (
          select a.*,
                 (select x.id_bnco
                    from DF_C_BANCOS x
                   where nvl(x.CDGO_BNCO,'null') = nvl(a.clmna4,'null')) id_bnco
            from (
                  select m.clmna4, m.clmna5, m.clmna6,
                         count(*) cntdad, sum(m.clmna14) ttal
                    from migra.mg_g_intermedia_recaudo m
                   where m.CDGO_CLNTE        = r_cdgo_clnte and
                         m.ID_ENTDAD         = r_id_entdad and
                         m.cdgo_estdo_rgstro = 'L' and
                         m.clmna47           = 'DN' and
                         m.clmna41           = 'DN'
                  group by m.clmna4, m.clmna5, m.clmna6) a
         ) b
  order by b.clmna4, b.clmna5, b.clmna6;


cursor c1(r_cdgo_clnte  number,
          r_id_entdad   number,
          r_cdgo_bnco   varchar2,
          r_nmro_cnta   varchar2,
          r_fcha_cntrol varchar2) is
  select t.id_intrmdia, t.id_entdad,t.cdgo_clnte,
         t.clmna2, t.clmna3, t.clmna4, t.clmna5, t.clmna6,
         t.clmna7, t.clmna8, t.clmna9, t.clmna10, t.clmna11,
         t.clmna12, t.clmna13, t.clmna14, t.clmna15, t.clmna16, t.clmna17,
         t.clmna18,
         t.clmna19, -- Documento pago externo
         t.clmna20, t.clmna21,
         t.cdgo_estdo_rgstro,
         t.clmna46, -- = v_mnsje_rspsta,
         t.clmna47, -- = v_error,
         t.clmna48, -- = v_id_sjto_impsto,
         t.clmna49, -- = v_id_orgen,
         t.clmna50 -- = v_id_cnvnio
    from migra.mg_g_intermedia_recaudo t
   where t.CDGO_CLNTE        = r_cdgo_clnte and
         t.ID_ENTDAD         = r_id_entdad and
         (t.clmna4           = r_cdgo_bnco or t.clmna4 is null)  and
         (t.clmna5           = r_nmro_cnta or t.clmna5 is null) and
         t.clmna6            = r_fcha_cntrol and
         t.cdgo_estdo_rgstro = 'L' and
         t.clmna47           = 'DN' and
         t.clmna41           = 'DN'
  order by t.id_intrmdia;



--Tipo para el Estandar de Error: Retirar tipos si se incluye el PRC en el pkg_mg_migracion






v_id_entdad         number;
v_id_usrio          number;
v_cdgo_clnte        df_s_clientes.cdgo_clnte%type;
v_id_impsto         df_c_impuestos.id_impsto%type;
v_id_impsto_sbmpsto df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;

v_crga_dtlle        boolean;
v_crea_dtlle        boolean;
--v_cnfrma_rcdos      boolean;

v_id_rcdo_cntrol    re_g_recaudos_control.id_rcdo_cntrol%type;
v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;
v_id_orgen          re_g_recaudos.id_orgen%type;
v_id_cnvnio         re_g_recaudos.id_cnvnio%type;

v_cdgo_rcdo_estdo   re_g_recaudos.cdgo_rcdo_estdo%type;
v_mnsje             re_g_recaudos.mnsje_rspsta%type;

v_mnsje_rspsta      varchar2(4000);


v_txto              varchar2(4000);
v_cntdor            number;

v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);
v_archvo_error      varchar2(200);
v_fcha_hra          varchar2(50);

--v_estdo_fnal        varchar2(1);
--v_estdo_crge        varchar2(1);

v_error             varchar2(2);

begin

  v_fcha_hra     := to_char(SYSDATE,'yyyymmdd_hh24miss');

  v_archvo_log   := 'prc_migra_pagos_023_B_LOG_'||v_fcha_hra||'.txt';
  v_archvo_cmmit := 'prc_migra_pagos_023_B_COMMIT_'||v_fcha_hra||'.txt';
  v_archvo_error := 'prc_migra_pagos_023_B_ERROR_'||v_fcha_hra||'.txt';


  v_txto := 'Iniciando proceso de cargue de pagos con documento no cargado por no coincidir';

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

  v_cdgo_clnte         := 10;
  v_id_entdad          := 819;
  v_id_usrio           := 2;

  v_id_impsto          := 101;
  v_id_impsto_sbmpsto  := 1011;

  v_cntdor := 0;


  for r0 in c0(v_cdgo_clnte, v_id_entdad) loop
    GENESYS.sitpr001('Procesando control: '||r0.clmna4||'-'||r0.clmna5||'-'||r0.clmna6||': '||r0.id_bnco||'-'||r0.id_bnco_cnta, v_archvo_log);

    v_crga_dtlle     := true;
    v_id_rcdo_cntrol := 0;

    begin
      insert into re_g_recaudos_control
            (cdgo_clnte, id_impsto, id_impsto_sbmpsto,
             id_bnco, id_bnco_cnta, fcha_cntrol, obsrvcion,
             cntdad_rcdos, vlor_rcdos,
             cdgo_rcdo_orgen, id_prcso_crga,
             id_usrio, fcha_rgstro)
      values(v_cdgo_clnte, v_id_impsto, v_id_impsto_sbmpsto,
             r0.id_bnco, r0.id_bnco_cnta, to_date(r0.clmna6,'dd/mm/yyyy hh24:mi:ss'), 'MIGRADO',
             r0.cntdad, r0.ttal,
             'AC', null,
             v_id_usrio, to_date(r0.clmna6,'dd/mm/yyyy hh24:mi:ss'))
      returning ID_RCDO_CNTROL
           into v_id_rcdo_cntrol;
    exception
      when others then
        v_crga_dtlle   := false;
        v_mnsje_rspsta := ' . No se pudo registrar control: '||r0.clmna4||'('||r0.id_bnco||'), '||r0.clmna5||'('||r0.id_bnco_cnta||'), '||r0.clmna6||': '||sqlcode||'-'||sqlerrm;
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
        continue;
    end;

    v_mnsje_rspsta := 'Control creado: '||v_id_rcdo_cntrol;
    GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);

    if v_crga_dtlle then

      v_crea_dtlle   := false;

      for r1 in c1(v_cdgo_clnte, v_id_entdad, r0.clmna4, r0.clmna5, r0.clmna6) loop
        GENESYS.sitpr001('Procesando recaudo: '||r1.id_intrmdia||'-'||r1.clmna9||'-'||r1.clmna11||'-'||r1.clmna13, v_archvo_log);

        v_id_sjto_impsto := r1.clmna48;
        v_id_orgen       := 0; --documento origen debe ser creado

        v_id_cnvnio      := null;

        v_cdgo_rcdo_estdo := 'AP';

        if r1.clmna17 <> 'AC' then
          v_cdgo_rcdo_estdo := 'AN';
        end if;

        v_error           := 'PC';

        begin
          insert into RE_G_DOCUMENTOS
                (cdgo_clnte, id_impsto, id_impsto_sbmpsto, id_sjto_impsto,
                 nmro_dcmnto, cdgo_dcmnto_tpo,
                 id_cnvnio, nmro_cta,
                 fcha_dcmnto, fcha_vncmnto,
                 vlor_ttal_dbe, vlor_ttal_hber, vlor_ttal, indcdor_pgo_aplcdo, vlor_ttal_dcmnto,
                 id_dcmnto_lte, indcdor_entrno, drccion, cdgo_pstal)
          values(r1.cdgo_clnte, v_id_impsto, v_id_impsto_sbmpsto, v_id_sjto_impsto,

                 r1.clmna12, 'DNO',
                 v_id_cnvnio, null,

                 to_date(r1.clmna13,'dd/mm/yyyy hh24:mi:ss'), to_date(r1.clmna13,'dd/mm/yyyy hh24:mi:ss'),
                 r1.clmna14, 0, r1.clmna14, 'S', r1.clmna14,
                 null, 'PRVDO', null, null)
          returning ID_DCMNTO
               into v_id_orgen;
        exception
          when others then
            v_mnsje_rspsta := r1.id_intrmdia||' . No se pudo registrar documento: '||SQLCODE||'-'||SQLERRM;
            GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);

            v_error     := 'DE';
            v_id_orgen := null;
        end;

        if v_error = 'PC' then

          begin
            insert into re_g_recaudos
                  (id_rcdo_cntrol, id_sjto_impsto, cdgo_rcdo_orgn_tpo,

                   id_orgen, -- Documento origen no existe

                   fcha_rcdo, fcha_ingrso_bnco,
                   vlor, obsrvcion,
                   cdgo_frma_pgo, cdgo_rcdo_estdo, fcha_apliccion, mnsje_rspsta,
                   id_usrio_aplco, id_sldo_fvor, id_cnvnio)
            values(v_id_rcdo_cntrol, v_id_sjto_impsto, r1.clmna11,

                   v_id_orgen,

                   to_date(r1.clmna13,'dd/mm/yyyy hh24:mi:ss'), to_date(r1.clmna6,'dd/mm/yyyy hh24:mi:ss'),
                   r1.clmna14, 'Migrado usuario: '||r1.clmna21||', Documento externo '||r1.clmna19||', con documento -',
                   r1.clmna16, v_cdgo_rcdo_estdo, to_date(r1.clmna18,'dd/mm/yyyy hh24:mi:ss'), v_mnsje,
                   v_id_usrio, null, v_id_cnvnio);
          exception
            when others then
              v_error        := 'PE';
              v_mnsje_rspsta := r1.id_intrmdia||' . No se pudo registrar recaudo: '||SQLCODE||'-'||SQLERRM;
              GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
          end;
        end if;

        begin
          update migra.mg_g_intermedia_recaudo m
             set m.clmna49           = v_id_orgen,
                 m.clmna40           = v_error
           where m.id_intrmdia       = r1.id_intrmdia
             and m.cdgo_clnte        = r1.cdgo_clnte
             and m.id_entdad         = r1.id_entdad
             and m.cdgo_estdo_rgstro = 'L'
             and m.clmna47           = 'DN'
             and m.clmna41           = 'DN';
        end;

        v_cntdor := v_cntdor + 1;

        if (v_cntdor)/1000 = trunc(v_cntdor/1000) then
          commit;

          v_txto := 'Se han procesado '||v_cntdor||' registros';
          GENESYS.sitpr001(v_txto, v_archvo_cmmit);
        end if;
      end loop;

    end if;
  end loop;

  commit;

  v_txto := 'Se procesaron '||v_cntdor||' registros ';
  GENESYS.sitpr001(v_txto, v_archvo_cmmit);

end PRC_MIGRA_PAGOS_023_B;

/

