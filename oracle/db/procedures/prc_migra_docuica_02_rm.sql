
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_DOCUICA_02_RM" ( p_id_entdad         in  number
                                                    , p_id_usrio         in  number
                                                    , p_cdgo_clnte       in  number
                                                   ) as

    cursor c1(r_cdgo_clnte number,
              r_id_entdad  number) is
       select t.*
         from migra.mg_g_intermedia_docuica t
        where t.CDGO_CLNTE        = r_cdgo_clnte and
              t.ID_ENTDAD         = r_id_entdad and
              t.cdgo_estdo_rgstro = 'L' and
              t.clmna47           = 'OK'
       order by t.id_intrmdia;




v_mnsje_rspsta      varchar2(4000);

--v_cdgo_clnte        df_s_clientes.cdgo_clnte%type;
v_id_impsto         df_c_impuestos.id_impsto%type;
v_id_impsto_sbmpsto df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;
v_id_impsto_acto    df_i_impuestos_acto.id_impsto_acto%type;
v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;

v_id_dcmnto         re_g_documentos.id_dcmnto%type;

v_vlor_ttal_dbe     re_g_documentos.vlor_ttal_dbe%type;
v_vlor_ttal_hber    re_g_documentos.vlor_ttal_hber%type;

/*
v_cnvnio            boolean;
v_slio_dtlle        boolean;
v_sin_mvmnto        boolean;
v_sin_id_iac        boolean;
v_actlza_estdo      boolean;


v_id_cncpto         re_g_documentos_detalle.id_cncpto%type;
v_id_cncpto_int     re_g_documentos_detalle.id_cncpto%type;
v_id_prdo           df_i_periodos.id_prdo%type;
v_cdgo_cncpto_tpo   re_g_documentos_detalle.cdgo_cncpto_tpo%type;
v_id_mvmnto_dtlle   re_g_documentos_detalle.id_mvmnto_dtlle%type;
v_id_cnvnio         gf_g_convenios.id_cnvnio%type;

v_id_mvmnto_dt_cta  re_g_documentos_cnvnio_cta.id_mvmnto_dtlle%type;
v_id_cncpto_int_mra df_i_impuestos_acto_concepto.id_cncpto_intres_mra%type;
v_id_cncpto_int_fnc df_i_impuestos_acto_concepto.id_cncpto_intres_fnccion%type;
v_id_cncpto_int_vnc df_i_impuestos_acto_concepto.id_cncpto_intres_vncdo%type;

v_rlcion_ctas       varchar2(500);

v_vlor_cta          NUMBER(16,2);
v_vlor_cta_ttal     NUMBER(16,2);
v_vlor_vncdo        NUMBER(16,2);
v_vlor_vncdo_ttal   NUMBER(16,2);

v_vlor_vncdo_cta    NUMBER(16,2);
v_vlor_cptal_cta    NUMBER(16,2);
*/
v_cntdor            number;
v_txto              varchar(4000);
v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);
v_fcha_hra          varchar2(50);

--v_vlor_cncpto_cptal   RE_G_DOCUMENTOS_CNVNIO_CTA.VLOR_DBE%type;
--v_vlor_cncpto_intres  RE_G_DOCUMENTOS_CNVNIO_CTA.VLOR_DBE%type;
--v_vlor_cncpto_fnccion RE_G_DOCUMENTOS_CNVNIO_CTA.VLOR_DBE%type;

v_estdo_fnal        varchar2(1);
v_estdo_crge        varchar2(1);

