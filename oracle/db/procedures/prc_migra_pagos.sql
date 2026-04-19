
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_PAGOS" ( p_id_entdad         in  number
                                           , p_id_usrio          in  number
                                           , p_cdgo_clnte        in  number) as


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
                         m.clmna12           <> '-' and
                         m.cdgo_estdo_rgstro = 'L'
                         --and m.clmna4='-' and m.clmna5='-' and m.clmna6='05/05/2015 00:00:00'
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
         t.clmna18, t.clmna19, t.clmna20, t.clmna21,
         t.cdgo_estdo_rgstro
    from migra.mg_g_intermedia_recaudo t
   where t.CDGO_CLNTE        = r_cdgo_clnte and
         t.ID_ENTDAD         = r_id_entdad and
         t.clmna4            = r_cdgo_bnco and
         t.clmna5            = r_nmro_cnta and
         t.clmna6            = r_fcha_cntrol and
         t.clmna12           <> '-' and
         t.cdgo_estdo_rgstro = 'L'

  order by t.id_intrmdia;



--Tipo para el Estandar de Error: Retirar tipos si se incluye el PRC en el pkg_mg_migracion

v_mnsje_rspsta      varchar2(4000);


v_cdgo_clnte        df_s_clientes.cdgo_clnte%type;
v_id_impsto         df_c_impuestos.id_impsto%type;
v_id_impsto_sbmpsto df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;

v_crga_dtlle        boolean;
v_crea_dtlle        boolean;

v_id_rcdo_cntrol    re_g_recaudos_control.id_rcdo_cntrol%type;
v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;
v_id_orgen          re_g_recaudos.id_orgen%type;
v_id_cnvnio         re_g_recaudos.id_cnvnio%type;

v_cdgo_rcdo_estdo   re_g_recaudos.cdgo_rcdo_estdo%type;
v_mnsje             re_g_recaudos.mnsje_rspsta%type;

v_txto              varchar2(4000);
v_cntdor            number;

v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);
v_archvo_error      varchar2(200);
v_fcha_hra          varchar2(50);

