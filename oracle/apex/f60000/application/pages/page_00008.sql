prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>'Informe Tabla Auditadas'
,p_step_title=>'Informe Tabla Auditadas'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(29911946739317080)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'80073608'
,p_last_upd_yyyymmddhh24miss=>'20200908191918'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48967859945095804)
,p_plug_name=>'auditoria de tablas'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return pkg_ad_auditoria.fnc_co_tabla_auditoria(p_nmbre_tbla => :P8_NMBRE_TBLA',
'                                             , p_tpo_oprcion => :P8_OPRCION_TPO',
'                                             , p_fcha_incio => :P8_FCHA_INCIO',
'                                             , p_fcha_fin => :P8_FCHA_FIN',
'                                             , p_id_usrio => :P8_USRIO);'))
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
 p_id=>wwv_flow_api.id(48967914759095805)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>48967914759095805
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48968033357095806)
,p_db_column_name=>'Numero Auditoria'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Numero Auditoria'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49462151262676381)
,p_db_column_name=>unistr('Operaci\00F3n')
,p_display_order=>23
,p_column_identifier=>'N'
,p_column_label=>unistr('Operaci\00F3n')
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49463953954709917)
,p_db_column_name=>unistr('Usuario Operaci\00F3n')
,p_display_order=>24
,p_column_identifier=>'O'
,p_column_label=>unistr('Usuario Operaci\00F3n')
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(49464614510709917)
,p_db_column_name=>unistr('Fecha Operaci\00F3n')
,p_display_order=>25
,p_column_identifier=>'P'
,p_column_label=>unistr('Fecha Operaci\00F3n')
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(49336731914880230)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'493368'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Numero Auditoria:Operaci\00F3n:Usuario Operaci\00F3n:Fecha Operaci\00F3n')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(124970730990206742)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29933691268317090)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168983212946322102)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'	Funcionalidad que permite ingresar, consultar, modificar y eliminar',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173828260552867407)
,p_plug_name=>'Tabla Auditar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_auditoria,',
'        a.nmbre_tbla,',
unistr('        decode (a.tpo_oprcion, ''I'', ''Registro'', ''U'', ''Actualizaci\00F3n'', ''D'', ''Eliminaci\00F3n'') tpo_oprcion,'),
'        campos.*,',
'        a.usrio,',
'        b.nmbre_trcro,',
'        to_char(a.fecha, ''DD/MM/YYYY HH:MI:SS AM'') fcha,',
'        a.host,',
'        a.ip_address',
'    from ad_g_audit_trail a, ',
'    json_table(json, ''$.campos[*]'' ',
'             columns (nmbre_cmpo    varchar2(10) path ''$.nmbre_cmpo'',',
'                      old 		    varchar2(20) path ''$.old'',',
'                      new 		    varchar2(20) path ''$.new'')) as campos',
'    ,v_si_c_terceros b ',
'    where (a.nmbre_tbla         = :P8_NMBRE_TBLA     or :P8_NMBRE_TBLA is null)',
'      and (a.tpo_oprcion        = :P8_OPRCION_TPO    or :P8_OPRCION_TPO is null) ',
'      and (campos.nmbre_cmpo    = :P8_NMBRE_CMPO     or :P8_NMBRE_CMPO is null) ',
'      and (campos.old           = :P8_OLD            or :P8_OLD is null) ',
'      and (campos.new           = :P8_NEW            or :P8_NEW is null) ',
'      and (a.usrio              = :P8_USRIO          or :P8_USRIO is null) ',
'      and (trunc(a.fecha)       between trunc(to_date(:P8_FCHA_INCIO)) and trunc(to_date(:P8_FCHA_FIN)) or :P8_FCHA_INCIO is null or  :P8_FCHA_FIN is null)',
'      and (a.host               = :P8_HOST           or :P8_HOST is null) ',
'      and (a.ip_address         = :P8_IP_ADDRESS     or :P8_IP_ADDRESS is null) ',
'      and a.usrio = b.idntfccion',
'      and cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_api.id(173828330532867408)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AALFARO'
,p_internal_uid=>173828330532867408
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173828426902867409)
,p_db_column_name=>'NMBRE_TBLA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Nombre Tabla'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35695623233452211)
,p_db_column_name=>'TPO_OPRCION'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>unistr('Tipo de Operaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35695701829452212)
,p_db_column_name=>'NMBRE_CMPO'
,p_display_order=>30
,p_column_identifier=>'G'
,p_column_label=>'Nombre de la Columna'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35695807443452213)
,p_db_column_name=>'OLD'
,p_display_order=>40
,p_column_identifier=>'H'
,p_column_label=>'Old'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35695920325452214)
,p_db_column_name=>'NEW'
,p_display_order=>50
,p_column_identifier=>'I'
,p_column_label=>'New'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35696085307452215)
,p_db_column_name=>'USRIO'
,p_display_order=>60
,p_column_identifier=>'J'
,p_column_label=>unistr('Identificaci\00F3n Usuario')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35696110216452216)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35696221368452217)
,p_db_column_name=>'FCHA'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'Fecha'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35696338678452218)
,p_db_column_name=>'HOST'
,p_display_order=>90
,p_column_identifier=>'M'
,p_column_label=>'Host'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35696415561452219)
,p_db_column_name=>'IP_ADDRESS'
,p_display_order=>100
,p_column_identifier=>'N'
,p_column_label=>'Ip Address'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35917234086923601)
,p_db_column_name=>'ID_AUDITORIA'
,p_display_order=>110
,p_column_identifier=>'O'
,p_column_label=>'Id Auditoria'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173842017813934648)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1738421'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_TBLA:TPO_OPRCION:NMBRE_CMPO:OLD:NEW:USRIO:NMBRE_TRCRO:FCHA:HOST:IP_ADDRESS:ID_AUDITORIA'
,p_sort_column_1=>'FCHA'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(124971044685206745)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(124970730990206742)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124970854699206743)
,p_name=>'P8_NMBRE_TBLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(124970730990206742)
,p_prompt=>'Tablas '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.nmbre_tbla_adtda a , e.nmbre_tbla_adtda b from ad_d_tablas_auditada e;',
''))
,p_lov_display_null=>'YES'
,p_colspan=>3
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124970955979206744)
,p_name=>'P8_OPRCION_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(124970730990206742)
,p_prompt=>unistr('Tipo de Operaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:Registro;I,Actualizaci\00F3n;U,Eliminaci\00F3n;D')
,p_lov_display_null=>'YES'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124971190323206746)
,p_name=>'P8_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(124970730990206742)
,p_prompt=>'Fecha Inicio'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996592171317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(124971285466206747)
,p_name=>'P8_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(124970730990206742)
,p_prompt=>'Fecha Fin'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996592171317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(168983380858322103)
,p_name=>'P8_USRIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(124970730990206742)
,p_prompt=>'Usuario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_trcro,',
'		a.user_name  ',
'   from v_sg_g_usuarios a',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'order by nmbre_trcro'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172280717577314801)
,p_name=>'P8_OLD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(124970730990206742)
,p_prompt=>'Registro Anterior'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172280805682314802)
,p_name=>'P8_NEW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(124970730990206742)
,p_prompt=>'Registro Actual'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172280947380314803)
,p_name=>'P8_NMBRE_CMPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(124970730990206742)
,p_prompt=>'Columna'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select column_name col1 ,column_name col2 ',
'from all_tab_columns a ',
'where a.owner = sys_context( ''userenv'', ''current_schema'' )',
'  and table_name = :P8_NMBRE_TBLA'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P8_NMBRE_TBLA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48968221804095808)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sincronizar '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_flow_id   number;',
'    v_region_id number;',
'    v_query     clob; ',
'    v_id        number;',
'',
'begin',
'    lock table apex_190100.wwv_flow_worksheet_columns  in exclusive mode;',
'    v_query := pkg_ad_auditoria.fnc_co_tabla_auditoria(p_nmbre_tbla => :P8_NMBRE_TBLA, p_tpo_oprcion => :P8_OPRCION_TPO, p_fcha_incio => :P8_FCHA_INCIO, p_fcha_fin => :P8_FCHA_FIN, p_id_usrio => :P8_USRIO);',
'    --wwv_flow_api.set_security_group_id(apex_util.find_security_group_id(''INFORTRIBUTOS''));',
'',
'    select application_id',
'         , region_id',
'      into v_flow_id',
'         , v_region_id',
'      from apex_application_page_ir',
'     where page_id = :APP_PAGE_ID ',
'       and application_id = :APP_ID       ',
'       and region_name = ''auditoria de tablas'';',
'',
'    apex_190100.wwv_flow_worksheet_standard.synch_report_columns( p_flow_id                     => v_flow_id',
'                                                                , p_region_id                   => v_region_id',
'                                                                , p_query                       => v_query',
'                                                                , p_add_new_cols_to_default_rpt => ''Y'');',
'       ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(124971044685206745)
);
end;
/
