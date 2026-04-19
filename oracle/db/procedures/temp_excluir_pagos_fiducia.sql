
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_EXCLUIR_PAGOS_FIDUCIA" (P_FCHA_MES varchar2) is

  cursor c1 is
  /*select r.id_rcdo, r.nmro_dcmnto
          from re_g_recaudos r
         where r.nmro_dcmnto in ();*/

  --pagos duplicados

    select r.nmro_dcmnto,
           r.id_rcdo,
           trunc(r.fcha_rcdo) fcha_rcdo,
           r.vlor,
           sum(d.vlor_ttal) detalle
      from re_g_recaudos r
      join v_re_g_recaudos_detalle d
        on r.id_rcdo = d.id_rcdo
     where r.cdgo_rcdo_estdo = 'AP'
       and to_char(r.fcha_rcdo, 'YYYYMM') = P_FCHA_MES
    --and r.nmro_dcmnto = 20210058125
     group by r.nmro_dcmnto, r.id_rcdo, r.vlor, trunc(r.fcha_rcdo)
    having r.vlor != sum(d.vlor_ttal);

  cursor c2(r_id_rcdo number) is
    select max(c.id_rcdo_lte_cnclcion) id_rcdo_lte_cnclcion
      from re_g_recaudos_cncpto_cnclcn c
     where c.id_rcdo = r_id_rcdo;

  o_cdgo_rspsta          number;
  o_mnsje_rspsta         varchar2(100);
  v_id_rcdo_lte_cnclcion number;
begin

  for r1 in c1 loop

    v_id_rcdo_lte_cnclcion := NULL;

    for r2 in c2(r1.id_rcdo) loop
      v_id_rcdo_lte_cnclcion := r2.id_rcdo_lte_cnclcion;
    end loop;

    if v_id_rcdo_lte_cnclcion is not null then
      pkg_re_recaudos_conciliacion.prc_el_recaudo_conciliacion(23001,
                                                               v_id_rcdo_lte_cnclcion,
                                                               r1.nmro_dcmnto,
                                                               o_cdgo_rspsta,
                                                               o_mnsje_rspsta);
      dbms_output.put_line(r1.id_rcdo || ': ' || o_mnsje_rspsta);
    else
      dbms_output.put_line(r1.id_rcdo || ' no se encuentra conciliado');
    end if;
  end loop;
end;
/

