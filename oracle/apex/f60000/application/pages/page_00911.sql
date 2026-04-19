prompt --application/pages/page_00911
begin
wwv_flow_api.create_page(
 p_id=>911
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>'Usuarios'
,p_step_title=>'Usuarios'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'$(''#''+id).click();',
'}',
'}'))
,p_javascript_code_onload=>'//buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(29911946739317080)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20230116171226'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30999377231857511)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(55628721486594537)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center> Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    Funcionalidad donde se gestiona la informaci\00F3n los usuarios del sistema. '),
'    <br><br>',
'    En esta funcionalidad se permite:',
'    <ul>',
'        <li>Registrar un nuevo usuario</li>',
'        <li>Modificar un usuario</li>',
'        <li>Eliminar un usuario</li>',
unistr('        <li>Restablecer la contrase\00F1a del  usuario</li>'),
'    </ul>',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario. '),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(308780269855011680)
,p_plug_name=>'Usuarios'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.id_usrio,',
'	   u.user_name,',
'	   u.nmbre_trcro,',
'	   u.email,',
'	   u.fcha_crcion,',
'	   u.fcha_exprcion,',
'	   u.admin,',
'	   u.id_trcro,',
'       u.actvo',
'from v_sg_g_usuarios u',
'where cdgo_clnte = :F_CDGO_CLNTE',
'order by nmbre_trcro'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(308780655375011681)
,p_name=>'Usuarios'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:912:&SESSION.::&DEBUG.:RP,912:P912_ID_USRIO,P912_BRANCH,P912_ID_TRCRO:#ID_USRIO#,&APP_PAGE_ID.,#ID_TRCRO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'ADMIN'
,p_internal_uid=>308780655375011681
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103316271379267909)
,p_db_column_name=>'EMAIL'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'E-mail'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103313478130267903)
,p_db_column_name=>'ID_USRIO'
,p_display_order=>30
,p_column_identifier=>'J'
,p_column_label=>'.'
,p_column_link=>'f?p=&APP_ID.:915:&SESSION.::&DEBUG.:RP,915:P915_ID_USRIO,P915_USER_NAME:#ID_USRIO#,#USER_NAME#'
,p_column_linktext=>unistr('Cambiar<br>Contrase\00F1a')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103313854808267908)
,p_db_column_name=>'USER_NAME'
,p_display_order=>40
,p_column_identifier=>'K'
,p_column_label=>'Usuario'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103314210896267908)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>50
,p_column_identifier=>'L'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103314656745267908)
,p_db_column_name=>'FCHA_CRCION'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>unistr('Fecha Creaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103315063643267908)
,p_db_column_name=>'FCHA_EXPRCION'
,p_display_order=>70
,p_column_identifier=>'N'
,p_column_label=>unistr('Fecha Expiraci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103315459954267909)
,p_db_column_name=>'ADMIN'
,p_display_order=>80
,p_column_identifier=>'O'
,p_column_label=>unistr('\00BFUsuario <br> Administrador?')
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(103268656585132840)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61139904164039411)
,p_db_column_name=>'ID_TRCRO'
,p_display_order=>90
,p_column_identifier=>'R'
,p_column_label=>'Id Trcro'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9711699315351401)
,p_db_column_name=>'ACTVO'
,p_display_order=>100
,p_column_identifier=>'S'
,p_column_label=>'Actvo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(308783531113011688)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1033166'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_USRIO:USER_NAME:NMBRE_TRCRO:EMAIL:FCHA_CRCION:FCHA_EXPRCION:ADMIN::ID_TRCRO:ACTVO'
,p_sort_column_1=>'NMBRE_TRCRO'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103317021765267917)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(30999377231857511)
,p_button_name=>'Nuevo_Usuario'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Usuario'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:912:&SESSION.::&DEBUG.:RP,912:P912_BRANCH:&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103317454155267938)
,p_name=>'al cerrar CA_TERCERO'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(308780269855011680)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103317974311267942)
,p_event_id=>wwv_flow_api.id(103317454155267938)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(308780269855011680)
,p_stop_execution_on_error=>'Y'
);
end;
/
