
  CREATE OR REPLACE EDITIONABLE FUNCTION "TEMP_MNTO_RCDO" (p_nmro_prcso_jrdco in number default null,
                                          p_id_embrgos_crtra in number default null,
                                          p_fcha_dsde        in date)
  return number is

  cursor c7 is
    select b.id_mvmnto_fncro
      from mc_g_embargos_cartera a
      join mc_g_embargos_cartera_detalle b
        on b.id_embrgos_crtra = a.id_embrgos_crtra
     where a.id_embrgos_crtra = p_id_embrgos_crtra
     group by b.id_mvmnto_fncro
     order by b.id_mvmnto_fncro;

  cursor c8 is
    select b.id_mvmnto_fncro
      from cb_g_procesos_juridico a
      join cb_g_procesos_jrdco_mvmnto b
        on b.id_prcsos_jrdco = a.id_prcsos_jrdco
     where a.nmro_prcso_jrdco = p_nmro_prcso_jrdco
     group by b.id_mvmnto_fncro
     order by b.id_mvmnto_fncro;

  cursor c9(r_id_mvmnto_fncro number) is
    select sum(a.vlor_hber) rcudo
      from gf_g_movimientos_detalle a
     where a.id_mvmnto_fncro = r_id_mvmnto_fncro
       and a.cdgo_mvmnto_orgn = 'RE'
       and a.cdgo_mvmnto_tpo in ('PC', 'PI')
       and trunc(a.fcha_mvmnto) >= trunc(p_fcha_dsde)
       and a.vlor_hber > 0;

  v_vlor_rcdo number;

begin
  v_vlor_rcdo := 0;

  if p_nmro_prcso_jrdco is not null then

    for r8 in c8 loop
      for r9 in c9(r8.id_mvmnto_fncro) loop
        v_vlor_rcdo := v_vlor_rcdo + nvl(r9.rcudo, 0);
      end loop;
    end loop;
    return v_vlor_rcdo;
  end if;

  if p_id_embrgos_crtra is not null then

    for r7 in c7 loop
      for r9 in c9(r7.id_mvmnto_fncro) loop
        v_vlor_rcdo := v_vlor_rcdo + nvl(r9.rcudo, 0);
      end loop;
    end loop;
    return v_vlor_rcdo;
  end if;

end;
/

