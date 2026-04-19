
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_CARGUE_DECLARACION_AFORO" (p_idntfccion varchar2,
                                                        p_vgncia     number) is
  cursor c1 is
    select a.*,
           f.fcha_ntfccion,
           add_months(f.fcha_ntfccion, 2) fcha_ejctria,
           c.id_sjto_tpo,
           c.nmbre_sjto_tpo,
           b.id_mncpio_ntfccion,
           b.nmbre_mncpio_ntfccion,
           b.id_dprtmnto_ntfccion,
           b.nmbre_dprtmnto_ntfccion,
           b.tlfno,
           b.email,
           b.drccion_ntfccion,
           r.id_sjto_rspnsble,
           r.cdgo_idntfccion_tpo,
           r.dscrpcion_idntfccion_tpo,
           r.idntfccion_rspnsble,
           trim(regexp_replace(replace(nvl(r.prmer_nmbre, '') || ' ' ||
                                       nvl(r.sgndo_nmbre, '') || ' ' ||
                                       nvl(r.prmer_aplldo, '') || ' ' ||
                                       nvl(r.sgndo_aplldo, ''),
                                       '.',
                                       '' -- elimina puntos
                                       ),
                               '\s+',
                               ' ' -- reduce múltiples espacios a uno solo
                               )) as nmbre_rspnsble,
           a.rowid
      from temp_aforo_consolidado a
      join v_gn_g_actos_sujeto_impuesto f
        on f.id_sjto_impsto = a.id_sjto_impsto
       and f.id_acto_tpo = 133
       and exists (select 1
              from gn_g_actos_vigencia v
             where v.id_acto = f.id_acto
               and v.vgncia = a.vgncia)
      join v_si_i_sujetos_impuesto b
        on b.id_sjto_impsto = a.id_sjto_impsto
      join v_si_i_personas c
        on c.id_sjto_impsto = a.id_sjto_impsto
      left join v_si_i_sujetos_responsable r
        on r.id_sjto_impsto = a.id_sjto_impsto
       and r.cdgo_tpo_rspnsble = 'L'
       and r.prncpal_s_n = 'S'
       and r.actvo = 'S'
     where a.vgncia = p_vgncia
       and dclrcion_crgda = 'N'
          --and a.n_declaracion is null
       and REGEXP_LIKE(TRIM(a.notificado), '(^|,\s*)NOTIFICADO(,|$)')
          --and a.ejctria is not null
       and (a.identificacion = p_idntfccion or p_idntfccion is null)
     order by a.liquidacion_de_aforo_reso;

  cursor c2 is
    select c.id_frmlrio_rgion_atrbto,
           c.id_frmlrio_rgion,
           c.dscrpcion,
           c.nmbre_dsplay,
           c.nmbre_rprte
      from gi_d_formularios a
      join gi_d_formularios_region b
        on b.id_frmlrio = a.id_frmlrio
      join gi_d_frmlrios_rgion_atrbto c
        on c.id_frmlrio_rgion = b.id_frmlrio_rgion
     where a.id_frmlrio = 764
       and c.id_frmlrio_rgion_atrbto not in (4797)
     order by b.orden, c.orden;

  o_id_dclrcion                number;
  v_id_dclrcion_vgncia_frmlrio number;
  v_id_prdo                    number;

  v_vlor      varchar2(500);
  vlor_dsplay varchar2(500);

