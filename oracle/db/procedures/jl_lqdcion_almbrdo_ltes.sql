
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_LQDCION_ALMBRDO_LTES" (p_vgncia          number,
                                                    p_rfrncia_ctstral varchar) is

  cursor c1(r_id_impsto number, r_id_prdo number) is
    select a.*,
           d.idntfccion idntfccion_sjto,
           d.cdgo_clnte,
           nvl(f.avluo_ctstral, c.avluo_ctstral) avluo_ctstral,
           '1/1000' txto_trfa,
           round(c.avluo_ctstral * 1 / 1000, -3) vlor_lqddo
      from si_i_sujetos_impuesto a
      join si_i_sujetos_responsable b
        on b.id_sjto_impsto = a.id_sjto_impsto
      join si_i_predios c
        on c.id_sjto_impsto = a.id_sjto_impsto
      left join si_h_predios f
        on f.id_sjto_impsto = a.id_sjto_impsto
       and f.id_prdo = r_id_prdo
      join si_c_sujetos d
        on d.id_sjto = a.id_sjto
     where a.id_impsto = r_id_impsto
       and a.id_sjto_estdo = 1
       and b.prncpal_s_n = 'S'
       and c.id_prdio_dstno in (78, 79, 80)
       and b.idntfccion not in
           ('8000967341', '800096734', '800096734100', '800096734-1')
       and b.prmer_nmbre not in ('MUNICIPIO DE MONTERIA')
          -- and (d.idntfccion = p_rfrncia_ctstral or p_rfrncia_ctstral is null)
       and round(c.avluo_ctstral * 1 / 1000, -3) > 0
     order by d.idntfccion;

  cursor c2(r_id_impsto number, r_idntfccion_sjto varchar2) is
    select a.id_sjto_impsto, b.id_lqdcion
      from v_si_i_sujetos_impuesto a
      left join gi_g_liquidaciones b
        on b.id_sjto_impsto = a.id_sjto_impsto
       and b.cdgo_lqdcion_estdo = 'L'
       and b.vgncia = p_vgncia
     where a.id_impsto = r_id_impsto
       and a.idntfccion_sjto = r_idntfccion_sjto;

  cursor c3(r_id_sjto_impsto number) is
    select *
      from si_i_sujetos_responsable a
     where a.id_sjto_impsto = r_id_sjto_impsto;

  cursor c4(r_id_sjto_impsto number, r_id_impsto number) is
    select a.*, b.id_prdio_dstno id_prdio_dstno_almbrdo
      from si_i_predios a
      join gi_d_predios_calculo_destino b
        on b.cdgo_dstno_igac = a.cdgo_dstno_igac
       and b.id_impsto = r_id_impsto
       and b.cdgo_prdio_clsfccion = a.cdgo_prdio_clsfccion
       and to_date(p_vgncia || '0201', 'yyyymmdd') between b.fcha_incial and
           b.fcha_fnal
     where a.id_sjto_impsto = r_id_sjto_impsto;

  v_id_impsto_prdial          number := 230011;
  v_id_impsto_almbrdo         number := 230015;
  v_id_impsto_sbmpsto_almbrdo number := 2300155;

  v_id_sjto_impsto_almbrdo number;
  v_id_lqdcion             number;
  v_id_sjto_rspnsble       number;
  v_id_lqdcion_almbrdo     number;
  v_id_prdo                number;
  v_fcha_vncmnto           date;
  v_id_impsto_acto_cncpto  number;

  v_json_sjto_impsto json_object_t;
  v_json_resp        json_object_t;

  o_cdgo_rspsta  number;
  o_mnsje_rspsta varchar2(4000);

