
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_PRC_PAGO_DUPLICADO" (p_id_rcdo number) is

  cursor c1 is
    select a.id_rcdo,
           a.id_sjto_impsto,
           valor_detalle / a.vlor proporcion,
           a.id_sldo_fvor,
           a.vlor
      from re_g_recaudos a
      join (select x.id_rcdo, sum(x.vlor_ttal) as valor_detalle
              from v_re_g_recaudos_detalle x
             group by x.id_rcdo) b
        on a.id_rcdo = b.id_rcdo
       and a.vlor <> b.valor_detalle
     where cdgo_rcdo_estdo = 'AP'
       and (extract(year from fcha_rcdo) = extract(year from sysdate) or
           p_id_rcdo is not null)
       and (a.id_rcdo = p_id_rcdo or p_id_rcdo is null)
       and a.vlor > 0;

begin

  for r1 in c1 loop

    if r1.proporcion = 2 and r1.id_sldo_fvor is null then

      update gf_g_movimientos_detalle
         set llve_unca =
             (lpad(id_mvmnto_fncro || cdgo_mvmnto_orgn || id_orgen ||
                   cdgo_mvmnto_tpo || vgncia || id_prdo || id_cncpto ||
                   id_cncpto_csdo || vlor_dbe || vlor_hber ||
                   id_impsto_acto_cncpto,
                   200,
                   0))
       where cdgo_mvmnto_orgn = 'RE'
         and id_orgen in (select a.id_rcdo
                            from re_g_recaudos a
                            join (select x.id_rcdo, sum(x.vlor_ttal) as valor
                                   from v_re_g_recaudos_detalle x
                                  group by x.id_rcdo) b
                              on a.id_rcdo = b.id_rcdo
                             and a.vlor <> b.valor
                           where cdgo_rcdo_estdo = 'AP'
                             and a.id_rcdo = r1.id_rcdo
                             and a.vlor > 0);
      commit;

      for c_rcdo in (select a.id_rcdo, a.vlor
                       from re_g_recaudos a
                       join (select x.id_rcdo, sum(x.vlor_ttal) as valor
                              from v_re_g_recaudos_detalle x
                             group by x.id_rcdo) b
                         on a.id_rcdo = b.id_rcdo
                        and a.vlor <> b.valor
                      where cdgo_rcdo_estdo = 'AP'
                        and a.id_rcdo = r1.id_rcdo
                        and a.vlor > 0

                     ) loop

        for c_crtra in (select z.key, count(*) as nn
                          from (select lpad(id_mvmnto_fncro ||
                                            cdgo_mvmnto_orgn || id_orgen ||
                                            cdgo_mvmnto_tpo || vgncia ||
                                            id_prdo || id_cncpto ||
                                            id_cncpto_csdo || vlor_dbe ||
                                            vlor_hber ||
                                            id_impsto_acto_cncpto,
                                            200,
                                            0) as key
                                  from gf_g_movimientos_detalle
                                 where id_orgen = c_rcdo.id_rcdo
                                   and cdgo_mvmnto_orgn = 'RE') z
                         group by z.key

                        ) loop

          delete from gf_g_movimientos_detalle
           where llve_unca = c_crtra.key
             and rownum <= (c_crtra.nn - 1);

        end loop;

        declare
          v_vlor_ttal number;
        begin

          select sum(vlor_ttal)
            into v_vlor_ttal
            from v_re_g_recaudos_detalle
           where id_rcdo = c_rcdo.id_rcdo;

          if r1.vlor = v_vlor_ttal then
            commit;
            dbms_output.put_line('Procesado recaudo: ' || r1.id_rcdo);
          else
            rollback;
          end if;

        end;

      end loop;

      pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte     => 23001,
                                                                p_id_sjto_impsto => r1.id_sjto_impsto);
      commit;

    elsif r1.id_sldo_fvor is not null then

      update re_g_recaudos r
         set r.id_sldo_fvor = null
       where r.id_rcdo = r1.id_rcdo;

      delete gf_g_saldos_favor_vigencia
       where id_sldo_fvor = r1.id_sldo_fvor;

      delete gf_g_saldos_favor where id_sldo_fvor = r1.id_sldo_fvor;

      declare
        v_vlor_ttal number;
      begin

        select sum(vlor_ttal)
          into v_vlor_ttal
          from v_re_g_recaudos_detalle
         where id_rcdo = r1.id_rcdo;

        if r1.vlor = v_vlor_ttal then
          commit;
          dbms_output.put_line('Procesado recaudo con saldo a favor: ' ||
                               r1.id_rcdo);
        else
          rollback;
        end if;

      end;

    end if;

  end loop;

end jl_prc_pago_duplicado;
/

