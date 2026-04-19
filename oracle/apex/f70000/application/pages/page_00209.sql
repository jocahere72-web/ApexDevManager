prompt --application/pages/page_00209
begin
wwv_flow_api.create_page(
 p_id=>209
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Consulta General de Rentas'
,p_step_title=>'Consulta General de Rentas'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#/javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210616102234'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22238389497049709)
,p_plug_name=>unistr('Par\00E1metros de Consulta')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22462816565957739)
,p_plug_name=>'Consulta de Liquidaciones del Contribuyente'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_rnta,',
'       --cdgo_clnte,',
'       --nmbre_mncpio_clnte,',
'       --id_impsto,',
'       --nmbre_impsto,',
'       --id_impsto_sbmpsto,',
'       --nmbre_impsto_sbmpsto,',
'       --id_sjto_impsto,',
'       a.idntfccion_sjto || '' - '' || a.nmbre_rzon_scial,',
'       --idntfccion_sjto_frmtda,',
'       b.nmbre_impsto_acto,',
'       a.fcha_rgstro,',
'       --r.fcha_expdcion,',
'       a.nmro_rnta,',
'       a.vlor_bse_grvble,',
'       --r.nmro_dcmnto,',
'       --r.fcha_vncmnto,',
'       a.vlor_ttal,',
'       --id_sbmpsto_ascda,',
'       a.dscrpcion_ascda || '' - '' || a.txto_ascda,',
'       --cdgo_ascda,',
'       --indcdor_usa_mxto,',
'       --usa_extrnjro,',
'       --indcdor_usa_extrnjro,',
'       --usa_mxto,',
'       --id_dcmnto,',
'       --id_lqdcion,',
'       --cdgo_mvnt_fncro_estdo,',
'       --r.id_usrio,',
'       c.idntfccion || '' - '' || c.nmbre_trcro,',
'       --id_entdad,',
'       a.idntfccion_entdad || '' - '' || a.nmbre_entdad,',
'       --cdgo_rnta_estdo,',
'       a.dscrpcion_rnta_estdo,',
'       --entrno,',
'       a.dscrpcion_entrno,',
'       --id_rnta_antrior,',
'       --vlor_bse_grvble_rnta_antrior,',
'       --txto_ascda_rnta_antrior,',
'       --indcdor_exncion,',
'       --r.dscrpcion_indcdor_exncion,',
'       --indcdor_cntrto_gslna,',
'       --r.dscrpcion_indcdor_cntrto_gslna,',
'       --indcdor_cntrto_ese,',
'       a.dscrpcion_indcdor_cntrto_ese,',
'       a.vlor_cntrto_ese,',
'       --r.id_usrio_aprbo,',
'       --r.nmbre_trcro_aprbo,',
'       --r.fcha_aprbcion,',
'       --r.id_usrio_rchzo,',
'       --r.nmbre_trcro_rchzo,',
'       --r.fcha_rchzo,',
'       --r.obsrvcion_rchzo,',
'       --indcdor_rnta_pgda,',
'       a.dscrpcion_indcdor_rnta_pgda',
'        --id_instncia_fljo,',
'        --id_fljo_trea,',
'        --id_exncion_slctud,',
'        --cdgo_exncion_estdo,',
'        --usrio_rgstra_exncion,',
'        --fcha_rgstro_exncion,',
'        --id_usrio_rspsta,',
'        --fcha_rspsta_exncion,',
'        --obsrvcion_rchzo_exncion,',
'        --id_ajste_exncion,',
'        --id_dcmnto_exncion,',
'        --nmro_dcmnto_exncion,',
'        --indcdor_pgo_aplcdo_exncion,',
'        --indcdor_mgrdo,',
'        --indcdor_intrfaz',
'  from v_gi_g_rentas      a',
'  join v_gi_g_rentas_acto b on a.id_rnta  = b.id_rnta',
'  join v_sg_g_usuarios    c on a.id_usrio = c.id_usrio',
' where a.idntfccion_sjto = nvl(:P209_IDNTFCCION, a.idntfccion_sjto)',
'   and a.nmro_rnta       = nvl(:P209_NMRO_RNTA,  a.nmro_rnta)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P209_IDNTFCCION is null and :P209_NMRO_RNTA is not null then',
'        return true;',
'    elsif :P209_IDNTFCCION is not null and :P209_NMRO_RNTA is null then',
'        return true;',
'    elsif :P209_IDNTFCCION is not null and :P209_NMRO_RNTA is not null then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
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
 p_id=>wwv_flow_api.id(22462968721957740)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'20'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'HMARTINEZ'
