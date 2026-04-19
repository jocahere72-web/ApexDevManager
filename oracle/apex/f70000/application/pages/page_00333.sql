prompt --application/pages/page_00333
begin
wwv_flow_api.create_page(
 p_id=>333
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Informaci\00F3n Impuesto Telefon\00EDa y Tel\00E9grafo')
,p_step_title=>unistr('Informaci\00F3n Impuesto Telefon\00EDa y Tel\00E9grafo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#APP_IMAGES#xlsx.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function procesarTelefono (id){',
'    var popup = apex.widget.waitPopup();',
'    try{',
'    ',
'        apex.server.process("ProcesarInformacion", {',
'           x01: id',
'            ',
'        }).then((resp) => {',
'            popup.remove();',
'            console.log ("Respuesta",resp);',
'            if(resp.o_cdgo_rspsta === 0){',
'                apex.message.showPageSuccess("Realizando Proceso, se le enviara un correo al terminar");',
'               /* apex.submit( ''PROCESAR'' );*/',
'            }else{',
'                apex.message.clearErrors();',
'                apex.message.alert( resp.o_mnsje_rspsta );',
'            }',
'        })',
'    }catch(ex){',
'        popup.remove();',
'        console.log(''Excepcion:''+ex);',
'    }',
'}',
'',
'function CargueTelefono (id, idntfccion){',
'    var popup = apex.widget.waitPopup();',
'    try{',
'        ',
'        apex.server.process("GenerarLiquidacion", {',
'           x01: id,',
'           x02: idntfccion',
'        }).then((resp) => {',
'            popup.remove();',
'            console.log ("Respuesta",resp);',
'            if(resp.o_cdgo_rspsta === 0){',
'                apex.message.showPageSuccess("Realizando Proceso, se le enviara un correo al terminar");',
'               /* apex.submit( ''PROCESAR'' );*/',
'            }else{',
'                apex.message.clearErrors();',
'                apex.message.alert( resp.o_mnsje_rspsta );',
'            }',
'        })',
'    }catch(ex){',
'        popup.remove();',
'        console.log(''Excepcion:''+ex);',
'    }',
'}',
'',
'',
'function RealizarRecaudo(id){',
'    var popup = apex.widget.waitPopup();',
'    try{',
'        ',
'        apex.server.process("RealizarRecaudo", {',
'           x01: id',
'        }).then((resp) => {',
'            popup.remove();',
'            console.log ("Respuesta",resp);',
'            if(resp.o_cdgo_rspsta === 0){',
'                apex.message.showPageSuccess("Realizando Proceso, se le enviara un correo al terminar");',
'               /* apex.submit( ''PROCESAR2'' );*/',
'            }else{',
'                apex.message.clearErrors();',
'                apex.message.alert( resp.o_mnsje_rspsta );',
'            }',
'        })',
'    }catch(ex){',
'        popup.remove();',
'        console.log(''Excepcion:''+ex);',
'    }',
'}',
'',
'function RealizarCartera(id){',
'    var popup = apex.widget.waitPopup();',
'    try{',
'        ',
'        apex.server.process("RealizarCartera", {',
'           x01: id',
'        }).then((resp) => {',
'            popup.remove();',
'            console.log ("Respuesta",resp);',
'            if(resp.o_cdgo_rspsta === 0){',
'                apex.message.showPageSuccess("Realizando Proceso, se le enviara un correo al terminar");',
'               /* apex.submit( ''PROCESAR2'' );*/',
'            }else{',
'                apex.message.clearErrors();',
'                apex.message.alert( resp.o_mnsje_rspsta );',
'            }',
'        })',
'    }catch(ex){',
'        popup.remove();',
'        console.log(''Excepcion:''+ex);',
'    }',
'}',
'',
'function RechazarLiquidacion (id, idntfccion){',
'    var popup = apex.widget.waitPopup();',
'    try{',
'        ',
'        apex.server.process("RechazarLiquidacion", {',
'           x01: id,',
'           x02: idntfccion',
'        }).then((resp) => {',
'            popup.remove();',
'            console.log ("Respuesta",resp);',
'            if(resp.o_cdgo_rspsta === 0){',
'                apex.message.showPageSuccess("Proceso Rechazado.");',
'                apex.submit( ''PROCESAR'' );',
'            }else{',
'                apex.message.clearErrors();',
'                apex.message.alert( resp.o_mnsje_rspsta );',
'            }',
'        })',
'    }catch(ex){',
'        popup.remove();',
'        console.log(''Excepcion:''+ex);',
'    }',
'}',
'',
'function RechazarRecaudo (id, idntfccion){',
'    var popup = apex.widget.waitPopup();',
'    try{',
'        ',
'        apex.server.process("RechazarRecaudo", {',
'           x01: id,',
'           x02: idntfccion',
'        }).then((resp) => {',
'            popup.remove();',
'            console.log ("Respuesta",resp);',
'            if(resp.o_cdgo_rspsta === 0){',
'                apex.message.showPageSuccess("Proceso Rechazado.");',
'                apex.submit( ''PROCESAR'' );',
'            }else{',
'                apex.message.clearErrors();',
'                apex.message.alert( resp.o_mnsje_rspsta );',
'            }',
'        })',
'    }catch(ex){',
'        popup.remove();',
'        console.log(''Excepcion:''+ex);',
'    }',
'}',
'',
'function RechazarCartera (id, idntfccion){',
'    var popup = apex.widget.waitPopup();',
'    try{',
'        ',
'        apex.server.process("RechazarCartera", {',
'           x01: id,',
'           x02: idntfccion',
'        }).then((resp) => {',
'            popup.remove();',
'            console.log ("Respuesta",resp);',
'            if(resp.o_cdgo_rspsta === 0){',
'                apex.message.showPageSuccess("Proceso Rechazado.");',
'                apex.submit( ''PROCESAR'' );',
'            }else{',
'                apex.message.clearErrors();',
'                apex.message.alert( resp.o_mnsje_rspsta );',
'            }',
'        })',
'    }catch(ex){',
'        popup.remove();',
'        console.log(''Excepcion:''+ex);',
'    }',
'}',
'',
'',
'',
'',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.type_row_no_cumple{',
'    background-color: #CA0000;',
'    color: #FFFFFF;',
'',
'}',
''))
,p_step_template=>wwv_flow_api.id(164067522409707638)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'VROMERO'
,p_last_upd_yyyymmddhh24miss=>'20240806151806'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161255271053011104)
,p_plug_name=>unistr('Gesti\00F3n de Archivo de Recaudo')
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_infrmcion_telefono,',
'    --   a.id_sjto_impsto,',
'       a.id_impsto,',
'       a.file_blob,',
'       a.file_name,',
'       a.file_mimetype,',
'       a.user_dgta,',
'       a.fcha_dgta,',
'       a.user_mdfca,',
'       a.fcha_mdfca,',
'       a.id_telefono_archvo_tpo,',
'       c.nmbre as Tipo_de_Archivo, ',
'       a.vgncia,',
'       b.nit,',
'       b.nmbre_rzon_scial as Nombre_Razon_Social,',
'       1 DESCARGAR,',
'       a.id_usrio_tlfnia,',
'       a.id_prdo,',
'       case ',
'       when a.indcdor_prcsdo = ''N'' then',
'           ''<a onclick="javascript:procesarTelefono(''||a.id_infrmcion_telefono||'')"  title="Procesar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot"><span aria-hidden="true" class="t-Icon fa fa-gears"></span></a>''',
'       when a.indcdor_prcsdo = ''S'' then',
'        ''<div style="text-align: center;">',
'           <a onclick="javascript:RealizarRecaudo(''||a.id_infrmcion_telefono||'')" title="Aprobar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot" style="background-color: #4CAF50; color: white; padding: 8px 12px; border-radius: 4px; t'
||'ext-decoration: none;">',
'            <span aria-hidden="true" class="fa fa-check" style="color: green;"></span>Aprobar</a>',
'            <br>',
'            <br>',
'            <a onclick="javascript:RechazarRecaudo(''||a.id_infrmcion_telefono||'', ''||b.nit||'')" title="Rechazar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot" style="background-color: #F04545; color: white; padding: 8px 12px; border'
||'-radius: 4px; text-decoration: none;">',
'            <span aria-hidden="true" class="fa fa-times" style="color: #820B0B;"></span>Rechazar</a>',
'        </div>''',
'    when a.indcdor_prcsdo = ''E'' then',
'           ''<b><span style="color: green;">PROCESO FINALIZADO EXITOSAMENTE</span></b>''',
'     else ',
'          ''<b><span style="color: red;">PROCESO RECHAZADO</span></b>''',
'     end PROCESAR,',
'      ''REPORTE CARTERA'' REPORTE,',
'      indcdor_prcsdo',
'  from gi_g_informacion_telefono     a',
'  join gi_d_usuarios_telefonia       b  on a.id_usrio_tlfnia = b.id_usrio_tlfnia',
'  join df_i_telefono_archivo_tipo    c on a.id_telefono_archvo_tpo  = c.id_telefono_archvo_tpo',
'  join df_c_impuestos                d on a.id_impsto            = d.id_impsto',
'  where a.cdgo_clnte  =  :F_CDGO_CLNTE	',
'   and d.cdgo_impsto = ''TFT''',
'   and a.id_telefono_archvo_tpo = 2',
'   and ((a.vgncia = :P333_VGNCIA and b.nit=:P333_IDNTFCCION) or (a.vgncia = :P333_VGNCIA and :P333_IDNTFCCION is null) ',
'   or ( :P333_VGNCIA is null and b.nit=:P333_IDNTFCCION) or (:P333_VGNCIA is null and :P333_IDNTFCCION is null))',
' order by a.id_infrmcion_telefono desc',
' ',
'/* select a.id_infrmcion_telefono,',
'    --   a.id_sjto_impsto,',
'       a.id_impsto,',
'       a.file_blob,',
'       a.file_name,',
'       a.file_mimetype,',
'       a.user_dgta,',
'       a.fcha_dgta,',
'       a.user_mdfca,',
'       a.fcha_mdfca,',
'       a.id_telefono_archvo_tpo,',
'       c.nmbre as Tipo_de_Archivo, ',
'       a.vgncia,',
'       b.nit,',
'       b.nmbre_rzon_scial as Nombre_Razon_Social,',
'       1 DESCARGAR,',
'       a.id_usrio_tlfnia,',
'       case ',
'       when a.indcdor_prcsdo = ''N'' then',
'           ''<a onclick="javascript:procesarTelefono(''||a.id_infrmcion_telefono||'')"  title="Procesar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot"><span aria-hidden="true" class="t-Icon fa fa-gears"></span></a>''',
'       when a.indcdor_prcsdo = ''S'' and (select count(e.id_tlfno_rcdo) from gi_g_telefono_recaudo e where e.estdo = ''SIN PROCESAR'' and a.id_infrmcion_telefono = e.id_infrmcion_telefono',
'                                       group by e.id_infrmcion_telefono) = 0 then',
'        ''<div style="text-align: center;">',
'           <a onclick="javascript:RealizarRecaudo(''||a.id_infrmcion_telefono||'')" title="Aprobar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot" style="background-color: #4CAF50; color: white; padding: 8px 12px; border-radius: 4px; t'
||'ext-decoration: none;">',
'            <span aria-hidden="true" class="fa fa-check" style="color: green;"></span>Aprobar</a>',
'            <br>',
'            <br>',
'        </div>''',
'      when a.indcdor_prcsdo = ''S'' and (select count(e.id_tlfno_rcdo) from gi_g_telefono_recaudo e where e.estdo = ''SIN PROCESAR'' and a.id_infrmcion_telefono = e.id_infrmcion_telefono',
'                                       group by e.id_infrmcion_telefono) != 0 then',
'         ''<a onclick="javascript:RechazarRecaudo(''||a.id_infrmcion_telefono||'', ''||b.nit||'')" title="Rechazar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot" style="background-color: #F04545; color: white; padding: 8px 12px; border-r'
||'adius: 4px; text-decoration: none;">',
'          <span aria-hidden="true" class="fa fa-times" style="color: #820B0B;"></span>Rechazar</a>''',
'    when a.indcdor_prcsdo = ''E'' then',
'           ''<b><span style="color: green;">PROCESO FINALIZADO EXITOSAMENTE</span></b>''',
'     when a.indcdor_prcsdo = ''R'' then',
'          ''<b><span style="color: red;">PROCESO RECHAZADO</span></b>''',
'     end PROCESAR,',
'      ''REPORTE CARTERA'' REPORTE,',
'      indcdor_prcsdo',
'  from gi_g_informacion_telefono     a',
'  join gi_d_usuarios_telefonia       b  on a.id_usrio_tlfnia = b.id_usrio_tlfnia',
'  join df_i_telefono_archivo_tipo    c on a.id_telefono_archvo_tpo  = c.id_telefono_archvo_tpo',
'  join df_c_impuestos                d on a.id_impsto            = d.id_impsto',
'  where a.cdgo_clnte  =  :F_CDGO_CLNTE	',
'   and d.cdgo_impsto = ''TFT''',
'   and a.id_telefono_archvo_tpo = 2',
'   and ((a.vgncia = :P333_VGNCIA and b.nit=:P333_IDNTFCCION) or (a.vgncia = :P333_VGNCIA and :P333_IDNTFCCION is null) ',
'   or ( :P333_VGNCIA is null and b.nit=:P333_IDNTFCCION) or (:P333_VGNCIA is null and :P333_IDNTFCCION is null))',
' order by a.id_infrmcion_telefono desc;*/'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(161255350015011105)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'VROMERO'
,p_internal_uid=>161255350015011105
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161316762274355702)
,p_db_column_name=>'ID_INFRMCION_TELEFONO'
,p_display_order=>10
,p_column_identifier=>'R'
,p_column_label=>unistr('Id informaci\00F3n Telefono')
,p_column_link=>'f?p=&APP_ID.:336:&SESSION.::&DEBUG.:RP:P336_ID_INFRMCION_TLFNO:#ID_INFRMCION_TELEFONO#'
,p_column_linktext=>'#ID_INFRMCION_TELEFONO#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161317915949355714)
,p_db_column_name=>'NIT'
,p_display_order=>20
,p_column_identifier=>'AD'
,p_column_label=>unistr('Identificaci\00F3n ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161318027160355715)
,p_db_column_name=>'NOMBRE_RAZON_SOCIAL'
,p_display_order=>30
,p_column_identifier=>'AE'
,p_column_label=>unistr('Nombre Raz\00F3n Social')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161317836621355713)
,p_db_column_name=>'VGNCIA'
,p_display_order=>40
,p_column_identifier=>'AC'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161317085510355705)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'U'
,p_column_label=>'Nombre de Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161317741117355712)
,p_db_column_name=>'TIPO_DE_ARCHIVO'
,p_display_order=>60
,p_column_identifier=>'AB'
,p_column_label=>'Tipo de Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161317337904355708)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>70
,p_column_identifier=>'X'
,p_column_label=>'Fecha de registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161317521865355710)
,p_db_column_name=>'FCHA_MDFCA'
,p_display_order=>80
,p_column_identifier=>'Z'
,p_column_label=>unistr('Fecha de Actualizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161318209638355717)
,p_db_column_name=>'PROCESAR'
,p_display_order=>90
,p_column_identifier=>'AG'
,p_column_label=>'Procesar'
,p_column_link=>'f?p=&APP_ID.:333:&SESSION.::&DEBUG.:RP:P333_ID_INFRMCION_TELEFONO,P333_ID_IMPUESTO,P333_IDNTFCCION:#ID_INFRMCION_TELEFONO#,#ID_IMPSTO#,#NIT#'
,p_column_linktext=>'&PROCESAR2.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161316805035355703)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>100
,p_column_identifier=>'S'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161316908951355704)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>110
,p_column_identifier=>'T'
,p_column_label=>'File Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161317107171355706)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>120
,p_column_identifier=>'V'
,p_column_label=>'File Mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161317215062355707)
,p_db_column_name=>'USER_DGTA'
,p_display_order=>130
,p_column_identifier=>'W'
,p_column_label=>'User Dgta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161317447389355709)
,p_db_column_name=>'USER_MDFCA'
,p_display_order=>140
,p_column_identifier=>'Y'
,p_column_label=>'User Mdfca'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161317645031355711)
,p_db_column_name=>'ID_TELEFONO_ARCHVO_TPO'
,p_display_order=>150
,p_column_identifier=>'AA'
,p_column_label=>'Id Telefono Archvo Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161318179739355716)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>160
,p_column_identifier=>'AF'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GI_G_INFORMACION_TELEFONO:FILE_BLOB:ID_INFRMCION_TELEFONO::FILE_MIMETYPE:FILE_NAME:::attachment:<i class="fa fa-download" aria-hidden="true"></i>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161867045507976444)
,p_db_column_name=>'REPORTE'
,p_display_order=>170
,p_column_identifier=>'AI'
,p_column_label=>'Reporte'
,p_column_link=>'f?p=&APP_ID.:337:&SESSION.::&DEBUG.:RP,337:P337_USRIO_TLFNIA,P337_IDENTIFICACION,P337_VGNCIA,P337_PRDO:#ID_USRIO_TLFNIA#,#ID_INFRMCION_TELEFONO#,#VGNCIA#,#ID_PRDO#'
,p_column_linktext=>'#REPORTE#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161867181267976445)
,p_db_column_name=>'INDCDOR_PRCSDO'
,p_display_order=>180
,p_column_identifier=>'AJ'
,p_column_label=>'Indcdor Prcsdo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161541223211206941)
,p_db_column_name=>'ID_USRIO_TLFNIA'
,p_display_order=>190
,p_column_identifier=>'AK'
,p_column_label=>'Id Usrio Tlfnia'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(163124826123418612)
,p_db_column_name=>'ID_PRDO'
,p_display_order=>200
,p_column_identifier=>'AL'
,p_column_label=>'Id Prdo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(161286043768839554)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1612861'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ID_INFRMCION_TELEFONO:VGNCIA:NIT:NOMBRE_RAZON_SOCIAL:FILE_NAME:TIPO_DE_ARCHIVO:FCHA_DGTA:FCHA_MDFCA:DESCARGAR:PROCESAR:REPORTE::ID_PRDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161316625067355701)
,p_plug_name=>'TAB'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--pill'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(161702915711812105)
,p_plug_name=>unistr('Gesti\00F3n de Archivo de Cartera')
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_infrmcion_telefono,',
'    --   a.id_sjto_impsto,',
'       a.id_impsto,',
'       a.file_blob,',
'       a.file_name,',
'       a.file_mimetype,',
'       a.user_dgta,',
'       a.fcha_dgta,',
'       a.user_mdfca,',
'       a.fcha_mdfca,',
'       a.id_telefono_archvo_tpo,',
'       c.nmbre as Tipo_de_Archivo, ',
'       a.vgncia,',
'       b.nit,',
'       b.nmbre_rzon_scial as Nombre_Razon_Social,',
'       1 DESCARGAR,',
'       case ',
'       when a.indcdor_prcsdo = ''N'' then',
'           ''<a onclick="javascript:procesarTelefono(''||a.id_infrmcion_telefono||'')"  title="Procesar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot"><span aria-hidden="true" class="t-Icon fa fa-gears"></span></a>''',
'       when a.indcdor_prcsdo = ''S'' then',
'        ''<div style="text-align: center;">',
'           <a onclick="javascript:RealizarCartera(''||a.id_infrmcion_telefono||'')" title="Aprobar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot" style="background-color: #4CAF50; color: white; padding: 8px 12px; border-radius: 4px; t'
||'ext-decoration: none;">',
'            <span aria-hidden="true" class="fa fa-check" style="color: green;"></span>Aprobar</a>',
'            <br>',
'            <br>',
'            <a onclick="javascript:RechazarCartera(''||a.id_infrmcion_telefono||'', ''||b.nit||'')" title="Rechazar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot" style="background-color: #F04545; color: white; padding: 8px 12px; border'
||'-radius: 4px; text-decoration: none;">',
'            <span aria-hidden="true" class="fa fa-times" style="color: #820B0B;"></span>Rechazar</a>',
'        </div>''',
'     when a.indcdor_prcsdo = ''E'' then',
'           ''<b><span style="color: green;">PROCESO FINALIZADO EXITOSAMENTE</span></b>''',
'     else ',
'          ''<b><span style="color: red;">PROCESO RECHAZADO</span></b>''',
'     end PROCESAR',
'  from gi_g_informacion_telefono     a',
'  join gi_d_usuarios_telefonia       b  on a.id_usrio_tlfnia = b.id_usrio_tlfnia',
'  join df_i_telefono_archivo_tipo    c on a.id_telefono_archvo_tpo  = c.id_telefono_archvo_tpo',
'  join df_c_impuestos                d on a.id_impsto            = d.id_impsto',
'  where a.cdgo_clnte  =  :F_CDGO_CLNTE	',
'   and d.cdgo_impsto = ''TFT''',
'   and a.id_telefono_archvo_tpo = 3',
'   and ((a.vgncia = :P333_VGNCIA and b.nit=:P333_IDNTFCCION) or (a.vgncia = :P333_VGNCIA and :P333_IDNTFCCION is null) ',
'   or ( :P333_VGNCIA is null and b.nit=:P333_IDNTFCCION) or (:P333_VGNCIA is null and :P333_IDNTFCCION is null))',
' order by a.id_infrmcion_telefono desc;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(161703081134812106)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'VROMERO'
,p_internal_uid=>161703081134812106
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161703141551812107)
,p_db_column_name=>'ID_TELEFONO_ARCHVO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Telefono Archvo Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161703241665812108)
,p_db_column_name=>'TIPO_DE_ARCHIVO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo de Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161703366659812109)
,p_db_column_name=>'VGNCIA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161703490915812110)
,p_db_column_name=>'NIT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161703523759812111)
,p_db_column_name=>'NOMBRE_RAZON_SOCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nombre Razon Social'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161703686837812112)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GI_G_INFORMACION_TELEFONO:FILE_BLOB:ID_INFRMCION_TELEFONO::FILE_MIMETYPE:FILE_NAME:::attachment:<i class="fa fa-download" aria-hidden="true"></i>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161703711472812113)
,p_db_column_name=>'PROCESAR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Procesar'
,p_column_link=>'f?p=&APP_ID.:333:&SESSION.::&DEBUG.:RP:P333_ID_INFRMCION_TELEFONO,P333_ID_IMPUESTO,P333_IDNTFCCION:#ID_INFRMCION_TELEFONO#,#ID_IMPSTO#,#NIT#'
,p_column_linktext=>'&PROCESAR2.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161703833026812114)
,p_db_column_name=>'ID_INFRMCION_TELEFONO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Id informaci\00F3n Telefono')
,p_column_link=>'f?p=&APP_ID.:336:&SESSION.::&DEBUG.:RP:P336_ID_INFRMCION_TLFNO:#ID_INFRMCION_TELEFONO#'
,p_column_linktext=>'#ID_INFRMCION_TELEFONO#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161703914294812115)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161704091168812116)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'File Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161704122233812117)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Nombre de Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161704249932812118)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'File Mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161704348098812119)
,p_db_column_name=>'USER_DGTA'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'User Dgta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161704472208812120)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Fecha de registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161704581797812121)
,p_db_column_name=>'USER_MDFCA'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'User Mdfca'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161704660001812122)
,p_db_column_name=>'FCHA_MDFCA'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('Fecha de Actualizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(161747659678058488)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1617477'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_INFRMCION_TELEFONO:VGNCIA:TIPO_DE_ARCHIVO:NIT:NOMBRE_RAZON_SOCIAL:FILE_NAME:FCHA_DGTA:FCHA_MDFCA:DESCARGAR:PROCESAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(300165091905411528)
,p_plug_name=>unistr('<b>Par\00E1metros de  B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(300338257354111144)
,p_plug_name=>unistr('Gesti\00F3n de Archivo de Liquidaci\00F3n')
,p_region_name=>'info'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_infrmcion_telefono,',
'    --   a.id_sjto_impsto,',
'       a.id_impsto,',
'       a.file_blob,',
'       a.file_name,',
'       a.file_mimetype,',
'       a.user_dgta,',
'	   a.fcha_dgta,',
'       a.user_mdfca,',
'       a.fcha_mdfca,',
'       a.id_telefono_archvo_tpo,',
'       c.nmbre as Tipo_de_Archivo, ',
'       a.vgncia,',
'       b.nit,',
'       b.nmbre_rzon_scial as Nombre_Razon_Social,',
'       1 DESCARGAR,',
'       case ',
'       when a.indcdor_prcsdo = ''N'' then',
'           ''<a onclick="javascript:procesarTelefono(''||a.id_infrmcion_telefono||'')"  title="Procesar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot"><span aria-hidden="true" class="t-Icon fa fa-gears"></span></a>''',
'       when a.indcdor_prcsdo = ''S'' then',
'        ''<div style="text-align: center;">',
'           <a onclick="javascript:CargueTelefono(''||a.id_infrmcion_telefono||'', ''||b.nit||'')" title="Aprobar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot" style="background-color: #4CAF50; color: white; padding: 8px 12px; border-ra'
||'dius: 4px; text-decoration: none;">',
'            <span aria-hidden="true" class="fa fa-check" style="color: green;"></span>Aprobar</a>',
'            <br>',
'            <br>',
'            <a onclick="javascript:RechazarLiquidacion(''||a.id_infrmcion_telefono||'', ''||b.nit||'')" title="Rechazar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot" style="background-color: #F04545; color: white; padding: 8px 12px; bo'
||'rder-radius: 4px; text-decoration: none;">',
'            <span aria-hidden="true" class="fa fa-times" style="color: #820B0B;"></span>Rechazar</a>',
'        </div>''',
'     when a.indcdor_prcsdo = ''E'' then',
'           ''<b><span style="color: #227916;">PROCESO FINALIZADO EXITOSAMENTE</span></b>''',
'     else ',
'          ''<b><span style="color:#8A0909;">PROCESO RECHAZADO</span></b>''',
'     end PROCESAR,',
'     case',
'        when extract(day from a.fcha_dgta) > 14 then ''extemporaneo''',
'        else null',
'     end as cargue',
'    -- case ',
'   --  when to_char(a.fcha_dgta,''dd'') < ''15'' and to_char(a.fcha_dgta,''d'') not in (''7'',''1'')  and a.fcha_dgta <> e.fcha then ''type_row_cumple''',
'    -- when to_char(a.fcha_dgta,''dd'') > ''14'' then ''type_row_no_cumple'' end class',
'  from gi_g_informacion_telefono      a',
'   join gi_d_usuarios_telefonia       b  on a.id_usrio_tlfnia = b.id_usrio_tlfnia',
'   join df_i_telefono_archivo_tipo    c on a.id_telefono_archvo_tpo  = c.id_telefono_archvo_tpo',
'   join df_c_impuestos                d on a.id_impsto            = d.id_impsto',
'--   join df_c_feriados e on a.cdgo_clnte = e.cdgo_clnte',
'  where a.cdgo_clnte  =  :F_CDGO_CLNTE	',
'   and d.cdgo_impsto = ''TFT''',
'   and a.id_telefono_archvo_tpo = 1',
'   and ((a.vgncia = :P333_VGNCIA and b.nit=:P333_IDNTFCCION) or (a.vgncia = :P333_VGNCIA and :P333_IDNTFCCION is null) ',
'   or ( :P333_VGNCIA is null and b.nit=:P333_IDNTFCCION) or (:P333_VGNCIA is null and :P333_IDNTFCCION is null))',
' order by a.id_infrmcion_telefono desc',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(170180379072737648)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>170180379072737648
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160163486508001331)
,p_db_column_name=>'ID_INFRMCION_TELEFONO'
,p_display_order=>10
,p_column_identifier=>'AA'
,p_column_label=>unistr('Id Informaci\00F3n Telefon\00EDa')
,p_column_link=>'f?p=&APP_ID.:336:&SESSION.::&DEBUG.:RP:P336_ID_INFRMCION_TLFNO,P336_ID_IMPUESTO,P336_IDNTFCCION:#ID_INFRMCION_TELEFONO#,#ID_IMPSTO#,#NIT#'
,p_column_linktext=>'#ID_INFRMCION_TELEFONO#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160163601084001333)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'AC'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160163742435001334)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>40
,p_column_identifier=>'AD'
,p_column_label=>'File Blob'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_column_alignment=>'CENTER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160163835227001335)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'AE'
,p_column_label=>'Nombre de Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160163971171001336)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>60
,p_column_identifier=>'AF'
,p_column_label=>'File Mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160164065364001337)
,p_db_column_name=>'USER_DGTA'
,p_display_order=>70
,p_column_identifier=>'AG'
,p_column_label=>'User Dgta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160164296737001339)
,p_db_column_name=>'USER_MDFCA'
,p_display_order=>90
,p_column_identifier=>'AI'
,p_column_label=>'User Mdfca'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160164393823001340)
,p_db_column_name=>'FCHA_MDFCA'
,p_display_order=>100
,p_column_identifier=>'AJ'
,p_column_label=>unistr('Fecha de Actualizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160164487213001341)
,p_db_column_name=>'ID_TELEFONO_ARCHVO_TPO'
,p_display_order=>110
,p_column_identifier=>'AK'
,p_column_label=>'Id Telefono Archvo Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160164512964001342)
,p_db_column_name=>'VGNCIA'
,p_display_order=>120
,p_column_identifier=>'AL'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160164997557001346)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>160
,p_column_identifier=>'AP'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GI_G_INFORMACION_TELEFONO:FILE_BLOB:ID_INFRMCION_TELEFONO::FILE_MIMETYPE:FILE_NAME:::attachment:<i class="fa fa-download" aria-hidden="true"></i>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160165024348001347)
,p_db_column_name=>'PROCESAR'
,p_display_order=>170
,p_column_identifier=>'AQ'
,p_column_label=>'Proceso'
,p_column_link=>'f?p=&APP_ID.:333:&SESSION.::&DEBUG.:RP:P333_ID_INFRMCION_TELEFONO,P333_IMPSTO,P333_IDNTFCCION:#ID_INFRMCION_TELEFONO#,#ID_IMPSTO#,#NIT#'
,p_column_linktext=>'&PROCESAR.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160581820104527408)
,p_db_column_name=>'NIT'
,p_display_order=>200
,p_column_identifier=>'AT'
,p_column_label=>'NIT'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160581951411527409)
,p_db_column_name=>'TIPO_DE_ARCHIVO'
,p_display_order=>210
,p_column_identifier=>'AU'
,p_column_label=>'Tipo De Archivo'
,p_column_html_expression=>'<b>#ID_TELEFONO_ARCHVO_TPO#</b>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160582035498527410)
,p_db_column_name=>'NOMBRE_RAZON_SOCIAL'
,p_display_order=>220
,p_column_identifier=>'AV'
,p_column_label=>unistr('Nombre Raz\00F3n Social')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162444935144554907)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>230
,p_column_identifier=>'AX'
,p_column_label=>'Fecha de registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162377265960717033)
,p_db_column_name=>'CARGUE'
,p_display_order=>240
,p_column_identifier=>'AZ'
,p_column_label=>'Cargue'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(170250347452848456)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1603110'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ID_INFRMCION_TELEFONO:NIT:NOMBRE_RAZON_SOCIAL:VGNCIA:TIPO_DE_ARCHIVO:FILE_NAME:FCHA_DGTA:FCHA_MDFCA:DESCARGAR:PROCESAR:'
,p_sort_column_1=>'ID_INFRMCION_EXGNA'
,p_sort_direction_1=>'DESC'
,p_break_on=>'0:0:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:0:0'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(162654930303722501)
,p_report_id=>wwv_flow_api.id(170250347452848456)
,p_name=>'FECHA CARGUE'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CARGUE'
,p_operator=>'='
,p_expr=>'extemporaneo'
,p_condition_sql=>' (case when ("CARGUE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''extemporaneo''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FF6464'
,p_row_font_color=>'#000000'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(160311795204818011)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(300165091905411528)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(160312831178818028)
,p_name=>'P333_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_prompt=>'NIT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(160313296242818029)
,p_name=>'P333_VGNCIA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia as d,',
'       vgncia as r',
'  from df_s_vigencias',
' where vgncia >= 2024',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(160313616687818034)
,p_name=>'P333_ID_INFRMCION_TELEFONO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_INFRMCION_TELEFONO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(160741278429266801)
,p_name=>'P333_ID_IMPUESTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(160831596442466803)
,p_name=>'P333_ID_IMPSTO_ACTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(160831603544466804)
,p_name=>'P333_ID_CARGA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(160831778331466805)
,p_name=>'P333_ID_IMPUESTO_SUBIMPUESTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(160832398772466811)
,p_name=>'P333_ID_PRCSO_CRGA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161321229658355747)
,p_name=>'P333_CNCPTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161321519676355750)
,p_name=>'P333_ID_CNTA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161537267489206901)
,p_name=>'P333_ID_BNCO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(300165091905411528)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(160316022495818042)
,p_name=>'Al_procesar_informacion'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(160316595650818056)
,p_event_id=>wwv_flow_api.id(160316022495818042)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'PROCESAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(160316974060818063)
,p_name=>'New'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'let reader = new FileReader();',
'',
'reader.onload = async function (e) {',
'let data = new Uint8Array(e.target.result);',
'let workbook = XLSX.read(data, { type: "array" });',
'let worksheet = workbook.Sheets[workbook.SheetNames[0]];',
'let numSheets = workbook.SheetNames.length;',
'    ',
'//const wb = XLSX.readFile(filename);',
'for (let i = 0, l = workbook.SheetNames.length; i < l; i += 1) {',
'this.processSheet(workbook.Sheets[workbook.SheetNames[i]]);',
'    console.log(workbook.SheetNames[i]);',
'  }',
'}.bind(this);',
'reader.readAsArrayBuffer(file);',
'}'))
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(160317481285818064)
,p_event_id=>wwv_flow_api.id(160316974060818063)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'PROCESAR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(160315278300818040)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar_Procesos_Carga_EX'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_temp_files             apex_application_temp_files%rowtype;',
'    v_info_exo               gi_g_informacion_exogena%rowtype;',
'    v_lneas_encbzdo          number;',
'    v_id_crga_etl            number;',
'    v_id_impsto_sbmpsto      number;',
'    v_id_prdo                number;',
'    v_count                  number;',
'    filecounts               exception;',
'begin',
'    select * ',
'      into v_temp_files',
'      from apex_application_temp_files',
'     where name = :P333_FILE_BLOB_TEMP;',
'     ',
'    select * ',
'      into v_info_exo',
'      from gi_g_informacion_exogena',
'     where id_infrmcion_exgna = :P333_ID_INFRMCION_EXGNA;',
'',
'--hallar las lineas del encabezado para insertar en procesas carga',
'    select lneas_encbzdo, id_crga_etl',
'      into v_lneas_encbzdo, v_id_crga_etl',
'      from df_i_exogena_archivo_tipo',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and id_exgna_archvo_tpo = v_info_exo.id_exgna_archvo_tpo;',
'                ',
'--buscar impuesto subimpuesto para insertar en procesos carga        ',
'    ',
'     select id_impsto_sbmpsto',
'       into v_id_impsto_sbmpsto',
'       from df_i_impuestos_subimpuesto',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'        and id_impsto  = v_info_exo.id_impsto;',
'        ',
'--buscar periodo para insertar en procesos carga',
'',
'     select id_prdo',
'       into v_id_prdo',
'       from df_i_periodos',
'      where cdgo_clnte          = v_info_exo.cdgo_clnte',
'        and id_impsto           = v_info_exo.id_impsto',
'        and id_impsto_sbmpsto   = v_id_impsto_sbmpsto',
'        and vgncia              = v_info_exo.vgncia',
'        and cdgo_prdcdad        = ''ANU'';',
'        ',
'        ',
'     select count(*)',
'       into v_count',
'       from et_g_procesos_carga',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'        --and id_impsto  = v_info_exo.id_impsto',
'        --and vgncia     = v_info_exo.vgncia',
'        and file_name  = v_temp_files.filename;--v_info_exo.file_name;',
'      ',
'      if ( v_count > 0 ) then',
'           raise filecounts;',
'      end if;',
'       ',
'    insert into et_g_procesos_carga ( id_crga , cdgo_clnte , id_impsto , vgncia , file_blob , file_name  , file_mimetype ',
'                                     , cdgo_prcso_estdo , lneas_encbzdo , lneas_rsmen , id_impsto_sbmpsto , id_prdo , fcha_rgstro , id_usrio ) ',
'                             values ( v_id_crga_etl , :F_CDGO_CLNTE , v_info_exo.id_impsto , v_info_exo.vgncia , v_temp_files.blob_content , v_temp_files.filename , v_temp_files.mime_type',
'                                     , ''SE'' , v_lneas_encbzdo , 0 , v_id_impsto_sbmpsto , v_id_prdo , systimestamp , :F_ID_USRIO );',
'',
'exception ',
'     when filecounts then',
'          raise_application_error(-20003 , ''El archivo '' ||  v_temp_files.filename || '' ya se encuentra procesado.'');',
'     when others then ',
'          raise_application_error(-20002 , ''No fue posible cargar el archivo.'' );',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(160315677418818041)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_NL.AMIS.SCHEFFER.PROCESS.EXCEL2COLLECTION'
,p_process_name=>'Procesar_Excel'
,p_attribute_01=>'P333_FILE_BLOB_TEMP'
,p_attribute_02=>'ETLEXC'
,p_attribute_04=>';'
,p_attribute_05=>'"'
,p_attribute_07=>'N'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(160832161690466809)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct id_impsto ',
'into   :P333_ID_IMPUESTO',
'from gi_g_informacion_telefono;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161321430226355749)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Concepto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cncpto',
'into  :P333_CNCPTO',
'from df_i_conceptos',
'where id_impsto = :P333_ID_IMPUESTO',
'and cdgo_cncpto= ''TFT'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161537428726206903)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar banco y Cuenta Asociado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_bnco_cnta, id_bnco',
'into :P333_ID_CNTA, :P333_ID_BNCO',
'from df_i_cncpto_bncos_cnta a',
'join df_c_bancos_cuenta b on b.id_bnco_cnta = a.id_bnco_cnta',
'where a.id_cncpto = :P333_CNCPTO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(160314804592818038)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ProcesarInformacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta              number;',
'    v_mnsje_rspsta             varchar2(4000);',
'    v_id_infrmcion_tlfno       number := APEX_APPLICATION.g_x01;',
'begin',
'   ',
'    pkg_gi_telefonos_cargue.prc_rg_informacion_telefono_job ( p_cdgo_clnte               => :F_CDGO_CLNTE ',
'                                                              , p_id_infrmcion_telefono  => v_id_infrmcion_tlfno',
'                                                              , p_id_usrio               => :F_ID_USRIO',
'                                                              ,p_impsto                  => :P333_ID_IMPUESTO',
'                                                              ,p_impsto_sbmpsto          =>  null',
'                                                              , o_cdgo_rspsta            => v_cdgo_rspsta',
'                                                              , o_mnsje_rspsta           => v_mnsje_rspsta );',
'         ',
'  if (v_cdgo_rspsta != 0) then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta );',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_all();',
'     else',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_all();',
'     end if;',
'     exception ',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 99 );',
'        apex_json.write(''o_mnsje_rspsta'', ''Error al procesar archivo.'');',
'        apex_json.close_all();',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161254992336011101)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarLiquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta      number;',
'    o_mnsje_rspsta     varchar2(4000);',
'    v_error            varchar2(4000);',
'    v_id_infrmcion_tlfno  number := APEX_APPLICATION.g_x01;',
'    v_idntfccion          varchar2(50) := APEX_APPLICATION.g_x02;',
'begin ',
'    pkg_gi_telefonos_cargue.prc_rg_tlfns_crgue_lqdcion_job        ( p_cdgo_clnte                   => :F_CDGO_CLNTE,',
'                                                                    p_id_ssion                     => :APP_SESSION,',
'                                                                    p_id_app                       => :APP_ID,',
'                                                                    p_id_page_app                  => :APP_PAGE_ID,',
'                                                                    p_id_usrio                     => :F_ID_USRIO,',
'                                                                    p_id_impsto                    => :P333_ID_IMPUESTO,',
'                                                                    p_id_infrmcion_telefono        => v_id_infrmcion_tlfno,',
'                                                                    p_idntfccion                   => v_idntfccion,',
'                                                                    o_cdgo_rspsta                  => o_cdgo_rspsta,',
'                                                                    o_mnsje_rspsta                 => o_mnsje_rspsta );  ',
'     ',
'    if (o_cdgo_rspsta != 0) then',
'       apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'',o_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'',o_mnsje_rspsta);',
'        apex_json.close_all();',
'    else',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'',o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'',o_mnsje_rspsta);',
'    apex_json.close_all();',
'    end if;',
'	exception',
'        when others then',
'        v_error := sqlerrm;',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'',99);',
'        apex_json.write(''o_mnsje_rspsta'',v_error);',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161537659513206905)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RealizarRecaudo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta      number;',
'    o_mnsje_rspsta     varchar2(4000);',
'    v_error            varchar2(4000);',
'    v_id_infrmcion_tlfno  number := APEX_APPLICATION.g_x01;',
'begin ',
'                                                      ',
'     pkg_gi_telefonos_cargue.prc_rg_recaudo_telefono_job    (     p_cdgo_clnte              => :F_CDGO_CLNTE',
'                                                         , p_id_infrmcion_telefono  => v_id_infrmcion_tlfno',
'                                                         , p_id_impsto              => :P333_ID_IMPUESTO                                ',
'                                                         , p_id_usrio               => :F_ID_USRIO                               ',
'                                                         , p_id_bnco                => :P333_ID_BNCO                                    ',
'                                                         , p_id_bnco_cnta           => :P333_ID_CNTA',
'                                                         , o_cdgo_rspsta            => o_cdgo_rspsta',
'                                                         , o_mnsje_rspsta           =>o_mnsje_rspsta);',
'     ',
'    if (o_cdgo_rspsta != 0) then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'',o_cdgo_rspsta);',
'       apex_json.write(''o_mnsje_rspsta'',o_mnsje_rspsta);',
'        apex_json.close_all();',
'    else',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'',o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'',o_mnsje_rspsta);',
'    apex_json.close_all();',
'    end if;',
'	exception',
'        when others then',
'            v_error := sqlerrm;',
'            raise_application_error(-20001, v_error);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161863838174976412)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RealizarCartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta      number;',
'    o_mnsje_rspsta     varchar2(4000);',
'    v_error            varchar2(4000);',
'    v_id_infrmcion_tlfno  number := APEX_APPLICATION.g_x01;',
'begin ',
'                                                      ',
'     pkg_gi_telefonos_cargue.prc_rg_telefonos_cartera_job (  p_cdgo_clnte              => :F_CDGO_CLNTE',
'                                                         , p_id_usrio               => :F_ID_USRIO  ',
'                                                         , p_id_impsto              => :P333_ID_IMPUESTO ',
'                                                         , p_id_infrmcion_telefono  => v_id_infrmcion_tlfno                        ',
'                                                         , o_cdgo_rspsta            => o_cdgo_rspsta',
'                                                         , o_mnsje_rspsta           =>o_mnsje_rspsta);',
'     ',
'    if (o_cdgo_rspsta != 0) then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'',o_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'',o_mnsje_rspsta);',
'        apex_json.close_all();',
'    else',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'',o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'',o_mnsje_rspsta);',
'    apex_json.close_all();',
'    end if;',
'	exception',
'        when others then',
'            v_error := sqlerrm;',
'            raise_application_error(-20001, v_error);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161864149489976415)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RechazarLiquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta      number;',
'    o_mnsje_rspsta     varchar2(4000);',
'    v_error            varchar2(4000);',
'    v_id_infrmcion_tlfno  number := APEX_APPLICATION.g_x01;',
'    v_idntfccion          varchar2(50) := APEX_APPLICATION.g_x02;',
'begin ',
'    pkg_gi_telefonos_cargue.prc_rchzar_lqdcion (   p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                   p_idntfccion        =>  v_idntfccion,',
'                                                   p_id_infrmcion_tlfno => v_id_infrmcion_tlfno,',
'                                                   o_cdgo_rspsta        => o_cdgo_rspsta,',
'                                                   o_mnsje_rspsta        => o_mnsje_rspsta);',
'      insert into muerto (n_001, c_001) values (5082024 ,v_idntfccion );',
'      commit;',
'     ',
'   if (o_cdgo_rspsta != 0) then',
'        raise_application_error(-20001, o_mnsje_rspsta);',
'    else',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'',o_cdgo_rspsta);',
'   apex_json.write(''o_mnsje_rspsta'',o_mnsje_rspsta);',
'    apex_json.close_all();',
'    end if;',
'	exception',
'        when others then',
'            v_error := sqlerrm;',
'            raise_application_error(-20001, v_error);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(162376911864717030)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RechazarRecaudo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta      number;',
'    o_mnsje_rspsta     varchar2(4000);',
'    v_error            varchar2(4000);',
'    v_id_infrmcion_tlfno  number := APEX_APPLICATION.g_x01;',
'    v_idntfccion          varchar2(50) := APEX_APPLICATION.g_x02;',
'begin ',
'    pkg_gi_telefonos_cargue.prc_rchzar_rcdo      ( p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                   p_idntfccion        =>  v_idntfccion,',
'                                                   p_id_infrmcion_tlfno => v_id_infrmcion_tlfno,',
'                                                   o_cdgo_rspsta        => o_cdgo_rspsta,',
'                                                   o_mnsje_rspsta        => o_mnsje_rspsta);  ',
'     ',
'   if (o_cdgo_rspsta != 0) then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'',o_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'',o_mnsje_rspsta);',
'        apex_json.close_all();',
'    else',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'',o_cdgo_rspsta);',
'   apex_json.write(''o_mnsje_rspsta'',o_mnsje_rspsta);',
'    apex_json.close_all();',
'    end if;',
'	exception',
'        when others then',
'            v_error := sqlerrm;',
'            raise_application_error(-20001, v_error);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(162377009166717031)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RechazarCartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta      number;',
'    o_mnsje_rspsta     varchar2(4000);',
'    v_error            varchar2(4000);',
'    v_id_infrmcion_tlfno  number := APEX_APPLICATION.g_x01;',
'    v_idntfccion          varchar2(50) := APEX_APPLICATION.g_x02;',
'begin ',
'    pkg_gi_telefonos_cargue.prc_rchzar_cartera     ( p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                   p_idntfccion        =>  v_idntfccion,',
'                                                   p_id_infrmcion_tlfno => v_id_infrmcion_tlfno,',
'                                                   o_cdgo_rspsta        => o_cdgo_rspsta,',
'                                                   o_mnsje_rspsta        => o_mnsje_rspsta);  ',
'     ',
'   if (o_cdgo_rspsta != 0) then',
'        raise_application_error(-20001, o_mnsje_rspsta);',
'    else',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'',o_cdgo_rspsta);',
'   apex_json.write(''o_mnsje_rspsta'',o_mnsje_rspsta);',
'    apex_json.close_all();',
'    end if;',
'	exception',
'        when others then',
'            v_error := sqlerrm;',
'            raise_application_error(-20001, v_error);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
