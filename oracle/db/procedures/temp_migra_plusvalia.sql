
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_MIGRA_PLUSVALIA" (P_NMRO_DCMNTO NUMBER,
                                                 P_VGNCIA      NUMBER,
                                                 P_RSPSTA      OUT VARCHAR2) is
  CURSOR C1 IS
    select a.*,
           (select c.id_bnco_cnta
              from DF_C_BANCOS_CUENTA c
             where c.id_bnco = a.id_bnco
               and c.nmro_cnta = nvl(a.nmro_cnta, 'Cuenta No Definida')) id_bnco_cnta
      from (select T.*,
                   I.drccion,
                   I.idntfccion_sjto,
                   decode(t.hcho_gnrdor,
                          'MAYOR APROVECHAMIENTO',
                          'PLU',
                          'INCORPORACION DE SUELO RURAL A URBANO',
                          'PIS',
                          'CAMBIO DE USO DE SUELO',
                          'PCS') cdgo_impsto_acto,
                   decode(t.hcho_gnrdor,
                          'MAYOR APROVECHAMIENTO',
                          '10',
                          'INCORPORACION DE SUELO RURAL A URBANO',
                          '179',
                          'CAMBIO DE USO DE SUELO',
                          '178') ID_impsto_acto,
                   (select x.id_bnco
                      from DF_C_BANCOS x
                     where nvl(x.CDGO_BNCO, 'null') =
                           nvl(ltrim(decode(t.cdgo_bnco,
                                            '55',
                                            '52',
                                            t.cdgo_bnco),
                                     '0'),
                               'null')) id_bnco
              from migra.MG_G_INTERMEDIA_PLUSVALIA t, V_SI_C_SUJETOS I
             where (I.idntfccion_sjto = T.RFRNCIA_CTSTRAL OR
                   I.idntfccion_antrior = T.RFRNCIA_CTSTRAL)
               AND (t.nmro_pgo = P_NMRO_DCMNTO or P_NMRO_DCMNTO is null)
               and t.mgrdo = 'N'
               and t.nmro_pgo is not null
               and t.fcha_pgo is not null
               and to_char(t.fcha_pgo, 'yyyy') = P_VGNCIA) a
     where a.id_bnco is not null;

  CURSOR C2(R_ID_SJTO_IMPSTO NUMBER) IS
    SELECT P.MTRCLA_INMBLRIA, R.PRMER_NMBRE
      FROM SI_I_PREDIOS P, SI_I_SUJETOS_RESPONSABLE R
     WHERE P.ID_SJTO_IMPSTO = R.ID_SJTO_IMPSTO
       AND P.ID_SJTO_IMPSTO = R_ID_SJTO_IMPSTO
       AND R.PRNCPAL_S_N = 'S';

  v_cdgo_clnte        number := 23001;
  v_id_impsto         number := 230019;
  v_id_impsto_sbmpsto number := 2300199;
  v_id_usrio          number := 230017;

  V_MTRCLA_INMBLRIA VARCHAR2(30);
  V_NMBRE           VARCHAR2(100);

  v_id_lqdcion            number;
  v_id_mvmnto_fncro       NUMBER;
  v_id_mnvmnto_dtlle      number;
  v_id_rcdo_cntrol        number;
  V_Id_Rcdo               NUMBER;
  v_id_prdo               number;
  v_id_sjto_impsto        number;
  v_cdgo_prdcdad          varchar2(3);
  v_id_impsto_acto_cncpto NUMBER;
  v_fcha_vncmnto          df_i_impuestos_acto_concepto.fcha_vncmnto%type;
  V_id_plsvlia_dtlle      NUMBER;

  o_id_dcmnto   number;
  o_nmro_dcmnto number;
  o_cdgo_rspsta number;

