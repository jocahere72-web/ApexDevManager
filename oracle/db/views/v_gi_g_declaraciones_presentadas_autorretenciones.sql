
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_DECLARACIONES_PRESENTADAS_AUTORRETENCIONES" ("NMRO_CNSCTVO", "ID_SJTO_IMPSTO", "VGNCIA", "ID_PRDO", "FCHA_PRSNTCION", "'FECHA LIMITE DE PAGO'", "'OPCIONES DE USO'", "'NUMERO DE DECLARACIÓN ANTERIOR'", "'DESCUENTO EN TARIFA'", "'3.TIPO DE IDENTIFICACIÓN'", "'IDENTIFICACIÓN'", "'DÍGITO DE VERIFICACIÓN'", "'PLACA'", "'4. ESTABLECIMIENTO'", "'DEPARTAMENTO'", "'MUNICIPIO'", "'5. DIRECCIÓN DE NOTIFICACIÓN'", "'6.TELÉFONO'", "'7. CORREO ELECTRÓNICO'", "'CÓDIGO CIIU'", "'14. INGRESOS ORDINARIOS Y EXTRAORDINARIOS DEL PERIODO EN EL MUNICIPIO ($COP)'", "'15. INGRESO POR ACTIVIDAD EXCLUÍDA, EXENTA, NO SUJETA, EXPORTACIÓN, DEVOLUCIÓN, REBAJAS Y DESCUENTOS EN EL MUNICIPIO ($COP)'", "'16. INGRESOS GRAVABLE DEL PERIODO EN EL MUNICIPIO ($COP)'", "'17. TARIFA'", "'18. TOTAL VALOR DE AUTORRETENCIÓN ($COP)'", "'TOTAL DE INGRESOS RENGLÓN 14'", "'TOTAL DE INGRESOS RENGLÓN 15'", "'TOTAL DE INGRESOS RENGLÓN 16'", "'TOTAL DE AUTORRETENCIONES RENGLÓN 18'", "'TIPO DE SANCIÓN'", "'TIPO DE CALCULO DE LA SANCIÓN'", "'9.SANCIONES. Concepto Sanciones'", "'CALCULO SANCIÓN SISTEMA 9.SANCIONES'", "'10.TOTAL A PAGAR'", "'VALOR DE RETENCIONES CON REDUCCIÓN DE TARIFA'", "'VALOR PAGADO EN LA DECLARACION ANTERIOR'", "'11.VALOR PAGOS SANCIONES'", "'12.VALOR PAGO INTERESES DE MORA (CON DESCUENTO SI APLICA)'", "'13.VALOR PAGO DE RETENCIONES'", "'VALOR A PAGAR EN BANCOS'", "'PAGO TOTAL'", "'NOMBRES Y APELLIDOS DEL DECLARANTE'", "'TIPO DE IDENTIFICACIÓN DEL DECLARANTE'", "'NÚMERO DE IDENTIFICACIÓN DEL DECLARANTE'", "'NOMBRES Y APELLIDOS CONTADOR O REVISOR FISCAL'", "'TIPO DE IDENTIFICACIÓN DEL CONTADOR O REVISOR FISCAL'", "'N° IDENTIFICACIÓN DEL CONTADOR O REVISOR FISCAL'", "'N. DE TARJETA PROFESIONAL'", "'REVISADO'") AS
  SELECT
    nmro_cnsctvo,
    id_sjto_impsto,
    vgncia,
    id_prdo,
    fcha_prsntcion,
    "'FECHA LIMITE DE PAGO'",
            "'OPCIONES DE USO'",
            "'NUMERO DE DECLARACIÓN ANTERIOR'",
            "'DESCUENTO EN TARIFA'",
            "'3.TIPO DE IDENTIFICACIÓN'",
            "'IDENTIFICACIÓN'",
            "'DÍGITO DE VERIFICACIÓN'",
            "'PLACA'",
            "'4. ESTABLECIMIENTO'",
            "'DEPARTAMENTO'",
            "'MUNICIPIO'",
            "'5. DIRECCIÓN DE NOTIFICACIÓN'",
            "'6.TELÉFONO'",
            "'7. CORREO ELECTRÓNICO'",
            "'CÓDIGO CIIU'",
            "'14. INGRESOS ORDINARIOS Y EXTRAORDINARIOS DEL PERIODO EN EL MUNICIPIO ($COP)'",
            "'15. INGRESO POR ACTIVIDAD EXCLUÍDA, EXENTA, NO SUJETA, EXPORTACIÓN, DEVOLUCIÓN, REBAJAS Y DESCUENTOS EN EL MUNICIPIO ($COP)'",
            "'16. INGRESOS GRAVABLE DEL PERIODO EN EL MUNICIPIO ($COP)'",
            "'17. TARIFA'",
            "'18. TOTAL VALOR DE AUTORRETENCIÓN ($COP)'",
            "'TOTAL DE INGRESOS RENGLÓN 14'",
            "'TOTAL DE INGRESOS RENGLÓN 15'",
            "'TOTAL DE INGRESOS RENGLÓN 16'",
            "'TOTAL DE AUTORRETENCIONES RENGLÓN 18'",
            "'TIPO DE SANCIÓN'",
            "'TIPO DE CALCULO DE LA SANCIÓN'",
            "'9.SANCIONES. Concepto Sanciones'",
            "'CALCULO SANCIÓN SISTEMA 9.SANCIONES'",
            "'10.TOTAL A PAGAR'",
            "'VALOR DE RETENCIONES CON REDUCCIÓN DE TARIFA'",
            "'VALOR PAGADO EN LA DECLARACION ANTERIOR'",
            "'11.VALOR PAGOS SANCIONES'",
            "'12.VALOR PAGO INTERESES DE MORA (CON DESCUENTO SI APLICA)'",
            "'13.VALOR PAGO DE RETENCIONES'",
            "'VALOR A PAGAR EN BANCOS'",
            "'PAGO TOTAL'",
            "'NOMBRES Y APELLIDOS DEL DECLARANTE'",
            "'TIPO DE IDENTIFICACIÓN DEL DECLARANTE'",
            "'NÚMERO DE IDENTIFICACIÓN DEL DECLARANTE'",
            "'NOMBRES Y APELLIDOS CONTADOR O REVISOR FISCAL'",
            "'TIPO DE IDENTIFICACIÓN DEL CONTADOR O REVISOR FISCAL'",
            "'N° IDENTIFICACIÓN DEL CONTADOR O REVISOR FISCAL'",
            "'N. DE TARJETA PROFESIONAL'",
            "'REVISADO'"
