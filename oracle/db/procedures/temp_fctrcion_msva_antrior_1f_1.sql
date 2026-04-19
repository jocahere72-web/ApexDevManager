
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_FCTRCION_MSVA_ANTRIOR_1F_1" (p_lote number) is

  cursor c1 is
    select d.id_sjto_impsto,
           d.id_dcmnto,
           d.nmro_dcmnto,
           d.fcha_vncmnto,
           i.idntfccion_sjto,
           p.mtrcla_inmblria,
           i.drccion,
           i.drccion_ntfccion,
           p.area_trrno,
           p.area_cnstrda,
           p.avluo_ctstral,
           p.dscrpcion_prdo_dstno,
           p.dscrpcion_estrto,
           r.idntfccion id_rspnsble,
           r.cdgo_idntfccion_tpo,
           r.prmer_nmbre,
           s.cdgo_ean
      from re_g_documentos d
      join v_si_i_sujetos_impuesto i
        on i.id_sjto_impsto = d.id_sjto_impsto
      join si_i_sujetos_responsable r
        on r.id_sjto_impsto = d.id_sjto_impsto
       and r.prncpal_s_n = 'S'
      join v_si_i_predios p
        on p.id_sjto_impsto = d.id_sjto_impsto
      join df_i_impuestos_subimpuesto s
        on s.id_impsto_sbmpsto = d.id_impsto_sbmpsto
     where d.id_dcmnto_lte = p_lote
    --   and d.id_dcmnto=7331788
     order by d.nmro_dcmnto;

  cursor c2(r_id_sjto_impsto number) is
    select b.txto_trfa
      from gi_g_liquidaciones a
      join gi_g_liquidaciones_concepto b
        on b.id_lqdcion = a.id_lqdcion
       and b.id_impsto_acto_cncpto = 7889
     where a.id_sjto_impsto = r_id_sjto_impsto
       and a.vgncia = 2025
       and a.cdgo_lqdcion_estdo = 'L';

  cursor c3(r_id_dcmnto number) is
    select listagg(vgncia, ', ') within group(order by vgncia desc) vgncias_rcbo
      from (select d.id_sjto_impsto, d.vgncia
              from v_re_g_documentos_detalle d
             where d.id_dcmnto = r_id_dcmnto
             group by d.id_sjto_impsto, d.vgncia);

  cursor c4(r_id_sjto_impsto number) is
    SELECT LISTAGG(vgncia, ', ') WITHIN GROUP(ORDER BY vgncia desc) vgncias_dda
      FROM v_gf_g_cartera_x_vigencia D
     where d.id_sjto_impsto = r_id_sjto_impsto
       and d.cdgo_mvnt_fncro_estdo in ('NO', 'CV')
       and d.vlor_sldo_cptal > 0;

  cursor c5(r_id_dcmnto     number,
            r_vgncia_incial number,
            r_vgncia_fnal   number,
            r_cdgo_cncpto   varchar2) is
    select sum(decode(d.cdgo_cncpto_tpo, 'C', d.vlor_dbe, 0)) capital,
           sum(decode(d.cdgo_cncpto_tpo, 'I', d.vlor_dbe, 0)) interes,
           sum(decode(d.cdgo_cncpto_tpo, 'D', d.vlor_hber, 0)) descuentos
      from v_re_g_documentos_detalle d
     where d.id_dcmnto = r_id_dcmnto
       and d.vgncia between r_vgncia_incial and r_vgncia_fnal
       and (d.cdgo_cncpto_rlcnal = r_cdgo_cncpto or r_cdgo_cncpto is null);

  cursor c6(r_id_sjto_impsto number) is
    select *
      from (select r.fcha_rcdo, r.nmro_dcmnto, c.nmbre_bnco, r.vlor
              from re_g_recaudos r
              join v_re_g_recaudos_control c
                on c.id_rcdo_cntrol = r.id_rcdo_cntrol
             where r.id_sjto_impsto = r_id_sjto_impsto
             order by r.fcha_rcdo desc)
     where rownum = 1;

  v_trfa         gi_g_liquidaciones_concepto.txto_trfa%type;
  v_vgncias_rcbo varchar2(300);
  v_vgncias_dda  varchar2(300);

  v_cptal_vgncia_antrior   number;
  v_intres_vgncia_antrior  number;
  v_dscntos_vgncia_antrior number;
  v_ttal_vgncia_antrior    number;

  v_prdial_cptal_actual  number;
  v_prdial_intres_actual number;
  v_prdial_dscnto_actual number;
  v_prdial_ttal_actual   number;

  v_prdial_dscnto_inter_actual number;

  v_bmbros_cptal_actual  number;
  v_bmbros_intres_actual number;
  v_bmbros_dscnto_actual number;
  v_bmbros_ttal_actual   number;

  v_actual_ttal_cptal  number;
  v_actual_ttal_intres number;
  v_actual_ttal_dscnto number;
  v_actual_ttal_ttal   number;

  v_ttal_cptal  number;
  v_ttal_intres number;
  v_ttal_dscnto number;
  v_ttal_pgar   number;

  v_sldo_pgar number;

  v_txto_cdgo_brras varchar2(200);
  v_cdgo_brras      varchar2(200);

  v_fcha_up        timestamp;
  v_nmro_dcmnto_up number;
  v_bnco_up        varchar2(50);
  v_vlor_up        number;

