prompt --application/pages/page_00916
begin
wwv_flow_api.create_page(
 p_id=>916
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>'Gestion de Menus'
,p_step_title=>'Gestion de Menus'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(29900925450317075)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(103270158884132846)
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20211210110445'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2227022782283444)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(144518625569197916)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'<i>',
unistr('<p align="justify">Este funcionalidad le permite dar mantenimiento al Esquema de Men\00FAs de cada una de las aplicaciones que conforman la soluci\00F3n inform\00E1tica.</p>'),
'',
'<p align="justify">',
unistr('Entre las funcionalidades est\00E1n:'),
'<br>',
'',
unistr('<b>1.</b> Un men\00FA pertenecece a una aplicaci\00F3n.'),
'<br><br>',
'',
unistr('<b>2.</b> Un men\00FA posee un destino que puede ser una p\00E1gina o una URL.'),
'<br><br>',
'',
unistr('<b>3.</b> Un men\00FA puede tener un men\00FA padre,  lo que permite la jerarqu\00EDa, o comportamiento en niveles.'),
'<br><br>',
'',
unistr('<b>4.</b> Un men\00FA puede estar sincronizado con una Ruta de Navegaci\00F3n, solo debe seleccionar Mostrar Bradcrum en la pesta\00F1a Par\00E1metros & Visibilidad'),
'<br><br>',
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'</p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(198909873461830159)
,p_plug_name=>'Tab Selector'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(103270260792132846)
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39660910047056219)
,p_plug_name=>'Tributos'
,p_parent_plug_id=>wwv_flow_api.id(198909873461830159)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_mnu_impsto,',
'        id_mnu,',
'        id_impsto,',
'        actvo',
'   from sg_g_menu_impuesto',
'  where id_mnu = :P916_ID_MNU'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P916_ID_MNU'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39661128625056221)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39661245670056222)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39661418022056224)
,p_name=>'ID_MNU_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MNU_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39661518936056225)
,p_name=>'ID_MNU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MNU'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P916_ID_MNU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(39661689514056226)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(103266611170132832)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_api.id(39661739052056227)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(39661004530056220)
,p_internal_uid=>39661004530056220
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
 p_id=>wwv_flow_api.id(45287153267906199)
