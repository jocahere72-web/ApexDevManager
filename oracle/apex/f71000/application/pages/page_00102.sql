prompt --application/pages/page_00102
begin
wwv_flow_api.create_page(
 p_id=>102
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Sujeto Impuesto'
,p_step_title=>'Sujeto Impuesto'
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
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20230210174848'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79403174649385901)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(118985282194096119)
,p_plug_name=>unistr('<b>Informaci\00F3n</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P102_ID_SJTO_IMPSTO'
,p_attribute_01=>'P102_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(257166773128440124)
,p_plug_name=>unistr('<b>Informaci\00F3n</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(256624289821479103)
,p_plug_name=>'Datos del Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(257166773128440124)
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
'    and a.id_sjto_impsto  = :P102_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(256624398309479104)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>256624398309479104
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78959000763081743)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>'SJTO_IMPSTO'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78958258992081742)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78957464768081742)
,p_db_column_name=>'DRCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78957801960081742)
,p_db_column_name=>'UBICACION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Ubicaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78958675475081743)
,p_db_column_name=>'DSCRPCION_SJTO_ESTDO'
,p_display_order=>60
,p_column_identifier=>'B'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78957042386081742)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>unistr('Identificaci\00F3n del Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(256667929783012360)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'789594'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'NMBRE_IMPSTO:DSCRPCION_SJTO_ESTDO:DRCCION:UBICACION:ID_SJTO_IMPSTO:IDNTFCCION_SJTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(256752442165496317)
,p_plug_name=>'Datos del Predio'
,p_parent_plug_id=>wwv_flow_api.id(257166773128440124)
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
' where  b.id_sjto_impsto  = :P102_ID_SJTO_IMPSTO ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  a.cdgo_sjto_tpo',
' from v_si_i_sujetos_impuesto a',
' where a.id_sjto_impsto   = :P102_ID_SJTO_IMPSTO  and a.cdgo_clnte = :F_CDGO_CLNTE and  a.cdgo_sjto_tpo = ''P'';'))
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
 p_id=>wwv_flow_api.id(256752651729496319)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>256752651729496319
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78960160798081744)
,p_db_column_name=>'DSCRPCION_PRDO_DSTNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78960565594081744)
,p_db_column_name=>'DSCRPCION_ESTRTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78960989424081744)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Clasificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78961311420081744)
,p_db_column_name=>'AVLUO_CTSTRAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Aval\00FAo Catrastral')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78961719302081745)
,p_db_column_name=>'AVLUO_CMRCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Aval\00FAo Comercial')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78962122849081745)
,p_db_column_name=>'AREA_CNSTRDA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78962561083081745)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Matr\00EDcula')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78962914745081745)
,p_db_column_name=>'NMBRE_DSTNO_IGAC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Destino Igac'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(257148792466691922)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'789633'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_PRDO_DSTNO:DSCRPCION_ESTRTO:DSCRPCION_PRDIO_CLSFCCION:AVLUO_CTSTRAL:AVLUO_CMRCIAL:AREA_CNSTRDA:MTRCLA_INMBLRIA:NMBRE_DSTNO_IGAC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(256754628150496339)
,p_plug_name=>unistr('Datos del Veh\00EDculo')
,p_parent_plug_id=>wwv_flow_api.id(257166773128440124)
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
' where a.id_sjto_impsto    = :P102_ID_SJTO_IMPSTO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  a.cdgo_sjto_tpo',
' from v_si_i_sujetos_impuesto a',
' where a.id_sjto_impsto   = :P102_ID_SJTO_IMPSTO  and a.cdgo_clnte = :F_CDGO_CLNTE and  a.cdgo_sjto_tpo = ''V'';'))
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
 p_id=>wwv_flow_api.id(256754691560496340)
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
,p_internal_uid=>256754691560496340
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78964058616081746)
,p_db_column_name=>'NMBRE_VHCLO_MRCA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Veh\00EDculo marca')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78964440839081746)
,p_db_column_name=>'VLOR_CMRCIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor comercial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78964821391081746)
,p_db_column_name=>'AVLUO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Aval\00FAo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78965263111081747)
,p_db_column_name=>'FCHA_CMPRA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Compra'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78965650373081747)
,p_db_column_name=>'NMRO_MTRCLA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('N\00FAmero Matr\00EDcula')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78966062284081748)
,p_db_column_name=>'NMRO_MTOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero Motor')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78966412131081748)
,p_db_column_name=>'NMBRE_VHCLO_CLSE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Clase Veh\00EDculo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78966844758081748)
,p_db_column_name=>'NMBRE_VHCLO_CTGTRIA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Categor\00EDa Veh\00EDculo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(257913462927052555)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'789672'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_VHCLO_MRCA:VLOR_CMRCIAL:AVLUO:FCHA_CMPRA:NMRO_MTRCLA:NMRO_MTOR:NMBRE_VHCLO_CLSE:NMBRE_VHCLO_CTGTRIA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(256755606775496349)
,p_plug_name=>'Datos del Propietario'
,p_parent_plug_id=>wwv_flow_api.id(257166773128440124)
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
'       ''<input type="checkbox" name="prncpal_s_n" disabled="disabled" checked>'' ',
'        else  ',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="disabled">'' ',
'       end as prncpal_s_n',
'  from v_si_i_sujetos_responsable a',
'  join si_i_sujetos_impuesto b on a.id_sjto = b.id_sjto',
'  where a.cdgo_clnte     = :F_CDGO_CLNTE',
'  and a.id_sjto  = :P102_ID_SJTO_IMPSTO',
'  ',
' '))
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
 p_id=>wwv_flow_api.id(257166359304440119)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'La consulta no arrojo resultado'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'AALFARO'
