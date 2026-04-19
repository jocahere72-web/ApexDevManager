
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_ANLISIS_DEVOLUCION_TTLO" (  p_cdgo_clnte           in  number,
                                                             p_id_embrgo_rslcion	in	number,
                                                             p_id_ttlo_jdcial		in  number,
                                                             o_cdgo_rspsta			out	number,
                                                             o_mnsje_rspsta			out	varchar2)as

    --------------------------------------------------------------
    --&procedimiento análisis de devolución del título judicial&--
    --------------------------------------------------------------


    v_error             	exception;
    v_nl              		number;
    v_id_instncia_fljo_hjo  number;
    v_id_fljo_trea_orgen    number;
    v_type_rspsta           varchar2(1);
    v_error_msg             number;
    v_cdgo_estdos_crtra		mc_d_estados_cartera.cdgo_estdos_crtra%type;
    v_exste_crtra			varchar2(1);
    v_idntfccion_dmnddo     gf_g_titulos_judicial.idntfccion_dmnddo%type;
    v_nmro_ttlo_jdcial        gf_g_titulos_judicial.nmro_ttlo_jdcial%type;

    begin

        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_anlisis_devolucion_ttlo',  v_nl, 'Entrando:' || systimestamp, 1);

        --1. Se consulta el estado de la medida cautelar
        begin
            select cdgo_estdos_crtra
              into v_cdgo_estdos_crtra
              from v_mc_g_embargos_resolucion
             where id_embrgos_rslcion = p_id_embrgo_rslcion;

        exception
            when no_data_found then
                o_cdgo_rspsta := 1;
                o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||'no se encontró medida cautelar';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_anlisis_devolucion_ttlo',  v_nl, o_mnsje_rspsta, 1);
                raise v_error;
        end;

        --2. consultamos la identificacion del demandado
        begin
            select idntfccion_dmnddo
              into v_idntfccion_dmnddo
              from gf_g_titulos_judicial
             where cdgo_clnte = p_cdgo_clnte
               and id_ttlo_jdcial = p_id_ttlo_jdcial;

        exception
            when no_data_found then
                o_cdgo_rspsta := 2;
                o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||'no se encontró medida cautelar';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_anlisis_devolucion_ttlo',  v_nl, o_mnsje_rspsta, 1);
                raise v_error;
        end;

        --3. guardamos informacion relacionada a movimientos con saldo > 0
        begin

        execute immediate 'truncate table gf_t_titulos_jdcial_mvmnto';

        insert into gf_t_titulos_jdcial_mvmnto(id_ttlo_jdcial, id_sjto_impsto, cntdad)
                                        select id_ttlo_jdcial, id_sjto_impsto, cntdad
                                          from (select b.id_ttlo_jdcial, b.id_sjto_impsto, count(*) cntdad
                                                  from v_gf_g_cartera_x_vigencia     a
                                                  join(select a.id_sjto_impsto, b.id_ttlo_jdcial
                                                              from si_i_sujetos_responsable         a
                                                              left join gf_g_titulos_jdcial_impsto  b on a.id_sjto_impsto = b.id_sjto_impsto
                                                                                                      and b.id_ttlo_jdcial = p_id_ttlo_jdcial
                                                             where trim(idntfccion) = v_idntfccion_dmnddo)  b on a.id_sjto_impsto = b.id_sjto_impsto
                                                 where a.cdgo_clnte = p_cdgo_clnte
                                                   and a.vlor_sldo_cptal > 0
                                              group by b.id_sjto_impsto, b.id_ttlo_jdcial)
                                        where cntdad > 0;
        exception
            when others then
            o_cdgo_rspsta := 3;
            o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||' al guardar informacion de cartera';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_anlisis_devolucion_ttlo',  v_nl, o_mnsje_rspsta, 1);
            raise v_error;
        end;

        --buscamos dentro de la temporal si existe minimo una cartera
            begin

                select 'S'
                  into v_exste_crtra
                  from gf_t_titulos_jdcial_mvmnto
                 where id_ttlo_jdcial = p_id_ttlo_jdcial
                   and rownum = 1;

            exception
                when no_data_found then
                    v_exste_crtra := 'N';
            end;

        -- se evalúan los criterios para devolver el título judicial
        if v_cdgo_estdos_crtra = 'D' and v_exste_crtra = 'N' then

            --4. se actualiza el estado del título para proceder a solicitud de devolución
            begin

                update gf_g_titulos_judicial
                   set cdgo_ttlo_jdcial_estdo = 'ASD'
                 where id_ttlo_jdcial = p_id_ttlo_jdcial;

                  o_cdgo_rspsta := 0;

            exception
                when others then
                o_cdgo_rspsta := 4;
                o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||'no se actualizó el titulo judicial';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_anlisis_devolucion_ttlo',  v_nl, o_mnsje_rspsta, 1);
                raise v_error;
            end;

        end if;

         --5. se consulta el flujo y la tarea para cambio de etapa
            begin

                select a.id_instncia_fljo_hjo,
                       b.id_fljo_trea_orgen,
                       a.nmro_ttlo_jdcial
                  into v_id_instncia_fljo_hjo,
                       v_id_fljo_trea_orgen,
                       v_nmro_ttlo_jdcial
                  from gf_g_titulos_judicial a
                  join wf_g_instancias_transicion b on a.id_instncia_fljo_hjo = b.id_instncia_fljo
                                                    and b.id_estdo_trnscion in (1,2)
                  where id_ttlo_jdcial = p_id_ttlo_jdcial;

                    pkg_pl_workflow_1_0.prc_rg_instancias_transicion(p_id_instncia_fljo => v_id_instncia_fljo_hjo,
                                                                     p_id_fljo_trea		=> v_id_fljo_trea_orgen,
                                                                     p_json				=> '[]' ,
                                                                     o_type				=> v_type_rspsta,
                                                                     o_mnsje			=> o_mnsje_rspsta,
                                                                     o_id_fljo_trea		=> v_error_msg,
                                                                     o_error			=> v_error_msg);
                     if v_type_rspsta = 'S' then
                        o_cdgo_rspsta := 6;
                        o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||' problemas al trasitar a la etapa siguiente'||sqlerrm;
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_anlisis_devolucion_ttlo',  v_nl, o_mnsje_rspsta, 6);
                        raise v_error;
                     end if;

            exception
                when no_data_found then
                    o_cdgo_rspsta := 5;
                    o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||' problemas al encontrar el flujo y tarea para trasitar a la etapa siguiente'||sqlerrm;
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_anlisis_devolucion_ttlo',  v_nl, o_mnsje_rspsta, 6);
                    raise v_error;
            end;

            if o_cdgo_rspsta = 0 then
                o_mnsje_rspsta := 'Título Judicial N° '||v_nmro_ttlo_jdcial||' Apto para Solicitud de Devolución';
            elsif o_cdgo_rspsta is null then
                o_mnsje_rspsta := '¡Contribuyente Con Cartera Pendiente!';
            end if;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_anlisis_devolucion_ttlo',  v_nl, 'Saliendo:' || systimestamp, 1);

    exception
        when v_error then
            raise_application_error(-20001, o_mnsje_rspsta);
end prc_rg_anlisis_devolucion_ttlo;
/

