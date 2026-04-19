
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_DOCUMENTOS_DD_016" (p_id_entdad  in number,
                                                        p_cdgo_clnte in number,
                                                        p_fcha_dsde  in varchar2,
                                                        p_fcha_hsta  in varchar2) is



cursor c1(r_cdgo_clnte number,
          r_id_entdad  number,
          r_fcha_dsde  varchar2,
          r_fcha_hsta  varchar2) is
   select t.*
     from migra.MG_G_INTERMEDIA_IPU_DOCUMENTO t
    where t.CDGO_CLNTE        = r_cdgo_clnte and
          t.ID_ENTDAD         = r_id_entdad and
          t.cdgo_estdo_rgstro = 'S' and
          t.clmna50           = 'OK' and
          t.clmna49           = 'DC' and
          t.clmna9             <> 'DCO'           -- Documentos normales: DAB/DMA/DNO
      and to_date(t.clmna10, 'DD/MM/YYYY') between
           to_date(r_fcha_dsde, 'DD/MM/YYYY') and
           to_date(r_fcha_hsta, 'DD/MM/YYYY')

           --ojo prueba
           --and t.id_intrmdia   = 368536327

   order by t.id_intrmdia;


cursor c2(r_cdgo_clnte        number,
          r_id_entdad         number,
          r_nmro_dcmnto       varchar2,
          r_fcha_lmte         varchar2) is
   select t.*
     from migra.MG_G_INTERMEDIA_IPU_DOCUMENTO t
    where t.CDGO_CLNTE        = r_cdgo_clnte and
          t.ID_ENTDAD         = r_id_entdad and
          t.clmna2            = r_nmro_dcmnto and
          t.clmna9            = r_fcha_lmte and
          t.cdgo_estdo_rgstro = 'L' and
          t.clmna30           = 'OK'
   order by t.clmna3, t.clmna5;


v_id_entdad   number;
--v_id_usrio    number;
v_cdgo_clnte  number;




v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;
v_id_cnvnio         re_g_documentos.id_cnvnio%type;
v_id_dcmnto         re_g_documentos.id_dcmnto%type;

v_id_cncpto         re_g_documentos_detalle.id_cncpto%type;

v_id_prdo           df_i_periodos.id_prdo%type;
v_cdgo_cncpto_tpo   re_g_documentos_detalle.cdgo_cncpto_tpo%type;
v_id_mvmnto_dtlle   re_g_documentos_detalle.id_mvmnto_dtlle%type;

--v_sin_mvmnto        boolean;

v_mnsje_rspsta      varchar2(4000);
v_txto              varchar2(4000);
v_cntdor            number;

v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);
v_archvo_error      varchar2(200);
v_fcha_hra          varchar2(50);
v_error             varchar2(2);
v_estdo             varchar2(1);

--v_cntdad            number;
--v_cnvnio            varchar2(1);

begin
  v_fcha_hra       := to_char(SYSDATE,'yyyymmdd_hh24miss');

  v_archvo_log     := 'PRC_MIGRA_DOCUMENTOS_DD_016_LOG_'||v_fcha_hra||'.txt';
  v_archvo_cmmit   := 'PRC_MIGRA_DOCUMENTOS_DD_016_COMMIT_'||v_fcha_hra||'.txt';
  v_archvo_error   := 'PRC_MIGRA_DOCUMENTOS_DD_016_ERROR_'||v_fcha_hra||'.txt';

  v_txto := 'Iniciando proceso de registro de detalle documentos parte 2';

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

  v_cdgo_clnte         := null;

  begin
    select a.cdgo_clnte
      into v_cdgo_clnte
      from df_s_clientes a
     where a.cdgo_clnte = p_cdgo_clnte;
  exception
    when no_data_found then
      v_txto := '. El cliente con codigo #' || p_cdgo_clnte ||', no existe en el sistema.';
      GENESYS.sitpr001(v_txto, v_archvo_log);
      return;
  end;

  v_id_entdad          := p_id_entdad;
  --v_id_usrio           := 2;


  v_cntdor             := 0;

  for r1 in c1(v_cdgo_clnte, v_id_entdad, p_fcha_dsde, p_fcha_hsta) loop

    v_txto := 'Procesando documentos (818): '||r1.id_intrmdia||'-('||r1.nmro_lnea||'), Doc: '||r1.clmna8||', Ref: '||r1.clmna7||'-'||r1.clmna43;
    GENESYS.sitpr001(v_txto, v_archvo_log);

    v_id_sjto_impsto := r1.clmna40;
    v_id_dcmnto      := r1.clmna43;
    v_id_cnvnio      := r1.clmna42;

    for r2 in c2(r1.cdgo_clnte, 817, r1.clmna8, r1.clmna17) loop

      v_mnsje_rspsta := 'Procesando detalle (817): '||r2.id_intrmdia || '-'||r2.clmna3||'-'||r2.clmna4||'-'||r2.clmna5;
      GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);

      v_error            := 'OK';

      v_id_cncpto        := r2.CLMNA32;
      v_id_prdo          := r2.CLMNA31;
      v_id_mvmnto_dtlle  := r2.CLMNA34;
      v_cdgo_cncpto_tpo  := r2.clmna33;
      v_estdo            := 'S';

      begin
        insert into RE_G_DOCUMENTOS_DETALLE
              (id_dcmnto, id_mvmnto_dtlle, id_cncpto,
               vlor_dbe, vlor_hber, bse_grvble, trfa, txto_trfa,
               cdgo_cncpto_tpo, id_dscnto_rgla, id_cncpto_rlcnal, prcntje_dscnto)
        values(v_id_dcmnto, v_id_mvmnto_dtlle, v_id_cncpto,
               r2.clmna6, 0, 0, 0, 0,
               v_cdgo_cncpto_tpo, null, null, null);
      exception
        when others then
          v_mnsje_rspsta := r1.id_intrmdia||'-'||r2.id_intrmdia||', concepto: '||r2.clmna3||'-'||r2.clmna4||'-'||r2.clmna5||', error: '||sqlerrm;
          GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
          v_error := 'CE';
          v_estdo := 'L';
      end;

      begin
        update migra.MG_G_INTERMEDIA_IPU_DOCUMENTO r
           set r.clmna35           = v_error,
               r.clmna36           = v_id_dcmnto,
               r.cdgo_estdo_rgstro = v_estdo
         where r.id_intrmdia       = r2.id_intrmdia;
           --and r.cdgo_clnte        = r2.cdgo_clnte
           --and r.id_entdad         = r2.id_entdad;
      end;

      v_cntdor := v_cntdor + 1;

      if (v_cntdor/1000) = trunc(v_cntdor/1000) then

        v_txto := 'Se han procesado '||v_cntdor||' registros';
        commit;

        -- escribir a log
        GENESYS.sitpr001(v_txto, v_archvo_cmmit);
      end if;

    end loop;

  end loop;

  commit;

  v_txto := 'Se procesaron '||v_cntdor||' registros ';
  GENESYS.sitpr001(v_txto, v_archvo_cmmit);

  v_txto := 'Finalizando proceso de registro de documentos de detalle faltantes';
  GENESYS.sitpr001(v_txto, v_archvo_log);

end PRC_MIGRA_DOCUMENTOS_DD_016;

/

