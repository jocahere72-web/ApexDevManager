prompt --application/pages/page_20250_007
begin
wwv_flow_api.create_page(
 p_id=>2025040
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Descuentos Otorgados'
,p_step_title=>'Descuentos Otorgados'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'1064978129'
,p_last_upd_yyyymmddhh24miss=>'20250917103330'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2874546972735902)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2874651029735903)
,p_plug_name=>'Descuentos Otorgados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select a.idntfccion_sjto as "Identificaci\00F3n Sujeto",'),
'       a.dscrpcion as "Regla de Descuento", ',
'       ((a.prcntje_dscnto * 100) ||''%'') as "% de Descuento",',
'       a.fcha_dcmnto as "Fecha del Documento", ',
'       a.valor as "Valor Descuento", ',
'       b.nmbre_impsto as "Tributo",',
'       c.nmbre_impsto_sbmpsto as "Sub-Tributo",',
'       a.id_dcmnto "id_dcmnto",',
'       ''<span class="fa fa-eye" color:blue;></span>'' as "detalle",',
'               a.id_dscnto_rgla',
'from (',
'        select c.idntfccion_sjto,',
'               a.id_dcmnto, ',
'               c.dscrpcion, ',
'               a.prcntje_dscnto,',
'               a.cdgo_cncpto_tpo, ',
'               trunc(a.fcha_dcmnto) fcha_dcmnto,',
'               sum(vlor_hber) valor,',
'               b.id_impsto,',
'               b.id_impsto_sbmpsto,',
'               c.id_dscnto_rgla',
'        from v_re_g_documentos_detalle a',
'        join v_re_g_recaudos b on a.nmro_dcmnto = b.nmro_dcmnto and b.cdgo_rcdo_estdo = ''AP''',
'        join re_g_descuentos_regla c on a.id_dscnto_rgla = c.id_dscnto_rgla',
'        join v_si_i_sujetos_impuesto c on a.id_sjto_impsto = c.id_sjto_impsto',
'        where a.cdgo_cncpto_tpo = ''D''',
'        and ( trim(a.idntfccion_sjto) = :P2025040_IDNTFCCION_SJTO or :P2025040_IDNTFCCION_SJTO is null)',
'        and ( b.id_impsto = :P2025040_ID_IMPSTO or :P2025040_ID_IMPSTO is null)',
'        and ( b.id_impsto_sbmpsto = :P2025040_ID_IMPSTO_SBMPSTO or :P2025040_ID_IMPSTO_SBMPSTO is null)',
'        and c.id_dscnto_rgla = :P2025040_RGLA',
'        and trunc(a.fcha_dcmnto) between :P2025040_FCHA_DCMNTO_INI and :P2025040_FCHA_DCMNTO_FIN ',
'        group by c.idntfccion_sjto,a.id_dcmnto, c.dscrpcion, a.prcntje_dscnto,a.cdgo_cncpto_tpo, trunc(a.fcha_dcmnto),b.id_impsto ,b.id_impsto_sbmpsto,',
'               c.id_dscnto_rgla',
'    ) a',
'join df_c_impuestos b on a.id_impsto = b.id_impsto',
'join df_i_impuestos_subimpuesto c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'order by a.fcha_dcmnto,a.idntfccion_sjto desc;'))
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
 p_id=>wwv_flow_api.id(2874758593735904)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DBALDOVINO'
