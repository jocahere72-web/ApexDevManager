
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_PRC_ACRDTCION_CARTERA_MASIVO" (p_cdgo_clnte        number,
                                                              p_id_impsto         number,
                                                              p_id_impsto_sbmpsto number,
                                                              p_fcha_vncmnto      date,
                                                              p_id_ajste_mtvo     number,
                                                              p_obsrvcion         varchar2,
                                                              p_nmro_dcmto_sprte  varchar2,
                                                              p_fcha_dcmnto_sprte date,
                                                              p_id_usrio          number) is

  cursor c1 is
    select c.id_sjto_impsto
      from temp_ajustes_masivos c
    -- where c.id_sjto_impsto = 2749112
     where c.prcsdo = 'N'
     group by c.id_sjto_impsto
     order by c.id_sjto_impsto;

  cursor c2(r_id_sjto_impsto number) is
    select c.*
      from temp_ajustes_masivos c
     where c.id_sjto_impsto = r_id_sjto_impsto
     order by c.vgncia, c.prdo;

  cursor c3(r_id_sjto_impsto number, r_vgncia number, r_prdo number) is
    select a.*,
           (select vlor_intres_bancario
              from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => p_cdgo_clnte,
                                                                          p_id_impsto            => p_id_impsto,
                                                                          p_id_impsto_sbmpsto    => p_id_impsto_sbmpsto,
                                                                          p_vgncia               => a.vgncia,
                                                                          p_id_prdo              => a.id_prdo,
                                                                          p_id_cncpto            => a.id_cncpto_intres_mra,
                                                                          p_id_sjto_impsto       => r_id_sjto_impsto,
                                                                          p_fcha_pryccion        => p_fcha_vncmnto,
                                                                          p_vlor                 => a.vlor_intres,
                                                                          p_cdna_vgncia_prdo_pgo => '{"VGNCIA_PRDO":{"vgncia":' ||
                                                                                                    a.vgncia ||
                                                                                                    ',"prdo":' ||
                                                                                                    a.prdo ||
                                                                                                    ',"id_orgen":' ||
                                                                                                    id_orgen || '}}',
                                                                          p_cdna_vgncia_prdo_ps  => null
                                                                          -- ley 2155
                                                                         ,
                                                                          p_cdgo_mvmnto_orgn => a.cdgo_mvmnto_orgn,
                                                                          p_id_orgen         => a.id_orgen,
                                                                          p_vlor_cptal       => a.vlor_sldo_cptal,
                                                                          p_id_cncpto_base   => a.id_cncpto))) vlor_intres_bncrio
      from pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte,
                                                                p_id_impsto,
                                                                p_id_impsto_sbmpsto,
                                                                r_id_sjto_impsto,
                                                                p_fcha_vncmnto,
                                                                null) a
     where a.vgncia = r_vgncia;

  v_id_ajste         number;
  v_numro_ajste      number;
  v_id_instncia_fljo number;
  v_id_mvmnto_dtlle  number;

  v_vlor_ajste_cptal  number;
  v_vlor_ajste_intres number;

  --  v_id_orgen number;

  v_cdgo_rspsta_ind_mvmnto_blqdo number;
  v_mnsje_rspst_ind_mvmnto_blqdo varchar2(1000);

  v_cdgo_rspsta     number;
  v_mnsje_rspsta    varchar2(200);
  v_xml             clob;
  v_tpo_ajste       varchar2(2) := 'CR';
  v_id_orgen_mvmnto number := null;