begin

   v_fcha_hra     := to_char(SYSDATE,'yyyymmdd_hh24miss');

   v_archvo_log   := 'PRC_MIGRA_DOCUICA_02_RM_LOG_'||v_fcha_hra||'.txt';
   v_archvo_cmmit := 'PRC_MIGRA_DOCUICA_02_RM_COMMIT_'||v_fcha_hra||'.txt';
   v_cntdor       := 0;

   --v_cdgo_clnte        := p_cdgo_clnte;

   begin
     select d.id_impsto, d.id_impsto_sbmpsto, i.id_impsto_acto
       into v_id_impsto , v_id_impsto_sbmpsto, v_id_impsto_acto
     from (
           select a.id_impsto , b.id_impsto_sbmpsto
             from df_c_impuestos a
                  join df_i_impuestos_subimpuesto b
                       on a.id_impsto = b.id_impsto
            where a.cdgo_clnte          = p_cdgo_clnte
              and a.cdgo_impsto         = 'ICA'
              and b.cdgo_impsto_sbmpsto = 'ICA') d
           left join df_i_impuestos_acto i
                 on i.id_impsto = d.id_impsto and i.id_impsto_sbmpsto = d.id_impsto_sbmpsto
      where i.cdgo_impsto_acto='ICA';
   exception
     when no_data_found then
       v_mnsje_rspsta :='. El impuesto o subImpuesto o impuesto acto, no existe en el sistema.';
       GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);
       return;
     when too_many_rows then
       v_mnsje_rspsta :='. El impuesto o subImpuesto o impuesto acto, duplicado en su parametizaci¿n.';
       GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);
       return;
   end;

   -- escribir a log
   v_txto := 'Se inicia proceso de cargue de documentos ica PRC_MIGRA_DOCUICA_02_RM';

   GENESYS.sitpr001(v_txto, v_archvo_cmmit);

   for r1 in c1(p_cdgo_clnte, p_id_entdad) loop      --, p_fcha_dsde, p_fcha_hsta

     GENESYS.sitpr001('Procesando: '||r1.id_intrmdia||', Doc: '||r1.clmna1||'('||r1.nmro_lnea||'), ID: '||r1.clmna2||'-'||r1.clmna48, v_archvo_log);


     /**********************************************************/
     v_cntdor := v_cntdor + 1;

     if (v_cntdor-1)/1000 = trunc((v_cntdor-1)/1000) then
       v_txto := 'Se han procesado '||(v_cntdor-1)||' registros ';

       -- escribir a log
       GENESYS.sitpr001(v_txto, v_archvo_cmmit);
     end if;


     /**********************************************************/

     v_id_sjto_impsto := r1.clmna48;

     v_id_dcmnto      := null;
     v_estdo_fnal     := 'S';
     v_estdo_crge     := 'S';

     v_vlor_ttal_dbe  := nvl(r1.clmna7,0) + nvl(r1.clmna8,0) + nvl(r1.clmna15,0);
     v_vlor_ttal_hber := nvl(r1.clmna9,0) + nvl(r1.clmna10,0);


     begin
       insert into RE_G_DOCUMENTOS
             (cdgo_clnte, id_impsto, id_impsto_sbmpsto, id_sjto_impsto,
              nmro_dcmnto, cdgo_dcmnto_tpo,
              id_cnvnio, nmro_cta,
              fcha_dcmnto, fcha_vncmnto,
              vlor_ttal_dbe, vlor_ttal_hber, vlor_ttal,
              indcdor_pgo_aplcdo, vlor_ttal_dcmnto,
              id_dcmnto_lte, indcdor_entrno, drccion, cdgo_pstal)
       values(r1.cdgo_clnte, v_id_impsto, v_id_impsto_sbmpsto, v_id_sjto_impsto,
              r1.clmna1, 'DDM',
              null, null,
              TO_DATE(r1.clmna6,'DD/MM/YYYY'), TO_DATE(r1.clmna5,'DD/MM/YYYY'),
              v_vlor_ttal_dbe, v_vlor_ttal_hber, r1.clmna11,
              r1.clmna13, r1.clmna11,
              null, 'PBLCO', null, null)
       returning ID_DCMNTO
            into v_id_dcmnto;
     exception
       when others then
         v_mnsje_rspsta := 'No fue posible registrar el documento: '||sqlcode||'-'||sqlerrm;
         v_estdo_fnal   := 'L';
         v_estdo_crge   := 'N';
     end;


     -- Para cada liquidacion
     begin
          update migra.mg_g_intermedia_docuica m
             set m.clmna43           = v_id_dcmnto,
                 m.clmna44           = v_estdo_crge,
                 m.clmna45           = v_mnsje_rspsta,
                 m.cdgo_estdo_rgstro = v_estdo_fnal
           where m.id_intrmdia       = r1.id_intrmdia
             and m.cdgo_clnte        = p_cdgo_clnte
             and m.id_entdad         = p_id_entdad
             and m.cdgo_estdo_rgstro = 'L';
          commit;
     end;

     GENESYS.sitpr001('terminando de procesar: '||r1.id_intrmdia||', Doc: '||r1.clmna8||'('||r1.nmro_lnea||'), Ref: '||r1.clmna7, v_archvo_log);

   end loop;

   commit;
   v_txto := 'Se procesaron '||v_cntdor||' registros ';
   GENESYS.sitpr001(v_txto, v_archvo_cmmit);

exception
  when others then
    v_mnsje_rspsta := '. No fue posible realizar la migracion de documentos.' ||sqlcode||'-'||sqlerrm;
    GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);
end PRC_MIGRA_DOCUICA_02_RM;

/

