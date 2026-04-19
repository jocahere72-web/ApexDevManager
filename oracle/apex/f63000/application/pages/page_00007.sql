prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(197944602441250185)
,p_name=>'Procesos de carga'
,p_step_title=>'Procesos de carga'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Cards--featured .t-Card .t-Card-titleWrap {',
'    display: block;',
'    padding: 12px 12px;',
'}',
'',
'',
'.titulo {',
'    color: #056abf;',
'    font-size: 1.4rem;',
'}'))
,p_step_template=>wwv_flow_api.id(197896201223250006)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20200507102132'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32661873572972906)
,p_plug_name=>'Ayda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>50
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
'	Funcionalidad que permite:<br><br>',
'    <b>1.</b> Observar los atributos de los archivos registrados en sistema y su estado actual.<br><br>',
unistr('    <b>2.</b> Ingresar una nuevo proceso, hacer clic en el bot\00F3n Nueva Proceso, el usuario ser\00E1 direccionado a la p\00E1gina para diligenciar el nuevo proceso de carga.<br><br>'),
unistr('    <b>3.</b> Consultar los procesos de carga registrados, hacer clic en el \00EDcono de l\00E1piz, el usuario ser\00E1 direccionado a la p\00E1gina de proceso de carga seleccionado.<br><br>	'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103120826597647152)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda ')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(197906452695250044)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103311358096308349)
,p_plug_name=>unistr('Fecha de creaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(103120826597647152)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(103165080000246111)
,p_name=>'Procesos de carga'
,p_template=>wwv_flow_api.id(197911058427250046)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--featured force-fa-lg:t-Cards--displayInitials:t-Cards--3cols:t-Cards--animRaiseCard'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_prcso_crga,',
'       a.id_crga,',
'       a.nmbre_crga || ',
'       '' <br> <h5> Impuesto: '' || a.nmbre_impsto || ',
'       '' <br> Vigencia: '' || a.vgncia || '' - Periodo: '' || a.vgncia  ||',
'       '' <br> Archivo: ''  || a.file_name || ''</h5>'' CARD_TITLE,',
'       a.id_prcso_crga CARD_INITIALS,',
'       /*''R. Exitosos : ''|| b.rgstros_extsos|| '' - R. Error: '' || b.rgstros_error ||  ',
'       ''<br>Total Registros: '' || b.rgstros_prcsdos*/',
'       (select ''<div class= "titulo" > Paso a: '' || orgen || ''</div>R. Exitosos : ''|| to_char(m.rgstros_extsos,''FM999,999,999'') || '' | R. Error: '' || to_char(m.rgstros_error,''FM999,999,999'') || '' | Total Registros: '' || to_char(m.rgstros_prcsdos,''FM9'
||'99,999,999'') from et_g_procesos_carga_traza m where a.id_prcso_crga = m.id_prcso_crga and orgen = ''INTERMEDIA'')  || '' <br> '' || ',
'       (select ''<div class= "titulo" > Paso a: '' || orgen || ''</div>R. Exitosos : ''|| to_char(m.rgstros_extsos,''FM999,999,999'') || '' | R. Error: '' || to_char(m.rgstros_error,''FM999,999,999'') || '' | Total Registros: '' || to_char(m.rgstros_prcsdos,''FM9'
||'99,999,999'') from et_g_procesos_carga_traza m where a.id_prcso_crga = m.id_prcso_crga and orgen = ''GESTION'') CARD_TEXT,',
'       ''Estado : ''||dscrpcion_estdo_prcso CARD_SUBTEXT,',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':8:''||:APP_SESSION||'':::8:P8_ID_PRCSO_CRGA,P8_BRANCH:''||a.id_prcso_crga||'',''||:APP_PAGE_ID) CARD_LINK,',
'       ''#FFFFFF'' CARD_COLOR,',
'       ''fa-folder-plus'' CARD_ICON',
'  from v_et_g_procesos_carga a',
'  left join et_g_procesos_carga_traza b',
'     on a.id_prcso_crga = b.id_prcso_crga',
'    and orgen = ''GESTION''',
' where (a.id_crga = :P7_TIPO_CARGA or :P7_TIPO_CARGA is null) ',
'   and (a.cdgo_prcso_estdo = :P7_ESTADO or :P7_ESTADO is null)',
'   and a.cdgo_clnte = :F_CDGO_CLNTE'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P7_TIPO_CARGA,P7_ESTADO'
,p_query_row_template=>wwv_flow_api.id(197918225463250061)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No se encontraron procesos de carga'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(103165748031246154)
,p_query_column_id=>1
,p_column_alias=>'ID_PRCSO_CRGA'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(103166161934246158)
,p_query_column_id=>2
,p_column_alias=>'ID_CRGA'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(103120604318647150)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Card title'
,p_column_format=>'PCT_GRAPH:::'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(103315387443308390)
,p_query_column_id=>4
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>7
,p_column_heading=>'Card initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(103120706797647151)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Card text'
,p_column_format=>'PCT_GRAPH:::'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(171640942419537848)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>9
,p_column_heading=>'Card subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(103120881736647153)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>5
,p_column_heading=>'Card link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(103315329537308389)
,p_query_column_id=>8
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>6
,p_column_heading=>'Card color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(103315502839308391)
,p_query_column_id=>9
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>8
,p_column_heading=>'Card icon'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103311875078308354)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-LinksList--showIcons'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_api.id(103390272344824034)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(197929765556250090)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115779692598602702)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(197911058427250046)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115803020411803802)
,p_plug_name=>'Informe de Proceso Carga'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(197910552558250045)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.nmbre_crga',
'        , a.file_name',
'        , a.dscrpcion_archvo_tpo',
'        , a.fcha_rgstro',
'        , a.nmbre_trcro',
'        , a.id_prcso_crga',
'        , a.dscrpcion_estdo_prcso',
'     from v_et_g_procesos_carga a',
'    where (a.id_crga = :P7_TIPO_CARGA or :P7_TIPO_CARGA is null) ',
'      and (a.cdgo_prcso_estdo = :P7_ESTADO or :P7_ESTADO is null)',
'      and a.cdgo_clnte = :F_CDGO_CLNTE',
'      and not a.id_crga in (',
'                                 select id_crga ',
'                                   from df_s_resolucion_carga',
'                           )',
' order by a.fcha_rgstro desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P7_ESTADO,P7_TIPO_CARGA'
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
 p_id=>wwv_flow_api.id(115803177418803803)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP:P8_BRANCH,P8_ID_PRCSO_CRGA:&APP_PAGE_ID.,#ID_PRCSO_CRGA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'NARDILA'
