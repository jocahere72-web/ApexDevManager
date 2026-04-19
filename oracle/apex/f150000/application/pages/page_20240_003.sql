prompt --application/pages/page_20240_003
begin
wwv_flow_api.create_page(
 p_id=>2024024
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Notificaci\00F3n de Solicitud de Asociados')
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle de Solicitud Sujeto Asociado'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function validarSujetoTributo(){',
'        ',
'    let $waitPopup = apex.widget.waitPopup();',
'    ',
'    try{',
'        await apex.server.process ( "ajax_validarSujetoTributo", {',
'            pageItems: "#P2024023_ID_IMPSTO,#P2024023_IDNTFCCION"',
'        }, {',
'            success: function( pData ){',
'                console.log(pData);',
'                if(!pData){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    "Error desconocido",',
'                            unsafe:     false',
'                        }',
'                    ]); ',
'                }else if (pData.o_cdgo_rspsta != 0){',
'                    console.log(pData.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
'                    apex.item( "P2024023_ID_SJTO_IMPSTO" ).setValue( pData.o_mnsje_rspsta );',
'                    apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'        console.log("Saliendo de validarSujetoTributo()");',
'    }',
'};'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20241127154110'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4348941961577449)
,p_plug_name=>unistr('Informaci\00F3n de Solicitud de Gesti\00F3n de Permisos')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'    .mensaje-container {',
'        font-family: Arial, sans-serif;',
'        background-color: #f9f9f9;',
'        padding: 20px;',
'        border-radius: 8px;',
'        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);',
'        color: #333;',
'    }',
'',
'    .mensaje-header {',
'        font-size: 18px;',
'        font-weight: bold;',
'        margin-bottom: 15px;',
'        color: #0056b3; /* Azul para el encabezado */',
'    }',
'',
'    .mensaje-body {',
'        font-size: 16px;',
'        line-height: 1.6;',
'        margin-top: 10px;',
'    }',
'',
'    .mensaje-body strong {',
'        font-weight: bold;',
'    }',
'',
unistr('    /* Resaltado en color para los valores din\00E1micos */'),
'    .mensaje-value {',
'        color: #0056b3; /* Azul para resaltar los valores */',
'        font-weight: bold;',
'    }',
'',
'    .mensaje-footer {',
'        margin-top: 20px;',
'        font-size: 14px;',
'        color: #666;',
'    }',
'</style>',
'',
'<div class="mensaje-container">',
'    <p class="mensaje-header">Estimado usuario/a,</p>',
'    <p class="mensaje-body">',
'        Le informamos que la solicitud de gestion de permisos de sujeto asociado se encuentra con los siguientes detalles:',
'    </p>',
'    <ul class="mensaje-body">',
unistr('        <li><strong>N\00FAmero de consecutivo:</strong> <span class="mensaje-value">&P2024024_NMRO_CNSCTVO.</span></li>'),
'        <li><strong>Fecha de solicitud:</strong> <span class="mensaje-value">&P2024024_FCHA_SLCTUD.</span></li>',
'        <li><strong>Estado actual:</strong> <span class="mensaje-value">&P2024024_ESTDO.</span></li>',
'        <li><strong>Identificacion solicitante:</strong> <span class="mensaje-value">&P2024024_IDNTFCCION.</span></li>',
'        <li><strong>Nombre solicitante:</strong> <span class="mensaje-value">&P2024024_NMBRE_TRCRO.</span></li>',
'        <li><strong>Gestion de la solicitud:</strong> <span class="mensaje-value">&P2024024_CDGO_GSTION.</span></li>',
'',
'    </ul>',
'    <p class="mensaje-body">',
unistr('        Si requiere m\00E1s informaci\00F3n o tiene alguna duda, no dude en ponerse en contacto.'),
'    </p>',
'    <p class="mensaje-footer">',
unistr('        \00A1Gracias!.'),
'    </p>',
'</div>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2024024_ID_SLCTUD_PRMSOS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62188926653540457)
,p_plug_name=>'Encabezado '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62189586176540463)
,p_plug_name=>unistr('Informaci\00F3n de Solicitud de Autorizaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'    .mensaje-container {',
'        font-family: Arial, sans-serif;',
'        background-color: #f9f9f9;',
'        padding: 20px;',
'        border-radius: 8px;',
'        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);',
'        color: #333;',
'    }',
'',
'    .mensaje-header {',
'        font-size: 18px;',
'        font-weight: bold;',
'        margin-bottom: 15px;',
'        color: #0056b3; /* Azul para el encabezado */',
'    }',
'',
'    .mensaje-body {',
'        font-size: 16px;',
'        line-height: 1.6;',
'        margin-top: 10px;',
'    }',
'',
'    .mensaje-body strong {',
'        font-weight: bold;',
'    }',
'',
unistr('    /* Resaltado en color para los valores din\00E1micos */'),
'    .mensaje-value {',
'        color: #0056b3; /* Azul para resaltar los valores */',
'        font-weight: bold;',
'    }',
'',
'    .mensaje-footer {',
'        margin-top: 20px;',
'        font-size: 14px;',
'        color: #666;',
'    }',
'</style>',
'',
'<div class="mensaje-container">',
'    <p class="mensaje-header">Estimado usuario/a,</p>',
'    <p class="mensaje-body">',
unistr('        Le informamos que la solicitud de autorizaci\00F3n se encuentra con los siguientes detalles:'),
'    </p>',
'    <ul class="mensaje-body">',
unistr('        <li><strong>N\00FAmero de consecutivo:</strong> <span class="mensaje-value">&P2024024_NMRO_CNSCTVO.</span></li>'),
'        <li><strong>Fecha de solicitud:</strong> <span class="mensaje-value">&P2024024_FCHA_SLCTUD.</span></li>',
'        <li><strong>Estado actual:</strong> <span class="mensaje-value">&P2024024_ESTDO.</span></li>',
'        <li><strong>Identificacion solicitante:</strong> <span class="mensaje-value">&P2024024_IDNTFCCION.</span></li>',
'        <li><strong>Nombre solicitante:</strong> <span class="mensaje-value">&P2024024_NMBRE_TRCRO.</span></li>',
'',
'    </ul>',
'    <p class="mensaje-body">',
unistr('        Si requiere m\00E1s informaci\00F3n o tiene alguna duda, no dude en ponerse en contacto.'),
'    </p>',
'    <p class="mensaje-footer">',
unistr('        \00A1Gracias!.'),
'    </p>',
'</div>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2024024_ID_SLCTUD_ASCDO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3962839409344514)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(62189586176540463)
,p_button_name=>'BTN_CERRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'<b>Cerrar</b>'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-close-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3962070720344506)
,p_name=>'P2024024_ESTDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3962107269344507)
,p_name=>'P2024024_FCHA_SLCTUD'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3962388816344509)
,p_name=>'P2024024_ID_SLCTUD_ASCDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3962577632344511)
,p_name=>'P2024024_NMBRE_TRCRO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3962643483344512)
,p_name=>'P2024024_IDNTFCCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3962774064344513)
,p_name=>'P2024024_CDGO_RSPSTA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3976943341830984)
,p_name=>'P2024024_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_item_default=>'130014'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3977395509830985)
,p_name=>'P2024024_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3977777571830986)
,p_name=>'P2024024_NMBRE_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3978120025830986)
,p_name=>'P2024024_NMRO_CNSCTVO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4348659793577446)
,p_name=>'P2024024_ID_SLCTUD_PRMSOS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4348791716577447)
,p_name=>'P2024024_CDGO_GSTION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(62188926653540457)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3963416048344520)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3962839409344514)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3961943918344505)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Informaci\00F3n Solicitud')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select nmro_cnsctvo, ',
'           c.dscrpcion as estado_solicitud,  ',
'           trunc(fcha_slctud),',
'           b.idntfccion,',
'           b.nmbre_trcro',
'    into :P2024024_NMRO_CNSCTVO, ',
'         :P2024024_ESTDO,',
'         :P2024024_FCHA_SLCTUD, ',
'         :P2024024_IDNTFCCION,',
'         :P2024024_NMBRE_TRCRO',
'    from si_g_solicitudes_asociados a',
'    join v_sg_g_usuarios b on a.id_usrio = b.id_usrio',
'    inner join si_d_estdo_slctud c on c.estdo = a.estdo',
'    where id_slctud_ascdo = :P2024024_ID_SLCTUD_ASCDO;',
'',
'exception',
'    when no_data_found then',
'        :P2024024_NMRO_CNSCTVO := null; ',
'        :P2024024_ESTDO := null;  ',
'        :P2024024_FCHA_SLCTUD := null; ',
'        :P2024024_IDNTFCCION := null;',
'        :P2024024_NMBRE_TRCRO := null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2024024_ID_SLCTUD_ASCDO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4348509818577445)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Informaci\00F3n Solicitud Gesti\00F3n de Permisos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.nmro_cnsctvo, ',
'           c.dscrpcion as estado_solicitud,  ',
'           trunc(fcha_slctud),',
'           b.idntfccion,',
'           b.nmbre_trcro,',
'           case',
'            when a.cdgo_gstion = ''H'' then ''Habilitar''',
'            when a.cdgo_gstion = ''D'' then ''Deshabilitar''',
'            else a.cdgo_gstion',
'           end gestion',
'    into :P2024024_NMRO_CNSCTVO, ',
'         :P2024024_ESTDO,',
'         :P2024024_FCHA_SLCTUD, ',
'         :P2024024_IDNTFCCION,',
'         :P2024024_NMBRE_TRCRO,',
'         :P2024024_CDGO_GSTION',
'    from si_g_slctds_permisos_asociado a',
'    join v_sg_g_usuarios b on a.id_usrio = b.id_usrio',
'    inner join si_d_estdo_slctud c on c.estdo = a.estdo',
'    where id_slctud_prmsos = :P2024024_ID_SLCTUD_PRMSOS;',
'',
'exception',
'    when no_data_found then',
'        :P2024024_NMRO_CNSCTVO := null; ',
'        :P2024024_ESTDO := null;  ',
'        :P2024024_FCHA_SLCTUD := null; ',
'        :P2024024_IDNTFCCION := null;',
'        :P2024024_NMBRE_TRCRO := null;',
'        :P2024024_CDGO_GSTION := null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2024024_ID_SLCTUD_PRMSOS'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
