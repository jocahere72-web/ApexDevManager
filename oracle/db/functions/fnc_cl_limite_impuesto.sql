
  CREATE OR REPLACE EDITIONABLE FUNCTION "FNC_CL_LIMITE_IMPUESTO" (p_id_lqdcion in number,
                                                  p_id_cncpto  number)
  return varchar2 is

  v_vlor_lqddo_antrior gi_g_liquidaciones_concepto.vlor_lqddo%type;
  v_lqdcion_ley44      gi_g_liquidaciones_concepto.vlor_lqddo%type;
  v_lqdcion_ipcMasOcho gi_g_liquidaciones_concepto.vlor_lqddo%type;
  v_lqdcion_cincuenta  gi_g_liquidaciones_concepto.vlor_lqddo%type;
  v_lqdcion_ipc        gi_g_liquidaciones_concepto.vlor_lqddo%type;
  v_lqdcion_lotes_6    gi_g_liquidaciones_concepto.vlor_lqddo%type;
  v_lqdcion_28_acu034  gi_g_liquidaciones_concepto.vlor_lqddo%type;
  v_lqdcion_actal      gi_g_liquidaciones_concepto.vlor_lqddo%type;
  v_vlor_ipc           df_s_indicadores_economico.vlor%type;
  v_ipcMasocho         number(16, 2);
  v_mnsje              varchar2(100);
  v_vgncia             gi_g_liquidaciones.vgncia%type;
  v_id_sjto_impsto     si_i_sujetos_impuesto.id_sjto_impsto%type;
  v_rdndeo             number;
  v_vgncia_actlzda     si_i_predios.vgncia_actlzda%type;

begin

  --valida liquidacion actual
  begin
    select b.vlor_lqddo, a.vgncia, a.id_sjto_impsto, c.vgncia_actlzda
      into v_lqdcion_actal, v_vgncia, v_id_sjto_impsto, v_vgncia_actlzda
      from gi_g_liquidaciones a
      join v_gi_g_liquidaciones_concepto b
        on b.id_lqdcion = a.id_lqdcion
      join si_i_predios c
        on c.id_sjto_impsto = a.id_sjto_impsto
     where a.id_lqdcion = p_id_lqdcion
       and a.cdgo_lqdcion_estdo in ('L', 'P')
       and b.id_cncpto = p_id_cncpto;
  exception
    when others then
      v_lqdcion_actal := 0;
      v_mnsje         := 'No se encontró liquidación actual';
      return v_mnsje;
  end;

  --buscamos el valor liquidado en la vigencia anterior
  begin
    select b.vlor_lqddo
      into v_vlor_lqddo_antrior
      from gi_g_liquidaciones a
      join v_gi_g_liquidaciones_concepto b
        on b.id_lqdcion = a.id_lqdcion
     where a.id_sjto_impsto = v_id_sjto_impsto
       and a.vgncia = v_vgncia - 1
       and a.cdgo_lqdcion_estdo in ('L', 'P')
       and b.id_cncpto = p_id_cncpto;
  exception
    when others then
      v_vlor_lqddo_antrior := 0;
      v_mnsje              := 'No se encontró liquidación anterior';
      return v_mnsje;
  end;

  if v_vgncia <= 2024 then
    v_rdndeo := -2;
  else
    v_rdndeo := -3;
  end if;

  if v_vlor_lqddo_antrior > 0 then
    --validamos ley 44
    v_lqdcion_ley44 := round(v_vlor_lqddo_antrior * 2, v_rdndeo);
    if v_lqdcion_actal = v_lqdcion_ley44 then
      return 'Límite ley 44';
    end if;

    begin
      select t.vlor
        into v_vlor_ipc
        from df_s_indicadores_economico t
       where t.cdgo_indcdor_tpo = 'IPC'
         and to_char(t.fcha_hsta, 'yyyy') = to_char(v_vgncia - 1);
    exception
      when others then
        v_vlor_ipc := 0;
    end;

    v_ipcMasocho := v_vlor_ipc + 8;

    --validacion item 1 ley 1995 ipc+8 puntos
    v_lqdcion_ipcMasOcho := round((v_vlor_lqddo_antrior *
                                  (1 + (v_ipcMasocho / 100))),
                                  v_rdndeo);

    v_lqdcion_cincuenta := round(v_vlor_lqddo_antrior * (1.5), v_rdndeo);

    v_lqdcion_ipc := round(v_vlor_lqddo_antrior * (1 + (v_vlor_ipc / 100)),
                           v_rdndeo);

    v_lqdcion_lotes_6 := round(v_vlor_lqddo_antrior * 6, v_rdndeo);

    v_lqdcion_28_acu034 := round(v_vlor_lqddo_antrior * 1.25, v_rdndeo);

    if (v_lqdcion_actal = v_lqdcion_lotes_6) then
      return 'Límite acuerdo 034 lote 6 veces';
    elsif v_lqdcion_actal = v_lqdcion_cincuenta and
          (v_vgncia_actlzda is null or (v_vgncia - v_vgncia_actlzda > 5)) then
      return 'Límite ley 1995, 50%';
    elsif (v_lqdcion_actal = v_lqdcion_ipcMasOcho) then
      return 'Límite ley 1995, ipc + 8';
    elsif (v_lqdcion_actal = v_lqdcion_ipc) then
      return 'Límite ley 1995, estratos 1 y 2 100% ipc';
    elsif v_lqdcion_actal = v_lqdcion_28_acu034 then
      return 'Límite acuerdo 034 25%';
    else
      return 'No limitó impuesto';
    end if;

  else
    return 'No limitó impuesto';
  end if;

end fnc_cl_limite_impuesto;
/

