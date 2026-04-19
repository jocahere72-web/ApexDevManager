
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_DOCUMENTOS" ( p_id_entdad         in  number
                                                , p_id_usrio          in  number
                                                , p_cdgo_clnte        in  number
                                                , p_fcha_dsde         in varchar2
                                                , p_fcha_hsta         in varchar2
                                                ) as

    cursor c1(r_cdgo_clnte number,
              r_id_entdad  number,
              r_fcha_dsde  varchar2,
              r_fcha_hsta  varchar2) is
       select t.id_intrmdia, t.id_entdad, t.cdgo_clnte, t.nmro_lnea,
              t.clmna2, t.clmna3, t.clmna4, t.clmna5,
              t.clmna7, t.clmna8, t.clmna9, t.clmna10,
              t.clmna11, t.clmna12, t.clmna13, t.clmna14,
              t.clmna15, t.clmna16, t.clmna17,
              t.clmna18,
              t.clmna19,
              t.clmna20,
              t.cdgo_estdo_rgstro
         from migra.mg_g_intermedia_documentos t
        where t.CDGO_CLNTE        = r_cdgo_clnte and
              t.ID_ENTDAD         = r_id_entdad and
              t.cdgo_estdo_rgstro = 'L' and
              --t.id_intrmdia       in (107408525) and
              to_date(t.clmna10,'DD/MM/YYYY') between
              to_date(r_fcha_dsde,'DD/MM/YYYY') and to_date(r_fcha_hsta,'DD/MM/YYYY')
       order by t.id_intrmdia;

    cursor c2(r_cdgo_clnte  number,
              r_id_entdad   number,
              r_nmro_linea  number
              --r_nmro_dcmnto varchar2
              ) is
       select t.*
         from migra.MG_G_INTERMEDIA_DOCUMENTOS t
        where t.CDGO_CLNTE = r_cdgo_clnte and
              t.ID_ENTDAD  = r_id_entdad and
              t.nmro_lnea  = r_nmro_linea and
              --t.clmna2     = r_nmro_dcmnto and
              t.cdgo_estdo_rgstro = 'L'
       order by t.clmna5; --- t.id_intrmdia;


    --Busca el movimiento financiero
    cursor cf(r_cdgo_clnte        number,
              r_id_impsto         df_c_impuestos.id_impsto%type,
              r_id_impsto_sbmpsto df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type,
              r_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type,
              r_vgncia            number,
              r_id_prdo           number,
              r_id_cncpto         number) is
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
      /*
        from gf_g_movimientos_financiero   a
        join gf_g_movimientos_detalle      b on a.id_mvmnto_fncro = b.id_mvmnto_fncro
       where cdgo_clnte                    = r_cdgo_clnte
         and a.id_impsto                   = r_id_impsto
         and a.id_impsto_sbmpsto           = r_id_impsto_sbmpsto
         and a.id_sjto_impsto              = r_id_sjto_impsto -- el sujeto de impuesto que esta en el maestro
         and a.vgncia                      = r_vgncia
         and a.id_prdo                     = r_id_prdo        -- convertir el periodo
         and b.id_cncpto                   = r_id_cncpto      -- convertir el concepto
         and b.cdgo_mvmnto_tpo             = 'IN'
         and b.cdgo_mvmnto_orgn            = 'LQ';
    */

    -- Detallado de cuotas en documento
    cursor c3(r_rlcion_ctas  varchar2) is
      select a.cuota
        from (select regexp_substr(r_rlcion_ctas,'[^,]+', 1, level) cuota
                from dual
              connect BY regexp_substr(r_rlcion_ctas, '[^,]+', 1, level)
              is not null) a
        where a.cuota is not null;


    -- Detallado de la distribucion de cuotas en cartera
    cursor c4(r_cdgo_clnte number,
              r_id_cnvnio  number,
              r_nmro_cta   number) is
      select c.*
        from table (pkg_gf_convenios.fnc_cl_convenios_cuota_cncpto(p_cdgo_clnte => r_cdgo_clnte,
                                                                   p_id_cnvnio  => r_id_cnvnio)) c
       where c.nmro_cta = r_nmro_cta;


    -- Estracto del Convenio (Cuotas)
    cursor c10(r_id_cnvnio number,
               r_nmro_cta  number) is
      select a.nmro_cta, a.vlor_ttal
      from gf_g_convenios_extracto a
      where a.id_cnvnio = r_id_cnvnio and
            a.nmro_cta  = r_nmro_cta;