,p_internal_uid=>257166359304440119
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78968346637081749)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78968765516081750)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78969183236081750)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Principal '
,p_column_html_expression=>'<input type="checkbox" checked >'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78967979108081749)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(257188754915715621)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'789695'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_IDNTFCCION_TPO:IDNTFCCION_RSPNSBLE:PRNCPAL_S_N:NMBRE_RZON_SCIAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(264700045578344500)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
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
 p_id=>wwv_flow_api.id(267206939312034918)
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
unistr('<p>En esta etapa se consultar\00E1 la Informaci\00F3n General del Sujeto Tributo para gestionar el proceso de ajustes.</p>'),
unistr('<p>Seleccionar el <b>Tributo</b> en la lista de selecci\00F3n. </p>'),
unistr('<p>Seleccionar el <b>Sub-Tributo</b> en la lista de selecci\00F3n.</p>'),
unistr('<p>Seleccionar el n\00FAmero de identificaci\00F3n del Sujeto Tributo en el campo <b>Identificaci\00F3n</b>.</p>'),
unistr('<p>Hacer clic en el bot\00F3n <b>Consultar</b>.</p>'),
unistr('<p>Hacer clic en el bot\00F3n <b>Siguiente</b> para pasar a la siguiente etapa del proceso de ajuste.</p>'),
'',
unistr('<p><b>Nota:</b>Puede Utilizar el bot\00F3n <b>Consulta Par\00E1metros</b> para consultar la identificaci\00F3n del Sujeto Tributo. </p>'),
'',
'</i>',
'</br>',
'',
'<br>',
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(78989760801081763)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(264700045578344500)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_button_condition=>'P102_ID_AJSTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(78990180626081764)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(264700045578344500)
,p_button_name=>'BTN_CONSLTR_PRMTROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_VLDAR_CRTRA,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P102_ID_SJTO_IMPSTO,&P102_ID_IMPSTO.,S,&P102_ID_IMPSTO_SBMPSTO.,P102_ID_IMPSTO,P102_ID_IMPSTO_SBMPSTO'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P102_ID_AJSTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78982398962081760)
,p_name=>'P102_ID_AJSTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(264700045578344500)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78990564781081765)
,p_name=>'P102_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(264700045578344500)
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
,p_read_only_when=>'P102_ID_AJSTE'
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
 p_id=>wwv_flow_api.id(78990928101081765)
,p_name=>'P102_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(264700045578344500)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P102_ID_IMPSTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P102_ID_IMPSTO'
,p_ajax_items_to_submit=>'P102_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P102_ID_AJSTE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78991311075081765)
,p_name=>'P102_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(264700045578344500)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78991748151081765)
,p_name=>'P102_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(264700045578344500)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_read_only_when=>'P102_ID_AJSTE'
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
 p_id=>wwv_flow_api.id(78992110360081765)
