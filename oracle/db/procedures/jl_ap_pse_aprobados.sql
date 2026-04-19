
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_AP_PSE_APROBADOS" (p_id_pgdor_dcmnto in number DEFAULT NULL,
                                                o_cdgo_rspsta     out number,
                                                o_mnsje_rspsta    out varchar2) as

  -- Variables necesarias para el proceso de aplicación
  o_rcdo_cntrol          number;
  o_id_rcdo              number;
  v_nmro_dcmnto          number;
  v_vlor_ttal_dcmnto     number;
  v_id_sjto_impsto       number;
  v_id_bnco              number;
  v_id_bnco_cnta         number;
  v_id_usrio_aplca_rcdos number;
  e_expcion_intrna       exception;

begin

  o_cdgo_rspsta := 0;

  insert into sg_g_log_placetopay
    (v_001, v_002)
  values
    ('jl_ap_pse_aprobados', 'Entrando a aplicar pagos aprobados');
  COMMIT;

  -- Recorrido de las transacciones en estado APROBADO (AP) que no tienen un recaudo asociado.
  -- Usamos NOT EXISTS para filtrar eficientemente los pagos ya aplicados.
  for c_trnsccion in (select td.id_pgdor_dcmnto,
                             td.cdgo_clnte,
                             td.id_impsto,
                             td.id_impsto_sbmpsto,
                             td.id_orgen,
                             td.cdgo_orgn_tpo,
                             td.id_prvdor,
                             td.tlfno_1,
                             td.fcha_rgstro
                        from v_re_g_pagadores_documento td
                       where td.indcdor_estdo_trnsccion = 'AP'
                         and (td.id_pgdor_dcmnto = p_id_pgdor_dcmnto or
                             p_id_pgdor_dcmnto is null)
                         and not exists
                       (select 1
                                from re_g_recaudos rec
                               where rec.id_orgen = td.id_orgen
                                 and rec.cdgo_rcdo_orgn_tpo =
                                     td.cdgo_orgn_tpo)
                       order by td.id_pgdor_dcmnto) loop
    begin

      -- Paso 1: Obtener datos del documento o declaración original
      if c_trnsccion.cdgo_orgn_tpo = 'DC' then
        -- Busqueda del numero de documento de pago.
        begin
          select a.nmro_dcmnto, a.vlor_ttal_dcmnto, a.id_sjto_impsto
            into v_nmro_dcmnto, v_vlor_ttal_dcmnto, v_id_sjto_impsto
            from re_g_documentos a
           where a.cdgo_clnte = c_trnsccion.cdgo_clnte
             and a.id_dcmnto = c_trnsccion.id_orgen;
        exception
          when others then
            o_cdgo_rspsta  := 3;
            o_mnsje_rspsta := 'Aplicacion: No se pudo obtener los datos del documento ' ||
                              c_trnsccion.id_orgen;
            raise e_expcion_intrna; -- Forzamos la excepción interna para loguear y continuar
        end;

      elsif c_trnsccion.cdgo_orgn_tpo = 'DL' then
        -- Busqueda del numero de la declaracion.
        begin
          select a.nmro_cnsctvo, a.vlor_pago, a.id_sjto_impsto
            into v_nmro_dcmnto, v_vlor_ttal_dcmnto, v_id_sjto_impsto
            from gi_g_declaraciones a
           where a.cdgo_clnte = c_trnsccion.cdgo_clnte
             and a.id_dclrcion = c_trnsccion.id_orgen;
        exception
          when others then
            o_cdgo_rspsta  := 4;
            o_mnsje_rspsta := 'Aplicacion: No se pudo obtener los datos de la declaracion ' ||
                              c_trnsccion.id_orgen;
            raise e_expcion_intrna;
        end;
      end if;

      -- Paso 2: Obtener el banco recaudador y su cuenta
      begin
        select a.id_bnco, a.id_bnco_cnta, a.id_usrio_aplca_rcdos
          into v_id_bnco, v_id_bnco_cnta, v_id_usrio_aplca_rcdos
          from ws_d_provedores_cliente a
         where cdgo_clnte = c_trnsccion.cdgo_clnte
           and id_impsto = c_trnsccion.id_impsto
           and id_impsto_sbmpsto = c_trnsccion.id_impsto_sbmpsto
           and id_prvdor = c_trnsccion.id_prvdor;
      exception
        when others then
          o_cdgo_rspsta  := 5;
          o_mnsje_rspsta := 'Aplicacion: No se pudo obtener el banco y la cuenta.';
          raise e_expcion_intrna;
      end;

      -- Paso 3: Registrar el control de recaudo
      pkg_re_recaudos.prc_rg_recaudo_control(p_cdgo_clnte        => c_trnsccion.cdgo_clnte,
                                             p_id_impsto         => c_trnsccion.id_impsto,
                                             p_id_impsto_sbmpsto => c_trnsccion.id_impsto_sbmpsto,
                                             p_id_bnco           => v_id_bnco,
                                             p_id_bnco_cnta      => v_id_bnco_cnta,
                                             p_fcha_cntrol       => c_trnsccion.fcha_rgstro,
                                             p_obsrvcion         => 'Control PlaceToPay. Firmada sin pago',
                                             p_cdgo_rcdo_orgen   => 'WS',
                                             p_id_usrio          => v_id_usrio_aplca_rcdos,
                                             o_id_rcdo_cntrol    => o_rcdo_cntrol,
                                             o_cdgo_rspsta       => o_cdgo_rspsta,
                                             o_mnsje_rspsta      => o_mnsje_rspsta);

      if o_cdgo_rspsta <> 0 then
        raise e_expcion_intrna;
      end if;

      -- Paso 4: Registrar el recaudo
      pkg_re_recaudos.prc_rg_recaudo(p_cdgo_clnte         => c_trnsccion.cdgo_clnte,
                                     p_id_rcdo_cntrol     => o_rcdo_cntrol,
                                     p_id_sjto_impsto     => v_id_sjto_impsto,
                                     p_cdgo_rcdo_orgn_tpo => c_trnsccion.cdgo_orgn_tpo,
                                     p_id_orgen           => c_trnsccion.id_orgen,
                                     p_vlor               => v_vlor_ttal_dcmnto,
                                     p_obsrvcion          => 'PlaceToPay. Firmada sin pago',
                                     p_cdgo_frma_pgo      => 'TR', -- Transferencia
                                     p_cdgo_rcdo_estdo    => 'RG', -- Se coloca RG para que se pueda aplicar.
                                     o_id_rcdo            => o_id_rcdo,
                                     o_cdgo_rspsta        => o_cdgo_rspsta,
                                     o_mnsje_rspsta       => o_mnsje_rspsta);

      if o_cdgo_rspsta <> 0 then
        raise e_expcion_intrna;
      end if;

      -- Paso 5: Si es una declaración, actualizar su estado
      if c_trnsccion.cdgo_orgn_tpo = 'DL' then
        pkg_gi_declaraciones.prc_ac_declaracion_estado(p_cdgo_clnte          => c_trnsccion.cdgo_clnte,
                                                       p_id_dclrcion         => c_trnsccion.id_orgen,
                                                       p_cdgo_dclrcion_estdo => 'PRS',
                                                       p_id_rcdo             => o_id_rcdo,
                                                       p_fcha                => c_trnsccion.fcha_rgstro,
                                                       o_cdgo_rspsta         => o_cdgo_rspsta,
                                                       o_mnsje_rspsta        => o_mnsje_rspsta);

        if o_cdgo_rspsta <> 0 then
          raise e_expcion_intrna;
        end if;
      end if;

      -- Paso 6: Aplicar el pago (el paso contable más importante)
      pkg_re_recaudos.prc_ap_recaudo(p_id_usrio     => v_id_usrio_aplca_rcdos,
                                     p_cdgo_clnte   => c_trnsccion.cdgo_clnte,
                                     p_id_rcdo      => o_id_rcdo,
                                     o_cdgo_rspsta  => o_cdgo_rspsta,
                                     o_mnsje_rspsta => o_mnsje_rspsta);

      if o_cdgo_rspsta <> 0 then
        raise e_expcion_intrna;
      end if;

      -- >>> FIN DE LA LÓGICA DE APLICACIÓN <<<

      -- Hacemos commit por cada aplicación exitosa
      commit;

    exception
      when e_expcion_intrna then
        -- Registrar el error de aplicación específico para esta transacción
        insert into sg_g_log_placetopay
          (n_001, v_001, v_002, c_001, d_001)
        values
          (c_trnsccion.id_pgdor_dcmnto,
           'jl_ap_pse_aprobados',
           'ERROR',
           'Cod: ' || o_cdgo_rspsta || ' - Msj: ' || o_mnsje_rspsta,
           sysdate);
        commit; -- Guardamos el log del error
        rollback; -- Deshacemos cualquier cambio parcial de esta transacción fallida
    end;

  end loop;

exception
  when others then
    o_cdgo_rspsta  := 99;
    o_mnsje_rspsta := 'Error general en jl_ap_pse_aprobados: ' || SQLERRM;
    rollback;
end jl_ap_pse_aprobados;
/

