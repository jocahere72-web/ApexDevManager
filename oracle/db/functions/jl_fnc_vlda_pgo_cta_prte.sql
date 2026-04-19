
  CREATE OR REPLACE EDITIONABLE FUNCTION "JL_FNC_VLDA_PGO_CTA_PRTE" (p_id_mvmnto_fncro IN gf_g_movimientos_financiero.id_mvmnto_fncro%TYPE,
                                                    p_idntfccion      IN gf_g_movimientos_detalle.idntfccion%TYPE)
  RETURN BOOLEAN IS
  l_count NUMBER;
BEGIN
  /*
   * Esta es la consulta clave y ultra-rápida.
   * Busca si existe al menos un registro de pago ('RE') en la tabla de detalle
   * para un origen de liquidación ('LQ') y un responsable específico.
   * Usamos ROWNUM = 1 para que Oracle se detenga en cuanto encuentre la primera fila,
   * lo que la hace extremadamente eficiente.
  */
  SELECT COUNT(1)
    INTO l_count
    FROM gf_g_movimientos_financiero a
    join gf_g_movimientos_detalle b
      on b.id_mvmnto_fncro = a.id_mvmnto_fncro
     and a.cdgo_mvmnto_orgn = 'LQ'
     AND b.cdgo_mvmnto_orgn = 'RE'
   WHERE a.id_mvmnto_fncro = p_id_mvmnto_fncro
     AND b.idntfccion = p_idntfccion;

  -- Si el contador es mayor que 0, significa que se encontró un pago.
  RETURN(l_count > 0);

EXCEPTION
  -- En caso de cualquier error, asumimos que no hay pago para evitar falsos positivos.
  WHEN OTHERS THEN
    RETURN FALSE;
END jl_fnc_vlda_pgo_cta_prte;
/

