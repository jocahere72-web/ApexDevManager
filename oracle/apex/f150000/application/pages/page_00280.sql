prompt --application/pages/page_00280
begin
wwv_flow_api.create_page(
 p_id=>280
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Validacion Paz y Salvo'
,p_step_title=>'Validacion Paz y Salvo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'    ocultarAyudaD();',
'     //alert("ocultarAyudaD");',
'    //apex.item( "informacion_basica" ).hide(); ',
'    ',
'});',
'',
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    if($v(''P205_RSPSTA'') == ''0'' ){',
'        alert("se va a esconder porque no existe");',
'        apex.item( "informacion_basica" ).hide(); ',
'        ',
'   }',
'    if($v(''P205_RSPSTA'') == ''1'' ){',
'        alert("se va a mostrar porque no existe");',
'        apex.item( "informacion_basica" ).show(); ',
'   }',
'    ',
'});',
'',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(252165693921651362)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250313072304'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(551067057981294058)
,p_plug_name=>'Validar Paz y Salvo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(128368565280276430)
,p_plug_name=>unistr('Informaci\00F3n b\00E1sica')
,p_region_name=>'informacion_basica'
,p_parent_plug_id=>wwv_flow_api.id(551067057981294058)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_paz_y_salvo',
'where cnsctvo = :P280_NMRO_PAZYSALVO',
'    and id_plntlla = :P280_PLANTILLA'))
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(128445551717858101)
,p_plug_name=>'Responsables'
,p_parent_plug_id=>wwv_flow_api.id(128368565280276430)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.idntfccion_rspnsble  ',
'    , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio) ubicacion',
'    , a.drccion',
'    , a.cdgo_sjto_tpo',
'    , nmbre_rzon_scial ',
' from v_si_i_sujetos_impuesto    a',
' join v_si_i_sujetos_responsable   b on a.id_sjto_impsto = b.id_sjto_impsto',
'where a.id_sjto_impsto           = :P280_ID_SJTO_IMPSTO  ',
'',
'union',
'',
'select a.idntfccion_sjto_frmtda',
'    , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio) ubicacion',
'    , a.drccion',
'    , a.cdgo_sjto_tpo',
'    , nmbre_rzon_scial ',
' from v_si_i_sujetos_impuesto    a',
' join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'where a.id_sjto_impsto           = :P280_ID_SJTO_IMPSTO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from v_si_i_sujetos_impuesto    a',
' join v_si_i_sujetos_responsable   b on a.id_sjto_impsto = b.id_sjto_impsto',
'where a.id_sjto_impsto           = :P280_ID_SJTO_IMPSTO  ',
'',
'union',
'',
'select 1',
' from v_si_i_sujetos_impuesto    a',
' join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'where a.id_sjto_impsto           = :P280_ID_SJTO_IMPSTO;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(128445977315858105)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(128446026608858106)
,p_name=>'CDGO_SJTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_SJTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(128446129524858107)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre / Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(128446206086858108)
,p_name=>'UBICACION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBICACION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Ubicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>152
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(128446360181858109)
,p_name=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(128445681117858102)
,p_internal_uid=>128445681117858102
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(128451190726865729)
,p_interactive_grid_id=>wwv_flow_api.id(128445681117858102)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(128451291967865772)
,p_report_id=>wwv_flow_api.id(128451190726865729)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(128452584459865881)
,p_view_id=>wwv_flow_api.id(128451291967865772)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(128445977315858105)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(128453011863865884)
,p_view_id=>wwv_flow_api.id(128451291967865772)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(128446026608858106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(128453522505865887)
,p_view_id=>wwv_flow_api.id(128451291967865772)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(128446129524858107)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(128455543073884394)
,p_view_id=>wwv_flow_api.id(128451291967865772)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(128446206086858108)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(128463442042410548)
,p_view_id=>wwv_flow_api.id(128451291967865772)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(128446360181858109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(194412678853445491)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_api.id(551067057981294058)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(194412286344445480)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(551067057981294058)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,205,206::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(128482241966234454)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(128368565280276430)
,p_button_name=>'BTN_VER_PAZ_SALVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Ver Paz y Salvo'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP:P18_NOMBRE_TABLA,P18_COLUMNA_CLAVE_PRIMARIA,P18_COLUMNA_FILENAME,P18_COLUMNA_BLOB,P18_COLUMNA_MIME,P18_VALOR:V_GN_G_ACTOS,ID_ACTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P280_ID_ACTO.'
,p_button_condition=>'P280_ID_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128367947689276424)
,p_name=>'P280_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128368095784276425)
,p_name=>'P280_NMBRE_RZON_SCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_prompt=>unistr('Nombre / Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128368193228276426)
,p_name=>'P280_UBCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128368259906276427)
,p_name=>'P280_DRCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128368340517276428)
,p_name=>'P280_CDGO_SJTO_TPO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128369465894276439)
,p_name=>'P280_FCHA_PZ_SLVO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_prompt=>unistr('Fecha generaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128369585849276440)
,p_name=>'P280_NMRO_CTROL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_prompt=>unistr('N\00FAmero de Control')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128369676538276441)
,p_name=>'P280_INDCDOR_ACTVO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_prompt=>unistr('\00BFActivo?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(252387114161917710)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128369803207276443)
,p_name=>'P280_USRIO_DGTA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_prompt=>unistr('Elabor\00F3')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_trcro, user_name',
'from v_sg_g_usuarios  '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128370009068276445)
,p_name=>'P280_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_prompt=>'Sub Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto, id_impsto_sbmpsto ',
'from df_i_impuestos_subimpuesto;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128472503901988305)
,p_name=>'P280_ID_ACTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128542697136000441)
,p_name=>'P280_PLANTILLA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(551067057981294058)
,p_prompt=>'<b>Tipo Paz y Salvo</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion  as d',
'     , id_plntlla as r      ',
'  from gn_d_plantillas',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_rprte in (',
'                     select id_rprte ',
'                       from gn_d_reportes  a',
'                      where cdgo_rprte_grpo = ''PYZ'')',
'order by 1                      '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(194413012571445491)
,p_name=>'P280_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(128368565280276430)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo asociado al acuerdo de pago.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(194413909671445498)
,p_name=>'P280_CDGO_SJTO_TPO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(551067057981294058)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(194414339814445498)
,p_name=>'P280_ID_SJTO_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(551067057981294058)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(194415620421445501)
,p_name=>'P280_NMRO_PAZYSALVO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(551067057981294058)
,p_prompt=>unistr('<b>N\00FAmero de Paz y Salvo</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(194416065158445501)
,p_name=>'P280_RSPSTA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(551067057981294058)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(194419622357445551)
,p_computation_sequence=>10
,p_computation_item=>'P280_CDGO_SJTO_TPO_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_sjto_tpo',
'  from df_c_impuestos    a',
' where a.cdgo_clnte      = :F_CDGO_CLNTE',
'   and a.id_impsto       = :P280_ID_IMPSTO'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(194421859938445566)
,p_name=>unistr('Al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(194412678853445491)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128542724782000442)
,p_event_id=>wwv_flow_api.id(194421859938445566)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(194422345780445573)
,p_event_id=>wwv_flow_api.id(194421859938445566)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        number;  ',
'begin',
'    begin ',
'    ',
'        select a.id_sjto_impsto ',
'        into v_id_sjto_impsto',
'        from gf_g_paz_y_salvo a join si_i_sujetos_impuesto b on b.id_sjto_impsto = a.id_sjto_impsto',
'        where a.cnsctvo = :P280_NMRO_PAZYSALVO',
'            and a.id_plntlla = :P280_PLANTILLA;',
'            --and a.id_impsto = :P280_ID_IMPSTO_C',
'            --and a.id_impsto_sbmpsto = :P280_ID_IMPSTO_SBMPSTO_C;',
' ',
'        apex_util.set_session_state(''P280_RSPSTA'', ''1'');',
'        apex_util.set_session_state(''P280_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
' ',
'    exception',
'        when no_data_found then ',
'        :P280_RSPSTA                := ''9'';',
'        :P280_ID_SJTO_IMPSTO        := null;',
'        apex_util.set_session_state(''P280_RSPSTA'', ''0'');',
'        apex_util.set_session_state(''P280_ID_SJTO_IMPSTO'', null);',
'',
'        when others then ',
'            apex_util.set_session_state(''P280_RSPSTA'', ''0'');',
'            apex_util.set_session_state(''P280_ID_SJTO_IMPSTO'', null);',
'    end;',
'end;'))
,p_attribute_02=>'P280_NMRO_PAZYSALVO'
,p_attribute_03=>'P280_ID_SJTO_IMPSTO,P280_RSPSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(194422894867445574)
,p_event_id=>wwv_flow_api.id(194421859938445566)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P280_RSPSTA'') == ''1'' ){',
'    // Si existe el sujeto impuesto',
'    // Muestra la region ',
'    var element = document.getElementById("informacion_basica");',
'    element.style.display = "block";        ',
'    apex.submit();',
'}',
'else if  ($v(''P280_RSPSTA'') == ''0'' ){',
'    // No existe el sujeto impuesto',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >VALIDACION PAZ Y SALVO</H2>'',',
'        html: ''<H4>El paz y salvo NO existe.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica '),
'    //alert("Oculta");',
'    //apex.item( "informacion_basica" ).hide();',
'',
'    // oculta la region cuando no existe',
'    var element = document.getElementById("informacion_basica");',
'    element.style.display = "none";    ',
'}',
'',
'else if  ($v(''P280_RSPSTA'') == ''2'' ){    ',
'    // Exite el Sujeto Impuesto pero no tiene acuerdo de pagos aplicados',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >VALIDACION PAZ Y SALVO</H2>'',',
'        html: ''<H4>El paz y salvo NO existe.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica, convenio y cuotas'),
'    apex.item( "informacion_basica" ).hide(); ',
'}',
'else if  ($v(''P280_RSPSTA'') == ''3'' ){    ',
'    // El Acuerdo de Pago consultado no Existe',
'    Swal.fire({',
'        icon: ''error'',',
'         title:  ''<H2 >VALIDACION PAZ Y SALVO</H2>'',',
'        html: ''<H4>El paz y salvo NO existe.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica, convenio y cuotas'),
'    apex.item( "informacion_basica" ).hide(); ',
'}',
';',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(194423233026445575)
,p_name=>unistr('Refrescar P\00E1gina ')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P280_ID_SJTO_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(194423710153445576)
,p_event_id=>wwv_flow_api.id(194423233026445575)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P280_ID_SJTO_IMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(194420275698445563)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select a.id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto    a',
'      join si_i_predios               b on a.id_sjto_impsto    = b.id_sjto_impsto',
'     where cdgo_clnte                 = :F_CDGO_CLNTE',
'       and id_impsto                  = :P280_ID_IMPSTO',
'       and (',
'               (:P280_TPO_BSQDA       = ''REF'' and a.idntfccion_sjto     = :P280_PRMTRO) or',
'               (:P280_TPO_BSQDA       = ''RAN'' and a.idntfccion_antrior  = :P280_PRMTRO) or',
'               (:P280_TPO_BSQDA       = ''DIR'' and a.drccion             = :P280_PRMTRO) or',
'               (:P280_TPO_BSQDA       = ''MTR'' and b.mtrcla_inmblria     = :P280_PRMTRO)',
'            );',
'    ',
'    :P280_RSPSTA := ''1'';',
'    :P280_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P280_ID_SJTO_IMPSTO := null;',
'     :P280_RSPSTA := ''0'';',
'     --:P280_RSPSTA := '' No Existe el Sujeto Impuesto'' ;',
'end;'))
,p_process_error_message=>'&P280_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P280_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(194420611003445564)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P280_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P280_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(194412678853445491)
,p_process_when=>':P280_ID_SJTO_IMPSTO IS NULL or :P280_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P280_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(128369320391276438)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Paz y Salvo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        select fcha_pz_slvo ',
'               ,nmro_ctrol',
'               ,indcdor_actvo',
'               ,usrio_dgta',
'               ,id_impsto',
'               ,id_impsto_sbmpsto',
'               ,id_acto',
'              -- ,id_sjto_impsto',
'        into   :P280_FCHA_PZ_SLVO ',
'               ,:P280_NMRO_CTROL',
'               ,:P280_INDCDOR_ACTVO',
'               ,:P280_USRIO_DGTA',
'               ,:P280_ID_IMPSTO',
'               ,:P280_ID_IMPSTO_SBMPSTO',
'               ,:P280_ID_ACTO',
'             --  ,:P280_ID_SJTO_IMPSTO',
'        from gf_g_paz_y_salvo',
'        where cnsctvo = :P280_NMRO_PAZYSALVO',
'            and id_plntlla = :P280_PLANTILLA; ',
'      ',
'exception',
'    when others then',
'        :P280_FCHA_PZ_SLVO          := null;',
'        :P280_NMRO_CTROL            := null;',
'        :P280_INDCDOR_ACTVO         := null;',
'        :P280_USRIO_DGTA            := null;',
'        :P280_ID_IMPSTO             := null;',
'        :P280_ID_IMPSTO_SBMPSTO     := null;',
'        :P280_ID_ACTO               := null;',
'       -- :P280_ID_SJTO_IMPSTO        := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P280_NMRO_PAZYSALVO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(194421055251445564)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' ',
'    if :P280_CDGO_SJTO_TPO_IMPSTO = ''E'' then',
'       select a.idntfccion_sjto_frmtda',
'            , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'            , a.drccion',
'            , a.cdgo_sjto_tpo',
'            , nmbre_rzon_scial',
'         into :P280_IDNTFCCION_SJTO_FRMTDA',
'            , :P280_UBCCION',
'            , :P280_DRCCION',
'            , :P280_CDGO_SJTO_TPO',
'            , :P280_NMBRE_RZON_SCIAL  ',
'         from v_si_i_sujetos_impuesto    a',
'         join si_i_personas              b on a.id_sjto_impsto = b.id_sjto_impsto',
'        where a.id_sjto_impsto           = :P280_ID_SJTO_IMPSTO;',
'     elsif :P280_CDGO_SJTO_TPO_IMPSTO in (''P'',''V'') then',
'         select b.idntfccion_rspnsble  ',
'            , upper(a.nmbre_pais || '' '' || a.nmbre_dprtmnto || '' '' || a.nmbre_mncpio)',
'            , a.drccion',
'            , a.cdgo_sjto_tpo',
'            , b.nmbre_rzon_scial',
'         into :P280_IDNTFCCION_SJTO_FRMTDA',
'            , :P280_UBCCION',
'            , :P280_DRCCION',
'            , :P280_CDGO_SJTO_TPO',
'            , :P280_NMBRE_RZON_SCIAL  ',
'         from v_si_i_sujetos_impuesto    a',
'         join v_si_i_sujetos_responsable   b on a.id_sjto_impsto = b.id_sjto_impsto',
'        where a.id_sjto_impsto           = :P280_ID_SJTO_IMPSTO ',
'             and b.prncpal_s_n = ''S''',
'             and b.actvo = ''S'' ;   --and rownum =1;',
'      end if;',
'      ',
'exception',
'    when others then',
'        :P280_IDNTFCCION_SJTO_FRMTDA       := null;',
'        :P280_IDNTFCCION_ANTRIOR_FRMTDA    := null;',
'        :P280_UBCCION                      := null;',
'        :P280_DRCCION                      := null;',
'        :P280_CDGO_SJTO_TPO                := null;',
'        :P280_MTRCLA_INMBLRIA              := null;',
'        :P280_ID_SJTO_IMPSTO               := null;',
'        :P280_NMBRE_RZON_SCIAL            := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P280_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