,p_internal_uid=>22462968721957740
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13862275604414744)
,p_db_column_name=>'ID_RNTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Rnta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13862683584414754)
,p_db_column_name=>'NMRO_RNTA'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('No. Liquidaci\00F3n')
,p_column_link=>'f?p=&APP_ID.:149:&SESSION.::&DEBUG.:RP:P149_ID_RNTA,P149_BRANCH:#ID_RNTA#,&APP_PAGE_ID.'
,p_column_linktext=>'#NMRO_RNTA#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13863025348414754)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13863429071414754)
,p_db_column_name=>'VLOR_BSE_GRVBLE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Base Gravable'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13863832372414754)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Valor a Pagar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13864230685414755)
,p_db_column_name=>'DSCRPCION_RNTA_ESTDO'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Estado de la Renta'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13864682923414755)
,p_db_column_name=>'DSCRPCION_ENTRNO'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>unistr('Entorno de Liquidaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13865095772414755)
,p_db_column_name=>'DSCRPCION_INDCDOR_CNTRTO_ESE'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>unistr('\00BFEs un Contrato ESE?')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13865479202414755)
,p_db_column_name=>'VLOR_CNTRTO_ESE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Valor de la ESE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13865869929414756)
,p_db_column_name=>'DSCRPCION_INDCDOR_RNTA_PGDA'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>unistr('\00BFFue Pagada?')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13866277363414756)
,p_db_column_name=>'NMBRE_IMPSTO_ACTO'
,p_display_order=>580
,p_column_identifier=>'BU'
,p_column_label=>'Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13866664473414756)
,p_db_column_name=>'A.IDNTFCCION_SJTO||''-''||A.NMBRE_RZON_SCIAL'
,p_display_order=>590
,p_column_identifier=>'BY'
,p_column_label=>'Contribuyente'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13867081584414756)
,p_db_column_name=>'A.DSCRPCION_ASCDA||''-''||A.TXTO_ASCDA'
,p_display_order=>600
,p_column_identifier=>'BZ'
,p_column_label=>'Asociada'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13867422465414757)
,p_db_column_name=>'C.IDNTFCCION||''-''||C.NMBRE_TRCRO'
,p_display_order=>610
,p_column_identifier=>'CA'
,p_column_label=>'Liquidador'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13867889292414757)
,p_db_column_name=>'A.IDNTFCCION_ENTDAD||''-''||A.NMBRE_ENTDAD'
,p_display_order=>620
,p_column_identifier=>'CB'
,p_column_label=>'Entidad Contratante'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(22498399822025392)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'138682'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'A.IDNTFCCION_SJTO||''-''||A.NMBRE_RZON_SCIAL:FCHA_RGSTRO:NMRO_RNTA:DSCRPCION_ENTRNO:DSCRPCION_RNTA_ESTDO:A.IDNTFCCION_ENTDAD||''-''||A.NMBRE_ENTDAD:NMBRE_IMPSTO_ACTO:A.DSCRPCION_ASCDA||''-''||A.TXTO_ASCDA:VLOR_BSE_GRVBLE:VLOR_TTAL:DSCRPCION_INDCDOR_CNTRTO_'
||'ESE:VLOR_CNTRTO_ESE:DSCRPCION_INDCDOR_RNTA_PGDA:C.IDNTFCCION||''-''||C.NMBRE_TRCRO:'
,p_sort_column_1=>'FCHA_RGSTRO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(13868628170414760)
,p_report_id=>wwv_flow_api.id(22498399822025392)
,p_name=>'Rentas Pagadas'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DSCRPCION_INDCDOR_RNTA_PGDA'
,p_operator=>'='
,p_expr=>'S?'
,p_condition_sql=>' (case when ("DSCRPCION_INDCDOR_RNTA_PGDA" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''S?''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#99FF99'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104815750907207770)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="justify">En esta opci\00F3n podr\00E1 consultar las liquidaciones de rentas asociadas a la identificaci\00F3n del contribuyente.<br> '),
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13869380051414761)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(22238389497049709)
,p_button_name=>'P209_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13869750811414765)
,p_name=>'P209_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22238389497049709)
,p_prompt=>unistr('<b>Identificaci\00F3n del Contribuyente</b>')
,p_placeholder=>unistr('Ingrese la Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13870113639414769)
,p_name=>'P209_NMRO_RNTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(22238389497049709)
,p_prompt=>unistr('<b>No. Liquidaci\00F3n</b>')
,p_placeholder=>unistr('Ingrese el No. de Liquidaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