begin
  --se crea el flujo para poder registrar los ajustes

  for r1 in c1 loop
    --se crea el flujo para poder registrar los ajustes
    insert into wf_g_instancias_flujo
      (id_fljo,
       fcha_incio,
       fcha_fin_plnda,
       fcha_fin_optma,
       fcha_fin_real,
       id_usrio,
       estdo_instncia,
       obsrvcion,
       indcdor_mgrdo)
    values
      (8,
       sysdate,
       sysdate,
       sysdate,
       null,
       1,
       'FINALIZADA',
       'Flujo de Ajuste Masivo',
       null)
    returning id_instncia_fljo into v_id_instncia_fljo;

    v_numro_ajste       := pkg_gn_generalidades.fnc_cl_consecutivo(p_cdgo_clnte   => p_cdgo_clnte,
                                                                   p_cdgo_cnsctvo => 'AJT');
    v_vlor_ajste_cptal  := 0;
    v_vlor_ajste_intres := 0;

    insert into gf_g_ajustes
      (cdgo_clnte,
       id_impsto,
       id_impsto_sbmpsto,
       id_sjto_impsto,
       orgen,
       tpo_ajste,
       vlor,
       id_ajste_mtvo,
       obsrvcion,
       cdgo_ajste_estdo,
       tpo_dcmnto_sprte,
       nmro_dcmto_sprte,
       fcha_dcmnto_sprte,
       nmro_slctud,
       id_usrio,
       id_instncia_fljo,
       id_fljo_trea,
       id_instncia_fljo_pdre,
       numro_ajste,
       ind_ajste_prcso,
       fcha_pryccion_intrs)

    values
      (p_cdgo_clnte,
       p_id_impsto,
       p_id_impsto_sbmpsto,
       r1.id_sjto_impsto,
       'A',
       'CR',
       0,
       p_id_ajste_mtvo,
       p_obsrvcion,
       'RG',
       '0',
       p_nmro_dcmto_sprte,
       p_fcha_dcmnto_sprte,
       null,
       p_id_usrio,
       v_id_instncia_fljo,
       32,
       null,
       v_numro_ajste,
       null,
       p_fcha_vncmnto)
    returning id_ajste into v_id_ajste;

    for r2 in c2(r1.id_sjto_impsto) loop
      for r3 in c3(r2.id_sjto_impsto, r2.vgncia, r2.prdo) loop
        /*  dbms_output.put_line('Vigencia: ' || r3.vgncia || ', Periodo: ' ||
        r3.prdo || ', id_cncpto: ' || r3.id_cncpto ||
        ', vlor_sldo_cptal: ' || r3.vlor_sldo_cptal ||
        ', vlor_intres: ' || r3.vlor_intres ||
        ', vlor_intres_bncrio: ' ||
        r3.vlor_intres_bncrio);*/

        select d.id_mvmnto_dtlle
          into v_id_mvmnto_dtlle
          from gf_g_movimientos_detalle d
         where d.id_mvmnto_fncro = r3.id_mvmnto_fncro
           and d.vgncia = r3.vgncia
           and d.id_prdo = r3.id_prdo
           and d.cdgo_mvmnto_orgn = r3.cdgo_mvmnto_orgn
           and d.id_orgen = r3.id_orgen
           and d.id_cncpto = r3.id_cncpto
           and d.cdgo_mvmnto_tpo = 'IN';

        insert into gf_g_ajuste_detalle
          (id_ajste,
           vgncia,
           id_prdo,
           id_cncpto,
           id_cncpto_csdo,
           sldo_cptal,
           vlor_ajste,
           id_mvmnto_orgn,
           vlor_intres,
           ajste_dtlle_tpo,
           fcha_pryccion_intres,
           intres_cptal_mrtrio,
           intres_ajste_mrtrio)
        values
          (v_id_ajste,
           r3.vgncia,
           r3.id_prdo,
           r3.id_cncpto,
           null,
           r3.vlor_sldo_cptal,
           r3.vlor_sldo_cptal,
           v_id_mvmnto_dtlle,
           r3.vlor_intres,
           'C',
           p_fcha_vncmnto,
           nvl(r3.vlor_intres_bncrio, 0),
           round(nvl(r3.vlor_intres_bncrio, 0) * (1 - r2.dscnto)));

        --OJO ESTE PROCEDIMIENTO SOLO FUNCIONA CUANDO LOS DESCUENTOS SON DE FINANCIACION, CUANDO SEAN NORMALES HAY QUE CORREGIR LOS INSERTS

        v_vlor_ajste_cptal  := v_vlor_ajste_cptal + r3.vlor_sldo_cptal;
        v_vlor_ajste_intres := v_vlor_ajste_intres +
                               round(nvl(r3.vlor_intres_bncrio, 0) *
                                     (1 - r2.dscnto));

        pkg_gf_movimientos_financiero.prc_ac_indicador_mvmnto_blqdo(p_cdgo_clnte           => p_cdgo_clnte,
                                                                    p_id_sjto_impsto       => r1.id_sjto_impsto,
                                                                    p_vgncia               => r3.vgncia,
                                                                    p_id_prdo              => r3.id_prdo,
                                                                    p_id_orgen_mvmnto      => r3.id_orgen,
                                                                    p_indcdor_mvmnto_blqdo => 'S',
                                                                    p_cdgo_trza_orgn       => 'AJS',
                                                                    p_id_orgen             => v_id_ajste,
                                                                    p_id_usrio             => p_id_usrio,
                                                                    p_obsrvcion            => 'BLOQUEO DE CARTERA AJUSTE No. ' ||
                                                                                              v_numro_ajste ||
                                                                                              ' TIPO AUTOMATICO - FLUJO DE PROCESO ' ||
                                                                                              v_id_instncia_fljo,
                                                                    o_cdgo_rspsta          => v_cdgo_rspsta_ind_mvmnto_blqdo,
                                                                    o_mnsje_rspsta         => v_mnsje_rspst_ind_mvmnto_blqdo);

      end loop;

    end loop;

    update gf_g_ajustes a
       set a.vlor = v_vlor_ajste_cptal, a.vlor_intres = v_vlor_ajste_intres
     where a.id_ajste = v_id_ajste;

    v_xml := '<ID_AJSTE>' || v_id_ajste || '</ID_AJSTE>';
    v_xml := v_xml || '<ID_SJTO_IMPSTO>' || r1.id_sjto_impsto ||
             '</ID_SJTO_IMPSTO>';
    v_xml := v_xml || '<TPO_AJSTE>' || v_tpo_ajste || '</TPO_AJSTE>';
    v_xml := v_xml || '<CDGO_CLNTE>' || p_cdgo_clnte || '</CDGO_CLNTE>';
    v_xml := v_xml || '<ID_USRIO>' || p_id_usrio || '</ID_USRIO>';
    v_xml := v_xml || '<ID_ORGEN_MVMNTO>' || v_id_orgen_mvmnto ||
             '</ID_ORGEN_MVMNTO>';
    v_xml := v_xml || '<ID_IMPSTO_ACTO>' || 1 || '</ID_IMPSTO_ACTO>';

    pkg_gf_ajustes.prc_ap_ajuste(p_xml          => v_xml,
                                 o_cdgo_rspsta  => v_cdgo_rspsta,
                                 o_mnsje_rspsta => v_mnsje_rspsta);

    if v_cdgo_rspsta = 0 then

      update temp_ajustes_masivos m
         set m.prcsdo = 'S'
       where m.id_sjto_impsto = r1.id_sjto_impsto;

      dbms_output.put_line('v_id_ajste: ' || v_id_ajste ||
                           ', v_numro_ajste: ' || v_numro_ajste);

      commit;
    else
      rollback;
    end if;
  end loop;

end temp_prc_acrdtcion_cartera_masivo;
/

