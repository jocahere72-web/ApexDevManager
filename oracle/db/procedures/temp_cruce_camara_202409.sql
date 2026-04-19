
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CRUCE_CAMARA_202409" (p_cdgo_clnte     varchar2,
                                                     p_identificacion varchar2) is

  cursor c1 is
    select c.identificacion, id
      from temp_camara_comercio_202409 c
     where (c.identificacion = p_identificacion or p_identificacion is null)
     order by c.id;

  cursor c2(r_idntfccion varchar2) is
    select i.idntfccion_sjto,
           i.id_sjto_estdo,
           i.id_sjto_impsto,
           a.fcha_incio_actvddes,
           i.fcha_cnclcion
      from v_si_i_sujetos_impuesto i
      join si_i_personas a
        on a.id_sjto_impsto = i.id_sjto_impsto
     where i.cdgo_clnte = p_cdgo_clnte
       and i.id_impsto = p_cdgo_clnte || 2
       and (i.idntfccion_sjto = r_idntfccion or
           (i.idntfccion_sjto like r_idntfccion || '%' and
           length(i.idntfccion_sjto) = length(r_idntfccion) + 1))
    union all
    select i.idntfccion_sjto,
           i.id_sjto_estdo,
           i.id_sjto_impsto,
           a.fcha_incio_actvddes,
           i.fcha_cnclcion
      from v_si_i_sujetos_impuesto i
      join si_i_personas a
        on a.id_sjto_impsto = i.id_sjto_impsto
     where i.cdgo_clnte = p_cdgo_clnte
       and i.id_impsto = p_cdgo_clnte || 2
       and (i.idntfccion_sjto = r_idntfccion or
           (i.idntfccion_sjto like r_idntfccion || '%' and
           length(i.idntfccion_sjto) = length(r_idntfccion) + 1) or
           i.idntfccion_antrior = r_idntfccion or
           (i.idntfccion_antrior like r_idntfccion || '%' and
           length(i.idntfccion_antrior) = length(r_idntfccion) + 1))
     order by id_sjto_estdo, id_sjto_impsto;

  cursor c3(r_id_sjto_impsto number, r_vgncia number) is
    select a.vgncia, a.bse_grvble, to_number(l.vlor) vlor_item
      from gi_g_declaraciones a
      join gi_g_declaraciones_detalle l
        on l.id_dclrcion = a.id_dclrcion
      join gi_d_frmlrios_rgion_atrbto m
        on m.id_frmlrio_rgion_atrbto = l.id_frmlrio_rgion_atrbto
      join gi_d_dclrcnes_vgncias_frmlr b
        on b.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio
     where a.cdgo_clnte = 23001
       and a.id_impsto = 230012
       and a.id_impsto_sbmpsto = 2300122
       and a.cdgo_dclrcion_estdo in ('PRS', 'APL')
       and a.vgncia = r_vgncia
       and a.id_sjto_impsto = r_id_sjto_impsto
       and (a.indcdor_mgrdo <> 'C' or a.indcdor_mgrdo is null)
       and m.dscrpcion like '25%'
       and b.id_frmlrio in (731, 764) -- formularios de ica anual
       and a.id_dclrcion = (select max(o.id_dclrcion)
                              from gi_g_declaraciones o
                             where o.id_sjto_impsto = a.id_sjto_impsto
                               and o.id_prdo = a.id_prdo);

  v_exste               varchar2(1);
  v_estdo               number;
  v_id_sjto_impsto      number;
  v_fcha_incio_actvddes date;
  v_fcha_cnlcion        date;
  v_idntfccion          varchar2(20);

  v_vgncia_no_dclrdas varchar2(100);
  v_count             number;

  -- definimos el tipo year_data y year_array
  type year_data is record(
    year     number,
    declared number,
    tax      number);

  type year_array is table of year_data index by pls_integer;
  v_years year_array;

