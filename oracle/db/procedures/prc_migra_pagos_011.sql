
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_PAGOS_011" (p_id_entdad      in number,
                                                p_id_usrio       in number,
                                                p_cdgo_clnte     in number,
                                                p_anho_rcdo_dsde in number,
                                                p_anho_rcdo_hsta in number) as

  cursor c1(r_cdgo_clnte     number,
            r_id_entdad      number,
            r_id_impsto      number,
            r_anho_rcdo_dsde number,
            r_anho_rcdo_hsta number) is
    select t.id_intrmdia,
           t.id_entdad,
           t.cdgo_clnte,
           t.clmna2,
           t.clmna3,
           t.clmna4,
           t.clmna5,
           t.clmna6,
           t.clmna7,
           t.clmna8,
           t.clmna9, -- id. del sujeto
           t.clmna10,
           t.clmna11,
           t.clmna12,
           t.clmna13,
           t.clmna14,
           t.clmna15,
           t.clmna16,
           t.clmna17,
           t.clmna18,
           t.clmna19,
           t.clmna20,
           t.clmna21,
           t.cdgo_estdo_rgstro,
           h.id_sjto_impsto
      from migra.Mg_g_Intermedia_Ipu_Recaudo t
      left join homo_sujeto_impuesto h
        on h.cdgo_clnte = t.cdgo_clnte
       and h.id_impsto = r_id_impsto
       and h.idntfccion = t.clmna9

     where t.CDGO_CLNTE = r_cdgo_clnte
       and t.ID_ENTDAD = r_id_entdad
       and t.cdgo_estdo_rgstro = 'L'
       and t.clmna50 is null

          -- flitrar por a?o
       and substr(t.clmna13, 7, 4) between r_anho_rcdo_dsde and
           r_anho_rcdo_hsta
     order by t.id_intrmdia;

  v_cdgo_clnte        GENESYS.df_s_clientes.cdgo_clnte%type;
  v_id_entdad         migra.mg_g_intermedia_recaudo.id_entdad%type;
  v_id_impsto         GENESYS.df_c_impuestos.id_impsto%type;
  v_id_impsto_sbmpsto GENESYS.df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;

  v_id_sjto_impsto GENESYS.si_i_sujetos_impuesto.id_sjto_impsto%type;
  v_id_orgen       GENESYS.re_g_recaudos.id_orgen%type;
  v_id_cnvnio      GENESYS.re_g_recaudos.id_cnvnio%type;

  v_txto     varchar2(4000);
  v_cntdor   number;
  v_id_usrio number;

  v_archvo_log   varchar2(200);
  v_archvo_cmmit varchar2(200);
  --v_archvo_error      varchar2(200);
  v_fcha_hra varchar2(50);

  v_error       varchar2(2);
  v_mnsje_error varchar2(4000);
  v_cdgo_error  varchar2(4000);

