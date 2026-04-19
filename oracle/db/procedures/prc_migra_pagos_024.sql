
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_PAGOS_024" as





cursor c1(r_cdgo_clnte  number,
          r_id_entdad   number
          ) is
  select t.id_intrmdia, t.id_entdad,t.cdgo_clnte,
         t.clmna2, t.clmna3, t.clmna4, t.clmna5, t.clmna6,
         t.clmna7, t.clmna8, t.clmna9, t.clmna10, t.clmna11,
         t.clmna12, t.clmna13, t.clmna14, t.clmna15, t.clmna16, t.clmna17,
         t.clmna18, t.clmna19, t.clmna20, t.clmna21,
         t.cdgo_estdo_rgstro
    from migra.mg_g_intermedia_recaudo_p2 t
   where t.CDGO_CLNTE        = r_cdgo_clnte and
         t.ID_ENTDAD         = r_id_entdad and
         t.cdgo_estdo_rgstro = 'L' and
         t.clmna47           is null
  order by t.id_intrmdia;





v_mnsje_rspsta      varchar2(4000);

v_id_entdad         number;
v_id_usrio          number;
v_cdgo_clnte        GENESYS.df_s_clientes.cdgo_clnte%type;
v_id_impsto         GENESYS.df_c_impuestos.id_impsto%type;
v_id_impsto_sbmpsto GENESYS.df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;


v_id_sjto_impsto    GENESYS.si_i_sujetos_impuesto.id_sjto_impsto%type;
v_id_orgen          GENESYS.re_g_recaudos.id_orgen%type;
v_id_cnvnio         GENESYS.re_g_recaudos.id_cnvnio%type;

v_txto              varchar2(4000);
v_cntdor            number;

v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);
v_archvo_error      varchar2(200);
v_fcha_hra          varchar2(50);

v_error             varchar2(2);

begin

  v_fcha_hra     := to_char(SYSDATE,'yyyymmdd_hh24miss');

  v_archvo_log   := 'PRC_MIGRA_PAGOS_024_LOG_'||v_fcha_hra||'.txt';
  v_archvo_cmmit := 'PRC_MIGRA_PAGOS_024_COMMIT_'||v_fcha_hra||'.txt';
  v_archvo_error := 'PRC_MIGRA_PAGOS_024_ERROR_'||v_fcha_hra||'.txt';

  v_cdgo_clnte         := 10;
  v_id_entdad          := 819;
  v_id_usrio           := 2;

  v_id_impsto          := 101;
  v_id_impsto_sbmpsto  := 1011;

  v_cntdor := 0;

  v_txto := 'Se inicia proceso de ajuste informacion de pagos-recuados PArte 2';

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

  for r1 in c1(v_cdgo_clnte, v_id_entdad) loop
    GENESYS.sitpr001('Procesando recaudo: '||r1.id_intrmdia||'-'||r1.clmna9||'-'||r1.clmna11||'-'||r1.clmna13, v_archvo_log);

    v_id_sjto_impsto := 0;
    v_id_orgen       := 0;
    v_id_cnvnio      := 0;
    v_error          := 'OK';

    --Verifica si Existe el Sujeto Impuesto
    begin
      select a.id_sjto_impsto
        into v_id_sjto_impsto
        from GENESYS.si_i_sujetos_impuesto a
       where exists(select 1
                      from GENESYS.si_c_sujetos b
                     where b.cdgo_clnte         = r1.cdgo_clnte
                       and b.idntfccion_antrior = r1.clmna9
                       and a.id_sjto            = b.id_sjto)
         and a.id_impsto = v_id_impsto;
    exception
      when no_data_found then
        v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El sujeto impuesto para: ' ||r1.clmna9|| ', no existe en el sistema.';
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);

        v_error        := 'SN';
      when too_many_rows then
        v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El sujeto impuesto para: ' ||r1.clmna9|| ', esta duplicado en el sistema.';
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);

        v_error        := 'SD';
      when others then
        v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El sujeto impuesto para: ' ||r1.clmna9|| ', presenta error: '||sqlcode||'-'||sqlerrm;
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);

        v_error        := 'SE';
    end;

    --Buscando origen de documento

    if v_error = 'OK' then

      begin
        select d.id_dcmnto, d.id_cnvnio
          into v_id_orgen, v_id_cnvnio
          from GENESYS.re_g_documentos d
         where d.nmro_dcmnto    = r1.clmna12 and
               d.id_sjto_impsto = v_id_sjto_impsto;
      exception
        when no_data_found then
          v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El origen para documento: ' ||r1.clmna12|| ', no existe en el sistema.';
          GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);

          v_error        := 'DN';
        when too_many_rows then
          v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El origen para documento: ' ||r1.clmna12|| ', no existe en el sistema.';
          GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);

          v_error        := 'DD';
        when others then
          v_mnsje_rspsta := r1.id_intrmdia||' Entidad 819. El origen para documento: ' ||r1.clmna12|| ', presenta error: '||sqlcode||'-'||sqlerrm;
          GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);

          v_error        := 'DE';
      end;
    end if;


    begin
      update migra.mg_g_intermedia_recaudo_p2 m
         set m.clmna46 = v_mnsje_rspsta,
             m.clmna47 = v_error,
             m.clmna48 = v_id_sjto_impsto,
             m.clmna49 = v_id_orgen,
             m.clmna50 = v_id_cnvnio
       where m.id_intrmdia       = r1.id_intrmdia
         and m.cdgo_clnte        = r1.cdgo_clnte
         and m.id_entdad         = r1.id_entdad
         and m.cdgo_estdo_rgstro = 'L'
         and m.clmna47           is null;
    end;

    v_cntdor := v_cntdor + 1;

    if (v_cntdor/1000) = trunc(v_cntdor/1000) then

      commit;

      v_txto := 'Se han procesado '||v_cntdor||' registros';
      GENESYS.sitpr001(v_txto, v_archvo_cmmit);
    end if;
  end loop;

  commit;

  v_txto := 'Se procesaron '||v_cntdor||' registros ';
  GENESYS.sitpr001(v_txto, v_archvo_cmmit);

  v_txto := 'Se termina proceso de ajuste 1 informacion de pagos-recuados ';
  GENESYS.sitpr001(v_txto, v_archvo_log);

end PRC_MIGRA_PAGOS_024;

/

