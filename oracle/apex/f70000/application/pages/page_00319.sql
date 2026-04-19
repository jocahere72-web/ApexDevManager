prompt --application/pages/page_00319
begin
wwv_flow_api.create_page(
 p_id=>319
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Consulta Novedades N\00FAmero Predial(Tipo 5)')
,p_step_title=>unistr('Consulta Novedades N\00FAmero Predial(Tipo 5)')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20240126214040'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(279205348281894180)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(279205427904894181)
,p_plug_name=>unistr('Novedades N\00FAmero Predial (Tipo 5)')
,p_parent_plug_id=>wwv_flow_api.id(279205348281894180)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  rfrncia_igac_nva , rfrncia_igac_actual, a.cdgo_nvdad , c.dscrpcion, b.vgncia , b.id_prcso_crga, b.file_name',
'from    si_g_novedades_predial_t5   a',
'join    et_g_procesos_carga         b on a.id_prcso_crga = b.id_prcso_crga',
'join    df_c_novedades_predio_codgo c on a.cdgo_nvdad = c.cdgo_nvdad',
'where   ( a.rfrncia_igac_nva  = nvl( :P319_IDNTFCCION_SJTO , a.rfrncia_igac_nva ) or',
'          a.rfrncia_igac_actual  = nvl( :P319_IDNTFCCION_SJTO , a.rfrncia_igac_actual )',
'        ) ',
'and     a.cdgo_nvdad    = nvl( :P319_CDGO_NVDAD , a.cdgo_nvdad )',
'and     a.id_prcso_crga = nvl( :P319_ARCHIVO , a.id_prcso_crga )',
'and     ( case when ( :P319_IDNTFCCION_SJTO is null and :P319_CDGO_NVDAD is null and :P319_ARCHIVO is null ) then',
'           ( select max(id_prcso_crga) from si_g_novedades_predial_t5 )',
'           else',
'            a.id_prcso_crga',
'          end ) = a.id_prcso_crga',
'order by a.rfrncia_igac_nva , b.vgncia;'))
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
 p_id=>wwv_flow_api.id(279206493401894191)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>279206493401894191
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(148900897955564805)
,p_db_column_name=>'CDGO_NVDAD'
,p_display_order=>20
,p_column_identifier=>'M'
,p_column_label=>unistr('C\00F3digo Novedad')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(148900993062564806)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>30
,p_column_identifier=>'N'
,p_column_label=>unistr('Descripci\00F3n Novedad')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(148901187919564808)
,p_db_column_name=>'VGNCIA'
,p_display_order=>50
,p_column_identifier=>'P'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(148901269647564809)
,p_db_column_name=>'ID_PRCSO_CRGA'
,p_display_order=>60
,p_column_identifier=>'Q'
,p_column_label=>'Id. Proceso Carga'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(148901379176564810)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'R'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(148901451394564811)
,p_db_column_name=>'RFRNCIA_IGAC_NVA'
,p_display_order=>80
,p_column_identifier=>'S'
,p_column_label=>'Referencia Nueva'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(148901526054564812)
,p_db_column_name=>'RFRNCIA_IGAC_ACTUAL'
,p_display_order=>90
,p_column_identifier=>'T'
,p_column_label=>'Referencia Actual'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(279240145133124427)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2186918'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'RFRNCIA_IGAC_NVA:RFRNCIA_IGAC_ACTUAL:CDGO_NVDAD:DSCRPCION:VGNCIA:FILE_NAME:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(401078253437076606)
,p_plug_name=>unistr('Par\00E1metro de b\00FAsquedas')
,p_parent_plug_id=>wwv_flow_api.id(279205348281894180)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(527544293757699945)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
unistr('Opci\00F3n que permite: <br><br>'),
'',
'<i>',
unistr('Visualizar las Novedades de N\00FAmero de Predial (Archivo Tipo 5).<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(218686419784899828)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(401078253437076606)
,p_button_name=>'Btn_Consulta'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consulta'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148900604062564803)
,p_name=>'P319_CDGO_NVDAD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(401078253437076606)
,p_prompt=>'<b>Novedad</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion||'' [''||cdgo_nvdad||'']'' d , cdgo_nvdad r ',
'from    df_c_novedades_predio_codgo',
'order by cdgo_nvdad;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148906790389680325)
,p_name=>'P319_ARCHIVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(401078253437076606)
,p_prompt=>'<b>Archivo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia ||''  |  ''|| a.file_name || ''  |  '' || to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || a.nmbre_trcro as d',
'        , a.id_prcso_crga as r',
'from    v_et_g_procesos_carga a',
'where   a.cdgo_clnte        = :F_CDGO_CLNTE',
'--and     a.indcdor_prcsdo    = ''S''',
'and     exists(',
'                select  1',
'                from    si_g_novedades_predial_t5 c',
'                where   c.id_prcso_crga = a.id_prcso_crga',
'                group by a.id_prcso_crga',
'              )',
'order by  a.id_prcso_crga desc     ;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P123_IMPSTO,P123_IMPUESTO_SUBIMPUESTO,P123_VGNCIA,P123_PRDO'
,p_ajax_items_to_submit=>'P123_IMPSTO,P123_IMPUESTO_SUBIMPUESTO,P123_ARCHIVO,P123_VGNCIA,P123_PRDO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>8
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(218686896877899836)
,p_name=>'P319_IDNTFCCION_SJTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(401078253437076606)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(218693156359899896)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P319_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(218693627237899897)
,p_event_id=>wwv_flow_api.id(218693156359899896)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P319_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P319_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(218692217232899890)
,p_name=>'Limpia fecha inicio'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P319_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(218692744110899894)
,p_event_id=>wwv_flow_api.id(218692217232899890)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P319_FCHA_INCIO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(218694091479899898)
,p_name=>'Limpia fecha fin'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P319_FCHA_FIN'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(218694505822899898)
,p_event_id=>wwv_flow_api.id(218694091479899898)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P319_FCHA_FIN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
