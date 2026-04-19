prompt --application/pages/page_00219
begin
wwv_flow_api.create_page(
 p_id=>219
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Consulta Informaci\00F3n Ex\00F3gena')
,p_step_title=>unistr('Consulta Informaci\00F3n Ex\00F3gena')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#APP_IMAGES#xlsx.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function procesarExogena (id){',
'    var popup = apex.widget.waitPopup();',
'    try{',
'        ',
'        apex.server.process("ProcesarInformacion", {',
'           x01: id',
'            ',
'        }).then((resp) => {',
'            popup.remove();',
'            console.log ("Respuesta",resp);',
'            if(resp.o_cdgo_rspsta === 0){',
'                apex.message.showPageSuccess("Procesamiento realizado exitosamente.");',
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
'/*const peticionServerProcess = (proc, json) => {',
'    return apex.server.process(proc, json);',
'}',
'',
'async function procesarExogena (id, type){',
'    let popup = apex.widget.waitPopup();',
'    let contentType = type.split(''.'')',
'    let typeFile = contentType[contentType.length - 1]',
'    console.log(typeFile)',
'    if(typeFile === ''txt''){',
'        let resp = await peticionServerProcess(''ProcesarInformacion'', {x01: id});',
'        popup.remove();',
'        console.log ("Respuesta",resp);',
'        if(resp.o_cdgo_rspsta === 0) {',
'            apex.message.showPageSuccess("Procesamiento realizado exitosamente.");',
'            apex.submit( ''PROCESAR'' );',
'        }else {',
'            apex.message.clearErrors();',
'            apex.message.alert( resp.o_mnsje_rspsta );',
'        }',
'    //} else {',
'    //    console.log(''soy un excel'')',
'    }',
'    //let respuesta = await peticionServerProcess();',
'    /*try{',
'        ',
'        apex.server.process("ProcesarInformacion", {',
'           x01: id',
'            ',
'        }).then((resp) => {',
'            popup.remove();',
'            console.log ("Respuesta",resp);',
'            if(resp.o_cdgo_rspsta === 0){',
'                apex.message.showPageSuccess("Procesamiento realizado exitosamente.");',
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
'}*/'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'1223334444'
,p_last_upd_yyyymmddhh24miss=>'20250703102734'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139862163058593601)
,p_plug_name=>unistr('<b>Par\00E1metros de  B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139862543015593605)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
unistr('</h5>Funci\00F3n que permite consultar por identificaci\00F3n o vigencia, la informaci\00F3n ex\00F3gena presentada ante la administraci\00F3n.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(140035328507293217)
,p_plug_name=>unistr('Consulta Informaci\00F3n Ex\00F3gena')
,p_region_name=>'info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_infrmcion_exgna,',
'       a.id_sjto_impsto,',
'       a.id_impsto,',
'       a.file_blob,',
'       a.file_name,',
'       a.file_mimetype,',
'       a.user_dgta,',
'       a.fcha_dgta,',
'       a.user_mdfca,',
'       a.fcha_mdfca,',
'       a.id_exgna_archvo_tpo,',
'       d.nmbre || '' : '' || d.dscrpcion as tpo_archvo, ',
'       a.vgncia,',
unistr('       case when c.cdgo_idntfccion_tpo = ''C'' then ''C\00C9DULA DE CIUDADAN\00CDA'''),
'       else',
unistr('                case when c.cdgo_idntfccion_tpo = ''N'' then ''N\00DAMERO DE IDENTIFICACI\00D3N TRIBUTARIA'''),
'                else    ',
unistr('                    case when c.cdgo_idntfccion_tpo = ''E'' then ''C\00C9DULA DE EXTRANJERIA'''),
'                    else',
'                        case when c.cdgo_idntfccion_tpo = ''P'' then ''PASAPORTES''',
'                        else',
'                            ''OTROS''',
'                        end',
'                    end',
'                end         ',
'       end as idntfccion_tpo,',
'       b.idntfccion_sjto as idntfccion,',
'       c.nmbre_rzon_scial,',
'       1 DESCARGAR,',
'       case ',
'       when a.indcdor_prcsdo = ''N'' then',
'           ''<a onclick="javascript:procesarExogena(''||a.id_infrmcion_exgna||'')"                        title="Procesar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot"><span aria-hidden="true" class="t-Icon fa fa-gears"></span></a>''',
'         --''<a onclick="javascript:procesarExogena(''||a.id_infrmcion_exgna||'','''' ''||a.file_name||'''''')" title="Procesar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot"><span aria-hidden="true" class="t-Icon fa fa-gears"></span></a>''',
'       else',
'           null',
'       end PROCESAR,',
'       a.mnsje_error,',
unistr('       decode(a.indcdr_crrccion, ''S'', ''S\00ED'', ''No'') indcdr_crrccion,       '),
unistr('       decode(a.indcdor_extmprneo, ''S'', ''S\00ED'', ''No'') indcdor_extmprneo,'),
'       e.nmbre_impsto',
'  from gi_g_informacion_exogena     a',
'  join v_si_i_sujetos_impuesto      b on a.id_sjto_impsto       = b.id_sjto_impsto',
'  left join v_si_i_personas         c on a.id_sjto_impsto       = c.id_sjto_impsto',
'  join df_i_exogena_archivo_tipo    d on a.id_exgna_archvo_tpo  = d.id_exgna_archvo_tpo',
'  join df_c_impuestos               e on a.id_impsto            = e.id_impsto',
' where a.cdgo_clnte  =  :F_CDGO_CLNTE',
'   and a.actvo = ''S''',
'   and case',
'            when a.vgncia is null and :P219_VGNCIA is null then 1',
'            when a.vgncia =  nvl(:P219_VGNCIA, a.vgncia)   then 1',
'            else 0                    ',
'       end                =    1     ',
'   and case',
'            when b.idntfccion_sjto is null and :P219_IDNTFCCION is null   then 1',
'            when b.idntfccion_sjto =  nvl(:P219_IDNTFCCION, b.idntfccion_sjto) then 1',
'            else 0                    ',
'       end                =    1',
' order by a.id_infrmcion_exgna desc;'))
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
 p_id=>wwv_flow_api.id(9877450225919721)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>9877450225919721
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(186979216346307604)
,p_db_column_name=>'ID_INFRMCION_EXGNA'
,p_display_order=>10
,p_column_identifier=>'V'
,p_column_label=>unistr('Id Informaci\00F3n Ex\00F3gena')
,p_column_link=>'f?p=&APP_ID.:223:&SESSION.::&DEBUG.:RP,223:P223_ID_INFRMCION_EXGNA:#ID_INFRMCION_EXGNA#'
,p_column_linktext=>'#ID_INFRMCION_EXGNA#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9877641474919723)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9877784333919724)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(186979310318307605)
,p_db_column_name=>'ID_EXGNA_ARCHVO_TPO'
,p_display_order=>50
,p_column_identifier=>'W'
,p_column_label=>'Id Exgna Archvo Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9878632129919733)
,p_db_column_name=>'TPO_ARCHVO'
,p_display_order=>60
,p_column_identifier=>'L'
,p_column_label=>'Tipo Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142454588989745401)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>70
,p_column_identifier=>'R'
,p_column_label=>'File Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9877949784919726)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>'Nombre Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9878021174919727)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>90
,p_column_identifier=>'F'
,p_column_label=>'File Mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9878142832919728)
,p_db_column_name=>'USER_DGTA'
,p_display_order=>100
,p_column_identifier=>'G'
,p_column_label=>'User Dgta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9878217537919729)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>110
,p_column_identifier=>'H'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9878343158919730)
,p_db_column_name=>'USER_MDFCA'
,p_display_order=>120
,p_column_identifier=>'I'
,p_column_label=>'User Mdfca'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9878457998919731)
,p_db_column_name=>'FCHA_MDFCA'
,p_display_order=>130
,p_column_identifier=>'J'
,p_column_label=>unistr('Fecha de Actualizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9877857527919725)
,p_db_column_name=>'VGNCIA'
,p_display_order=>140
,p_column_identifier=>'D'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(186980504688307617)
,p_db_column_name=>'IDNTFCCION_TPO'
,p_display_order=>150
,p_column_identifier=>'X'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9878726794919734)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>160
,p_column_identifier=>'M'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(186980678281307618)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>170
,p_column_identifier=>'Y'
,p_column_label=>unistr('Nombre \00F3 Raz\00F3n Social')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9878854190919735)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>180
,p_column_identifier=>'N'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GI_G_INFORMACION_EXOGENA:FILE_BLOB:ID_INFRMCION_EXGNA::FILE_MIMETYPE:FILE_NAME:::attachment:<i class="fa fa-download" aria-hidden="true"></i>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(142434036060034223)
,p_db_column_name=>'PROCESAR'
,p_display_order=>190
,p_column_identifier=>'U'
,p_column_label=>'Procesar'
,p_column_link=>'f?p=&APP_ID.:219:&SESSION.::&DEBUG.:RP:P219_ID_INFRMCION_EXGNA:#ID_INFRMCION_EXGNA#'
,p_column_linktext=>'&PROCESAR.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17254945338081301)
,p_db_column_name=>'MNSJE_ERROR'
,p_display_order=>200
,p_column_identifier=>'Z'
,p_column_label=>'Mensaje de Error'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12174460039665122)
,p_db_column_name=>'INDCDR_CRRCCION'
,p_display_order=>210
,p_column_identifier=>'AA'
,p_column_label=>unistr('\00BFCorrecci\00F3n?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12174704089665125)
,p_db_column_name=>'INDCDOR_EXTMPRNEO'
,p_display_order=>220
,p_column_identifier=>'AB'
,p_column_label=>unistr('\00BFExtempor\00E1neo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12175132799665129)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>230
,p_column_identifier=>'AC'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(9947418606030529)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'99475'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ID_INFRMCION_EXGNA:NMBRE_IMPSTO:IDNTFCCION_TPO:IDNTFCCION:NMBRE_RZON_SCIAL:VGNCIA:FILE_NAME:TPO_ARCHVO:FCHA_DGTA:DESCARGAR:INDCDR_CRRCCION:INDCDOR_EXTMPRNEO:'
,p_sort_column_1=>'ID_INFRMCION_EXGNA'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(139862477829593604)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(139862163058593601)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(142432789924034210)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(139862163058593601)
,p_button_name=>'Procesar_Excel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Excel'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9458889322709109)
,p_name=>'P219_VGNCIA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(139862163058593601)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia as d,',
'       vgncia as r',
'  from df_s_vigencias',
' where vgncia > 2018',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'45%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139862214572593602)
,p_name=>'P219_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(139862163058593601)
,p_prompt=>'NIT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139862332260593603)
,p_name=>'P219_TPO_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139862163058593601)
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_idntfccion_tpo  d, cdgo_idntfccion_tpo r',
'  from df_s_identificaciones_tipo',
' where cdgo_idntfccion_tpo in (''N'',''C'',''P'',''E'')'))
,p_lov_display_null=>'YES'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140037338073293237)
,p_name=>'P219_ID_INFRMCION_EXGNA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(139862163058593601)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_INFRMCION_EXGNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141713054140198249)
,p_name=>'P219_FILE_BLOB_TEMP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(139862163058593601)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Archivo:'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>255
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'text/*,text/plain,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.openxmlformats-officedocument.spreadsheetml.sheetspreadsheetml.sheets-officedocument.spreadsheetml.sheet'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141713187962198250)
,p_name=>'P219_CDGO_ARCHVO_TPO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(139862163058593601)
,p_item_default=>'EX'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(140533031536241410)
,p_name=>'Al_procesar_informacion_exogena'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(140533131422241411)
,p_event_id=>wwv_flow_api.id(140533031536241410)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'PROCESAR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(147062120674468519)
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
 p_id=>wwv_flow_api.id(147062211108468520)
