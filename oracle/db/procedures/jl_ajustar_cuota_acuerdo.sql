
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_AJUSTAR_CUOTA_ACUERDO" (p_nmro_dcmnto number,
                                                     p_nmro_cta    number) is
  v_id_cnvnio number;
  v_vlor_cta  number;
  v_id_dcmnto number;

  v_intres_vncdo     number;
  v_vlor_ttal_dcmnto number;
  v_dfrncia          number;

  v_fcha_vncmnto date;
  v_prcntaje     number;
  v_vlor_ajstar  number;
begin

  select a.id_cnvnio, a.id_dcmnto, a.vlor_ttal_dcmnto
    into v_id_cnvnio, v_id_dcmnto, v_vlor_ttal_dcmnto
    from re_g_documentos a
   where a.nmro_dcmnto = p_nmro_dcmnto;

  select a.vlor_ttal, a.fcha_vncmnto
    into v_vlor_cta, v_fcha_vncmnto
    from gf_g_convenios_extracto a
   where a.id_cnvnio = v_id_cnvnio
     and a.nmro_cta = p_nmro_cta;

  v_dfrncia := v_vlor_cta - v_vlor_ttal_dcmnto;

  update re_g_documentos a
     set a.vlor_ttal_dbe    = v_vlor_cta,
         a.vlor_ttal_dcmnto = v_vlor_cta,
         a.vlor_ttal        = v_vlor_cta,
         a.fcha_dcmnto      = v_fcha_vncmnto,
         a.fcha_vncmnto     = v_fcha_vncmnto
   where a.nmro_dcmnto = p_nmro_dcmnto;

  select sum(a.vlor_dbe)
    into v_intres_vncdo
    from re_g_documentos_detalle a
   where a.id_dcmnto = v_id_dcmnto
     and a.cdgo_cncpto_tpo_cnvnio = 'IV';

  if v_intres_vncdo > 0 then

    for r1 in (select a.*
                 from re_g_documentos_detalle a
                where a.id_dcmnto = v_id_dcmnto
                  and a.cdgo_cncpto_tpo_cnvnio = 'IV') loop
      v_prcntaje    := r1.vlor_dbe / v_intres_vncdo;
      v_vlor_ajstar := round(v_dfrncia * v_prcntaje);

      dbms_output.put_line('Detale: ' || r1.id_dcmnto_dtlle ||
                           ' Valor: Ajustar: ' || v_vlor_ajstar ||
                           ' Total: ' || (r1.vlor_dbe + v_vlor_ajstar));

      update re_g_documentos_detalle a
         set a.vlor_dbe = a.vlor_dbe + v_vlor_ajstar
       where a.id_dcmnto_dtlle = r1.id_dcmnto_dtlle;

    end loop;
  else
    dbms_output.put_line('No hay interes vencido para ajustar');
  end if;

end jl_ajustar_cuota_acuerdo;
/

