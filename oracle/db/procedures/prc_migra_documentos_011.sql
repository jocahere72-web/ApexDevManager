
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_DOCUMENTOS_011" (p_id_entdad  in number,
                                                     p_id_usrio   in number,
                                                     p_cdgo_clnte in number,
                                                     p_fcha_dsde  in varchar2,
                                                     p_fcha_hsta  in varchar2) is

  cursor c1(r_cdgo_clnte number,
            r_id_entdad  number,
            r_fcha_dsde  varchar2,
            r_fcha_hsta  varchar2,
            r_id_impsto  number        -- Id. del impuesto
            ) is
    select t.*, h.id_sjto_impsto
      from migra.MG_G_INTERMEDIA_IPU_DOCUMENTO t
           left join homo_sujeto_impuesto h
                  on h.cdgo_clnte     = t.cdgo_clnte
                     and h.id_impsto  = r_id_impsto
                     and h.idntfccion = t.clmna7 --'0102000006960014000000000'
     where t.CDGO_CLNTE        = r_cdgo_clnte
       and t.ID_ENTDAD         = r_id_entdad
       and t.cdgo_estdo_rgstro = 'L'
       and t.clmna50           is null
       and to_date(t.clmna10, 'DD/MM/YYYY') between
           to_date(r_fcha_dsde, 'DD/MM/YYYY') and
           to_date(r_fcha_hsta, 'DD/MM/YYYY')
     order by t.id_intrmdia;

  v_id_entdad  number;
  v_id_usrio   number;
  v_cdgo_clnte number;

  v_id_impsto         df_c_impuestos.id_impsto%type;
  v_id_impsto_sbmpsto df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;
  --v_id_impsto_acto    df_i_impuestos_acto.id_impsto_acto%type;

  v_id_sjto_impsto si_i_sujetos_impuesto.id_sjto_impsto%type;
  v_id_cnvnio      re_g_recaudos.id_cnvnio%type;

  v_txto   varchar2(4000);
  v_cntdor number;

  v_archvo_log   varchar2(200);
  v_archvo_cmmit varchar2(200);
  v_fcha_hra     varchar2(50);
  v_error        varchar2(2);
  --v_cntdad       number;
  v_cnvnio       varchar2(1);

  v_mnsje_error varchar2(4000);
  v_cdgo_error  varchar2(4000);

begin
  v_fcha_hra := to_char(SYSDATE, 'yyyymmdd_hh24miss');

  v_archvo_log   := 'PRC_MIGRA_DOCUMENTOS_011_LOG_' || v_fcha_hra || '.txt';
  v_archvo_cmmit := 'PRC_MIGRA_DOCUMENTOS_011_COMMIT_' || v_fcha_hra ||
                    '.txt';

  v_txto := 'Iniciando proceso de verificaci?n de ID. sujeto de impuesto para documentos';

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

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

  for r1 in c1(v_cdgo_clnte, v_id_entdad, p_fcha_dsde, p_fcha_hsta, v_id_impsto) loop

    v_txto := 'Procesando: ' || r1.id_intrmdia || '-(' || r1.nmro_lnea ||
              '), Doc: ' || r1.clmna8 || ', Ref: ' || r1.clmna7;
    GENESYS.sitpr001(v_txto, v_archvo_log);

    -- Buscando sujeto impuesto
    v_id_sjto_impsto := 0;
    v_error          := 'OK';
    v_cnvnio         := 'N';
    v_id_cnvnio      := 0;

    v_cdgo_error  := null;
    v_mnsje_error := null;

    v_id_sjto_impsto := r1.id_sjto_impsto;

    if r1.id_sjto_impsto is null then
      v_error          := 'SN';
      v_id_sjto_impsto := 0;
    end if;

    /*
    begin
      select a.id_sjto_impsto
        into v_id_sjto_impsto
        from si_i_sujetos_impuesto a
       where exists (select 1
                from si_c_sujetos b
               where b.cdgo_clnte = r1.cdgo_clnte
                 and b.idntfccion = r1.clmna7
                 and a.id_sjto = b.id_sjto)
         and a.id_impsto = v_id_impsto;
    exception
      when no_data_found then
        v_error := 'SN';
      when too_many_rows then
        v_error := 'SD';
      when others then
        v_error       := 'SE';
        v_cdgo_error  := sqlcode;
        v_mnsje_error := 'Error: ' || sqlcode || '-' || sqlerrm;
    end;
    */

    if v_error = 'OK' then
      -- Verificando si ya fue cargado anteriormente
      /*
      begin
        select count(*)
          into v_cntdad
          from RE_G_DOCUMENTOS d
         where d.NMRO_DCMNTO    = r1.clmna8
           and d.ID_SJTO_IMPSTO = v_id_sjto_impsto;
      end;

      if v_cntdad > 0 then
        v_error := 'DE';
      else
      */
        if r1.clmna18 is not null then
          -- Buscando convenio

          begin
            select f.id_cnvnio, 'S'
              into v_id_cnvnio, v_cnvnio
              from gf_g_convenios f
             where f.cdgo_clnte     = v_cdgo_clnte
               and f.id_sjto_impsto = v_id_sjto_impsto
               and f.nmro_cnvnio    = r1.clmna18;
          exception
            when no_data_found then
              v_cnvnio    := 'N';
              v_id_cnvnio := 0;
            when too_many_rows then
              v_cnvnio    := 'N';
              v_id_cnvnio := 0;
            when others then
              v_cnvnio    := 'N';
              v_id_cnvnio := 0;
          end;
        end if;

      --end if;
    end if;

    begin
      update migra.MG_G_INTERMEDIA_IPU_DOCUMENTO m
         set m.clmna40 = v_id_sjto_impsto, -- Id. Sujeto de Impuesto TAXATION SMART
             m.clmna41 = v_cnvnio, -- Indicador de pago Convenio TAXATION SMART
             m.clmna42 = v_id_cnvnio, -- Id. numero de convenio en TAXATION SMART

             m.clmna47 = v_cdgo_error,
             m.clmna48 = v_mnsje_error,

             m.clmna50 = v_error -- Estado de Error
       where m.id_intrmdia = r1.id_intrmdia;
         --and m.cdgo_clnte = r1.cdgo_clnte
         --and m.id_entdad = r1.id_entdad;
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

  v_txto := 'Finalizando proceso de verificacion de IDs Taxation Smart para documentos';
  GENESYS.sitpr001(v_txto, v_archvo_log);

end PRC_MIGRA_DOCUMENTOS_011;

/

