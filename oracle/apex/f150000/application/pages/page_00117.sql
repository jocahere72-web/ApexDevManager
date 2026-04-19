prompt --application/pages/page_00117
begin
wwv_flow_api.create_page(
 p_id=>117
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Detalle de Acuerdo de Pago - Consulta'
,p_step_title=>'Detalle de Acuerdo de Pago - Consulta'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}*/',
'',
'function VigenciasSeleccionadas() {',
'        var i, records, record, sal, model,',
'            vgncia_prdo = '''',',
'            num_vigencias_seleccionadas = 0,',
'            view = apex.region("deuda").widget().interactiveGrid("getCurrentView");',
'            model = view.model;',
'            records = view.getSelectedRecords();',
'            if ( records.length > 0 ) {',
'             ',
'                for ( i = 0; i < records.length; i++ ) {',
'                    record = records[i];',
'                    num_vigencias_seleccionadas = num_vigencias_seleccionadas + 1; ',
'                    vgncia_prdo = vgncia_prdo + '':'' + parseFloat(model.getValue(record, "VGNCIA")) + '',''+ parseFloat(model.getValue(record, "PRDO"));',
'               }',
'            } ',
'            ',
'             $s("P54_NMRO_VGNCIA_SLCCNDA", num_vigencias_seleccionadas);',
'             $s("P54_VGNCIA_PRDO", vgncia_prdo);',
'}',
'',
'',
'function revertir(){',
'    var event = new Event(''eventRevertir'');',
'    window.dispatchEvent(event);',
'}'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200527105835'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220301997266608533)
,p_plug_name=>'Datos del Convenio'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(158217161155733935)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(176831705206375157)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(220301997266608533)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(158217161155733935)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177178443750550658)
,p_plug_name=>unistr('<b>INFORMACI\00D3N DEL SOLICITANTE </b>')
,p_parent_plug_id=>wwv_flow_api.id(220301997266608533)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(158217161155733935)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177178530932550659)
,p_plug_name=>'<b>DATOS DEL ACUERDO</b>'
,p_parent_plug_id=>wwv_flow_api.id(220301997266608533)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(158217161155733935)
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78211646281355770)
,p_plug_name=>'Cuota(s) Inicial'
,p_parent_plug_id=>wwv_flow_api.id(177178530932550659)
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.nmro_dcmnto',
'        , b.fcha_vncmnto',
'        , b.vlor_ttal_dcmnto',
'        , b.dscrpcion_indcdor_pgo_aplcdo',
'    from gf_g_cnvnios_cta_incl_vgnc a',
'    join v_re_g_documentos          b on a.id_dcmnto = b.id_dcmnto',
'    where a.id_cnvnio               = :P117_ID_CNVNIO',
' order by b.nmro_dcmnto   '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_exge_cta_incial',
'  from gf_d_convenios_tipo ',
' where id_cnvnio_tpo = :P117_ID_CNVNIO_TPO',
'   and indcdor_exge_cta_incial = ''S'''))
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
 p_id=>wwv_flow_api.id(78211805999355771)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>78211805999355771
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73369825164396923)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73370208585396929)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha de Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73370658716396929)
,p_db_column_name=>'VLOR_TTAL_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73371032968396929)
,p_db_column_name=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\00BFDocumento Pagado?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(78228598164576652)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'733714'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_DCMNTO:FCHA_VNCMNTO:VLOR_TTAL_DCMNTO:DSCRPCION_INDCDOR_PGO_APLCDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(280587637437043384)
,p_plug_name=>'Cartera'
,p_region_name=>'deuda'
,p_parent_plug_id=>wwv_flow_api.id(177178530932550659)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-md'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.vgncia,',
'      p.prdo,  ',
'      to_char(sum(nvl(c.vlor_cptal,0)), :F_FRMTO_MNDA) vlor_cptal,',
'      to_char(sum(nvl(c.vlor_intres,0)), :F_FRMTO_MNDA) vlor_intres,',
'      to_char(sum(nvl(c.vlor_cptal,0))+ sum(nvl(vlor_intres,0)) , :F_FRMTO_MNDA)vlor_ttal',
'from gf_g_convenios_cartera c',
'join df_i_periodos p on p.id_prdo = c.id_prdo    ',
'where id_cnvnio = :P117_ID_CNVNIO',
'group by c.vgncia, p.prdo;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_api.id(192679869985170469)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>192679869985170469
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73372123536396936)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73372504444396937)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Per\00EDdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73372952099396938)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73373363844396938)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73373718500396938)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(192691588702182496)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'733741'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(265694133374352223)
,p_plug_name=>unistr('Garant\00EDas')
,p_parent_plug_id=>wwv_flow_api.id(220301997266608533)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.id_cnvnio_grntia_adjnto,',
'        a.ID_GRNTIA_TPO tipo_garantia, ',
'       b.DSCRPCION Tipo,',
'       a.DSCRPCION descrip, ',
'       1 descargar',
'  from gf_g_convenios_garantia a',
'  join GF_D_GARANTIAS_TIPO b on a.ID_GRNTIA_TPO = b.ID_GRNTIA_TPO',
'  join gf_g_cnvnios_grntia_adjnto c on a.id_cnvnio_grntia = c.id_cnvnio_grntia',
'  where id_cnvnio = :P117_ID_CNVNIO',
' order by 1',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(158217161155733935)
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_rqre_grntia',
'  from gf_d_convenios_tipo ',
' where id_cnvnio_tpo = :P117_ID_CNVNIO_TPO',
'   and indcdor_rqre_grntia = ''S'''))
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
 p_id=>wwv_flow_api.id(222263493260077763)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>222263493260077763
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73375666382396941)
,p_db_column_name=>'DESCRIP'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73376047392396942)
,p_db_column_name=>'TIPO_GARANTIA'
,p_display_order=>80
,p_column_identifier=>'R'
,p_column_label=>'Tipo Garantia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73376413050396942)
,p_db_column_name=>'TIPO'
,p_display_order=>90
,p_column_identifier=>'S'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73374854332396939)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>100
,p_column_identifier=>'T'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GF_G_CNVNIOS_GRNTIA_ADJNTO:FILE_BLOB:ID_CNVNIO_GRNTIA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73375260703396941)
,p_db_column_name=>'ID_CNVNIO_GRNTIA_ADJNTO'
,p_display_order=>110
,p_column_identifier=>'U'
,p_column_label=>'Id Cnvnio Grntia Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(222298669114827623)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'733768'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIPO:DESCRIP::DESCARGAR:ID_CNVNIO_GRNTIA_ADJNTO'
,p_break_on=>'TIPO:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:TIPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(266555374126536154)
,p_plug_name=>'Plan de Pago'
,p_parent_plug_id=>wwv_flow_api.id(220301997266608533)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cta,',
'        vlor_cptal,',
'        vlor_intres,',
'        vlor_fncncion,',
'        vlor_ttal,',
'        to_char(fcha_vncmnto, ''DD/MM/YYYY'')fcha_vncmnto,',
'        estdo_cta',
'   from v_gf_g_convenios_extracto',
'  where id_cnvnio = :P117_ID_CNVNIO',
'    and actvo = ''S'';'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P117_ID_CNVNIO'
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
 p_id=>wwv_flow_api.id(225926228557493054)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'<b>&P44_RSPSTA.</b>'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>225926228557493054
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73379581644396954)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73379955149396955)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>60
,p_column_identifier=>'W'
,p_column_label=>'Fecha <br>Vencimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73377930138396943)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>70
,p_column_identifier=>'AA'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73378342246396953)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>90
,p_column_identifier=>'AB'
,p_column_label=>'Valor Interes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73378785749396954)
,p_db_column_name=>'VLOR_FNCNCION'
,p_display_order=>100
,p_column_identifier=>'AC'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73379170325396954)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>110
,p_column_identifier=>'AD'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73377560644396943)
,p_db_column_name=>'ESTDO_CTA'
,p_display_order=>120
,p_column_identifier=>'AE'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(267831144557049032)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'733803'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_VNCMNTO:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION:VLOR_TTAL::ESTDO_CTA'
,p_sort_column_1=>'NMRO_CTA'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'VLOR_CTA:VLOR_TTAL:VLOR_FNCNCION:VLOR_INTRES:VLOR_CPTAL'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(73380704666396956)
,p_report_id=>wwv_flow_api.id(267831144557049032)
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTDO_CTA'
,p_operator=>'='
,p_expr=>'PAGADA'
,p_condition_sql=>' (case when ("ESTDO_CTA" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''PAGADA''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#99FF99'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(73381182324396956)
,p_report_id=>wwv_flow_api.id(267831144557049032)
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTDO_CTA'
,p_operator=>'='
,p_expr=>'VENCIDA'
,p_condition_sql=>' (case when ("ESTDO_CTA" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''VENCIDA''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FF6161'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220839526113963183)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>60
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
,p_plug_required_role=>wwv_flow_api.id(158217161155733935)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(266913402425672431)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'    <p>Esta funcionalidad permite dependiendo del estado del acuerdo de pago editar, aprobar, rechazar o aplicar una solicitud.</p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73381855644396956)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(220839526113963183)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73383878549396962)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(220839526113963183)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP:P18_NOMBRE_TABLA,P18_COLUMNA_CLAVE_PRIMARIA,P18_COLUMNA_FILENAME,P18_COLUMNA_BLOB,P18_COLUMNA_MIME,P18_VALOR:GD_G_DOCUMENTOS,ID_DCMNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P117_ID_DCMNTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio',
'  from gf_g_convenios',
' where id_cnvnio = :P117_ID_CNVNIO',
'   and cdgo_cnvnio_estdo in (''APL'',''RCH'',''ANL'', ''RVS'')',
'   and id_acto is not null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(73389457435397035)
,p_branch_name=>'Ir a la Pagina 116 - Consulta de AP'
,p_branch_action=>'f?p=&APP_ID.:116:&SESSION.::&DEBUG.:RP,117::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73381855644396956)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73357167241396880)
,p_name=>'P117_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(220301997266608533)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73357583751396886)
,p_name=>'P117_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(220301997266608533)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73357978460396889)
,p_name=>'P117_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(220301997266608533)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73358380973396889)
,p_name=>'P117_ID_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(220301997266608533)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73358767011396889)
,p_name=>'P117_NMBRE_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(220301997266608533)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73359194576396889)
,p_name=>'P117_ID_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(220301997266608533)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73359858869396896)
,p_name=>'P117_ID_CNVNIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(176831705206375157)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73360206045396898)
,p_name=>'P117_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(176831705206375157)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73360630964396899)
,p_name=>'P117_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(176831705206375157)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73361032448396899)
,p_name=>'P117_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(176831705206375157)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73361488913396906)
,p_name=>'P117_ID_INSTNCIA_FLJO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(176831705206375157)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73361704815396906)
,p_name=>'P117_NMBRE_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(176831705206375157)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73362108284396906)
,p_name=>'P117_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(176831705206375157)
,p_prompt=>'SubTributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73362854422396907)
,p_name=>'P117_CDGO_IDNTFFCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(177178443750550658)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73363264464396907)
,p_name=>'P117_NMRO_IDNTFCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(177178443750550658)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73363675730396907)
,p_name=>'P117_NMBRE_CMPLTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(177178443750550658)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73364023223396908)
,p_name=>'P117_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(177178443750550658)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73364479851396908)
,p_name=>'P117_DRCCION_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(177178443750550658)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73364826506396908)
,p_name=>'P117_TLFNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(177178443750550658)
,p_prompt=>unistr('Tel\00E9fono / Celular')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73365228511396908)
,p_name=>'P117_EMAIL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(177178443750550658)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73365937398396909)
,p_name=>'P117_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(177178530932550659)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73366354727396909)
,p_name=>'P117_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(177178530932550659)
,p_prompt=>unistr('N\00B0 Radicado')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73366704505396909)
,p_name=>'P117_NMRO_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(177178530932550659)
,p_prompt=>unistr('Acuerdo N\00B0:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73367175869396909)
,p_name=>'P117_CDGO_CNVNIO_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(177178530932550659)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONVENIO_ESTADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_cnvnio_estdo as r',
'  from gf_d_convenios_estado',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73367567272396910)
,p_name=>'P117_ID_CNVNIO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(177178530932550659)
,p_prompt=>'Tipo de Acuerdo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73367903047396911)
,p_name=>'P117_FCHA_PRMRA_CTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(177178530932550659)
,p_prompt=>'Fecha Primera Cuota'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73368300246396911)
,p_name=>'P117_NMRO_CTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(177178530932550659)
,p_prompt=>unistr('N\00B0 Cuotas')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73368775326396912)
,p_name=>'P117_CDGO_PRDCDAD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(177178530932550659)
,p_prompt=>'Periodicidad'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PERIODICIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_prdcdad as r',
'  from df_s_periodicidad',
' order by cntdad_vce_anio desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73369198401396912)
,p_name=>'P117_NMRO_CTAS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(177178530932550659)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73384260416396962)
,p_name=>'P117_BRANCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(220839526113963183)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73384647889396962)
,p_name=>'P117_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(220839526113963183)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(73385407989396971)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P117_ID_INSTNCIA_FLJO'
,p_compute_when=>'P117_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73388571987397000)
,p_name=>'Al cerrar modal - hacer submit'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(220839526113963183)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73388901403397034)
,p_event_id=>wwv_flow_api.id(73388571987397000)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'LUZ'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73386590890396983)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Id Plantilla Aplicaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select --a.dscrpcion d, ',
'       a.id_plntlla r',
'  into :P117_ID_PLNTLLA       ',
'from gn_d_plantillas a',
'join df_s_procesos b on a.id_prcso = b.id_prcso',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and b.id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                => a.cdgo_clnte,',
'                                                                    p_cdgo_dfncion_clnte_ctgria => ''ACP'',',
'                                                                    p_cdgo_dfncion_clnte        => ''APL''/*:P136_CDGO_ACCION_TPO*/);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73387337527396997)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Datos Acuerdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  idntfccion_sjto_frmtda,',
'            a.drccion,',
'            a.id_cnvnio_tpo,',
'            a.nmro_cnvnio,',
'            a.cdgo_idntfccion_tpo_slctnte,',
'            a.nmro_idntfccion_slctnte,',
'            a.nmbre_slctnte,',
'            a.drccion_ntfccion,',
'            a.nmbre_pais_ntfccion || '' - '' || nmbre_dprtmnto_ntfccion || '' - '' || nmbre_mncpio_ntfccion,',
'            a.email,',
'            a.tlfno || '' - '' || a.cllar,',
'            a.nmro_cta,',
'            a.cdgo_prdcdad_cta,',
'            to_char(a.fcha_prmra_cta, ''DD/MM/YYYY''),',
'            a.cdgo_cnvnio_estdo,',
'            a.id_instncia_fljo_hjo,',
'            a.nmro_mxmo_ctas,',
'            a.id_impsto,',
'            a.id_impsto_sbmpsto,',
'            a.id_sjto_impsto,',
'            upper(a.nmbre_impsto),',
'            upper(a.nmbre_impsto_sbmpsto),',
'            a.cdgo_idntfccion_tpo_slctnte,',
'            a.nmro_rdcdo_dsplay,',
'            a.id_cnvnio',
'       into :P117_IDNTFCCION,',
'            :P117_DRCCION,',
'            :P117_ID_CNVNIO_TPO,',
'            :P117_NMRO_CNVNIO,',
'            :P117_CDGO_IDNTFFCION_TPO,',
'            :P117_NMRO_IDNTFCION,',
'            :P117_NMBRE_CMPLTO,',
'            :P117_DRCCION_NTFCCION,',
'            :P117_UBCCION,',
'            :P117_EMAIL,',
'            :P117_TLFNO,',
'            :P117_NMRO_CTA, ',
'            :P117_CDGO_PRDCDAD,',
'            :P117_FCHA_PRMRA_CTA,',
'            :P117_CDGO_CNVNIO_ESTDO,',
'            :P117_ID_INSTNCIA_FLJO,',
'            :P117_NMRO_CTAS,',
'            :P117_ID_IMPSTO,',
'            :P117_ID_IMPSTO_SBMPSTO,',
'            :P117_ID_SJTO_IMPSTO,',
'            :P117_NMBRE_IMPSTO,',
'            :P117_NMBRE_IMPSTO_SBMPSTO,',
'            :P117_CDGO_IDNTFFCION_TPO,',
'            :P117_NMRO_RDCDO_DSPLAY,',
'            :P117_ID_CNVNIO',
'       from v_gf_g_convenios a',
'       where (a.id_cnvnio = :P117_ID_CNVNIO ',
'          or  a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO);    ',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73388180134396997)
,p_process_sequence=>30
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Datos del Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P117_CDGO_CNVNIO_ESTDO not in (''ANL'', ''RVS'') then',
'    begin',
'        select b.id_acto,',
'               b.nmro_acto|| ''.pdf'' ,',
'               b.id_dcmnto',
'          into :P117_ID_ACTO,',
'               :P117_NMBRE_ACTO,',
'               :P117_ID_DCMNTO',
'          from v_gf_g_convenios a',
'          join gn_g_actos        b on a.id_acto = b.id_acto',
'         where id_cnvnio = :P117_ID_CNVNIO;',
'    exception',
'        when others then ',
'             null;',
'    end;',
'     ',
' elsif :P117_CDGO_CNVNIO_ESTDO = ''ANL'' then',
'     select id_acto,',
'           nmro_acto|| ''.pdf'' ',
'      into :P117_ID_ACTO,',
'           :P117_NMBRE_ACTO',
'      from v_gf_g_convenios_anulacion',
'     where id_cnvnio = :P117_ID_CNVNIO;',
'     ',
' elsif :P117_CDGO_CNVNIO_ESTDO = ''RVS'' then ',
'    select id_acto,',
'           nmro_acto|| ''.pdf'' ',
'      into :P117_ID_ACTO,',
'           :P117_NMBRE_ACTO',
'      from v_gf_g_convenios_reversion',
'     where id_cnvnio = :P117_ID_CNVNIO;',
'',
' end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P117_ID_CNVNIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
