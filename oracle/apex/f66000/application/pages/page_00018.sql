prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Reporte de Cartera'
,p_step_title=>'Reporte de Cartera'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20200401072724'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41176560896717722)
,p_plug_name=>unistr('Par\00E1metros ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41177221430717729)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<br><br>',
'Funcionalidad que permite generar un Reporte de Cartera General en la vigencia y el periodo seleccionado.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86175844587286644)
,p_plug_name=>'Informe de Cartera'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35741315331290409)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.vgncia',
'              , a.prdo',
'              , a.cdgo_cncpto',
'              , a.dscrpcion_cncpto',
'              , sum(a.vlor_sldo_cptal) as vlor_sldo_cptal',
'              , sum(a.vlor_intres) as vlor_intres',
'              , (',
'                 select (sum(a.vlor_sldo_cptal)+sum(a.vlor_intres)) as vlor_ttal              ',
'                    from v_gf_g_cartera_x_concepto a          ',
'                   where a.cdgo_clnte = :F_CDGO_CLNTE',
'                     and a.vgncia = :P18_VGNCIA',
'                     and a.prdo   = :P18_PRDO',
'                ) as vlor_ttal             ',
'           from v_gf_g_cartera_x_concepto a          ',
'          where a.cdgo_clnte = :F_CDGO_CLNTE',
'            and a.vgncia = :P18_VGNCIA',
'            and a.prdo   = :P18_PRDO',
'       group by a.vgncia',
'              , a.prdo',
'              , a.cdgo_cncpto',
'              , a.dscrpcion_cncpto;'))
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
 p_id=>wwv_flow_api.id(86176993264286655)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encontraron Datos.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>86176993264286655
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(45002591951568996)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Concepto '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(45002900818568996)
,p_db_column_name=>'VLOR_SLDO_CPTAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(45003348876569001)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Intres'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41176254252717719)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Cdgo Cncpto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47541832858625316)
,p_db_column_name=>'VGNCIA'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47541954774625317)
,p_db_column_name=>'PRDO'
,p_display_order=>90
,p_column_identifier=>'M'
,p_column_label=>'Prdo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47542407004625322)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>100
,p_column_identifier=>'Q'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(89974944064906640)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'PIVOT'
,p_report_alias=>'450037'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'DSCRPCION_CNCPTO:VLOR_SLDO_CPTAL:VLOR_INTRES_CDGO_CNCPTO:VGNCIA:PRDO:VLOR_TTAL'
);
wwv_flow_api.create_worksheet_pivot(
 p_id=>wwv_flow_api.id(48691241267318258)
,p_report_id=>wwv_flow_api.id(89974944064906640)
,p_pivot_columns=>'DSCRPCION_CNCPTO'
,p_row_columns=>'VGNCIA'
);
wwv_flow_api.create_worksheet_pivot_agg(
 p_id=>wwv_flow_api.id(48692033710318259)
,p_pivot_id=>wwv_flow_api.id(48691241267318258)
,p_display_seq=>1
,p_function_name=>'SUM'
,p_column_name=>'VLOR_SLDO_CPTAL'
,p_db_column_name=>'PFC1'
,p_column_label=>'Valor Capital'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_display_sum=>'N'
);
wwv_flow_api.create_worksheet_pivot_agg(
 p_id=>wwv_flow_api.id(48691628853318259)
,p_pivot_id=>wwv_flow_api.id(48691241267318258)
,p_display_seq=>2
,p_function_name=>'SUM'
,p_column_name=>'VLOR_INTRES'
,p_db_column_name=>'PFC2'
,p_column_label=>unistr('Valor Inter\00E9s ')
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_display_sum=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47542387106625321)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(41176560896717722)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41177105412717728)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(41176560896717722)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(47541360075625311)
,p_branch_name=>'Impirmir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P18_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(41177105412717728)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41176641960717723)
,p_name=>'P18_VGNCIA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(41176560896717722)
,p_prompt=>'Vigencia:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select vgncia d',
'         , vgncia r',
'      from df_s_vigencias',
'  order by vgncia desc'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47541146677625309)
,p_name=>'P18_JSON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(41176560896717722)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47541231864625310)
,p_name=>'P18_ID_RPRTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(41176560896717722)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte as d',
'                , id_rprte as r',
'             from gn_d_reportes where id_rprte = 531;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47541709072625315)
,p_name=>'P18_PRDO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(41176560896717722)
,p_prompt=>'Periodo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select level as d',
'         , level as r',
'      from dual ',
' connect by level <=13;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'20%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66683842199089801)
,p_name=>'P18_ID_RPRTE_PRMTRO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(41176560896717722)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47541440601625312)
,p_name=>'Al seleccionar Rporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P18_ID_RPRTE'
,p_condition_element=>'P18_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47541577586625313)
,p_event_id=>wwv_flow_api.id(47541440601625312)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(41177105412717728)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47541658664625314)
,p_event_id=>wwv_flow_api.id(47541440601625312)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(41177105412717728)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47541010368625308)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' v_nmbre_rprte   gn_d_reportes.nmbre_rprte%type;',
' v_object        json_object_t := json_object_t();',
' v_json          clob;       ',
'begin ',
'    ',
'    --:P18_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P9_ID_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
'    ',
'    --Busca el noombre del Reporte',
'    select nmbre_rprte',
'      into v_nmbre_rprte',
'      from gn_d_reportes',
'     where id_rprte = :P18_ID_RPRTE;',
'',
'',
'    v_object.put(''vgncia'',:P18_VGNCIA); ',
'    v_object.put(''prdo'',:P18_PRDO); ',
'    v_object.put(''nmbre_rprte'', v_nmbre_rprte);    ',
'    v_json := v_object.to_clob();    ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'  ',
'exception ',
'    when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(41177105412717728)
);
end;
/
