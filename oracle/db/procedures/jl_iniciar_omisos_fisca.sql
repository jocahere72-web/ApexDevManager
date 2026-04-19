
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_INICIAR_OMISOS_FISCA" (p_impsto            number,
                                                    p_id_impsto_sbmpsto number,
                                                    p_id_lte            number,
                                                    p_id_fmlro          number,
                                                    p_vgncia_incial     number,
                                                    p_vgncia_fnal       number,
                                                    p_usa_fcha_temporal varchar2 default 'N') is

  cursor c1(r_id_prgrma number, r_id_sbprgrma number) is
  /*
                                       --Consulta autoretenedores
                                       select cdgo_clnte, id_sjto_impsto, id_impsto, fcha_incio_actvddes
                                          from (select a.cdgo_clnte,
                                                       a.id_impsto,
                                                       a.id_sjto_impsto,
                                                       b.idntfccion_sjto,
                                                       c.nmbre_rzon_scial,
                                                       b.email,
                                                       a.vgncia,
                                                       a.nmro_cnsctvo,
                                                       trunc(a.fcha_prsntcion) fcha_prsntcion,
                                                       a.vlor_ttal,
                                                       r3.id_dclrcion,
                                                       c.fcha_incio_actvddes
                                                  from gi_g_declaraciones a
                                                  join v_si_i_sujetos_impuesto b
                                                    on b.id_sjto_impsto = a.id_sjto_impsto
                                                   and b.id_sjto_estdo = 1
                                                  join v_si_i_personas c
                                                    on c.id_sjto_impsto = a.id_sjto_impsto
                                                  left join (select t.id_frmlrio,
                                                                   t.id_dclrcion_vgncia_frmlrio,
                                                                   a.vgncia,
                                                                   a.id_prdo,
                                                                   b.fcha_fnal
                                                              from gi_d_dclrcnes_vgncias_frmlr t
                                                              join gi_d_dclrcnes_tpos_vgncias a
                                                                on a.id_dclrcion_tpo_vgncia =
                                                                   t.id_dclrcion_tpo_vgncia
                                                              join gi_d_dclrcnes_fcha_prsntcn b
                                                                on b.id_dclrcion_tpo_vgncia =
                                                                   a.id_dclrcion_tpo_vgncia
                                                             where t.id_dclrcion_vgncia_frmlrio = 9821
                                                               and (b.vlor is null or b.vlor = '0')
                                                               and trunc(b.fcha_fnal) < trunc(sysdate)) r2
                                                    on 1 = 1 -- aquí simula el uso del cursor 2 con parámetros adecuados
                                                  left join (select a.id_sjto_impsto,
                                                                   a.id_dclrcion_vgncia_frmlrio,
                                                                   a.id_dclrcion,
                                                                   a.nmro_cnsctvo,
                                                                   a.fcha_prsntcion,
                                                                   a.vlor_pago
                                                              from gi_g_declaraciones a
                                                             where a.cdgo_dclrcion_estdo = 'APL'
                                                               and a.id_dclrcion =
                                                                   (select max(b.id_dclrcion)
                                                                      from gi_g_declaraciones b
                                                                     where b.id_sjto_impsto = a.id_sjto_impsto
                                                                       and b.cdgo_dclrcion_estdo = 'APL'
                                                                       and b.id_dclrcion_vgncia_frmlrio =
                                                                           a.id_dclrcion_vgncia_frmlrio)) r3
                                                    on r3.id_sjto_impsto = a.id_sjto_impsto
                                                   and r3.id_dclrcion_vgncia_frmlrio =
                                                       r2.id_dclrcion_vgncia_frmlrio
                                                  join df_i_periodos p
                                                    on r2.id_prdo = p.id_prdo
                                                 where a.id_dclrcion_vgncia_frmlrio = 9781
                                                   and a.cdgo_dclrcion_estdo = 'APL'
                                                   and b.id_sjto_impsto not in (3182093, 3154199)
                                                   and not exists
                                                 (select 1
                                                          from fi_g_candidatos d
                                                          join fi_g_candidatos_vigencia v
                                                            on v.id_cnddto = d.id_cnddto
                                                           and v.id_prdo = a.id_prdo
                                                         where d.id_sjto_impsto = a.id_sjto_impsto
                                                           and d.id_prgrma = r_id_prgrma
                                                           and d.id_sbprgrma = r_id_sbprgrma)
                                                   and a.id_dclrcion =
                                                       (select max(b.id_dclrcion)
                                                          from gi_g_declaraciones b
                                                         where b.id_sjto_impsto = a.id_sjto_impsto
                                                           and b.cdgo_dclrcion_estdo = 'APL'
                                                           and b.id_dclrcion_vgncia_frmlrio =
                                                               a.id_dclrcion_vgncia_frmlrio)) z
                                         where z.id_dclrcion is null
                                         order by z.idntfccion_sjto, z.vgncia;*/

    select b.cdgo_clnte,
           b.id_sjto_impsto,
           b.id_impsto,
           a.idntfccion,
           c.fcha_incio_actvddes,
           a.vlor_char
      from temp_identificaciones a
      join v_si_i_sujetos_impuesto b
        on b.id_impsto = p_impsto
       and b.idntfccion_sjto = a.idntfccion
      join si_i_personas c
        on c.id_sjto_impsto = b.id_sjto_impsto
     order by a.idntfccion;

  cursor c2(r_fcha_incio_actvddes date, r_id_sjto_impsto number) is
    select *
      from gi_d_dclrcnes_vgncias_frmlr t
      join gi_d_dclrcnes_tpos_vgncias a
        on a.id_dclrcion_tpo_vgncia = t.id_dclrcion_tpo_vgncia
      join gi_d_dclrcnes_fcha_prsntcn b
        on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
     where t.id_frmlrio = p_id_fmlro
       and a.vgncia between p_vgncia_incial and p_vgncia_fnal
       and (b.vlor is null or b.vlor = '0')
       and trunc(b.fcha_fnal) < trunc(sysdate)
       and trunc(b.fcha_fnal) > trunc(r_fcha_incio_actvddes)
       and not exists (select 1
              from fi_g_candidatos d
              join fi_g_candidatos_vigencia e
                on e.id_cnddto = d.id_cnddto
             where d.id_prgrma = 1
               and d.id_sbprgrma = 1
               and d.id_sjto_impsto = r_id_sjto_impsto
               and e.vgncia = a.vgncia
               and e.id_prdo = a.id_prdo)
       and not exists (select 1
              from fi_g_candidatos d
              join fi_g_candidatos_vigencia e
                on e.id_cnddto = d.id_cnddto
             where d.id_prgrma = 22
               and d.id_sbprgrma = 21
               and d.id_sjto_impsto = r_id_sjto_impsto
               and e.vgncia = a.vgncia
               and e.id_prdo = a.id_prdo)
     order by t.id_dclrcion_vgncia_frmlrio;

  cursor c3(r_id_sjto_impsto             number,
            r_id_prdo                    number,
            r_id_dclrcion_vgncia_frmlrio number) is
    select max(a.nmro_cnsctvo) nmro_cnsctvo
      from gi_g_declaraciones a
     where a.id_sjto_impsto = r_id_sjto_impsto
       and a.id_prdo = r_id_prdo
       and a.id_dclrcion_vgncia_frmlrio = r_id_dclrcion_vgncia_frmlrio
       and a.cdgo_dclrcion_estdo = 'APL';

  v_id_prgrma           number;
  v_id_sbprgrma         number;
  v_nmro_cnsctvo        number;
  v_id_cnddto           NUMBER;
  v_fcha_incio_actvddes date;

