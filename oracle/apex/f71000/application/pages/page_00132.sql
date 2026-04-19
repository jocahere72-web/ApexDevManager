prompt --application/pages/page_00132
begin
wwv_flow_api.create_page(
 p_id=>132
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro de Recaudo Manual - Recaudos'
,p_step_title=>'Registro de Recaudo Manual - Recaudos'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let codigoBarra = (event, expresion) => {',
'    if (event.key === "Enter") return apex.submit({ request: ''P132_CDGO_BRRA'', submitIfEnter: event });',
'    return validarExpresion(event, expresion);',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P132_CDGO_BRRA'').keydown(function (event) {',
'    if (event.ctrlKey == true && event.key == "+") event.preventDefault();',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}',
'',
'.t-Wizard{',
'  max-width: none;',
'}',
'',
'.a-GV-rowLabel{',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20260210083221'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45079370228594157)
,p_plug_name=>'Wizard Recaudo Manual - Recaudos'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(45075175915594155)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99897030177261153)
,p_plug_name=>unistr('<b>Relaci\00F3n de Recaudo</b>')
,p_parent_plug_id=>wwv_flow_api.id(45079370228594157)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from re_g_recaudos',
' where cdgo_rcdo_estdo in ( ''RG'' , ''AP'')',
'   and id_rcdo_cntrol  = :P132_ID_RCDO_CNTROL'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16932826685508508)
,p_plug_name=>'Adjunto'
,p_parent_plug_id=>wwv_flow_api.id(99897030177261153)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16933587469508515)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(99897030177261153)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c002 Archivo',
unistr('       , c001 Observaci\00F3n'),
'       , case',
'            when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'            else  ''Pendiente''',
'         end Estado',
'       --, blob001 file_blob',
'from   apex_collections c',
'where  collection_name = ''ADJUNTOS_RECAUDO'''))
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
 p_id=>wwv_flow_api.id(16933617637508516)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DBALDOVINO'
,p_internal_uid=>16933617637508516
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16933738064508517)
,p_db_column_name=>'ARCHIVO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16933880329508518)
,p_db_column_name=>unistr('OBSERVACI\00D3N')
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16933984698508519)
,p_db_column_name=>'ESTADO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(17050951123521578)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'170510'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('ARCHIVO:OBSERVACI\00D3N:ESTADO')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48354673033411501)
,p_plug_name=>'<i><b>Recaudos</b></i>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_rcdo_cntrol ',
'         , id_rcdo',
'         , dscrpcion_sjto_tpo ',
'         , idntfccion_sjto_frmtda as idntfccion_sjto',
'         , dscrpcion_rcdo_orgn_tpo',
'         , nmro_dcmnto',
'         , fcha_rcdo',
'         , vlor',
'         , fcha_apliccion',
'         , dscrpcion_rcdo_estdo',
'         , cdgo_rcdo_estdo',
'         , case when cdgo_rcdo_estdo = ''IN'' then ',
'                ''<span aria-hidden="true" class="fa fa-trash" style="color: #d22204;" alt="Eliminar" title="Eliminar"></span>''',
'           end as link',
'         , obsrvcion',
'         , case when ( select count(*) from re_g_recaudos b where b.id_rcdo_cntrol = a.id_rcdo_cntrol and b.cdgo_rcdo_orgn_tpo = a.cdgo_rcdo_orgn_tpo and b.id_orgen = a.id_orgen ) > 1 then ',
'                 ''S''',
'                else',
'                 ''N''',
'           end as dplcdo',
'         , case when cdgo_rcdo_estdo = ''IN'' then ',
'                ''<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Editar" title="Editar">''                 ',
'           end as edit   ',
'     from v_re_g_recaudos a',
'    where id_rcdo_cntrol = :P132_ID_RCDO_CNTROL',
' order by nmro_dcmnto',
'          '))
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
 p_id=>wwv_flow_api.id(48354729402411502)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn recaudo incluido.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:132:&SESSION.:EliminarRecaudo:&DEBUG.:RP:P132_ID_RCDO,P132_ID_RCDO_CNTROL:#ID_RCDO#,#ID_RCDO_CNTROL#'
