prompt --application/pages/page_00191
begin
wwv_flow_api.create_page(
 p_id=>191
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Informe de Aplicaci\00F3n de Recaudos')
,p_step_title=>unistr('Consulta Aplicaci\00F3n de Recaudos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'    font-weight: 700;',
'}',
'',
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}',
'',
'/*',
'.a-MediaBlock{',
'    display:none; ',
'}',
'',
'*/'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250130162951'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45960008320474004)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
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
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49396371159671562)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
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
'    Funcionalidad que permite: <br/><br/>',
unistr('    <b>1.</b> Visualizar la informaci\00F3n de los recaudos aplicados.<br/><br/>'),
'    ',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49396492094671563)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_css_classes=>'parametroBusqueda1'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49397675890671575)
,p_plug_name=>unistr('<b>Informe de Aplicaci\00F3n de Recaudos</b>')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select b.dscrpcion_sjto_tpo ',
'         , b.idntfccion_sjto',
'         , b.dscrpcion_rcdo_orgn_tpo',
'         , b.nmro_dcmnto',
'         , b.fcha_rcdo',
'         , b.vlor',
'         , b.fcha_apliccion',
'         , a.dscrpcion_bnco',
'         , a.nmro_cnta',
'         , b.dscrpcion_rcdo_estdo',
'         , a.dscrpcion_orgen',
'         , a.id_rcdo_cntrol',
'         , b.id_rcdo',
'         , c.idntfccion',
'         , c.nmbre_trcro ',
'      from v_re_g_recaudos_control a',
'      join v_re_g_recaudos b',
'        on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'      join v_sg_g_usuarios c',
'        on b.id_usrio_aplco = c.id_usrio ',
'     where b.cdgo_rcdo_estdo   = ''AP''',
'       and a.cdgo_clnte        = :F_CDGO_CLNTE',
'       and a.id_impsto         = nvl( :P191_ID_IMPSTO , a.id_impsto )',
'       and a.id_impsto_sbmpsto = nvl( :P191_ID_IMPSTO_SBMPSTO , a.id_impsto_sbmpsto )',
'       and trunc(b.fcha_rcdo) between :P191_FCHA_INCIO and :P191_FCHA_FIN',
'  order by a.dscrpcion_orgen',
'         , a.id_rcdo_cntrol',
'         , b.fcha_apliccion desc',
'         , b.vlor desc'))
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
 p_id=>wwv_flow_api.id(49397842974671577)
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP:P11_ID_RCDO:#ID_RCDO#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_detail_link_attr=>'title="Ver"'
,p_owner=>'NARDILA'
,p_internal_uid=>49397842974671577
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44539281719740875)
,p_db_column_name=>'DSCRPCION_BNCO'
,p_display_order=>20
,p_column_identifier=>'L'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44537296613740874)
,p_db_column_name=>'NMRO_CNTA'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero de Cuenta')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44537684483740874)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Fecha Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44523840766715202)
,p_db_column_name=>'DSCRPCION_SJTO_TPO'
,p_display_order=>50
,p_column_identifier=>'V'
,p_column_label=>'Tipo Sujeto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44523932527715203)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>60
,p_column_identifier=>'W'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44524070864715204)
,p_db_column_name=>'DSCRPCION_RCDO_ORGN_TPO'
,p_display_order=>70
,p_column_identifier=>'X'
,p_column_label=>'Origen'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44524111043715205)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>80
,p_column_identifier=>'Y'
,p_column_label=>unistr('N\00FAmero')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44524237458715206)
,p_db_column_name=>'VLOR'
,p_display_order=>90
,p_column_identifier=>'Z'
,p_column_label=>'Valor Recaudo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44524397403715207)
,p_db_column_name=>'FCHA_APLICCION'
,p_display_order=>100
,p_column_identifier=>'AA'
,p_column_label=>unistr('Fecha Aplicaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44524437888715208)
,p_db_column_name=>'DSCRPCION_RCDO_ESTDO'
,p_display_order=>110
,p_column_identifier=>'AB'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44524570195715209)
,p_db_column_name=>'DSCRPCION_ORGEN'
,p_display_order=>120
,p_column_identifier=>'AC'
,p_column_label=>'Origen Recaudo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44524657721715210)
,p_db_column_name=>'ID_RCDO_CNTROL'
,p_display_order=>130
,p_column_identifier=>'AD'
,p_column_label=>unistr('N\00FAmero de Control')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25029632226237106)
,p_db_column_name=>'ID_RCDO'
,p_display_order=>140
,p_column_identifier=>'AE'
,p_column_label=>unistr('N\00B0 de Recaudo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74944881013546201)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>150
,p_column_identifier=>'AF'
,p_column_label=>unistr('Funcionario que Aplic\00F3')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74944920516546202)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>160
,p_column_identifier=>'AG'
,p_column_label=>unistr('Identificaci\00F3n que Aplic\00F3')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(49431320063866959)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'445428'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RCDO_CNTROL:ID_RCDO:DSCRPCION_RCDO_ORGN_TPO:NMRO_DCMNTO:DSCRPCION_SJTO_TPO:IDNTFCCION_SJTO:FCHA_RCDO:FCHA_APLICCION:DSCRPCION_BNCO:NMRO_CNTA:DSCRPCION_RCDO_ESTDO:VLOR:DSCRPCION_ORGEN:IDNTFCCION:NMBRE_TRCRO:'
,p_sort_column_1=>'ID_RCDO_CNTROL'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'ID_RCDO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'FCHA_RCDO'
,p_sort_direction_3=>'DESC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'0:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:0'
,p_sum_columns_on_break=>'VLOR_TTAL:NMERO_RGSTRO:VLOR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44532538348740868)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(45960008320474004)
,p_button_name=>'Btn_Aplicar_Pagos'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Recaudos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:192:&SESSION.::&DEBUG.:RP,192:P192_BRANCH,P192_ID_IMPSTO,P192_ID_IMPSTO_SBMPSTO:&APP_PAGE_ID.,&P191_ID_IMPSTO.,&P191_ID_IMPSTO_SBMPSTO.'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44533573919740869)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(49396492094671563)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44533998284740869)
,p_name=>'P191_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(49396492094671563)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de lista el Tributo a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'277'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44534384223740870)
,p_name=>'P191_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(49396492094671563)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto_sbmpsto  as d,',
'       b.id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto b',
' where b.cdgo_clnte = :F_CDGO_CLNTE ',
'   and b.id_impsto = :P191_ID_IMPSTO',
'   and (exists (select 1',
'                  from sg_g_usuarios_subimpuesto a',
'                 where a.id_usrio = :F_ID_USRIO',
'                   and a.id_impsto = b.id_impsto',
'                   and a.id_impsto_sbmpsto = b.id_impsto_sbmpsto) or',
'        (select count(*)',
'                  from sg_g_usuarios_subimpuesto a',
'                 where a.id_usrio = :F_ID_USRIO',
'                   and a.id_impsto = b.id_impsto) = 0)',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P191_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de lista el Sub-Tributo a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'277'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61694285364567768)
,p_name=>'P191_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(49396492094671563)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Inicio:'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha inicio de recaudo.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61695052868569920)
,p_name=>'P191_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(49396492094671563)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Fin:'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha fin de recaudo.'
,p_attribute_02=>'&P191_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61695985324584401)
,p_name=>'Al Cambiar Fecha de Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P191_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61696032807584402)
,p_event_id=>wwv_flow_api.id(61695985324584401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P191_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P191_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44543284951740881)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpia Cache Sesion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_is_stateful_y_n=>'Y'
);
end;
/
