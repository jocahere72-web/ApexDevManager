
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_DOCUMENTOS_DD_017" is



cursor c1(r_cdgo_clnte number,
          r_id_entdad  number) is
   select t.*
     from migra.mg_g_intermedia_documentos_p2 t
    where t.CDGO_CLNTE        = r_cdgo_clnte and
          t.ID_ENTDAD         = r_id_entdad and
          t.cdgo_estdo_rgstro = 'L' and
          t.clmna50           = 'OK' and
          t.clmna49           = 'DC' and
          t.clmna9            = 'DCO'and           -- Documentos convenios
          t.clmna42           > 0
          --and t.id_intrmdia   = 81908335
   order by t.id_intrmdia;

-- Detallado de cuotas en documento
cursor c3(r_rlcion_ctas  varchar2) is
  select a.cuota
    from (select regexp_substr(r_rlcion_ctas,'[^,]+', 1, level) cuota
            from dual
          connect BY regexp_substr(r_rlcion_ctas, '[^,]+', 1, level)
          is not null) a
   where a.cuota is not null;

-- Estracto del Convenio (Cuotas)
cursor c10(r_id_cnvnio number,
           r_nmro_cta  number) is
  select a.nmro_cta, a.vlor_ttal
    from gf_g_convenios_extracto a
   where a.id_cnvnio = r_id_cnvnio and
         a.nmro_cta  = r_nmro_cta;

-- Detallado de la distribucion de cuotas en cartera
cursor c4(r_cdgo_clnte number,
          r_id_cnvnio  number,
          r_nmro_cta   number) is
  select c.*
    from table (pkg_gf_convenios.fnc_cl_convenios_cuota_cncpto(p_cdgo_clnte => r_cdgo_clnte,
                                                               p_id_cnvnio  => r_id_cnvnio)) c
   where c.nmro_cta = r_nmro_cta;


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

cursor c20(r_cdgo_clnte  number,
           r_id_impsto   number,
           r_id_dcmnto   number) is
  select c.id_dcmnto, c.id_mvmnto_dtlle, c.id_cncpto,
         (select t.CTGRIA_CNCPTO
            from DF_I_CONCEPTOS t
           where t.id_cncpto  = c.id_cncpto and
                 t.cdgo_clnte = r_cdgo_clnte and
                 t.id_impsto  = r_id_impsto) tpo_cncpto,
         sum(c.vlor_dbe) ttal_dbe
    from RE_G_DOCUMENTOS_CNVNIO_CTA c
   where c.id_dcmnto = r_id_dcmnto
  group by c.id_dcmnto, c.id_mvmnto_dtlle, c.id_cncpto
  order by c.id_dcmnto, c.id_mvmnto_dtlle, c.id_cncpto;


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

v_id_mvmnto_dt_cta  re_g_documentos_cnvnio_cta.id_mvmnto_dtlle%type;

v_sin_mvmnto        boolean;
v_sin_id_iac        boolean;
v_slio_dtlle        boolean;
v_actlza_estdo      boolean;

v_mnsje_rspsta      varchar2(4000);
v_txto              varchar2(4000);
v_cntdor            number;

v_archvo_log        varchar2(200);
v_archvo_cmmit      varchar2(200);
v_archvo_error      varchar2(200);
v_fcha_hra          varchar2(50);
v_error             varchar2(2);

v_vlor_cta          NUMBER(16,2);

v_vlor_vncdo_ttal   NUMBER(16,2);
v_rlcion_ctas       varchar2(500);

v_vlor_cta_ttal     NUMBER(16,2);
v_vlor_vncdo        NUMBER(16,2);

v_vlor_vncdo_cta    NUMBER(16,2);
v_vlor_cptal_cta    NUMBER(16,2);

v_id_cncpto_int_mra NUMBER(16,2);
v_id_cncpto_int_fnc NUMBER(16,2);
v_id_cncpto_int_vnc NUMBER(16,2);

v_vlor_cncpto_cptal   RE_G_DOCUMENTOS_CNVNIO_CTA.VLOR_DBE%type;
v_vlor_cncpto_intres  RE_G_DOCUMENTOS_CNVNIO_CTA.VLOR_DBE%type;
v_vlor_cncpto_fnccion RE_G_DOCUMENTOS_CNVNIO_CTA.VLOR_DBE%type;

