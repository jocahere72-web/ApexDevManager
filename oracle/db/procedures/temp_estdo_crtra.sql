
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_ESTDO_CRTRA" (P_VGNCIA_DSDE NUMBER,
                                             P_VGNCIA_HSTA NUMBER) is

  CURSOR C1 IS
    select a.id_sjto_impsto,
           j.idntfccion RFRNCIA_CTSTRAL,
           j.idntfccion_antrior RFRNCIA_ANTRIOR,
           a.vgncia,
           SUM(a.vlor_sldo_cptal) SLDO_CPTAL,
           SUM(a.vlor_intres) SLDO_INTRES
      from gf_g_mvmntos_cncpto_cnslddo a,
           SI_I_SUJETOS_IMPUESTO       I,
           si_c_sujetos                j
     where a.cdgo_clnte = 23001
       and a.id_impsto = 230011
       and a.vlor_sldo_cptal > 0
       and i.id_sjto = j.id_sjto
       and a.cdgo_mvnt_fncro_estdo != 'AN'
       AND A.ID_SJTO_IMPSTO = I.id_sjto_impsto
       AND I.id_sjto_estdo = 1
       AND A.VGNCIA BETWEEN P_VGNCIA_DSDE AND P_VGNCIA_HSTA
     GROUP BY A.id_sjto_impsto,
              A.VGNCIA,
              j.idntfccion,
              j.idntfccion_antrIOR;

  CURSOR C2(R_id_sjto_impsto NUMBER, R_vgncia NUMBER) IS
    select MAX(A.FCHA_DTRMNCION) FCHA_DTRMNCION
      from gi_g_determinacion_detalle a
     where a.id_sjto_impsto = R_id_sjto_impsto
       and a.vgncia = R_vgncia;

  CURSOR C3(R_id_sjto_impsto NUMBER, R_vgncia NUMBER) IS
    select MAX(o.fcha_acto) FCHA_MNDMNTO
      from cb_g_procesos_jrdco_mvmnto n
      left join cb_g_procesos_jrdco_dcmnto o
        on n.id_prcsos_jrdco = o.id_prcsos_jrdco
     where n.id_sjto_impsto = R_id_sjto_impsto
       and n.vgncia = R_vgncia;

  v_id_ssion       number := 150386;
  V_FCHA_DTRMNCION DATE;
  V_FCHA_MNDMNTO   DATE;

begin

  delete from gn_g_temporal where id_ssion = v_id_ssion;
  commit;

  FOR R1 IN C1 LOOP
    V_FCHA_DTRMNCION := NULL;
    V_FCHA_MNDMNTO   := NULL;
    FOR R2 IN C2(R1.ID_SJTO_IMPSTO, R1.VGNCIA) LOOP
      V_FCHA_DTRMNCION := R2.FCHA_DTRMNCION;
    END LOOP;

    FOR R3 IN C3(R1.ID_SJTO_IMPSTO, R1.VGNCIA) LOOP
      V_FCHA_MNDMNTO := R3.FCHA_MNDMNTO;
    END LOOP;

    insert into gn_g_temporal
      (id_ssion, n001, n002, n003, n004, d001, d002, c001)
    values
      (v_id_ssion,
       R1.ID_SJTO_IMPSTO,
       R1.vgncia,
       R1.SLDO_CPTAL,
       R1.SLDO_INTRES,
       TO_CHAR(V_FCHA_DTRMNCION, 'DD/MM/YYYY'),
       TO_CHAR(V_FCHA_MNDMNTO, 'DD/MM/YYYY'),
       R1.RFRNCIA_CTSTRAL);
    commit;

  END LOOP;
end TEMP_ESTDO_CRTRA;
/