FROM
    (
        SELECT
            e.nmro_cnsctvo,
            e.id_sjto_impsto,
            e.vgncia,
            e.id_prdo,
            trunc(e.fcha_prsntcion) fcha_prsntcion,
            --'''' || b.dscrpcion || '''' dscrpcion,
            b.dscrpcion,
            dbms_lob.substr(a.vlor_dsplay,
                            dbms_lob.getlength(a.vlor_dsplay),
                            1) AS vlor_dsplay
        FROM
                 gi_g_declaraciones_detalle a
            INNER JOIN gi_d_frmlrios_rgion_atrbto b ON b.id_frmlrio_rgion_atrbto = a.id_frmlrio_rgion_atrbto
            INNER JOIN gi_d_formularios_region    c ON c.id_frmlrio_rgion = b.id_frmlrio_rgion
            INNER JOIN gi_d_formularios           d ON d.id_frmlrio = c.id_frmlrio
            JOIN gi_g_declaraciones         e ON a.id_dclrcion = e.id_dclrcion
        WHERE
                --e.nmro_cnsctvo = 120240071961 AND
                d.id_frmlrio = 804 -- Formulario de Auto-Retenciones
            AND b.cdgo_atrbto_tpo NOT IN ( 'OCL' )
            AND e.cdgo_dclrcion_estdo = 'APL'
        ORDER BY
            a.id_dclrcion DESC,
            c.orden,
            b.orden
    ) PIVOT (
        MAX(vlor_dsplay)
        FOR ( dscrpcion )
        IN ( 'FECHA LIMITE DE PAGO',
            'OPCIONES DE USO',
            'NUMERO DE DECLARACIÓN ANTERIOR',
            'DESCUENTO EN TARIFA',
            '3.TIPO DE IDENTIFICACIÓN',
            'IDENTIFICACIÓN',
            'DÍGITO DE VERIFICACIÓN',
            'PLACA',
            '4. ESTABLECIMIENTO',
            'DEPARTAMENTO',
            'MUNICIPIO',
            '5. DIRECCIÓN DE NOTIFICACIÓN',
            '6.TELÉFONO',
            '7. CORREO ELECTRÓNICO',
            'CÓDIGO CIIU',
            '14. INGRESOS ORDINARIOS Y EXTRAORDINARIOS DEL PERIODO EN EL MUNICIPIO ($COP)',
            '15. INGRESO POR ACTIVIDAD EXCLUÍDA, EXENTA, NO SUJETA, EXPORTACIÓN, DEVOLUCIÓN, REBAJAS Y DESCUENTOS EN EL MUNICIPIO ($COP)',
            '16. INGRESOS GRAVABLE DEL PERIODO EN EL MUNICIPIO ($COP)',
            '17. TARIFA',
            '18. TOTAL VALOR DE AUTORRETENCIÓN ($COP)',
            'TOTAL DE INGRESOS RENGLÓN 14',
            'TOTAL DE INGRESOS RENGLÓN 15',
            'TOTAL DE INGRESOS RENGLÓN 16',
            'TOTAL DE AUTORRETENCIONES RENGLÓN 18',
            'TIPO DE SANCIÓN',
            'TIPO DE CALCULO DE LA SANCIÓN',
            '9.SANCIONES. Concepto Sanciones',
            'CALCULO SANCIÓN SISTEMA 9.SANCIONES',
            '10.TOTAL A PAGAR',
            'VALOR DE RETENCIONES CON REDUCCIÓN DE TARIFA',
            'VALOR PAGADO EN LA DECLARACION ANTERIOR',
            '11.VALOR PAGOS SANCIONES',
            '12.VALOR PAGO INTERESES DE MORA (CON DESCUENTO SI APLICA)',
            '13.VALOR PAGO DE RETENCIONES',
            'VALOR A PAGAR EN BANCOS',
            'PAGO TOTAL',
            'NOMBRES Y APELLIDOS DEL DECLARANTE',
            'TIPO DE IDENTIFICACIÓN DEL DECLARANTE',
            'NÚMERO DE IDENTIFICACIÓN DEL DECLARANTE',
            'NOMBRES Y APELLIDOS CONTADOR O REVISOR FISCAL',
            'TIPO DE IDENTIFICACIÓN DEL CONTADOR O REVISOR FISCAL',
            'N° IDENTIFICACIÓN DEL CONTADOR O REVISOR FISCAL',
            'N. DE TARJETA PROFESIONAL',
            'REVISADO' )
    );

