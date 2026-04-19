prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>'Usuarios Sujeto Impuesto'
,p_step_title=>'Usuarios Sujeto Impuesto'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(29911946739317080)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200804184334'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79686639650354342)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
'<i>',
unistr('    Funcionalidad que permite gestionar las solicitudes de relaci\00F3n entre usuarios creados en el portal y los sujetos-tributos en el sistema.'),
'    <br><br>	',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79686718524354343)
,p_plug_name=>'WorkFlow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80428843339604501)
,p_plug_name=>'Datos del Usuario'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_usrio_slctud,',
'            c.id_usrio,',
'            c.idntfccion,',
'            c.nmbre_trcro,',
'            c.drccion,',
'            c.email,',
'            c.tlfno,',
'            a.cdgo_rspsta,',
'            a.id_usrio_rspsta,',
'            a.obsrvcion_rspsta,',
'            c.fcha_crcion,',
'            c.fcha_exprcion,',
'            c.fecha_modifica,',
'            c.actvo',
'from        sg_g_usrios_slctud  a',
'join        pq_g_solicitudes    b   on  b.id_slctud =   a.id_slctud',
'join        v_sg_g_usuarios     c   on  c.id_usrio  =   b.id_usrio',
'where   a.id_usrio_slctud   =   :P13_ID_USRIO_SLCTUD;'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80467603207954222)
,p_plug_name=>unistr('Informaci\00F3n del Sujeto-Tributo')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P13_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80468013312954226)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
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
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    sg_g_usrios_slctud          a',
'join    wf_g_instancias_transicion  b   on  b.id_instncia_fljo  =   a.id_instncia_fljo',
'where   b.id_fljo_trea_orgen    =   :F_ID_FLJO_TREA',
'and     b.id_estdo_trnscion     in  (1, 2)',
'and     a.id_usrio_slctud       =   :P13_ID_USRIO_SLCTUD',
'and     a.cdgo_rspsta           is  null;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80567558137234703)
,p_plug_name=>'Informacion Adicional'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80466997566954215)
,p_plug_name=>'Documentos Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(80567558137234703)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  d.dscrpcion,',
'        b.id_dcmnto',
'from    sg_g_usrios_slctud      a',
'join    pq_g_documentos         b   on  b.id_slctud     =   a.id_slctud',
'join    pq_d_motivos_documento  c   on  c.id_mtvo_dcmnto=   b.id_mtvo_dcmnto',
'join    pq_d_documentos         d   on  d.cdgo_dcmnto   =   c.cdgo_dcmnto',
'where   a.id_usrio_slctud   =   :P13_ID_USRIO_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(80467115006954217)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:pq_g_documentos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_DCMNTO,&ID_DCMNTO.'
,p_link_text=>'&DSCRPCION.'
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
 p_id=>wwv_flow_api.id(80467223481954218)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(80467092892954216)