,p_name=>'P102_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(264700045578344500)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78992517732081766)
,p_name=>'P102_XML'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(264700045578344500)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79000425660081770)
,p_name=>unistr('Guardar en sesi\00F3n el valor del sub-impuesto selccionado')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P102_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'select'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79000911921081770)
,p_event_id=>wwv_flow_api.id(79000425660081770)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P102_ID_IMPSTO_SBMPSTO'',:P102_ID_IMPSTO_SBMPSTO);',
'END;'))
,p_attribute_02=>'P102_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79001324753081770)
,p_name=>'antes de enviar la pagina'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P102_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79001847483081771)
,p_event_id=>wwv_flow_api.id(79001324753081770)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recorrer_grid();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(115827130800331301)
,p_name=>'Calcular el primer subimpuesto'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P102_ID_IMPSTO'
,p_condition_element=>'P102_ID_IMPSTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(115827257094331302)
,p_event_id=>wwv_flow_api.id(115827130800331301)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P102_ID_IMPSTO_SBMPSTO'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_impsto_sbmpsto            number;',
'    ',
'begin',
'--select id_impsto_sbmpsto into v_id_impsto_sbmpsto from df_i_impuestos_subimpuesto where ID_IMPSTO = :P102_ID_IMPSTO and actvo=''S'' and rownum = 1;  ',
'select id_impsto_sbmpsto into v_id_impsto_sbmpsto from (select * from df_i_impuestos_subimpuesto  order by nmbre_impsto_sbmpsto)  where id_impsto =:P102_ID_IMPSTO and rownum = 1;',
'return v_id_impsto_sbmpsto;',
'end;'))
,p_attribute_07=>'P102_ID_IMPSTO,P102_ID_IMPSTO_SBMPSTO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78996814340081768)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Impuesto y Sub-Impuesto del Ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto, id_impsto_sbmpsto, id_sjto_impsto',
'  into :P102_ID_IMPSTO, :P102_ID_IMPSTO_SBMPSTO, :P102_ID_SJTO_IMPSTO',
'   from gf_g_ajustes',
'  where id_ajste = :P102_ID_AJSTE;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P102_ID_AJSTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78996413601081768)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Identificaci\00F3n del Sujeto Impuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.idntfccion_sjto,',
'    id_impsto,',
'    ( select min( b.id_impsto_sbmpsto) from df_i_impuestos_subimpuesto b where b.id_impsto = a.id_impsto ) as id_impsto_sbmpsto',
'    into  :P102_IDNTFCCION,',
'          :P102_ID_IMPSTO,',
'          :P102_ID_IMPSTO_SBMPSTO',
'    from v_si_i_sujetos_impuesto a',
'     where a.cdgo_clnte      = :F_CDGO_CLNTE',
'       and a.id_sjto_impsto  = :P102_ID_SJTO_IMPSTO;',
'',
'exception ',
'    when no_data_found then ',
'        apex_util.set_session_state(''P102_IDNTFCCION'',  '''');',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(78990180626081764)
,p_process_when_type=>'NEVER'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79000037646081770)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto   varchar2(500);',
'    v_vlor_sldo_cptal  number;',
'begin',
'    begin',
'            select id_sjto_impsto',
'              into v_id_sjto_impsto',
'              from v_si_i_sujetos_impuesto',
'             where cdgo_clnte        = :F_CDGO_CLNTE',
'               and id_impsto         = :P102_ID_IMPSTO',
'               and idntfccion_sjto   = :P102_IDNTFCCION;',
'',
'            :P102_RSPSTA := '''';',
'            :P102_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'',
'            exception when no_data_found then ',
'                  :P102_ID_SJTO_IMPSTO := null;',
unistr('                  :P102_RSPSTA := ''No se encontr\00F3 el Sujeto Tributo.'';'),
'    end;   ',
'    ',
'    begin',
'           select sum(b.vlor_sldo_cptal)',
'             into v_vlor_sldo_cptal',
'             from v_si_i_sujetos_impuesto a',
'             join v_gf_g_cartera_x_concepto b on a.id_sjto_impsto = b.id_sjto_impsto',
'            where a.cdgo_clnte      = :F_CDGO_CLNTE',
'              and a.id_sjto_impsto  = v_id_sjto_impsto;/*:P102_ID_SJTO_IMPSTO;*/',
'              ',
'          exception when no_data_found then ',
'                      ',
'                      :P102_RSPSTA := ''No encontro concepto por cartera.'';',
'    end;',
'    ',
'end;'))
,p_process_error_message=>'&P102_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(78989760801081763)
,p_process_success_message=>'&P102_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92963019745720601)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Proceso Work Flow Siguiente Etapa'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'WORKFLOW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78999626723081769)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Automatic Row Fetch GF_G_AJUSTES'
,p_attribute_02=>'GF_G_AJUSTES'
,p_attribute_03=>'P102_ID_AJSTE'
,p_attribute_04=>'ID_AJSTE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P102_ID_AJSTE'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
