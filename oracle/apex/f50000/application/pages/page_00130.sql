prompt --application/pages/page_00130
begin
wwv_flow_api.create_page(
 p_id=>130
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Informe de Actos'
,p_step_title=>'Informe de Actos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});',
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_css_classes=>'parametroBusqueda1'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(99268463186773832)
,p_last_upd_yyyymmddhh24miss=>'20200725094714'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18016067519280842)
,p_plug_name=>'Informe de Actos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_impsto_acto,',
'        id_impsto,',
'        nmbre_impsto,',
'        id_impsto_sbmpsto,',
'        nmbre_impsto_sbmpsto,',
'        cdgo_impsto_acto,',
'        nmbre_impsto_acto,',
'        dscrpcion_actvo,',
'        dscrpcion_tpo_dias,',
'        dias_mrgn_mra,',
'        txto_bse_grvble,',
'        dscrpcion_lqdcion_pblco,',
'        dscrpcion_rqre_ascsda  ',
'from v_df_i_impuestos_acto ',
'where id_impsto         = :P130_ID_IMPSTO',
'  and id_impsto_sbmpsto = :P130_ID_IMPSTO_SBMPSTO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(18016452382280842)
,p_name=>'Informe de Actos'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:139:&SESSION.::&DEBUG.:RP,139:P139_ID_IMPSTO_ACTO:#ID_IMPSTO_ACTO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Editar">'
,p_owner=>'AMOLINA'
,p_internal_uid=>18016452382280842
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18016516462280852)
,p_db_column_name=>'ID_IMPSTO_ACTO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Impsto Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18016905583280853)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18017353387280854)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18017717056280854)
,p_db_column_name=>'CDGO_IMPSTO_ACTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('C\00F3digo <br> Tributo Acto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18018129887280855)
,p_db_column_name=>'NMBRE_IMPSTO_ACTO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Nombre <br> Tributo Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18019388805280856)
,p_db_column_name=>'DIAS_MRGN_MRA'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>unistr('D\00EDas <br>Margen Mora')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18019763496280856)
,p_db_column_name=>'TXTO_BSE_GRVBLE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Texto Base Gravable'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18038044162317501)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>19
,p_column_identifier=>'L'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18038147590317502)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>29
,p_column_identifier=>'M'
,p_column_label=>'Subtributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18038269116317503)
,p_db_column_name=>'DSCRPCION_ACTVO'
,p_display_order=>39
,p_column_identifier=>'N'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18038387186317504)
,p_db_column_name=>'DSCRPCION_TPO_DIAS'
,p_display_order=>49
,p_column_identifier=>'O'
,p_column_label=>unistr('Tipo D\00EDas')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18038428275317505)
,p_db_column_name=>'DSCRPCION_LQDCION_PBLCO'
,p_display_order=>59
,p_column_identifier=>'P'
,p_column_label=>unistr('Liquidaci\00F3n Publica')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18038590354317506)
,p_db_column_name=>'DSCRPCION_RQRE_ASCSDA'
,p_display_order=>69
,p_column_identifier=>'Q'
,p_column_label=>'Dscrpcion Rqre Ascsda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(18036528326281931)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'180366'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:CDGO_IMPSTO_ACTO:NMBRE_IMPSTO_ACTO:DIAS_MRGN_MRA:DSCRPCION_ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18038697506317507)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18038941937317510)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(203169884980346290)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda<i class="fa fa-question-circle" aria-hidden="true"></center></i>',
'    </b>',
'</h5>',
'<i>',
'    Funcionalidad que permite ingresar, consultar, modificar y eliminar:<br><br>',
'    <b>1. </b>Acto por tributo<br><br>',
unistr('    <b>2. </b>Conceptos de tributos por vigencia y per\00EDodo<br><br>	'),
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38268936060028501)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18038697506317507)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P130_BRANCH_APP.:&P130_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18020941714280857)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(18038697506317507)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:139:&SESSION.::&DEBUG.:RP,139::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18039282197317513)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(18038941937317510)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18039079118317511)
,p_name=>'P130_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18038941937317510)
,p_prompt=>'Tributo'
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
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18039178177317512)
,p_name=>'P130_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18038941937317510)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto,',
'       id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto ',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto  = :P130_ID_IMPSTO'))
,p_lov_cascade_parent_items=>'P130_ID_IMPSTO'
,p_ajax_items_to_submit=>'P130_ID_IMPSTO,P130_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el sub tributo a consultar'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38269014157028502)
,p_name=>'P130_BRANCH_APP'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(18038941937317510)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38269119752028503)
,p_name=>'P130_BRANCH_PAGE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(18038941937317510)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17946165424854249)
,p_name=>'Al cerrar modal'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17946239011854250)
,p_event_id=>wwv_flow_api.id(17946165424854249)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(18016067519280842)
,p_stop_execution_on_error=>'Y'
);
end;
/
