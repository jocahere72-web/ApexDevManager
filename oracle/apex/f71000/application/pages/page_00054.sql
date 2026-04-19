prompt --application/pages/page_00054
begin
wwv_flow_api.create_page(
 p_id=>54
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Resumen de Acuerdo de Pago'
,p_step_title=>'Resumen de Acuerdo de Pago'
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
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210826103502'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146945468925211665)
,p_plug_name=>'Datos del Convenio'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103475176864978289)
,p_plug_name=>'<b>SUJETO TRIBUTO</b>'
,p_parent_plug_id=>wwv_flow_api.id(146945468925211665)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103821915409153790)
,p_plug_name=>unistr('<b>INFORMACI\00D3N DEL SOLICITANTE </b>')
,p_parent_plug_id=>wwv_flow_api.id(146945468925211665)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103822002591153791)
,p_plug_name=>'<b>DATOS DEL ACUERDO</b>'
,p_parent_plug_id=>wwv_flow_api.id(146945468925211665)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4855117939958902)
,p_plug_name=>'Cuota(s) Inicial'
,p_parent_plug_id=>wwv_flow_api.id(103822002591153791)
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.nmro_dcmnto',
'        , b.fcha_vncmnto',
'        , b.vlor_ttal_dcmnto',
'        , b.dscrpcion_indcdor_pgo_aplcdo',
'        , c.fcha_rcdo',
'    from gf_g_cnvnios_cta_incl_vgnc a',
'    join v_re_g_documentos          b on a.id_dcmnto    = b.id_dcmnto',
'    join re_g_recaudos              c on a.id_dcmnto    = c.id_orgen',
'    where a.id_cnvnio               = :P54_ID_CNVNIO',
' order by b.nmro_dcmnto   '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_exge_cta_incial',
'  from gf_d_convenios_tipo ',
' where id_cnvnio_tpo = :P54_ID_CNVNIO_TPO',
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
 p_id=>wwv_flow_api.id(4855277657958903)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>4855277657958903
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4855324952958904)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4855472065958905)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha de Vencimiento <br>del Docuemnto'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4855590492958906)
,p_db_column_name=>'VLOR_TTAL_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4855696352958907)
,p_db_column_name=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\00BFDocumento Pagado?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4856689305958917)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha de Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4872069823179784)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'48721'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_DCMNTO:FCHA_VNCMNTO:VLOR_TTAL_DCMNTO:DSCRPCION_INDCDOR_PGO_APLCDO:FCHA_RCDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(207231109095646516)
,p_plug_name=>'Cartera'
,p_region_name=>'deuda'
,p_parent_plug_id=>wwv_flow_api.id(103822002591153791)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
'where id_cnvnio = :P54_ID_CNVNIO',
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
 p_id=>wwv_flow_api.id(119323341643773601)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>119323341643773601
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119323452789773602)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119323538757773603)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Per\00EDdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119323623591773604)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119323720585773605)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119323868549773606)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(119335060360785628)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1193351'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192337605032955355)
,p_plug_name=>unistr('Garant\00EDas')
,p_parent_plug_id=>wwv_flow_api.id(146945468925211665)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
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
'  where id_cnvnio = :P54_ID_CNVNIO',
' order by 1',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_rqre_grntia',
'  from gf_d_convenios_tipo ',
' where id_cnvnio_tpo = :P54_ID_CNVNIO_TPO',
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
 p_id=>wwv_flow_api.id(148906964918680895)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>148906964918680895
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(52504760496152112)
,p_db_column_name=>'DESCRIP'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(52505155158152112)
,p_db_column_name=>'TIPO_GARANTIA'
,p_display_order=>80
,p_column_identifier=>'R'
,p_column_label=>'Tipo Garantia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(52505592589152112)
,p_db_column_name=>'TIPO'
,p_display_order=>90
,p_column_identifier=>'S'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51647498227643536)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>100
,p_column_identifier=>'T'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GF_G_CNVNIOS_GRNTIA_ADJNTO:FILE_BLOB:ID_CNVNIO_GRNTIA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51647574336643537)
,p_db_column_name=>'ID_CNVNIO_GRNTIA_ADJNTO'
,p_display_order=>110
,p_column_identifier=>'U'
,p_column_label=>'Id Cnvnio Grntia Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(148942140773430755)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'525059'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIPO:DESCRIP::DESCARGAR:ID_CNVNIO_GRNTIA_ADJNTO'
,p_break_on=>'TIPO:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:TIPO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(193198845785139286)
,p_plug_name=>'Plan de Pago'
,p_parent_plug_id=>wwv_flow_api.id(146945468925211665)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
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
'  where id_cnvnio = :P54_ID_CNVNIO',
'    and actvo = ''S'';'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P54_ID_CNVNIO'
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
 p_id=>wwv_flow_api.id(152569700216096186)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'<b>&P44_RSPSTA.</b>'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>152569700216096186
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(52501213835152107)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119323902319773607)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>60
,p_column_identifier=>'W'
,p_column_label=>'Fecha <br>Vencimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4221185308663404)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>70
,p_column_identifier=>'AA'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4221277932663405)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>90
,p_column_identifier=>'AB'
,p_column_label=>'Valor Interes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4221379558663406)
,p_db_column_name=>'VLOR_FNCNCION'
,p_display_order=>100
,p_column_identifier=>'AC'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4221414779663407)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>110
,p_column_identifier=>'AD'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3003235557605419)
,p_db_column_name=>'ESTDO_CTA'
,p_display_order=>120
,p_column_identifier=>'AE'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(194474616215652164)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'525024'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_VNCMNTO:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCNCION:VLOR_TTAL::ESTDO_CTA'
,p_sort_column_1=>'NMRO_CTA'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'VLOR_CTA:VLOR_TTAL:VLOR_FNCNCION:VLOR_INTRES:VLOR_CPTAL'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(74989350901775312)
,p_report_id=>wwv_flow_api.id(194474616215652164)
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
 p_id=>wwv_flow_api.id(74989796578775312)