begin

  v_fcha_hra     := to_char(SYSDATE,'yyyymmdd_hh24miss');

  v_archvo_log   := 'prc_migra_pagos_LOG_'||v_fcha_hra||'.txt';
  v_archvo_cmmit := 'prc_migra_pagos_COMMIT_'||v_fcha_hra||'.txt';
  v_archvo_error := 'prc_migra_pagos_ERROR_'||v_fcha_hra||'.txt';
  v_cntdor       := 0;


  begin
    select a.cdgo_clnte
      into v_cdgo_clnte
      from df_s_clientes a
     where a.cdgo_clnte = p_cdgo_clnte;
  exception
    when no_data_found then
      v_mnsje_rspsta := '. El cliente con codigo #' || p_cdgo_clnte || ', no existe en el sistema.';
      GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
      return;
  end;

  begin
    select a.id_impsto
         , b.id_impsto_sbmpsto
      into v_id_impsto
         , v_id_impsto_sbmpsto
      from df_c_impuestos a
      join df_i_impuestos_subimpuesto b
           on a.id_impsto = b.id_impsto
     where a.cdgo_clnte          = p_cdgo_clnte
       and a.cdgo_impsto         = 'IPU'
       and b.cdgo_impsto_sbmpsto = 'IPU';
  exception
    when no_data_found then
      v_mnsje_rspsta := ' El impuesto o subImpuesto, no existe en el sistema.';
      GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
      return;
  end;

  GENESYS.sitpr001('Iniciando proceso de revision de pagos con documento -', v_archvo_log);

  begin
    update migra.mg_g_intermedia_recaudo m
       set m.cdgo_estdo_rgstro = 'E'
     where m.CDGO_CLNTE        = p_cdgo_clnte and
           m.ID_ENTDAD         = p_id_entdad and
           m.clmna12           = '-' and
           m.cdgo_estdo_rgstro = 'L';
    if sql%notfound then
      GENESYS.sitpr001('No hay pagos con numero docuemnto - ,para anular su aplicacion', v_archvo_log);
    else
      GENESYS.sitpr001('Actualizaci¿¿¿n estado de migra para pagos con documento -', v_archvo_log);
    end if;
  end;

  commit;



  v_cntdor := 0;

  v_txto := 'Se inicia proceso de cargue de pagos-recuados ';

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

  for r0 in c0(p_cdgo_clnte, p_id_entdad) loop
    GENESYS.sitpr001('Procesando control: '||r0.clmna4||'-'||r0.clmna5||'-'||r0.clmna6||': '||r0.id_bnco||'-'||r0.id_bnco_cnta, v_archvo_log);

    v_crga_dtlle := true;

    begin
      insert into re_g_recaudos_control
            (cdgo_clnte, id_impsto, id_impsto_sbmpsto,
             id_bnco, id_bnco_cnta, fcha_cntrol, obsrvcion,
             cntdad_rcdos, vlor_rcdos,
             cdgo_rcdo_orgen, id_prcso_crga,
             id_usrio, fcha_rgstro)
      values(p_cdgo_clnte, v_id_impsto, v_id_impsto_sbmpsto,
             r0.id_bnco, r0.id_bnco_cnta, to_date(r0.clmna6,'dd/mm/yyyy hh24:mi:ss'), 'MIGRADO',
             r0.cntdad, r0.ttal,
             'AC', null,
             p_id_usrio, to_date(r0.clmna6,'dd/mm/yyyy hh24:mi:ss'))
      returning ID_RCDO_CNTROL
           into v_id_rcdo_cntrol;
    exception
      when others then
        v_crga_dtlle := false;
        v_mnsje_rspsta := ' . No se pudo registrar control: '||r0.clmna4||'('||r0.id_bnco||'), '||r0.clmna5||'('||r0.id_bnco_cnta||'), '||r0.clmna6||': '||sqlcode||'-'||sqlerrm;
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
        --rollback;
        continue;
    end;

    v_mnsje_rspsta := 'Control creado: '||v_id_rcdo_cntrol;
    GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);

    if v_crga_dtlle then
      -- commit para el control de pagos??
      --commit;
      v_crea_dtlle := false;


      for r1 in c1(p_cdgo_clnte, p_id_entdad, r0.clmna4, r0.clmna5, r0.clmna6) loop
        GENESYS.sitpr001('Procesando recaudo: '||r1.id_intrmdia||'-'||r1.clmna9||'-'||r1.clmna11||'-'||r1.clmna13, v_archvo_log);

        v_cntdor := v_cntdor + 1;

        if (v_cntdor-1)/1000 = trunc((v_cntdor-1)/1000) then
          v_txto := 'Se han procesado '||(v_cntdor-1)||' registros';

          -- escribir a log
          GENESYS.sitpr001(v_txto, v_archvo_cmmit);
        end if;

        v_id_sjto_impsto := 0;
        v_id_orgen       := 0;
        v_id_cnvnio      := 0;

        --Verifica si Existe el Sujeto Impuesto
        begin
          select a.id_sjto_impsto
            into v_id_sjto_impsto
            from si_i_sujetos_impuesto a
           where exists(select 1
                          from si_c_sujetos b
                         where b.cdgo_clnte         = r1.cdgo_clnte
                           and b.idntfccion_antrior = r1.clmna9
                           and a.id_sjto            = b.id_sjto)
             and a.id_impsto = v_id_impsto;
        exception
          when no_data_found then
            v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El sujeto impuesto para: ' ||r1.clmna9|| ', no existe en el sistema.';
            GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
            continue;
          when too_many_rows then
            v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El sujeto impuesto para: ' ||r1.clmna9|| ', esta duplicado en el sistema.';
            GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
            continue;
          when others then
            v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El sujeto impuesto para: ' ||r1.clmna9|| ', presenta error: '||sqlcode||'-'||sqlerrm;
            GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
            continue;
        end;

        -- Buscando origen de documento

        begin
          select d.id_dcmnto, d.id_cnvnio
            into v_id_orgen, v_id_cnvnio
            from re_g_documentos d
           where d.nmro_dcmnto    = r1.clmna12 and
                 d.id_sjto_impsto = v_id_sjto_impsto;
        exception
          when no_data_found then
            v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El origen para documento: ' ||r1.clmna12|| ', no existe en el sistema.';
            GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
            continue;
          when too_many_rows then
            v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El origen para documento: ' ||r1.clmna12|| ', no existe en el sistema.';
            GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
            continue;
          when others then
            v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El origen para documento: ' ||r1.clmna12|| ', presenta error: '||sqlcode||'-'||sqlerrm;
            GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
            continue;
        end;

        v_cdgo_rcdo_estdo := 'AP';
        v_mnsje           := 'Aplicado';

        if r1.clmna17 <> 'AC' then
          v_cdgo_rcdo_estdo := 'AN';
          v_mnsje           := 'Anulado';
        end if;


        begin
          insert into re_g_recaudos
                (id_rcdo_cntrol, id_sjto_impsto, cdgo_rcdo_orgn_tpo, id_orgen,
                 fcha_rcdo, fcha_ingrso_bnco,
                 vlor, obsrvcion,
                 cdgo_frma_pgo, cdgo_rcdo_estdo, fcha_apliccion, mnsje_rspsta,
                 id_usrio_aplco, id_sldo_fvor, id_cnvnio)
          values(v_id_rcdo_cntrol, v_id_sjto_impsto, r1.clmna11, v_id_orgen,
                 to_date(r1.clmna13,'dd/mm/yyyy hh24:mi:ss'), to_date(r1.clmna6,'dd/mm/yyyy hh24:mi:ss'),
                 r1.clmna14, 'Migrado usuario: '||r1.clmna21||', Documento externo '||r1.clmna19,
                 r1.clmna16, v_cdgo_rcdo_estdo, to_date(r1.clmna18,'dd/mm/yyyy hh24:mi:ss'), v_mnsje,
                 p_id_usrio, 0, v_id_cnvnio);
        exception
          when others then
          v_mnsje_rspsta := r1.id_intrmdia||' . No se pudo registrar recaudo: '||r1.clmna12||'-'||r1.clmna9||'-'||r1.clmna6;
          GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
          --rollback;
          continue;
        end;

        --commit;

        begin
          update migra.mg_g_intermedia_documentos m
             set m.cdgo_estdo_rgstro = 'S'
           where m.id_intrmdia       = r1.id_intrmdia
             and m.cdgo_clnte        = p_cdgo_clnte
             and m.id_entdad         = p_id_entdad
             and m.cdgo_estdo_rgstro = 'L';
        end;

        commit;

        v_crea_dtlle := true;
      end loop;
    end if;

    if v_crea_dtlle then
      commit;
      v_mnsje_rspsta := 'Confirmando creacion de control: '||v_id_rcdo_cntrol;
      GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);
    else

      rollback;
      v_mnsje_rspsta := 'Rechazando creacion de control: '||v_id_rcdo_cntrol;
      GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);
    end if;

  end loop;

  v_txto := 'Se procesaron '||v_cntdor||' registros ';
  GENESYS.sitpr001(v_txto, v_archvo_cmmit);



exception
  when others then
    v_mnsje_rspsta := '. No fue posible realizar la migracion de recaudos (pagos).' ||sqlcode||'-'||sqlerrm;
    GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
end PRC_MIGRA_PAGOS;

/