begin

  select a.id_prdo
    into v_id_prdo
    from df_i_periodos a
   where a.id_impsto = v_id_impsto_almbrdo
     and a.vgncia = p_vgncia;

  select a.id_impsto_acto_cncpto, a.fcha_vncmnto
    into v_id_impsto_acto_cncpto, v_fcha_vncmnto
    from df_i_impuestos_acto_concepto a
   where a.id_prdo = v_id_prdo
     and a.vgncia = p_vgncia;

  for r1 in c1(v_id_impsto_prdial, v_id_prdo) loop
    v_id_sjto_impsto_almbrdo := null;
    v_id_lqdcion             := null;
    for r2 in c2(v_id_impsto_almbrdo, r1.idntfccion_sjto) loop
      v_id_sjto_impsto_almbrdo := r2.id_sjto_impsto;
      v_id_lqdcion             := r2.id_lqdcion;
    end loop;

    if v_id_sjto_impsto_almbrdo is null then
      v_json_sjto_impsto := new json_object_t();

      v_json_sjto_impsto.put('cdgo_clnte', r1.cdgo_clnte);
      v_json_sjto_impsto.put('id_sjto_impsto', '');
      v_json_sjto_impsto.put('id_sjto', r1.id_sjto);
      v_json_sjto_impsto.put('id_impsto', v_id_impsto_almbrdo);
      v_json_sjto_impsto.put('id_pais', r1.id_pais_ntfccion);
      v_json_sjto_impsto.put('id_dprtmnto_ntfccion',
                             r1.id_dprtmnto_ntfccion);
      v_json_sjto_impsto.put('id_mncpio_ntfccion', r1.id_mncpio_ntfccion);
      v_json_sjto_impsto.put('drccion_ntfccion', r1.drccion_ntfccion);
      v_json_sjto_impsto.put('email', r1.email);
      v_json_sjto_impsto.put('tlfno', r1.tlfno);
      v_json_sjto_impsto.put('id_usrio', r1.id_usrio);

      pkg_si_sujeto_impuesto.prc_rg_sujeto_impuesto(p_json           => v_json_sjto_impsto,
                                                    o_id_sjto_impsto => v_id_sjto_impsto_almbrdo,
                                                    o_cdgo_rspsta    => o_cdgo_rspsta,
                                                    o_mnsje_rspsta   => o_mnsje_rspsta);

      if o_cdgo_rspsta <> 0 then
        rollback;
        raise_application_error(-20001,
                                'Error creando el sujeto impuesto: ' ||
                                r1.id_sjto_impsto || ': ' || o_mnsje_rspsta);
      end if;

      --responsables
      for r3 in c3(r1.id_sjto_impsto) loop
        v_json_resp := new json_object_t();

        -- 2. llenar el json según las claves que lee el prc
        v_json_resp.put('cdgo_clnte', r1.cdgo_clnte);
        v_json_resp.put('id_sjto_rspnsble', '');
        v_json_resp.put('id_sjto_impsto', v_id_sjto_impsto_almbrdo);
        v_json_resp.put('cdgo_idntfccion_tpo', r3.cdgo_idntfccion_tpo);
        v_json_resp.put('idntfccion', r3.idntfccion);
        v_json_resp.put('prmer_nmbre', r3.prmer_nmbre);
        v_json_resp.put('sgndo_nmbre', r3.sgndo_nmbre);
        v_json_resp.put('prmer_aplldo', r3.prmer_aplldo);
        v_json_resp.put('sgndo_aplldo', r3.sgndo_aplldo);
        v_json_resp.put('prncpal', r3.prncpal_s_n);
        v_json_resp.put('cdgo_tpo_rspnsble', r3.cdgo_tpo_rspnsble);
        v_json_resp.put('id_pais_ntfccion', r3.id_pais_ntfccion);
        v_json_resp.put('id_dprtmnto_ntfccion', r3.id_dprtmnto_ntfccion);
        v_json_resp.put('id_mncpio_ntfccion', r3.id_mncpio_ntfccion);
        v_json_resp.put('drccion_ntfccion', r3.drccion_ntfccion);
        v_json_resp.put('email', r3.email);
        v_json_resp.put('tlfno', r3.tlfno);
        v_json_resp.put('cllar', r3.cllar);
        v_json_resp.put('actvo', r3.actvo);
        v_json_resp.put('id_trcro', r3.id_trcro);

        pkg_si_sujeto_impuesto.prc_rg_sujetos_responsable(p_json             => v_json_resp,
                                                          o_id_sjto_rspnsble => v_id_sjto_rspnsble,
                                                          o_cdgo_rspsta      => o_cdgo_rspsta,
                                                          o_mnsje_rspsta     => o_mnsje_rspsta);

        if o_cdgo_rspsta <> 0 then
          rollback;
          raise_application_error(-20002,
                                  'Error insertando Responsable (ID Sujeto: ' ||
                                  r3.id_sjto_impsto || ', Identificación: ' ||
                                  r3.idntfccion || '): ' || o_mnsje_rspsta);
        end if;
      end loop;
      --predio

      for r4 in c4(r1.id_sjto_impsto, v_id_impsto_almbrdo) loop
        insert into si_i_predios
          (id_sjto_impsto,
           id_prdio_dstno,
           cdgo_estrto,
           cdgo_dstno_igac,
           cdgo_prdio_clsfccion,
           id_prdio_uso_slo,
           avluo_ctstral,
           avluo_cmrcial,
           area_trrno,
           area_cnstrda,
           area_grvble,
           indcdor_prdio_mncpio,
           bse_grvble,
           cdgo_prdio_tpo,
           mtrcla_inmblria,
           pro_indvso,
           avluo_trrno,
           avluo_cnstrccion,
           uso_cnstrccion,
           lttud,
           lngtud)
        values
          (v_id_sjto_impsto_almbrdo,
           r4.id_prdio_dstno_almbrdo,
           r4.cdgo_estrto,
           r4.cdgo_dstno_igac,
           r4.cdgo_prdio_clsfccion,
           r4.id_prdio_uso_slo,
           r4.avluo_ctstral,
           r4.avluo_ctstral,
           r4.area_trrno,
           r4.area_cnstrda,
           r4.area_grvble,
           'S',
           r4.bse_grvble,
           r4.cdgo_prdio_tpo,
           r4.mtrcla_inmblria,
           nvl(r4.pro_indvso, 0),
           nvl(r4.avluo_trrno, 0),
           nvl(r4.avluo_cnstrccion, 0),
           r4.uso_cnstrccion,
           r4.lttud,
           r4.lngtud);
      end loop;
    end if;

    commit;

    if v_id_lqdcion is null then
      insert into gi_g_liquidaciones
        (cdgo_clnte,
         id_impsto,
         id_impsto_sbmpsto,
         vgncia,
         id_prdo,
         id_sjto_impsto,
         fcha_lqdcion,
         cdgo_lqdcion_estdo,
         bse_grvble,
         vlor_ttal,
         id_prcso_crga,
         id_lqdcion_tpo,
         id_ttlo_ejctvo,
         cdgo_prdcdad,
         id_lqdcion_antrior,
         id_usrio)
      values
        (r1.cdgo_clnte,
         v_id_impsto_almbrdo,
         v_id_impsto_sbmpsto_almbrdo,
         p_vgncia,
         v_id_prdo,
         v_id_sjto_impsto_almbrdo,
         sysdate,
         'L',
         r1.avluo_ctstral,
         r1.vlor_lqddo,
         null,
         4,
         0,
         'ANU',
         null,
         230017)
      returning id_lqdcion into v_id_lqdcion_almbrdo;

      insert into gi_g_liquidaciones_concepto
        (id_lqdcion,
         id_impsto_acto_cncpto,
         vlor_lqddo,
         vlor_clcldo,
         trfa,
         bse_cncpto,
         txto_trfa,
         vlor_intres,
         indcdor_lmta_impsto,
         fcha_vncmnto)
      values
        (v_id_lqdcion_almbrdo,
         v_id_impsto_acto_cncpto,
         r1.vlor_lqddo,
         r1.vlor_lqddo,
         1,
         r1.avluo_ctstral,
         r1.txto_trfa,
         0,
         'N',
         v_fcha_vncmnto);

      for r4 in c4(v_id_sjto_impsto_almbrdo, v_id_impsto_almbrdo) loop

        insert into gi_g_liquidaciones_ad_predio
          (id_lqdcion,
           cdgo_prdio_clsfccion,
           id_prdio_uso_slo,
           id_prdio_dstno,
           cdgo_estrto,
           area_trrno,
           area_cnsctrda,
           area_grvble)
        values
          (v_id_lqdcion_almbrdo,
           r4.cdgo_prdio_clsfccion,
           r4.id_prdio_uso_slo,
           r4.id_prdio_dstno,
           r4.cdgo_estrto,
           r4.area_trrno,
           r4.area_cnstrda,
           r4.area_grvble);
      end loop;

      commit;

      pkg_gf_movimientos_financiero.prc_gn_paso_liquidacion_mvmnto(p_cdgo_clnte        => r1.cdgo_clnte,
                                                                   p_id_lqdcion        => v_id_lqdcion_almbrdo,
                                                                   p_cdgo_orgen_mvmnto => 'LQ',
                                                                   p_id_orgen_mvmnto   => v_id_lqdcion_almbrdo,
                                                                   o_cdgo_rspsta       => o_cdgo_rspsta,
                                                                   o_mnsje_rspsta      => o_mnsje_rspsta);

      if o_cdgo_rspsta <> 0 then
        rollback;
        -- detiene todo y muestra el error. usamos -20002 para diferenciarlo del anterior.
        raise_application_error(-20002,
                                'Error creando el movimiento financiero ID liquidación: ' ||
                                v_id_lqdcion_almbrdo ||
                                ', Identificación: ' || r1.idntfccion_sjto ||
                                ' - ' || o_cdgo_rspsta || ':' ||
                                o_mnsje_rspsta);
      end if;

    end if;

    commit;

  end loop;

end jl_lqdcion_almbrdo_ltes;
/

