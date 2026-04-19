prompt --application/pages/page_20240
begin
wwv_flow_api.create_page(
 p_id=>2024022
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Gesti\00F3n Solicitudes Asociados')
,p_step_title=>unistr('Gesti\00F3n Solicitudes Asociados')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.formulario_declaracion/1.0/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/pdfjs-2.4.456-dist/build/pdf.js'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20241211085544'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2805908506216126)
,p_plug_name=>'Gestion Solicitudes Asociados'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
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
unistr('        <li><strong>N\00FAmero de consecutivo:</strong> <span class="mensaje-value">&P2024022_NMRO_SLCTUD.</span></li>'),
'        <li><strong>Fecha de solicitud:</strong> <span class="mensaje-value">&P2024022_FCHA_SLCTUD.</span></li>',
'        <li><strong>Estado actual:</strong> <span class="mensaje-value">&P2024022_ESTDO.</span></li>',
unistr('        <li><strong>Fecha de gesti\00F3n:</strong> <span class="mensaje-value">&P2024022_FCHA_GSTION.</span></li>'),
'    </ul>',
'    <p class="mensaje-body">',
'        A continuacion se muestra el detalle de la solicitud,',
unistr('        si requiere m\00E1s informaci\00F3n o tiene alguna duda, no dude en ponerse en contacto.'),
'    </p>',
'    <p class="mensaje-footer">',
unistr('        \00A1Gracias!.'),
'    </p>',
'</div>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from si_g_solicitudes_asociados',
'where estdo <> ''PEN'' and id_slctud_ascdo = :P2024022_ID_SLCTUD_ASCDO;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4347087685577430)
,p_plug_name=>'Detalle de Solicitud Procesada'
,p_parent_plug_id=>wwv_flow_api.id(2805908506216126)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_slctd_ascdo_dtlle, b.nmbre_impsto,',
'  case',
'    when a.cdgo_rspta = ''A'' then ''Aprobada''',
'    when a.cdgo_rspta = ''R'' then ''Rechazada''',
'    else a.cdgo_rspta',
'  end estado',
'from si_g_slctd_asociado_detalle a',
'join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where id_slctud_ascdo = :P2024022_ID_SLCTUD_ASCDO;',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from si_g_solicitudes_asociados',
'where estdo <> ''PEN'' and id_slctud_ascdo = :P2024022_ID_SLCTUD_ASCDO;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4347204889577432)
,p_name=>'ID_SLCTD_ASCDO_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_ASCDO_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(4347390140577433)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(4347492256577434)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>9
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(4347121686577431)
,p_internal_uid=>4347121686577431
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
 p_id=>wwv_flow_api.id(4459070249855714)
,p_interactive_grid_id=>wwv_flow_api.id(4347121686577431)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4459154198855714)
,p_report_id=>wwv_flow_api.id(4459070249855714)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4459630462855715)
,p_view_id=>wwv_flow_api.id(4459154198855714)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4347204889577432)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4460193635855717)
,p_view_id=>wwv_flow_api.id(4459154198855714)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4347390140577433)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4460640101855718)
,p_view_id=>wwv_flow_api.id(4459154198855714)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4347492256577434)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2806061690216127)
,p_plug_name=>unistr('Gesti\00F3n Solicitudes')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
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
unistr('        <li><strong>N\00FAmero de consecutivo:</strong> <span class="mensaje-value">&P2024022_NMRO_SLCTUD.</span></li>'),
'        <li><strong>Fecha de solicitud:</strong> <span class="mensaje-value">&P2024022_FCHA_SLCTUD.</span></li>',
'        <li><strong>Estado actual:</strong> <span class="mensaje-value">&P2024022_ESTDO.</span></li>',
'        <li><strong>Identificacion solicitante:</strong> <span class="mensaje-value">&P2024022_IDNTFCCION.</span></li>',
'        <li><strong>Nombre solicitante:</strong> <span class="mensaje-value">&P2024022_NMBRE_TRCRO.</span></li>',
'',
'    </ul>',
'    <p class="mensaje-body">',
unistr('        Por favor seleccione los impuestos a los cuales se le otorgara autorizaci\00F3n al usuario especificado sobre la gesti\00F3n de declaraciones.'),
'    </p>',
'    <p class="mensaje-footer">',
unistr('        \00A1Gracias!.'),
'    </p>',
'</div>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from si_g_solicitudes_asociados',
'where estdo = ''PEN'' and id_slctud_ascdo = :P2024022_ID_SLCTUD_ASCDO;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4345521223577415)
,p_plug_name=>'Detalle de solicitud'
,p_region_name=>'detalle'
,p_parent_plug_id=>wwv_flow_api.id(2806061690216127)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_slctd_ascdo_dtlle, b.nmbre_impsto',
'from si_g_slctd_asociado_detalle a',
'join df_c_impuestos b on  a.id_impsto = b.id_impsto',
'where id_slctud_ascdo = :P2024022_ID_SLCTUD_ASCDO and a.cdgo_rspta is null',
'and not exists (select 1 from si_i_sujetos_asociados b where b.id_sjto_impsto = a.id_sjto_impsto and b.id_usrio = a.id_usrio and b.actvo = ''S'');',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from si_g_solicitudes_asociados',
'where estdo = ''PEN'' and id_slctud_ascdo = :P2024022_ID_SLCTUD_ASCDO;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4345733188577417)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Impuestos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4346498192577424)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4346830960577428)
,p_name=>'ID_SLCTD_ASCDO_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_ASCDO_DTLLE'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(4345628890577416)
,p_internal_uid=>4345628890577416
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
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
 p_id=>wwv_flow_api.id(4437353158669268)