,p_internal_uid=>2874758593735904
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2874836999735905)
,p_db_column_name=>unistr('Identificaci\00F3n Sujeto')
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2875110164735908)
,p_db_column_name=>'Regla de Descuento'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Descuento Otorgado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2875486349735911)
,p_db_column_name=>'Fecha del Documento'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Fecha del Descuento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2875598993735912)
,p_db_column_name=>'Valor Descuento'
,p_display_order=>100
,p_column_identifier=>'F'
,p_column_label=>'Valor Descuento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2876841878735925)
,p_db_column_name=>'Tributo'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2876909380735926)
,p_db_column_name=>'Sub-Tributo'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'Sub-tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2877126479735928)
,p_db_column_name=>'id_dcmnto'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2877296663735929)
,p_db_column_name=>'% de Descuento'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Porcentaje del Descuento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2878653882735943)
,p_db_column_name=>'detalle'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Detalle'
,p_column_link=>'f?p=&APP_ID.:2025041:&SESSION.::&DEBUG.:RP:P2025041_ID_DCMNTO,P2025041_RGLA:#id_dcmnto#,#ID_DSCNTO_RGLA#'
,p_column_linktext=>'#detalle#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99434577074836102)
,p_db_column_name=>'ID_DSCNTO_RGLA'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Id Dscnto Rgla'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2885482394844679)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'28855'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Tributo:Sub-Tributo:Identificaci\00F3n Sujeto:Regla de Descuento:% de Descuento:Fecha del Documento:Valor Descuento:detalle:')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97865368734361715)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97866794230366203)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px";>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </div>',
'</h5>',
'',
'Funcionalidad que permite:',
'<br>',
'1. Consultar descuentos otorgados.',
'<br>',
'2. Generar reporte en Excel de descuentos otorgados.',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2874459184735901)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(97865368734361715)
,p_button_name=>'BTN_GNRAR_RPRTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir Reporte'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2876564144735922)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(2874546972735902)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>6
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2926732185602401)
,p_branch_name=>'Ir a 2025040'
,p_branch_action=>'f?p=&APP_ID.:2025040:&SESSION.:IMPRIMIR_REPORTE_DESCUENTO:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2874459184735901)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2876072224735917)
,p_name=>'P2025040_FCHA_DCMNTO_INI'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2874546972735902)
,p_prompt=>'<b>Fecha Inicio</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2876207142735919)
,p_name=>'P2025040_FCHA_DCMNTO_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2874546972735902)
,p_prompt=>'<b>Fecha Fin</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P2025040_FCHA_DCMNTO_INI.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2876331814735920)
,p_name=>'P2025040_RGLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2874546972735902)
,p_prompt=>'<b>Regla de Descuento</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct dscrpcion d, id_dscnto_rgla r',
'from re_g_descuentos_regla',
'where actvo = ''S''',
'order by dscrpcion',
'; '))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2876434841735921)
,p_name=>'P2025040_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(2874546972735902)
,p_prompt=>unistr('<b>Identificaci\00F3n del Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2876651304735923)
,p_name=>'P2025040_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2874546972735902)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2876735373735924)
,p_name=>'P2025040_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(2874546972735902)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P2025040_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P2025040_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2927082122602404)
,p_validation_name=>'P2025040_RGLA no puede ser nulo'
,p_validation_sequence=>10
,p_validation=>'P2025040_RGLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Regla de Descuento debe tener alg\00FAn valor.')
,p_associated_item=>wwv_flow_api.id(2876331814735920)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2927105501602405)
,p_validation_name=>'P2025040_FCHA_DCMNTO_INI no puede ser nulo'
,p_validation_sequence=>20
,p_validation=>'P2025040_FCHA_DCMNTO_INI'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Fecha Inicio debe tener alg\00FAn valor.')
,p_associated_item=>wwv_flow_api.id(2876072224735917)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2927277691602406)
,p_validation_name=>'P2025040_FCHA_DCMNTO_FIN no puede ser nulo'
,p_validation_sequence=>30
,p_validation=>'P2025040_FCHA_DCMNTO_FIN'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Fecha Fin debe tener alg\00FAn valor.')
,p_associated_item=>wwv_flow_api.id(2876207142735919)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2878897861735945)
,p_name=>'Al seleccionar fecha fin'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025040_FCHA_DCMNTO_FIN'
,p_condition_element=>'P2025040_FCHA_DCMNTO_FIN'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2878949980735946)
,p_event_id=>wwv_flow_api.id(2878897861735945)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(2874459184735901)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2879044635735947)
,p_event_id=>wwv_flow_api.id(2878897861735945)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(2874459184735901)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2926872301602402)
,p_name=>'Al seleccionar Fecha incio'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025040_FCHA_DCMNTO_INI'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2926916634602403)
,p_event_id=>wwv_flow_api.id(2926872301602402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P2025040_FCHA_DCMNTO_FIN").datepicker( ''option'' , ''minDate'' , $("#P2025040_FCHA_DCMNTO_INI").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2879129912735948)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir Reporte Descuentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_blob 		blob;',
'    v_num_fla 	number := 1;',
'	v_capital	number := 0;',
'	v_interes	number := 0;',
'	v_total		number := 0;',
'begin',
'  as_xlsx.clear_workbook;',
'  as_xlsx.new_sheet(''DESCUENTOS OTORGADOS'');',
'  ',
'  -- Encabezado',
unistr('  as_xlsx.cell(1,1,''IDENTIFIACI\00D3N DEL SUJETO'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' ));'),
'  as_xlsx.cell(2,1,''DESCUENTO OTORGADO'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'  as_xlsx.cell(3,1,''PORCENTAJE DE DESCUENTO'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'  as_xlsx.cell(4,1,''FECHA DEL DESCUENTO'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'  as_xlsx.cell(5,1,''VIGENCIA'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'  as_xlsx.cell(6,1,''VALOR CAPITAL'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
unistr('  as_xlsx.cell(7,1,''VALOR INTER\00C9S'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));'),
'  as_xlsx.cell(8,1,''VALOR DESCUENTO'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'  as_xlsx.cell(9,1,''VALOR PAGADO'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'  -- Fijar Encabezado',
'  as_xlsx.freeze_rows(1);',
'  -- Recorrer una consulta.',
'  ',
'',
'    for c_data in ( select a.idntfccion_sjto ,',
'							   a.vgncia, ',
'							   a.dscrpcion, ',
'							   ((a.prcntje_dscnto * 100)||''%'') prcntje_dscnto,',
'							   a.fcha_dcmnto, ',
'							   a.valor descuento, ',
'							   a.id_dcmnto,',
'							   a.id_rcdo',
'							   --b.capital, ',
'							   --c.interes,',
'							   --d.vlor_ttal',
'						from (',
'								select c.idntfccion_sjto,',
'									   a.id_dcmnto, ',
'									   a.vgncia, ',
'									   c.dscrpcion, ',
'									   a.prcntje_dscnto,',
'									   a.cdgo_cncpto_tpo, ',
'									   trunc(a.fcha_dcmnto) fcha_dcmnto,',
'									   sum(vlor_hber) valor,',
'									   b.id_rcdo',
'								from v_re_g_documentos_detalle a',
'								join v_re_g_recaudos b on a.nmro_dcmnto = b.nmro_dcmnto and b.cdgo_rcdo_estdo = ''AP''',
'								join re_g_descuentos_regla c on a.id_dscnto_rgla = c.id_dscnto_rgla',
'								join v_si_i_sujetos_impuesto c on a.id_sjto_impsto = c.id_sjto_impsto',
'								where a.cdgo_cncpto_tpo = ''D''',
'								and ( trim(a.idntfccion_sjto) = :P2025040_IDNTFCCION_SJTO or :P2025040_IDNTFCCION_SJTO is null)',
'								and c.id_dscnto_rgla = :P2025040_RGLA',
'								and trunc(a.fcha_dcmnto) between :P2025040_FCHA_DCMNTO_INI and :P2025040_FCHA_DCMNTO_FIN ',
'								group by c.idntfccion_sjto,a.id_dcmnto, a.vgncia, c.dscrpcion, a.prcntje_dscnto,a.cdgo_cncpto_tpo, trunc(a.fcha_dcmnto), b.id_rcdo',
'							) a',
'							',
'						/*join (select id_dcmnto, vgncia, sum(vlor_dbe) capital ',
'								from v_re_g_documentos_detalle ',
'							   where cdgo_cncpto_tpo = ''C''',
'							group by id_dcmnto, vgncia ',
'						   )b on b.id_dcmnto = a.id_dcmnto and a.vgncia = b.vgncia',
'						   ',
'						join (select id_dcmnto, vgncia, sum(vlor_dbe) interes ',
'								from v_re_g_documentos_detalle ',
'							   where cdgo_cncpto_tpo = ''I''',
'							group by id_dcmnto, vgncia ',
'						   )c on c.id_dcmnto = a.id_dcmnto and a.vgncia = c.vgncia',
'						   ',
'						join (select id_rcdo, vgncia, sum(vlor_ttal) vlor_ttal',
'								from v_re_g_recaudos_detalle ',
'							group by id_rcdo, vgncia ',
'						   )d on d.id_rcdo = a.id_rcdo and a.vgncia = d.vgncia*/',
'',
'						order by a.fcha_dcmnto,a.idntfccion_sjto,a.vgncia desc',
'                    ) loop',
'',
'',
'		',
'		--Consultar capital.',
'		begin',
'			select sum(a.vlor_dbe)  ',
'			  into v_capital',
'			  from v_re_g_documentos_detalle  a',
'			 where cdgo_cncpto_tpo = ''C''',
'			   and a.id_dcmnto = c_data.id_dcmnto ',
'			   and a.vgncia = c_data.vgncia',
'		  group by a.id_dcmnto, a.vgncia ;',
'		  ',
'		exception',
'			when others then',
'			    v_capital := 0;		',
'		end;',
'',
'		--Consultar interes.',
'		begin',
'			select sum(a.vlor_dbe)  ',
'			  into v_interes',
'			  from v_re_g_documentos_detalle  a',
'			 where cdgo_cncpto_tpo = ''I''',
'			   and a.id_dcmnto = c_data.id_dcmnto ',
'			   and a.vgncia = c_data.vgncia',
'		  group by a.id_dcmnto, a.vgncia ;',
'		  ',
'		exception',
'			when others then',
'			v_interes := 0;		',
'		end;',
'',
'		--Consultar interes.',
'		begin',
'			select sum(a.vlor_ttal)  ',
'			  into v_total',
'			  from v_re_g_recaudos_detalle  a',
'			 where a.id_rcdo = c_data.id_rcdo ',
'			   and a.vgncia = c_data.vgncia',
'		  group by a.id_rcdo, a.vgncia ;',
'		  ',
'		exception',
'			when others then',
'			raise_application_error(-20000,''Problemas al generar excel, ''||sqlerrm);		',
'		end;',
'	  ',
'	  ',
'	  ',
'      -- aqui se debe hacer la consulta y ir llenado las filas',
'    v_num_fla :=  v_num_fla + 1;  ',
'    as_xlsx.cell(1,v_num_fla,c_data.idntfccion_sjto,p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' ));',
'    as_xlsx.set_column_width(1,40);',
'    as_xlsx.cell(2,v_num_fla,c_data.dscrpcion,p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'    as_xlsx.set_column_width(2,40);',
'    as_xlsx.cell(3,v_num_fla,c_data.prcntje_dscnto,p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'    as_xlsx.set_column_width(3,25);',
'    as_xlsx.cell(4,v_num_fla,c_data.fcha_dcmnto,p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'    as_xlsx.set_column_width(4,25);',
'    as_xlsx.cell(5,v_num_fla,c_data.vgncia,p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'    as_xlsx.set_column_width(5,25);',
'    as_xlsx.cell(6,v_num_fla,v_capital,p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'    as_xlsx.set_column_width(6,25);',
'    as_xlsx.cell(7,v_num_fla,v_interes,p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'    as_xlsx.set_column_width(7,25);',
'    as_xlsx.cell(8,v_num_fla,c_data.descuento,p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'    as_xlsx.set_column_width(8,25);',
'    as_xlsx.cell(9,v_num_fla,v_total,p_alignment => as_xlsx.get_alignment( p_horizontal => ''center''));',
'    as_xlsx.set_column_width(9,25);',
'	',
'    end loop;    ',
'	',
'	v_blob := as_xlsx.finish();',
'	',
'	htp.init;',
'	owa_util.mime_header(''application/ms-excel'', false);',
'',
'	htp.p(''Content-length: '' ||sys.dbms_lob.getlength(v_blob) );  ',
'	htp.p(''Content-Disposition: attachment; filename="''|| ''Descuentos Otorgados'' ||''.xlsx"'');  ',
'	htp.p(''Cache-Control: max-age=0'');',
'	owa_util.http_header_close;  ',
'	wpg_docload.download_file(v_blob);  ',
'	apex_application.stop_apex_engine;',
'  ',
'  exception',
'    when others then',
'      raise_application_error(-20000,''Problemas al generar excel, ''||sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'IMPRIMIR_REPORTE_DESCUENTO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