,p_interactive_grid_id=>wwv_flow_api.id(39661004530056220)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(45287275605906202)
,p_report_id=>wwv_flow_api.id(45287153267906199)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45287706014906223)
,p_view_id=>wwv_flow_api.id(45287275605906202)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(39661128625056221)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45288660663906232)
,p_view_id=>wwv_flow_api.id(45287275605906202)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(39661418022056224)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45289146219906233)
,p_view_id=>wwv_flow_api.id(45287275605906202)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(39661518936056225)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45289679324906235)
,p_view_id=>wwv_flow_api.id(45287275605906202)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(39661689514056226)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(45290167696906236)
,p_view_id=>wwv_flow_api.id(45287275605906202)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(39661739052056227)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(198909718268830158)
,p_plug_name=>unistr('Par\00E1metros & Visibilidad')
,p_parent_plug_id=>wwv_flow_api.id(198909873461830159)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(103270260792132846)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(308969952991677726)
,p_plug_name=>unistr('Men\00FA')
,p_parent_plug_id=>wwv_flow_api.id(198909873461830159)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(103270260792132846)
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(307487800978882730)
,p_plug_name=>unistr('\00C1rbol de Men\00FA')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  case when connect_by_isleaf = 1 then 0 ',
'            when level = 1 then 1 ',
'        else -1 end as status,',
'        level,',
'        nmbre_mnu as title,',
'        case',
'            when level = 1 then ''fa-folder-o''',
'            when connect_by_isleaf = 1 then ''fa-leaf''',
'            else ''fa-folder-o''',
'        end as icon,',
'        id_mnu as value,',
'        nmbre_mnu as tooltip,',
'        case',
'            when level  > 1 then ',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':'' || :APP_PAGE_ID || '':'' || :APP_SESSION || ''::NO::P916_id_mnu,P916_NODO_SELECCIONADO:'' || id_mnu || '','' || id_mnu)  ',
'            else null',
'        end as link',
'from',
'(select id_aplccion + 1000000 id_mnu, nmbre_aplccion nmbre_mnu, null id_mnu_pdre, nmbre_aplccion tooltip, 1 orden, nmro_aplccion, pgna_incio nmro_pgna, null prmtros_cmpo, null prmtros_vlor',
' from v_sg_g_aplicaciones_cliente',
'where cdgo_clnte = :F_CDGO_CLNTE',
'  and id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'  and actvo = ''S''',
' union',
' select id_mnu, nmbre_mnu, id_aplccion + 1000000 id_mnu_pdre, nmbre_mnu tooltip, orden, nmro_aplccion, nmro_pgna, prmtro_cmpo, prmtro_vlor',
' from v_sg_g_menu',
'where cdgo_clnte = :F_CDGO_CLNTE',
'  and id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'  and id_mnu_pdre is null',
' union',
' select id_mnu, nmbre_mnu, id_mnu_pdre, nmbre_mnu tooltip, orden, nmro_aplccion, nmro_pgna, prmtro_cmpo, prmtro_vlor',
' from v_sg_g_menu',
'where cdgo_clnte = :F_CDGO_CLNTE',
' and id_aplccion_grpo = :F_ID_APLCCION_GRPO ',
' and id_mnu_pdre is not null',
')',
'start with id_mnu_pdre is null',
'connect by prior id_mnu = id_mnu_pdre',
'order siblings by orden;'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(103270260792132846)
,p_attribute_02=>'S'
,p_attribute_03=>'P916_NODO_SELECCIONADO'
,p_attribute_04=>'DB'
,p_attribute_08=>'fa'
,p_attribute_10=>'TITLE'
,p_attribute_11=>'LEVEL'
,p_attribute_15=>'STATUS'
,p_attribute_20=>'VALUE'
,p_attribute_22=>'TOOLTIP'
,p_attribute_23=>'LEVEL'
,p_attribute_24=>'LINK'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103379547964291875)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2227022782283444)
,p_button_name=>'BTN_NUEVO_MENU'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo Men\00FA')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:916:&SESSION.::&DEBUG.:RP,916:P916_NODO_SELECCIONADO:&P916_NODO_SELECCIONADO.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103377968759291874)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(198909873461830159)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P916_NODO_SELECCIONADO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103378393344291874)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(198909873461830159)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:916:&SESSION.::&DEBUG.:RP,916:P916_NODO_SELECCIONADO:&P916_NODO_SELECCIONADO.'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103378744310291875)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(198909873461830159)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P916_ID_MNU'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103379191835291875)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(198909873461830159)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''¿Esta seguro de eliminar el Menú?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P916_ID_MNU'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(103389954950291893)
,p_branch_name=>'Go To Page 916'
,p_branch_action=>'f?p=&APP_ID.:916:&SESSION.::&DEBUG.::P916_ID_MNU:&P916_ID_MNU.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103374971010291869)
,p_name=>'P916_PRMTRO_CMPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(198909718268830158)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Par\00E1metros Campos')
,p_source=>'PRMTRO_CMPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la lista de nombres de elementos de la aplicaci\00F3n, separados por una coma, para los cuales desea establecer el estado de la sesi\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103375392640291872)
,p_name=>'P916_PRMTRO_VLOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(198909718268830158)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Par\00E1metros Valor')
,p_source=>'PRMTRO_VLOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ingrese una lista de valores delimitados por comas para los elementos especificados en "Par\00E1metros Campos". Puede especificar valores est\00E1ticos o sintaxis de sustituci\00F3n (por ejemplo, &APP_ITEM_NAME).'),
'<br>',
'Los valores de elementos pasados por "f?p=" en la URL nunca pueden contener dos puntos (:). Los valores de los elementos tampoco pueden contener comas a menos que incluya el valor completo en caracteres de barra diagonal inversa. <br><b>Por ejemplo:<'
||'br></b>',
'\ 1234,56 \',
'<br>',
unistr('Esto es \00FAtil cuando se deben pasar valores decimales donde el car\00E1cter separador decimal NLS es una coma.'),
'',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103375703008291872)
,p_name=>'P916_ACTVO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(198909718268830158)
,p_use_cache_before_default=>'NO'
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Especificar si el men\00FA esta visible.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103376123796291872)
,p_name=>'P916_INDCDOR_VSBLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(198909718268830158)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_source=>'INDCDOR_VSBLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103376502703291872)
,p_name=>'P916_INDCDOR_MSTRAR_BREADCRUM'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(198909718268830158)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_prompt=>unistr('\00BFMostrar Breadcrumb?')
,p_source=>'INDCDOR_MSTRAR_BREADCRUM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Especificar si  la p\00E1gina llamada por este men\00FA mostrar la regi\00F3n de Breadcrum.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'1'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'0'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103376960826291873)
,p_name=>'P916_PGNAS_BREADCRUM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(198909718268830158)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('P\00E1ginas Breadcrumb')
,p_source=>'PGNAS_BREADCRUM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1000
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroComa'')"'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'');"'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la lista de las p\00E1ginas de la aplicaci\00F3n, separados por una coma, para los cuales desea establecer el estado de la sesi\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103379966775291875)
,p_name=>'P916_ID_MNU'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_MNU'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103380760613291876)
,p_name=>'P916_ID_APLCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Aplicaci\00F3n ')
,p_source=>'ID_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_aplccion || '' - '' || nmbre_aplccion nmbre_aplccion,',
'       id_aplccion',
'  from v_sg_g_aplicaciones_cliente ',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Especificar la aplicaci\00F3n a la que pertenece el men\00FA.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103381134661291876)
,p_name=>'P916_NMBRE_MNU'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Men\00FA')
,p_source=>'NMBRE_MNU'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');"'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Especificar el nombre que se visualizar\00E1 para el men\00FA.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103381513319291877)
,p_name=>'P916_DSCRPCION_MNU'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION_MNU'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>255
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');"'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Inrgesar una breve descripci\00F3n del men\00FA.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103381927211291877)
,p_name=>'P916_ID_MNU_PDRE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Men\00FA Padre')
,p_source=>'ID_MNU_PDRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select distinct LPAD(nmbre_mnu,length(nmbre_mnu) + (lvel*2),''.'') nmbre_mnu,',
'        id_mnu',
'  from ( select level lvel,',
'                nmbre_mnu,',
'                id_mnu',
'           from v_sg_g_menu         a',
'          where a.cdgo_clnte        = :F_CDGO_CLNTE',
'            and a.id_aplccion       = :P916_ID_APLCCION',
'            and a.id_aplccion_grpo  = :F_ID_APLCCION_GRPO',
'        start with id_mnu_pdre is null',
'        connect by prior id_mnu = id_mnu_pdre',
'        order siblings by orden',
'        )'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P916_ID_APLCCION'
,p_ajax_items_to_submit=>'P916_ID_APLCCION'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Identifique al padre para este men\00FA. Use este atributo si est\00E1 creando una lista jer\00E1rquica.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'400'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103382360403291877)
,p_name=>'P916_DSTNO_TPO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_prompt=>'Tipo de Destino'
,p_source=>'DSTNO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_dstno_tpo r, ',
'       dstno_tpo d',
'  from sg_d_destinos_tipo',
'order by dscrpcion_dstno_tpo'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione un tipo de destino. El destino puede ser es una p\00E1gina en la aplicaci\00F3n actual o cualquier URL v\00E1lida.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103382764799291877)
,p_name=>'P916_NMRO_PGNA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('# P\00E1gina')
,p_source=>'NMRO_PGNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroComa'')"'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Especificar el n\00FAmero de la p\00E1gina que ser\00E1 invocada desde el men\00FA.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103383109234291877)
,p_name=>'P916_ICONO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_source=>'ICONO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103383546120291878)
,p_name=>'P916_CLEAR_CACHE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('P\00E1ginas a Limpiar')
,p_source=>'CLEAR_CACHE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'');"'
,p_field_template=>wwv_flow_api.id(29996127677317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ingrese los n\00FAmeros de p\00E1gina, separados por comas, para los cuales desea que se borre el estado de sesi\00F3n del usuario. Por ejemplo:'),
'10,11,12.'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103383995809291878)
,p_name=>'P916_ORDEN'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Orden de Men\00FA')
,p_source=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>4
,p_cMaxlength=>4
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ingresar la secuencia de visualizacion de este men\00FA. El orden determina d\00F3nde se muestra este men\00FA en relaci\00F3n de los otros men\00FAs dentro de la aplicaci\00F3n.'),
'<br><br>',
unistr('<b>Nota:</b> Si dos men\00FAs, dentro de la misma aplicaci\00F3n, tienen el mismo valor de orden, entonces se pueden mostrar en un orden diferente al establecido, se recomienda que especifique n\00FAmeros de orden \00FAnicos para cada men\00FA, o al menos para aquellos ')
||unistr('dentro de la misma aplicaci\00F3n.')))
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103384379032291878)
,p_name=>'P916_URL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(308969952991677726)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Url'
,p_source=>'URL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>200
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Especificar la URL que ser\00E1 invocada desde el men\00FA.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103385036631291879)
,p_name=>'P916_NODO_SELECCIONADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(307487800978882730)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103385506006291887)
,p_validation_name=>'# Pagina no nulo'
,p_validation_sequence=>10
,p_validation=>'P916_NMRO_PGNA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar un N\00FAmero de P\00E1gina')
,p_validation_condition=>'P916_DSTNO_TPO'
,p_validation_condition2=>'1'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(103382764799291877)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33091956512912501)
,p_validation_name=>'URL no nulo'
,p_validation_sequence=>20
,p_validation=>'P916_URL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar una URL'
,p_validation_condition=>'P916_DSTNO_TPO'
,p_validation_condition2=>'2'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(103384379032291878)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103387413623291891)
,p_name=>'Al cambiar  TIP_DESTINO a 1'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P916_DSTNO_TPO'
,p_condition_element=>'P916_DSTNO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103387970961291892)
,p_event_id=>wwv_flow_api.id(103387413623291891)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P916_NMRO_PGNA,P916_PRMTRO_CMPO,P916_PRMTRO_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103388469650291892)
,p_event_id=>wwv_flow_api.id(103387413623291891)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P916_URL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103388992082291893)
,p_event_id=>wwv_flow_api.id(103387413623291891)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P916_URL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103389475426291893)
,p_event_id=>wwv_flow_api.id(103387413623291891)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P916_NMRO_PGNA,P916_PRMTRO_CMPO,P916_PRMTRO_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27071935034229904)
,p_name=>'Mostrar Paginas de breadcrum'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P916_INDCDOR_MSTRAR_BREADCRUM'
,p_condition_element=>'P916_INDCDOR_MSTRAR_BREADCRUM'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27072052729229905)
,p_event_id=>wwv_flow_api.id(27071935034229904)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P916_PGNAS_BREADCRUM'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27072157997229906)
,p_event_id=>wwv_flow_api.id(27071935034229904)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P916_PGNAS_BREADCRUM'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27072593172229910)
,p_name=>'Limpiar Cache'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103378393344291874)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27072672672229911)
,p_event_id=>wwv_flow_api.id(27072593172229910)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P916_PRMTRO_CMPO,P916_ID_MNU,P916_PRMTRO_VLOR,P916_ID_APLCCION,P916_NMBRE_MNU,P916_PGNAS_BREADCRUM,P916_DSCRPCION_MNU,P916_ID_MNU_PDRE,P916_DSTNO_TPO,P916_NMRO_PGNA,P916_URL,P916_ICONO,P916_CLEAR_CACHE,P916_ORDEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103386656663291888)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SG_G_MENU'
,p_attribute_02=>'SG_G_MENU'
,p_attribute_03=>'P916_ID_MNU'
,p_attribute_04=>'ID_MNU'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from sg_g_menu',
'where id_mnu = :P916_ID_MNU'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103385838418291887)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Antes de Insertar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_aplccion    sg_g_aplicaciones.id_aplccion%type;',
'    ',
'    cursor c1 is',
'    select id_aplccion',
'    from sg_g_aplicaciones',
'    where nmro_aplccion = :APP_ID;',
'    ',
'    d number;',
'    ',
'begin',
'    open c1;',
'    fetch c1 into v_id_aplccion;',
'    close c1;',
'    ',
'    --P916_ID_APLCCION:= v_id_aplccion;',
'    ',
'	select nvl( max(id_mnu)+1, 1) into d',
'	from sg_g_menu;',
'	',
'    :P916_ID_MNU := d;',
'    :P916_NODO_SELECCIONADO := d;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103378744310291875)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103387022174291891)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of SG_G_MENU'
,p_attribute_02=>'SG_G_MENU'
,p_attribute_03=>'P916_ID_MNU'
,p_attribute_04=>'ID_MNU'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103386226327291888)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Reset Page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103379191835291875)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39661372952056223)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(39660910047056219)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Tibutos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