,p_report_id=>wwv_flow_api.id(194474616215652164)
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
 p_id=>wwv_flow_api.id(147482997772566315)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(193556874084275563)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(52612177002170305)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(147482997772566315)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52629661827289654)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(147482997772566315)
,p_button_name=>'BTN_APBAR_CONVNIO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar Acuerdo'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio',
'  from gf_g_convenios',
' where id_cnvnio = :P54_ID_CNVNIO',
'   and cdgo_cnvnio_estdo = ''SLC'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89188685149064934)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(147482997772566315)
,p_button_name=>'BTN_APLICAR_ACUERDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Acuerdo'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio',
'  from gf_g_convenios',
' where id_cnvnio = :P54_ID_CNVNIO',
'   and cdgo_cnvnio_estdo = ''APB'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-window-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52630706341307654)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(147482997772566315)
,p_button_name=>'BTN_RECHAZAR_ACUERDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Rechazar Acuerdo'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio',
'  from gf_g_convenios',
' where id_cnvnio = :P54_ID_CNVNIO',
'   and (cdgo_cnvnio_estdo = ''SLC'' or cdgo_cnvnio_estdo = ''APB'')'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89419654424082102)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(147482997772566315)
,p_button_name=>'BTN_EDTAR_CNVNIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Editar Acuerdo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,52,69,73,70,84:P69_ID_INSTNCIA_FLJO,P69_ID_CNVNIO,P52_ID_INSTNCIA_FLJO,P52_ID_CNVNIO,P69_BRANCH:&P54_ID_INSTNCIA_FLJO.,&P54_ID_CNVNIO.,&P54_ID_INSTNCIA_FLJO.,&P54_ID_CNVNIO.,&APP_PAGE_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio',
'  from gf_g_convenios ',
' where id_cnvnio = :P54_ID_CNVNIO',
'   and cdgo_cnvnio_estdo in (''SLC'', ''APB'')'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-window-edit'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(85275115616343104)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(147482997772566315)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:GD_G_DOCUMENTOS,ID_DCMNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P54_ID_DCMNTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cnvnio',
'  from gf_g_convenios',
' where id_cnvnio = :P54_ID_CNVNIO',
'   and cdgo_cnvnio_estdo in (''APL'',''RCH'',''ANL'', ''RVS'')',
'   and id_acto is not null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(93299046282039903)
,p_branch_name=>'Aplicar Acuerdo de Pago'
,p_branch_action=>'f?p=&APP_ID.:136:&SESSION.::&DEBUG.:136:P136_CDGO_ACCION_TPO,P136_BRANCH:APL,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(89188685149064934)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(93298806528039901)
,p_branch_name=>'Rechazar Acuerdo de Pago'
,p_branch_action=>'f?p=&APP_ID.:136:&SESSION.::&DEBUG.:RP,136:P136_CDGO_ACCION_TPO,P136_BRANCH:RCH,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(52630706341307654)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(14791636556795904)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=66000:2:&SESSION.:PRINT_REPORT=gf_g_aplicacion_acuerdo_rtf:&DEBUG.:RP:P2_PRMTRO_1:&P54_ID_CNVNIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(85275115616343104)
,p_branch_sequence=>30
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4043682893227204)
,p_branch_name=>'Ir a la Pagina Anterior'
,p_branch_action=>'P54_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(52612177002170305)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4043741152227205)
,p_name=>'P54_BRANCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(147482997772566315)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13686034050795132)
,p_name=>'P54_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(147482997772566315)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13686314176795135)
,p_name=>'P54_ID_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(146945468925211665)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52496273707152102)
,p_name=>'P54_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(146945468925211665)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52496682377152103)
,p_name=>'P54_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103475176864978289)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52497021554152103)
,p_name=>'P54_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(103475176864978289)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
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
 p_id=>wwv_flow_api.id(52497438864152103)