,p_detail_link_text=>'#LINK#'
,p_owner=>'NARDILA'
,p_internal_uid=>48354729402411502
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48354846142411503)
,p_db_column_name=>'ID_RCDO_CNTROL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Recaudo Control')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48354966716411504)
,p_db_column_name=>'ID_RCDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00FAmero Recaudo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355032277411505)
,p_db_column_name=>'DSCRPCION_SJTO_TPO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tipo Sujeto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355145352411506)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355234516411507)
,p_db_column_name=>'DSCRPCION_RCDO_ORGN_TPO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Origen'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355381752411508)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355459060411509)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha de Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355579443411510)
,p_db_column_name=>'VLOR'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Valor Recaudo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355673967411511)
,p_db_column_name=>'FCHA_APLICCION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Fecha Aplicaci\00F3n')
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355792207411512)
,p_db_column_name=>'DSCRPCION_RCDO_ESTDO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355881688411513)
,p_db_column_name=>'CDGO_RCDO_ESTDO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Cdgo Rcdo Estdo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355943941411514)
,p_db_column_name=>'LINK'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117811153928288112)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117429180894299029)
,p_db_column_name=>'DPLCDO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Dplcdo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38372552764039201)
,p_db_column_name=>'EDIT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('Editar Observaci\00F3n')
,p_column_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,4:P4_ID_RCDO,P4_OBSRVCION:#ID_RCDO#,#OBSRVCION#'
,p_column_linktext=>'#EDIT#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(48364193624414253)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'483642'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RCDO:DSCRPCION_SJTO_TPO:IDNTFCCION_SJTO:DSCRPCION_RCDO_ORGN_TPO:NMRO_DCMNTO:FCHA_RCDO:DSCRPCION_RCDO_ESTDO:OBSRVCION:VLOR::EDIT'
,p_sort_column_1=>'ID_RCDO'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_sum_columns_on_break=>'VLOR'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(49403331924731615)
,p_report_id=>wwv_flow_api.id(48364193624414253)
,p_name=>'Recaudos Duplicados del Lote'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DPLCDO'
,p_operator=>'like'
,p_expr=>'S'
,p_condition_sql=>' (case when ("DPLCDO" like #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''S''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FF7755'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94992229633640076)
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
 p_id=>wwv_flow_api.id(94992857535639547)
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
unistr('Funcionalidad que permite registrar los recaudos por medio de c\00F3digo de barra.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62368146430732178)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(94992229633640076)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7023221757010801)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(94992229633640076)
,p_button_name=>'Btn_Regresar_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Regresar a Gesti\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45105391786729581)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(94992229633640076)
,p_button_name=>'Btn_Confirmar_Registros'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Confirmar Registros'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de registrar los recaudos?'',''Btn_Confirmar_Registros'');'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from re_g_recaudos',
'  where cdgo_rcdo_estdo in ( ''IN'' )',
'    and id_rcdo_cntrol  = :P132_ID_RCDO_CNTROL'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16933212844508512)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(16932826685508508)
,p_button_name=>'BTN_SCANNER'
,p_button_static_id=>'BTN_SCANNER'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Escaner'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=50000:909:&SESSION.::&DEBUG.:RP,909:P909_APP_ID,P909_APP_PAGE_ID:&APP_ID.,&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45101078686725169)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(99897030177261153)
,p_button_name=>'Btn_Refrescar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--simple:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Refrescar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.:RP,132:P132_ID_RCDO_CNTROL,P132_ID_IMPSTO,P132_ID_IMPSTO_SBMPSTO,P132_ID_BNCO,P132_ID_BNCO_CNTA,P132_OBSRVCION_CNTROL,P132_FCHA_CNTROL,P132_INDCDOR_AUTMTCO,P132_CDGO_FRMA_PGO:&P132_ID_RCDO_CNTROL.,&P132_ID_IMPSTO.,&P132_ID_IMPSTO_SBMPSTO.,&P132_ID_BNCO.,&P132_ID_BNCO_CNTA.,&P132_OBSRVCION_CNTROL.,&P132_FCHA_CNTROL.,&P132_INDCDOR_AUTMTCO.,&P132_CDGO_FRMA_PGO.'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16933392593508513)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(16932826685508508)
,p_button_name=>'BTN_AGRGAR'
,p_button_static_id=>'BTN_AGRGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cargar este archivo?'',''BTN_AGRGAR'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45100639856725169)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(99897030177261153)
,p_button_name=>'Btn_Incluir_Recaudo'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Incluir Recaudo'
,p_button_position=>'BOTTOM'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45081339596594158)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(45079370228594157)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117428623079299024)
,p_branch_name=>'Go To Page 132'
,p_branch_action=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.:RP,132:P132_ID_RCDO_CNTROL,P132_INDCDOR_AUTMTCO,P132_ID_IMPSTO,P132_ID_IMPSTO_SBMPSTO,P132_ID_BNCO,P132_ID_BNCO_CNTA,P132_FCHA_CNTROL,P132_CDGO_FRMA_PGO:&P132_ID_RCDO_CNTROL.,&P132_INDCDOR_AUTMTCO.,&P132_ID_IMPSTO.,&P132_ID_IMPSTO_SBMPSTO.,&P132_ID_BNCO.,&P132_ID_BNCO_CNTA.,&P132_FCHA_CNTROL.,&P132_CDGO_FRMA_PGO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>':REQUEST = ''Btn_Incluir_Recaudo'' or ( :REQUEST = ''P132_CDGO_BRRA'' and :P132_INDCDOR_AUTMTCO = ''S'' )'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(45082202329594159)
,p_branch_name=>'Go To Page 131'
,p_branch_action=>'f?p=&APP_ID.:131:&SESSION.::&DEBUG.:RP,131:P131_ID_RCDO_CNTROL,P131_FCHA_CNTROL,P131_ID_BNCO,P131_ID_BNCO_CNTA,P131_ID_IMPSTO,P131_ID_IMPSTO_SBMPSTO,P131_OBSRVCION:&P132_ID_RCDO_CNTROL.,&P132_FCHA_CNTROL.,&P132_ID_BNCO.,&P132_ID_BNCO_CNTA.,&P132_ID_IMPSTO.,&P132_ID_IMPSTO_SBMPSTO.,&P132_OBSRVCION_CNTROL.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(45081339596594158)
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NULL'
,p_branch_condition=>'P132_ID_RCDO_CNTROL'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117429526424299033)
,p_branch_name=>'Go To Page 131'
,p_branch_action=>'f?p=&APP_ID.:131:&SESSION.::&DEBUG.:RP,131:P131_ID_RCDO_CNTROL:&P132_ID_RCDO_CNTROL.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(45081339596594158)
,p_branch_sequence=>20
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P132_ID_RCDO_CNTROL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16932532143508505)
,p_name=>'P132_CDGO_FRMA_PGO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16932954655508509)
,p_name=>'P132_OPTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(16932826685508508)
,p_item_default=>'F'
,p_prompt=>'Option'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Explorador de Archivos;F,Escaner;E'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione una de las opciones para adjuntar el documento a la solicitud.'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16933160791508511)
,p_name=>'P132_FILE_BLOB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(16932826685508508)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Habilita ventana de b\00FAsqueda para ingresar el documento adjunto correspondiente.')
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16933418268508514)
,p_name=>'P132_OBSRVCION_ADJNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(16932826685508508)
,p_prompt=>unistr('Observaci\00F3n:')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cMaxlength=>100
,p_cHeight=>1
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45101498361725170)
,p_name=>'P132_CDGO_BRRA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_prompt=>unistr('C\00F3digo de Barra:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_cMaxlength=>65
,p_tag_attributes=>'onkeypress="return codigoBarra(event,''numeroEntero'');" '
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Apunte con el lector el c\00F3digo de barra o digite los n\00FAmeros que se encuentran en la parte inferior del c\00F3digo de barra')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45101845317725171)
,p_name=>'P132_ID_RCDO_CNTROL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45102227339725171)
,p_name=>'P132_CDGO_EAN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_prompt=>unistr('C\00F3digo EAN:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45102667432725172)
,p_name=>'P132_NMRO_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_prompt=>unistr('N\00FAmero Documento:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45103054898725173)
,p_name=>'P132_FCHA_VNCMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_prompt=>'Fecha Vencimiento:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45103447400725174)
,p_name=>'P132_VLOR_RCDO_VSUAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_prompt=>'Valor Recaudo:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45103868116725174)
,p_name=>'P132_OBSRVCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_prompt=>unistr('Observaci\00F3n:')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>110
,p_cMaxlength=>1000
,p_cHeight=>1
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('<i>Observaci\00F3n acerca del recaudo</i>')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75089329214372201)
,p_name=>'P132_BSCAR_NMRO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_prompt=>'No. Documento:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117426856626299006)
,p_name=>'P132_ID_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117426905204299007)
,p_name=>'P132_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117427042913299008)
,p_name=>'P132_ID_BNCO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117427174145299009)
,p_name=>'P132_ID_BNCO_CNTA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117427224607299010)
,p_name=>'P132_OBSRVCION_CNTROL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117427316266299011)
,p_name=>'P132_FCHA_CNTROL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117427670355299014)
,p_name=>'P132_CDGO_RSPSTA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117427708747299015)
,p_name=>'P132_MNSJE_RSPSTA'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117427844150299016)
,p_name=>'P132_ID_SJTO_IMPSTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117427973825299017)
,p_name=>'P132_VLOR_RCDO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117428152092299019)
,p_name=>'P132_INDCDOR_PGO_DPLCDO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117428755371299025)
,p_name=>'P132_INDCDOR_AUTMTCO'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_item_default=>'N'
,p_prompt=>unistr('Incluir Autom\00E1tico:')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117810429319288105)
,p_name=>'P132_CDGO_RCDO_ORGN_TPO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117810549463288106)
,p_name=>'P132_ID_ORGEN'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117810945214288110)
,p_name=>'P132_ID_RCDO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(99897030177261153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(16934092840508520)
,p_validation_name=>unistr('Validar que el archivo no este vac\00EDo')
,p_validation_sequence=>10
,p_validation=>'P132_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un archivo'
,p_when_button_pressed=>wwv_flow_api.id(16933392593508513)
,p_associated_item=>wwv_flow_api.id(16933160791508511)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106934942544830101)
,p_name=>'Al Cargar Pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106935063717830102)
,p_event_id=>wwv_flow_api.id(106934942544830101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P132_CDGO_BRRA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(117429218063299030)
,p_name=>'Al Dar Click Incluir Recaudo'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(45100639856725169)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(117429322144299031)
,p_event_id=>wwv_flow_api.id(117429218063299030)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if( $v(''P132_INDCDOR_PGO_DPLCDO'') === ''S'' ) {',
unistr('    apex.confirm(''Recaudo duplicado. \00BFEsta seguro de registrar este recaudo?'',''Btn_Incluir_Recaudo'');  '),
'}else{',
'    apex.submit({request: ''Btn_Incluir_Recaudo''});',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(62370884290767201)
,p_name=>'Al Dar Click en Regresar'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(62368146430732178)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(62370951444767202)
,p_event_id=>wwv_flow_api.id(62370884290767201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.submit(''PREVIOUS'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16934136186508521)
,p_name=>'al cerrar la ventana modal'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(16933212844508512)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16934382737508523)
,p_event_id=>wwv_flow_api.id(16934136186508521)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob         blob;',
'     v_seq          varchar2(4000);',
'     v_filename     varchar2(4000);',
'     v_mime_type    varchar2(4000);        ',
'begin',
'',
'    if (apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_RECAUDO'') ) then',
'        apex_collection.delete_collection( p_collection_name => ''ADJUNTOS_RECAUDO'');',
'    end if;  ',
'    ',
'    --delete muerto;commit;',
'    begin',
'        select blob001,',
'               c001,',
'               c002',
'          into v_blob,',
'               v_filename,',
'               v_mime_type',
'          from apex_collections',
'         where collection_name = ''SCANNER'';',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'       ',
'    --insert into muerto (n_001,v_001, v_002,t_001) values (55, v_filename, v_mime_type, systimestamp);  commit;',
'    ',
'    if v_blob is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_RECAUDO'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ADJUNTOS_RECAUDO'');',
'        end if;',
'',
'        apex_collection.add_member( p_collection_name => ''ADJUNTOS_RECAUDO''',
'                                  --, p_c001 => :P48_OBSRVCION',
'                                  , p_c002 => v_filename',
'                                  , p_c003 => v_mime_type',
'                                  , p_n001 => :F_ID_USRIO',
'                                  , p_blob001 => v_blob );                                     ',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16934264910508522)
,p_event_id=>wwv_flow_api.id(16934136186508521)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(16933587469508515)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(75089451350372202)
,p_name=>'Al cambiar item P132_BSCAR_NMRO_DCMNTO'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P132_BSCAR_NMRO_DCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75089572293372203)
,p_event_id=>wwv_flow_api.id(75089451350372202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = $.Event( "keypress", { which: 13 } );',
'var popup = apex.widget.waitPopup()',
'',
unistr('//Generar c\00F3digo de barra basado en el documento'),
'var promise = apex.server.process(',
'                    "Generar_Codigo_Barra",',
'                    {    pageItems: ''#P132_BSCAR_NMRO_DCMNTO''',
'                    },',
'                    {',
'                        //dataType: ''text'',',
'                        success: function( pData ){',
'                            if (pData.cdgo_brra == ''''){ ',
'                                apex.message.clearErrors();',
unistr('                                apex.message.alert(  ''No ha sido posible generar el c\00F3digo de barras para el documento No. ''||$v(''P132_BSCAR_NMRO_DCMNTO'') );'),
'',
'                            }else{',
unistr('                                //apex.message.showPageSuccess("Caja Aperturada con \00E9xito.");'),
'                                //window.localStorage.removeItem(''wf_link'')',
'',
'                                $s(''P132_CDGO_BRRA'', pData.cdgo_brra );',
'                                //$(''#P132_CDGO_BRRA'').focus();                                ',
'                                //apex.submit();',
'                            }',
'                        }',
'                    }',
'                );',
'',
'$(''#P132_CDGO_BRRA'').focus();    ',
'$(''#P132_CDGO_BRRA'').trigger(e);',
'',
'promise.always(function() {',
'    ',
'    popup.remove();',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16934448964508524)
,p_name=>unistr('Al cambiar la opci\00F3n de archivo')
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P132_OPTION'
,p_condition_element=>'P132_OPTION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16934572700508525)
,p_event_id=>wwv_flow_api.id(16934448964508524)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P132_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16934884336508528)
,p_event_id=>wwv_flow_api.id(16934448964508524)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P132_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16934643948508526)
,p_event_id=>wwv_flow_api.id(16934448964508524)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(16933392593508513)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16934933855508529)
,p_event_id=>wwv_flow_api.id(16934448964508524)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(16933392593508513)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16934756895508527)
,p_event_id=>wwv_flow_api.id(16934448964508524)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(16933212844508512)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16935028927508530)
,p_event_id=>wwv_flow_api.id(16934448964508524)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(16933212844508512)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117811369378288114)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Recaudo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cntdad_rcdos re_g_recaudos_control.cntdad_rcdos%type;',
'    v_vlor_rcdos   re_g_recaudos_control.vlor_rcdos%type;',
'begin',
'   ',
'   --Elimina el Recaudo',
'    delete re_g_recaudos ',
'     where id_rcdo = :P132_ID_RCDO;',
' ',
'    --Busca los Consolidado del Control',
'    select count(*)',
'         , nvl( sum(vlor) , 0 )',
'      into v_cntdad_rcdos',
'         , v_vlor_rcdos',
'      from re_g_recaudos',
'     where id_rcdo_cntrol = :P131_ID_RCDO_CNTROL;',
'        ',
'    --Actualiza los Consolidado   ',
'    update re_g_recaudos_control',
'       set cntdad_rcdos   = v_cntdad_rcdos',
'         , vlor_rcdos     = v_vlor_rcdos',
'     where id_rcdo_cntrol = :P131_ID_RCDO_CNTROL;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'EliminarRecaudo'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117810365504288104)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Incluir Recaudo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'    v_exste_adjnto   number := 0 ; --REQ0029193',
'begin',
'',
unistr('    -- REQ0029193. validar el adjunto obligatorio est\00E9 cargado.'),
'    select  count(1) into v_exste_adjnto',
'    from    apex_collections a',
'    where   collection_name = ''ADJUNTOS_RECAUDO'';',
'',
'    if v_exste_adjnto = 0 then',
'       raise_application_error( -20001 , ''Debe adjuntar un soporte'' );',
'    end if;   ',
'    ',
'    --Verifica si no existe el Recaudo Control',
'    begin',
'        select id_rcdo_cntrol',
'          into :P132_ID_RCDO_CNTROL',
'          from re_g_recaudos_control',
'         where id_rcdo_cntrol = :P132_ID_RCDO_CNTROL;',
'    exception',
'          when no_data_found then ',
'               ',
'               --Registra Recaudo Control',
'               pkg_re_recaudos.prc_rg_recaudo_control( p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                     , p_id_impsto         => :P132_ID_IMPSTO',
'                                                     , p_id_impsto_sbmpsto => :P132_ID_IMPSTO_SBMPSTO',
'                                                     , p_id_bnco           => :P132_ID_BNCO',
'                                                     , p_id_bnco_cnta      => :P132_ID_BNCO_CNTA',
'                                                     , p_fcha_cntrol       => :P132_FCHA_CNTROL',
'                                                     , p_obsrvcion         => :P132_OBSRVCION_CNTROL',
'                                                     , p_cdgo_rcdo_orgen   => ''MN''',
'                                                     , p_id_usrio          => :F_ID_USRIO',
'                                                     , o_id_rcdo_cntrol    => :P132_ID_RCDO_CNTROL',
'                                                     , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                                     , o_mnsje_rspsta      => v_mnsje_rspsta );',
'               if( v_cdgo_rspsta <> 0 ) then',
'                    raise_application_error( -20001 , v_mnsje_rspsta );',
'               end if;   ',
'               ',
'    end;',
'    ',
'    --Registra Recaudos',
'    pkg_re_recaudos.prc_rg_recaudo( p_cdgo_clnte         => :F_CDGO_CLNTE',
'                                  , p_id_rcdo_cntrol     => :P132_ID_RCDO_CNTROL',
'                                  , p_id_sjto_impsto     => :P132_ID_SJTO_IMPSTO',
'                                  , p_cdgo_rcdo_orgn_tpo => :P132_CDGO_RCDO_ORGN_TPO',
'                                  , p_id_orgen           => :P132_ID_ORGEN',
'                                  , p_vlor               => :P132_VLOR_RCDO',
'                                  , p_obsrvcion          => :P132_OBSRVCION',
'                                  , p_cdgo_frma_pgo      => nvl(:P132_CDGO_FRMA_PGO , ''EF'') -- REQ0029193 --''EF''',
'                                  , o_id_rcdo            => :P132_ID_RCDO',
'                                  , o_cdgo_rspsta        => v_cdgo_rspsta',
'                                  , o_mnsje_rspsta       => v_mnsje_rspsta );',
'    ',
'    if( v_cdgo_rspsta <> 0 ) then',
'        raise_application_error( -20001 , v_mnsje_rspsta );',
'    end if;   ',
'',
'end;',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST = ''Btn_Incluir_Recaudo'' or ( :REQUEST = ''P132_CDGO_BRRA'' and :P132_INDCDOR_AUTMTCO = ''S'' )'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117428572616299023)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Confirmar Registro Recaudo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    --Cursor de Recaudos del Lote',
'    for c_rcdos in (',
'                        select id_rcdo',
'                          from re_g_recaudos',
'                         where id_rcdo_cntrol  = :P132_ID_RCDO_CNTROL',
'                           and cdgo_rcdo_estdo = ''IN''',
'                   ) loop',
'        ',
'        --Confirma el Recaudo',
'        pkg_re_recaudos.prc_ac_confirmar_recaudo( p_cdgo_clnte   => :F_CDGO_CLNTE',
'                                                , p_id_usrio     => :F_ID_USRIO',
'                                                , p_id_rcdo      => c_rcdos.id_rcdo',
'                                                , o_cdgo_rspsta  => v_cdgo_rspsta',
'                                                , o_mnsje_rspsta => v_mnsje_rspsta );',
'        ',
'        --Verifica si Hubo Error',
'        if( v_cdgo_rspsta <> 0 ) then',
'            raise_application_error( -20001 , v_mnsje_rspsta );',
'        end if;  ',
'        ',
'    end loop;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(45105391786729581)
,p_process_success_message=>unistr('Recaudos registrados con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16932698453508506)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar_archivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob blob;',
'     v_seq  varchar2(4000);',
'     r_temp_files apex_application_temp_files%rowtype;',
'begin',
'    ',
'    if (apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_RECAUDO'') ) then',
'        apex_collection.delete_collection( p_collection_name => ''ADJUNTOS_RECAUDO'');',
'    end if;     ',
'    ',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P132_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'            ',
'    if r_temp_files.filename is not null then',
'',
'        if (not apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_RECAUDO'') ) then',
'            apex_collection.create_collection( p_collection_name => ''ADJUNTOS_RECAUDO'');',
'        end if;',
'',
'        apex_collection.add_member( p_collection_name => ''ADJUNTOS_RECAUDO''',
'                                  , p_c001 => :P132_OBSRVCION_ADJNTO',
'                                  , p_c002 => r_temp_files.filename',
'                                  , p_c003 => r_temp_files.mime_type',
'                                  , p_n001 => :F_ID_USRIO',
'                                  , p_blob001 => r_temp_files.blob_content );',
'',
'        delete apex_application_temp_files where filename = r_temp_files.filename;                ',
'      ',
'    end if;',
'end;'))
,p_process_error_message=>unistr('No se encontr\00F3 archivo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16933392593508513)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75089654284372204)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_Codigo_Barra'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_brra    varchar2(1000);',
'begin',
' select pkgbarcode.funcadfac( null',
'                                     , null',
'                                     , null',
'                                     , nmro_dcmnto',
'                                     , vlor_ttal_dcmnto',
'                                     , trunc(fcha_vncmnto)',
'                                     , b.cdgo_ean',
'                                     , ''N'' )      ',
'    into v_cdgo_brra',
'    from (select a.nmro_dcmnto,',
'               a.vlor_ttal_dcmnto,',
'               a.fcha_vncmnto,',
'               a.id_impsto_sbmpsto,',
'               ''RECIBOS'' ORGEN',
'          from v_re_g_documentos a',
'         where nmro_dcmnto = :P132_BSCAR_NMRO_DCMNTO',
'        union all',
'        select d.nmro_cnsctvo,',
'               d.vlor_pago,',
'               d.fcha_prsntcion_pryctda,',
'               d.id_impsto_sbmpsto,',
'               ''DECLARACIONES''',
'          from gi_g_declaraciones d',
'         where d.nmro_cnsctvo = :P132_BSCAR_NMRO_DCMNTO) e',
'  join df_i_impuestos_subimpuesto b',
'    on e.id_impsto_sbmpsto = b.id_impsto_sbmpsto;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''cdgo_brra'', v_cdgo_brra);',
'    apex_json.close_all;',
'',
'exception',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''cdgo_brra'', '''');',
'        apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117427411007299012)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar Codigo de Barra'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_vlor         number;',
'    v_fcha_vncmnto date;',
'begin',
'',
'    pkg_re_recaudos.prc_vl_cdgo_brra( p_cdgo_brra          => :P132_CDGO_BRRA',
'                                    , p_id_rcdo_cntrol     => :P132_ID_RCDO_CNTROL',
'                                    , p_cdgo_clnte         => :F_CDGO_CLNTE',
'                                    , p_id_impsto          => :P132_ID_IMPSTO',
'                                    , p_id_impsto_sbmpsto  => :P132_ID_IMPSTO_SBMPSTO',
'                                    , o_id_sjto_impsto     => :P132_ID_SJTO_IMPSTO',
'                                    , o_cdgo_ean           => :P132_CDGO_EAN',
'                                    , o_nmro_dcmnto        => :P132_NMRO_DCMNTO',
'                                    , o_vlor               => v_vlor',
'                                    , o_fcha_vncmnto       => v_fcha_vncmnto',
'                                    , o_indcdor_pgo_dplcdo => :P132_INDCDOR_PGO_DPLCDO',
'                                    , o_cdgo_rcdo_orgn_tpo => :P132_CDGO_RCDO_ORGN_TPO',
'                                    , o_id_orgen           => :P132_ID_ORGEN',
'                                    , o_cdgo_rspsta        => :P132_CDGO_RSPSTA',
'                                    , o_mnsje_rspsta       => :P132_MNSJE_RSPSTA );',
'    ',
'    if( :P132_CDGO_RSPSTA = 0 ) then ',
'        :P132_VLOR_RCDO       := v_vlor;',
'        :P132_VLOR_RCDO_VSUAL := to_char( v_vlor , ''FM$999G999G999G999G999G999G990'' );',
'        :P132_FCHA_VNCMNTO    := to_char( v_fcha_vncmnto , ''DD/MM/YYYY'' ); ',
'    else',
'        apex_error.add_error( p_message          => :P132_MNSJE_RSPSTA',
'                            , p_display_location => apex_error.c_inline_with_field',
'                            , p_page_item_name   => ''P132_CDGO_BRRA'' );',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Btn_Incluir_Recaudo,P132_CDGO_BRRA'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_comment=>'Btn_Incluir_Recaudo,P132_CDGO_BRRA'
);
end;
/
