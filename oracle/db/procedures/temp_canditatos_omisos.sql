
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CANDITATOS_OMISOS" (p_vgncia_incial number,
                                                   p_vgncia_fnal   number) is
  cursor c1 is
    select a.id_sjto_impsto,
           b.fcha_incio_actvddes,
           a.idntfccion_sjto,
           a.id_impsto
      from v_si_i_sujetos_impuesto a
      join si_i_personas b
        on b.id_sjto_impsto = a.id_sjto_impsto
     where a.id_sjto_estdo = 1
       and a.id_impsto = 230012
       and a.idntfccion_sjto not in ('.', '12345678890')
     order by a.id_sjto_impsto;

  cursor c2(r_id_sjto_impsto number, r_vgncia number, r_id_frmlrio number) is
    select g.nmro_cnsctvo
      from v_gi_g_declaraciones g
     where g.id_sjto_impsto = r_id_sjto_impsto
       and g.vgncia = r_vgncia
       and g.id_impsto = 230012
       and g.cdgo_clnte = 23001
       and g.cdgo_dclrcion_estdo in ('APL', 'PRS')
       and g.id_frmlrio = r_id_frmlrio
     order by g.fcha_prsntcion desc, g.id_dclrcion;

  cursor c3(r_idntfccion_sjto varchar2,
            r_vgncia          number,
            r_id_sjto_impsto  number,
            r_id_frmlrio      number) is
    select g.nmro_cnsctvo
      from v_gi_g_declaraciones g
      join v_si_i_sujetos_impuesto h
        on h.cdgo_clnte = g.cdgo_clnte
       and h.id_impsto = g.id_impsto
       and h.id_sjto_impsto = g.id_sjto_impsto
     where g.id_sjto_impsto <> r_id_sjto_impsto
       and h.idntfccion_antrior = r_idntfccion_sjto
       and g.vgncia = r_vgncia
       and g.cdgo_clnte = 23001
       and g.id_impsto = 230012
       and g.cdgo_dclrcion_estdo in ('APL', 'PRS')
       and g.id_frmlrio = r_id_frmlrio
     order by g.fcha_prsntcion desc;

  cursor c4(r_idntfccion_sjto varchar2,
            r_vgncia          number,
            r_id_sjto_impsto  number,
            r_id_frmlrio      number) is
    select g.nmro_cnsctvo
      from v_gi_g_declaraciones g
      join v_si_i_sujetos_impuesto h
        on h.cdgo_clnte = g.cdgo_clnte
       and h.id_impsto = g.id_impsto
       and h.id_sjto_impsto = g.id_sjto_impsto
     where g.id_sjto_impsto <> r_id_sjto_impsto
       and h.idntfccion_sjto = r_idntfccion_sjto
       and g.vgncia = r_vgncia
       and g.cdgo_clnte = 23001
       and g.id_impsto = 230012
       and g.cdgo_dclrcion_estdo in ('APL', 'PRS')
       and g.id_frmlrio = r_id_frmlrio
     order by g.fcha_prsntcion desc;

  v_vgncia                     number;
  v_id_prdo                    number;
  v_nmro_cnsctvo               number;
  v_vgncia_incial              number;
  v_nmro_cnsctvo_plca          number;
  v_id_frmlrio                 number := 764; --Formulario ANUAL
  v_cdgo_prdcdad               varchar2(3) := 'ANU';
  v_id_dclrcion_vgncia_frmlrio number;
  v_id_dclrcn_tpo              number;

begin
  delete from temp_t_canditatos_omisos;
  commit;

  for r1 in c1 loop
    begin
      -- Vigencia inicial sin conversiones implícitas (evita ORA-06502)
      v_vgncia_incial := greatest(p_vgncia_incial,
                                  nvl(extract(year from
                                              r1.fcha_incio_actvddes),
                                      p_vgncia_incial));

      for v_vgncia in v_vgncia_incial .. p_vgncia_fnal loop
        v_nmro_cnsctvo      := null;
        v_nmro_cnsctvo_plca := null;

        for r2 in c2(r1.id_sjto_impsto, v_vgncia, v_id_frmlrio) loop
          v_nmro_cnsctvo := r2.nmro_cnsctvo;
          exit;
        end loop;

        if v_nmro_cnsctvo is null then
          for r3 in c3(r1.idntfccion_sjto,
                       v_vgncia,
                       r1.id_sjto_impsto,
                       v_id_frmlrio) loop
            v_nmro_cnsctvo_plca := r3.nmro_cnsctvo;
            exit;
          end loop;
        end if;

        if v_nmro_cnsctvo is null then
          for r4 in c4(r1.idntfccion_sjto,
                       v_vgncia,
                       r1.id_sjto_impsto,
                       v_id_frmlrio) loop
            v_nmro_cnsctvo_plca := r4.nmro_cnsctvo;
            exit;
          end loop;
        end if;

        select a.id_prdo
          into v_id_prdo
          from df_i_periodos a
         where a.id_impsto = r1.id_impsto
           and a.id_impsto_sbmpsto = r1.id_impsto || 2
           and a.vgncia = v_vgncia
           and a.cdgo_prdcdad = v_cdgo_prdcdad;

        select a.id_dclrcion_vgncia_frmlrio, b.id_dclrcn_tpo
          into v_id_dclrcion_vgncia_frmlrio, v_id_dclrcn_tpo
          from gi_d_dclrcnes_vgncias_frmlr a
          join gi_d_dclrcnes_tpos_vgncias b
            on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
         where b.vgncia = v_vgncia
           and b.id_prdo = v_id_prdo
           and a.id_frmlrio = v_id_frmlrio;

        insert into temp_t_canditatos_omisos
        values
          (r1.id_sjto_impsto,
           v_vgncia,
           v_nmro_cnsctvo,
           v_nmro_cnsctvo_plca,
           v_id_prdo,
           v_id_dclrcion_vgncia_frmlrio,
           v_id_dclrcn_tpo,
           'N');

      end loop;

      commit;

    exception
      when others then
        dbms_output.put_line(r1.idntfccion_sjto || ' ' || SQLERRM);
        rollback;
    end;
  end loop;

  update temp_t_canditatos_omisos a
     set a.tne_fsca = 'S'
   where exists (select 1
            from fi_g_candidatos b
            join fi_g_candidatos_vigencia c
              on c.id_cnddto = b.id_cnddto
           where b.id_prgrma = 1
             and b.id_sbprgrma = 1
             and b.id_sjto_impsto = a.id_sjto_impsto
             and c.vgncia = a.vgncia
             and c.id_prdo = a.id_prdo);

  update temp_t_canditatos_omisos a
     set a.tne_fsca = 'S'
   where exists (select 1
            from fi_g_candidatos b
            join fi_g_candidatos_vigencia c
              on c.id_cnddto = b.id_cnddto
           where b.id_prgrma = 22
             and b.id_sbprgrma = 21
             and b.id_sjto_impsto = a.id_sjto_impsto
             and c.vgncia = a.vgncia
             and c.id_prdo = a.id_prdo);
  commit;
end temp_canditatos_omisos;
/

