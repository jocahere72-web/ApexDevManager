
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CONVENIO_CORREGIR_TABLA_CARTERA" is
  v_vlor_intres number;
begin
  for r1 in (select *
               from v_gf_g_convenios g
              where g.id_cnvnio_tpo in (4, 5)
                   --      and g.id_cnvnio = 7237
                and g.nmro_cnvnio = 20210000803
              order by g.id_cnvnio) loop
    for r2 in (select g.*, d.id_cncpto_intres_mra
                 from v_gf_g_convenios_cartera g
                 join df_i_impuestos_acto_concepto d
                   on d.id_cncpto = g.id_cncpto
                  and d.vgncia = g.vgncia
                  and d.id_prdo = g.id_prdo
                where g.id_cnvnio = r1.id_cnvnio
                  and g.VLOR_INTRES > 0) loop
      for r3 in (select a.vgncia,
                        a.id_prdo,
                        a.prdo,
                        a.cdgo_cncpto,
                        a.dscrpcion_cncpto,
                        a.fcha_vncmnto,
                        a.dscrpcion_mvnt_fncro_estdo,
                        vlor_sldo_cptal,
                        vlor_intres,
                        vlor_ttal
                   from table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte        => r1.cdgo_clnte,
                                                                                   p_id_impsto         => r1.id_impsto,
                                                                                   p_id_impsto_sbmpsto => r1.id_impsto_sbmpsto,
                                                                                   p_id_sjto_impsto    => r1.id_sjto_impsto,
                                                                                   p_fcha_vncmnto      => r1.fcha_slctud)) a
                  where a.vgncia = r2.vgncia
                    and a.id_prdo = r2.id_prdo
                    and a.cdgo_cncpto = r2.cdgo_cncpto) loop

        for r4 in (select vlor_dscnto, vlor_sldo
                     from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => r1.cdgo_clnte,
                                                                                 p_id_impsto            => r1.id_impsto,
                                                                                 p_id_impsto_sbmpsto    => r1.id_impsto_sbmpsto,
                                                                                 p_vgncia               => r2.vgncia,
                                                                                 p_id_prdo              => r2.id_prdo,
                                                                                 p_id_cncpto_base       => r2.id_cncpto,
                                                                                 p_id_cncpto            => r2.id_cncpto_intres_mra,
                                                                                 p_id_orgen             => r2.id_orgen,
                                                                                 p_id_sjto_impsto       => r1.id_sjto_impsto,
                                                                                 p_fcha_pryccion        => r1.fcha_slctud,
                                                                                 p_vlor                 => r3.vlor_intres,
                                                                                 p_vlor_cptal           => r3.vlor_sldo_cptal,
                                                                                 p_cdgo_mvmnto_orgn     => r2.cdgo_mvmnto_orgen,
                                                                                 p_cdna_vgncia_prdo_pgo => r2.vgncia || ':' ||
                                                                                                           r2.prdo || ':' ||
                                                                                                           r2.cdgo_mvmnto_orgen || ':' ||
                                                                                                           r2.id_orgen || ':',
                                                                                 p_fcha_incio_cnvnio    => r1.fcha_slctud,
                                                                                 p_indcdor_clclo        => 'CLD'))) loop

          v_vlor_intres := r4.vlor_sldo - r4.vlor_dscnto;

          if r2.vlor_intres != v_vlor_intres then

            dbms_output.put_line('id_cnvnio: ' || r1.id_cnvnio ||
                                 ' Vigencia: ' || r2.vgncia ||
                                 ' Periodo: ' || r2.prdo ||
                                 ' Interes_Convenio: ' || r2.vlor_intres ||
                                 ' Interes_Proyectado: ' || r3.vlor_intres ||
                                 ' Interes Bancario: ' || r4.vlor_sldo ||
                                 ' Descuento: ' || r4.vlor_dscnto ||
                                 ' Nuevo interes: ' || v_vlor_intres

                                 );

            update gf_g_convenios_cartera g
               set g.vlor_intres = v_vlor_intres
             where g.id_cnvnio_crtra = r2.id_cnvnio_crtra;

          end if;
        end loop;

      end loop;
    end loop;
  end loop;
end TEMP_CONVENIO_CORREGIR_TABLA_CARTERA;
/

