
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_DOCUMENTOS_DD_REVCO" is



cursor c1(r_cdgo_clnte number,
          r_id_entdad  number) is
   select t.*
     from migra.mg_g_intermedia_documentos_p2 t
    where t.CDGO_CLNTE        = r_cdgo_clnte and
          t.ID_ENTDAD         = r_id_entdad and
          t.cdgo_estdo_rgstro = 'L' and
          t.clmna50           = 'OK' and
          t.clmna49           = 'DC' and
          t.clmna9            = 'DCO'           -- Documentos convenio
   order by t.id_intrmdia;

/*
cursor c2(r_cdgo_clnte number,
          r_id_entdad  number,
          r_nmro_linea number) is
   select t.*
     from migra.mg_g_intermedia_documentos_p2 t
    where t.CDGO_CLNTE        = r_cdgo_clnte and
          t.ID_ENTDAD         = r_id_entdad and
          t.nmro_lnea         = r_nmro_linea and
          t.cdgo_estdo_rgstro = 'L'
   order by t.clmna3, t.clmna5;
*/


v_id_entdad   number;
v_id_usrio    number;
v_cdgo_clnte  number;


v_id_impsto         df_c_impuestos.id_impsto%type;
v_id_impsto_sbmpsto df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;
v_id_impsto_acto    df_i_impuestos_acto.id_impsto_acto%type;

v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;
v_id_cnvnio         re_g_documentos.id_cnvnio%type;
v_id_dcmnto         re_g_documentos.id_dcmnto%type;

v_id_cncpto         re_g_documentos_detalle.id_cncpto%type;
v_id_cncpto_int     re_g_documentos_detalle.id_cncpto%type;
v_id_prdo           df_i_periodos.id_prdo%type;
v_cdgo_cncpto_tpo   re_g_documentos_detalle.cdgo_cncpto_tpo%type;
v_id_mvmnto_dtlle   re_g_documentos_detalle.id_mvmnto_dtlle%type;

v_sin_mvmnto        boolean;

v_mnsje_rspsta      varchar2(4000);
v_txto              varchar2(4000);
v_cntdor            number;

v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);
v_archvo_error      varchar2(200);
v_fcha_hra          varchar2(50);
v_error             varchar2(2);

--v_cntdad            number;
--v_cnvnio            varchar2(1);

begin
  v_fcha_hra       := to_char(SYSDATE,'yyyymmdd_hh24miss');

  v_archvo_log     := 'PRC_MIGRA_DOCUMENTOS_DD_REVCO_LOG_'||v_fcha_hra||'.txt';
  v_archvo_cmmit   := 'PRC_MIGRA_DOCUMENTOS_DD_REVCO_COMMIT_'||v_fcha_hra||'.txt';
  v_archvo_error   := 'PRC_MIGRA_DOCUMENTOS_DD_REVCO_ERROR_'||v_fcha_hra||'.txt';

  v_txto := 'Iniciando proceso de registro de detalle documentos parte 2';

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

  v_cdgo_clnte         := 10;
  v_id_entdad          := 818;
  v_id_usrio           := 2;

  v_id_impsto          := 101;
  v_id_impsto_sbmpsto  := 1011;
  v_id_impsto_acto     := 5;

  v_cntdor             := 0;

  for r1 in c1(v_cdgo_clnte,
               v_id_entdad) loop

    v_txto := 'Procesando documentos (818): '||r1.id_intrmdia||'-('||r1.nmro_lnea||'), id. doc: '||r1.clmna43||', id. cnv: '||r1.clmna42;
    GENESYS.sitpr001(v_txto, v_archvo_log);

    v_id_dcmnto      := r1.clmna43;
    v_id_cnvnio      := r1.clmna42;

    -- Borrando detalla de documento
    v_txto := 'Borrando detalle de documento';
    GENESYS.sitpr001(v_txto, v_archvo_log);

    begin
      delete from re_g_documentos_detalle dd
       where dd.id_dcmnto = v_id_dcmnto
         and not exists (select 'x'
                           from RE_G_DOCUMENTOS_CNVNIO_CTA c
                          where c.id_dcmnto       = dd.id_dcmnto
                            and c.id_cnvnio       = v_id_cnvnio
                            and c.id_mvmnto_dtlle = dd.id_mvmnto_dtlle
                            and c.id_cncpto       = dd.id_cncpto);
    end;

    -- Borrando detalle de cuota de conveni
    v_txto := 'Borrando detallado de cuota de documento';
    GENESYS.sitpr001(v_txto, v_archvo_log);

    begin
      delete from RE_G_DOCUMENTOS_CNVNIO_CTA c
       where c.id_dcmnto = v_id_dcmnto
        and c.id_cnvnio  = v_id_cnvnio;
    end;

    v_cntdor := v_cntdor + 1;

    if (v_cntdor/1000) = trunc(v_cntdor/1000) then

      v_txto := 'Se han procesado '||v_cntdor||' registros';
      commit;

      -- escribir a log
      GENESYS.sitpr001(v_txto, v_archvo_cmmit);
    end if;
  end loop;

  commit;

  v_txto := 'Se procesaron '||v_cntdor||' registros ';
  GENESYS.sitpr001(v_txto, v_archvo_cmmit);

  v_txto := 'Finalizando proceso de registro de documentos de detalle faltantes';
  GENESYS.sitpr001(v_txto, v_archvo_log);

end PRC_MIGRA_DOCUMENTOS_DD_REVCO;
/

