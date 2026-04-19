
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_ESTRATOS_MASIVOS_PLANEACION" is

  v_id_instncia_fljo number;
  v_id_fljo_trea     number;
  v_mnsje_rspsta     varchar2(200);
  v_mnsje_error      varchar2(200);

  v_json clob;

  v_id_usrio          number := 230017;
  v_cdgo_clnte        number := 23001;
  v_id_impsto         number := 230011;
  v_id_impsto_sbmpsto number := 2300111;
  v_id_nvdad_prdio    number;
  v_cdgo_rspsta       number;

  v_id_fljo_trea_fnlzcion number := 38;

  v_nmro_dcmto_sprte    varchar2(15) := '0017';
  v_fcha_dcmnto_sprte   date := to_date('20220120', 'YYYYMMDD');
  v_fcha_incio_aplccion date := to_date('20220101', 'YYYYMMDD');

begin
  for r1 in (select a.*,
                    b.id_sjto_impsto,
                    c.cdgo_estrto cdgo_estrto_prdio,
                    c.id_prdio_dstno,
                    c.area_cnstrda,
                    c.id_prdio_uso_slo
               from temp_estratos_planeacion_2022 a
               join v_si_i_sujetos_impuesto b
                 on b.idntfccion_sjto = a.rfrncia_ctstral
                and b.cdgo_clnte = v_cdgo_clnte
                and b.id_impsto = v_id_impsto
               join si_i_predios c
                 on c.id_sjto_impsto = b.id_sjto_impsto
              where a.prcsdo = 'N'
             --    and a.rfrncia_ctstral = '0101000000050044000000000'
              order by a.rfrncia_ctstral) loop

    v_json             := null;
    v_id_instncia_fljo := null;
    v_id_nvdad_prdio   := null;

    if r1.cdgo_estrto = r1.cdgo_estrto_prdio then
      update temp_estratos_planeacion_2022 t
         set t.obsrvcion = 'NO HAY CAMBIOS EN EL ESTRATO ASIGNADO',
             t.prcsdo    = 'S'
       where t.rfrncia_ctstral = r1.rfrncia_ctstral;
    else
      if r1.id_prdio_dstno <> 2 then
        update temp_estratos_planeacion_2022 t
           set t.obsrvcion = 'DESTINO NO HABITACIONAL', t.prcsdo = 'S'
         where t.rfrncia_ctstral = r1.rfrncia_ctstral;
      else
        if r1.area_cnstrda = 0 then
          update temp_estratos_planeacion_2022 t
             set t.obsrvcion = 'PREDIO SIN AREA CONSTRUIDA', t.prcsdo = 'S'
           where t.rfrncia_ctstral = r1.rfrncia_ctstral;
        else
          pkg_pl_workflow_1_0.prc_rg_instancias_flujo(p_id_fljo          => 9,
                                                      p_id_usrio         => v_id_usrio,
                                                      p_id_prtcpte       => v_id_usrio,
                                                      p_obsrvcion        => 'ACTUALIZACION DE ESTRATO SEGUN OFICIO S.SP.M Nº 0017 DE 2022',
                                                      o_id_instncia_fljo => v_id_instncia_fljo,
                                                      o_id_fljo_trea     => v_id_fljo_trea,
                                                      o_mnsje            => v_mnsje_rspsta);
          if v_id_instncia_fljo is null then
            ROLLBACK;
            update temp_estratos_planeacion_2022 t
               set t.obsrvcion = 'ERROR CREANDO LA INSTANCIA DEL FLUJO ' ||
                                 v_mnsje_rspsta
             where t.rfrncia_ctstral = r1.rfrncia_ctstral;
            commit;
          else
            --crea el JSON
            SELECT json_object('id_sjto_impsto' value r1.id_sjto_impsto,
                               'id_prdio_dstno_nvo' value r1.id_prdio_dstno,
                               'id_prdio_uso_slo_nvo' value
                               r1.id_prdio_uso_slo,
                               'cdgo_estrto_nvo' value r1.cdgo_estrto)
              into v_json
              FROM dual;

            --se registra la novedad
            pkg_si_novedades_predio.prc_rg_novedad_predial(p_id_usrio            => v_id_usrio,
                                                           p_cdgo_clnte          => v_cdgo_clnte,
                                                           p_id_impsto           => v_id_impsto,
                                                           p_id_impsto_sbmpsto   => v_id_impsto_sbmpsto,
                                                           p_id_entdad_nvdad     => 1,
                                                           p_id_acto_tpo         => 60,
                                                           p_nmro_dcmto_sprte    => v_nmro_dcmto_sprte,
                                                           p_fcha_dcmnto_sprte   => v_fcha_dcmnto_sprte,
                                                           p_fcha_incio_aplccion => v_fcha_incio_aplccion,
                                                           p_obsrvcion           => 'ACTUALIZACION DE ESTRATO SEGUN OFICIO S.SP.M Nº 0017 DE 2022',
                                                           p_id_instncia_fljo    => v_id_instncia_fljo,
                                                           p_id_prcso_crga       => null,
                                                           p_json                => v_json,
                                                           o_id_nvdad_prdio      => v_id_nvdad_prdio,
                                                           o_cdgo_rspsta         => v_cdgo_rspsta,
                                                           o_mnsje_rspsta        => v_mnsje_rspsta);
            if v_cdgo_rspsta <> 0 and v_cdgo_rspsta <> 60 then
              ROLLBACK;
              update temp_estratos_planeacion_2022 t
                 set t.obsrvcion = 'ERROR REGISTRANDO LA NOVEDAD DEL PREDIO ' ||
                                   v_mnsje_rspsta
               where t.rfrncia_ctstral = r1.rfrncia_ctstral;
              commit;
            else

              --actualizo el predio
              update si_i_predios p
                 set p.cdgo_estrto = r1.cdgo_estrto
               where p.id_sjto_impsto = r1.id_sjto_impsto;

              --Aplico el detalle de la novedad
              UPDATE si_g_novedades_predio_dtlle t
                 SET T.CDGO_NVDAD_ESTDO = 'AP', T.MNSJE_RSPSTA = 'Aplicado'
               WHERE T.ID_NVDAD_PRDIO = v_id_nvdad_prdio;

              update WF_G_INSTANCIAS_FLUJO a
                 set a.estdo_instncia = 'FINALIZADA'
               where a.id_instncia_fljo = v_id_instncia_fljo;

              --cierro el flujo
              pkg_pl_workflow_1_0.prc_rg_finalizar_instancia(p_id_instncia_fljo => v_id_instncia_fljo,
                                                             p_id_fljo_trea     => v_id_fljo_trea_fnlzcion,
                                                             p_id_usrio         => v_id_usrio,
                                                             o_error            => v_mnsje_error,
                                                             o_msg              => v_mnsje_rspsta);

              if v_mnsje_error != 'S' then
                ROLLBACK;
                update temp_estratos_planeacion_2022 t
                   set t.obsrvcion = 'ERROR CERRANDO EL FLUJO  ' ||
                                     v_mnsje_rspsta
                 where t.rfrncia_ctstral = r1.rfrncia_ctstral;
                COMMIT;
              else
                update temp_estratos_planeacion_2022 t
                   set t.obsrvcion = null, t.prcsdo = 'S'
                 where t.rfrncia_ctstral = r1.rfrncia_ctstral;
                COMMIT;
              end if;

            end if;

          end if;
        end if;
      end if;
    end if;
  end loop;
end TEMP_ESTRATOS_MASIVOS_PLANEACION;
/

