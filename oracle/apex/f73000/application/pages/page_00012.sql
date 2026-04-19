prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'Expedientes'
,p_step_title=>'Expedientes'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(76345756650582452)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20191116081138'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10418723064664150)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10905813051783014)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>30
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
'</h5>',
'Funcionalidad permite ingresar, consultar, modificar, eliminar los expedientes y asociar documentos al mismo.',
'',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19797836884191119)
,p_plug_name=>'Expedientes'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35822579257304514)
,p_plug_name=>'Documentos Asociados'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10905921620783015)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(35822579257304514)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(76376636512582469)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_expdnte_dcmnto ',
'     , id_expdnte ',
'     , id_dcmnto ',
'     , id_usrio ',
'     , fcha',
'     , rowid',
'  from gd_g_expedientes_documento',
' where id_expdnte = :P12_ID_EXPDNTE'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from gd_g_expedientes where id_expdnte = :P12_ID_EXPDNTE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10906125857783017)
,p_name=>'ID_EXPDNTE_DCMNTO'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10906208897783018)
,p_name=>'ID_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EXPDNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P12_ID_EXPDNTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10906356003783019)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_dcmnto || '' - '' || file_name',
'     , id_dcmnto ',
'  from gd_g_documentos '))
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10906467908783020)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'F_ID_USRIO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10906572191783021)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'&P12_MAX_DATE.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_item_attributes=>'onkeydown="return false"'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'PLSQL_EXPRESSION'
,p_default_expression=>'to_char(sysdate,''DD/MM/YYYY HH:MI:SS AM'')'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10906631990783022)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10906762549783023)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10907023487783026)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(10906010804783016)
,p_internal_uid=>10906010804783016
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(10941615398229746)
,p_interactive_grid_id=>wwv_flow_api.id(10906010804783016)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10941735677229746)
,p_report_id=>wwv_flow_api.id(10941615398229746)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10942265014229750)
,p_view_id=>wwv_flow_api.id(10941735677229746)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10906125857783017)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10942701829229754)
,p_view_id=>wwv_flow_api.id(10941735677229746)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10906208897783018)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10943226314229759)
,p_view_id=>wwv_flow_api.id(10941735677229746)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10906356003783019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10943752075229760)
,p_view_id=>wwv_flow_api.id(10941735677229746)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10906467908783020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10944147393229762)
,p_view_id=>wwv_flow_api.id(10941735677229746)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10906572191783021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10945558581231248)
,p_view_id=>wwv_flow_api.id(10941735677229746)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(10906631990783022)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10950235915267737)
,p_view_id=>wwv_flow_api.id(10941735677229746)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10907023487783026)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10905784945783013)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(10418723064664150)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10904547061783001)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(10418723064664150)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'select 1 from gd_g_expedientes where id_expdnte = :P12_ID_EXPDNTE'
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10904603060783002)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(10418723064664150)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'select 1 from gd_g_expedientes where id_expdnte = :P12_ID_EXPDNTE'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10907367834783029)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(10418723064664150)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>'Eiminar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea eliminar el registro?'', ''DELETE'')'
,p_button_execute_validations=>'N'
,p_button_condition=>'select 1 from gd_g_expedientes where id_expdnte = :P12_ID_EXPDNTE'
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10591699558326331)
,p_name=>'P12_ID_EXPDNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10592001777326336)
,p_name=>'P12_ID_AREA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00C1rea')
,p_source=>'ID_AREA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_area',
'     , id_area ',
'  from df_c_areas ',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista el \00E1rea a la cual pertenece el expediente.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10592419897326337)
,p_name=>'P12_ID_PRCSO_CLDAD'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proceso de Calidad'
,p_source=>'ID_PRCSO_CLDAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_prcso',
'     , id_prcso ',
'  from df_c_procesos',
'where id_area = :P12_ID_AREA'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P12_ID_AREA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el proceso de calidad al cual pertenece el expediente.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10592873854326337)
,p_name=>'P12_ID_PRCSO_SSTMA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proceso del Sistema'
,p_source=>'ID_PRCSO_SSTMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre',
'     , id_prcso ',
'  from df_s_procesos',
'  where actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el proceso del sistema al cual pertenece el expediente.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10593240212326337)
,p_name=>'P12_ID_SRIE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Serie'
,p_source=>'ID_SRIE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_srie',
'     , id_srie ',
'  from gd_d_series ',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_srie_pdre  is null'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la Serie a la cual corresponde el expediente.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10593650180326337)
,p_name=>'P12_ID_SBSRIE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Subserie'
,p_source=>'ID_SBSRIE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_srie',
'     , id_srie ',
'  from gd_d_series ',
' where cdgo_clnte   = :F_CDGO_CLNTE',
'   and id_srie_pdre = :P12_ID_SRIE'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P12_ID_SRIE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la subserie a la cual corresponde el expediente.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10594079281326343)
,p_name=>'P12_NMRO_EXPDNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00FAmero Expediente')
,p_source=>'NMRO_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>'P12_ID_EXPDNTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Muestra el n\00FAmero de identificaci\00F3n del expediente.')
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10594452325326343)
,p_name=>'P12_NMBRE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre'
,p_source=>'NMBRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el nombre del expediente.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10594828728326344)
,p_name=>'P12_FCHA'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la fecha de registro del documento.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_06=>'2'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10595215860326344)
,p_name=>'P12_ACTVO'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para activar el expediente y "No" para desactivar el expediente.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10904803089783004)
,p_name=>'P12_OBSRVCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>100
,p_cHeight=>5
,p_colspan=>8
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese las observaciones que considere necesarias para complementar la informaci\00F3n del expediente.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10905144106783007)
,p_name=>'P12_CDGO_CLNTE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(19797836884191119)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37000056283072118)
,p_name=>'P12_MAX_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10905921620783015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(37000114120072119)
,p_computation_sequence=>10
,p_computation_item=>'P12_MAX_DATE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation=>'to_char(sysdate, ''YYYYMMDD'') || ''2359'''
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(10907431309783030)
,p_validation_name=>'validar que no existan documentos asociados'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from gd_g_expedientes_documento',
' where id_expdnte = :P12_ID_EXPDNTE'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Se debe borrar todos los documentos asociados'
,p_when_button_pressed=>wwv_flow_api.id(10907367834783029)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10905030424783006)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Automatic Row Processing(DML)'
,p_attribute_02=>'GD_G_EXPEDIENTES'
,p_attribute_03=>'P12_ID_EXPDNTE'
,p_attribute_04=>'ID_EXPDNTE'
,p_attribute_09=>'P12_ID_EXPDNTE'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Proceso realizado de forma exitosa!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10906850625783024)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(10905921620783015)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Documentos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10595616109326361)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Automatic Row Fetch'
,p_attribute_02=>'GD_G_EXPEDIENTES'
,p_attribute_03=>'P12_ID_EXPDNTE'
,p_attribute_04=>'ID_EXPDNTE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'select 1 from gd_g_expedientes where id_expdnte = :P12_ID_EXPDNTE'
,p_process_when_type=>'EXISTS'
);
end;
/