begin

  v_fcha_hra := to_char(SYSDATE, 'yyyymmdd_hh24miss');

  v_archvo_log   := 'PRC_MIGRA_PAGOS_011_' || p_anho_rcdo_dsde || '-' ||
                    p_anho_rcdo_hsta || '_LOG_' || v_fcha_hra || '.txt';
  v_archvo_cmmit := 'PRC_MIGRA_PAGOS_011_' || p_anho_rcdo_dsde || '-' ||
                    p_anho_rcdo_hsta || '_COMMIT_' || v_fcha_hra || '.txt';

  begin
    select a.cdgo_clnte
      into v_cdgo_clnte
      from df_s_clientes a
     where a.cdgo_clnte = p_cdgo_clnte;
  exception
    when no_data_found then
      v_txto := '. El cliente con codigo #' || p_cdgo_clnte ||
                ', no existe en el sistema.';
      GENESYS.sitpr001(v_txto, v_archvo_log);
      return;
  end;

  v_id_entdad := p_id_entdad;
  v_id_usrio  := p_id_usrio;

  begin
    select a.id_impsto, b.id_impsto_sbmpsto
      into v_id_impsto, v_id_impsto_sbmpsto
      from df_c_impuestos a
      join df_i_impuestos_subimpuesto b
        on a.id_impsto = b.id_impsto
     where a.cdgo_clnte = p_cdgo_clnte
       and a.cdgo_impsto = 'IPU'
       and b.cdgo_impsto_sbmpsto = 'IPU';
  exception
    when no_data_found then
      v_txto := '. El impuesto o subImpuesto, no existe en el sistema.';
      GENESYS.sitpr001(v_txto, v_archvo_log);
      return;
  end;

  v_cntdor := 0;

  v_txto := 'Se inicia proceso de ajuste de informaciOn de pagos-recuados: ' ||
            p_anho_rcdo_dsde || '_' || p_anho_rcdo_hsta;

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

  for r1 in c1(v_cdgo_clnte,
               v_id_entdad,
               v_id_impsto,
               p_anho_rcdo_dsde,
               p_anho_rcdo_hsta) loop

    GENESYS.sitpr001('Procesando recaudo: ' || r1.id_intrmdia || '-' ||
                     r1.clmna9 || '-' || r1.clmna11 || '-' || r1.clmna13,
                     v_archvo_log);

    v_id_sjto_impsto := 0;
    v_id_orgen       := 0;
    v_id_cnvnio      := 0;
    v_error          := 'OK';

    v_cdgo_error  := null;
    v_mnsje_error := null;

    v_id_sjto_impsto := r1.id_sjto_impsto;

    if r1.id_sjto_impsto is null then
      v_error          := 'SN';
      v_id_sjto_impsto := 0;
    end if;

    /*
    --Verifica si Existe el Sujeto Impuesto
    begin
      select a.id_sjto_impsto
        into v_id_sjto_impsto
        from GENESYS.si_i_sujetos_impuesto a
       where exists(select 1
                      from GENESYS.si_c_sujetos b
                     where b.cdgo_clnte  = r1.cdgo_clnte
                       and b.idntfccion  = r1.clmna9
                       and a.id_sjto     = b.id_sjto)
         and a.id_impsto = v_id_impsto;
    exception
      when no_data_found then
        v_error        := 'SN';
      when too_many_rows then
        v_error        := 'SD';
      when others then
        v_error        := 'SE';
        v_cdgo_error  := sqlcode;
        v_mnsje_error := 'Error: '||sqlcode||'-'||sqlerrm;
    end;
    */

    if v_error = 'OK' then
      -- Buscando origen de documento

      begin
        select d.id_dcmnto, d.id_cnvnio
          into v_id_orgen, v_id_cnvnio
          from GENESYS.re_g_documentos d
         where d.nmro_dcmnto = r1.clmna12
           and d.id_sjto_impsto = v_id_sjto_impsto
           and d.vlor_ttal_dcmnto = r1.clmna14;
      exception
        when no_data_found then
          v_error := 'DN';
        when too_many_rows then
          v_error := 'DD';
        when others then
          v_error       := 'DE';
          v_cdgo_error  := sqlcode;
          v_mnsje_error := 'Error: ' || sqlcode || '-' || sqlerrm;
      end;
    end if;

    begin
      update migra.Mg_g_Intermedia_Ipu_Recaudo m
         set m.clmna40 = v_id_sjto_impsto,
             m.clmna42 = v_id_cnvnio,
             m.clmna43 = v_id_orgen,

             m.clmna47 = v_cdgo_error,
             m.clmna48 = v_mnsje_error,

             m.clmna50 = v_error
       where m.id_intrmdia = r1.id_intrmdia;
      --and m.cdgo_clnte        = p_cdgo_clnte
      --and m.id_entdad         = p_id_entdad
      --and m.cdgo_estdo_rgstro = 'L';
    end;

    v_cntdor := v_cntdor + 1;

    if mod(v_cntdor, 1000) = 0 then
      v_txto := 'Se han procesado ' || v_cntdor || ' registros';

      commit;

      -- escribir a log
      GENESYS.sitpr001(v_txto, v_archvo_cmmit);
    end if;
  end loop;

  commit;
  v_txto := 'Se procesaron ' || v_cntdor || ' registros ';
  GENESYS.sitpr001(v_txto, v_archvo_cmmit);

  v_txto := 'Finalizando proceso de verificacion de IDs Taxation Smart para  pagos-recuados ';
  GENESYS.sitpr001(v_txto, v_archvo_log);

end PRC_MIGRA_PAGOS_011;
/

