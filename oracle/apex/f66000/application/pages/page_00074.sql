prompt --application/pages/page_00074
begin
wwv_flow_api.create_page(
 p_id=>74
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Recaudos por cuenta bancaria de los conceptos asociados'
,p_step_title=>'Recaudos por cuenta bancaria de los conceptos asociados'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'  font-weight: 700;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(35889268125293441)
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250401113807'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5065454352697102)
,p_plug_name=>'Recaudos por cuenta bancaria de los conceptos asociados'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35741315331290409)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  f.nmbre_impsto_acto,',
'        a.dscrpcion_cncpto, ',
'        d.id_bnco,',
'        d.nmbre_bnco, ',
'        d.nmro_cnta,',
'        TRUNC(sum(a.vlor_cptal)) as vlor_cptal, ',
'        TRUNC(sum(a.vlor_intres)) as vlor_intres, ',
'        TRUNC(sum(a.vlor_ttal)) as vlor_ttal',
'from  v_re_g_recaudos_detalle a',
'join  re_g_recaudos_control b on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'join  df_i_cncpto_bncos_cnta c on a.id_cncpto = c.id_cncpto',
'join  v_df_c_bancos_cuenta d on  d.id_bnco_cnta = c.id_bnco_cnta',
'join  df_i_impuestos_acto_concepto e on e.id_impsto_acto_cncpto = a.id_impsto_acto_cncpto',
'join  df_i_impuestos_acto f on f.id_impsto_acto = e.id_impsto_acto',
'where trunc(a.fcha_rcdo) between :P74_FCHA_INCIO and :P74_FCHA_FIN',
'  and b.id_impsto = nvl(:P74_ID_IMPSTO, b.id_impsto)',
'  and b.id_impsto_sbmpsto = nvl(:P74_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'  and d.id_bnco = nvl(:P74_ID_BNCO, d.id_bnco)',
'  and e.id_impsto_acto = nvl(:P74_ID_ACTO, e.id_impsto_acto)',
'  and b.cdgo_rcdo_orgen not in (''WS'') --Pagos PSE',
'group by f.nmbre_impsto_acto, a.dscrpcion_cncpto, d.id_bnco, d.nmbre_bnco, d.nmro_cnta;  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from  v_re_g_recaudos_detalle a',
'join  re_g_recaudos_control b on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'join  df_i_cncpto_bncos_cnta c on a.id_cncpto = c.id_cncpto',
'join  v_df_c_bancos_cuenta d on  d.id_bnco_cnta = c.id_bnco_cnta',
'join  df_i_impuestos_acto_concepto e on e.id_impsto_acto_cncpto = a.id_impsto_acto_cncpto',
'join  df_i_impuestos_acto f on f.id_impsto_acto = e.id_impsto_acto',
'where trunc(a.fcha_rcdo) between :P74_FCHA_INCIO and :P74_FCHA_FIN',
'  and b.id_impsto = nvl(:P74_ID_IMPSTO, b.id_impsto)',
'  and b.id_impsto_sbmpsto = nvl(:P74_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'  and d.id_bnco = nvl(:P74_ID_BNCO, d.id_bnco)',
'  and e.id_impsto_acto = nvl(:P74_ID_ACTO, e.id_impsto_acto)'))
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
 p_id=>wwv_flow_api.id(5066582770697113)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>5066582770697113
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5066646577697114)
,p_db_column_name=>'NMBRE_IMPSTO_ACTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Impuesto Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5066785682697115)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5066821293697116)
,p_db_column_name=>'ID_BNCO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Bnco'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5066972403697117)
,p_db_column_name=>'NMBRE_BNCO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5067062314697118)
,p_db_column_name=>'NMRO_CNTA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'No. Cuenta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5067166247697119)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5067286917697120)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5067382035697121)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6987612240720961)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69877'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_BNCO:NMBRE_IMPSTO_ACTO:DSCRPCION_CNCPTO:NMRO_CNTA:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL:'
,p_break_on=>'NMBRE_BNCO:0:0:0:0:0'
,p_break_enabled_on=>'NMBRE_BNCO:0:0:0:0:0'
,p_sum_columns_on_break=>'VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(247331453897397305)
,p_plug_name=>'Reportes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5066441163697112)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(247331453897397305)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(149446761435255546)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(247331453897397305)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir PDF'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(149446304043255538)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(247331453897397305)
,p_button_name=>'Btn_Imprimir_excel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir Excel'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(149452406775255600)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P74_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(149446761435255546)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(149452858240255603)
,p_branch_name=>'Imprimir excel'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE,P37_TIPO:&P74_ID_RPRTE.,xls&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(149446304043255538)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149166726966264107)
,p_name=>'P74_ID_ACTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(247331453897397305)
,p_prompt=>'Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_acto as d,',
'       id_impsto_acto as r        ',
' from v_df_i_impuestos_acto ',
'where id_impsto         = :P74_ID_IMPSTO',
'  and id_impsto_sbmpsto = :P74_ID_IMPSTO_SBMPSTO',
'order by 1;',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P74_ID_IMPSTO,P74_ID_IMPSTO_SBMPSTO'
,p_ajax_items_to_submit=>'P74_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149447199607255549)
,p_name=>'P74_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(247331453897397305)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" ondblclick="this.value=''''"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149447518212255573)
,p_name=>'P74_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(247331453897397305)
,p_prompt=>'Fecha Fin'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P74_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149447945229255573)
,p_name=>'P74_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(247331453897397305)
,p_prompt=>'Tributo'
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
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149448234097255574)
,p_name=>'P74_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(247331453897397305)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto_sbmpsto  as d,',
'       b.id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto b',
' where b.cdgo_clnte = :F_CDGO_CLNTE ',
'   and b.id_impsto = :P74_ID_IMPSTO',
'   and (exists (select 1',
'                  from sg_g_usuarios_subimpuesto a',
'                 where a.id_usrio = :F_ID_USRIO',
'                   and a.id_impsto = b.id_impsto',
'                   and a.id_impsto_sbmpsto = b.id_impsto_sbmpsto) or',
'        (select count(*)',
'                  from sg_g_usuarios_subimpuesto a',
'                 where a.id_usrio = :F_ID_USRIO',
'                   and a.id_impsto = b.id_impsto) = 0)',
' order by 1',
' ',
' ',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P74_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149448604478255574)
,p_name=>'P74_ID_BNCO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(247331453897397305)
,p_prompt=>'Banco'
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
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149449018935255575)
,p_name=>'P74_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(247331453897397305)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ',
'     , id_rprte r   ',
'  from gn_d_reportes',
' where cdgo_rprte_grpo = ''RDS'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Reporte'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149449461216255575)
,p_name=>'P74_XML'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(247331453897397305)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149449864510255575)
,p_name=>'P74_JSON'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(247331453897397305)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(149450269221255575)
,p_name=>'P74_ID_RPRTE_PRMTRO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(247331453897397305)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(149451427732255590)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P74_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(149451998417255596)
,p_event_id=>wwv_flow_api.id(149451427732255590)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P74_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P74_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149450628032255587)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte             gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t(); ',
'     v_id_rprte_prmtro         gn_t_reportes_parametro.id_rprte_prmtro%type;',
'     v_json                    clob;',
'begin          ',
'    ',
'    --:P74_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P74_ID_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
'    ',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P74_ID_RPRTE;',
' ',
'    v_object.put(''fcha_incial'', :P74_FCHA_INCIO);',
'    v_object.put(''fcha_fnal'', :P74_FCHA_FIN);   ',
'    v_object.put(''id_impsto'', :P74_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbmpsto'', :P74_ID_IMPSTO_SBMPSTO);',
'    v_object.put(''id_bnco'', :P74_ID_BNCO);',
'    v_object.put(''id_impsto_acto'', :P74_ID_ACTO);',
'    v_object.put(''nmbre_rprte'', v_nmbre_rprte);',
'         ',
'    v_json   := v_object.to_clob();',
'    insert into muerto(c_001, t_001) values(v_json, systimestamp);',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'    /*:P74_JSON := v_object.to_clob();',
'    ',
'    insert into gn_t_reportes_parametro( id_rprte_prmtro    , dta    )',
'                                 values(:P74_ID_RPRTE_PRMTRO , v_json );',
'    commit;     ',
'     */',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(149446761435255546)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(149451059710255589)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar JSON_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte             gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t(); ',
'     v_id_rprte_prmtro         gn_t_reportes_parametro.id_rprte_prmtro%type;',
'     v_json                    clob;',
'begin          ',
'    ',
'    --:P74_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P74_ID_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
'    ',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P74_ID_RPRTE;',
' ',
'    v_object.put(''fcha_incial'', :P74_FCHA_INCIO);',
'    v_object.put(''fcha_fnal'', :P74_FCHA_FIN);   ',
'    v_object.put(''id_impsto'', :P74_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbmpsto'', :P74_ID_IMPSTO_SBMPSTO);',
'    v_object.put(''id_bnco'', :P74_ID_BNCO);',
'    v_object.put(''nmbre_rprte'', v_nmbre_rprte);',
'         ',
'    v_json   := v_object.to_clob;  ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'    /*:P74_JSON := v_object.to_clob();',
'    ',
'    insert into gn_t_reportes_parametro( id_rprte_prmtro    , dta    )',
'                                 values(:P74_ID_RPRTE_PRMTRO , v_json );',
'    commit;     ',
'     */',
'exception',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(149446304043255538)
);
end;
/
