
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_DOCUMENTOS_013" (p_id_entdad         in  number,
                                                     p_id_usrio          in  number,
                                                     p_cdgo_clnte        in  number,
                                                     p_fcha_dsde         in varchar2,
                                                     p_fcha_hsta         in varchar2) is



cursor c1(r_cdgo_clnte number,
          r_id_entdad  number,
          r_fcha_dsde  varchar2,
          r_fcha_hsta  varchar2) is
   select t.*
     from migra.MG_G_INTERMEDIA_IPU_DOCUMENTO t
    where t.CDGO_CLNTE        = r_cdgo_clnte and
          t.ID_ENTDAD         = r_id_entdad and
          t.cdgo_estdo_rgstro = 'L' and
          t.clmna50           = 'OK' AND
          T.CLMNA49           is null AND
          to_date(t.clmna10,'DD/MM/YYYY') between
          to_date(r_fcha_dsde,'DD/MM/YYYY') and to_date(r_fcha_hsta,'DD/MM/YYYY')
   order by t.id_intrmdia;

v_id_entdad   number;
v_id_usrio    number;
v_cdgo_clnte  number;


v_id_impsto         df_c_impuestos.id_impsto%type;
v_id_impsto_sbmpsto df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;
--v_id_impsto_acto    df_i_impuestos_acto.id_impsto_acto%type;

v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;
v_id_cnvnio         re_g_documentos.id_cnvnio%type;
v_id_dcmnto         re_g_documentos.id_dcmnto%type;

v_txto              varchar2(4000);
v_cntdor            number;

v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);
v_archvo_error      varchar2(200);
v_fcha_hra          varchar2(50);
v_error             varchar2(2);
--v_cntdad            number;
--v_cnvnio            varchar2(1);

v_mnsje_error       varchar2(4000);
v_cdgo_error        varchar2(4000);
v_estdo_crgue       varchar2(1);

begin
  v_fcha_hra       := to_char(SYSDATE,'yyyymmdd_hh24miss');

  v_archvo_log     := 'PRC_MIGRA_DOCUMENTOS_013_LOG_'||v_fcha_hra||'.txt';
  v_archvo_cmmit   := 'PRC_MIGRA_DOCUMENTOS_013_COMMIT_'||v_fcha_hra||'.txt';
  v_archvo_error   := 'PRC_MIGRA_DOCUMENTOS_013_ERROR_'||v_fcha_hra||'.txt';

  v_txto := 'Iniciando proceso de registro de documentos faltantes';

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

  begin
     select a.cdgo_clnte
       into v_cdgo_clnte
       from df_s_clientes a
      where a.cdgo_clnte = p_cdgo_clnte;
  exception
     when no_data_found then
       v_txto := '. El cliente con codigo #' || p_cdgo_clnte || ', no existe en el sistema.';
       GENESYS.sitpr001(v_txto, v_archvo_log);
       return;
  end;

  v_id_entdad          := p_id_entdad;
  v_id_usrio           := p_id_usrio;

  begin
    select a.id_impsto , b.id_impsto_sbmpsto
      into v_id_impsto , v_id_impsto_sbmpsto
      from df_c_impuestos a
           join df_i_impuestos_subimpuesto b
                on a.id_impsto = b.id_impsto
     where a.cdgo_clnte          = p_cdgo_clnte
       and a.cdgo_impsto         = 'IPU'
       and b.cdgo_impsto_sbmpsto = 'IPU';
  exception
     when no_data_found then
       v_txto :='. El impuesto o subImpuesto, no existe en el sistema.';
       GENESYS.sitpr001(v_txto, v_archvo_log);
       return;
  end;

  v_cntdor := 0;

  for r1 in c1(v_cdgo_clnte,
               v_id_entdad,
               p_fcha_dsde,
               p_fcha_hsta) loop

    v_txto := 'Procesando: '||r1.id_intrmdia||'-('||r1.nmro_lnea||'), Doc: '||r1.clmna8||', Ref: '||r1.clmna7;
    GENESYS.sitpr001(v_txto, v_archvo_log);

    v_error          := 'DC'; -- documento cargado
    v_id_sjto_impsto := r1.clmna40;
    v_id_cnvnio      := null;
    v_cdgo_error     := null;
    v_mnsje_error    := null;
    v_estdo_crgue    := 'S';

    if r1.clmna41 = 'S' then
      -- Es cuota de convenio
      v_id_cnvnio := r1.clmna42;
    end if;

    begin
      insert into RE_G_DOCUMENTOS
            (cdgo_clnte, id_impsto, id_impsto_sbmpsto, id_sjto_impsto,
             nmro_dcmnto, cdgo_dcmnto_tpo,
             id_cnvnio, nmro_cta,
             fcha_dcmnto, fcha_vncmnto,
             vlor_ttal_dbe, vlor_ttal_hber, vlor_ttal, indcdor_pgo_aplcdo, vlor_ttal_dcmnto,
             id_dcmnto_lte, indcdor_entrno, drccion, cdgo_pstal)
      values(r1.cdgo_clnte, v_id_impsto, v_id_impsto_sbmpsto, v_id_sjto_impsto,

             r1.clmna8, r1.clmna9,
             v_id_cnvnio, null,

             TO_DATE(r1.clmna10,'DD/MM/YYYY'), TO_DATE(r1.clmna17,'DD/MM/YYYY'),
             r1.clmna12, r1.clmna13, r1.clmna14, r1.clmna11, r1.clmna15,
             null, r1.clmna16, null, null)
      returning ID_DCMNTO
           into v_id_dcmnto;
    exception
      when others then
        GENESYS.sitpr001(r1.id_intrmdia||'-'||r1.clmna7||'-'||r1.clmna8||' Error: '||sqlcode||'-'||sqlerrm, v_archvo_error);
        v_error       := 'ED';
        v_cdgo_error  := sqlcode;
        v_mnsje_error := 'Error: '||sqlcode||'-'||sqlerrm;
        v_id_dcmnto   := null;
        v_estdo_crgue := 'E';
    end;

    begin
      update migra.MG_G_INTERMEDIA_IPU_DOCUMENTO m
         set m.clmna43           = v_id_dcmnto,
             m.clmna47           = v_cdgo_error,
             m.clmna48           = v_mnsje_error,
             m.clmna49           = v_error,
             m.cdgo_estdo_rgstro = v_estdo_crgue
       where m.id_intrmdia       = r1.id_intrmdia;
         --and m.cdgo_clnte        = r1.cdgo_clnte
         --and m.id_entdad         = r1.id_entdad
         --AND m.clmna50           = 'OK';
    end;


    v_cntdor := v_cntdor + 1;

    if mod(v_cntdor,1000) = 0 then

      v_txto := 'Se han procesado '||v_cntdor||' registros';
      commit;

      -- escribir a log
      GENESYS.sitpr001(v_txto, v_archvo_cmmit);
    end if;
  end loop;

  commit;

  v_txto := 'Se procesaron '||v_cntdor||' registros ';
  GENESYS.sitpr001(v_txto, v_archvo_cmmit);

  v_txto := 'Finalizando proceso de registro de documentos faltantes';
  GENESYS.sitpr001(v_txto, v_archvo_log);

end PRC_MIGRA_DOCUMENTOS_013;

/

