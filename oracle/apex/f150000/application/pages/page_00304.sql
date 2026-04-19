prompt --application/pages/page_00304
begin
wwv_flow_api.create_page(
 p_id=>304
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Par\00E1metros de b\00FAsqueda')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Par\00E1metros de b\00FAsqueda')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-body>p {',
'    background-color: #fff;',
'    border: 1px solid rgba(0, 0, 0, .1);',
'    color: rgba(255, 0, 0, 0.89);',
'    padding: 1rem;',
'    text-align: center;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'85%'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210205151536'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5086142062407316)
,p_plug_name=>unistr('<b>Resultados de la b\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_sjto_impsto 				as "id_sjto_impsto"',
unistr('		, a.idntfccion_sjto				as "identificaci\00F3n Sujeto"'),
unistr('		, a.idntfccion_sjto_frmtda  	as "Identificaci\00F3n" '),
'        , c.nmbre_rzon_scial 			as "Propietario"',
'        , b.nmbre_rzon_scial 			as "Razon Social"',
unistr('        , a.drccion 					as "Direcci\00F3n"'),
'        , 1                             as "Seleccionar"',
'	 from v_si_i_sujetos_impuesto    	a',
'     join v_si_i_personas            	b on a.id_sjto_impsto = b.id_sjto_impsto',
'     join v_si_i_sujetos_responsable 	c on a.id_sjto_impsto = c.id_sjto_impsto',
'	  and c.prncpal_s_n      			= ''S''',
'    where a.cdgo_clnte       			= :F_CDGO_CLNTE',
'	  and a.id_impsto        			= :P302_ID_IMPSTO',
'	  and a.estdo_blqdo_sjto_impsto 	= ''N''',
'	  and (	(:P304_TPO_BSQDA = ''RS'' 	and a.idntfccion_sjto			= :P304_PRMTRO) or ',
'			(:P304_TPO_BSQDA = ''DR'' 	and upper(a.drccion)			like upper(''%''|| :P304_PRMTRO || ''%'')) or ',
'			(:P304_TPO_BSQDA = ''IR''		and trim(c.idntfccion_rspnsble)	= :P304_PRMTRO)  ',
'		  )'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P304_TPO_SJTO_IMPSTO'
,p_plug_display_when_cond2=>'E'
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
 p_id=>wwv_flow_api.id(5086229368407317)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('NO se encontraron resultados con el par\00E1metro ingresado, por favor verifique')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>5086229368407317
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5086386385407318)
,p_db_column_name=>'id_sjto_impsto'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5087205635407327)
,p_db_column_name=>unistr('identificaci\00F3n Sujeto')
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5087168586407326)
,p_db_column_name=>unistr('Identificaci\00F3n')
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5087314648407328)
,p_db_column_name=>'Razon Social'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Razon Social'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5086693705407321)
,p_db_column_name=>'Propietario'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5086793627407322)
,p_db_column_name=>unistr('Direcci\00F3n')
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5087457218407329)
,p_db_column_name=>'Seleccionar'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Seleccionar'
,p_column_link=>unistr('f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP:P302_ID_SJTO_IMPSTO,P302_IDNTFCCION_SJTO:#id_sjto_impsto#,#Identificaci\00F3n#')
,p_column_linktext=>'<center><span class="fa fa-check-square fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5192299599625705)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'51923'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('id_sjto_impsto:identificaci\00F3n Sujeto:Identificaci\00F3n:Razon Social:Propietario:Direcci\00F3n:Seleccionar')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5087529908407330)
,p_plug_name=>unistr('<b>Resultados de la b\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id_sjto_impsto 			    as "id_sjto_impsto"',
'       , a.idntfccion_sjto              as "Placa"',
unistr('       , c.idntfccion_rspnsble          as "Identificaci\00F3n del Responsable"'),
'       , c.nmbre_rzon_scial 			as "Propietario"',
unistr('       , a.drccion 						as "Direcci\00F3n"'),
'       , 1                              as "Seleccionar"',
'    from v_si_i_sujetos_impuesto 		a',
'    join v_si_i_vehiculos 				b on a.id_sjto_impsto = b.id_sjto_impsto',
'    join v_si_i_sujetos_responsable		c on a.id_sjto_impsto = c.id_sjto_impsto',
'     and c.prncpal_s_n      			= ''S''',
'    where a.cdgo_clnte       			= :F_CDGO_CLNTE',
'     and a.id_impsto        			= :P302_ID_IMPSTO',
'     and a.estdo_blqdo_sjto_impsto 		= ''N''',
'     and (	(:P304_TPO_BSQDA = ''RS'' 	and a.idntfccion_sjto			= :P304_PRMTRO) or ',
'            (:P304_TPO_BSQDA = ''DR'' 	and upper(a.drccion)			like upper(''%''|| :P304_PRMTRO || ''%'')) or ',
'            (:P304_TPO_BSQDA = ''IR''		and trim(c.idntfccion_rspnsble)	= :P304_PRMTRO) ',
'         ) '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P304_TPO_SJTO_IMPSTO'
,p_plug_display_when_cond2=>'V'
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
 p_id=>wwv_flow_api.id(5087654456407331)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>5087654456407331
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5087772717407332)
,p_db_column_name=>'id_sjto_impsto'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5088517226407340)
,p_db_column_name=>'Placa'
,p_display_order=>20
,p_column_identifier=>'G'
,p_column_label=>'Placa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5088428765407339)
,p_db_column_name=>unistr('Identificaci\00F3n del Responsable')
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>unistr('Identificaci\00F3n Del Responsable')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5087813447407333)
,p_db_column_name=>'Propietario'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5087915087407334)
,p_db_column_name=>unistr('Direcci\00F3n')
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5088309879407338)
,p_db_column_name=>'Seleccionar'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Seleccionar'
,p_column_link=>unistr('f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP:P302_ID_SJTO_IMPSTO,P302_IDNTFCCION_SJTO:#id_sjto_impsto#,#Placa##identificaci\00F3n Sujeto#')
,p_column_linktext=>'<center><span class="fa fa-check-square fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5197078413667819)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'51971'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Placa:Identificaci\00F3n del Responsable:Propietario:Direcci\00F3n:Seleccionar:')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5088646018407341)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Si escoge b\00FAsqueda por direcci\00F3n, siga el siguiente formato:<br/>'),
unistr('C: calle, K: carrera Ej. K 10 47B 133 \00F3 C 23 15 42<br/>'),
unistr('Si vive en un apartamento coloque solo la direcci\00F3n del conjunto<br/> 	'),
unistr('No utilice ning\00FAn tipo signo Ej. #, -</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5112513088571209)
,p_plug_name=>unistr('<b>Resultados de la b\00FAsqueda</b>')
,p_parent_plug_id=>wwv_flow_api.id(5088646018407341)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id_sjto_impsto 			    as "id_sjto_impsto"',
unistr('       , a.idntfccion_sjto              as "Identificaci\00F3n"'),
'       , a.idntfccion_sjto_frmtda  		as "Referencia Catastral"',
'       , a.idntfccion_antrior_frmtda 	as "Referencia Anterior"',
unistr('       , c.idntfccion_rspnsble          as "Identificaci\00F3n del Responsable"'),
'       , c.nmbre_rzon_scial 			as "Propietario"',
unistr('       , a.drccion 						as "Direcci\00F3n"'),
'       , a.mtrcla_inmblria              as  "Matricula Inmobiliaria"',
'       , 1                              as "Seleccionar"',
'    from v_si_i_sujetos_impuesto 		a',
'    join v_si_i_predios 				b on a.id_sjto_impsto = b.id_sjto_impsto',
'    join v_si_i_sujetos_responsable		c on a.id_sjto_impsto = c.id_sjto_impsto',
'     and c.prncpal_s_n      			= ''S''',
'    where a.cdgo_clnte       			= :F_CDGO_CLNTE',
'     and a.id_impsto        			= :P302_ID_IMPSTO',
'     and a.estdo_blqdo_sjto_impsto 		= ''N''',
'     and (	(:P304_TPO_BSQDA = ''RS'' 	and a.idntfccion_sjto			= :P304_PRMTRO) or ',
'            (:P304_TPO_BSQDA = ''RA''		and a.idntfccion_antrior 		= :P304_PRMTRO) or ',
'            (:P304_TPO_BSQDA = ''DR'' 	and upper(a.drccion)			like upper(''%''|| :P304_PRMTRO || ''%'')) or ',
'            (:P304_TPO_BSQDA = ''IR''		and trim(c.idntfccion_rspnsble)	= :P304_PRMTRO) or ',
'            (:P304_TPO_BSQDA = ''MI''		and a.mtrcla_inmblria 			= :P304_PRMTRO )) '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P304_TPO_SJTO_IMPSTO'
,p_plug_display_when_cond2=>'P'
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
 p_id=>wwv_flow_api.id(5112618023571210)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JAGUAS'
,p_internal_uid=>5112618023571210
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5112753894571211)
,p_db_column_name=>'id_sjto_impsto'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5086021528407315)
,p_db_column_name=>unistr('Identificaci\00F3n')
,p_display_order=>20
,p_column_identifier=>'I'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5112841652571212)
,p_db_column_name=>'Referencia Catastral'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Referencia Catastral'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5112919231571213)
,p_db_column_name=>'Referencia Anterior'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Referencia Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5113020943571214)
,p_db_column_name=>'Propietario'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5113105635571215)
,p_db_column_name=>unistr('Direcci\00F3n')
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5085767617407312)
,p_db_column_name=>unistr('Identificaci\00F3n del Responsable')
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>unistr('Identificaci\00F3n Del Responsable')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5085890793407313)
,p_db_column_name=>'Matricula Inmobiliaria'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Matricula Inmobiliaria'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5085987651407314)
,p_db_column_name=>'Seleccionar'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Seleccionar'
,p_column_link=>unistr('f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP:P302_ID_SJTO_IMPSTO,P302_IDNTFCCION_SJTO:#id_sjto_impsto#,#Identificaci\00F3n#')
,p_column_linktext=>'<center><span class="fa fa-check-square fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5141486099994907)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'51415'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>unistr('Referencia Catastral:Referencia Anterior:Matricula Inmobiliaria:Direcci\00F3n:Identificaci\00F3n del Responsable:Propietario:Seleccionar:')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55853969808772869)
,p_plug_name=>'Busqueda'
,p_region_name=>'Busqueda'
,p_parent_plug_id=>wwv_flow_api.id(5088646018407341)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5132577150857564)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(55853969808772869)
,p_button_name=>'btn_cnsltar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="margin-top:5px"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5112439577571208)
,p_name=>'P304_TPO_SJTO_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(55853969808772869)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_sjto_tpo',
'     from df_c_impuestos a',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'      and a.id_impsto  = :P302_ID_IMPSTO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5132997662857581)
,p_name=>'P304_VGNCIA_PRDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(55853969808772869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5133214482857631)
,p_name=>'P304_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(55853969808772869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5133600723857631)
,p_name=>'P304_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(55853969808772869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5134094930857632)
,p_name=>'P304_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(55853969808772869)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5134481670857632)
,p_name=>'P304_TPO_BSQDA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(55853969808772869)
,p_prompt=>'Tipo de busqueda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion as value,',
'         a.cdgo_tpo_bsqda_sjto as id',
'from df_s_tipos_busqueda_sujeto a',
'join df_c_impuestos b',
'on b.cdgo_sjto_tpo = a.cdgo_sjto_tpo',
'where b.id_impsto = :P302_ID_IMPSTO;'))
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5134852517857634)
,p_name=>'P304_PRMTRO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(55853969808772869)
,p_prompt=>'P304_PRMTRO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5145681885018901)
,p_name=>'al cambiar tipo de busqueda'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P304_TPO_BSQDA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5146088724018906)
,p_event_id=>wwv_flow_api.id(5145681885018901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P304_TPO_BSQDA'').find(''[value='' + $(''#P304_TPO_BSQDA'').val() + '']'').text();',
'$(''#P304_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5149994654043656)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidarSujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    tpo_bsqda        varchar2(100) := apex_application.g_x01;',
'    v_prmtros        varchar2(2000) := :P304_PRMTRO ||'':''|| tpo_bsqda ||'':''|| :P304_ID_IMPSTO || '':''|| :F_CDGO_CLNTE || '':''|| :P304_ID_SJTO_IMPSTO;',
'    v_json           json_object_t;',
'    v_prueba         varchar2(1000);',
'    v_j              clob;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_j := apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''recibo/validarSujeto'',',
'                                                                 p_http_method  => ''POST'',',
'                                                                 p_parm_name    => apex_util.string_to_table(''prmtro:tpo_bsqda:impuesto:cliente:idsujeto''),',
'                                                                 p_parm_value   => apex_util.string_to_table(v_prmtros)); ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''data'', v_j);',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''error'');',
'            apex_json.write(''o_mnsje_rspsta'', ''asxasx '' || sqlerrm);',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