v_mnsje_rspsta      varchar2(4000);

v_cdgo_clnte        df_s_clientes.cdgo_clnte%type;
v_id_impsto         df_c_impuestos.id_impsto%type;
v_id_impsto_sbmpsto df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;
v_id_impsto_acto    df_i_impuestos_acto.id_impsto_acto%type;
v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;

v_cnvnio            boolean;
v_slio_dtlle        boolean;
v_sin_mvmnto        boolean;
v_sin_id_iac        boolean;
v_actlza_estdo      boolean;

v_id_dcmnto         re_g_documentos.id_dcmnto%type;
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

v_cntdor            number;
v_txto              varchar(4000);
v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);
v_archvo_error      varchar2(200);
v_fcha_hra          varchar2(50);

v_vlor_cncpto_cptal   RE_G_DOCUMENTOS_CNVNIO_CTA.VLOR_DBE%type;
v_vlor_cncpto_intres  RE_G_DOCUMENTOS_CNVNIO_CTA.VLOR_DBE%type;
v_vlor_cncpto_fnccion RE_G_DOCUMENTOS_CNVNIO_CTA.VLOR_DBE%type;

begin

   v_fcha_hra     := to_char(SYSDATE,'yyyymmdd_hh24miss');

   v_archvo_log   := 'prc_migra_documentos_LOG_'||v_fcha_hra||'.txt';
   v_archvo_cmmit := 'prc_migra_documentos_COMMIT_'||v_fcha_hra||'.txt';
   v_archvo_error := 'prc_migra_documentos_ERROR_'||v_fcha_hra||'.txt';
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
     select d.id_impsto, d.id_impsto_sbmpsto, i.id_impsto_acto
       into v_id_impsto , v_id_impsto_sbmpsto, v_id_impsto_acto
     from (
           select a.id_impsto , b.id_impsto_sbmpsto
             from df_c_impuestos a
                  join df_i_impuestos_subimpuesto b
                       on a.id_impsto = b.id_impsto
            where a.cdgo_clnte          = p_cdgo_clnte
              and a.cdgo_impsto         = 'IPU'
              and b.cdgo_impsto_sbmpsto = 'IPU') d
           left join df_i_impuestos_acto i
                 on i.id_impsto = d.id_impsto and i.id_impsto_sbmpsto = d.id_impsto_sbmpsto;
   exception
     when no_data_found then
       v_mnsje_rspsta :='. El impuesto o subImpuesto o impuesto acto, no existe en el sistema.';
       GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
       return;
   end;

   -- escribir a log
   v_txto := 'Se inicia proceso de cargue de documentos ';

   GENESYS.sitpr001(v_txto, v_archvo_cmmit);

   for r1 in c1(p_cdgo_clnte, p_id_entdad, p_fcha_dsde, p_fcha_hsta) loop
     v_actlza_estdo := true;

     GENESYS.sitpr001('Procesando: '||r1.id_intrmdia||', Doc: '||r1.clmna8||'('||r1.nmro_lnea||'), Ref: '||r1.clmna7||'. Convenio?: '||nvl(r1.clmna18, 'No')||' - '||nvl(r1.clmna19, r1.clmna5), v_archvo_log);

     v_cntdor := v_cntdor + 1;

     if (v_cntdor-1)/1000 = trunc((v_cntdor-1)/1000) then
       v_txto := 'Se han procesado '||(v_cntdor-1)||' registros ';

       -- escribir a log
       GENESYS.sitpr001(v_txto, v_archvo_cmmit);
     end if;

     v_cnvnio := false;

     --Verifica si Existe el Sujeto Impuesto
     begin
       select a.id_sjto_impsto
         into v_id_sjto_impsto
         from si_i_sujetos_impuesto a
        where exists(select 1
                       from si_c_sujetos b
                      where b.cdgo_clnte         = r1.cdgo_clnte
                        and b.idntfccion_antrior = r1.clmna7
                        and a.id_sjto            = b.id_sjto)
          and a.id_impsto = v_id_impsto;
      exception
        when no_data_found then
          v_mnsje_rspsta := v_cntdor||'-'||r1.id_intrmdia ||' Entidad 817. El sujeto impuesto para la referencia: ' ||r1.clmna7|| ', no existe en el sistema.';
          GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
          continue;
     end;

     if r1.clmna18 is not null then
       v_cnvnio          := true;
       v_vlor_vncdo_ttal := nvl(r1.clmna20,0);

       if r1.clmna5 = -1 then
         v_rlcion_ctas := r1.clmna19;
       else

         v_rlcion_ctas := r1.clmna5;
       end if;
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
              r1.clmna18, null,
              TO_DATE(r1.clmna10,'DD/MM/YYYY'), TO_DATE(r1.clmna17,'DD/MM/YYYY'),
              r1.clmna12, r1.clmna13, r1.clmna14, r1.clmna11, r1.clmna15,
              null, r1.clmna16, null, null)
       returning ID_DCMNTO
            into v_id_dcmnto;
     exception
       when others then
         v_mnsje_rspsta := v_cntdor||'-'||r1.id_intrmdia ||' Entidad 817. No fue posible registrar el documento.'||r1.clmna8||'-'||r1.clmna7||': '||sqlerrm;
         GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
         continue;
     end;

     if not v_cnvnio then
       -- es recibo normal

       for r2 in c2(r1.cdgo_clnte,
                    817,         --r1.id_entdad,
                    r1.nmro_lnea --r1.clmna8
                    ) loop

         --Inserta el Registro de detalle Concepto

         --Busca si Existe el Concepto
         begin
           select a.id_cncpto, a.ctgria_cncpto
             into v_id_cncpto, v_cdgo_cncpto_tpo
             from df_i_conceptos a
            where a.cdgo_clnte  = r1.cdgo_clnte
              and a.id_impsto   = v_id_impsto
              and a.cdgo_cncpto = r2.clmna5;
         exception
           when no_data_found then
             v_mnsje_rspsta := v_cntdor||'-'||r1.id_intrmdia || ' Entidad 817. El concepto: ' || r2.clmna5||' de '||r2.clmna3||' en : '||r1.clmna8||', no existe.';
             GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
             v_actlza_estdo := false;
             rollback;
             exit;
         end;

         --Busca si Existe el Periodo
         begin
           select t.id_prdo into v_id_prdo
             from DF_I_PERIODOS t
            where t.cdgo_clnte        = r2.cdgo_clnte and
                  t.id_impsto         = v_id_impsto and
                  t.id_impsto_sbmpsto = v_id_impsto_sbmpsto and
                  t.vgncia            = r2.clmna3;
         exception
           when no_data_found then
             v_mnsje_rspsta := v_cntdor||'-'||r1.id_intrmdia || ' Entidad 817. El periodo: ' || r2.clmna4||' de '||r2.clmna3||' en : '||r1.clmna8||', no existe.';
             GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
             v_actlza_estdo := false;
             rollback;
             exit;
         end;

         GENESYS.sitpr001(r2.id_intrmdia||'. S.I.: '||v_id_sjto_impsto||', vig: '||r2.clmna3||', Id.P.:'||v_id_prdo||', Id.C.:'||v_id_cncpto, v_archvo_log);

         v_sin_mvmnto := true;

         if v_cdgo_cncpto_tpo = 'I' then
           GENESYS.sitpr001(r2.id_intrmdia||'Recalculando concepto '||v_id_cncpto||' por '||v_cdgo_cncpto_tpo, v_archvo_log);

           begin
             select T.ID_CNCPTO into v_id_cncpto_int
               from DF_I_IMPUESTOS_ACTO_CONCEPTO t
              where t.cdgo_clnte     = p_cdgo_clnte and
                    t.vgncia         = r2.clmna3 and
                    t.id_impsto_acto = v_id_impsto_acto and
                    t.id_prdo        = v_id_prdo and
                    (t.id_cncpto_intres_mra     = v_id_cncpto or
                     t.id_cncpto_intres_fnccion = v_id_cncpto or
                     t.id_cncpto_intres_vncdo   = v_id_cncpto);
           exception
             when no_data_found then
               v_mnsje_rspsta := v_cntdor||'-'||r1.id_intrmdia || ' Entidad 817. El concepto: ' || r2.clmna5||' en vig: '||r2.clmna5||',per: '||v_id_prdo||', no puede recalcularse.';
               GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
               v_actlza_estdo := false;
               rollback;
               exit;
             when too_many_rows then
               v_mnsje_rspsta := v_cntdor||'-'||r1.id_intrmdia || ' Entidad 817. El concepto: ' || r2.clmna5||' en vig: '||r2.clmna5||',per: '||v_id_prdo||', dupllicado no puede recalcularse.';
               GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
               v_actlza_estdo := false;
               rollback;
               exit;
           end;

           v_id_cncpto := v_id_cncpto_int;
         end if;

         --Busca el movimiento financiero

         GENESYS.sitpr001('Buscando movimiento financiero para: '||v_id_sjto_impsto||', vig: '||r2.clmna3||', Id.P.:'||v_id_prdo||', Id.C.:'||v_id_cncpto, v_archvo_log);

         for rf in cf(r1.cdgo_clnte,
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
           v_mnsje_rspsta := v_cntdor||'-'||r1.id_intrmdia || ' Entidad 817. El movimiento : ' || r2.id_intrmdia||', de: '||r1.clmna7||', vigencia:'||r2.clmna3||', Concepto: '||r2.clmna5||', no existe.';
           GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
           v_actlza_estdo := false;
           rollback;
           exit;
         end if;

         begin
           insert into RE_G_DOCUMENTOS_DETALLE
                  (id_dcmnto, id_mvmnto_dtlle, id_cncpto,
                   vlor_dbe, vlor_hber, bse_grvble, trfa, txto_trfa,
                   cdgo_cncpto_tpo, id_dscnto_rgla, id_cncpto_rlcnal, prcntje_dscnto)
           values (v_id_dcmnto, v_id_mvmnto_dtlle, v_id_cncpto,
                   r2.clmna6, 0, r2.clmna9, r2.clmna10, r2.clmna10*1000,
                   v_cdgo_cncpto_tpo, null, null, null);
         exception
           when others then
             v_mnsje_rspsta := v_cntdor||'-'||r1.id_intrmdia ||' Entidad 817. No fue posible crear detalle documento concepto: ' ||r1.clmna8||'-'||r2.clmna3||'-'||r2.clmna5||': '||sqlerrm;
             GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
             v_actlza_estdo := false;
             rollback;
             exit;
          end;
        end loop;
      else

        -- Es cuota de convenio

        if r1.clmna11 = 'N' then
          -- No esta aplicado, se recalcula

          -- Caluclando Id Convenio
          begin
            select f.id_cnvnio into v_id_cnvnio
              from gf_g_convenios f
             where f.nmro_cnvnio = r1.clmna18;
          exception
            when no_data_found then
              v_mnsje_rspsta := v_cntdor||'-'|| r1.id_intrmdia ||' Entidad 818. No se pudo encontrar convenio para el documento';
              GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
              rollback;
              continue;
            when too_many_rows then
              v_mnsje_rspsta := v_cntdor||'-'|| r1.id_intrmdia ||' Entidad 818. convenio duplicado para el documento';
              GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
              rollback;
              continue;
            when others then
             v_mnsje_rspsta := v_cntdor||'-'|| r1.id_intrmdia ||' Entidad 818. consulta de convenio presento errro: '||sqlcode||'-'||sqlerrm;
              GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
              rollback;
              continue;
          end;

          GENESYS.sitpr001('Convenio: '||r1.clmna18||', Id convenio: '||v_id_cnvnio,  v_archvo_log);

          v_slio_dtlle := false;

          -- Recorriendo las cuotas del convenio

          -- Calculando valor total de cuotas
          v_vlor_cta_ttal := 0;

          if v_vlor_vncdo_ttal > 0 then

            for r3 in c3(v_rlcion_ctas) loop

              for r10 in c10(v_id_cnvnio, r3.cuota) loop
                v_vlor_cta_ttal := v_vlor_cta_ttal + r10.vlor_ttal;
              end loop;
            end loop;
          end if;

          for r3 in c3(v_rlcion_ctas) loop
            GENESYS.sitpr001('Cuota: '||r3.cuota,  v_archvo_log);
            -- Tabla con las cartera convenida

            v_vlor_vncdo_cta := 0;
            v_vlor_cptal_cta := 0;

            -- Calculando valor vencido para distribuir en cuota
            if v_vlor_cta_ttal > 0 and v_vlor_vncdo_ttal > 0 then

              for r10 in c10(v_id_cnvnio, r3.cuota) loop
                v_vlor_cta := r10.vlor_ttal;
              end loop;

              v_vlor_vncdo_cta := round((v_vlor_cta/v_vlor_cta_ttal)*v_vlor_vncdo_ttal, 0);

              for r4 in c4(r1.cdgo_clnte, v_id_cnvnio, r3.cuota) loop
                v_vlor_cptal_cta := v_vlor_cptal_cta + r4.vlor_cncpto_cptal;
              end loop;
            end if;


            for r4 in c4(r1.cdgo_clnte, v_id_cnvnio, r3.cuota) loop

              -- insercion de registros de cartera por cuotas

              -- consulta movimiento detalle

              v_sin_mvmnto := true;
              v_sin_id_iac := false;

              v_id_cncpto_int_mra := null;
              v_id_cncpto_int_fnc := null;
              v_id_cncpto_int_vnc := null;

              GENESYS.sitpr001('S.I.: '||v_id_sjto_impsto||', Vig: '||r4.vgncia||', Id.P.:'||r4.id_prdo||', Id.C.:'||r4.id_cncpto, v_archvo_log);

              for rf in cf(r1.cdgo_clnte,
                           v_id_impsto,
                           v_id_impsto_sbmpsto,
                           v_id_sjto_impsto,
                           r4.vgncia,
                           r4.id_prdo,
                           r4.id_cncpto) loop

                v_sin_mvmnto       := false;
                v_id_mvmnto_dt_cta := rf.id_mvmnto_dtlle;

                -- Buscando conceptos adicionales

                begin
                  select t.id_cncpto_intres_mra, t.id_cncpto_intres_fnccion, t.id_cncpto_intres_vncdo
                    into v_id_cncpto_int_mra, v_id_cncpto_int_fnc, v_id_cncpto_int_vnc
                    from DF_I_IMPUESTOS_ACTO_CONCEPTO t
                   where t.id_impsto_acto_cncpto = rf.id_impsto_acto_cncpto;
                exception
                  when no_data_found then
                    v_sin_id_iac := true;
                  when too_many_rows then
                    v_sin_id_iac := true;
                end;
              end loop;

              if v_sin_mvmnto then

                v_mnsje_rspsta := v_cntdor||'-'||r1.id_intrmdia || ' Entidad 818. El movimiento : convenio' || r4.id_cnvnio||'-'||r4.nmro_cta||'-'||r4.id_prdo||'-'||r4.id_cncpto||', no existe.';
                GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
                v_slio_dtlle := true;
                v_actlza_estdo := false;
                rollback;
                exit;
              end if;

              if v_sin_id_iac then
                v_mnsje_rspsta := v_cntdor||'-'|| r1.id_intrmdia ||' Entidad 818. El acto impuesto concepto : convenio' || r4.id_cnvnio||'-'||r4.nmro_cta||'-'||r4.id_prdo||'-'||r4.id_cncpto||', no existe.';
                GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
                v_slio_dtlle := true;
                v_actlza_estdo := false;
                rollback;
                exit;
              end if;

              -- Creando registros de concepto x cuotas

              v_vlor_cncpto_cptal   := r4.vlor_cncpto_cptal;
              v_vlor_cncpto_intres  := r4.vlor_cncpto_intres;
              v_vlor_cncpto_fnccion := r4.vlor_cncpto_fnccion;
              v_vlor_vncdo := 0;

              if r4.vlor_cncpto_cptal < 0 then
                v_vlor_cncpto_cptal := 0;
              end if;

              if r4.vlor_cncpto_intres < 0 then
                v_vlor_cncpto_intres := 0;
              end if;

              if r4.vlor_cncpto_fnccion < 0 then
                v_vlor_cncpto_fnccion := 0;
              end if;

              -- Componente Capital
              begin
                insert into RE_G_DOCUMENTOS_CNVNIO_CTA
                      (id_dcmnto, id_cnvnio, nmro_cta,
                       id_mvmnto_dtlle, id_cncpto, vlor_dbe)
                values(v_id_dcmnto, r4.id_cnvnio, r4.nmro_cta,
                       v_id_mvmnto_dt_cta, r4.id_cncpto, v_vlor_cncpto_cptal);
              exception
                when others then
                  v_mnsje_rspsta := v_cntdor||'-'|| r1.id_intrmdia ||' Entidad 818. No fue posible crear detalle CAP documento cuota convenio: ' ||r1.clmna8||'-'||r1.clmna18||'-'||r3.cuota||'-'||r4.nmro_cta||'-'||r4.id_prdo||'-'||r4.id_cncpto||': '||sqlerrm;
                  GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
                  v_slio_dtlle := true;
                  v_actlza_estdo := false;
                  rollback;
                  exit;
              end;

              -- Componente Interes Mora
              begin
                insert into RE_G_DOCUMENTOS_CNVNIO_CTA
                      (id_dcmnto, id_cnvnio, nmro_cta,
                       id_mvmnto_dtlle, id_cncpto, vlor_dbe)
                values(v_id_dcmnto, r4.id_cnvnio, r4.nmro_cta,
                       v_id_mvmnto_dt_cta, v_id_cncpto_int_mra, v_vlor_cncpto_intres);
                exception
              when others then
                v_mnsje_rspsta := v_cntdor||'-'|| r1.id_intrmdia ||' Entidad 818. No fue posible crear detalle IMO documento cuota convenio: ' ||r1.clmna8||'-'||r1.clmna18||'-'||r3.cuota||'-'||r4.nmro_cta||'-'||r4.id_prdo||'-'||r4.id_cncpto||': '||sqlerrm;
                GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
                v_slio_dtlle := true;
                v_actlza_estdo := false;
                rollback;
                exit;
              end;

              -- Componente Interes Financiacion
              begin
                insert into RE_G_DOCUMENTOS_CNVNIO_CTA
                      (id_dcmnto, id_cnvnio, nmro_cta,
                       id_mvmnto_dtlle, id_cncpto, vlor_dbe)
                values(v_id_dcmnto, r4.id_cnvnio, r4.nmro_cta,
                       v_id_mvmnto_dt_cta, v_id_cncpto_int_fnc, v_vlor_cncpto_fnccion);
              exception
                when others then
                  v_mnsje_rspsta := v_cntdor||'-'|| r1.id_intrmdia ||' Entidad 818. No fue posible crear detalle FNC documento cuota convenio: ' ||r1.clmna8||'-'||r1.clmna18||'-'||r3.cuota||'-'||r4.nmro_cta||'-'||r4.id_prdo||'-'||r4.id_cncpto||': '||sqlerrm;
                  GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
                  v_slio_dtlle := true;
                  v_actlza_estdo := false;
                  rollback;
                  exit;
              end;

              if v_vlor_cptal_cta > 0 and v_vlor_vncdo_cta > 0 then
                v_vlor_vncdo := round((r4.vlor_cncpto_cptal/v_vlor_cptal_cta)*v_vlor_vncdo_cta, 0);

                if v_vlor_vncdo < 0 then
                  v_vlor_vncdo := 0;
                end if;

                -- Componente Interes Vencido
                begin
                  insert into RE_G_DOCUMENTOS_CNVNIO_CTA
                        (id_dcmnto, id_cnvnio, nmro_cta,
                         id_mvmnto_dtlle, id_cncpto, vlor_dbe)
                  values(v_id_dcmnto, r4.id_cnvnio, r4.nmro_cta,
                         v_id_mvmnto_dt_cta, v_id_cncpto_int_vnc, v_vlor_vncdo);
                exception
                  when others then
                    v_mnsje_rspsta := v_cntdor||'-'|| r1.id_intrmdia ||' Entidad 818. No fue posible crear detalle VNC documento cuota convenio: ' ||r1.clmna8||'-'||r1.clmna18||'-'||r3.cuota||'-'||r4.nmro_cta||'-'||r4.id_prdo||'-'||r4.id_cncpto||': '||sqlerrm;
                    GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
                    v_actlza_estdo := false;
                    v_slio_dtlle := true;
                    rollback;
                    exit;
                end;
              end if;
            end loop;

            if v_slio_dtlle then
              -- Sale del loop de cuotas
              exit;
            end if;
          end loop;

          if v_slio_dtlle then
            -- sale al siguiente documento
            continue;
          else
            -- Insertar Registros de Documentos Detalle a partir del cargue en documentos cuota
            for r20 in (
                        select c.id_dcmnto, c.id_mvmnto_dtlle, c.id_cncpto,
                               (select t.CTGRIA_CNCPTO
                                  from DF_I_CONCEPTOS t
                                 where t.id_cncpto  = c.id_cncpto and
                                       t.cdgo_clnte = r1.cdgo_clnte and
                                       t.id_impsto  = v_id_impsto) tpo_cncpto,
                                       sum(c.vlor_dbe) ttal_dbe
                          from RE_G_DOCUMENTOS_CNVNIO_CTA c
                         where c.id_dcmnto = v_id_dcmnto
                        group by c.id_dcmnto, c.id_mvmnto_dtlle, c.id_cncpto
                        order by c.id_dcmnto, c.id_mvmnto_dtlle, c.id_cncpto) loop

              begin
                insert into RE_G_DOCUMENTOS_DETALLE
                       (id_dcmnto, id_mvmnto_dtlle, id_cncpto,
                        vlor_dbe, vlor_hber, bse_grvble, trfa, txto_trfa,
                        cdgo_cncpto_tpo, id_dscnto_rgla, id_cncpto_rlcnal, prcntje_dscnto)
                values (r20.id_dcmnto, r20.id_mvmnto_dtlle, r20.id_cncpto,
                        r20.ttal_dbe, 0, null, null, null,
                        r20.tpo_cncpto, null, null, null);
              exception
                when others then
                  v_mnsje_rspsta := v_cntdor||'-'|| r1.id_intrmdia ||' Entidad 818. No fue posible crear detalle documento concepto: ' ||v_id_dcmnto||'-'||r20.id_mvmnto_dtlle||'-'||r20.id_cncpto||' : '||sqlcode||'-'||sqlerrm;
                  GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
                  v_actlza_estdo := false;
                  rollback;
                  exit;
              end;
            end loop;

          end if;
        end if;
      end if;

     if v_actlza_estdo then
        -- Para cada liquidaci?n
        commit;

        begin
          update migra.mg_g_intermedia_documentos m
             set m.cdgo_estdo_rgstro = 'S'
           where m.id_intrmdia       = r1.id_intrmdia
             and m.cdgo_clnte        = p_cdgo_clnte
             and m.id_entdad         = p_id_entdad
             and m.cdgo_estdo_rgstro = 'L';
          commit;
        end;
      end if;

      GENESYS.sitpr001('terminando de procesar: '||r1.id_intrmdia||', Doc: '||r1.clmna8||'('||r1.nmro_lnea||'), Ref: '||r1.clmna7, v_archvo_log);

    end loop;

    commit;
    v_txto := 'Se procesaron '||v_cntdor||' registros ';
    GENESYS.sitpr001(v_txto, v_archvo_cmmit);

  exception
    when others then
      v_mnsje_rspsta := '. No fue posible realizar la migracion de documentos.' ||sqlcode||'-'||sqlerrm;
      GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
end prc_migra_documentos;
/