,p_name=>'P54_ID_CNVNIO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(103822002591153791)
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
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52497833379152103)
,p_name=>'P54_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(103475176864978289)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52499334279152104)
,p_name=>'P54_FCHA_PRMRA_CTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(103822002591153791)
,p_prompt=>'Fecha Primera Cuota'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52499725443152104)
,p_name=>'P54_NMRO_CTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(103822002591153791)
,p_prompt=>unistr('N\00B0 Cuotas')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52500119508152105)
,p_name=>'P54_CDGO_PRDCDAD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(103822002591153791)
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
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52506691226152113)
,p_name=>'P54_CDGO_IDNTFFCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103821915409153790)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52507091111152113)
,p_name=>'P54_NMRO_IDNTFCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103821915409153790)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52507446080152114)
,p_name=>'P54_NMBRE_CMPLTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103821915409153790)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52507856474152114)
,p_name=>'P54_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(103821915409153790)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52508247943152115)
,p_name=>'P54_DRCCION_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(103821915409153790)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52508646107152115)
,p_name=>'P54_TLFNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(103821915409153790)
,p_prompt=>unistr('Tel\00E9fono / Celular')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52509010236152115)
,p_name=>'P54_EMAIL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(103821915409153790)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52511769030153502)
,p_name=>'P54_ID_CNVNIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103475176864978289)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72521487956622001)
,p_name=>'P54_NMRO_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103822002591153791)
,p_prompt=>unistr('Acuerdo N\00B0:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85275250357343105)
,p_name=>'P54_CDGO_CNVNIO_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(103822002591153791)
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
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89188774279064935)
,p_name=>'P54_ID_INSTNCIA_FLJO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(103475176864978289)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90175754486535804)
,p_name=>'P54_NMRO_CTAS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(103822002591153791)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90175936795535806)
,p_name=>'P54_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146945468925211665)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90176082886535807)
,p_name=>'P54_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(146945468925211665)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90177380768535820)
,p_name=>'P54_NMBRE_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(103475176864978289)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90177431289535821)
,p_name=>'P54_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(103475176864978289)
,p_prompt=>'SubTributo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92026600015739109)
,p_name=>'P54_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103822002591153791)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95033033097393802)
,p_name=>'P54_ID_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(146945468925211665)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95033183552393803)
,p_name=>'P54_NMBRE_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(146945468925211665)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111651576507276201)
,p_name=>'P54_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103822002591153791)
,p_prompt=>unistr('N\00B0 Radicado')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(93299889507039911)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P54_ID_INSTNCIA_FLJO'
,p_compute_when=>'P54_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90918565970563905)
,p_validation_name=>'Valida si la fecha esta vencida APROBAR'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
' from v_gf_g_convenios_extracto a',
'where a.nmro_cta = 1  ',
'  and a.estdo_cta = ''VENCIDA'' ',
'  and a.id_cnvnio = :P54_ID_CNVNIO'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('No puede aprobar Acuerdo Pago, la fecha est\00E1 vencida.')
,p_when_button_pressed=>wwv_flow_api.id(52629661827289654)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(57861544322051401)
,p_validation_name=>'Valida si la fecha esta vencida APLICAR'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
' from v_gf_g_convenios_extracto a',
'where a.nmro_cta = 1  ',
'  and a.estdo_cta = ''VENCIDA'' ',
'  and a.id_cnvnio = :P54_ID_CNVNIO'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('No puede aplicar Acuerdo Pago, la fecha est\00E1 vencida.')
,p_when_button_pressed=>wwv_flow_api.id(89188685149064934)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(85275318558343106)
,p_name=>'Al cerrar modal - hacer submit'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(147482997772566315)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(85275483232343107)
,p_event_id=>wwv_flow_api.id(85275318558343106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'LUZ'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90773076139461501)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobar Acuerdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(10000);',
'    ',
'begin    ',
'    pkg_gf_convenios.prc_ap_aprobar_acuerdo_pago (p_cdgo_clnte   =>  :F_CDGO_CLNTE,',
'                                                  p_id_cnvnio    =>  :P54_ID_CNVNIO,',
'                                                  p_id_usrio     =>  :F_ID_USRIO,',
'                                                  o_cdgo_rspsta  =>  v_cdgo_rspsta,',
'                                                  o_mnsje_rspsta =>  :P54_RSPSTA);',
'                                 ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(52629661827289654)
,p_process_when=>'P54_ID_CNVNIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P54_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14915366835913425)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Solicitud Acuerdo Pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'  v_cdgo_rspsta     number;',
'  v_id_acto         gn_g_actos.id_acto%type;',
'',
'begin',
'    pkg_gf_convenios.prc_ap_aplicar_acuerdo_pago (p_cdgo_clnte      =>  :F_CDGO_CLNTE,',
'                                                  p_id_cnvnio       =>  :P54_ID_CNVNIO,',
'                                                  p_id_usrio        =>  :F_ID_USRIO,                                       ',
'                                                  p_id_plntlla      =>  :P54_ID_PLNTLLA,',
'                                                  o_id_acto         =>  :P54_ID_ACTO,',
'                                                  o_mnsje_rspsta    =>  :P54_RSPSTA,',
'                                                  o_cdgo_rspsta     =>  v_cdgo_rspsta);',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20050, :P54_RSPSTA);',
'    end if;',
'exception',
'    when others then',
'        raise_application_error(-20001, sqlerrm);',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(89188685149064934)
,p_process_success_message=>'&P54_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52511607594153501)
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
'       into :P54_IDNTFCCION,',
'            :P54_DRCCION,',
'            :P54_ID_CNVNIO_TPO,',
'            :P54_NMRO_CNVNIO,',
'            :P54_CDGO_IDNTFFCION_TPO,',
'            :P54_NMRO_IDNTFCION,',
'            :P54_NMBRE_CMPLTO,',
'            :P54_DRCCION_NTFCCION,',
'            :P54_UBCCION,',
'            :P54_EMAIL,',
'            :P54_TLFNO,',
'            :P54_NMRO_CTA, ',
'            :P54_CDGO_PRDCDAD,',
'            :P54_FCHA_PRMRA_CTA,',
'            :P54_CDGO_CNVNIO_ESTDO,',
'            :P54_ID_INSTNCIA_FLJO,',
'            :P54_NMRO_CTAS,',
'            :P54_ID_IMPSTO,',
'            :P54_ID_IMPSTO_SBMPSTO,',
'            :P54_ID_SJTO_IMPSTO,',
'            :P54_NMBRE_IMPSTO,',
'            :P54_NMBRE_IMPSTO_SBMPSTO,',
'            :P54_CDGO_IDNTFFCION_TPO,',
'            :P54_NMRO_RDCDO_DSPLAY,',
'            :P54_ID_CNVNIO',
'       from v_gf_g_convenios a',
'       where (a.id_cnvnio = :P54_ID_CNVNIO ',
'          or  a.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO);    ',
'exception',
'    when others then',
'        raise_application_error(-20000, ''Error al consultar los datos del convenio: ''||sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95032987642393801)
,p_process_sequence=>30
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Datos del Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P54_CDGO_CNVNIO_ESTDO not in (''ANL'', ''RVS'') then',
'    begin',
'        select b.id_acto,',
'               b.nmro_acto|| ''.pdf'' ,',
'               b.id_dcmnto',
'          into :P54_ID_ACTO,',
'               :P54_NMBRE_ACTO,',
'               :P54_ID_DCMNTO',
'          from v_gf_g_convenios a',
'          join gn_g_actos        b on a.id_acto = b.id_acto',
'         where id_cnvnio = :P54_ID_CNVNIO;',
'    exception',
'        when others then ',
'             null;',
'    end;',
'     ',
' elsif :P54_CDGO_CNVNIO_ESTDO = ''ANL'' then',
'     select id_acto,',
'           nmro_acto|| ''.pdf'' ',
'      into :P54_ID_ACTO,',
'           :P54_NMBRE_ACTO',
'      from v_gf_g_convenios_anulacion',
'     where id_cnvnio = :P54_ID_CNVNIO;',
'     ',
' elsif :P54_CDGO_CNVNIO_ESTDO = ''RVS'' then ',
'    select id_acto,',
'           nmro_acto|| ''.pdf'' ',
'      into :P54_ID_ACTO,',
'           :P54_NMBRE_ACTO',
'      from v_gf_g_convenios_reversion',
'     where id_cnvnio = :P54_ID_CNVNIO;',
'',
' end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P54_ID_CNVNIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13686127979795133)
,p_process_sequence=>40
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Id Plantilla Aplicaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_plntlla',
'      into :P54_ID_PLNTLLA',
'      from gn_d_plantillas',
'     where id_acto_tpo = ( ',
'                            select id_acto_tpo_cnvnio',
'                              from gf_d_convenios_tipo',
'                             where id_cnvnio_tpo = :P54_ID_CNVNIO_TPO',
'                         );',
'    exception',
'        when others then',
'            raise_application_error(-20000, ''Error al consultar la plantilla: ''||sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