begin

  begin
    select a.id_dclrcion_vgncia_frmlrio, b.id_prdo
      into v_id_dclrcion_vgncia_frmlrio, v_id_prdo
      from gi_d_dclrcnes_vgncias_frmlr a
      join gi_d_dclrcnes_tpos_vgncias b
        on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
     where a.id_frmlrio = 764
       and b.vgncia = p_vgncia;
  exception
    when others then
      raise_application_error(-20001,
                              'No existe id_dclrcion_vgncia_frmlrio para la vigencia ' ||
                              p_vgncia);
  end;

  for r1 in c1 loop
    o_id_dclrcion := null;
    insert into gi_g_declaraciones
      (id_dclrcion_vgncia_frmlrio,
       cdgo_clnte,
       id_impsto,
       id_impsto_sbmpsto,
       id_sjto_impsto,
       fcha_prsntcion,
       fcha_prsntcion_pryctda,
       vgncia,
       id_prdo,
       id_dclrcion_uso,
       id_cnddto_vgncia,
       cdgo_dclrcion_estdo,
       nmro_cnsctvo,
       id_usrio_rgstro,
       fcha_rgstro,
       cdgo_orgn_tpo,
       bse_grvble,
       vlor_ttal,
       vlor_pago)
    values
      (v_id_dclrcion_vgncia_frmlrio,
       23001,
       230012,
       2300122,
       r1.id_sjto_impsto,
       r1.fcha_ejctria,
       r1.fcha_ejctria,
       r1.vgncia,
       v_id_prdo,
       82,
       null,
       'REG',
       r1.liquidacion_de_aforo_reso,
       230017,
       systimestamp,
       1,
       r1.valor_base_gravable_final,
       r1.total_sancion_impuesto,
       0)
    returning id_dclrcion into o_id_dclrcion;

    for r2 in c2 loop

      v_vlor      := null;
      vlor_dsplay := null;

      if r2.id_frmlrio_rgion_atrbto in (4688,
                                        4689,
                                        4699,
                                        4707,
                                        4709,
                                        4710,
                                        4708,
                                        4704,
                                        4706,
                                        4718,
                                        4719,
                                        4722,
                                        4725,
                                        4728,
                                        4729,
                                        4730,
                                        4731,
                                        4732,
                                        4734,
                                        4737,
                                        4740,
                                        4741,
                                        4742,
                                        4743,
                                        4744,
                                        4745,
                                        4747,
                                        4748,
                                        4750,
                                        4751,
                                        4752,
                                        4753,
                                        4754,
                                        4756,
                                        4757,
                                        4758,
                                        4759,
                                        4760,
                                        4771,
                                        4772,
                                        4773,
                                        4776,
                                        4779,
                                        4780,
                                        4783,
                                        4786,
                                        4985,
                                        4986,
                                        4987,
                                        4989,
                                        5267,
                                        5346,
                                        5347,
                                        5348,
                                        4788,
                                        4792,
                                        4793,
                                        4784,
                                        4785,
                                        4789,
                                        4795,
                                        4796,
                                        4749) then
        v_vlor      := '0';
        vlor_dsplay := '0';
      elsif r2.id_frmlrio_rgion_atrbto in (4865, 4701, 4702, 5185) then
        v_vlor      := 'N';
        vlor_dsplay := 'N';
      elsif r2.id_frmlrio_rgion_atrbto = 4687 then
        v_vlor      := to_char(r1.fcha_ejctria, 'dd/mm/yyyy');
        vlor_dsplay := to_char(r1.fcha_ejctria, 'dd/mm/yyyy');
      elsif r2.id_frmlrio_rgion_atrbto = 4686 then
        v_vlor      := 'DIN';
        vlor_dsplay := 'DIN';
      elsif r2.id_frmlrio_rgion_atrbto = 4685 then
        v_vlor      := r1.id_sjto_tpo;
        vlor_dsplay := r1.nmbre_sjto_tpo;
      elsif r2.id_frmlrio_rgion_atrbto = 4695 then
        v_vlor      := r1.id_dprtmnto_ntfccion;
        vlor_dsplay := r1.nmbre_dprtmnto_ntfccion;
      elsif r2.id_frmlrio_rgion_atrbto = 4696 then
        v_vlor      := r1.id_mncpio_ntfccion;
        vlor_dsplay := r1.nmbre_mncpio_ntfccion;
      elsif r2.id_frmlrio_rgion_atrbto = 4697 then
        v_vlor      := r1.tlfno;
        vlor_dsplay := r1.tlfno;
      elsif r2.id_frmlrio_rgion_atrbto = 4698 then
        v_vlor      := r1.email;
        vlor_dsplay := r1.email;
      elsif r2.id_frmlrio_rgion_atrbto = 4700 then
        v_vlor      := 'S';
        vlor_dsplay := 'S';
      elsif r2.id_frmlrio_rgion_atrbto = 4694 then
        v_vlor      := r1.drccion_ntfccion;
        vlor_dsplay := r1.drccion_ntfccion;
      elsif r2.id_frmlrio_rgion_atrbto = 4690 then
        v_vlor      := r1.contribuyente;
        vlor_dsplay := r1.contribuyente;
      elsif r2.id_frmlrio_rgion_atrbto = 4691 then
        v_vlor      := 'N';
        vlor_dsplay := 'NÚMERO DE IDENTIFICACIÓN TRIBUTARIA';
      elsif r2.id_frmlrio_rgion_atrbto = 4692 then
        v_vlor      := r1.identificacion;
        vlor_dsplay := r1.identificacion;
      elsif r2.id_frmlrio_rgion_atrbto in (4703, 4711, 4705, 4714, 4716) then
        v_vlor      := r1.valor_base_gravable_final;
        vlor_dsplay := trim(replace(to_char(r1.valor_base_gravable_final,
                                            '999,999,999,999'),
                                    ',',
                                    '.'));
      elsif r2.id_frmlrio_rgion_atrbto in
            (4715, 4717, 4720, 4777, 4778, 4781, 4782) then
        v_vlor      := r1.industria_y_comercio;
        vlor_dsplay := trim(replace(to_char(r1.industria_y_comercio,
                                            '999,999,999,999'),
                                    ',',
                                    '.'));
      elsif r2.id_frmlrio_rgion_atrbto in (4775, 4787, 4790, 4794) then
        v_vlor      := r1.total_sancion_impuesto;
        vlor_dsplay := trim(replace(to_char(r1.total_sancion_impuesto,
                                            '999,999,999,999'),
                                    ',',
                                    '.'));
      elsif r2.id_frmlrio_rgion_atrbto in (4721, 4723, 4724, 4726, 4727) then
        v_vlor      := r1.avisos_y_tableros;
        vlor_dsplay := trim(replace(to_char(r1.avisos_y_tableros,
                                            '999,999,999,999'),
                                    ',',
                                    '.'));
      elsif r2.id_frmlrio_rgion_atrbto in (4755, 4765, 4774) then
        v_vlor      := r1.impuesto_a_cargo;
        vlor_dsplay := trim(replace(to_char(r1.impuesto_a_cargo,
                                            '999,999,999,999'),
                                    ',',
                                    '.'));
      elsif r2.id_frmlrio_rgion_atrbto in
            (4763, 4766, 4767, 4768, 4769, 4770) then
        v_vlor      := r1.valor_sancion_por_no_declar;
        vlor_dsplay := trim(replace(to_char(r1.valor_sancion_por_no_declar,
                                            '999,999,999,999'),
                                    ',',
                                    '.'));
      elsif r2.id_frmlrio_rgion_atrbto IN (4733, 4736, 4738, 4739) then
        v_vlor      := r1.sobretasa_bomberil;
        vlor_dsplay := trim(replace(to_char(r1.sobretasa_bomberil,
                                            '999,999,999,999'),
                                    ',',
                                    '.'));
      elsif r2.id_frmlrio_rgion_atrbto in (4762, 4764) then
        v_vlor      := 'M';
        vlor_dsplay := 'M';
      elsif r2.id_frmlrio_rgion_atrbto = 4761 then
        v_vlor      := 'EXT';
        vlor_dsplay := 'EXT';
      elsif r2.id_frmlrio_rgion_atrbto = 4712 then
        for actividad in (select t.id_dclrcns_esqma_trfa,
                                 t.cdgo_dclrcns_esqma_trfa || ' - ' ||
                                 t.dscrpcion actvdad
                            from gi_d_dclrcns_esqma_trfa t
                           where cdgo_dclrcns_esqma_trfa =
                                 to_char(r1.codigociiu)
                           order by t.fcha_dsde
                           fetch first 1 row only) loop
          v_vlor      := actividad.id_dclrcns_esqma_trfa;
          vlor_dsplay := actividad.actvdad;
        end loop;

      elsif r2.id_frmlrio_rgion_atrbto = 4713 then
        v_vlor      := r1.tarifa;
        vlor_dsplay := r1.tarifa;
      elsif r2.id_frmlrio_rgion_atrbto = 4798 then
        v_vlor      := r1.id_sjto_rspnsble;
        vlor_dsplay := r1.nmbre_rspnsble;
      elsif r2.id_frmlrio_rgion_atrbto = 4799 then
        v_vlor      := r1.cdgo_idntfccion_tpo;
        vlor_dsplay := r1.dscrpcion_idntfccion_tpo;
      elsif r2.id_frmlrio_rgion_atrbto = 4800 then
        v_vlor      := r1.idntfccion_rspnsble;
        vlor_dsplay := r1.idntfccion_rspnsble;
      end if;

      insert into gi_g_declaraciones_detalle
        (id_dclrcion,
         id_frmlrio_rgion,
         id_frmlrio_rgion_atrbto,
         fla,
         orden,
         vlor,
         vlor_dsplay)
      values
        (o_id_dclrcion,
         r2.id_frmlrio_rgion,
         r2.id_frmlrio_rgion_atrbto,
         1,
         1,
         v_vlor,
         vlor_dsplay);
    end loop;

    update temp_aforo_consolidado a
       set a.dclrcion_crgda = 'S', a.id_dclrcion = o_id_dclrcion
     where a.rowid = r1.rowid;

    commit;

  end loop;

end jl_cargue_declaracion_aforo;
/