,p_internal_uid=>80467092892954216
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(80490600798223888)
,p_interactive_grid_id=>wwv_flow_api.id(80467092892954216)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(80490761396223888)
,p_report_id=>wwv_flow_api.id(80490600798223888)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80491220930223903)
,p_view_id=>wwv_flow_api.id(80490761396223888)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(80467115006954217)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80491714969223906)
,p_view_id=>wwv_flow_api.id(80490761396223888)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(80467223481954218)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80567663962234704)
,p_plug_name=>'Respuesta Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(80567558137234703)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'NOT_EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    sg_g_usrios_slctud  a',
'where   a.id_usrio_slctud   =   :P13_ID_USRIO_SLCTUD',
'and     a.cdgo_rspsta       is  null;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80567371730234701)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(80468013312954226)
,p_button_name=>'B13_APRBAR_SLCTUD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80567412214234702)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(80468013312954226)
,p_button_name=>'B13_RCHZAR_SLCTUD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_image_alt=>'Rechazar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80460254285910101)
,p_name=>'P13_ID_INSTNCIA_FLJO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80465822503954204)
,p_name=>'P13_ID_USRIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_source=>'ID_USRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80465970338954205)
,p_name=>'P13_IDNTFCCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>unistr('Identificaci\00F3n')
,p_source=>'IDNTFCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80466057277954206)
,p_name=>'P13_NMBRE_TRCRO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>'Nombre'
,p_source=>'NMBRE_TRCRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80466159606954207)
,p_name=>'P13_DRCCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>unistr('Direcci\00F3n')
,p_source=>'DRCCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80466264167954208)
,p_name=>'P13_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80466361890954209)
,p_name=>'P13_TLFNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>'Telefono'
,p_source=>'TLFNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80466404045954210)
,p_name=>'P13_FCHA_CRCION'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>unistr('Fecha Creaci\00F3n')
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_CRCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80466506304954211)
,p_name=>'P13_FCHA_EXPRCION'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>unistr('Fecha Expiraci\00F3n')
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_EXPRCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80466692601954212)
,p_name=>'P13_FECHA_MODIFICA'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>unistr('Fecha Modificaci\00F3n')
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FECHA_MODIFICA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80466734015954213)
,p_name=>'P13_ACTVO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>'Activo'
,p_source=>'ACTVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(103268944208132840)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80466866679954214)
,p_name=>'P13_ID_USRIO_SLCTUD'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80428843339604501)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_source=>'ID_USRIO_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80467854037954224)
,p_name=>'P13_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80467603207954222)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80567786626234705)
,p_name=>'P13_OBSRVCION_RSPSTA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(80567663962234704)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>'Observaciones'
,p_source=>'OBSRVCION_RSPSTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80689547782875803)
,p_name=>'P13_CDGO_RSPSTA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(80567663962234704)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>'Respuesta'
,p_source=>'CDGO_RSPSTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.cdgo_rspsta',
'from    pq_d_respuestas a'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80738267164270101)
,p_name=>'P13_ID_USRIO_RSPSTA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(80567663962234704)
,p_item_source_plug_id=>wwv_flow_api.id(80428843339604501)
,p_prompt=>'Usuarios Respuesta'
,p_source=>'ID_USRIO_RSPSTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(80467986627954225)
,p_computation_sequence=>10
,p_computation_item=>'P13_ID_SJTO_IMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c.id_sjto_impsto',
'from    sg_g_usrios_slctud          a',
'join    pq_g_solicitudes_motivo     b   on  b.id_slctud     =   a.id_slctud',
'join    pq_g_slctdes_mtvo_sjt_impst c   on  c.id_slctud_mtvo=   b.id_slctud_mtvo',
'where   a.id_usrio_slctud   =   :P13_ID_USRIO_SLCTUD;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(80568045789234708)
,p_name=>'AD Aprobar Solicitud'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(80567371730234701)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80568159559234709)
,p_event_id=>wwv_flow_api.id(80568045789234708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function aceptarSolicitud(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_aceptarSolicitud", {',
'            pageItems: "#P13_ID_USRIO_SLCTUD, #P13_OBSRVCION_RSPSTA"',
'        }, {',
'            success: function( pData ){',
'                if (pData.o_cdgo_rspsta != 0){',
'                    //console.log(pData.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de aceptar la solicitud?", function( okPressed ) {'),
'        if( okPressed ) {',
'            aceptarSolicitud();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(80568319912234711)
,p_name=>'AD Rechazar Solicitud'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(80567412214234702)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80568447265234712)
,p_event_id=>wwv_flow_api.id(80568319912234711)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function rechazarSolicitud(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_rechazarSolicitud", {',
'            pageItems: "#P13_ID_USRIO_SLCTUD, #P13_OBSRVCION_RSPSTA"',
'        }, {',
'            success: function( pData ){',
'                if (pData.o_cdgo_rspsta != 0){',
'                    //console.log(pData.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de rechazar la solicitud?", function( okPressed ) {'),
'        if( okPressed ) {',
'            rechazarSolicitud();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80429092585604503)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registro de proceso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_usrio_slctud       number;',
'    v_id_instncia_fljo_pdre number;',
'    v_id_slctud             number;',
'begin',
'    --Se valida el proceso en la tabla sg_g_usrios_slctud',
'    begin',
'        select  a.id_usrio_slctud',
'        into    v_id_usrio_slctud',
'        from    sg_g_usrios_slctud  a',
'        where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'        and     a.id_instncia_fljo  =   :F_ID_INSTNCIA_FLJO;',
'    exception',
'        when no_data_found then',
'            null;',
'        when others then',
'            raise_application_error (-20000, ''No se ha podido identificar el flujo de trabajo para el proceso.''); ',
'    end;',
'    ',
'    --Si no existe se crea',
'    if (v_id_usrio_slctud is null) then',
'        ',
'        --Se identifica el flujo del proceso padre',
'        begin',
'            select  a.id_instncia_fljo',
'			into	v_id_instncia_fljo_pdre',
'			from    wf_g_instancias_flujo_gnrdo a',
'			where   a.id_instncia_fljo_gnrdo_hjo    =   :F_ID_INSTNCIA_FLJO;',
'        exception',
'            when others then',
'                raise_application_error (-20000, ''No se ha podido identificar el flujo de trabajo del proceso padre.''); ',
'        end;',
'        ',
'        --Se identifica la la solicitud',
'        begin',
'            select      a.id_slctud',
'            into        v_id_slctud',
'            from        pq_g_solicitudes    a',
'            where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'            and         a.id_instncia_fljo  =   v_id_instncia_fljo_pdre;',
'        exception',
'            when others then',
'                raise_application_error (-20000, ''No se ha podido identificar la solicitud.''); ',
'        end;',
'        ',
'        --',
'        begin',
'            insert into sg_g_usrios_slctud  (',
'                                                cdgo_clnte,',
'                                                id_instncia_fljo,',
'                                                id_slctud',
'                                            )',
'                                    values  (',
'                                                :F_CDGO_CLNTE,',
'                                                :F_ID_INSTNCIA_FLJO,',
'                                                v_id_slctud',
'                                            )',
'                                    returning id_usrio_slctud into v_id_usrio_slctud;',
'        exception',
'            when others then',
'                raise_application_error (-20000, ''No se ha podido registrar el flujo de trabajo para el proceso.''); ',
'        end;',
'    end if;',
'    ',
'    :P13_ID_USRIO_SLCTUD := v_id_usrio_slctud;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80465799135954203)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_region_id=>wwv_flow_api.id(80428843339604501)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Usuarios Sujeto Impuesto'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80567976150234707)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_aceptarSolicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(4000);',
'begin',
'    pkg_sg_seguridad.prc_rg_usrio_sjto_impsto	(',
'                                                    p_cdgo_clnte		=>    :F_CDGO_CLNTE,',
'                                                    p_id_usrio_slctud   =>    :P13_ID_USRIO_SLCTUD,',
'                                                    p_cdgo_rspsta_slctud=>    ''A'',',
'                                                    p_obsrvcion_rspsta  =>    :P13_OBSRVCION_RSPSTA,',
'                                                    p_id_usrio_rspsta   =>    :F_ID_USRIO,',
'                                                    o_cdgo_rspsta       =>    v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta      =>    v_mnsje_rspsta',
'                                                );',
'                                                    ',
'	owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    htp.p(''{"o_cdgo_rspsta" :''||v_cdgo_rspsta||',
'          '',"o_mnsje_rspsta":"''||v_mnsje_rspsta||''"}'');    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80568246422234710)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_rechazarSolicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(4000);',
'begin',
'    pkg_sg_seguridad.prc_rg_usrio_sjto_impsto	(',
'                                                    p_cdgo_clnte		=>    :F_CDGO_CLNTE,',
'                                                    p_id_usrio_slctud   =>    :P13_ID_USRIO_SLCTUD,',
'                                                    p_cdgo_rspsta_slctud=>    ''R'',',
'                                                    p_obsrvcion_rspsta  =>    :P13_OBSRVCION_RSPSTA,',
'                                                    p_id_usrio_rspsta   =>    :F_ID_USRIO,',
'                                                    o_cdgo_rspsta       =>    v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta      =>    v_mnsje_rspsta',
'                                                );',
'                                                    ',
'	owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    htp.p(''{"o_cdgo_rspsta" :''||v_cdgo_rspsta||',
'          '',"o_mnsje_rspsta":"''||v_mnsje_rspsta||''"}'');    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
