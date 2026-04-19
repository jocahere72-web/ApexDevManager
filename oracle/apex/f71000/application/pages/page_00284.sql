prompt --application/pages/page_00284
begin
wwv_flow_api.create_page(
 p_id=>284
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Revertir Aplicaci\00F3n de Recaudo -Informe-')
,p_step_title=>unistr('Revertir Aplicaci\00F3n de Recaudo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'    font-weight: 700;',
'}',
'',
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20260416134236'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74324778530173749)
,p_plug_name=>unistr('<b>Par\00E1metros de Busqueda</b>')
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
 p_id=>wwv_flow_api.id(75421273173794607)
,p_plug_name=>'Recaudos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_rcdo_cntrol',
'     , b.nmbre_impsto ',
'     , b.nmbre_impsto_sbmpsto',
'     , b.dscrpcion_orgen',
'     , b.dscrpcion_bnco',
'     , b.nmro_cnta',
'     , a.cdgo_rcdo_orgn_tpo',
'     , a.id_rcdo',
'     , a.dscrpcion_sjto_tpo',
'     , a.idntfccion_sjto',
'     , a.dscrpcion_rcdo_orgn_tpo',
'     , a.nmro_dcmnto',
'     , trunc(a.fcha_rcdo) as fcha_rcdo',
'     , to_char(a.vlor, ''FM$999G999G999G999G999G999G990'') as vlor',
'     , trunc(a.fcha_apliccion) as fcha_apliccion',
'     , a.dscrpcion_rcdo_estdo',
'     , a.obsrvcion',
'  from v_re_g_recaudos         a',
'  join v_re_g_recaudos_control b on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
' where a.cdgo_clnte             = :F_CDGO_CLNTE',
'   and a.id_impsto              = nvl(:P284_ID_IMPSTO, a.id_impsto)',
'   and a.id_impsto_sbmpsto      = nvl(:P284_ID_IMPSTO_SB_IMPSTO, a.id_impsto_sbmpsto)',
'   and a.cdgo_rcdo_estdo        = ''AP''',
'   and a.cdgo_rcdo_orgen_cntrol = ''MN''',
'   and a.nmro_dcmnto            = nvl(:P284_NMRO_DCMNTO,nmro_dcmnto)  ',
'   /*and a.fcha_rcdo    between nvl(:P284_FCHA_RCDO_INCIAL ,a.fcha_rcdo)',
'                          and nvl(:P284_FCHA_RCDO_FNAL, a.fcha_rcdo) ',
'   and TO_CHAR(a.fcha_apliccion,''DD/MM/YYYY'') between to_char(:P284_FCHA_APLCCION_INCIAL) and to_char(:P284_FCHA_APLCCION_FNAL)',
'   and trunc(a.fcha_apliccion) between :P284_FCHA_APLCCION_INCIAL and :P284_FCHA_APLCCION_FNAL*/'))
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
 p_id=>wwv_flow_api.id(75421376027794608)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:285:&SESSION.::&DEBUG.:RP,285:P285_ID_RCDO,P285_CDGO_RCDO_ORGN_TPO:#ID_RCDO#,#CDGO_RCDO_ORGN_TPO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'NARDILA'