begin

  delete from impresion_masiva_v_antrior t where t.id_lote = p_lote;
  commit;
  for r1 in c1 loop
    v_trfa         := 'N/A';
    v_vgncias_dda  := null;
    v_vgncias_rcbo := null;

    v_cptal_vgncia_antrior   := 0;
    v_intres_vgncia_antrior  := 0;
    v_dscntos_vgncia_antrior := 0;
    v_ttal_vgncia_antrior    := 0;

    v_prdial_cptal_actual  := 0;
    v_prdial_intres_actual := 0;
    v_prdial_dscnto_actual := 0;
    v_prdial_ttal_actual   := 0;

    v_prdial_dscnto_inter_actual := 0;

    v_bmbros_cptal_actual  := 0;
    v_bmbros_intres_actual := 0;
    v_bmbros_dscnto_actual := 0;
    v_bmbros_ttal_actual   := 0;

    v_actual_ttal_cptal  := 0;
    v_actual_ttal_intres := 0;
    v_actual_ttal_dscnto := 0;
    v_actual_ttal_ttal   := 0;

    v_ttal_cptal  := 0;
    v_ttal_intres := 0;
    v_ttal_dscnto := 0;
    v_ttal_pgar   := 0;

    v_sldo_pgar := 0;

    v_fcha_up        := null;
    v_nmro_dcmnto_up := null;
    v_bnco_up        := null;
    v_vlor_up        := null;

    for r2 in c2(r1.id_sjto_impsto) loop
      v_trfa := r2.txto_trfa;
    end loop;

    for r3 in c3(r1.id_dcmnto) loop
      v_vgncias_rcbo := r3.vgncias_rcbo;
    end loop;

    for r4 in c4(r1.Id_Sjto_Impsto) loop
      v_vgncias_dda := r4.vgncias_dda;
    end loop;

    for r5 in c5(r1.id_dcmnto, 1989, 2025, null) loop
      v_cptal_vgncia_antrior   := r5.capital;
      v_intres_vgncia_antrior  := r5.interes;
      v_dscntos_vgncia_antrior := r5.descuentos;
    end loop;

    v_cptal_vgncia_antrior   := nvl(v_cptal_vgncia_antrior, 0);
    v_intres_vgncia_antrior  := nvl(v_intres_vgncia_antrior, 0);
    v_dscntos_vgncia_antrior := nvl(v_dscntos_vgncia_antrior, 0);
    v_ttal_vgncia_antrior    := v_cptal_vgncia_antrior +
                                v_intres_vgncia_antrior -
                                v_dscntos_vgncia_antrior;

    for r5_p in c5(r1.id_dcmnto, 2025, 2025, '1020') loop
      v_prdial_cptal_actual  := r5_p.capital;
      v_prdial_dscnto_actual := r5_p.descuentos;
    end loop;

    for r5_pI in c5(r1.id_dcmnto, 2025, 2025, '1520') loop
      v_prdial_intres_actual       := r5_pi.interes;
      v_prdial_dscnto_inter_actual := r5_pI.descuentos;

    end loop;

    v_prdial_cptal_actual        := nvl(v_prdial_cptal_actual, 0);
    v_prdial_dscnto_actual       := nvl(v_prdial_dscnto_actual, 0);
    v_prdial_intres_actual       := nvl(v_prdial_intres_actual, 0);
    v_prdial_dscnto_inter_actual := nvl(v_prdial_dscnto_inter_actual, 0);

    v_prdial_ttal_actual := v_prdial_cptal_actual + v_prdial_intres_actual -
                            v_prdial_dscnto_inter_actual;

    for r5_b in c5(r1.id_dcmnto, 2025, 2025, '1009') loop
      v_bmbros_cptal_actual := r5_b.capital;

      v_bmbros_dscnto_actual := r5_b.descuentos;
    end loop;

    for r5_bi in c5(r1.id_dcmnto, 2025, 2025, '1509') loop
      v_bmbros_intres_actual := r5_bi.interes;
    end loop;

    for r6 in c6(r1.Id_Sjto_Impsto) loop
      v_fcha_up        := r6.fcha_rcdo;
      v_nmro_dcmnto_up := r6.nmro_dcmnto;
      v_bnco_up        := r6.nmbre_bnco;
      v_vlor_up        := r6.vlor;
    end loop;

    v_bmbros_cptal_actual  := nvl(v_bmbros_cptal_actual, 0);
    v_bmbros_dscnto_actual := nvl(v_bmbros_dscnto_actual, 0);
    v_bmbros_ttal_actual   := nvl(v_bmbros_ttal_actual, 0);
    v_bmbros_intres_actual := nvl(v_bmbros_intres_actual, 0);

    v_bmbros_ttal_actual := v_bmbros_cptal_actual + v_bmbros_intres_actual -
                            v_bmbros_dscnto_actual;

    v_actual_ttal_cptal  := v_prdial_cptal_actual + v_bmbros_cptal_actual;
    v_actual_ttal_intres := v_prdial_intres_actual + v_bmbros_intres_actual;
    v_actual_ttal_dscnto := v_prdial_dscnto_actual + v_bmbros_dscnto_actual;
    v_actual_ttal_ttal   := v_actual_ttal_cptal + v_actual_ttal_intres -
                            v_actual_ttal_dscnto;

    v_ttal_cptal  := v_actual_ttal_cptal + v_cptal_vgncia_antrior;
    v_ttal_intres := v_actual_ttal_intres + v_intres_vgncia_antrior;
    v_ttal_dscnto := v_actual_ttal_dscnto + v_dscntos_vgncia_antrior;
    v_ttal_pgar   := v_ttal_vgncia_antrior; ---v_actual_ttal_ttal + v_ttal_vgncia_antrior;

    v_sldo_pgar := v_ttal_cptal + v_ttal_intres;

    v_txto_cdgo_brras := pkgbarcode.funcadfac(null,
                                              null,
                                              null,
                                              r1.nmro_dcmnto,
                                              v_ttal_pgar,
                                              trunc(r1.fcha_vncmnto),
                                              r1.cdgo_ean,
                                              'S');

    v_cdgo_brras := PKGBARCODE.FUNGENCOD('EANUCC128',
                                         PKGBARCODE.FUNCADFAC(NULL,
                                                              NULL,
                                                              NULL,
                                                              r1.nmro_dcmnto,
                                                              v_ttal_pgar,
                                                              trunc(r1.fcha_vncmnto),
                                                              r1.cdgo_ean,
                                                              'N'));

    insert into impresion_masiva_v_antrior
      (id_lote,
       campo1,
       campo2,
       campo3,
       campo4,
       campo5,
       campo6,
       campo7,
       campo8,
       campo9,
       campo10,
       campo11,
       campo12,
       campo13,
       campo14,
       campo15,
       campo16,
       campo17,
       campo18,
       campo19,
       campo20,
       campo21,
       campo22,
       campo23,
       campo24,
       campo25,
       campo26,
       campo27,
       campo28,
       campo29,
       campo30,
       campo31,
       campo32,
       campo33,
       campo34,
       campo35,
       campo36,
       campo37,
       campo38,
       campo39,
       campo40,
       campo41,
       campo42,
       campo43,
       campo44)
    values
      (p_lote, --lote de impresion
       r1.nmro_dcmnto, --numero del documento
       to_char(r1.fcha_vncmnto, 'DD/MM/YYYY'), --fecha vencimiento
       r1.idntfccion_sjto, --referencia
       trim(r1.mtrcla_inmblria), --matricula
       trim(r1.drccion), --direccion
       trim(r1.drccion_ntfccion), --direccion notificacion
       ltrim(to_char(r1.area_trrno, '999,999,999,999')), --area terreno
       ltrim(to_char(r1.area_cnstrda, '999,999,999,999')), --area construida
       ltrim(to_char(r1.avluo_ctstral, '999,999,999,999')), --avaluo
       v_trfa, --tarifa
       r1.dscrpcion_prdo_dstno, --destino
       r1.dscrpcion_estrto, --estrato
       r1.prmer_nmbre, --nombre propietario
       r1.cdgo_idntfccion_tpo, --tipo identificacion
       r1.id_rspnsble, --numero de identificacion
       v_vgncias_rcbo, --vigencias recibo
       v_vgncias_dda, --vigencias deuda
       ltrim(to_char(v_cptal_vgncia_antrior, '999,999,999,999')), --capital vigencia anterior
       ltrim(to_char(v_intres_vgncia_antrior, '999,999,999,999')), --interes vigencia anterior
       ltrim(to_char(v_dscntos_vgncia_antrior, '999,999,999,999')), --descuento vigencia anterior
       ltrim(to_char(v_ttal_vgncia_antrior, '999,999,999,999')), --total vigencia anterior
       ltrim(to_char(v_prdial_cptal_actual, '999,999,999,999')), --predial capital actual
       ltrim(to_char(v_bmbros_cptal_actual, '999,999,999,999')), --bomberil capital actual
       ltrim(to_char(v_actual_ttal_cptal, '999,999,999,999')), --total capital actual
       ltrim(to_char(v_prdial_intres_actual, '999,999,999,999')), --predial interes actual
       ltrim(to_char(v_bmbros_intres_actual, '999,999,999,999')), --bomberil interes actual
       ltrim(to_char(v_actual_ttal_intres, '999,999,999,999')), --total interes actual
       ltrim(to_char(v_prdial_dscnto_inter_actual, '999,999,999,999')), --predial descuento actual -----Predial descuento interes actual
       ltrim(to_char(v_bmbros_dscnto_actual, '999,999,999,999')), --bomberil descuento actual
       ltrim(to_char(v_actual_ttal_dscnto, '999,999,999,999')), --total descuento  actual
       ltrim(to_char(v_prdial_ttal_actual, '999,999,999,999')), --predial total actual
       ltrim(to_char(v_bmbros_ttal_actual, '999,999,999,999')), --bomberil total actual
       ltrim(to_char(v_actual_ttal_ttal, '999,999,999,999')), --TOTAL ACTUAL
       ltrim(to_char(v_ttal_cptal, '999,999,999,999')), -- TOTAL CAPITAL
       ltrim(to_char(v_ttal_intres, '999,999,999,999')), -- TOTAL INTERES
       ltrim(to_char(v_ttal_dscnto, '999,999,999,999')), -- TOTAL DESCUENTO
       ltrim(to_char(v_ttal_pgar, '999,999,999,999')), --TOTAL A PAGAR
       ltrim(to_char(v_sldo_pgar, '999,999,999,999')), --SALDO A PAGAR
       v_cdgo_brras,
       v_txto_cdgo_brras,
       to_char(v_fcha_up, 'DD/MM/YYYY'),
       v_nmro_dcmnto_up,
       v_bnco_up,
       ltrim(to_char(v_vlor_up, '999,999,999,999')));
  end loop;

  commit;

end temp_fctrcion_msva_antrior_1f_1;
/

