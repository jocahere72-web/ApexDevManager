
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_BORRAR_RENTA" (p_id_rnta    IN gi_g_rentas.id_rnta%TYPE,
                                            p_cdgo_clnte IN NUMBER) AS
  v_id_lqdcion     gi_g_rentas.id_lqdcion%TYPE;
  v_id_sjto_impsto gi_g_rentas.id_sjto_impsto%TYPE;
  v_id_rnta_acto   gi_g_rentas_acto.id_rnta_acto%TYPE;
  v_id_mvmnto      gf_g_movimientos_financiero.id_mvmnto_fncro%TYPE;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Iniciando proceso de borrado para la Renta ID: ' ||
                       p_id_rnta);

  -- PASO 1: Obtener los IDs principales a partir de la renta.
  SELECT id_lqdcion, id_sjto_impsto
    INTO v_id_lqdcion, v_id_sjto_impsto
    FROM gi_g_rentas
   WHERE id_rnta = p_id_rnta;

  DBMS_OUTPUT.PUT_LINE('-> ID Liquidación: ' || v_id_lqdcion ||
                       ', ID Sujeto Impuesto: ' || v_id_sjto_impsto);

  -- PASO 2: Obtener IDs relacionados de otras tablas.
  SELECT id_rnta_acto
    INTO v_id_rnta_acto
    FROM gi_g_rentas_acto
   WHERE id_rnta = p_id_rnta;

  SELECT id_mvmnto_fncro
    INTO v_id_mvmnto
    FROM gf_g_movimientos_financiero
   WHERE id_orgen = v_id_lqdcion;

  DBMS_OUTPUT.PUT_LINE('-> ID Renta Acto: ' || v_id_rnta_acto ||
                       ', ID Movimiento Financiero: ' || v_id_mvmnto);

  UPDATE gi_g_rentas
     SET id_lqdcion = NULL, id_dcmnto = NULL
   WHERE id_rnta = p_id_rnta;
  DBMS_OUTPUT.PUT_LINE('-> Renta desvinculada de liquidación y documento.');

  -- PASO 4: Borrar documentos asociados a la liquidación.
  FOR r1 IN (SELECT id_dcmnto
               FROM re_g_documentos
              WHERE id_orgen = v_id_lqdcion) LOOP
    DBMS_OUTPUT.PUT_LINE('---> Borrando dependencias del documento ID: ' ||
                         r1.id_dcmnto);
    DELETE FROM re_g_documentos_ad_persona WHERE id_dcmnto = r1.id_dcmnto;
    DELETE FROM re_g_documentos_responsable WHERE id_dcmnto = r1.id_dcmnto;
    DELETE FROM re_g_documentos_rtp_23001 WHERE id_dcmnto = r1.id_dcmnto;
    DELETE FROM RE_G_DOCUMENTOS_DETALLE_RPT WHERE id_dcmnto = r1.id_dcmnto;
    DELETE FROM re_g_documentos_encbzdo_rpt WHERE id_dcmnto = r1.id_dcmnto;
    DELETE FROM re_g_documentos_detalle WHERE id_dcmnto = r1.id_dcmnto;
    DELETE FROM re_g_documentos WHERE id_dcmnto = r1.id_dcmnto;

    begin
      DBMS_OUTPUT.PUT_LINE('-> Borrando Registros de de recaudos.');
      for r2 in (select a.id_rcdo
                   from re_g_recaudos a
                  where a.id_orgen = r1.id_dcmnto) loop

        delete from gf_g_movimientos_detalle s
         where s.cdgo_mvmnto_orgn = 'RE'
           and s.id_orgen = r2.id_rcdo;

        delete from gf_g_saldos_favor s where s.id_orgen = r2.id_rcdo;

        delete from re_g_recaudos_cartera a where a.id_rcdo = r2.id_rcdo;

        delete from re_g_recaudos a where a.id_rcdo = r2.id_rcdo;

        DBMS_OUTPUT.PUT_LINE('-> Registro de de recaudos  borrado. ID: ' ||
                             r2.id_rcdo);
      end loop;

    exception
      when others then
        DBMS_OUTPUT.PUT_LINE('-> No borro recaudos .' || sqlerrm);

    end;

  END LOOP;
  DBMS_OUTPUT.PUT_LINE('-> Documentos asociados eliminados.');

  -- PASO 5: Eliminar registros financieros.
  DELETE FROM gf_g_movimientos_detalle WHERE id_mvmnto_fncro = v_id_mvmnto;
  DELETE FROM gf_g_mvmntos_cncpto_cnslddo WHERE id_orgen = v_id_lqdcion;
  DELETE FROM gf_g_movimientos_financiero WHERE id_orgen = v_id_lqdcion;
  DBMS_OUTPUT.PUT_LINE('-> Registros financieros eliminados.');

  -- PASO 6: Eliminar liquidaciones.
  DELETE FROM GI_G_LIQUIDACIONES_CONCEPTO WHERE id_lqdcion = v_id_lqdcion;
  DELETE FROM gi_g_liquidaciones WHERE id_lqdcion = v_id_lqdcion;
  DBMS_OUTPUT.PUT_LINE('-> Liquidaciones eliminadas.');

  -- PASO 7: Eliminar el resto de registros relacionados con la renta y la renta misma.
  DELETE FROM gi_g_rentas_acto_concepto
   WHERE id_rnta_acto = v_id_rnta_acto;
  DELETE FROM gi_g_rentas_acto WHERE id_rnta = p_id_rnta;
  DELETE FROM gi_g_rentas_adjnto WHERE id_rnta = p_id_rnta;
  DELETE FROM gi_g_rentas_solicitud_traza WHERE id_rnta = p_id_rnta;
  DELETE FROM gi_g_rentas WHERE id_rnta = p_id_rnta;
  DBMS_OUTPUT.PUT_LINE('-> Registros de rentas y asociados eliminados.');

  -- PASO 8: Ejecutar proceso de consolidación final.
  DBMS_OUTPUT.PUT_LINE('-> Ejecutando consolidación para cliente ' ||
                       p_cdgo_clnte || ' y sujeto ' || v_id_sjto_impsto);
  pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte     => p_cdgo_clnte,
                                                            p_id_sjto_impsto => v_id_sjto_impsto);

  -- PASO 9: Si todo ha ido bien, confirmar todos los cambios en la base de datos.
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('===================================================');
  DBMS_OUTPUT.PUT_LINE('ÉXITO: Renta ' || p_id_rnta ||
                       ' y todos sus datos relacionados han sido eliminados.');
  DBMS_OUTPUT.PUT_LINE('===================================================');

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    -- Este error ocurre si alguna de las consultas SELECT...INTO no devuelve filas.
    ROLLBACK; -- Deshacer cualquier cambio parcial que se haya realizado.
    DBMS_OUTPUT.PUT_LINE('===================================================');
    DBMS_OUTPUT.PUT_LINE('ERROR: No se encontraron datos para la renta ID ' ||
                         p_id_rnta || '.');
    DBMS_OUTPUT.PUT_LINE('Causa posible: El ID de la renta no existe o le faltan datos asociados clave (liquidación, acto, etc.).');
    DBMS_OUTPUT.PUT_LINE('La transacción ha sido deshecha (ROLLBACK).');
    DBMS_OUTPUT.PUT_LINE('===================================================');

  WHEN OTHERS THEN
    -- Capturar cualquier otro error inesperado (ej. violación de una FK no contemplada).
    ROLLBACK; -- ¡Esencial! Deshacer todo para mantener la integridad de los datos.
    DBMS_OUTPUT.PUT_LINE('===================================================');
    DBMS_OUTPUT.PUT_LINE('ERROR INESPERADO al intentar borrar la renta ID ' ||
                         p_id_rnta || '.');
    DBMS_OUTPUT.PUT_LINE('Detalle del error: ' || SQLCODE || ' - ' ||
                         SQLERRM);
    DBMS_OUTPUT.PUT_LINE('La transacción ha sido deshecha (ROLLBACK).');
    DBMS_OUTPUT.PUT_LINE('===================================================');
    -- Opcional: relanzar el error si este procedimiento es llamado por otro.
  -- RAISE;
END JL_BORRAR_RENTA;
/

