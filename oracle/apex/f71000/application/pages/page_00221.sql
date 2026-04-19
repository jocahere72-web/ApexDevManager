prompt --application/pages/page_00221
begin
wwv_flow_api.create_page(
 p_id=>221
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro de Recaudo por Archivo Asobancaria'
,p_step_title=>'Registro de Recaudo por Archivo Asobancaria'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.col-3>.rel-col .col-1{',
'  padding: 0;',
'}',
'',
'.t-Form-inputContainer span.display_only {',
'    font-weight: 400;',
'    font-style: oblique;',
'}',
'',
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.t-Wizard{',
'  max-width: none;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'122333'
,p_last_upd_yyyymmddhh24miss=>'20200827161804'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61030286157511123)
,p_plug_name=>'Wizard Recaudo Asobancaria - Archivo'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(15959830319946441)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15962572991014802)
,p_plug_name=>'<b>Registro Procesados</b>'
,p_parent_plug_id=>wwv_flow_api.id(61030286157511123)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmero_lnea',
'     , a.cdgo_ean',
'     , a.nmro_dcmnto',
'     , a.vlor_rcdo as valor',
'     , a.fcha_rcdo',
unistr('     , decode( a.indcdor_rlzdo , ''S'' , ''S\00ED'' , ''N'' , ''No'' ) as dscrpcion_indcdor_rlzdo'),
'     , a.indcdor_rlzdo',
'     , a.mnsje_rspsta',
'  from table ( pkg_re_recaudos.fnc_co_datos_asobancaria( p_id_prcso_crga     => :P221_ID_PRCSO_CRGA ',
'                                                       , p_cdgo_tpo_asbncria => :P221_CDGO_TPO_ASBNCRIA )) a'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from et_g_procesos_carga',
' where id_prcso_crga  = :P221_ID_PRCSO_CRGA',
'   and indcdor_prcsdo = ''S'''))
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
 p_id=>wwv_flow_api.id(15962613003014803)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay registro por mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>15962613003014803
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15962775789014804)
,p_db_column_name=>'NMERO_LNEA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero de Linea')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15962850001014805)
,p_db_column_name=>'CDGO_EAN'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Codigo EAN'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15962913570014806)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00FAmero de Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15963022651014807)
,p_db_column_name=>'VALOR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Recaudo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15963112726014808)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15963248342014809)
,p_db_column_name=>'DSCRPCION_INDCDOR_RLZDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Indicador Realizado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15963381349014810)
,p_db_column_name=>'INDCDOR_RLZDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Indicador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15963470740014811)
,p_db_column_name=>'MNSJE_RSPSTA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Mensaje'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(15971148218502130)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'159712'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMERO_LNEA:CDGO_EAN:NMRO_DCMNTO:VALOR:FCHA_RCDO:DSCRPCION_INDCDOR_RLZDO:MNSJE_RSPSTA:'
,p_sort_column_1=>'NMERO_LNEA'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'VALOR'
,p_count_columns_on_break=>'NMERO_LNEA'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(88006545214659136)
,p_report_id=>wwv_flow_api.id(15971148218502130)
,p_name=>'Inconsistencias'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'INDCDOR_RLZDO'
,p_operator=>'='
,p_expr=>'N'
,p_condition_sql=>' (case when ("INDCDOR_RLZDO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''N''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FF7755'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(88006146540659136)
,p_report_id=>wwv_flow_api.id(15971148218502130)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'DSCRPCION_INDCDOR_RLZDO'
,p_operator=>'='
,p_expr=>'No'
,p_condition_sql=>'"DSCRPCION_INDCDOR_RLZDO" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''No''  '
,p_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15963604833014813)
,p_plug_name=>'<b>Cantidad</b>'
,p_parent_plug_id=>wwv_flow_api.id(61030286157511123)
,p_region_css_classes=>'badgeListColor1'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>5
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select to_number( pkg_re_recaudos.fnc_co_valor_asobancaria( p_tpo_rgstro           => a.tpo_rgstro',
'                                                            , p_cdgo_tpo_asbncria    => :P221_CDGO_TPO_ASBNCRIA',
'                                                            , p_cdgo_atrbto_asbncria => ''TTAL_RGSTROS_RCDO_ARCHVO''',
'                                                            , p_lnea                 => a.lnea )) as value',
'       , ''Cantidad de Recaudos'' as label  ',
'    from re_g_recaudos_asobancaria a ',
'   where id_prcso_crga = :P221_ID_PRCSO_CRGA',
'     and tpo_rgstro    = ''09''',
'order by nmero_lnea'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from et_g_procesos_carga',
' where id_prcso_crga  = :P221_ID_PRCSO_CRGA',
'   and indcdor_prcsdo = ''S'''))
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15963719491014814)
,p_plug_name=>'<b>Valor</b>'
,p_parent_plug_id=>wwv_flow_api.id(61030286157511123)
,p_region_css_classes=>'badgeListColor2'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>5
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select to_char( pkg_re_recaudos.fnc_co_valor_asobancaria( p_tpo_rgstro           => a.tpo_rgstro',
'                                                          , p_cdgo_tpo_asbncria    => :P221_CDGO_TPO_ASBNCRIA',
'                                                          , p_cdgo_atrbto_asbncria => ''VLOT_TTAL_RCDO_ARCHVO''',
'                                                          , p_lnea                 => a.lnea ) , ''FM$999G999G999G999G999G999G990'') as value',
'       , ''Valor Total de Recaudos'' as label  ',
'    from re_g_recaudos_asobancaria a ',
'   where id_prcso_crga = :P221_ID_PRCSO_CRGA',
'     and tpo_rgstro    = ''09''',
'order by nmero_lnea'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from et_g_procesos_carga',
' where id_prcso_crga  = :P221_ID_PRCSO_CRGA',
'   and indcdor_prcsdo = ''S'''))
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213222414414200485)
,p_plug_name=>'<b>Procesar Archivo</b>'
,p_parent_plug_id=>wwv_flow_api.id(61030286157511123)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from et_g_procesos_carga',
' where id_prcso_crga  = :P221_ID_PRCSO_CRGA',
'   and indcdor_prcsdo = ''S'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110035877396316390)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(110038477173325257)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'  Funcionalidad que permite procesar y registrar los recaudos por archivo asobancaria.<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15080256233942172)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(110035877396316390)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:&P221_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(118804567925055102)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(110035877396316390)
,p_button_name=>'Btn_Procesar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select 1',
'    from et_g_procesos_carga',
'   where id_prcso_crga  = :P221_ID_PRCSO_CRGA',
'     and indcdor_prcsdo = ''S''',
'  having count(*) = 0'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61311196003841932)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(110035877396316390)
,p_button_name=>'Btn_Eliminar_Archivo'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar Archivo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de eliminar el archivo asobancaria?'',''Btn_Eliminar_Archivo'')'
,p_button_condition=>'&P221_ID_PRCSO_CRGA.'
,p_button_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61311581427841936)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(110035877396316390)
,p_button_name=>'Btn_Eliminar_Proceso'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar Proceso'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de eliminar el proceso?'',''Btn_Eliminar_Proceso'')'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from re_g_recaudos a',
'    where a.id_rcdo_cntrol  = :P221_ID_RCDO_CNTROL',
'      and a.cdgo_rcdo_estdo <> ''IN''',
'   having count(*) = 0 ',
'      and :P221_ID_RCDO_CNTROL is not null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15954822396916978)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(61030286157511123)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:155:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15955248551916988)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(61030286157511123)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'&P221_ID_PRCSO_CRGA.'
,p_button_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(15994937947958801)
,p_branch_name=>'Go To Page 263'
,p_branch_action=>'f?p=&APP_ID.:263:&SESSION.::&DEBUG.:RP:P263_ID_RCDO_CNTROL:&P221_ID_RCDO_CNTROL.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(15955248551916988)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(61311212112841933)
,p_branch_name=>'Go To Page 155'
,p_branch_action=>'f?p=&APP_ID.:155:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'Btn_Eliminar_Archivo,Btn_Eliminar_Proceso'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(61311960724841940)
,p_branch_name=>'Go To Page 221'
,p_branch_action=>'f?p=&APP_ID.:221:&SESSION.:&P221_ID_PRCSO_CRGA.:&DEBUG.:221:P221_ID_PRCSO_CRGA,P221_BRANCH,P221_CDGO_TPO_ASBNCRIA:&P221_ID_PRCSO_CRGA.,155,&P221_CDGO_TPO_ASBNCRIA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(118804567925055102)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from re_g_recaudos_asobancaria  a',
'  where a.id_prcso_crga = :P221_ID_PRCSO_CRGA',
'    and a.tpo_rgstro    = ''06''',
'    and a.indcdor_rlzdo = ''S''',
' having count(*) = 0 ',
'    and :P221_ID_PRCSO_CRGA is not null'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59128137668644511)
,p_name=>'P221_CDGO_TPO_ASBNCRIA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(213222414414200485)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_tpo_asbncria varchar2(30);',
'begin',
'    ',
'    v_cdgo_tpo_asbncria := pkg_gn_generalidades.fnc_cl_defniciones_cliente ( p_cdgo_clnte 				 => :F_CDGO_CLNTE',
'                                                                           , p_cdgo_dfncion_clnte_ctgria => pkg_re_recaudos.c_cdgo_dfncion_clnte_ctgria',
'                                                                           , p_cdgo_dfncion_clnte		 => ''AXD'' );',
'',
'    ',
'    v_cdgo_tpo_asbncria := nvl( v_cdgo_tpo_asbncria , ''-1'' );',
'    ',
'    if( v_cdgo_tpo_asbncria = ''-1'' ) then ',
'        return null;',
'    end if;',
'    ',
'    return v_cdgo_tpo_asbncria;',
'    ',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Tipo Asobancaria'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select dscrpcion as l',
'         , cdgo_tpo_asbncria as k',
'      from re_d_tipos_asobancaria',
'  order by 2'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_tpo_asbncria varchar2(30);',
'begin',
'    ',
'    v_cdgo_tpo_asbncria := pkg_gn_generalidades.fnc_cl_defniciones_cliente ( p_cdgo_clnte 				 => :F_CDGO_CLNTE',
'                                                                           , p_cdgo_dfncion_clnte_ctgria => pkg_re_recaudos.c_cdgo_dfncion_clnte_ctgria',
'                                                                           , p_cdgo_dfncion_clnte		 => ''AXD'' );',
'',
'    ',
'    v_cdgo_tpo_asbncria := nvl( v_cdgo_tpo_asbncria , ''-1'' );',
'    ',
'    if( v_cdgo_tpo_asbncria = ''-1'' ) then ',
'        return false;',
'    else',
'        return true;',
'    end if;',
'    ',
'end;'))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipo de Asobancaria'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118813099264087494)
,p_name=>'P221_ID_BNCO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(213222414414200485)
,p_prompt=>'Banco:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_BANCOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and rcddor = ''S''',
'  order by cdgo_bnco'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Banco'
,p_display_when=>'&P221_ID_PRCSO_CRGA.'
,p_display_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'280'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118813495222087494)
,p_name=>'P221_ID_BNCO_CNTA'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(213222414414200485)
,p_prompt=>'Cuenta de Banco:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmro_cnta as d',
'       , id_bnco_cnta as r',
'    from df_c_bancos_cuenta',
'   where id_bnco    = :P221_ID_BNCO',
'order by nmro_cnta'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Cuenta'
,p_lov_cascade_parent_items=>'P221_ID_BNCO'
,p_ajax_items_to_submit=>'P221_ID_BNCO,P221_ID_BNCO_CNTA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_display_when=>'&P221_ID_PRCSO_CRGA.'
,p_display_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118814266139087494)
,p_name=>'P221_ID_RCDO_CNTROL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(213222414414200485)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118814688553087494)
,p_name=>'P221_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(213222414414200485)
,p_prompt=>unistr('Observaci\00F3n:')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>110
,p_cMaxlength=>1000
,p_cHeight=>1
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_display_when=>'&P221_ID_PRCSO_CRGA.'
,p_display_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('<i>Observaci\00F3n acerca del lote</i>')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118815524105087503)
,p_name=>'P221_BRANCH'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(213222414414200485)
,p_item_default=>'125'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118824653218118701)
,p_name=>'P221_ID_PRCSO_CRGA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(213222414414200485)
,p_prompt=>'Archivo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.file_name || ''  |  '' || to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || a.nmbre_trcro as d',
'       , a.id_prcso_crga as r',
'    from v_et_g_procesos_carga a',
'   where id_prcso_crga in (  ',
'                                select a.id_prcso_crga',
'                                  from re_g_recaudos_asobancaria a',
'                                  join et_g_procesos_carga b',
'                                    on a.id_prcso_crga = b.id_prcso_crga',
'                                 where b.cdgo_clnte    = :F_CDGO_CLNTE',
'                                   and a.tpo_rgstro    = ''01''',
'                              group by a.id_prcso_crga',
'                          )',
'     and ( indcdor_prcsdo = ''N'' or :P221_ID_PRCSO_CRGA is not null )',
'order by a.id_prcso_crga'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Archivo'
,p_colspan=>8
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Archivo Asobancaria cargado por el modulo de etl.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15963596342014812)
,p_validation_name=>'Validar Recaudo Control'
,p_validation_sequence=>10
,p_validation=>'P221_ID_RCDO_CNTROL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Se debe procesar el archivo para poder continuar.'
,p_when_button_pressed=>wwv_flow_api.id(15955248551916988)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59128061067644510)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Control'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    --Busca los Datos del Control',
'    select a.id_bnco    ',
'         , a.id_bnco_cnta',
'         , a.obsrvcion',
'      into :P221_ID_BNCO',
'         , :P221_ID_BNCO_CNTA',
'         , :P221_OBSRVCION',
'      from re_g_recaudos_control a',
'     where a.id_rcdo_cntrol = :P221_ID_RCDO_CNTROL;',
'     ',
'    --Busca el Tipo de Asonbancaria',
'    select a.cdgo_tpo_asbncria',
'      into :P221_CDGO_TPO_ASBNCRIA',
'      from re_g_recaudos_asobancaria a',
'     where a.id_prcso_crga = :P221_ID_PRCSO_CRGA',
'     fetch first 1 row only;',
'         ',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P221_ID_RCDO_CNTROL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(118804771561055104)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'begin',
'    --Registro Asobancaria',
'    pkg_re_recaudos.prc_rg_recaudos_asobancaria( p_id_usrio          => :F_ID_USRIO',
'                                               , p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                               , p_id_bnco           => :P221_ID_BNCO ',
'                                               , p_id_bnco_cnta      => :P221_ID_BNCO_CNTA',
'                                               , p_obsrvcion         => :P221_OBSRVCION',
'                                               , p_id_prcso_crga     => :P221_ID_PRCSO_CRGA ',
'                                               , p_cdgo_tpo_asbncria => :P221_CDGO_TPO_ASBNCRIA',
'                                               , o_id_rcdo_cntrol    => :P221_ID_RCDO_CNTROL',
'                                               , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                               , o_mnsje_rspsta      => v_mnsje_rspsta );',
'    ',
'    if( v_cdgo_rspsta <> 0 ) then',
'       raise_application_error( -20001 , v_mnsje_rspsta );',
'    end if;                       ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(118804567925055102)
,p_process_success_message=>unistr('Archivo procesado con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(61311428407841935)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Archivo Asobancaria'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    delete re_g_recaudos_asobancaria ',
'     where id_prcso_crga = :P221_ID_PRCSO_CRGA;',
'    ',
'    delete et_g_procesos_carga_error ',
'     where id_prcso_crga = :P221_ID_PRCSO_CRGA;',
'    ',
'    delete et_g_procesos_carga_traza ',
'     where id_prcso_crga = :P221_ID_PRCSO_CRGA;',
'    ',
'    delete et_g_procesos_intermedia ',
'     where id_prcso_crga = :P221_ID_PRCSO_CRGA;',
'    ',
'    delete et_g_procesos_carga',
'     where id_prcso_crga = :P221_ID_PRCSO_CRGA;',
'',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(61311196003841932)
,p_process_success_message=>unistr('Archivo eliminado con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(61311614088841937)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Proceso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  ',
'    update re_g_recaudos_asobancaria',
'       set cdgo_tpo_asbncria = null ',
'         , id_rcdo           = null',
'         , indcdor_rlzdo     = ''N''',
'         , mnsje_rspsta      = null',
'     where id_prcso_crga     = :P221_ID_PRCSO_CRGA',
'       and tpo_rgstro        = ''06'';',
'     ',
'    delete re_g_recaudos ',
'     where id_rcdo_cntrol = :P221_ID_RCDO_CNTROL;',
'       ',
'    delete re_g_recaudos_control',
'     where id_rcdo_cntrol = :P221_ID_RCDO_CNTROL;',
'     ',
'    update et_g_procesos_carga',
'       set indcdor_prcsdo = ''N''',
'     where id_prcso_crga  = :P221_ID_PRCSO_CRGA; ',
'       ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(61311581427841936)
,p_process_success_message=>unistr('Proceso eliminado con \00E9xito.')
);
end;
/
