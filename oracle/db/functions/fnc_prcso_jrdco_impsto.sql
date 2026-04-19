
  CREATE OR REPLACE EDITIONABLE FUNCTION "FNC_PRCSO_JRDCO_IMPSTO" (p_id_prcsos_jrdco in number)
  return number is

  v_id_impsto      number;
  v_id_sjto_impsto number;

begin

  begin
    select d.id_sjto_impsto
      into v_id_sjto_impsto
      from cb_g_procesos_jrdco_mvmnto d
      join cb_g_procesos_juridico j
        on d.id_prcsos_jrdco = j.id_prcsos_jrdco
     where j.id_prcsos_jrdco = p_id_prcsos_jrdco
     group by d.id_sjto_impsto;
  exception
    when others then
      return null;
  end;

  begin
    select a.id_impsto
      into v_id_impsto
      from si_i_sujetos_impuesto a
     where a.id_sjto_impsto = v_id_sjto_impsto;
  exception
    when others then
      return null;
  end;

  return v_id_impsto;
end;
/