,p_interactive_grid_id=>wwv_flow_api.id(4345628890577416)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4437455546669268)
,p_report_id=>wwv_flow_api.id(4437353158669268)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4437940141669271)
,p_view_id=>wwv_flow_api.id(4437455546669268)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4345733188577417)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4455629148259825)
,p_view_id=>wwv_flow_api.id(4437455546669268)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4346830960577428)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86453360999708806)
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
 p_id=>wwv_flow_api.id(86453730160708810)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
unistr('</h5>Funcionalidad que permite autorizar o rechazar las solicitudes de autorizaci\00F3n para la gesti\00F3n de declaraciones.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3724721736069211)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(86453360999708806)
,p_button_name=>'BTN_AUTRZAR'
,p_button_static_id=>'autorizar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from si_g_solicitudes_asociados',
'where estdo = ''PEN'' and id_slctud_ascdo = :P2024022_ID_SLCTUD_ASCDO;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3725117213069212)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(86453360999708806)
,p_button_name=>'BTN_RCHZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'<b>Rechazar Solicitud</b>'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from si_g_solicitudes_asociados',
'where estdo = ''PEN'' and id_slctud_ascdo = :P2024022_ID_SLCTUD_ASCDO;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2806128995216128)
,p_name=>'P2024022_FCHA_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2805908506216126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2806213245216129)
,p_name=>'P2024022_NMRO_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2805908506216126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2806315742216130)
,p_name=>'P2024022_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2805908506216126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2806571230216132)
,p_name=>'P2024022_CDGO_CLNTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2805908506216126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2806682094216133)
,p_name=>'P2024022_ID_SLCTUD_ASCDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(2805908506216126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2808030879216147)
,p_name=>'P2024022_CDGO_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(2805908506216126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2808295417216149)
,p_name=>'P2024022_FCHA_GSTION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(2805908506216126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3961602019344502)
,p_name=>'P2024022_IDNTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(2805908506216126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3961732848344503)
,p_name=>'P2024022_NMBRE_TRCRO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(2805908506216126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3964060921344526)
,p_name=>'P2024022_CDGO_AUTRZCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2806061690216127)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4346917024577429)
,p_name=>'P2024022_CDNA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2806061690216127)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4650615069964343)
,p_name=>'P2024022_TKEN'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(2805908506216126)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4034722762392403)
,p_name=>'Setear Valor de Item'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3724721736069211)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4034875572392404)
,p_event_id=>wwv_flow_api.id(4034722762392403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2024022_CDGO_AUTRZCION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'A'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4034956567392405)
,p_name=>'llamar Process'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3724721736069211)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4035061463392406)
,p_event_id=>wwv_flow_api.id(4034956567392405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'BTN_AUTRZAR'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4035147295392407)
,p_name=>'Setear Valor de Items'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3725117213069212)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4035251532392408)
,p_event_id=>wwv_flow_api.id(4035147295392407)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2024022_CDGO_AUTRZCION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'R'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4035335372392409)
,p_name=>'llamar Processing'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3725117213069212)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4035440671392410)
,p_event_id=>wwv_flow_api.id(4035335372392409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'BTN_RCHZAR'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4346605468577426)
,p_name=>'Al seleccionar registro'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(4345521223577415)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4346768158577427)
,p_event_id=>wwv_flow_api.id(4346605468577426)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = apex.region("detalle");',
'',
'if (region) {',
'    var view = region.widget().interactiveGrid("getViews", "grid");',
'    var model = view.model;',
'',
'    var records = view.view$.grid("getSelectedRecords");',
'',
'    // Si hay registros seleccionados',
'    if (records.length > 0) {',
'        // Crear una variable para almacenar la cadena concatenada',
'        var concatenatedValues = [];',
'',
'        records.forEach(function(record) {',
'            var value = model.getValue(record, "ID_SLCTD_ASCDO_DTLLE");',
'            concatenatedValues.push(value);',
'        });',
'',
'        // Concatenar los valores con ":" como separador',
'        var resultString = concatenatedValues.join(":");',
'',
'        apex.item("P2024022_CDNA").setValue(resultString);',
'',
unistr('        // Habilitar el bot\00F3n "autorizar"'),
unistr('        $("#autorizar").prop("disabled", false);  // Habilitar el bot\00F3n'),
'',
'    } else {',
'        // Si no hay registros seleccionados, puedes limpiar el item',
'        apex.item("P2024022_CDNA").setValue("");',
'',
'        console.log("No se seleccionaron registros.");',
'',
unistr('        // Deshabilitar el bot\00F3n "autorizar"'),
unistr('        $("#autorizar").prop("disabled", true);  // Deshabilitar el bot\00F3n'),
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2807959924216146)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestionar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    ',
'begin',
'',
'    if :P2024022_CDGO_AUTRZCION is not null then',
'',
'            pkg_gi_asociado.prc_ac_sujeto_asociado (',
'                                                    p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                    p_id_slctud_ascdo   => :P2024022_ID_SLCTUD_ASCDO,',
'                                                    p_cdna              => :P2024022_CDNA, ',
'                                                    p_cdgo_rspta        => :P2024022_CDGO_AUTRZCION,',
'                                                    o_cdgo_rspsta       => v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta      => v_mnsje_rspsta',
'                                                ) ;',
'',
unistr('    -- Verificaci\00F3n del c\00F3digo de respuesta'),
'    if v_cdgo_rspsta != 0 then',
unistr('        raise_application_error(-20001, ''Error: '' || v_mnsje_rspsta || '' (C\00F3digo: '' || v_cdgo_rspsta || '')'');'),
'',
'    end if;',
'   ',
'   else',
'            raise_application_error(-20001, ''Error: Codigo autorizacion nulo'');',
'   end if;',
'exception',
'    when others then',
'        raise_application_error(-20002, ''Error en el procesamiento: '' || sqlerrm);',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_AUTRZAR,BTN_RCHZAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4346502298577425)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(4345521223577415)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Detalle de solicitud - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2807711360216144)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Informaci\00F3n Solicitud')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select nmro_cnsctvo, ',
'           c.dscrpcion,        ',
'           trunc(fcha_slctud),',
'           trunc(fcha_gstion),',
'           b.idntfccion,',
'           b.nmbre_trcro,',
'           a.id_slctud_ascdo',
'    into :P2024022_NMRO_SLCTUD, ',
'         :P2024022_ESTDO,',
'         :P2024022_FCHA_SLCTUD, ',
'         :P2024022_FCHA_GSTION,',
'         :P2024022_IDNTFCCION,',
'         :P2024022_NMBRE_TRCRO,',
'         :P2024022_ID_SLCTUD_ASCDO',
'    from si_g_solicitudes_asociados a',
'    join v_sg_g_usuarios b on a.id_usrio = b.id_usrio',
'    join si_d_estdo_slctud c on c.estdo = a.estdo',
'    where a.cdgo_slctud = :P2024022_TKEN;',
'',
'exception',
'    when no_data_found then',
'        :P2024022_NMRO_SLCTUD := null; ',
'        :P2024022_ESTDO := null;  ',
'        :P2024022_FCHA_SLCTUD := null; ',
'        :P2024022_FCHA_GSTION := null; ',
'        :P2024022_IDNTFCCION := null;',
'        :P2024022_NMBRE_TRCRO := null;',
'        :P2024022_ID_SLCTUD_ASCDO := null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2024022_TKEN'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
