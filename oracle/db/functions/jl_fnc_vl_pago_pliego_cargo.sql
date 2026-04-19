
  CREATE OR REPLACE EDITIONABLE FUNCTION "JL_FNC_VL_PAGO_PLIEGO_CARGO" (p_id_instncia_fljo in number)
  return varchar2 as

  pragma autonomous_transaction;

  v_id_cnddto            number;
  v_id_fsclzcion_expdnte number;
  v_cdgo_clnte           number;
  v_total                number;
  v_cdgo_rspsta          number;
  v_mnsje_rspsta         number;
  v_contador             number := 0;

begin

  --Se obtiene el candidato
  begin
    select a.id_cnddto, a.id_fsclzcion_expdnte, a.cdgo_clnte
      into v_id_cnddto, v_id_fsclzcion_expdnte, v_cdgo_clnte
      from v_fi_g_fiscalizacion_expdnte a
     where a.id_instncia_fljo = p_id_instncia_fljo;
  exception
    when no_data_found then
      return 'N';
    when others then
      return 'N';
  end;

  for c_vgncia in (select a.cdgo_clnte,
                          a.id_impsto,
                          a.id_impsto_sbmpsto,
                          a.id_sjto_impsto,
                          b.vgncia,
                          b.id_prdo,
                          b.id_lqdcion
                     from v_fi_g_candidatos a
                     join v_fi_g_fiscalizacion_expdnte_dtlle b
                       on a.id_cnddto = b.id_cnddto
                    where a.id_cnddto = v_id_cnddto) loop

    begin
      select sum(b.vlor_dbe) - sum(b.vlor_hber) as total
        into v_total
        from gf_g_movimientos_financiero a
        join gf_g_movimientos_detalle b
          on a.id_mvmnto_fncro = b.id_mvmnto_fncro
       where a.cdgo_clnte = c_vgncia.cdgo_clnte
         and a.id_impsto = c_vgncia.id_impsto
         and a.id_impsto_sbmpsto = c_vgncia.id_impsto_sbmpsto
         and a.id_sjto_impsto = c_vgncia.id_sjto_impsto
         and a.vgncia = c_vgncia.vgncia
         and a.id_prdo = c_vgncia.id_prdo
         and a.cdgo_mvmnto_orgn = 'FS'
         and a.id_orgen = c_vgncia.id_lqdcion;

    exception
      when others then
        return 'N';
    end;

    if v_total is null or v_total > 0 then
      return 'N';
    end if;

    v_contador := v_contador + 1;

  end loop;

  if v_contador = 0 then
    return 'N';
  end if;

  return 'S';

end JL_fnc_vl_pago_pliego_cargo;
/