begin

  FOR R1 IN C1 LOOP
    v_id_sjto_impsto := NULL;
    P_RSPSTA         := NULL;

    TEMP_CREA_PRDIO_PLU(P_RFRNCIA_CTSTRAL    => R1.idntfccion_sjto,
                        P_MNSJE              => P_RSPSTA,
                        P_ID_SJTO_IMPSTO_PLU => v_id_sjto_impsto);

    FOR R2 IN C2(v_id_sjto_impsto) LOOP
      V_MTRCLA_INMBLRIA := R2.MTRCLA_INMBLRIA;
      V_NMBRE           := R2.PRMER_NMBRE;
    END LOOP;

    IF v_id_sjto_impsto IS NOT NULL THEN
      --plusvalia

      V_id_plsvlia_dtlle := sq_gi_g_plusvalia_procso_dtlle.nextval;
      insert into gi_g_plusvalia_procso_dtlle
        (id_plsvlia_dtlle,
         id_prcso_plsvlia,
         cdgo_prdial,
         area_objto,
         mtrcla_inmblria,
         prptrio,
         vlor_p1,
         vlor_p2,
         drccion,
         hcho_gnrdor,
         prdio_fra_estdio,
         vlor_plsvlia_actlzda,
         rgstro_error,
         dscrpcion_error,
         estdo_rgstro,
         id_sjto_impsto,
         id_lqdcion,
         tpo_plsvlia,
         trfa,
         VLOR_PLSVLIA_IPC,
         udp,
         FCHA_RGSTRO,
         ID_impsto_acto,
         TXTO_TRFA)
      values
        (V_id_plsvlia_dtlle,
         1,
         R1.IDNTFCCION_SJTO,
         R1.AREA_OBJTO,
         V_MTRCLA_INMBLRIA, --reg.mtrcla_inmblria,
         V_NMBRE, --reg.prptrio,
         R1.VLOR_P1,
         R1.VLOR_P2,
         R1.DRCCION, --reg.drccion,
         R1.HCHO_GNRDOR,
         null,
         r1.vlor_plsvlia,
         'N',
         null,
         'P',
         v_id_sjto_impsto,
         NULL,
         'A',
         r1.trfa / 100,
         R1.VLOR_LQDDO,
         regexp_replace(R1.UDP, '[^0-9]', ''),
         R1.FCHA_PGO,
         R1.ID_impsto_acto,
         r1.trfa || '%');

      select a.id_prdo, a.cdgo_prdcdad
        into v_id_prdo, v_cdgo_prdcdad
        from df_i_periodos a
       where a.cdgo_clnte = v_cdgo_clnte
         and a.id_impsto = v_id_impsto
         and a.id_impsto_sbmpsto = v_id_impsto_sbmpsto
         and a.vgncia = TO_CHAR(R1.FCHA_PGO, 'YYYY')
         and a.prdo = 1
         and a.cdgo_prdcdad = 'ANU';

      select a.id_impsto_acto_cncpto, a.fcha_vncmnto
        into v_id_impsto_acto_cncpto, v_fcha_vncmnto
        from df_i_impuestos_acto_concepto a
       where a.cdgo_clnte = v_cdgo_clnte
         and a.vgncia = to_char(r1.fcha_pgo, 'yyyy')
         and a.id_prdo = v_id_prdo
         and a.id_cncpto = 49
         and exists
       (select 1
                from df_i_impuestos_acto b
               where b.id_impsto = v_id_impsto
                 and b.id_impsto_sbmpsto = v_id_impsto_sbmpsto
                 and b.cdgo_impsto_acto = R1.cdgo_impsto_acto
                 and a.id_impsto_acto = b.id_impsto_acto);

      pkg_gi_plusvalia.prc_ac_plusvalia(V_cdgo_clnte,
                                        V_id_plsvlia_dtlle,
                                        v_id_prdo,
                                        v_mtrcla_inmblria,
                                        r1.idntfccion_sjto,
                                        v_id_impsto,
                                        v_id_impsto_sbmpsto,
                                        v_id_sjto_impsto,
                                        v_id_usrio,
                                        null,
                                        'A',
                                        o_id_dcmnto,
                                        o_nmro_dcmnto,
                                        o_cdgo_rspsta,
                                        P_RSPSTA);

      -- se actualizan los datos
      /* o_id_dcmnto        := 6498663;
      o_nmro_dcmnto      := 20210063871;
      V_id_plsvlia_dtlle := 571;*/

      UPDATE gi_g_plusvalia_procso_dtlle D
         SET D.ID_DCMNTO        = o_id_dcmnto,
             D.VLOR_PLSVLIA_IPC =
             (R1.VLOR_LQDDO * 100 / 30)
       WHERE D.ID_PLSVLIA_DTLLE = V_id_plsvlia_dtlle;

      update re_g_documentos d
         set d.nmro_dcmnto        = r1.nmro_pgo,
             D.VLOR_TTAL          = R1.VLOR_LQDDO,
             D.VLOR_TTAL_DBE      = R1.VLOR_LQDDO,
             D.VLOR_TTAL_DCMNTO   = R1.VLOR_LQDDO,
             D.FCHA_DCMNTO        = R1.FCHA_PGO,
             D.FCHA_VNCMNTO       = R1.FCHA_PGO,
             d.indcdor_pgo_aplcdo = 'S'
       where d.id_dcmnto = o_id_dcmnto;

      update Re_g_Documentos_Detalle d
         set D.VLOR_DBE = R1.VLOR_LQDDO
       where d.id_dcmnto = o_id_dcmnto;

      SELECT d.id_lqdcion
        into v_id_lqdcion
        FROM gi_g_plusvalia_procso_dtlle D
       WHERE D.ID_PLSVLIA_DTLLE = V_id_plsvlia_dtlle;

      update gi_g_liquidaciones d
         set d.vgncia       = to_char(r1.fcha_pgo, 'yyyy'),
             d.id_prdo      = v_id_prdo,
             d.bse_grvble   = r1.vlor_lqddo,
             d.vlor_ttal    = r1.vlor_lqddo,
             d.fcha_lqdcion = r1.fcha_pgo
       where d.id_lqdcion = v_id_lqdcion;

      update gi_g_liquidaciones_concepto d
         set d.vlor_lqddo            = r1.vlor_lqddo,
             d.bse_cncpto            = r1.vlor_lqddo,
             d.vlor_clcldo           = r1.vlor_lqddo,
             d.fcha_vncmnto          = v_fcha_vncmnto,
             d.id_impsto_acto_cncpto = v_id_impsto_acto_cncpto
       where d.id_lqdcion = v_id_lqdcion;

      update GF_G_MOVIMIENTOS_FINANCIERO f
         set f.vgncia      = to_char(r1.fcha_pgo, 'yyyy'),
             f.id_prdo     = v_id_prdo,
             f.fcha_mvmnto = r1.fcha_pgo
       where f.id_orgen = v_id_lqdcion;

      update GF_G_MOVIMIENTOS_DETALLE f
         set f.vgncia       = to_char(r1.fcha_pgo, 'yyyy'),
             f.id_prdo      = v_id_prdo,
             f.fcha_mvmnto  = r1.fcha_pgo,
             f.vlor_dbe     = r1.vlor_lqddo,
             f.fcha_vncmnto = v_fcha_vncmnto
       where f.id_orgen = v_id_lqdcion;

      pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte     => v_cdgo_clnte,
                                                                p_id_sjto_impsto => v_id_sjto_impsto);

      --  registra el lote recaudo
      insert into re_g_recaudos_control
        (cdgo_clnte,
         id_impsto,
         id_impsto_sbmpsto,
         id_bnco,
         id_bnco_cnta,
         fcha_cntrol,
         obsrvcion,
         cntdad_rcdos,
         vlor_rcdos,
         cdgo_rcdo_orgen,
         id_prcso_crga,
         id_usrio,
         fcha_rgstro)
      values
        (v_cdgo_clnte,
         v_id_impsto,
         v_id_impsto_sbmpsto,
         r1.id_bnco,
         r1.id_bnco_cnta,
         to_date(r1.fcha_pgo, 'dd/mm/yyyy hh24:mi:ss'),
         'PAGO MIGRADO PLUSVALIA',
         1,
         R1.VLOR_LQDDO,
         'AC',
         null,
         v_id_usrio,
         to_date(r1.fcha_pgo, 'dd/mm/yyyy hh24:mi:ss'))
      returning ID_RCDO_CNTROL into v_id_rcdo_cntrol;

      --REGISTRA EL RECAUDO
      insert into re_g_recaudos
        (id_rcdo_cntrol,
         id_sjto_impsto,
         cdgo_rcdo_orgn_tpo,
         id_orgen,
         fcha_rcdo,
         fcha_ingrso_bnco,
         vlor,
         obsrvcion,
         cdgo_frma_pgo,
         cdgo_rcdo_estdo,
         fcha_apliccion,
         mnsje_rspsta,
         id_usrio_aplco,
         id_sldo_fvor,
         id_cnvnio,
         nmro_dcmnto)
      values
        (v_id_rcdo_cntrol,
         v_id_sjto_impsto,
         'DC',
         o_id_dcmnto,
         to_date(r1.Fcha_Pgo, 'dd/mm/yyyy hh24:mi:ss'),
         to_date(r1.Fcha_Pgo, 'dd/mm/yyyy hh24:mi:ss'),
         r1.Vlor_Lqddo,
         'PAGO MIGRADO IMPLUS - PLUSVALIA',
         'EF',
         'AP',
         to_date(r1.Fcha_Pgo, 'dd/mm/yyyy hh24:mi:ss'),
         'Documento normal aplicado con exito.',
         V_id_usrio,
         NULL,
         NULL,
         r1.nmro_pgo)
      returning Id_Rcdo into v_id_rcdo;

      select d.id_mvmnto_fncro
        into v_id_mvmnto_fncro
        from gf_g_movimientos_detalle d
       where d.id_orgen = v_id_lqdcion;

      --REGISTRA EL MOVIMIENTO DETALLE
      v_id_mnvmnto_dtlle := SQ_GF_G_MOVIMIENTOS_DETALLE.Nextval;
      insert into gf_g_movimientos_detalle
        (id_mvmnto_dtlle,
         id_mvmnto_fncro,
         cdgo_mvmnto_orgn,
         id_orgen,
         cdgo_mvmnto_tpo,
         vgncia,
         id_prdo,
         cdgo_prdcdad,
         fcha_mvmnto,
         id_cncpto,
         id_cncpto_csdo,
         vlor_dbe,
         vlor_hber,
         actvo,
         gnra_intres_mra,
         fcha_vncmnto,
         id_impsto_acto_cncpto,
         indcdor_mgrdo)
      values
        (v_id_mnvmnto_dtlle,
         v_id_mvmnto_fncro,
         'RE',
         v_id_rcdo,
         'PC',
         TO_CHAR(R1.FCHA_PGO, 'YYYY'),
         v_id_prdo,
         v_cdgo_prdcdad,
         R1.FCHA_PGO,
         49,
         49,
         0,
         R1.VLOR_LQDDO,
         'S',
         'N',
         v_fcha_vncmnto,
         v_id_impsto_acto_cncpto,
         'S');

      pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte     => v_cdgo_clnte,
                                                                p_id_sjto_impsto => v_id_sjto_impsto);

      UPDATE MIGRA.MG_G_INTERMEDIA_PLUSVALIA T
         SET T.MGRDO = 'S'
       WHERE T.ID_INTRMDIA = R1.ID_INTRMDIA;
      commit;
    else
      P_RSPSTA := 'NO SE PUDO CREAR EL SUJETO IMPUESTO';
    end if;
  END LOOP;
end TEMP_MIGRA_PLUSVALIA;
/

