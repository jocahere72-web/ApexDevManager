
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CRUCE_CAMARA_202202" (p_cdgo_clnte     varchar2,
                                                     p_identificacion varchar2) is

  cursor c1 is
    select c.identificacion, rowid
      from temp_camara_comercio_202202 c
     where (c.identificacion = p_identificacion or p_identificacion is null)
     order by c.identificacion;

  cursor c2(r_idntfccion varchar2) is
    select i.idntfccion_sjto, i.id_sjto_estdo, id_sjto_impsto
      from v_si_i_sujetos_impuesto i
     where i.cdgo_clnte = p_cdgo_clnte
       and i.id_impsto = p_cdgo_clnte || 2
       and (
           -- coincidencia exacta con r_idntfccion
            i.idntfccion_sjto = r_idntfccion or
           -- coincidencia con r_idntfccion seguida de un dígito de verificación
            (i.idntfccion_sjto like r_idntfccion || '%' and
            length(i.idntfccion_sjto) = length(r_idntfccion) + 1) or
           -- lo mismo para la identificación anterior
            i.idntfccion_antrior = r_idntfccion or
            (i.idntfccion_antrior like r_idntfccion || '%' and
            length(i.idntfccion_antrior) = length(r_idntfccion) + 1))
     order by i.id_sjto_estdo desc;

  cursor c3(r_id_sjto_impsto number, r_vgncia number) is
    select a.vgncia,
           a.vlor_ttal,
           a.bse_grvble,
           to_number(l.vlor) vlor_item,
           m.dscrpcion
      from gi_g_declaraciones a
     inner join gi_d_dclrcnes_vgncias_frmlr b
        on b.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio
      join gi_g_declaraciones_detalle l
        on l.id_dclrcion = a.id_dclrcion
      join gi_d_frmlrios_rgion_atrbto m
        on m.id_frmlrio_rgion_atrbto = l.id_frmlrio_rgion_atrbto
       and m.dscrpcion like '25%'
     where a.cdgo_clnte = 23001
       and a.id_impsto = 230012
       and a.id_impsto_sbmpsto = 2300122
       and a.cdgo_dclrcion_estdo in ('PRS', 'APL')
       and (a.indcdor_mgrdo <> 'C' or a.indcdor_mgrdo is null)
       and a.vgncia = r_vgncia
       and a.id_sjto_impsto = r_id_sjto_impsto
       and a.id_dclrcion = (select max(o.id_dclrcion)
                              from gi_g_declaraciones o
                             where o.id_sjto_impsto = a.id_sjto_impsto
                               and o.id_prdo = a.id_prdo);

  v_exste varchar2(1);
  v_estdo number;

  v_id_sjto_impsto number;

  v_ing_declarados_2019 number;
  v_impuesto_cargo_2019 number;

  v_ing_declarados_2020 number;
  v_impuesto_cargo_2020 number;

begin
  update temp_camara_comercio_202202 t
     set t.exste               = null,
         t.estado              = null,
         t.ing_declarados_2019 = null,
         t.ing_declarados_2020 = null,
         t.impuesto_cargo_2019 = null,
         t.impuesto_cargo_2020 = null;
  commit;

  for r1 in c1 loop
    v_exste := 'N';
    v_estdo := null;

    v_id_sjto_impsto := null;

    v_ing_declarados_2019 := null;
    v_impuesto_cargo_2019 := null;

    v_ing_declarados_2020 := null;
    v_impuesto_cargo_2020 := null;

    for r2 in c2(r1.identificacion) loop
      v_exste          := 'S';
      v_estdo          := r2.id_sjto_estdo;
      v_id_sjto_impsto := r2.id_sjto_impsto;
      if r2.id_sjto_estdo = 1 then
        v_estdo := 1;
        exit;
      end if;

    end loop;

    if v_id_sjto_impsto is not null then
      for r3 in c3(v_id_sjto_impsto, 2019) loop
        v_ing_declarados_2019 := r3.bse_grvble;
        v_impuesto_cargo_2019 := r3.vlor_item;
      end loop;

      for r3 in c3(v_id_sjto_impsto, 2020) loop
        v_ing_declarados_2020 := r3.bse_grvble;
        v_impuesto_cargo_2020 := r3.vlor_item;
      end loop;

    end if;

    update temp_camara_comercio_202202 t
       set t.exste               = v_exste,
           t.estado              = v_estdo,
           t.ing_declarados_2019 = v_ing_declarados_2019,
           t.ing_declarados_2020 = v_ing_declarados_2020,
           t.impuesto_cargo_2019 = v_impuesto_cargo_2019,
           t.impuesto_cargo_2020 = v_impuesto_cargo_2020
     where t.rowid = r1.rowid;
    commit;
  end loop;

end temp_cruce_camara_202202;
/