,p_internal_uid=>75421376027794608
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75421422315794609)
,p_db_column_name=>'ID_RCDO_CNTROL'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Control')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75421554273794610)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75421613816794611)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Sub-Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75421742268794612)
,p_db_column_name=>'DSCRPCION_ORGEN'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Origen Recaudo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75421845178794613)
,p_db_column_name=>'DSCRPCION_BNCO'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75421968087794614)
,p_db_column_name=>'NMRO_CNTA'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero de Cuenta ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75422057657794615)
,p_db_column_name=>'ID_RCDO'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>unistr('N\00B0 Recaudo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75422109318794616)
,p_db_column_name=>'DSCRPCION_SJTO_TPO'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Tipo Sujeto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75422270665794617)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>unistr('Identificaci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75422356942794618)
,p_db_column_name=>'DSCRPCION_RCDO_ORGN_TPO'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Origen '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75422415381794619)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>unistr('N\00FAmero ')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75422558493794620)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Fecha de Recaudo '
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75422757525794622)
,p_db_column_name=>'FCHA_APLICCION'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Fecha Aplicaci\00F3n ')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75422867474794623)
,p_db_column_name=>'DSCRPCION_RCDO_ESTDO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75422966234794624)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('Observaci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75423199620794626)
,p_db_column_name=>'VLOR'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Valor'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100211707770142835)
,p_db_column_name=>'CDGO_RCDO_ORGN_TPO'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Cdgo Rcdo Orgn Tpo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(75440060326939177)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'754401'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RCDO_CNTROL:ID_RCDO:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:DSCRPCION_ORGEN:DSCRPCION_BNCO:DSCRPCION_SJTO_TPO:IDNTFCCION_SJTO:DSCRPCION_RCDO_ORGN_TPO:NMRO_DCMNTO:FCHA_RCDO:VLOR:FCHA_APLICCION:DSCRPCION_RCDO_ESTDO:CDGO_RCDO_ORGN_TPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75423603729794631)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
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
unistr('    <p>Funcionalidad que permite revertir la aplicaci\00F3n de un Recaudo manual que no tenga movimientos posteriores a su aplicaci\00F3n.</p><br/>'),
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75423092327794625)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(74324778530173749)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74324837312173750)
,p_name=>'P284_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(74324778530173749)
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
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75420644965794601)
,p_name=>'P284_ID_IMPSTO_SB_IMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(74324778530173749)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto as d',
'     , id_impsto_sbmpsto    as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto = :P284_ID_IMPSTO',
' '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P284_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75420758575794602)
,p_name=>'P284_NMRO_DCMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(74324778530173749)
,p_prompt=>unistr('N\00FAmero de Documento ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'ondblclick="this.value=''''" onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75420833592794603)
,p_name=>'P284_FCHA_APLCCION_INCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(74324778530173749)
,p_prompt=>unistr('Fecha de Aplicaci\00F3n Inicial ')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"  onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75420978954794604)
,p_name=>'P284_FCHA_APLCCION_FNAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(74324778530173749)
,p_prompt=>unistr('Fecha de Aplicaci\00F3n Final ')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P284_FCHA_APLCCION_INCIAL.'
,p_attribute_03=>'+1d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75421006798794605)
,p_name=>'P284_FCHA_RCDO_INCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(74324778530173749)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75421176180794606)
,p_name=>'P284_FCHA_RCDO_FNAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(74324778530173749)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80578532731405802)
,p_name=>'P284_NMRO_DOCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(75421273173794607)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(75423264920794627)
,p_name=>unistr('Al cambiar fecha de Aplicaci\00F3n inicial ')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P284_FCHA_APLCCION_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75423315973794628)
,p_event_id=>wwv_flow_api.id(75423264920794627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P284_FCHA_APLCCION_FNAL").datepicker( ''option'' , ''minDate'' , $("#P284_FCHA_APLCCION_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(75423447991794629)
,p_name=>'Al Cambiar Fecha Recaudo inicial '
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P284_FCHA_RCDO_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75423599959794630)
,p_event_id=>wwv_flow_api.id(75423447991794629)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P284_FCHA_RCDO_FNAL").datepicker( ''option'' , ''minDate'' , $("#P284_FCHA_RCDO_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(80640021142691242)
,p_name=>'Al cerrar modal -Revertir Recaudo-  Region Recaudos'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(75421273173794607)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80640192264691243)
,p_event_id=>wwv_flow_api.id(80640021142691242)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(75421273173794607)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80578618816405803)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Revertir Recaudo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'begin',
'    pkg_re_recaudos.prc_rg_reversar_recaudo(p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                            p_nmro_dcmnto   => :P284_NMRO_DOCMNTO,',
'                                            o_cdgo_rspsta   => v_cdgo_rspsta,',
'                                            o_mnsje_rspsta  => v_mnsje_rspsta);',
'    if v_cdgo_rspsta > 0 then',
'         raise_application_error(-20001,v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'REVERTIR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
