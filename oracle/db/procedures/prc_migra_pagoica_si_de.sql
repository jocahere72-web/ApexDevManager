
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_PAGOICA_SI_DE" (p_id_entdad         in  number,
                                                    p_cdgo_clnte        in  number) as





cursor c1(r_cdgo_clnte  number,
          r_id_entdad   number
          ) is
  select t.*
    from migra.mg_g_intermedia_pagoica t
   where t.CDGO_CLNTE        = r_cdgo_clnte
     and t.ID_ENTDAD         = r_id_entdad
     and t.clmna47           = 'DN'
     and t.cdgo_estdo_rgstro = 'L'
     and t.clmna48           is not null
  order by t.id_intrmdia;





v_mnsje_rspsta      varchar2(4000);


v_id_impsto         GENESYS.df_c_impuestos.id_impsto%type;
v_id_impsto_sbmpsto GENESYS.df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;

--v_id_impsto         number;
--v_id_impsto_sbmpsto number;

v_id_sjto_impsto    GENESYS.si_i_sujetos_impuesto.id_sjto_impsto%type;
v_id_orgen          GENESYS.re_g_recaudos.id_orgen%type;
v_cdgo_dcmnto_tpo   GENESYS.re_g_documentos.cdgo_dcmnto_tpo%type;

--v_id_cnvnio         GENESYS.re_g_recaudos.id_cnvnio%type;

v_txto              varchar2(4000);
v_cntdor            number;

v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);

v_fcha_hra          varchar2(50);

v_error             varchar2(2);

begin

  v_fcha_hra     := to_char(SYSDATE,'yyyymmdd_hh24miss');

  v_archvo_log   := 'PRC_MIGRA_PAGOICA_SI_DE_LOG_'||v_fcha_hra||'.txt';
  v_archvo_cmmit := 'PRC_MIGRA_PAGOICA_SI_DE_COMMIT_'||v_fcha_hra||'.txt';

  v_cntdor       := 0;

  v_id_impsto          := 102;
  v_id_impsto_sbmpsto  := 1022;


  v_cntdor := 0;

  v_txto := 'Se inicia proceso de ajuste 1 informacion de documentos: PRC_MIGRA_PAGOICA_SI_DE';

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

      for r1 in c1(p_cdgo_clnte, p_id_entdad) loop
        GENESYS.sitpr001('Procesando recaudo: '||r1.id_intrmdia||'-'||r1.clmna9||'-'||r1.clmna11||'-'||r1.clmna13, v_archvo_log);

        v_id_sjto_impsto  := r1.clmna48;
        v_id_orgen        := 0;
        v_cdgo_dcmnto_tpo := 'DEC';
        v_error           := 'dK';
        v_mnsje_rspsta    :=  NULL;


        begin
            select d.id_dclrcion
              into v_id_orgen
              from GENESYS.gi_g_declaraciones d
             where d.id_impsto         = v_id_impsto
               and d.id_impsto_sbmpsto = v_id_impsto_sbmpsto
               and d.id_sjto_impsto    = v_id_sjto_impsto
               and d.nmro_cnsctvo      = r1.clmna2;
        exception
            when no_data_found then
              v_mnsje_rspsta := r1.id_intrmdia||' Entidad '||r1.ID_ENTDAD||'. El origen para declaracion: ' ||r1.clmna12|| ', no existe en el sistema.';
              v_error        := 'dN';
            when too_many_rows then
              v_mnsje_rspsta := r1.id_intrmdia||' Entidad '||r1.ID_ENTDAD||'. El origen para declaracion: ' ||r1.clmna12|| ', no existe en el sistema.';
              v_error        := 'dd';
            when others then
              v_mnsje_rspsta := r1.id_intrmdia||' Entidad '||r1.ID_ENTDAD||'. El origen para declaracion: ' ||r1.clmna12|| ', presenta error: '||sqlcode||'-'||sqlerrm;
              v_error        := 'dX';
        end;


        if v_error = 'dK' then
          begin
            update migra.mg_g_intermedia_pagoica m
               set m.clmna46 = v_mnsje_rspsta,
                   m.clmna47 = v_error,
                   m.clmna49 = v_id_orgen,
                   m.clmna50 = v_cdgo_dcmnto_tpo
             where m.id_intrmdia       = r1.id_intrmdia
               and m.cdgo_clnte        = p_cdgo_clnte
               and m.id_entdad         = p_id_entdad
               and m.cdgo_estdo_rgstro = 'L';
          end;
        end if;

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

  v_txto := 'Se termina proceso de ajuste 1 informacion documentos: PRC_MIGRA_PAGOICA_SI_DE';
  GENESYS.sitpr001(v_txto, v_archvo_log);

end PRC_MIGRA_PAGOICA_SI_DE;

/

