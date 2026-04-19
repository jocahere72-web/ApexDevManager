
  CREATE OR REPLACE EDITIONABLE FUNCTION "JL_FN_TABLA_DETALLE_DETERMINACION" (p_id_dtrmncion IN NUMBER)
  RETURN CLOB AS
  l_html CLOB;
BEGIN
  WITH base AS
   (SELECT a.id_dtrmncion,
           a.vgncia,
           TO_CHAR(x.bse_cncpto, 'FM$999G999G999G999G999G999G990') AS bse_cncpto_1,
           x.destino,
           x.estrto,
           x.txto_trfa,
           TO_CHAR(SUM(DECODE(a.id_cncpto, x.id_cncpto, vlor_cptal, 0)),
                   'FM$999G999G999G999G999G999G990') AS vlor_cptal_prdial
      FROM v_gi_g_determinacion_detalle a
      JOIN (SELECT b.id_lqdcion,
                  bse_cncpto,
                  e.dscrpcion_estrto AS estrto,
                  txto_trfa,
                  f.dscrpcion        AS destino,
                  d.id_cncpto
             FROM gi_g_liquidaciones_concepto b
             JOIN gi_g_liquidaciones_ad_predio c
               ON b.id_lqdcion = c.id_lqdcion
             JOIN df_i_impuestos_acto_concepto d
               ON b.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto
              AND d.indcdor_trfa_crctrstcas = 'S'
             JOIN df_s_estratos e
               ON c.cdgo_estrto = e.cdgo_estrto
             JOIN df_i_predios_destino f
               ON c.id_prdio_dstno = f.id_prdio_dstno) x
        ON a.id_orgen = x.id_lqdcion
     WHERE a.id_dtrmncion = p_id_dtrmncion
       AND a.vlor_cptal > 0
     GROUP BY a.id_dtrmncion,
              a.id_orgen,
              a.vgncia,
              x.estrto,
              x.txto_trfa,
              x.bse_cncpto,
              x.destino)
  SELECT XMLSERIALIZE(CONTENT XMLELEMENT("table",
                                 XMLATTRIBUTES('1' AS "border",
                                               '0' AS "cellspacing",
                                               '3' AS "cellpadding"),
                                 -- Encabezados
                                 XMLELEMENT("tr",
                                            XMLELEMENT("th",
                                                       XMLATTRIBUTES('text-align:center;' AS
                                                                     "style"),
                                                       'VIGENCIA'),
                                            XMLELEMENT("th",
                                                       XMLATTRIBUTES('text-align:center;' AS
                                                                     "style"),
                                                       'AVALUO'),
                                            XMLELEMENT("th",
                                                       XMLATTRIBUTES('text-align:center;' AS
                                                                     "style"),
                                                       'DESTINO'),
                                            XMLELEMENT("th",
                                                       XMLATTRIBUTES('text-align:center;' AS
                                                                     "style"),
                                                       'ESTRATO'),
                                            XMLELEMENT("th",
                                                       XMLATTRIBUTES('text-align:center;' AS
                                                                     "style"),
                                                       'TARIFA'),
                                            XMLELEMENT("th",
                                                       XMLATTRIBUTES('text-align:center;' AS
                                                                     "style"),
                                                       'IMPUESTO PREDIAL')),
                                 -- Filas
                                 XMLAGG(XMLELEMENT("tr",
                                                   XMLELEMENT("td",
                                                              XMLATTRIBUTES('text-align:center;' AS
                                                                            "style"),
                                                              vgncia),
                                                   XMLELEMENT("td",
                                                              XMLATTRIBUTES('text-align:right;' AS
                                                                            "style"),
                                                              bse_cncpto_1),
                                                   XMLELEMENT("td",
                                                              XMLATTRIBUTES('text-align:center;' AS
                                                                            "style"),
                                                              destino),
                                                   XMLELEMENT("td",
                                                              XMLATTRIBUTES('text-align:center;' AS
                                                                            "style"),
                                                              estrto),
                                                   XMLELEMENT("td",
                                                              XMLATTRIBUTES('text-align:center;' AS
                                                                            "style"),
                                                              txto_trfa),
                                                   XMLELEMENT("td",
                                                              XMLATTRIBUTES('text-align:right;' AS
                                                                            "style"),
                                                              vlor_cptal_prdial))
                                        ORDER BY vgncia)) AS CLOB)
    INTO l_html
    FROM base
   GROUP BY id_dtrmncion;

  RETURN l_html;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    -- Si no hay filas, devolvemos la tabla vacía con encabezados
    RETURN '<table border="1" cellspacing="0" cellpadding="3">' || '<tr><th>VIGENCIA</th><th>AVALUO</th><th>DESTINO</th>' || '<th>ESTRATO</th><th>TARIFA</th><th>IMPUESTO PREDIAL</th></tr>' || '</table>';
END;
/

