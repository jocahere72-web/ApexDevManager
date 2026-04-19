prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Indicadores econ\00F3micos')
,p_step_title=>unistr('Indicadores econ\00F3micos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro que desea eliminar este registro?'';'),
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(29508795346068488)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191202084711'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2739048628918406)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(2749024577086814)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'       <i>',
'           <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>                   ',
'       </i> ',
'   </b>',
'</h5>',
'<br>',
unistr('  <i>Funcionalidad que permite ingresar, consultar, modificar y eliminar los tipos de indicadores econ\00F3micos y su detalle fecha de vigencia y valor correspondiente.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
' </i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95929017425556205)
,p_plug_name=>'Tipos de indicadores'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_indcdor_tpo, ',
'       nmbre_indcdor_tpo ',
'  from df_s_indicadores_tipo ',
' order by cdgo_indcdor_tpo'))
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
 p_id=>wwv_flow_api.id(95929152677556206)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'8'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_textbox=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'NONE'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP:P34_CDGO_INDCDOR_TPO,P34_INDCDOR_CDGO_EDTBLE:#CDGO_INDCDOR_TPO#,N'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AURUETA'
,p_internal_uid=>95929152677556206
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95929262487556207)
,p_db_column_name=>'CDGO_INDCDOR_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Cdgo indcdor tpo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95929332108556208)
,p_db_column_name=>'NMBRE_INDCDOR_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo de indicador'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(95957577584776717)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'959576'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_INDCDOR_TPO:NMBRE_INDCDOR_TPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95947826547738044)
,p_plug_name=>'Tipo de Indicador'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96045422129311061)
,p_plug_name=>unistr('Indicadores Econ\00F3micos')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_INDCDOR_ECNMCO,',
'       CDGO_INDCDOR_TPO,',
'       FCHA_DSDE,',
'       FCHA_HSTA,',
'       VLOR',
'  from DF_S_INDICADORES_ECONOMICO',
' where CDGO_INDCDOR_TPO = :P34_CDGO_INDCDOR_TPO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P34_CDGO_INDCDOR_TPO'
,p_plug_read_only_when_type=>'ITEM_IS_NULL'
,p_plug_read_only_when=>'P34_CDGO_INDCDOR_TPO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95929869125556213)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95929996947556214)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96047167700311120)
,p_name=>'ID_INDCDOR_ECNMCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INDCDOR_ECNMCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96047749803311121)
,p_name=>'CDGO_INDCDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_INDCDOR_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'&P34_CDGO_INDCDOR_TPO.'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96048316751311121)
,p_name=>'FCHA_DSDE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DSDE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Desde'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_format_mask=>'DD/MM/YYYY'
,p_item_attributes=>'onkeydown="return false"'
,p_is_required=>true
,p_max_length=>10
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96048925154311121)
,p_name=>'FCHA_HSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_HSTA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Hasta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_02=>'&FCHA_DSDE.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_format_mask=>'DD/MM/YYYY'
,p_item_attributes=>'onkeydown="return false"'
,p_is_required=>true
,p_max_length=>10
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96049567560311121)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'');"onkeyup="formatNumber(event,{ precision: 2, thousand: ''.'',decimal: '','' });" '
,p_is_required=>true
,p_max_length=>16
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(96045896445311101)
,p_internal_uid=>96045896445311101
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(96046297983311107)
,p_interactive_grid_id=>wwv_flow_api.id(96045896445311101)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(96046374441311109)
,p_report_id=>wwv_flow_api.id(96046297983311107)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8481523065907)
,p_view_id=>wwv_flow_api.id(96046374441311109)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(95929869125556213)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96047564680311120)
,p_view_id=>wwv_flow_api.id(96046374441311109)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(96047167700311120)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96048136579311121)
,p_view_id=>wwv_flow_api.id(96046374441311109)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(96047749803311121)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96048753676311121)
,p_view_id=>wwv_flow_api.id(96046374441311109)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(96048316751311121)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>202
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96049374510311121)
,p_view_id=>wwv_flow_api.id(96046374441311109)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(96048925154311121)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>248
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96049964091311122)
,p_view_id=>wwv_flow_api.id(96046374441311109)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(96049567560311121)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>214
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38261708231958401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2739048628918406)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P34_BRANCH_APP.:&P34_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100808276923628503)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2739048628918406)
,p_button_name=>'BTN_NUEVO_TIPO_INDICADOR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo<br> Tipo Indicador'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP,34:P34_INDCDOR_CDGO_EDTBLE:S'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95948345833738046)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(95947826547738044)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P34_CDGO_INDCDOR_TPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95948524325738047)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(95947826547738044)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95948292610738046)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(95947826547738044)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P34_CDGO_INDCDOR_TPO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95948451846738046)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(95947826547738044)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P34_CDGO_INDCDOR_TPO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95950127951738054)
,p_branch_action=>'f?p=&APP_ID.:34:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23324791588264601)
,p_name=>'P34_CDGO_INDCDOR_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95947826547738044)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('C\00F3digo')
,p_source=>'CDGO_INDCDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>5
,p_cMaxlength=>5
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letraNumero'')"'
,p_colspan=>3
,p_read_only_when=>'P34_CDGO_INDCDOR_TPO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38261808049958402)
,p_name=>'P34_BRANCH_PAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(95947826547738044)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38261962498958403)
,p_name=>'P34_BRANCH_APP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(95947826547738044)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95950855885738084)
,p_name=>'P34_NMBRE_INDCDOR_TPO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95947826547738044)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre'
,p_source=>'NMBRE_INDCDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100808130198628502)
,p_name=>'P34_INDCDOR_CDGO_EDTBLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95947826547738044)
,p_item_default=>'S'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95930263821556217)
,p_tabular_form_region_id=>wwv_flow_api.id(96045422129311061)
,p_validation_name=>'fecha final debe ser mayor o igual que fecha inicial'
,p_validation_sequence=>10
,p_validation=>'to_date(:FCHA_HSTA,''dd/mm/yyyy'') >= to_date(:FCHA_DSDE,''dd/mm/yyyy'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La fecha final (fecha hasta) debe ser mayor que la fecha inicial (fecha desde)'
,p_associated_column=>'FCHA_HSTA'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(44981734730418801)
,p_tabular_form_region_id=>wwv_flow_api.id(96045422129311061)
,p_validation_name=>'Validar Rango de Fechas'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'declare ',
' v_id_indcdor_ecnmco df_s_indicadores_economico.id_indcdor_ecnmco%type;',
'begin     ',
'  ',
'  --Verifica si el rango existe',
'  select id_indcdor_ecnmco',
'    into v_id_indcdor_ecnmco',
'    from df_s_indicadores_economico',
'   where cdgo_indcdor_tpo = :P34_CDGO_INDCDOR_TPO',
'     and (to_date(:FCHA_DSDE,''DD/MM/YYYY'') between  fcha_dsde                         and  fcha_hsta ',
'          or fcha_dsde                     between  to_date(:FCHA_DSDE,''DD/MM/YYYY'')  and  to_date(:FCHA_HSTA,''DD/MM/YYYY''))',
'     and (to_date(:FCHA_HSTA,''DD/MM/YYYY'') between  fcha_dsde                         and  fcha_hsta',
'          or fcha_hsta                     between  to_date(:FCHA_DSDE,''DD/MM/YYYY'')  and  to_date(:FCHA_HSTA,''DD/MM/YYYY''));',
'      ',
'   if( v_id_indcdor_ecnmco = :ID_INDCDOR_ECNMCO) then ',
'       return true;',
'   else',
'       return false;    ',
'   end if;',
'   ',
'exception ',
'     when too_many_rows then ',
'          return false;',
'     when no_data_found then ',
'          return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El rango de fechas ingresado esta incluido en otro rango o abarca un rango de fechas existente.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95929431846556209)
,p_name=>unistr('Al cerrar di\00E1logo')
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95929532060556210)
,p_event_id=>wwv_flow_api.id(95929431846556209)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(95929017425556205)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95951620522738088)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DF_S_INDICADORES_TIPO'
,p_attribute_02=>'DF_S_INDICADORES_TIPO'
,p_attribute_03=>'P34_CDGO_INDCDOR_TPO'
,p_attribute_04=>'CDGO_INDCDOR_TPO'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from DF_S_INDICADORES_TIPO'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95952051018738088)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DF_S_INDICADORES_TIPO'
,p_attribute_02=>'DF_S_INDICADORES_TIPO'
,p_attribute_03=>'P34_CDGO_INDCDOR_TPO'
,p_attribute_04=>'CDGO_INDCDOR_TPO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Se han guardado los cambios.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95952413791738088)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95948451846738046)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95930045862556215)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(96045422129311061)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Indicadores Econ\00F3micos - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138070775414851498)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Calcular d\00EDas h\00E1biles')
,p_process_sql_clob=>'pk_util_calendario.generar_calendario(:F_CDGO_CLNTE, 2018)'
,p_process_error_message=>'ERROR'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BT_CALCULAR_HABILES'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Proceso terminado'
);
end;
/