begin

  select a.id_prgrma, a.id_sbprgrma
    into v_id_prgrma, v_id_sbprgrma
    from fi_g_fiscalizacion_lote a
   where a.id_fsclzcion_lte = p_id_lte;

  for r1 in c1(v_id_prgrma, v_id_sbprgrma) loop
    v_id_cnddto := NULL;
    insert into fi_g_candidatos
      (cdgo_clnte,
       id_impsto,
       id_impsto_sbmpsto,
       id_sjto_impsto,
       id_fsclzcion_lte,
       id_prgrma,
       id_sbprgrma,
       indcdor_asgndo,
       cdgo_cnddto_estdo,
       id_cnddto_pdre,
       actvo)
    values
      (r1.cdgo_clnte,
       r1.id_impsto,
       p_id_impsto_sbmpsto,
       r1.id_sjto_impsto,
       p_id_lte,
       v_id_prgrma,
       v_id_sbprgrma,
       'N',
       'ACT',
       null,
       'S')
    RETURNING ID_CNDDTO INTO v_id_cnddto;

    --Validacion de fecha de inicio
    if p_usa_fcha_temporal = 'S' then
      v_fcha_incio_actvddes := to_date(r1.vlor_char || '0601', 'yyyymmdd');
    else
      v_fcha_incio_actvddes := r1.fcha_incio_actvddes;
    end if;

    for r2 in c2(v_fcha_incio_actvddes, r1.id_sjto_impsto) loop
      v_nmro_cnsctvo := null;
      for r3 in c3(r1.id_sjto_impsto,
                   r2.id_prdo,
                   r2.id_dclrcion_vgncia_frmlrio) loop
        v_nmro_cnsctvo := r3.nmro_cnsctvo;
      end loop;

      if v_nmro_cnsctvo is null then
        insert into fi_g_candidatos_vigencia
          (id_cnddto,
           vgncia,
           id_prdo,
           id_dclrcion_vgncia_frmlrio,
           indcdor_fsclzcion_tpo)
        values
          (v_id_cnddto,
           R2.vgncia,
           R2.id_prdo,
           R2.id_dclrcion_vgncia_frmlrio,
           'DC');
      else
        dbms_output.put_line(r1.idntfccion || ';' || R2.vgncia);
      end if;
    end loop;
  end loop;

  delete from fi_g_candidatos a
   where not exists (select 1
            from fi_g_candidatos_vigencia b
           where b.id_cnddto = a.id_cnddto)
     and a.id_fsclzcion_lte = p_id_lte;

  COMMIT;

end jl_iniciar_omisos_fisca;
/

