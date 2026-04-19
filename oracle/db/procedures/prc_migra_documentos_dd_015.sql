
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_DOCUMENTOS_DD_015" (p_id_entdad  in number,
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
          t.clmna9            <> 'DCO'           -- Documentos normales: DAB/DMA/DNO
      and to_date(t.clmna10, 'DD/MM/YYYY') between
           to_date(r_fcha_dsde, 'DD/MM/YYYY') and
           to_date(r_fcha_hsta, 'DD/MM/YYYY')

           --ojo prueba
           --and t.id_intrmdia   = 368579415

   order by t.id_intrmdia;


cursor c2(r_cdgo_clnte        number,
          r_id_entdad         number,
          r_nmro_dcmnto       varchar2,
          r_fcha_lmte         varchar2,
          r_id_impsto         number,
          r_id_impsto_sbmpsto number) is
   select t.*,
          a.id_cncpto, a.ctgria_cncpto,
          b.id_prdo
     from migra.MG_G_INTERMEDIA_IPU_DOCUMENTO t
          left join df_i_conceptos a
                 on a.cdgo_clnte      = t.cdgo_clnte
                    and a.id_impsto   = r_id_impsto
                    and a.cdgo_cncpto = t.clmna5
          left join DF_I_PERIODOS b
                 on b.cdgo_clnte            = t.cdgo_clnte
                    and b.id_impsto         = r_id_impsto
                    and b.id_impsto_sbmpsto = r_id_impsto_sbmpsto
                    and b.vgncia            = t.clmna3
    where t.CDGO_CLNTE        = r_cdgo_clnte and
          t.ID_ENTDAD         = r_id_entdad and
          t.clmna2            = r_nmro_dcmnto and
          t.clmna9            = r_fcha_lmte and
          t.clmna30           is null and
          t.cdgo_estdo_rgstro = 'L'
   order by t.clmna3, t.clmna5;

--Busca el movimiento financiero
cursor cf(r_cdgo_clnte        number,
          r_id_impsto         df_c_impuestos.id_impsto%type,
          r_id_impsto_sbmpsto df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type,
          r_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type,
          r_vgncia            number,
          r_id_prdo            number,
         r_id_cncpto          number) is
  select b.id_mvmnto_dtlle, b.id_impsto_acto_cncpto
    from gf_g_movimientos_detalle b
   where b.id_cncpto                   = r_id_cncpto
     and b.cdgo_mvmnto_tpo             = 'IN'
     and b.cdgo_mvmnto_orgn            = 'LQ'
     and exists (select 1
                   from gf_g_movimientos_financiero a
                  where a.id_mvmnto_fncro = b.id_mvmnto_fncro
                    and a.cdgo_clnte                  = r_cdgo_clnte
                    and a.id_impsto                   = r_id_impsto
                    and a.id_impsto_sbmpsto           = r_id_impsto_sbmpsto
                    and a.id_sjto_impsto              = r_id_sjto_impsto /* el sujeto de impuesto que esta en el maestro*/
                    and a.vgncia                      = r_vgncia
                    and a.id_prdo                     = r_id_prdo);

