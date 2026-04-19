
  CREATE OR REPLACE EDITIONABLE FUNCTION "TEMP_MNTO_RCDO_OTRAS_VIGENCIAS" (p_nmro_prcso_jrdco in number default null,
                                                          p_id_embrgos_crtra in number default null,
                                                          p_fcha_dsde        in date)
  return number is

  v_total          number := 0;
  v_id_sjto_impsto number;

begin
  if p_nmro_prcso_jrdco is not null then
    -- Obtener el sujeto del proceso jurídico
    select distinct m.id_sjto_impsto
      into v_id_sjto_impsto
      from cb_g_procesos_juridico p
      join cb_g_procesos_jrdco_mvmnto m
        on p.id_prcsos_jrdco = m.id_prcsos_jrdco
     where p.nmro_prcso_jrdco = p_nmro_prcso_jrdco
       and rownum = 1; -- Tomar solo uno porque debe ser único por proceso

    -- Suma pagos del sujeto, excluyendo las vigencias del proceso jurídico
    select sum(d.vlor_hber)
      into v_total
      from gf_g_movimientos_detalle d
      join gf_g_movimientos_financiero f
        on d.id_mvmnto_fncro = f.id_mvmnto_fncro
     where trunc(d.fcha_mvmnto) >= trunc(p_fcha_dsde)
       and d.vlor_hber > 0
       and d.cdgo_mvmnto_orgn = 'RE'
       and d.cdgo_mvmnto_tpo in ('PC', 'PI')
       and f.id_sjto_impsto = v_id_sjto_impsto
       and not exists
     (select 1
              from cb_g_procesos_juridico p
              join cb_g_procesos_jrdco_mvmnto m
                on p.id_prcsos_jrdco = m.id_prcsos_jrdco
             where p.nmro_prcso_jrdco = p_nmro_prcso_jrdco
               and m.id_mvmnto_fncro = d.id_mvmnto_fncro);

  elsif p_id_embrgos_crtra is not null then
    -- Obtener el sujeto del embargo
    select distinct d.id_sjto_impsto
      into v_id_sjto_impsto
      from mc_g_embargos_cartera c
      join mc_g_embargos_cartera_detalle d
        on c.id_embrgos_crtra = d.id_embrgos_crtra
     where c.id_embrgos_crtra = p_id_embrgos_crtra
       and rownum = 1; -- Tomar solo uno porque debe ser único por embargo

    -- Suma pagos del sujeto, excluyendo las vigencias embargadas
    select sum(d.vlor_hber)
      into v_total
      from gf_g_movimientos_detalle d
      join gf_g_movimientos_financiero f
        on d.id_mvmnto_fncro = f.id_mvmnto_fncro
     where trunc(d.fcha_mvmnto) >= trunc(p_fcha_dsde)
       and d.vlor_hber > 0
       and d.cdgo_mvmnto_orgn = 'RE'
       and d.cdgo_mvmnto_tpo in ('PC', 'PI')
       and f.id_sjto_impsto = v_id_sjto_impsto
       and not exists
     (select 1
              from mc_g_embargos_cartera c
              join mc_g_embargos_cartera_detalle e
                on c.id_embrgos_crtra = e.id_embrgos_crtra
             where c.id_embrgos_crtra = p_id_embrgos_crtra
               and e.id_mvmnto_fncro = d.id_mvmnto_fncro);
  end if;

  return nvl(v_total, 0);
end;
/

