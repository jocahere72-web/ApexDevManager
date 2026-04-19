prompt --application/pages/page_00388
begin
wwv_flow_api.create_page(
 p_id=>388
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro Titulo'
,p_page_mode=>'MODAL'
,p_step_title=>'Registro Titulo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function fnc_LimpiarItems(){',
'    apex.item("P388_NMRO_TTLO_JDCIAL").setValue("");',
'    apex.item("P388_VLOR").setValue("");',
'    apex.item("P388_CDGO_IDNTFCCION_TPO_DMNDDO").setValue("");',
'    apex.item("P388_IDNTFCCION_DMNDDO").setValue("");',
'    apex.item("P388_NMBRE_DMNDDO").setValue("");',
'    apex.item("P388_NMBRE_DMNDDO_EXTRNO").setValue("");',
'    apex.item("P388_ID_BNCO_RCDDR").setValue("");',
'    apex.item("P388_CNSCTVO_EMBRGO").setValue("");',
'    apex.item("P388_ID_FNCNRIO").setValue("");',
'    apex.item("P388_NMRO_TTLO_JDCIAL").setValue("");   ',
'    apex.item("FCHA_CNSTTCION").setValue("");',
'};',
'',
'function ocultarRegion(){   ',
'               ',
'    apex.item("P388_NMBRE_DMNDDO_EXTRNO").hide();',
'    ',
'    if(apex.item("P388_NMRO_TTLO_PDRE").getValue() === ''''){            ',
'            $x_Hide("fracciones");',
'        }else {',
'            $x_Show("fracciones");',
'        }       ',
'};',
'',
'function jsonTitulos() {',
'    ',
'    var nmbre_dmndado = apex.item("P388_NMBRE_DMNDDO").getValue();',
'    var nmbre_dmndado_ext = apex.item("P388_NMBRE_DMNDDO_EXTRNO").getValue();',
'    var nmbre_json;',
'    ',
'    if (nmbre_dmndado !== "" && nmbre_dmndado_ext === "") {',
'            nmbre_json = nmbre_dmndado;',
'            apex.item("P388_NMBRE_DMNDDO_EXTRNO").setValue("");',
'    }else if(nmbre_dmndado_ext !== "" && nmbre_dmndado === "" ){',
'        nmbre_json = nmbre_dmndado_ext;',
'        apex.item("P388_NMBRE_DMNDDO").setValue("");',
'    }',
'       ',
'',
'        var jsonTitulos = {',
'            "NMRO_TTLO": apex.item("P388_NMRO_TTLO_JDCIAL").getValue(),',
'            "FCHA_CNSTTCION": apex.item("P388_FCHA_CNSTTCION").getValue(),',
'            "VLOR": apex.item("P388_VLOR").getValue(),',
'            "ID_TTLO_JDCIAL_AREA": apex.item("P388_ID_TTLO_JDCIAL_AREA").getValue(),',
'            "CDGO_IDNTFCCION_TPO_DMNDO": apex.item("P388_CDGO_IDNTFCCION_TPO_DMNDDO").getValue(),',
'            "IDNTFCCION_DMNDO": apex.item("P388_IDNTFCCION_DMNDDO").getValue(),',
'            "NMBRE_DMNDO": nmbre_json,',
'            "CNSCTVO_EMBRGO": apex.item("P388_CNSCTVO_EMBRGO").getValue(),',
'            "ID_EMBRGO_RSLCION": apex.item("P388_ID_EMBRGO_RSLCION").getValue(),',
'            "NMRO_TTLO_PDRE": apex.item("P388_NMRO_TTLO_PDRE").getValue(),',
'            "ID_BNCO_CNSGNNTE": apex.item("P388_ID_BNCO_CNSGNNTE").getValue(),',
'            "ID_BNCO_RCDDR": apex.item("P388_ID_BNCO_RCDDR").getValue(),',
'            "IDNTFCCION_DMNDNTE": apex.item("P388_IDNTFCCION_DMNDNTE").getValue(),',
'            "NMBRE_DMNDNTE": apex.item("P388_NMBRE_DMNDNTE").getValue(),',
'            "ID_FNCNRIO": apex.item("P388_ID_FNCNRIO").getValue(),',
'            "ID_USRIO_RGSTRO": apex.item("P388_ID_USRIO_RGSTRO").getValue()',
'        }',
'    ',
'        $s(''P388_JSON_TTLOS'', JSON.stringify(jsonTitulos));',
'        console.log(''Json : '' + JSON.stringify(jsonTitulos));',
'        return JSON.stringify(jsonTitulos);',
'  ',
'}',
'',
'function fnc_editaNombres() {',
'',
'   console.log(''entro a fnc_editaNombres'');',
'    ',
'    var idntfccionDmnddo = apex.item("P388_IDNTFCCION_DMNDDO").getValue();',
'    var cdgoIdntfccionTpoDmnddo = apex.item("P388_CDGO_IDNTFCCION_TPO_DMNDDO").getValue();',
'    var nmro_rgstros = apex.item("P388_NMRO_SUJETOS").getValue();',
'    var nodo = apex.item("P388_NMBRE_DMNDDO").node;',
'    ',
'     console.log(''idntfccionDmnddo ''+idntfccionDmnddo);',
'    console.log(''cdgoIdntfccionTpoDmnddo ''+cdgoIdntfccionTpoDmnddo);',
'    console.log(''nmro_rgstros ''+nmro_rgstros);',
'    console.log(''nodo ''+nodo);',
'',
'    if (idntfccionDmnddo !== "" && cdgoIdntfccionTpoDmnddo !== "" && nmro_rgstros > 0) {',
'        console.log(''entro a if'');',
'        apex.item("P388_NMBRE_DMNDDO_EXTRNO").hide();',
'        apex.item("P388_NMBRE_DMNDDO").show();',
'    }else if (idntfccionDmnddo !== "" && cdgoIdntfccionTpoDmnddo !== "" && nmro_rgstros === 0){',
'        console.log(''entro a else'');',
'        apex.item("P388_NMBRE_DMNDDO_EXTRNO").show();',
'        apex.item("P388_NMBRE_DMNDDO").hide();',
'    }',
'}',
'',
'function validarDatos(){',
'    if (apex.item("P388_NMRO_TTLO_JDCIAL").getValue() ===""){',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "No. T\00EDtulo no puede ser nulo.",'),
'            unsafe: false',
'        }]);',
'    }else if (apex.item("P388_FCHA_CNSTTCION").getValue() ===""){',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "La fecha del T\00EDtulo no puede debe estar vac\00EDa.",'),
'            unsafe: false',
'        }]);',
'    }else if (apex.item("P388_VLOR").getValue() ===""){',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "El valor del T\00EDtulo no puede debe estar vac\00EDo.",'),
'            unsafe: false',
'        }]);',
'    }else if (apex.item("P388_ID_TTLO_JDCIAL_AREA").getValue() ===""){',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "El valor del T\00EDtulo no puede debe estar vac\00EDo.",'),
'            unsafe: false',
'        }]);',
'    }else if (apex.item("P388_CDGO_IDNTFCCION_TPO_DMNDDO").getValue() ===""){',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "Verifique el tipo de identificaci\00F3n.",'),
'            unsafe: false',
'        }]);',
'    }else if (apex.item("P388_IDNTFCCION_DMNDDO").getValue() ===""){',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "No se digit\00F3 una identificaci\00F3n v\00E1lida.",'),
'            unsafe: false',
'        }]);',
'    }else if (apex.item("P388_ID_TTLO_JDCIAL_AREA").getValue() ===""){',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "El valor del T\00EDtulo no puede debe estar vac\00EDo.",'),
'            unsafe: false',
'        }]);',
'    }else{',
'        return ''S'';',
'    }',
'}',
'',
''))
,p_javascript_code_onload=>'ocultarRegion();'
,p_step_template=>wwv_flow_api.id(177318053164050589)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_width=>'70%'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20260225214114'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(246689753892550553)
,p_plug_name=>unistr('<b>T\00EDtulo No. </b>&P388_NMRO_TTLO_JDCIAL.')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GF_G_TITULOS_JUDICIAL'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22073408745349514)
,p_plug_name=>unistr('<b>T\00EDtulos Fraccionados</b>')
,p_region_name=>'fracciones'
,p_parent_plug_id=>wwv_flow_api.id(246689753892550553)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 	a.idntfccion_dmnddo, ',
'		a.nmbre_dmnddo, ',
'		b.id_ttlo_jdcial_frccn, ',
'		b.id_ttlo_jdcial, ',
'		b.id_impsto, ',
'		(select nmbre_impsto from df_c_impuestos where id_impsto = b.id_impsto) nmbre_impsto,',
'		b.id_impsto_sbmpsto, ',
'        (select nmbre_impsto_sbmpsto from df_i_impuestos_subimpuesto where id_impsto_sbmpsto = b.id_impsto_sbmpsto)  nmbre_impsto_sbmpsto,',
'		b.orden, ',
'		b.vlor, ',
'		b.obsrvcn',
'from gf_g_titulos_judicial a join gf_g_titulos_jdcl_frccnmnto b on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'where nmro_ttlo_jdcial = :P388_NMRO_TTLO_PDRE;',
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
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(22074732976349527)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>22074732976349527
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22074894224349528)
,p_db_column_name=>'IDNTFCCION_DMNDDO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n Demandado')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22074936724349529)
,p_db_column_name=>'NMBRE_DMNDDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nombre Demandado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22075069044349530)
,p_db_column_name=>'ID_TTLO_JDCIAL_FRCCN'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Ttlo Jdcial Frccn'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22075164269349531)
,p_db_column_name=>'ID_TTLO_JDCIAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Ttlo Jdcial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22075286200349532)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tributo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22075382289349533)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Sub Tributo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22075498947349534)
,p_db_column_name=>'ORDEN'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22075506814349535)
,p_db_column_name=>'VLOR'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22075627177349536)
,p_db_column_name=>'OBSRVCN'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22075711605349537)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22075892935349538)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Sub Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(22123012195725641)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'221231'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IDNTFCCION_DMNDDO:NMBRE_DMNDDO:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:ORDEN:VLOR:OBSRVCN:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(213216754519658977)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(246689753892550553)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26090191029811201)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(246689753892550553)
,p_button_name=>'BTN_NVO_RGSTRO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Nuevo'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:388:&SESSION.::&DEBUG.:RP,388::'
,p_icon_css_classes=>'fa-clipboard-new'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29409047120156731)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(246689753892550553)
,p_button_name=>'BTN_RGSTRO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28552668433914712)
,p_name=>'P388_ID_USRIO_RGSTRO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_source=>'ID_USRIO_RGSTRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29408994914156730)
,p_name=>'P388_JSON_TTLOS'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29409389108156734)
,p_name=>'P388_NMBRE_DMNDDO_EXTRNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>'<b>Nombre Demandado</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29410080610156741)
,p_name=>'P388_NMRO_SUJETOS'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213217964707658980)
,p_name=>'P388_IDNTFCCION_DMNDNTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_idntfccion',
'  from df_s_clientes',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>unistr('<b>Identificaci\00F3n Demandante</b>')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213218394041658982)
,p_name=>'P388_NMBRE_DMNDNTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_clnte',
'  from df_s_clientes',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'<b>Nombre Demandante</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213218784871658982)
,p_name=>'P388_ID_TTLO_JDCIAL_AREA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>unistr('<b>\00C1rea</b>')
,p_source=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_area as d,',
'       id_area as r',
'  from df_c_areas',
' order by 2 asc'))
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213219122439658982)
,p_name=>'P388_FCHA_CNSTTCION'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>unistr('<b>Fecha Constituci\00F3n</b>')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'FCHA_CNSTTCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'-0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213219588718658982)
,p_name=>'P388_ID_TTLO_JDCIAL'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_source=>'ID_TTLO_JDCIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213219936477658983)
,p_name=>'P388_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213220306097658985)
,p_name=>'P388_ID_TTLO_JDCIAL_CRGDO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_source=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213220738745658985)
,p_name=>'P388_NMRO_TTLO_JDCIAL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>unistr('<b>N\00FAmero T\00EDtulo Judicial</b>')
,p_source=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213221104083658986)
,p_name=>'P388_VLOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>'<b>Valor</b>'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_source=>'VLOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213221535638658986)
,p_name=>'P388_CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>unistr('<b>Tipo Identificaci\00F3n Demandado</b>')
,p_source=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_idntfccion_tpo as d,',
'       cdgo_idntfccion_tpo as r',
'  from df_s_identificaciones_tipo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213221907164658988)
,p_name=>'P388_IDNTFCCION_DMNDDO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>unistr('<b>Identificaci\00F3n Demandado</b>')
,p_source=>'IDNTFCCION_DMNDDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213222349398658989)
,p_name=>'P388_NMBRE_DMNDDO'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>'<b>Nombre Demandado</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select idntfccion_rspnsble || '' - '' || nmbre_rzon_scial as d,',
'       nmbre_rzon_scial as r',
'  from ((select a.idntfccion_rspnsble, a.nmbre_rzon_scial',
'           from v_si_i_sujetos_responsable a',
'          where a.cdgo_idntfccion_tpo = :P388_CDGO_IDNTFCCION_TPO_DMNDDO',
'            and a.idntfccion_rspnsble = :P388_IDNTFCCION_DMNDDO',
'          group by a.idntfccion_rspnsble, a.nmbre_rzon_scial) union all',
'        (select b.idntfccion, b.nmbre_trcro',
'           from v_si_c_terceros b',
'          where b.cdgo_idntfccion_tpo = :P388_CDGO_IDNTFCCION_TPO_DMNDDO',
'            and b.idntfccion = :P388_IDNTFCCION_DMNDDO',
'          group by b.idntfccion, b.nmbre_trcro))',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P388_CDGO_IDNTFCCION_TPO_DMNDDO,P388_IDNTFCCION_DMNDDO'
,p_ajax_items_to_submit=>'P388_CDGO_IDNTFCCION_TPO_DMNDDO,P388_IDNTFCCION_DMNDDO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213222791951658989)
,p_name=>'P388_ID_BNCO_CNSGNNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>'<b>Entidad Consignante</b>'
,p_source=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and cdgo_bnco = 40',
'  order by cdgo_bnco'))
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213223175174658989)
,p_name=>'P388_CDGO_ENTDAD_CNSGNNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_source=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213223507161658989)
,p_name=>'P388_ID_BNCO_RCDDR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>'<b>Entidad Recaudadora</b>'
,p_source=>'ID_BNCO_RCDDR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and rcddor = ''S''',
'  order by cdgo_bnco'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213223959733658990)
,p_name=>'P388_CNSCTVO_EMBRGO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>'<b>Consecutivo Embargo</b>'
,p_source=>'CNSCTVO_EMBRGO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto||'' - ''||to_char(a.fcha_acto,''DD/MM/YYYY'') ||'' - ''||b.nmbre_trcro as d',
'     , a.nmro_acto as r',
'from mc_g_embargos_resolucion a',
'join mc_g_embargos_responsable r on r.id_embrgos_crtra = a.id_embrgos_crtra ',
'join v_sg_g_usuarios b on b.id_fncnrio = a.id_fncnrio',
'where r.idntfccion = :P388_IDNTFCCION_DMNDDO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P388_IDNTFCCION_DMNDDO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213224307190658990)
,p_name=>'P388_NMRO_TTLO_PDRE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>unistr('<b>N\00FAmero T\00EDtulo Judicial Padre</b>')
,p_source=>'NMRO_TTLO_PDRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213224762902658990)
,p_name=>'P388_ID_FNCNRIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_prompt=>'<b>Funcionario</b>'
,p_source=>'ID_FNCNRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_trcro as d, a.id_fncnrio as r',
'  from v_mc_g_embargos_resolucion a',
'  join v_sg_g_usuarios b',
'    on b.id_fncnrio = a.id_fncnrio',
' where b.actvo = ''S''',
'   and b.id_fncnrio != 700012',
' group by b.nmbre_trcro, a.id_fncnrio',
' order by a.id_fncnrio',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213225149647658990)
,p_name=>'P388_ID_TTLO_PDRE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_source=>'ID_TTLO_PDRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213225535055658991)
,p_name=>'P388_CDGO_ENTDAD_RCDDR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_source=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213225980793658995)
,p_name=>'P388_CDGO_TTLO_JDCIAL_ESTDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_default=>'RGS'
,p_source=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213226376034658998)
,p_name=>'P388_ID_EMBRGO_RSLCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_source=>'ID_EMBRGO_RSLCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213226771331658998)
,p_name=>'P388_ID_INSTNCIA_FLJO_PDRE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_source=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213227100228658998)
,p_name=>'P388_ID_INSTNCIA_FLJO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_source=>'ID_INSTNCIA_FLJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213227589777658998)
,p_name=>'P388_ID_SLCTUD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_item_source_plug_id=>wwv_flow_api.id(246689753892550553)
,p_source=>'ID_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(213227980853658999)
,p_name=>'P388_RSPSTA'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(246689753892550553)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(213238158081659011)
,p_computation_sequence=>10
,p_computation_item=>'P388_ID_EMBRGO_RSLCION'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_embrgos_rslcion',
'from mc_g_embargos_resolucion',
'where cnsctvo_embrgo = :P388_CNSCTVO_EMBRGO'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(213236928359659010)
,p_computation_sequence=>40
,p_computation_item=>'P388_CDGO_ENTDAD_CNSGNNTE'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_bnco ',
'  from df_c_bancos a',
' where a.id_bnco = :P388_ID_BNCO_CNSGNNTE'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(213237361639659011)
,p_computation_sequence=>40
,p_computation_item=>'P388_CDGO_ENTDAD_RCDDR'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_bnco ',
'  from df_c_bancos a',
' where a.id_bnco = :P388_ID_BNCO_RCDDR'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(213237700292659011)
,p_computation_sequence=>40
,p_computation_item=>'P388_ID_TTLO_PDRE'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_ttlo_jdcial',
'from gf_g_titulos_judicial',
'where nmro_ttlo_jdcial = :P388_NMRO_TTLO_PDRE'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(213238972614659012)
,p_validation_name=>'Valor solo admite numeros'
,p_validation_sequence=>20
,p_validation=>'P388_VLOR'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('Valor solo admite n\00FAmeros.')
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(213239726514659012)
,p_validation_name=>unistr('Identificaci\00F3n solo admite numeros')
,p_validation_sequence=>30
,p_validation=>'P388_IDNTFCCION_DMNDDO'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('Identificaci\00F3n solo admite n\00FAmeros.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(29409047120156731)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(213240176103659012)
,p_validation_name=>'Titulo padre solo admite numeros'
,p_validation_sequence=>50
,p_validation=>'P388_NMRO_TTLO_PDRE'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('N\00FAmero t\00EDtulo padre solo admite n\00FAmeros.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(29409047120156731)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(213238512915659011)
,p_validation_name=>'Numero titulo solo admite numeros'
,p_validation_sequence=>60
,p_validation=>'P388_NMRO_TTLO_JDCIAL'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('N\00FAmero t\00EDtulo solo admite n\00FAmeros.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(29409047120156731)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(213240538140659013)
,p_validation_name=>'Banco recaudador debe seleccionarse'
,p_validation_sequence=>80
,p_validation=>'P388_ID_BNCO_RCDDR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Banco Recaudador no puede estar vac\00EDo, por favor seleccione un banco.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(29409047120156731)
,p_associated_item=>wwv_flow_api.id(213223507161658989)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(213240929164659013)
,p_validation_name=>unistr('N\00FAmero titulo debe ser unico')
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_ttlo_jdcial',
'from gf_g_titulos_judicial a',
'where a.nmro_ttlo_jdcial = :P388_NMRO_TTLO_JDCIAL'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('N\00FAmero t\00EDtulo judicial ya existe.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(29409047120156731)
,p_associated_item=>wwv_flow_api.id(213220738745658985)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(213243228799659014)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(213216754519658977)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(213243794806659015)
,p_event_id=>wwv_flow_api.id(213243228799659014)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22072436983349504)
,p_name=>'Al Cambiar Numero Titulo Padre'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P388_NMRO_TTLO_PDRE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22074675570349526)
,p_event_id=>wwv_flow_api.id(22072436983349504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P388_NMRO_TTLO_PDRE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
,p_da_action_comment=>'x'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22075920403349539)
,p_event_id=>wwv_flow_api.id(22072436983349504)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(22073408745349514)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22072514147349505)
,p_event_id=>wwv_flow_api.id(22072436983349504)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Buscar_titulo_padre() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("Buscar_titulo_padre", {',
'            pageItems: "#P388_NMRO_TTLO_PDRE"',
'        }).then(function (resp) {',
'            console.log("Entro => "+ resp.o_mnsje_rspsta);',
'            if (resp.o_cdgo_rspsta > 0) {',
'                console.log(resp.o_mnsje_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    resp.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'            }else {',
'                 Object.keys(resp).forEach((f) => {',
'                apex.item(''P388_IDNTFCCION_DMNDDO'').setValue(('''' + resp[f]).trim()); ',
'                $x_Show("fracciones");',
'            });',
'                 ',
'            }',
'           ',
'        }',
'        );',
'',
'',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'Buscar_titulo_padre();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26090227832811202)
,p_name=>'Al dar click BTN_NVO_RGSTRO'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(26090191029811201)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26090342298811203)
,p_event_id=>wwv_flow_api.id(26090227832811202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_LimpiarItems();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29409122392156732)
,p_name=>'Al dar click BTN_RGSTRO'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(29409047120156731)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29409253860156733)
,p_event_id=>wwv_flow_api.id(29409122392156732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('function fnc_guardarT\00EDtulos() {'),
'    try {',
'        ',
'        jsonTitulos();',
'        var nmro_ttlo_jdcial = apex.item("P388_NMRO_TTLO_JDCIAL").getValue();',
'        ',
'        if(validarDatos()===''S''){',
'        ',
'        apex.server.process("registrarTitulos", {',
'            x01: nmro_ttlo_jdcial,',
'            pageItems: "#F_CDGO_CLNTE, #P388_JSON_TTLOS"',
'        }, {',
'            success: function (data) {',
'                ',
'                if (data.o_cdgo_rspsta != 0) {',
'                    console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: "page",',
'                            message: data.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);',
'                } else {',
unistr('                    apex.message.showPageSuccess("T\00EDtulo registrado con \00E9xito.");'),
'                    fnc_LimpiarItems();',
'                 //   apex.submit();',
'                }',
'            }',
'        })',
'    }}',
'    catch (e) {',
'        console.log(e);',
'    }',
'} ',
'',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de registar el t\00EDtulo con estos datos?", function (okPressed) {'),
'    if (okPressed) {',
unistr('        fnc_guardarT\00EDtulos();'),
'    }',
'}); '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29409621885156737)
,p_name=>'al cambiar P388_IDNTFCCION_DMNDDO'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P388_IDNTFCCION_DMNDDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29409752158156738)
,p_event_id=>wwv_flow_api.id(29409621885156737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validarId(){',
'     try {',
'        ',
'        apex.server.process("Buscar_Demandado", {',
'            pageItems: "#P388_CDGO_IDNTFCCION_TPO_DMNDDO, #P388_IDNTFCCION_DMNDDO"',
'        }, {',
'            success: function (data) {                ',
'                if (data.o_cdgo_rspsta != 0) {',
'                    console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                    apex.item("P388_NMBRE_DMNDDO_EXTRNO").show();',
'                    apex.item("P388_NMBRE_DMNDDO").hide();',
'                } else{',
'                    console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                    apex.item("P388_NMBRE_DMNDDO_EXTRNO").hide();',
'                    apex.item("P388_NMBRE_DMNDDO").show();',
'                }',
'            }',
'        })',
'    } catch (e) {',
'        console.log(e);',
'    }',
'}',
'',
'validarId();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17126595601689601)
,p_event_id=>wwv_flow_api.id(29409621885156737)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P388_IDNTFCCION_DMNDDO:= :P388_IDNTFCCION_DMNDDO;'
,p_attribute_02=>'P388_IDNTFCCION_DMNDDO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7410886686682201)
,p_name=>'al cambiar P388_CNSCTVO_EMBRGO'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P388_CNSCTVO_EMBRGO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7410961931682202)
,p_event_id=>wwv_flow_api.id(7410886686682201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select id_embrgos_rslcion',
'    into :P388_ID_EMBRGO_RSLCION',
'    from mc_g_embargos_resolucion',
'   where cnsctvo_embrgo = :P388_CNSCTVO_EMBRGO;',
'exception',
'  when others then',
'    :P388_ID_EMBRGO_RSLCION := null;',
'end;',
''))
,p_attribute_02=>'P388_CNSCTVO_EMBRGO'
,p_attribute_03=>'P388_ID_EMBRGO_RSLCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(28552756429914713)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargarUsuario'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_usrio varchar2(100);',
'begin',
'  v_usrio := :APP_USER;',
'  ',
'  select a.id_usrio',
'  into :P388_ID_USRIO_RGSTRO',
'  from v_sg_g_usuarios a',
' where a.user_name = v_usrio; ',
' exception when others then',
'  :P388_ID_USRIO_RGSTRO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(213242866994659014)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Buscar_Demandado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'  v_cntdad       number;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_exception    exception;',
'begin',
'',
'  v_cdgo_rspsta  := 0;',
'  v_mnsje_rspsta := ''OK'';',
'',
'  select count(*)',
'    into :P388_NMRO_SUJETOS',
'    from (select a.idntfccion_rspnsble, a.nmbre_rzon_scial',
'            from v_si_i_sujetos_responsable a',
'           where a.cdgo_idntfccion_tpo = :P388_CDGO_IDNTFCCION_TPO_DMNDDO',
'             and a.idntfccion_rspnsble = :P388_IDNTFCCION_DMNDDO',
'          union all',
'          select b.idntfccion, b.nmbre_trcro',
'            from v_si_c_terceros b',
'           where b.cdgo_idntfccion_tpo = :P388_CDGO_IDNTFCCION_TPO_DMNDDO',
'             and b.idntfccion = :P388_IDNTFCCION_DMNDDO);',
'',
'  if :P388_NMRO_SUJETOS > 0 then',
'    v_cdgo_rspsta       := 0;   ',
'  else',
'    v_cdgo_rspsta := 1;',
'  end if;',
'  ',
'  apex_util.set_session_state(''P388_IDNTFCCION_DMNDDO'', :P388_IDNTFCCION_DMNDDO);',
'  ',
'',
'  if v_cdgo_rspsta > 0 then',
'      :P388_NMRO_SUJETOS := 0;',
'      raise v_exception;',
'  end if;',
'',
'  apex_json.open_object;',
'  apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'  apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'  apex_json.close_object;',
'',
'exception',
'  when v_exception then',
'    rollback;',
'    v_mnsje_rspsta := ''No hay responsables'';',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22072745027349507)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Buscar_titulo_padre'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_idntfccion_pdre   gf_g_titulos_judicial.idntfccion_dmnddo%type;',
'    v_nmbre_pdre        gf_g_titulos_judicial.nmbre_dmnddo%type;',
'    v_exception         exception;',
'    v_exception_2       exception;',
'begin',
'       --insert into muerto (v_001,n_001) values (v_idntfccion_pdre,77); commit;',
'    begin',
'       select idntfccion_dmnddo',
'        into v_idntfccion_pdre',
'        from gf_g_titulos_judicial',
'        where nmro_ttlo_jdcial = :P388_NMRO_TTLO_PDRE',
'        group by idntfccion_dmnddo,  nmbre_dmnddo;',
'    exception     ',
'        when no_data_found then',
'             raise v_exception;',
'        when others then',
'              raise v_exception_2;',
'     end;',
' ',
'        apex_json.open_object; ',
'        apex_json.write(''o_cdgo_rspsta'', 0);',
'        apex_json.write(''o_mnsje_rspsta'', ''Ok'');',
'        apex_json.write(''IDNTFCCION_DMNDDO'', v_idntfccion_pdre); ',
'        apex_json.close_all;',
'       ',
'exception ',
'    when v_exception then',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 1);',
'        apex_json.write(''o_mnsje_rspsta'', ''El titulo padre ingresado no existe''); ',
'        apex_json.write(''IDNTFCCION_DMNDDO'', ''''); ',
'        apex_json.close_all;',
'    when v_exception_2 then',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 2);',
unistr('        apex_json.write(''o_mnsje_rspsta'', ''Error al consultar el T\00EDtulo padre'');  '),
'        apex_json.write(''IDNTFCCION_DMNDDO'', '''');   ',
'        apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29410102908156742)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrarTitulos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(4000);',
'    v_accion        varchar2(100);',
'    v_id_ttlo_jdcial number;',
'    v_exception     exception;',
'    v_exste         number;',
'    x01 varchar2(100);',
'begin',
'',
'    v_cdgo_rspsta:= 0;',
'    v_mnsje_rspsta:= ''OK'';   ',
'    ',
'    x01 := apex_application.g_x01;',
'    ',
'    begin',
'        select count(*) into v_exste from gf_g_titulos_judicial where nmro_ttlo_jdcial = x01;',
'    end;',
'    ',
'    if (v_exste =0)then',
'  ',
'        pkg_gf_titulos_judicial.prc_rg_titulos_judiciales(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                          p_json_ttlos     => :P388_JSON_TTLOS,',
'                                                          o_id_ttlo_jdcial => v_id_ttlo_jdcial,',
'                                                          o_cdgo_rspsta    => v_cdgo_rspsta,',
'                                                          o_mnsje_rspsta   => v_mnsje_rspsta);',
'   else',
'     v_cdgo_rspsta := 1;',
unistr('     v_mnsje_rspsta := ''El t\00EDtulo que desea registrar, ya existe. Verifique!!!'';'),
'   end if;  ',
'                                                    ',
'',
'    if v_cdgo_rspsta = 0 then',
'        commit;',
'    else',
'        raise v_exception;     ',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'exception',
'   when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
