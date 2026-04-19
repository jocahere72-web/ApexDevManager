prompt --application/pages/page_00107
begin
wwv_flow_api.create_page(
 p_id=>107
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro Ajuste'
,p_step_title=>'Registro Ajuste'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function recorrer_grid() { ',
'    ',
'   var region = apex.region("conceptos_ajustes");',
'   var id_ajuste = $(''#P14_ID_AJSTE'').val();',
'    ',
'    if (region && !id_ajuste) {',
'        ',
'       var view = apex.region("conceptos_ajustes").widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");       ',
'        ',
'       var json = records.map(function(record){           ',
'           return { "VGNCIA": model.getValue(record, "VGNCIA").trim(),',
'                    "ID_PRDO": model.getValue(record, "ID_PRDO"),',
'                    "ID_CNCPTO": model.getValue(record, "ID_CNCPTO"),',
'                    "VLOR_SLDO_CPTAL": model.getValue(record, "VLOR_SLDO_CPTAL").trim().split(''.'').join(''''),',
'                    "VLOR_AJSTE": model.getValue(record, "VLOR_AJSTE").trim().split(''.'').join('''')',
'                  };',
'       }).filter(function(f){',
'          return parseFloat(f["VLOR_AJSTE"]) > 0 ;',
'       }); ',
'       $(''#P14_JSON'').val(json.length > 0 ? JSON.stringify(json) : '''');     ',
'   } ',
'   ',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101165025'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79403488363385904)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(257433959558869218)
,p_plug_name=>unistr('<b>Informaci\00F3n</b>')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P107_ID_SJTO_IMPSTO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(256891476251908197)
,p_plug_name=>'Datos del Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(257433959558869218)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_sjto_impsto,   ',
'        a.nmbre_impsto,',
'        a.idntfccion_sjto,',
'        a.drccion,',
'        '' '' || a.nmbre_mncpio || '' - '' || upper(a.nmbre_dprtmnto)  || '' '' ||a.nmbre_pais  ubicacion,',
'        a.dscrpcion_sjto_estdo ',
'   from v_si_i_sujetos_impuesto a',
'  where a.cdgo_clnte      = :F_CDGO_CLNTE',
'    and a.id_sjto_impsto  = :P107_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(256891584739908198)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>256891584739908198
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79226203257510859)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>'SJTO_IMPSTO'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79225425620510858)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79224619416510858)
,p_db_column_name=>'DRCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79225015646510858)
,p_db_column_name=>'UBICACION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Ubicaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79225868109510859)
,p_db_column_name=>'DSCRPCION_SJTO_ESTDO'
,p_display_order=>60
,p_column_identifier=>'B'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79224294162510857)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>unistr('Identificaci\00F3n del Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(256935116213441454)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'792266'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'NMBRE_IMPSTO:DSCRPCION_SJTO_ESTDO:DRCCION:UBICACION:ID_SJTO_IMPSTO:IDNTFCCION_SJTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(257019628595925411)
,p_plug_name=>'Datos del Predio'
,p_parent_plug_id=>wwv_flow_api.id(257433959558869218)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select ',
'    a.dscrpcion_prdo_dstno,',
'    a.dscrpcion_estrto,',
'    a.dscrpcion_prdio_clsfccion',
'    ,a.avluo_ctstral,',
'    a.avluo_cmrcial,',
'    a.area_cnstrda,',
'    a.mtrcla_inmblria,',
'    a.nmbre_dstno_igac ',
'  from v_si_i_predios a ',
'  join si_i_sujetos_impuesto b ',
'--   on a.id_sjto = b.id_sjto',
'  on a.id_sjto_impsto = b.id_sjto_impsto',
' where  b.id_sjto_impsto  = :P107_ID_SJTO_IMPSTO ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  a.cdgo_sjto_tpo',
' from v_si_i_sujetos_impuesto a',
' where a.id_sjto_impsto   = :P107_ID_SJTO_IMPSTO  and a.cdgo_clnte = :F_CDGO_CLNTE and  a.cdgo_sjto_tpo = ''P'';'))
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
 p_id=>wwv_flow_api.id(257019838159925413)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>257019838159925413
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79227391665510864)
,p_db_column_name=>'DSCRPCION_PRDO_DSTNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79227709375510864)
,p_db_column_name=>'DSCRPCION_ESTRTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79228171404510864)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Clasificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79228597368510865)
,p_db_column_name=>'AVLUO_CTSTRAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Aval\00FAo Catrastral')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79228971521510865)
,p_db_column_name=>'AVLUO_CMRCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Aval\00FAo Comercial')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79229367319510866)
,p_db_column_name=>'AREA_CNSTRDA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79229729094510866)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Matr\00EDcula')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79230107947510867)
,p_db_column_name=>'NMBRE_DSTNO_IGAC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Destino Igac'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(257415978897121016)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'792305'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_PRDO_DSTNO:DSCRPCION_ESTRTO:DSCRPCION_PRDIO_CLSFCCION:AVLUO_CTSTRAL:AVLUO_CMRCIAL:AREA_CNSTRDA:MTRCLA_INMBLRIA:NMBRE_DSTNO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(257021814580925433)
,p_plug_name=>unistr('Datos del Veh\00EDculo')
,p_parent_plug_id=>wwv_flow_api.id(257433959558869218)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'    a.nmbre_vhclo_mrca,',
'    a.vlor_cmrcial,',
'    a.avluo,',
'    a.fcha_cmpra,',
'    a.nmro_mtrcla,',
'    a.nmro_mtor, ',
'    a.nmbre_vhclo_clse,',
'    a.nmbre_vhclo_ctgtria ',
' from v_si_i_vehiculos a',
' where a.id_sjto_impsto    = :P107_ID_SJTO_IMPSTO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  a.cdgo_sjto_tpo',
' from v_si_i_sujetos_impuesto a',
' where a.id_sjto_impsto   = :P107_ID_SJTO_IMPSTO  and a.cdgo_clnte = :F_CDGO_CLNTE and  a.cdgo_sjto_tpo = ''V'';'))
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
 p_id=>wwv_flow_api.id(257021877990925434)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AALFARO'
,p_internal_uid=>257021877990925434
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79231257209510868)
,p_db_column_name=>'NMBRE_VHCLO_MRCA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Veh\00EDculo marca')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79231695190510868)
,p_db_column_name=>'VLOR_CMRCIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor comercial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79232041383510868)
,p_db_column_name=>'AVLUO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79232417786510869)
,p_db_column_name=>'FCHA_CMPRA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Compra'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79232825434510869)
,p_db_column_name=>'NMRO_MTRCLA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('N\00FAmero Matr\00EDcula')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79233214470510869)
,p_db_column_name=>'NMRO_MTOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero Motor')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79233668650510871)
,p_db_column_name=>'NMBRE_VHCLO_CLSE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Clase Veh\00EDculo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79234033581510871)
,p_db_column_name=>'NMBRE_VHCLO_CTGTRIA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Categor\00EDa Veh\00EDculo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(258180649357481649)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'792344'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_VHCLO_MRCA:VLOR_CMRCIAL:AVLUO:FCHA_CMPRA:NMRO_MTRCLA:NMRO_MTOR:NMBRE_VHCLO_CLSE:NMBRE_VHCLO_CTGTRIA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(257022793205925443)
,p_plug_name=>'Datos del Propietario'
,p_parent_plug_id=>wwv_flow_api.id(257433959558869218)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select ',
'    a.nmbre_rzon_scial,',
'    a.dscrpcion_idntfccion_tpo ,',
'    a.idntfccion_rspnsble ,',
'     case when prncpal_s_n = ''S'' then',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="true" checked>'' ',
'        else  ',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="true">'' ',
'       end as prncpal_s_n',
'  from v_si_i_sujetos_responsable a',
'  join si_i_sujetos_impuesto b on a.id_sjto = b.id_sjto',
'  where a.cdgo_clnte     = :F_CDGO_CLNTE',
'  and a.id_sjto  = :P107_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(257433545734869213)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>257433545734869213
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79235568940510872)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79235997875510872)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79236317063510872)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Principal '
,p_column_html_expression=>'<input type="checkbox" checked >'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79235194306510872)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(257455941346144715)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'792367'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_IDNTFCCION_TPO:IDNTFCCION_RSPNSBLE:PRNCPAL_S_N:NMBRE_RZON_SCIAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(257434064434869219)
,p_plug_name=>'<b>Registro de Ajuste</b>'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_cncpto',
'  from v_gf_g_cartera_x_concepto a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.id_sjto_impsto    = :P107_ID_SJTO_IMPSTO',
'   and a.id_impsto         = :P107_ID_IMPSTO',
'   and a.id_impsto_sbmpsto = :P107_ID_IMPSTO_SBMPSTO',
'   and a.vlor_sldo_cptal   > 0 ;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(256245173884594004)
,p_plug_name=>'Conceptos del Ajuste'
,p_region_name=>'conceptos_ajustes'
,p_parent_plug_id=>wwv_flow_api.id(257434064434869219)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.vgncia ,',
'        a.id_prdo,',
'        a.prdo,',
'        a.id_cncpto,',
'        a.cdgo_cncpto,',
'        a.dscrpcion_cncpto ,',
'        a.vlor_sldo_cptal,',
'         ''$'' || to_char(a.vlor_sldo_cptal, ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_sldo_cptal_mascarca,',
'        nvl(a.vlor_intres,0) vlor_intres,',
'          ''$'' || to_char( nvl(a.vlor_intres,0), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_intres_mascara,',
'        rownum as num',
' from v_gf_g_cartera_x_concepto a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.id_sjto_impsto = :P107_ID_SJTO_IMPSTO',
'  and a.vlor_sldo_cptal > 0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P107_ID_AJSTE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(119832755189243638)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(119832894758243639)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(127417262011945850)
,p_name=>'VLOR_SLDO_CPTAL_MASCARCA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL_MASCARCA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(127417372345945851)
,p_name=>'VLOR_INTRES_MASCARA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MASCARA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Valor Inter\00E9s ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(129319968399763641)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258300780551589797)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>true
,p_static_id=>'estilo'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    options.features = options.features || {};',
'    options.features.sort = false;',
'    return options;',
'}'))
,p_enable_hide=>true
,p_help_text=>'Valor ajuste no puede ser cero ni nulo'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258301974212589809)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258302242239589811)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258302364107589813)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258302469179589814)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Descripci\00F3n Concepto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258302606692589815)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258302740413589816)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(258302803941589817)
,p_name=>'NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(256245419473594006)
,p_internal_uid=>256245419473594006
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(257624101612257036)
,p_interactive_grid_id=>wwv_flow_api.id(256245419473594006)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(257624167058257037)
,p_report_id=>wwv_flow_api.id(257624101612257036)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119938693107065619)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(119832755189243638)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119939190367065622)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(119832894758243639)
,p_is_visible=>true
,p_is_frozen=>true
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(128307146673451896)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(127417262011945850)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>260
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(128307570696451898)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(127417372345945851)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>264
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258327125837669756)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(258300780551589797)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>318
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258351513028840057)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(258301974212589809)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258353094022840078)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(258302242239589811)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258354663055840083)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(258302364107589813)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258355529506840086)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(258302469179589814)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>415
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258356305935840088)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(258302606692589815)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258357100971840090)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(258302740413589816)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(258357855541840092)
,p_view_id=>wwv_flow_api.id(257624167058257037)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(258302803941589817)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(259509848622066427)
,p_plug_name=>'Conceptos del Ajuste Detalle'
,p_region_name=>'conceptos_ajustes'
,p_parent_plug_id=>wwv_flow_api.id(257434064434869219)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>120
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    id_ajste_dtlle, ',
'    id_ajste,',
'    dscrpcion_concepto,',
'    vgncia,',
'    dscrpcion_periodo,',
'    sldo_cptal,',
'    vlor_ajste,',
'      ''$'' || to_char(vlor_ajste, ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_ajste_mascara',
'  from v_gf_g_ajuste_detalle ',
'where id_ajste = :P107_ID_AJSTE;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P107_ID_AJSTE'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P107_ID_AJSTE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110900033033435151)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110900149775435152)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(127417614857945854)
,p_name=>'VLOR_AJSTE_MASCARA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE_MASCARA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(260212178482343307)
,p_name=>'ID_AJSTE_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(260212273751343308)
,p_name=>'ID_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(260212395945343309)
,p_name=>'DSCRPCION_CONCEPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CONCEPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(260212525649343310)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(260212552775343311)
,p_name=>'DSCRPCION_PERIODO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PERIODO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(260212652428343312)
,p_name=>'SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(260212762397343313)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(260212064507343306)
,p_internal_uid=>260212064507343306
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(260243617655384230)
,p_interactive_grid_id=>wwv_flow_api.id(260212064507343306)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(260243747667384230)
,p_report_id=>wwv_flow_api.id(260243617655384230)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(128503613225915540)
,p_view_id=>wwv_flow_api.id(260243747667384230)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(127417614857945854)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(129562599690784021)
,p_view_id=>wwv_flow_api.id(260243747667384230)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(110900033033435151)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>157
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(260244150904384232)
,p_view_id=>wwv_flow_api.id(260243747667384230)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(260212178482343307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(260244670514384234)
,p_view_id=>wwv_flow_api.id(260243747667384230)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(260212273751343308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(260245148215384236)
,p_view_id=>wwv_flow_api.id(260243747667384230)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(260212395945343309)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(260245662089384237)
,p_view_id=>wwv_flow_api.id(260243747667384230)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(260212525649343310)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(260246209075384239)
,p_view_id=>wwv_flow_api.id(260243747667384230)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(260212552775343311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(260246732782384240)
,p_view_id=>wwv_flow_api.id(260243747667384230)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(260212652428343312)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(260247172149384242)
,p_view_id=>wwv_flow_api.id(260243747667384230)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(260212762397343313)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(433033605014181881)
,p_plug_name=>'Datos del Ajuste'
,p_parent_plug_id=>wwv_flow_api.id(257434064434869219)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P107_ID_AJSTE'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(260212875338343314)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>75
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
 p_id=>wwv_flow_api.id(264967232008773594)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(267474125742464012)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>85
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'<p>Esta funcionalidad permite gestionar los procesos de ajustes .</p>',
'<p>Se debe ingresar el valor del ajuste en la seccion Conceptos del Ajustes en el campo Valor Ajuste </p>',
'<p> </p>',
'<p><b>Nota:</b> Solo se enviaran los conceptos seleccionados y con valor ajuste mayor a cero </p>',
'</i>',
'</br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79253396244510907)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(260212875338343314)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP,18::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79255361724510909)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(260212875338343314)
,p_button_name=>'BTN_INSRTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_cncpto',
'  from v_gf_g_cartera_x_concepto a',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.id_sjto_impsto    = :P107_ID_SJTO_IMPSTO',
'   and a.id_impsto         = :P107_ID_IMPSTO',
'   and a.id_impsto_sbmpsto = :P107_ID_IMPSTO_SBMPSTO ',
'   and a.vlor_sldo_cptal   > 0',
'   and :P107_ID_AJSTE is null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79255719300510909)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(260212875338343314)
,p_button_name=>'BTN_APRBAR'
,p_button_static_id=>'BTN_APRBAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar Ajuste'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    cdgo_fljo_ajste ',
' from df_s_flujo_ajuste ',
'where cdgo_fljo_ajste = ''RGAAP'' ',
'  and cdgo_clnte = :F_CDGO_CLNTE'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79256128758510910)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(260212875338343314)
,p_button_name=>'BTN_IMPRMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>':P107_ID_AJSTE IS NOT NULL AND :P107_CDGO_ESTDO_AJSTE IN ( ''A'', ''AP'')'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79253743508510908)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(260212875338343314)
,p_button_name=>'BTN_NO_APRBAR'
,p_button_static_id=>'BTN_NO_APRBAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'No Aprobar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    cdgo_fljo_ajste ',
' from df_s_flujo_ajuste ',
'where cdgo_fljo_ajste = ''RGAAP'' ',
'  and cdgo_clnte = :F_CDGO_CLNTE'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79254199119510908)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(260212875338343314)
,p_button_name=>'BTN_APLCR'
,p_button_static_id=>'BTN_APLCR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Ajuste'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>':P107_CDGO_ESTDO_AJSTE IN (''A'',''RG'')'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79254554349510908)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(260212875338343314)
,p_button_name=>'BTN_NO_APLCR'
,p_button_static_id=>'BTN_NO_APLCR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'No Aplicar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>':P107_CDGO_ESTDO_AJSTE IN (''A'',''RG'')'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79254921967510908)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(260212875338343314)
,p_button_name=>'BTN_ANLAR'
,p_button_static_id=>'BTN_ANLAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anular'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>':P107_CDGO_ESTDO_AJSTE IN (''NA'',''NAP'')'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79256857312510911)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(264967232008773594)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_condition=>'P107_ID_AJSTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79257254611510911)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(264967232008773594)
,p_button_name=>'BTN_CONSLTR_PRMTROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO:&APP_ID.,&APP_PAGE_ID.,P107_ID_SJTO_IMPSTO,&P107_ID_IMPSTO.'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P107_ID_AJSTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(79269415075510929)
,p_branch_name=>'Imprimir Reporte Ajuste'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:&P107_ID_RPRTE.,<id_ajuste>&P107_ID_AJSTE.</id_ajuste><id_impuesto>&P107_ID_IMPSTO.</id_impuesto>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(79256128758510910)
,p_branch_sequence=>30
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P107_ID_AJSTE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79243469707510898)
,p_name=>'P107_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(256245173884594004)
,p_item_default=>'999'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79249449439510905)
,p_name=>'P107_ID_AJSTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(433033605014181881)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79249852501510905)
,p_name=>'P107_NMRO_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(433033605014181881)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00FAmero Solicitud')
,p_source=>'NMRO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79250208684510905)
,p_name=>'P107_TPO_AJSTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(433033605014181881)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Ajuste'
,p_source=>'TPO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Debito;DB,Credito;CR'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79250636237510905)
,p_name=>'P107_ID_AJSTE_MTVO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(433033605014181881)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Motivo'
,p_source=>'ID_AJSTE_MTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_ajste_mtvo',
'from gf_d_ajuste_motivo ',
'where cdgo_clnte=:F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'145'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79251058254510906)
,p_name=>'P107_FCHA_DCMNTO_SPRTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(433033605014181881)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Documento '
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'FCHA_DCMNTO_SPRTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>11
,p_cMaxlength=>255
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79251403429510906)
,p_name=>'P107_TPO_DCMNTO_SPRTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(433033605014181881)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Documento Soporte'
,p_source=>'TPO_DCMNTO_SPRTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_acto,id_prcso ',
'from   v_gn_g_actos_tipo',
'-- where cdgo_clnte = :f_cdgo_clnte and id_prcso=6;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79251862434510906)
,p_name=>'P107_NMRO_DCMTO_SPRTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(433033605014181881)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00FAmero Documento Soporte')
,p_source=>'NMRO_DCMTO_SPRTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79252229697510906)
,p_name=>'P107_OBSRVCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(433033605014181881)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>150
,p_cMaxlength=>255
,p_cHeight=>3
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79252640898510907)
,p_name=>'P107_CDGO_ESTDO_AJSTE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(433033605014181881)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estado'
,p_source=>'CDGO_AJSTE_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'    dscrpcion,',
'    cdgo_ajste_estdo ',
' from gf_d_ajuste_estado',
'where cdgo_ajste_estdo  = :P107_CDGO_ESTDO_AJSTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P107_ID_AJSTE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79257657177510911)
,p_name=>'P107_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(264967232008773594)
,p_prompt=>'<b>Tributo</b>'
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
,p_read_only_when=>'P107_ID_AJSTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79258080169510912)
,p_name=>'P107_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(264967232008773594)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P107_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P107_ID_IMPSTO'
,p_ajax_items_to_submit=>'P107_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P107_ID_AJSTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79258455786510912)
,p_name=>'P107_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(264967232008773594)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79258894466510912)
,p_name=>'P107_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(264967232008773594)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_read_only_when=>'P107_ID_AJSTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79259215353510916)
,p_name=>'P107_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(264967232008773594)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79259674186510916)
,p_name=>'P107_XML'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(264967232008773594)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79260399322510917)
,p_name=>'P107_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(267474125742464012)
,p_prompt=>'Reportes Ajuste'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_rprte d ,',
'       id_rprte r',
'        from gn_d_reportes',
' where cdgo_rprte_grpo = ''AJ1'' and id_rprte=10;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79260893986510922)
,p_validation_name=>unistr('\00CDtem Numero Solicitud no nulo')
,p_validation_sequence=>50
,p_validation=>'P107_NMRO_SLCTUD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese el numero de solicitud de Ajuste'
,p_validation_condition=>'BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(79255361724510909)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79262018763510922)
,p_validation_name=>unistr('\00CDtem Tipo Ajuste no nulo')
,p_validation_sequence=>60
,p_validation=>'P107_TPO_AJSTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor escoja el tipo de ajuste a realizar'
,p_validation_condition=>'BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(79255361724510909)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79261674355510922)
,p_validation_name=>unistr('\00CDtem Id.Motivo no nulo')
,p_validation_sequence=>70
,p_validation=>'P107_ID_AJSTE_MTVO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor escoja el motivo de ajuste a realizar'
,p_validation_condition=>'BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(79255361724510909)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79261210561510922)
,p_validation_name=>'Item Fecha Documento no nulo'
,p_validation_sequence=>80
,p_validation=>'P107_FCHA_DCMNTO_SPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese la fecha del documento'
,p_validation_condition=>'BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(79255361724510909)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79262443959510924)
,p_validation_name=>'Item Tipo Documento no nulo'
,p_validation_sequence=>90
,p_validation=>'P107_TPO_DCMNTO_SPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese el tipo de documento soporte'
,p_validation_condition=>'BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(79255361724510909)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79262803962510924)
,p_validation_name=>'Item Num Documento no nulo'
,p_validation_sequence=>100
,p_validation=>'P107_NMRO_DCMTO_SPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor ingrese el numero de documento soporte'
,p_validation_condition=>'BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(79255361724510909)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79263246205510924)
,p_validation_name=>'Item Observacion no nulo'
,p_validation_sequence=>110
,p_validation=>'P107_OBSRVCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor ingrese una observaci\00F3n sobre el ajuste.')
,p_validation_condition=>'BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(79255361724510909)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79243952324510899)
,p_tabular_form_region_id=>wwv_flow_api.id(256245173884594004)
,p_validation_name=>'Item Valor Ajuste menor Valor Capital'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_vlr_ajste varchar2(100) := :VLOR_AJSTE;',
'    v_vlr_cptal varchar2(100) ;',
'begin',
'    select ',
'        replace(:VLOR_SLDO_CPTAL,''.'') valor ',
'        into v_vlr_cptal ',
'      from dual;',
'    if cast(v_vlr_ajste as number) > cast(v_vlr_cptal as number)then',
'      raise_application_error( -20000, ''El valor del ajuste'' || :VALOR_AJUSTE || '' es mayor que el valor saldo capital''  || :VLR_SLDO_CPTAL );',
' ',
'    end if;',
'end;'))
,p_validation_type=>'PLSQL_ERROR'
,p_error_message=>'el Valor del ajuste debe ser menor que el valor capital'
,p_always_execute=>'Y'
,p_validation_condition=>':VLOR_AJSTE > :VLOR_SLDO_CPTAL'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(177022097068083171)
,p_exec_cond_for_each_row=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79267542857510928)
,p_name=>unistr('Guardar en sesi\00F3n el valor del sub-impuesto selccionado')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P107_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79268096420510928)
,p_event_id=>wwv_flow_api.id(79267542857510928)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P107_ID_IMPSTO_SBMPSTO'',:P107_ID_IMPSTO_SBMPSTO);',
'END;'))
,p_attribute_02=>'P107_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79268448995510928)
,p_name=>'antes de enviar la pagina'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P107_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79268981512510929)
,p_event_id=>wwv_flow_api.id(79268448995510928)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79263968859510925)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Impuesto y Sub-Impuesto del Ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto, id_impsto_sbmpsto, id_sjto_impsto',
'  into :P107_ID_IMPSTO, :P107_ID_IMPSTO_SBMPSTO, :P107_ID_SJTO_IMPSTO',
'   from gf_g_ajustes',
'  where id_ajste = :P107_ID_AJSTE;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P107_ID_AJSTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79263505778510924)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Identificaci\00F3n del Sujeto Impuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.idntfccion_sjto, id_impsto ',
'      into :P107_IDNTFCCION, :P107_ID_IMPSTO ',
'      from v_si_i_sujetos_impuesto a',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto_impsto  = :P107_ID_SJTO_IMPSTO;',
'',
'exception ',
'    when no_data_found then ',
'        apex_util.set_session_state(''P107_IDNTFCCION'',  '''');',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79267190887510927)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto varchar2(500);',
'    ',
'begin',
'    ',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte        = :F_CDGO_CLNTE',
'       and id_impsto         = :P107_ID_IMPSTO',
'       and idntfccion_sjto   = :P107_IDNTFCCION;',
'       ',
'    :P107_RSPSTA := '''';',
'    :P107_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'    ',
'exception when no_data_found then ',
'          :P107_ID_SJTO_IMPSTO := null;',
'          :P107_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_process_error_message=>'&P107_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79256857312510911)
,p_process_success_message=>'&P107_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79264302701510925)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registro Ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
unistr('	v_id_ajste	number;  -- ID del Ajuste. El cual es retornado por el procedimiento de creaci\00F3n de AJUSTE'),
'   ',
'begin',
'	-- Creamos el AJUSTE mediante procedimiento pkg_gf_ajustes.prcd_crear_ajustes',
'    pkg_gf_ajustes.prc_rg_ajustes(',
'        :F_CDGO_CLNTE,',
'        :P107_ID_IMPSTO,',
'        :P107_ID_IMPSTO_SBMPSTO,',
'        :P107_ID_SJTO_IMPSTO,',
'        :P107_ORGEN,',
'        :P107_TPO_AJSTE,',
'        :p107_ID_AJSTE_MTVO,',
'        :P107_OBSRVCION,',
'        :P107_TPO_DCMNTO_SPRTE,',
'        :P107_NMRO_DCMTO_SPRTE,',
'        :P107_FCHA_DCMNTO_SPRTE,',
'        :P107_NMRO_SLCTUD,',
'        :F_ID_USRIO,',
'        :P107_JSON,',
'        v_id_ajste);',
'    :F_ID_AJSTE :=   v_id_ajste;',
'    :P107_ID_AJSTE:=  v_id_ajste;',
'end;'))
,p_process_error_message=>'Error no se puede crear el registro de ajuste'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79255361724510909)
,p_process_success_message=>'Ajuste Registrado Correctamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79264769079510925)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update gf_g_ajustes set cdgo_ajste_estdo = ''A'' where id_ajste = :P107_ID_AJSTE; ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79255719300510909)
,p_process_success_message=>'Ajuste Aprobado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79265154255510925)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'No Aprobar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update gf_g_ajustes set cdgo_ajste_estdo = ''NA'' where id_ajste = :P107_ID_AJSTE; ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(180989981584832483)
,p_process_success_message=>'Ajuste No Aprobado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79265530749510925)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'-- Aplicamos el AJUSTE mediante procedimeinto pkg_gf_ajustes.prcd_aplicar_ajuste',
'  PKG_GF_AJUSTES.prc_ap_ajuste(:P107_ID_AJSTE,:P107_ID_SJTO_IMPSTO,:P107_TPO_AJSTE);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79254199119510908)
,p_process_success_message=>'Ajuste Aplicado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79265939030510926)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'No Aplicar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update gf_g_ajustes set cdgo_ajste_estdo = ''NAP'' where id_ajste = :P107_ID_AJSTE; ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79254554349510908)
,p_process_success_message=>'Ajuste No Aplicado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79266345169510926)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anular'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update gf_g_ajustes set cdgo_ajste_estdo = ''ANU'' where id_ajste = :P107_ID_AJSTE; ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79254921967510908)
,p_process_success_message=>'Ajuste Anulado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79266751510510926)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Automatic Row Fetch GF_G_AJUSTES'
,p_attribute_02=>'GF_G_AJUSTES'
,p_attribute_03=>'P107_ID_AJSTE'
,p_attribute_04=>'ID_AJSTE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P107_ID_AJSTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
