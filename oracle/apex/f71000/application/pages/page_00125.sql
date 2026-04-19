prompt --application/pages/page_00125
begin
wwv_flow_api.create_page(
 p_id=>125
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Informe de Registro de Recaudo Manual'
,p_step_title=>'Informe de Registro de Recaudo Manual'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_css_classes=>'parametroBusqueda1'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_upd_yyyymmddhh24miss=>'20200725113320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4864353599930701)
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
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4864539838930703)
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
'<i>',
'Funcionalidad que permite: <br><br>',
'',
'<b>1.</b> Crear un nuevo registro de recaudo manual.<br><br>',
unistr('<b>2.</b> Visualizar la informaci\00F3n de los registros de recaudo manual.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4864660773930704)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
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
 p_id=>wwv_flow_api.id(4865844569930716)
,p_plug_name=>'<b>Informe de Registro de Pago Manual</b>'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select a.id_rcdo_cntrol',
'         , a.dscrpcion_bnco',
'         , a.nmro_cnta',
'         , a.obsrvcion',
'         , a.fcha_cntrol',
'         , a.fcha_rgstro',
'         , to_char( a.vlor_rcdos , :F_FRMTO_MNDA ) as vlor_rcdos',
'         , a.cntdad_rcdos',
'         , a.id_bnco',
'         , a.id_bnco_cnta',
'         , a.user_name || '' - '' || a.nmbre_trcro as user_nmbre_trcro',
'         , case when b.cntdad is null and cntdad_rcdos <> 0 then',
'                 ''<span aria-hidden="true" class="fa fa-eye" style="font-size: 20px;"></span>'' ',
'                else ',
'                 ''<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'' ',
'           end as link',
'         , case when b.cntdad is null and cntdad_rcdos <> 0 then',
'                ''title="Ver"'' ',
'                else ',
'                ''title="Editar"'' ',
'           end as attribute ',
'         , case when b.cntdad is null and cntdad_rcdos <> 0 then',
'                ''Finalizado''',
'                else ',
'                ''Iniciado'' ',
'           end as estdo ',
'      from v_re_g_recaudos_control a',
' left join (',
'             select count(*) as cntdad',
'                  , id_rcdo_cntrol',
'               from v_re_g_recaudos ',
'              where cdgo_rcdo_estdo = ''IN''',
'           group by id_rcdo_cntrol',
'         ) b   ',
'        on a.id_rcdo_cntrol    = b.id_rcdo_cntrol',
'     where a.cdgo_rcdo_orgen   = ''MN''',
'       and a.cdgo_clnte        = :F_CDGO_CLNTE',
'       and a.id_impsto         = nvl( :P125_ID_IMPSTO , a.id_impsto )',
'       and a.id_impsto_sbmpsto = nvl( :P125_ID_IMPSTO_SBMPSTO , a.id_impsto_sbmpsto )',
'       and trunc( a.fcha_cntrol ) between :P125_FCHA_INCIO and :P125_FCHA_FIN',
'  order by a.fcha_cntrol desc'))
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
 p_id=>wwv_flow_api.id(4866011653930718)
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:131:&SESSION.::&DEBUG.:RP,131:P131_ID_RCDO_CNTROL,P131_BRANCH:#ID_RCDO_CNTROL#,&P131_BRANCH.'
,p_detail_link_text=>'#LINK#'
,p_detail_link_attr=>'#ATTRIBUTE#'
,p_owner=>'NARDILA'
,p_internal_uid=>4866011653930718
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4866212703930720)
,p_db_column_name=>'ID_RCDO_CNTROL'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00FAmero de Control')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4911648353328903)
,p_db_column_name=>'DSCRPCION_BNCO'
,p_display_order=>20
,p_column_identifier=>'L'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4866428524930722)
,p_db_column_name=>'NMRO_CNTA'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero de Cuenta')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4866636266930724)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4911774412328904)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913616001328923)
,p_db_column_name=>'ID_BNCO'
,p_display_order=>130
,p_column_identifier=>'Q'
,p_column_label=>unistr('Identificaci\00F3n Banco')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4913706845328924)
,p_db_column_name=>'ID_BNCO_CNTA'
,p_display_order=>140
,p_column_identifier=>'R'
,p_column_label=>'Id Bnco Cnta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13025700589507701)
,p_db_column_name=>'LINK'
,p_display_order=>150
,p_column_identifier=>'S'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13044008552773304)
,p_db_column_name=>'ATTRIBUTE'
,p_display_order=>160
,p_column_identifier=>'U'
,p_column_label=>'Attribute'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44973184374784901)
,p_db_column_name=>'FCHA_CNTROL'
,p_display_order=>170
,p_column_identifier=>'V'
,p_column_label=>'Fecha de Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44973390837784903)
,p_db_column_name=>'USER_NMBRE_TRCRO'
,p_display_order=>190
,p_column_identifier=>'X'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117428475878299022)
,p_db_column_name=>'CNTDAD_RCDOS'
,p_display_order=>210
,p_column_identifier=>'Z'
,p_column_label=>'Cantidad de Recaudos'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117429740028299035)
,p_db_column_name=>'VLOR_RCDOS'
,p_display_order=>220
,p_column_identifier=>'AA'
,p_column_label=>'Total Recaudos'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'F_FRMTO_MNDA'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117429881486299036)
,p_db_column_name=>'ESTDO'
,p_display_order=>230
,p_column_identifier=>'AB'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4899488743126100)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'48995'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ID_RCDO_CNTROL:NMRO_CNTA:OBSRVCION:DSCRPCION_BNCO:FCHA_CNTROL:FCHA_RGSTRO:USER_NMBRE_TRCRO:CNTDAD_RCDOS:VLOR_RCDOS:ESTDO:'
,p_sort_column_1=>'ID_RCDO_CNTROL'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'FCHA_RCDO'
,p_sort_direction_2=>'DESC'
,p_break_on=>'0:0:0:0:0:DSCRPCION_BNCO'
,p_break_enabled_on=>'0:0:0:0:0:DSCRPCION_BNCO'
,p_sum_columns_on_break=>'VLOR_TTAL:NMERO_RGSTRO:TTAL_CNTROL'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4864416461930702)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4864353599930701)
,p_button_name=>'Btn_Nuevo_Registro'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Registro'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:131:&SESSION.::&DEBUG.:RP,131:P131_BRANCH:&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4865792662930715)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4864660773930704)
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
 p_id=>wwv_flow_api.id(4864920532930707)
,p_name=>'P125_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4864660773930704)
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
 p_id=>wwv_flow_api.id(4865075270930708)
,p_name=>'P125_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4864660773930704)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'     , id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P125_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P125_ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(4865114873930709)
,p_name=>'P125_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4864660773930704)
,p_item_default=>'to_date( ''01/'' || to_char( sysdate,''MM/YYYY'')  , ''DD/MM/YYYY'' )'
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
 p_id=>wwv_flow_api.id(4865291662930710)
,p_name=>'P125_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4864660773930704)
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
,p_attribute_02=>'&P125_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4865532412930713)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P125_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4865641173930714)
,p_event_id=>wwv_flow_api.id(4865532412930713)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P125_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P125_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
