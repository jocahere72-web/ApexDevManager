prompt --application/pages/page_00075
begin
wwv_flow_api.create_page(
 p_id=>75
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Consulta General de Medidas Cautelares'
,p_step_title=>'Consulta General de Medidas Cautelares'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20201008162043'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110593716786996612)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110594246143996617)
,p_plug_name=>'Responsables'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*   select   a.idntfccion',
'            ,a.nmtcnco_idntfccion_tpo',
'            ,a.nmbre_cmplto',
'    from v_mc_g_embargos_responsable a',
'    join v_mc_g_embargos_cartera       b on a.id_embrgos_crtra = b.id_embrgos_crtra and b.cdgo_estdos_crtra not in (''N'')',
'    join (',
'            select  m.id_embrgos_rspnsble, n.nmro_acto',
'              from  mc_g_embrgs_rslcion_rspnsbl m',
'               join mc_g_embargos_resolucion  n on m.id_embrgos_rslcion = n.id_embrgos_rslcion',
'              where n.nmro_acto = nvl(:P75_RSLCION_EMBRGO,n.nmro_acto)',
'        )     c on a.id_embrgos_rspnsble = c.id_embrgos_rspnsble',
'    join     v_mc_g_embargos_sjto e on b.id_embrgos_crtra = e.id_embrgos_crtra',
'    left join ( select x.id_embrgos_crtra, y.nmro_acto',
'                  from mc_g_desembargos_cartera x',
'                    join mc_g_desembargos_resolucion y on x.id_dsmbrgos_rslcion = y.id_dsmbrgos_rslcion',
'                ) f on b.id_embrgos_crtra = f.id_embrgos_crtra',
'    where   b.cdgo_clnte             = :F_CDGO_CLNTE',
'        and a.idntfccion             = nvl(:P75_IDNTFCCION_RSPNSNBLE,a.idntfccion)',
'        and trim(e.idntfccion_sjto)  = nvl(trim(:P75_SUJETO),trim(e.idntfccion_sjto))',
'        and ( :P75_RSLCION_DSMBRGO is null',
'             or ',
'             (:P75_RSLCION_DSMBRGO is not null and f.nmro_acto = :P75_RSLCION_DSMBRGO)',
'            )',
'    group by a.idntfccion,',
'             a.nmtcnco_idntfccion_tpo,',
'             a.nmbre_cmplto',
'  ;*/',
'  select   a.idntfccion',
'        ,a.nmtcnco_idntfccion_tpo',
'        ,a.nmbre_cmplto',
'from v_mc_g_embargos_responsable a',
'join v_mc_g_embargos_cartera       b on a.id_embrgos_crtra = b.id_embrgos_crtra and b.cdgo_estdos_crtra not in (''N'')',
'join (',
'        select  m.id_embrgos_rspnsble, n.nmro_acto',
'          from  mc_g_embrgs_rslcion_rspnsbl m',
'           join mc_g_embargos_resolucion  n on m.id_embrgos_rslcion = n.id_embrgos_rslcion',
'          where n.nmro_acto = nvl(:P75_RSLCION_EMBRGO,n.nmro_acto)',
'    )     c on a.id_embrgos_rspnsble = c.id_embrgos_rspnsble',
'join     v_mc_g_embargos_sjto e on b.id_embrgos_crtra = e.id_embrgos_crtra',
'left join ( select x.id_embrgos_crtra, y.nmro_acto',
'              from mc_g_desembargos_cartera x',
'                join mc_g_desembargos_resolucion y on x.id_dsmbrgos_rslcion = y.id_dsmbrgos_rslcion',
'            ) f on b.id_embrgos_crtra = f.id_embrgos_crtra',
'where   b.cdgo_clnte             = :F_CDGO_CLNTE',
'   --- and a.idntfccion             = nvl(:P75_IDNTFCCION_RSPNSNBLE,a.idntfccion)',
'     and a.idntfccion             like  q''{%}'' || nvl(ltrim(:P75_IDNTFCCION_RSPNSNBLE,0),a.idntfccion)|| q''{%}'' ',
'    and trim(e.idntfccion_sjto)  = nvl(trim(:P75_SUJETO),trim(e.idntfccion_sjto))',
'    and ( :P75_RSLCION_DSMBRGO is null',
'         or ',
'         (:P75_RSLCION_DSMBRGO is not null and f.nmro_acto = :P75_RSLCION_DSMBRGO)',
'        )',
'group by a.idntfccion,',
'         a.nmtcnco_idntfccion_tpo,',
'         a.nmbre_cmplto',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10951469347647115)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110595577097996630)
,p_name=>'NMTCNCO_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMTCNCO_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>3
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110595633827996631)
,p_name=>'NMBRE_CMPLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CMPLTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Responsable'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110597018983996645)
,p_name=>'Solicitudes_Investigacion'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Solicitudes de Investigacion <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:76:&SESSION.::&DEBUG.:RP,76:P76_IDNTFCCION_RSPNSBLE:&IDNTFCCION.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110597176647996646)
,p_name=>'Embargos'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Embargos<span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:77:&SESSION.::&DEBUG.:RP,77:P77_IDNTFCCION_RSPNSBLE:&IDNTFCCION.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110597261573996647)
,p_name=>'Desembargos'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Desembargos <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RP,78:P78_IDNTFCCION_RSPNSBLE:&IDNTFCCION.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(110595318738996628)
,p_internal_uid=>110595318738996628
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(111441901213356444)
,p_interactive_grid_id=>wwv_flow_api.id(110595318738996628)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(111442061169356444)
,p_report_id=>wwv_flow_api.id(111441901213356444)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4644618026601)
,p_view_id=>wwv_flow_api.id(111442061169356444)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10951469347647115)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111443057774356450)
,p_view_id=>wwv_flow_api.id(111442061169356444)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(110595577097996630)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>25
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111443530064356452)
,p_view_id=>wwv_flow_api.id(111442061169356444)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(110595633827996631)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111466586932687692)
,p_view_id=>wwv_flow_api.id(111442061169356444)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(110597018983996645)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111467027964687695)
,p_view_id=>wwv_flow_api.id(111442061169356444)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(110597176647996646)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111467518462687697)
,p_view_id=>wwv_flow_api.id(111442061169356444)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(110597261573996647)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116930171490382708)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <center>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </center>',
'</h5>',
'<p>',
unistr('<b><i></i></b>Esta funcionalidad permite visualizar de forma global todo la informaci\00F3n relacionada del proceso de medida cautelar asociado a un responsable, contando con las siguientes opciones:<br><br>'),
'',
unistr('<b><i>1.</i></b>Filtros de b\00FAsqueda en la parte superior, como los son: <br> '),
unistr('<b>>></b>Identificaci\00F3n del Responsables.<br>'),
unistr('<b>>></b>Identificaci\00F3n del sujeto.<br>'),
unistr('<b>>></b>Resoluci\00F3n de embargo.<br>'),
unistr('<b>>></b>Resoluci\00F3n de Desembargo.<br>'),
'<br>',
'',
unistr('<b><i>2.</i></b>En la parte inferior nos muestra los responsables asociados a los filtros de b\00FAsqueda utilizados o en general de los responsables que se encuentran en medida cautelar<br><br>'),
'',
'<b><i>3.</i></b>En las opciones de la grilla por registro nos muestra:<br>',
'<b>>></b>Investigaciones de bienes</br> ',
'<b>>></b>Embargos</br> ',
'<b>>></b>Desembargos</br> ',
'<b>>></b>Secuestre<br>',
'</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(110597414610996649)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(110593716786996612)
,p_button_name=>'Consultar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110593873860996613)
,p_name=>'P75_IDNTFCCION_RSPNSNBLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(110593716786996612)
,p_prompt=>unistr('<b>Identificaci\00F3n Responsable</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Identificaci\00F3n del responsable asociado a una medida cautelar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110593932038996614)
,p_name=>'P75_NMBRE_RSPNSBLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(110593716786996612)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Nombre del responsable asociado a una medida cautelar.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110594098155996615)
,p_name=>'P75_SUJETO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(110593716786996612)
,p_prompt=>unistr('<b>Identificaci\00F3n de Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Sujeto asociado a una medida cautelar.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110594133098996616)
,p_name=>'P75_RSLCION_EMBRGO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(110593716786996612)
,p_prompt=>unistr('<b>Resoluci\00F3n de Embargo</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Numero de resoluci\00F3n de embargo asociado a una medida cautelar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116930230868382709)
,p_name=>'P75_RSLCION_DSMBRGO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(110593716786996612)
,p_prompt=>unistr('<b>Resoluci\00F3n de Desembargo</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Numero de resoluci\00F3n de desembargo asociado a una medida cautelar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10652853471987607)
,p_name=>unistr('Al dar click en el bot\00F3n Consultar')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(110597414610996649)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10652979595987608)
,p_event_id=>wwv_flow_api.id(10652853471987607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P75_IDNTFCCION_RSPNSNBLE,P75_NMBRE_RSPNSBLE,P75_SUJETO,P75_RSLCION_EMBRGO,P75_RSLCION_DSMBRGO'
,p_attribute_03=>'P75_IDNTFCCION_RSPNSNBLE,P75_NMBRE_RSPNSBLE,P75_SUJETO,P75_RSLCION_EMBRGO,P75_RSLCION_DSMBRGO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10653084660987609)
,p_event_id=>wwv_flow_api.id(10652853471987607)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(110594246143996617)
,p_stop_execution_on_error=>'Y'
);
end;
/