,p_event_id=>wwv_flow_api.id(147062120674468519)
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
 p_id=>wwv_flow_api.id(141712555378198244)
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
'     where name = :P219_FILE_BLOB_TEMP;',
'     ',
'    select * ',
'      into v_info_exo',
'      from gi_g_informacion_exogena',
'     where id_infrmcion_exgna = :P219_ID_INFRMCION_EXGNA;',
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
 p_id=>wwv_flow_api.id(141712610874198245)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_NL.AMIS.SCHEFFER.PROCESS.EXCEL2COLLECTION'
,p_process_name=>'Procesar_Excel'
,p_attribute_01=>'P219_FILE_BLOB_TEMP'
,p_attribute_02=>'ETLEXC'
,p_attribute_04=>';'
,p_attribute_05=>'"'
,p_attribute_07=>'N'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(140037836817293242)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ProcesarInformacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta              number;',
'    v_mnsje_rspsta             varchar2(4000);',
'    v_id_infrmcion_exgna       number := APEX_APPLICATION.g_x01;',
'begin',
'    pkg_gi_informacion_exogena.prc_rg_informacion_exogena ( p_cdgo_clnte          => :F_CDGO_CLNTE ',
'                                                          , p_id_infrmcion_exgna  => v_id_infrmcion_exgna',
'                                                          , p_id_usrio            => :F_ID_USRIO',
'                                                          , o_cdgo_rspsta         => v_cdgo_rspsta',
'                                                          , o_mnsje_rspsta        => v_mnsje_rspsta );',
'                                                          ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'',v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'',v_mnsje_rspsta);',
'    apex_json.close_all();',
'exception ',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 99 );',
'        apex_json.write(''o_mnsje_rspsta'', ''Error al procesar archivo.''||sqlerrm);',
'        apex_json.close_all();',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