begin
  -- inicializamos los valores de v_years
  v_years(1).year := 2019;
  v_years(2).year := 2020;
  v_years(3).year := 2021;
  v_years(4).year := 2022;
  v_years(5).year := 2023;

  update temp_camara_comercio_202409 t
     set t.exste                 = null,
         t.estado                = null,
         t.fcha_inscripcion      = null,
         t.fcha_cnclcion         = null,
         t.idntfccion_smart      = null,
         t.ing_declarados_2019   = null,
         t.impuesto_cargo_2019   = null,
         t.ing_declarados_2020   = null,
         t.impuesto_cargo_2020   = null,
         t.ing_declarados_2021   = null,
         t.impuesto_cargo_2021   = null,
         t.ing_declarados_2022   = null,
         t.impuesto_cargo_2022   = null,
         t.ing_declarados_2023   = null,
         t.impuesto_cargo_2023   = null,
         t.vgncia_no_dclrdas     = '2019 2020 2021 2022 2023',
         t.nmro_prdos_no_dclrdos = 5;
  commit;

  for r1 in c1 loop
    v_exste := 'N';
    v_estdo := null;

    v_id_sjto_impsto      := null;
    v_fcha_incio_actvddes := null;
    v_fcha_cnlcion        := null;
    v_idntfccion          := null;

    v_vgncia_no_dclrdas := '2019 2020 2021 2022 2023 ';
    v_count             := 5;

    -- inicialización de valores
    for i in 1 .. v_years.count loop
      v_years(i).declared := null;
      v_years(i).tax := null;
    end loop;

    for r2 in c2(r1.identificacion) loop
      v_exste               := 'S';
      v_estdo               := r2.id_sjto_estdo;
      v_id_sjto_impsto      := r2.id_sjto_impsto;
      v_fcha_incio_actvddes := r2.fcha_incio_actvddes;
      v_idntfccion          := r2.idntfccion_sjto;
      if r2.id_sjto_estdo = 1 then
        exit;
      elsif r2.fcha_cnclcion is not null and
            extract(year from r2.fcha_cnclcion) > 2020 then
        v_fcha_cnlcion := r2.fcha_cnclcion;
      end if;
    end loop;

    if v_id_sjto_impsto is not null then
      for i in 1 .. v_years.count loop
        if nvl(extract(year from v_fcha_incio_actvddes), 2019) <= v_years(i).year then
          for r3 in c3(v_id_sjto_impsto, v_years(i).year) loop
            v_years(i).declared := r3.bse_grvble;
            v_years(i).tax := r3.vlor_item;
            v_count := v_count - 1;
            v_vgncia_no_dclrdas := replace(v_vgncia_no_dclrdas,
                                           v_years(i).year || ' ',
                                           '');
          end loop;
        else
          v_years(i).declared := -1;
          v_count := v_count - 1;
          v_vgncia_no_dclrdas := replace(v_vgncia_no_dclrdas,
                                         v_years(i).year || ' ',
                                         '');
        end if;
      end loop;
    end if;

    update temp_camara_comercio_202409 t
       set t.exste                 = v_exste,
           t.estado                = v_estdo,
           t.fcha_inscripcion      = v_fcha_incio_actvddes,
           t.fcha_cnclcion         = v_fcha_cnlcion,
           t.idntfccion_smart      = v_idntfccion,
           t.ing_declarados_2019   = v_years(1).declared,
           t.impuesto_cargo_2019   = v_years(1).tax,
           t.ing_declarados_2020   = v_years(2).declared,
           t.impuesto_cargo_2020   = v_years(2).tax,
           t.ing_declarados_2021   = v_years(3).declared,
           t.impuesto_cargo_2021   = v_years(3).tax,
           t.ing_declarados_2022   = v_years(4).declared,
           t.impuesto_cargo_2022   = v_years(4).tax,
           t.ing_declarados_2023   = v_years(5).declared,
           t.impuesto_cargo_2023   = v_years(5).tax,
           t.vgncia_no_dclrdas     = v_vgncia_no_dclrdas,
           t.nmro_prdos_no_dclrdos = v_count
     where t.id = r1.id;

    commit;
  end loop;

end;
/