,p_internal_uid=>115803177418803803
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115803280779803804)
,p_db_column_name=>'NMBRE_CRGA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Carga'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115803332388803805)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115803493976803806)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115803553513803807)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115803694816803808)
,p_db_column_name=>'ID_PRCSO_CRGA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Numero'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115803779664803809)
,p_db_column_name=>'DSCRPCION_ARCHVO_TPO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(115803801754803810)
,p_db_column_name=>'DSCRPCION_ESTDO_PRCSO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(115901165832762507)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1159012'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PRCSO_CRGA:NMBRE_CRGA:FILE_NAME:FCHA_RGSTRO:NMBRE_TRCRO:DSCRPCION_ARCHVO_TPO:DSCRPCION_ESTDO_PRCSO:'
,p_sort_column_1=>'FCHA_RGSTRO'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'NMBRE_TRCRO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'0:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:0'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(22088917634745943)
,p_report_id=>wwv_flow_api.id(115901165832762507)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'DSCRPCION_ESTDO_PRCSO'
,p_operator=>'='
,p_expr=>'Sin ejecutar'
,p_condition_sql=>'"DSCRPCION_ESTDO_PRCSO" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Sin ejecutar''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(115802949822803801)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(115779692598602702)
,p_button_name=>'Bnt_Nuevo_Proceso'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(197933931608250119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo proceso'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8:P8_BRANCH:&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103121028837647154)
,p_name=>'P7_ESTADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103120826597647152)
,p_prompt=>'Estado'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ESTADO_PROCESO_CARGA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_estdo_prcso,',
'       cdgo_prcso_estdo',
'  from et_d_procesos_estado'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Todos'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(197933322073250107)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103121120839647155)
,p_name=>'P7_TIPO_CARGA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103120826597647152)
,p_prompt=>'Tipo carga'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CARGA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_crga,',
'       id_crga',
'  from et_g_carga ',
'  where not id_crga in (',
'                          select id_crga ',
'                            from df_s_resolucion_carga',
'                      )',
' order by nmbre_crga'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Todos'
,p_field_template=>wwv_flow_api.id(197933322073250107)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'400'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103311275535308348)
,p_name=>'P7_USUARIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103120826597647152)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103311455455308350)
,p_name=>'P7_FCHA_DSDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103311358096308349)
,p_prompt=>'Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(197933322073250107)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103311480405308351)
,p_name=>'P7_FCHA_HSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103311358096308349)
,p_prompt=>'Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(197933322073250107)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103311622741308352)
,p_name=>'Al cambiar filtros'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_TIPO_CARGA,P7_ESTADO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103311757884308353)
,p_event_id=>wwv_flow_api.id(103311622741308352)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(115803020411803802)
,p_stop_execution_on_error=>'Y'
);
end;
/
