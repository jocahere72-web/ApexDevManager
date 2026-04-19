
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_EMAIL_VENCIMIENTO_DECLARACIONES" (p_cdgo_clnte number,
                                                               p_dias       number) is

  --Vencimiento Declaracion Autorretenedores
  cursor c1 is
    select a.id_dclrcion_fcha_prsntcion,
           d.vgncia,
           d.dscrpcion dscrpcion_prdo,
           trunc(a.fcha_fnal) fcha_prsntcion,
           c.id_dclrcion_vgncia_frmlrio
      from gi_d_dclrcnes_fcha_prsntcn a
      join gi_d_dclrcnes_tpos_vgncias b
        on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
      join gi_d_dclrcnes_vgncias_frmlr c
        on c.id_dclrcion_tpo_vgncia = b.id_dclrcion_tpo_vgncia
      join df_i_periodos d
        on d.id_prdo = b.id_prdo
     where c.id_frmlrio = 804 -- Autorretencion
       and trunc(a.fcha_fnal) >= trunc(sysdate)
       and trunc(a.fcha_fnal) = trunc(sysdate) + p_dias;

  --Vencimiento Declaracion Reteica
  cursor c2 is
    select a.id_dclrcion_fcha_prsntcion,
           d.vgncia,
           d.dscrpcion dscrpcion_prdo,
           trunc(a.fcha_fnal) fcha_prsntcion,
           c.id_dclrcion_vgncia_frmlrio
      from gi_d_dclrcnes_fcha_prsntcn a
      join gi_d_dclrcnes_tpos_vgncias b
        on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
      join gi_d_dclrcnes_vgncias_frmlr c
        on c.id_dclrcion_tpo_vgncia = b.id_dclrcion_tpo_vgncia
      join df_i_periodos d
        on d.id_prdo = b.id_prdo
     where c.id_frmlrio = 684 -- Reteica
       and trunc(a.fcha_fnal) >= trunc(sysdate)
       and trunc(a.fcha_fnal) = trunc(sysdate) + p_dias;

  --Autorretenedores
  cursor c3(r_id_dclrcion_vgncia_frmlrio number) is
    select a.idntfccion, a.id_sjto_impsto, a.nmro_rslcion, a.fcha_rslcion
      from temp_identificacion_auto_retenedores a
      join si_i_sujetos_impuesto b
        on b.id_sjto_impsto = a.id_sjto_impsto
     where b.id_sjto_estdo = 1
       and not exists (select 1
              from gi_g_declaraciones c
             where c.id_sjto_impsto = a.id_sjto_impsto
               and c.id_dclrcion_vgncia_frmlrio =
                   r_id_dclrcion_vgncia_frmlrio
               and c.cdgo_dclrcion_estdo = 'APL')
     order by a.idntfccion;

  --Agentes de retencion
  cursor c4(r_id_dclrcion_vgncia_frmlrio number) is
    select a.idntfccion, a.id_sjto_impsto, a.nmro_rslcion, a.fcha_rslcion
      from temp_agentes_retencion a
      join si_i_sujetos_impuesto b
        on b.id_sjto_impsto = a.id_sjto_impsto
     where b.id_sjto_estdo = 1
       and not exists (select 1
              from gi_g_declaraciones c
             where c.id_sjto_impsto = a.id_sjto_impsto
               and c.id_dclrcion_vgncia_frmlrio =
                   r_id_dclrcion_vgncia_frmlrio
               and c.cdgo_dclrcion_estdo = 'APL')
     order by a.idntfccion;

  v_json_parametros clob;

begin

  for r1 in c1 loop
    for r3 in c3(r1.id_dclrcion_vgncia_frmlrio) loop

      select json_object(key 'p_id_sjto_impsto' is r3.id_sjto_impsto,
                         key 'p_id_dclrcion_fcha_prsntcion' is
                         r1.id_dclrcion_fcha_prsntcion)
        into v_json_parametros
        from dual;

      pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte     => p_cdgo_clnte,
                                            p_idntfcdor      => 'recordatorioAutoRetenedores',
                                            p_json_prmtros   => v_json_parametros,
                                            p_id_sjto_impsto => r3.id_sjto_impsto);
    end loop;
  end loop;

  for r2 in c2 loop
    for r4 in c4(r2.id_dclrcion_vgncia_frmlrio) loop

      select json_object(key 'p_id_sjto_impsto' is r4.id_sjto_impsto,
                         key 'p_id_dclrcion_fcha_prsntcion' is
                         r2.id_dclrcion_fcha_prsntcion)
        into v_json_parametros
        from dual;

      pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte     => p_cdgo_clnte,
                                            p_idntfcdor      => 'recordatorioRetenedores',
                                            p_json_prmtros   => v_json_parametros,
                                            p_id_sjto_impsto => r4.id_sjto_impsto);
    end loop;
  end loop;

end JL_EMAIL_VENCIMIENTO_DECLARACIONES;
/