begin
  v_fcha_hra       := to_char(SYSDATE,'yyyymmdd_hh24miss');

  v_archvo_log     := 'PRC_MIGRA_DOCUMENTOS_DD_017_LOG_'||v_fcha_hra||'.txt';
  v_archvo_cmmit   := 'PRC_MIGRA_DOCUMENTOS_DD_017_COMMIT_'||v_fcha_hra||'.txt';
  v_archvo_error   := 'PRC_MIGRA_DOCUMENTOS_DD_017_ERROR_'||v_fcha_hra||'.txt';

  v_txto := 'Iniciando proceso de registro de detalle documentos parte 2 CONVENIOS';

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

    v_txto := 'Procesando documentos (818): '||r1.id_intrmdia||'-('||r1.nmro_lnea||'), Doc: '||r1.clmna8||', Ref: '||r1.clmna7||'-'||r1.clmna43;
    GENESYS.sitpr001(v_txto, v_archvo_log);

    v_id_sjto_impsto  := r1.clmna40;
    v_id_dcmnto       := r1.clmna43;
    v_id_cnvnio       := r1.clmna42;

    v_vlor_vncdo_ttal := nvl(r1.clmna20, 0);

    if r1.clmna5 = -1 then

      v_rlcion_ctas := r1.clmna19;
    else

      v_rlcion_ctas := r1.clmna5;
    end if;

    v_error := 'OK';

    -- Calculando valor total de cuotas
    v_vlor_cta_ttal := 0;

    if v_vlor_vncdo_ttal > 0 then

      v_txto := 'Valor vencido: '||v_vlor_vncdo_ttal;
      GENESYS.sitpr001(v_txto, v_archvo_log);

      for r3 in c3(v_rlcion_ctas) loop

        for r10 in c10(v_id_cnvnio, r3.cuota) loop
          v_vlor_cta_ttal := v_vlor_cta_ttal + r10.vlor_ttal;
        end loop;

        v_txto := 'Valor cuota calculada: '||v_vlor_cta_ttal;
        GENESYS.sitpr001(v_txto, v_archvo_log);
      end loop;
    end if;

    -- Recorriendo las cuotas segun la relaci¿¿¿n

    for r3 in c3(v_rlcion_ctas) loop
      GENESYS.sitpr001('Cuota: '||r3.cuota,  v_archvo_log);

      v_vlor_vncdo_cta := 0;
      v_vlor_cptal_cta := 0;

      -- Calculando valor vencido para distribuir en cuota
      if v_vlor_cta_ttal > 0 and v_vlor_vncdo_ttal > 0 then

        for r10 in c10(v_id_cnvnio, r3.cuota) loop

          GENESYS.sitpr001('Valor Cuota: '||r10.vlor_ttal,  v_archvo_log);
          v_vlor_cta := r10.vlor_ttal;
        end loop;

        v_vlor_vncdo_cta := round((v_vlor_cta/v_vlor_cta_ttal)*v_vlor_vncdo_ttal, 0);

        for r4 in c4(r1.cdgo_clnte, v_id_cnvnio, r3.cuota) loop
          v_vlor_cptal_cta := v_vlor_cptal_cta + r4.vlor_cncpto_cptal;
        end loop;
      end if;

      GENESYS.sitpr001('v_vlor_cptal_cta: '||v_vlor_cptal_cta||', v_vlor_vncdo_cta: '||v_vlor_vncdo_cta,  v_archvo_log);

      -- insercion de registros de cartera por cuotas

      for r4 in c4(r1.cdgo_clnte, v_id_cnvnio, r3.cuota) loop
        -- consulta movimiento detalle

        v_sin_mvmnto        := true;
        v_sin_id_iac        := false;

        v_id_cncpto_int_mra := null;
        v_id_cncpto_int_fnc := null;
        v_id_cncpto_int_vnc := null;

        v_mnsje_rspsta := 'Procesnado S.I.: '||v_id_sjto_impsto||', Vig: '||r4.vgncia||', Id.P.:'||r4.id_prdo||', Id.C.:'||r4.id_cncpto ;
        GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);

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

        if not v_sin_mvmnto and not v_sin_id_iac then

          -- Creando registros de concepto x cuotas

          v_vlor_cncpto_cptal   := r4.vlor_cncpto_cptal;
          v_vlor_cncpto_intres  := r4.vlor_cncpto_intres;
          v_vlor_cncpto_fnccion := r4.vlor_cncpto_fnccion;
          v_vlor_vncdo          := 0;

          if r4.vlor_cncpto_cptal < 0 then   v_vlor_cncpto_cptal := 0;    end if;

          if r4.vlor_cncpto_intres < 0 then  v_vlor_cncpto_intres := 0;   end if;

          if r4.vlor_cncpto_fnccion < 0 then v_vlor_cncpto_fnccion := 0;  end if;

          -- Componente Capital
          begin
            insert into RE_G_DOCUMENTOS_CNVNIO_CTA
                  (id_dcmnto, id_cnvnio, nmro_cta, id_mvmnto_dtlle, id_cncpto, vlor_dbe)
            values(v_id_dcmnto, r4.id_cnvnio, r4.nmro_cta, v_id_mvmnto_dt_cta, r4.id_cncpto, v_vlor_cncpto_cptal);
          exception
            when others then
              v_mnsje_rspsta := 'Error en registo de Capital: '||r4.id_cncpto||'-'||sqlerrm;
              GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
              v_error := 'FC';
          end;

          -- Componente Interes Mora
          begin
            insert into RE_G_DOCUMENTOS_CNVNIO_CTA
                  (id_dcmnto, id_cnvnio, nmro_cta, id_mvmnto_dtlle, id_cncpto, vlor_dbe)
            values(v_id_dcmnto, r4.id_cnvnio, r4.nmro_cta, v_id_mvmnto_dt_cta, v_id_cncpto_int_mra, v_vlor_cncpto_intres);
          exception
            when others then
              v_mnsje_rspsta := 'Error en registo de I mora: '||r4.id_cncpto||'-'||sqlerrm;
              GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
              v_error := 'FI';
          end;

          -- Componente Interes Financiacion
          begin
            insert into RE_G_DOCUMENTOS_CNVNIO_CTA
                  (id_dcmnto, id_cnvnio, nmro_cta, id_mvmnto_dtlle, id_cncpto, vlor_dbe)
            values(v_id_dcmnto, r4.id_cnvnio, r4.nmro_cta, v_id_mvmnto_dt_cta, v_id_cncpto_int_fnc, v_vlor_cncpto_fnccion);
          exception
            when others then
              v_mnsje_rspsta := 'Error en registo de I Fina: '||r4.id_cncpto||'-'||sqlerrm;
              GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
              v_error := 'FF';
          end;

          if v_vlor_cptal_cta > 0 and v_vlor_vncdo_cta > 0 then
            v_vlor_vncdo := round((r4.vlor_cncpto_cptal/v_vlor_cptal_cta)*v_vlor_vncdo_cta, 0);

            if v_vlor_vncdo > 0 then

              -- Componente Interes Vencido
              begin
               insert into RE_G_DOCUMENTOS_CNVNIO_CTA
                     (id_dcmnto, id_cnvnio, nmro_cta, id_mvmnto_dtlle, id_cncpto, vlor_dbe)
               values(v_id_dcmnto, r4.id_cnvnio, r4.nmro_cta, v_id_mvmnto_dt_cta, v_id_cncpto_int_vnc, v_vlor_vncdo);
              exception
               when others then
                 v_mnsje_rspsta := 'Error en registo de I Ven: '||r4.id_cncpto||'-'||sqlerrm;
                 GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
                 v_error := 'FV';
              end;
            end if;
          end if;
        else

          v_error := 'SS';
          v_mnsje_rspsta := 'No hay MOV FIN para S.I.: '||v_id_sjto_impsto||', Vig: '||r4.vgncia||', Id.P.:'||r4.id_prdo||', Id.C.:'||r4.id_cncpto;
          GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
        end if;
      end loop;
    end loop;

    for r20 in c20(r1.cdgo_clnte, v_id_impsto, v_id_dcmnto) loop
      v_mnsje_rspsta := 'Procesando doc: '||r20.id_dcmnto||'-'||r20.id_mvmnto_dtlle||'-'||r20.id_cncpto ;
      GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_log);

      begin
        insert into RE_G_DOCUMENTOS_DETALLE
              (id_dcmnto, id_mvmnto_dtlle, id_cncpto,
               vlor_dbe, vlor_hber, bse_grvble, trfa, txto_trfa,
               cdgo_cncpto_tpo, id_dscnto_rgla, id_cncpto_rlcnal, prcntje_dscnto)
        values(r20.id_dcmnto, r20.id_mvmnto_dtlle, r20.id_cncpto,
               r20.ttal_dbe, 0, null, null, null,
               r20.tpo_cncpto, null, null, null);
      exception
        when others then
          v_mnsje_rspsta := v_cntdor||'-'|| r1.id_intrmdia ||' Entidad 818. No fue posible crear detalle documento concepto: ' ||v_id_dcmnto||'-'||r20.id_mvmnto_dtlle||'-'||r20.id_cncpto||' : '||sqlcode||'-'||sqlerrm;
          GENESYS.sitpr001(v_mnsje_rspsta, v_archvo_error);
          v_error := 'RD';
      end;
    end loop;

    -- *****************************************************************************

    begin
      update migra.mg_g_intermedia_documentos_p2 r
         set r.clmna30           = v_error
       where r.id_intrmdia       = r1.id_intrmdia
         and r.cdgo_clnte        = r1.cdgo_clnte
         and r.id_entdad         = r1.id_entdad;
    end;

    v_cntdor := v_cntdor + 1;

    if (v_cntdor/100) = trunc(v_cntdor/100) then

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

end PRC_MIGRA_DOCUMENTOS_DD_017;

/