v_id_entdad   number;
--v_id_usrio    number;
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

  v_archvo_log     := 'PRC_MIGRA_DOCUMENTOS_DD_015_LOG_'||v_fcha_hra||'.txt';
  v_archvo_cmmit   := 'PRC_MIGRA_DOCUMENTOS_DD_015_COMMIT_'||v_fcha_hra||'.txt';
  v_archvo_error   := 'PRC_MIGRA_DOCUMENTOS_DD_015_ERROR_'||v_fcha_hra||'.txt';

  v_txto := 'Iniciando proceso de registro de detalle documentos';

  GENESYS.sitpr001(v_txto, v_archvo_cmmit);
  GENESYS.sitpr001(v_txto, v_archvo_log);

  v_cdgo_clnte        := null;
  v_id_impsto         := null;
  v_id_impsto_sbmpsto := null;
  v_id_impsto_acto    := null;

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

  v_id_entdad := p_id_entdad;
  --v_id_usrio  := p_id_usrio;

  /*
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
  */

  begin
    select d.id_impsto, d.id_impsto_sbmpsto, i.id_impsto_acto
       into v_id_impsto , v_id_impsto_sbmpsto, v_id_impsto_acto
     from (
           select a.id_impsto , b.id_impsto_sbmpsto
             from df_c_impuestos a
                  join df_i_impuestos_subimpuesto b
                       on a.id_impsto = b.id_impsto
            where a.cdgo_clnte          = v_cdgo_clnte
              and a.cdgo_impsto         = 'IPU'
              and b.cdgo_impsto_sbmpsto = 'IPU') d
           left join df_i_impuestos_acto i
                 on i.id_impsto = d.id_impsto and i.id_impsto_sbmpsto = d.id_impsto_sbmpsto;
  end;

  v_cntdor  := 0;

  for r1 in c1(v_cdgo_clnte, v_id_entdad, p_fcha_dsde, p_fcha_hsta) loop

    v_txto := 'Procesando documentos (818): '||r1.id_intrmdia||', Doc: '||r1.clmna8||', Ref: '||r1.clmna7||', vence: '||r1.clmna17;
    GENESYS.sitpr001(v_txto, v_archvo_log);

    v_id_sjto_impsto := r1.clmna40;
    v_id_dcmnto      := r1.clmna43;
    v_id_cnvnio      := r1.clmna42;

    for r2 in c2(r1.cdgo_clnte, 817, r1.clmna8, r1.clmna17, v_id_impsto, v_id_impsto_sbmpsto) loop

      v_mnsje_rspsta := 'Procesando detalle (817): '||r2.id_intrmdia || '-'||r2.clmna3||'-'||r2.clmna4||'-'||r2.clmna9;
      GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);

      v_error            := 'OK';
      v_id_cncpto        := r2.id_cncpto;
      v_cdgo_cncpto_tpo  := r2.ctgria_cncpto;
      v_id_prdo          := r2.id_prdo;

      v_id_cncpto_int    := null;
      v_id_mvmnto_dtlle  := null;

      --Busca si Existe el Concepto
      /*
      begin
        select a.id_cncpto, a.ctgria_cncpto
          into v_id_cncpto, v_cdgo_cncpto_tpo
          from df_i_conceptos a
         where a.cdgo_clnte  = r1.cdgo_clnte
           and a.id_impsto   = v_id_impsto
           and a.cdgo_cncpto = r2.clmna5;
      exception
         when no_data_found then
           v_mnsje_rspsta := r1.id_intrmdia||'-'||r2.id_intrmdia ||'-'||r2.nmro_lnea||', concepto: '||r2.clmna5||' no existe';
           GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
           v_error := 'CN';
      end;
      */

      if v_id_cncpto is null or v_cdgo_cncpto_tpo is null then

        v_mnsje_rspsta := r1.id_intrmdia||'-'||r2.id_intrmdia ||'-'||r2.nmro_lnea||', concepto: '||r2.clmna5||' no existe';
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
        v_error := 'CN';

      elsif v_id_prdo is null then

        v_mnsje_rspsta := r1.id_intrmdia||'-'||r2.id_intrmdia ||'-'||r2.nmro_lnea||', periodo: '||r2.clmna3||'-'||r2.clmna4||', no existe.';
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
        v_error := 'PN';
      end if;

      if v_error = 'OK' then
        /*
        --Busca si Existe el Periodo
        begin
          select t.id_prdo
            into v_id_prdo
            from DF_I_PERIODOS t
           where t.cdgo_clnte        = r2.cdgo_clnte and
                 t.id_impsto         = v_id_impsto and
                 t.id_impsto_sbmpsto = v_id_impsto_sbmpsto and
                 t.vgncia            = r2.clmna3;
        exception
          when no_data_found then
            v_mnsje_rspsta := r1.id_intrmdia||'-'||r2.id_intrmdia ||'-'||r2.nmro_lnea||', periodo: '||r2.clmna3||'-'||r2.clmna4||', no existe.';
            GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
            v_error := 'PN';
        end;
        */

        --if v_error = 'OK' then

          if v_cdgo_cncpto_tpo = 'I' then
            -- Concepto interes, se debe recalcular

            GENESYS.sitpr001(r2.id_intrmdia||',, Recalculando concepto '||v_id_cncpto||' por ser: '||v_cdgo_cncpto_tpo, v_archvo_log);

            begin
              select T.ID_CNCPTO
                into v_id_cncpto_int
                from DF_I_IMPUESTOS_ACTO_CONCEPTO t
               where t.cdgo_clnte     = v_cdgo_clnte and
                     t.vgncia         = r2.clmna3 and
                     t.id_impsto_acto = v_id_impsto_acto and
                     t.id_prdo        = v_id_prdo and
                     (t.id_cncpto_intres_mra     = v_id_cncpto or
                      t.id_cncpto_intres_fnccion = v_id_cncpto or
                      t.id_cncpto_intres_vncdo   = v_id_cncpto);
            exception
              when no_data_found then
                v_mnsje_rspsta := r1.id_intrmdia||'-'||r2.id_intrmdia ||'-'||r2.clmna2||', concepto: ' || r2.clmna3||'-'||r2.clmna5||', periodo: '||v_id_prdo||', id concepto: '||v_id_cncpto||', no puede recalcularse.';
                GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
                v_error := 'IN';

              when too_many_rows then
                v_mnsje_rspsta := r1.id_intrmdia||'-'||r2.id_intrmdia ||'-'||r2.clmna2||', concepto: ' || r2.clmna3||'-'||r2.clmna5||', periodo: '||v_id_prdo||', id concepto: '||v_id_cncpto||', duplicado';
                GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
                v_error := 'ID';
            end;

            v_id_cncpto := v_id_cncpto_int;
          end if;

          if v_error = 'OK' then
            -- Buscando movimiento financiero

            v_sin_mvmnto      := true;

            for rf in cf(r2.cdgo_clnte,
                         v_id_impsto,
                         v_id_impsto_sbmpsto,
                         v_id_sjto_impsto,
                         r2.clmna3,      -- Vigencia
                         v_id_prdo,
                         v_id_cncpto) loop

              v_sin_mvmnto      := false;
              v_id_mvmnto_dtlle := rf.id_mvmnto_dtlle;
            end loop;

            if v_sin_mvmnto then

              v_mnsje_rspsta := r1.id_intrmdia||'-'||r2.id_intrmdia ||'-'||r2.clmna2||', concepto: ' || r2.clmna3||'-'||r2.clmna5||', periodo: '||v_id_prdo||', id concepto: '||v_id_cncpto||', sin moimiento financiero';
              GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
              v_error := 'SM';
            end if;
          end if;

        --end if;
      end if;

      begin
        update migra.MG_G_INTERMEDIA_IPU_DOCUMENTO r
           set r.clmna30           = v_error,
               r.CLMNA31           = v_id_prdo,          -- id periodo
               r.CLMNA32           = v_id_cncpto,        -- id. concepto
               r.CLMNA33           = v_cdgo_cncpto_tpo,  -- tipo de concepto
               r.CLMNA34           = v_id_mvmnto_dtlle   -- id movimieto
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

end PRC_MIGRA_DOCUMENTOS_DD_015;

/

