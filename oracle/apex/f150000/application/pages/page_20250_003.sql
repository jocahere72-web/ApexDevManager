prompt --application/pages/page_20250_003
begin
wwv_flow_api.create_page(
 p_id=>2025012
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Registro Sujeto-Responsable'
,p_step_title=>'Registro Sujeto-Responsable'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'$(document).ready(() => {',
'    ',
'    if($v( "P56_SJTO_IMPSTO" ) === ''''){',
'        apex.item(''SR_rspnsble_tab'').hide();',
'    }else if ( $v( "P56_TPO_PRSNA_OCULTO" ) === ''N''){',
'        apex.item(''SR_rspnsble_tab'').hide();',
'    }',
'});',
'*/',
'',
''))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250916094751'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4917389081529744)
,p_plug_name=>'Responsables'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4917465529529745)
,p_plug_name=>'Consulta Responsables'
,p_parent_plug_id=>wwv_flow_api.id(4917389081529744)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    id_sjto_rspnsble, ',
'    dscrpcion_idntfccion_tpo,',
'    idntfccion_rspnsble,',
'    nmbre_rzon_scial, ',
'    prncpal_s_n, ',
'    dscrpcion_rspnsble_tpo, ',
'    case ',
unistr('        when actvo = ''S'' then ''S\00ED'''),
'        else ''No''',
unistr('    end as "\00BFActivo?",'),
'    case ',
unistr('        when prncpal_s_n = ''S'' then ''S\00ED'''),
'        else ''No''',
unistr('    end as "\00BFPrincipal?"'),
'from ',
'    v_si_i_sujetos_responsable',
'where ',
'    id_sjto_impsto = :P2025012_ID_SJTO_IMPSTO',
'    order by actvo asc, prncpal_s_n desc;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_sjto_rspnsble, dscrpcion_idntfccion_tpo,',
'idntfccion_rspnsble,nmbre_rzon_scial, prncpal_s_n, dscrpcion_rspnsble_tpo, actvo',
'from v_si_i_sujetos_responsable',
'where id_sjto_impsto = :P2025012_ID_SJTO_IMPSTO',
';'))
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
 p_id=>wwv_flow_api.id(4917598709529746)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'HGOMEZ'
,p_internal_uid=>4917598709529746
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4917659519529747)
,p_db_column_name=>'ID_SJTO_RSPNSBLE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Editar'
,p_column_link=>'f?p=&APP_ID.:2025013:&SESSION.::&DEBUG.:RP,2025013:P2025013_ID_SJTO_RSPNSBLE:#ID_SJTO_RSPNSBLE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4917759285529748)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo de Identificacion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4917861892529749)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Numero de Identificacion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4917987825529750)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre Sujeto Responsable'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5898385579424201)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5898492166424202)
,p_db_column_name=>'DSCRPCION_RSPNSBLE_TPO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo Responsable'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5898778943424205)
,p_db_column_name=>unistr('\00BFActivo?')
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5898887928424206)
,p_db_column_name=>unistr('\00BFPrincipal?')
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5907128126443899)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'59072'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('ID_SJTO_RSPNSBLE:DSCRPCION_IDNTFCCION_TPO:IDNTFCCION_RSPNSBLE:NMBRE_RZON_SCIAL:PRNCPAL_S_N:DSCRPCION_RSPNSBLE_TPO:\00BFActivo?:\00BFPrincipal?')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36135331762203593)
,p_plug_name=>'Datos'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(252182344492651399)
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
 p_id=>wwv_flow_api.id(55766667519744708)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104981426756038181)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'Funcionalidad que permite: <br><br>',
'<i>',
'',
unistr('Registrar y modificar Sujeto Impuesto tipo persona \00F3 establecimiento. <br><br>'),
'Registrar y modificar responsables si la naturaleza es Juridica. <br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario. <br><br>'),
'',
'',
'',
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21863588409045728)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(55766667519744708)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2025010:&SESSION.::&DEBUG.:RP:P2025010_ID_SJTO_IMPSTO:&P2025012_ID_SJTO_IMPSTO.'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21864354741045729)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(55766667519744708)
,p_button_name=>'BTN_AGRGAR_RSPNSBLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Agregar Responsable'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2025011:&SESSION.::&DEBUG.:RP,2025011:P2025011_ID_SJTO_IMPSTO:&P2025012_ID_SJTO_IMPSTO.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4916578377529736)
,p_name=>'P2025012_ID_IMPSTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(36135331762203593)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21841910375045702)
,p_name=>'P2025012_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(36135331762203593)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21842372155045703)
,p_name=>'P2025012_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(36135331762203593)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21844793563045705)
,p_name=>'P2025012_ID_SJTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(36135331762203593)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21845163008045705)
,p_name=>'P2025012_ID_SJTO_RSPNSBLE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(36135331762203593)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5899768462424215)
,p_name=>'Refrescar Region'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4917465529529745)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5899836620424216)
,p_event_id=>wwv_flow_api.id(5899768462424215)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4917465529529745)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5900439196424222)
,p_name=>'Refrescar Pagina'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(55766667519744708)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5900588849424223)
,p_event_id=>wwv_flow_api.id(5900439196424222)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
end;
/
