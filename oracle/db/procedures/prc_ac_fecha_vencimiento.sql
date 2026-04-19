
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_AC_FECHA_VENCIMIENTO" (p_cdgo_clnte          in number
                                                    , p_id_impsto           in number
                                                    , p_id_impsto_sbmpsto   in number
                                                    , p_vgncia              in number
                                                    , p_id_prdo             in number
													, p_fcha_vncmnto		in date
                                                    , o_cdgo_rspsta         out number
                                                    , o_mnsje_rspsta        out varchar2) as
    v_count                 number  := 0;
    p_fcha_vncmnto_actual   date;

begin
    delete from gti_aux; commit;
    for c_sjto in (select *
                     from v_gf_g_cartera_x_vigencia
                    where cdgo_clnte                    = p_cdgo_clnte
                      and id_impsto                     = p_id_impsto
                      and id_impsto_sbmpsto             = p_id_impsto_sbmpsto
                      and vgncia                        = p_vgncia
                      and id_prdo                       = p_id_prdo
                      and vlor_sldo_cptal               > 0
                      and cdgo_mvnt_fncro_estdo         = 'NO'
                      and indcdor_mvmnto_blqdo          = 'N'
                    ) loop
        --insert into gti_aux(col1, col2) values('Sujeto', 'id_sjto_impsto: ' || c_sjto.id_sjto_impsto || ' -- ' || c_sjto.id_orgen); commit;
        begin
            select distinct(trunc(fcha_vncmnto)) fcha_vncmnto
              into p_fcha_vncmnto_actual
              from gf_g_movimientos_detalle
             where id_orgen          = c_sjto.id_orgen;

             --insert into gti_aux(col1, col2) values('p_fcha_vncmnto_actual', to_char(p_fcha_vncmnto_actual)); commit;

            if trunc(p_fcha_vncmnto_actual) != trunc(p_fcha_vncmnto) then

                update gf_g_movimientos_detalle
                  set fcha_vncmnto      = p_fcha_vncmnto
                where id_orgen          = c_sjto.id_orgen
                  and fcha_vncmnto      != p_fcha_vncmnto;

                v_count := v_count + 1;
                pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado (10, c_sjto.id_sjto_impsto);

                if v_count  = 1000 then
                    commit;
                    v_count := 0;
                end if;

            end if;
        exception
            when others then
                insert into gti_aux(col1, col2) values('Error', c_sjto.id_orgen); commit;
                return;
        end;
    end loop;
    commit;

    begin
        for c_fltnte in (select distinct id_sjto_impsto
                             from v_gf_g_cartera_x_concepto
                            where cdgo_clnte                    = p_cdgo_clnte
                              and id_impsto                     = p_id_impsto
                              and id_impsto_sbmpsto             = p_id_impsto_sbmpsto
                              and vgncia                        = p_vgncia
                              and id_prdo                       = p_id_prdo
                              and vlor_sldo_cptal               > 0
                              and cdgo_mvnt_fncro_estdo         = 'NO'
                              and indcdor_mvmnto_blqdo          = 'N'
                              and trunc(fcha_vncmnto)           != trunc(p_fcha_vncmnto)
                        )loop
            begin
                for c_lqdcion in (select *
                                    from gf_g_movimientos_financiero    a
                                   where cdgo_clnte                     = p_cdgo_clnte
                                      and id_impsto                     = p_id_impsto
                                      and id_impsto_sbmpsto             = p_id_impsto_sbmpsto
                                      and vgncia                        = p_vgncia
                                      and id_prdo                       = p_id_prdo
                                      and id_sjto_impsto                = c_fltnte.id_sjto_impsto
                                ) loop

                    --DBMS_OUTPUT.PUT_LINE(c_lqdcion.id_mvmnto_fncro);
                     update gf_g_movimientos_detalle
                      set fcha_vncmnto          = p_fcha_vncmnto
                    where id_mvmnto_fncro       = c_lqdcion.id_mvmnto_fncro
                      and trunc(fcha_vncmnto)   = trunc(to_date('30/06/2020', 'DD/MM/YYYY'))
                      ;
                    --DBMS_OUTPUT.PUT_LINE('Actualizo: ' || SQL%ROWCOUNT);
                end loop;
            end;
            pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado (10, c_fltnte.id_sjto_impsto);
            commit;
        end loop;
    end;
end;
/

