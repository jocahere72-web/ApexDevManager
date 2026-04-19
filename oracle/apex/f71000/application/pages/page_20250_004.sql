prompt --application/pages/page_20250_004
begin
wwv_flow_api.create_page(
 p_id=>2025034
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Generar Certificado'
,p_page_mode=>'MODAL'
,p_step_title=>'Generar Certificado'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251017095135'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12980519477513229)
,p_plug_name=>'Certificado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12980750062513231)
,p_plug_name=>'Responsabilidades ICA'
,p_parent_plug_id=>wwv_flow_api.id(12980519477513229)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12980643080513230)
,p_plug_name=>'Responsabilidades ICA'
,p_parent_plug_id=>wwv_flow_api.id(12980750062513231)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cv.vgncia as vncias_ica,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_ica',
'  from v_si_i_personas p',
'  join v_si_i_sujetos_impuesto si',
'    on si.id_sjto_impsto = p.id_sjto_impsto',
'  join si_c_sujetos s',
'    on s.id_sjto = si.id_sjto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''ICA''',
'   and si.id_sjto_estdo = 1',
'   and si.idntfccion_sjto = :P2025034_IDNTFCCION_SJTO',
'   and cv.vlor_sldo_cptal > 0',
' group by cv.vgncia',
' order by cv.vgncia;'))
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
 p_id=>wwv_flow_api.id(13376292908858802)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>13376292908858802
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13376339728858803)
,p_db_column_name=>'VNCIAS_ICA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencias'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13376425418858804)
,p_db_column_name=>'SALDO_ICA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Saldo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13388141532869694)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133882'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VNCIAS_ICA:SALDO_ICA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12980874796513232)
,p_plug_name=>'Responsabilidades Predial'
,p_parent_plug_id=>wwv_flow_api.id(12980519477513229)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12982286838513246)
,p_plug_name=>'Responsabilidades Predial'
,p_parent_plug_id=>wwv_flow_api.id(12980874796513232)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select si.id_sjto_impsto,',
'       si.idntfccion_sjto as referencia_p,',
'       nvl(si.mtrcla_inmblria, ''NO REGISTRA'') as mtrcla_inmblria_p,',
'       si.drccion as drccion_p,',
'       listagg(cv.vgncia, '', '') within group(order by cv.vgncia) as vgncias_p,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_p',
'  from v_si_i_sujetos_impuesto si',
'  join v_si_i_sujetos_responsable sr',
'    on sr.id_sjto_impsto = si.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''IPU''',
'   and si.id_sjto_estdo = 1',
'   and sr.idntfccion_rspnsble = :P2025034_IDNTFCCION_SJTO',
'   and cv.vlor_sldo_cptal > 0',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
' group by si.id_sjto_impsto,',
'          si.idntfccion_sjto,',
'          si.mtrcla_inmblria,',
'          si.drccion;'))
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
 p_id=>wwv_flow_api.id(13109572682706741)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>13109572682706741
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13109635567706742)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13109742135706743)
,p_db_column_name=>'REFERENCIA_P'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13109880209706744)
,p_db_column_name=>'MTRCLA_INMBLRIA_P'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Matricula Inmobiliaria'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13109901300706745)
,p_db_column_name=>'DRCCION_P'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13110094230706746)
,p_db_column_name=>'VGNCIAS_P'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Vigencias'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13110162338706747)
,p_db_column_name=>'SALDO_P'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Saldo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13389327803869811)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133894'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SJTO_IMPSTO:REFERENCIA_P:MTRCLA_INMBLRIA_P:DRCCION_P:VGNCIAS_P:SALDO_P'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12980939502513233)
,p_plug_name=>unistr('Responsabilidades Valorizaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(12980519477513229)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13031434503232004)
,p_plug_name=>unistr('Responsabilidades Valorizaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(12980939502513233)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select si.id_sjto_impsto,',
'       si.idntfccion_sjto as referencia_v,',
'       si.mtrcla_inmblria as mtrcla_inmblria_v,',
'       si.drccion as drccion_v,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_v',
'  from v_si_i_sujetos_impuesto si',
'  join v_si_i_sujetos_responsable sr',
'    on sr.id_sjto_impsto = si.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_i_impuestos_subimpuesto i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto_sbmpsto = ''VAL''',
'   and sr.idntfccion_rspnsble = :P2025034_IDNTFCCION_SJTO',
'   and cv.vlor_sldo_cptal > 0',
'   and si.id_sjto_estdo = 1',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
' group by si.id_sjto_impsto,',
'          si.idntfccion_sjto,',
'          si.mtrcla_inmblria,',
'          si.drccion;'))
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
 p_id=>wwv_flow_api.id(13108961374706735)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>13108961374706735
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13109052425706736)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13109182981706737)
,p_db_column_name=>'REFERENCIA_V'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13109255066706738)
,p_db_column_name=>'MTRCLA_INMBLRIA_V'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Matricula Inmobiliaria'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13109392904706739)
,p_db_column_name=>'DRCCION_V'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13109494002706740)
,p_db_column_name=>'SALDO_V'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Saldo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13390054325869869)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133901'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SJTO_IMPSTO:REFERENCIA_V:MTRCLA_INMBLRIA_V:DRCCION_V:SALDO_V'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12981039593513234)
,p_plug_name=>unistr('Responsabilidades Plusval\00EDa')
,p_parent_plug_id=>wwv_flow_api.id(12980519477513229)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13032238001232012)
,p_plug_name=>unistr('Responsabilidades Plusval\00EDa')
,p_parent_plug_id=>wwv_flow_api.id(12981039593513234)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select si.id_sjto_impsto,',
'       si.idntfccion_sjto as referencia_pv,',
'       si.mtrcla_inmblria as mtrcla_inmblria_pv,',
'       si.drccion as drccion_p,',
'       (select p.hcho_gnrdor',
'          from v_gi_g_plusvalia_procso_dtlle p',
'         where p.id_sjto_impsto = si.id_sjto_impsto) as hcho_gnrdor_p,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_pv',
'  from v_si_i_sujetos_impuesto si',
'  join v_si_i_sujetos_responsable sr',
'    on sr.id_sjto_impsto = si.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''PLU''',
'      and sr.idntfccion_rspnsble = :P2025034_IDNTFCCION_SJTO',
'   and cv.vlor_sldo_cptal > 0',
' group by si.id_sjto_impsto,',
'          si.idntfccion_sjto,',
'          si.mtrcla_inmblria,',
'          si.drccion;'))
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
 p_id=>wwv_flow_api.id(13108219538706728)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>13108219538706728
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13108321979706729)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13108490193706730)
,p_db_column_name=>'REFERENCIA_PV'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia Catastral'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13108546374706731)
,p_db_column_name=>'MTRCLA_INMBLRIA_PV'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Matricula Inmobiliaria'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13108672476706732)
,p_db_column_name=>'DRCCION_P'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13108715462706733)
,p_db_column_name=>'HCHO_GNRDOR_P'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Hecho Generador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13108842419706734)
,p_db_column_name=>'SALDO_PV'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Saldo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13390671617869933)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133907'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SJTO_IMPSTO:REFERENCIA_PV:MTRCLA_INMBLRIA_PV:DRCCION_P:HCHO_GNRDOR_P:SALDO_PV'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12981932585513243)
,p_plug_name=>unistr('Responsabilidades Circulaci\00F3n y Transito')
,p_parent_plug_id=>wwv_flow_api.id(12980519477513229)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>90
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13034172878232031)
,p_plug_name=>unistr('Responsabilidades Circulaci\00F3n y Transito')
,p_parent_plug_id=>wwv_flow_api.id(12981932585513243)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select si.id_sjto_impsto,',
'       si.idntfccion_sjto as placa_vh,',
'       listagg(cv.vgncia, '', '') within group(order by cv.vgncia) as vgncias_vh,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_vh',
'  from v_si_i_sujetos_impuesto si',
'  join v_si_i_sujetos_responsable sr',
'    on sr.id_sjto_impsto = si.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''VHL''',
'   and sr.idntfccion_rspnsble = :P2025034_IDNTFCCION_SJTO',
'   and cv.vlor_sldo_cptal > 0',
'   and si.id_sjto_estdo = 1',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
' group by si.id_sjto_impsto, si.idntfccion_sjto, si.drccion;'))
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
 p_id=>wwv_flow_api.id(13106503267706711)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>13106503267706711
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13106689461706712)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13106730373706713)
,p_db_column_name=>'PLACA_VH'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Placa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13106807841706714)
,p_db_column_name=>'VGNCIAS_VH'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vigencias'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13106947412706715)
,p_db_column_name=>'SALDO_VH'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Saldo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13341751172751456)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133418'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SJTO_IMPSTO:PLACA_VH:VGNCIAS_VH:SALDO_VH'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12982052236513244)
,p_plug_name=>'Responsabilidades Rentas'
,p_parent_plug_id=>wwv_flow_api.id(12980519477513229)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13034840680232038)
,p_plug_name=>'Responsabilidades Rentas'
,p_parent_plug_id=>wwv_flow_api.id(12982052236513244)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select si.id_sjto_impsto,',
'       cv.id_impsto_sbmpsto,',
'       su.nmbre_impsto_sbmpsto nmbre_impsto,',
'       ',
'       (select listagg(vgncia || ''('' || lista_prdos || '')'', '', '') within group(order by vgncia)',
'          from (select cv_sub.vgncia,',
'                       listagg(distinct cv_sub.prdo, '','') within group(order by cv_sub.prdo) as lista_prdos',
'                  from v_gf_g_cartera_x_vigencia cv_sub',
'                 where cv_sub.id_sjto_impsto = si.id_sjto_impsto',
'                   and cv_sub.id_impsto_sbmpsto = cv.id_impsto_sbmpsto',
'                   and cv_sub.vlor_sldo_cptal > 0',
'                   and cv_sub.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'                 group by cv_sub.vgncia)) as vgncias_r,',
'       ',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_r',
'  from v_si_i_sujetos_impuesto si',
'  join si_c_sujetos s',
'    on s.id_sjto = si.id_sjto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
'  join df_i_impuestos_subimpuesto su',
'    on su.id_impsto_sbmpsto = cv.id_impsto_sbmpsto',
' where i.cdgo_impsto = ''REN''',
'   and cv.vlor_sldo_cptal > 0',
'   and si.idntfccion_sjto = :P2025034_IDNTFCCION_SJTO',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'   and su.actvo = ''S''',
' group by si.id_sjto_impsto, cv.id_impsto_sbmpsto, su.nmbre_impsto_sbmpsto;',
''))
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
 p_id=>wwv_flow_api.id(13105968241706705)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>13105968241706705
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13106092044706706)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13106180233706707)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13106243609706708)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13106387946706709)
,p_db_column_name=>'VGNCIAS_R'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vigencias'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13106497834706710)
,p_db_column_name=>'SALDO_R'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Saldo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13336677260619397)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133367'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SJTO_IMPSTO:ID_IMPSTO_SBMPSTO:NMBRE_IMPSTO:VGNCIAS_R:SALDO_R'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13034731580232037)
,p_plug_name=>'Responsabilidades Sobre Tasa Gasolina'
,p_parent_plug_id=>wwv_flow_api.id(12980519477513229)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12981259368513236)
,p_plug_name=>'Responsabilidades Sobre Tasa Gasolina'
,p_parent_plug_id=>wwv_flow_api.id(13034731580232037)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select si.id_sjto_impsto,',
'       listagg(cv.vgncia || ''('' || cv.prdo || '')'', '', '') within group(order by cv.vgncia) as vgncias_s,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_s',
'  from v_si_i_sujetos_impuesto si',
'  join v_si_i_sujetos_responsable sr',
'    on sr.id_sjto_impsto = si.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''SBT''',
'   and si.idntfccion_sjto = :P2025034_IDNTFCCION_SJTO',
'   and cv.vlor_sldo_cptal > 0',
'   and si.id_sjto_estdo = 1',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
' group by si.id_sjto_impsto;'))
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
 p_id=>wwv_flow_api.id(13107422760706720)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>13107422760706720
);
end;
/
begin
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13107572398706721)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13107645653706722)
,p_db_column_name=>'VGNCIAS_S'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencias'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13107799813706723)
,p_db_column_name=>'SALDO_S'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Saldo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13355529995794194)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133556'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SJTO_IMPSTO:VGNCIAS_S:SALDO_S'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13035625980232046)
,p_plug_name=>'Responsabilidades ICA - Omisos'
,p_parent_plug_id=>wwv_flow_api.id(12980519477513229)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13035714932232047)
,p_plug_name=>'Responsabilidades ICA - Omisos'
,p_parent_plug_id=>wwv_flow_api.id(13035625980232046)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select o.vgncia as vgncia_o_ica,',
'       o.cdgo_prdcdad,',
'       case',
'         when o.cdgo_prdcdad = ''ANU'' then',
'          ''ANUAL DE INDUSTRIA Y COMERCIO''',
'         when o.cdgo_prdcdad = ''BIM'' then',
'          ''BIMESTRAL DE INDUSTRIA Y COMERCIO''',
'         when o.cdgo_prdcdad = ''MNS'' then',
'          ''MENSUAL DE INDUSTRIA Y COMERCIO''',
'         else',
'          ''INDUSTRIA Y COMERCIO''',
'       end as descripcion_o_ica',
'  from v_si_i_personas p',
'  join v_si_i_sujetos_impuesto si',
'    on si.id_sjto_impsto = p.id_sjto_impsto',
'  join v_fi_g_prdos_omso o',
'    on o.id_sjto_impsto = si.id_sjto_impsto',
'  join df_i_impuestos_subimpuesto i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto_sbmpsto = ''ICA''',
'   and si.id_sjto_estdo = 1',
'   and si.idntfccion_sjto = :P2025034_IDNTFCCION_SJTO',
'   and o.cdgo_prdcdad = ''ANU''',
'   and o.ANIO_LMTE_DCLRCION <= 5',
' group by o.vgncia, o.cdgo_prdcdad',
' order by o.vgncia;'))
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
 p_id=>wwv_flow_api.id(13110292911706748)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>13110292911706748
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13110338844706749)
,p_db_column_name=>'VGNCIA_O_ICA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencias'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13110463263706750)
,p_db_column_name=>'CDGO_PRDCDAD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Prdcdad'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13376195475858801)
,p_db_column_name=>'DESCRIPCION_O_ICA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13388758436869749)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133888'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA_O_ICA:CDGO_PRDCDAD:DESCRIPCION_O_ICA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13091740217635905)
,p_plug_name=>'Responsabilidades Sobre Tasa Gasolina - Omisos'
,p_parent_plug_id=>wwv_flow_api.id(12980519477513229)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13091873405635906)
,p_plug_name=>'Responsabilidades Sobre Tasa Gasolina - Omisos'
,p_parent_plug_id=>wwv_flow_api.id(13091740217635905)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select o.vgncia,',
'       o.cdgo_prdcdad,',
'       listagg(pe.prdo, '', '') within group(order by pe.prdo) as periodos,',
'       case',
'         when o.cdgo_prdcdad = ''ANU'' then',
'          ''ANUAL DE SOBRETASA GASOLINA''',
'         when o.cdgo_prdcdad = ''BIM'' then',
'          ''BIMESTRAL DE SOBRETASA GASOLINA''',
'         when o.cdgo_prdcdad = ''MNS'' then',
'          ''MENSUAL DE SOBRETASA GASOLINA''',
'         else',
'          ''INDUSTRIA Y COMERCIO''',
'       end as descripcion',
'  from v_si_i_personas p',
'  join v_si_i_sujetos_impuesto si',
'    on si.id_sjto_impsto = p.id_sjto_impsto',
'  join v_fi_g_prdos_omso o',
'    on o.id_sjto_impsto = si.id_sjto_impsto',
'  join df_i_impuestos_subimpuesto i',
'    on i.id_impsto = si.id_impsto',
'  join df_i_periodos pe',
'    on pe.id_prdo = o.id_prdo',
' where i.cdgo_impsto_sbmpsto = ''SBT''',
'   and si.idntfccion_sjto = :P2025034_IDNTFCCION_SJTO',
'   and o.ANIO_LMTE_DCLRCION <= 5',
' group by o.vgncia, o.cdgo_prdcdad',
' order by o.vgncia;'))
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
 p_id=>wwv_flow_api.id(13107045567706716)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>13107045567706716
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13107135633706717)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencias'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13107226560706718)
,p_db_column_name=>'CDGO_PRDCDAD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Prdcdad'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13107340968706719)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(13376591326858805)
,p_db_column_name=>'PERIODOS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Periodos'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(13346756754762701)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133468'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:CDGO_PRDCDAD:DESCRIPCION:PERIODOS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12981306809513237)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(12980519477513229)
,p_button_name=>'BTN_IMPRMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir Certificado '
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-file-text'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13035461974232044)
,p_branch_name=>'Go To Page 2025034'
,p_branch_action=>'f?p=&APP_ID.:2025034:&SESSION.:GENERAR_CERTIFICADO:&DEBUG.:RP,2025034:P2025034_IDNTFCCION_SJTO,P2025034_SUMA,P2025034_ID_SJTO_IMPSTO:&P2025034_IDNTFCCION_SJTO.,&P2025034_SUMA.,&P2025034_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12981427032513238)
,p_name=>'P2025034_IDNTFCCION_SJTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(12980519477513229)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13093064089635918)
,p_name=>'P2025034_SUMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(12980519477513229)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15178258982511401)
,p_name=>'P2025034_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(12980519477513229)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(15178332293511402)
,p_computation_sequence=>10
,p_computation_item=>'P2025034_ID_SJTO_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select si.id_sjto_impsto',
'from v_si_i_sujetos_impuesto si',
'  join df_c_impuestos i',
'on i.id_impsto = si.id_impsto',
'  where i.cdgo_impsto in (''ICA'')',
'and si.idntfccion_sjto = :P2025034_IDNTFCCION_SJTO',
'and rownum = 1;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13093397878635921)
,p_name=>'Mostrar Alerta Datos'
,p_event_sequence=>20
,p_condition_element=>'P2025034_IDNTFCCION_SJTO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13093254051635920)
,p_event_id=>wwv_flow_api.id(13093397878635921)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.alert(''No se han encontrado datos asociados a la identificaci\00F3n: '' + apex.item(''P2025033_IDNTFCCION'').getValue());'),
'apex.navigation.dialog.cancel(true);',
'   '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13092926787635917)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Cartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta   number;',
'	v_mnsje_rspsta  varchar2(4000);',
'	',
'	v_count_r		number;',
'	v_count_i		number;',
'	v_count_o		number;',
'begin',
'	-- Vallidamso que el contribuyente tenga responsabilidades - sujeto responsable',
'	select count(*)',
'	  into v_count_r ',
'	from v_gf_g_cartera_x_vigencia a ',
'	  inner join v_si_i_sujetos_impuesto b ',
'	on a.id_sjto_impsto = b.id_sjto_impsto',
'	  join v_si_i_sujetos_responsable s ',
'	on b.id_sjto_impsto = s.id_sjto_impsto',
'	  where vlor_sldo_cptal + vlor_intres > 0',
'	and s.idntfccion_rspnsble = :P2025034_IDNTFCCION_SJTO;',
'',
'	-- Vallidamso que el contribuyente tenga responsabilidades - sujeto impuesto',
'	select count(*)',
'	  into v_count_i ',
'	from v_gf_g_cartera_x_vigencia a ',
'	  inner join v_si_i_sujetos_impuesto b ',
'	on a.id_sjto_impsto = b.id_sjto_impsto',
'	  join v_si_i_sujetos_responsable s ',
'	on b.id_sjto_impsto = s.id_sjto_impsto',
'	  where vlor_sldo_cptal + vlor_intres > 0',
'	and b.idntfccion_sjto = :P2025034_IDNTFCCION_SJTO;',
'',
'	-- Vallidamso que el contribuyente tenga responsabilidades - omisos',
'	select count(*)',
'	  into v_count_o ',
'	from v_si_i_sujetos_impuesto si',
'	  join v_fi_g_pblcion_omsos_cncdos o',
'	on si.id_sjto_impsto = o.id_sjto_impsto',
'	  join df_c_impuestos i',
'	on i.id_impsto = o.id_impsto',
'	  where i.cdgo_impsto in (''ICA'', ''SBT'')',
'	and si.idntfccion_sjto = :P2025034_IDNTFCCION_SJTO;',
'',
'	if v_count_r > 0 or v_count_i > 0 or v_count_o > 0 then',
'        :P2025034_SUMA := 1;',
'	else',
'        :P2025034_SUMA := 0;',
'	end if;',
'exception',
'  when others then',
'    null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13035399006232043)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Certificado Responsabilidades Por Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_gn_d_reportes         gn_d_reportes%rowtype;',
'	v_json                  clob;',
'	v_blob                  blob;',
'	v_id_rprte              number;',
'	v_cdgo_rspsta           number;',
'	v_mnsje_rspsta          varchar2(4000);',
'	v_id_usrio_apex         number;',
'	',
'	v_id_sjto_impsto_ipu	clob;',
'	v_id_sjto_impsto_val	clob;',
'	v_id_sjto_impsto_plu	clob;',
'	v_id_sjto_impsto_alb	clob;',
'	v_id_sjto_impsto_sbt	clob;',
'	v_id_sjto_impsto_vhl	clob;',
'	v_id_sjto_impsto_ren	clob;',
'',
'    v_object                json_object_t := json_object_t();',
'    v_array                 json_array_t  := json_array_t();',
'',
'    -- Jbadran',
'    v_file_name           	varchar2(100) := ''Certificado'';  ',
'    v_auditoria 		  	varchar2(4);   ',
'    v_id_sjto_impsto_orgen  varchar2(200);',
'	v_id_rprte_audtria_trza gn_g_reportes_auditoria_traza.id_rprte_audtria_trza%type;',
'    v_id_sjto_impsto        gn_g_reportes_auditoria_traza.id_sjto_impsto%type;',
'',
'begin',
'	-- Buscar datos de la plantilla de reportes',
'	select r.*',
'	  into v_gn_d_reportes ',
'	from gn_d_reportes r',
'	where r.id_rprte = pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => :F_CDGO_CLNTE,',
'																		   p_cdgo_dfncion_clnte_ctgria => ''RPT'',',
'																		   p_cdgo_dfncion_clnte        => ''CTI'');',
'	',
'	-- SI EXISTE LA SESION',
'	if v(''APP_SESSION'') is not null then ',
'		apex_session.attach( p_app_id		=> 66000,',
'							 p_page_id		=> 37,',
'							 p_session_id	=> v(''APP_SESSION''));',
'	else',
'		v_id_usrio_apex := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => :F_CDGO_CLNTE,',
'																		   p_cdgo_dfncion_clnte_ctgria => ''CLN'',',
'																		   p_cdgo_dfncion_clnte        => ''USR'');',
'',
'		apex_session.create_session(p_app_id   => 66000,',
'									p_page_id  => 37,',
'									p_username => v_id_usrio_apex);',
'									',
'		apex_session.attach(p_app_id 	 => 66000,',
'							p_page_id 	 => 37,',
'							p_session_id => v(''APP_SESSION''));',
'	end if;',
'',
'    begin',
'        v_auditoria := pkg_gn_reportes_auditoria.fnc_vl_reporte_auditoria(v_gn_d_reportes.id_rprte);',
'    exception ',
'        when others then',
'            v_auditoria := ''N'';',
'    end;    ',
'',
'	-- Validamos si el reporte requiere auditoria.',
'	if v_auditoria = ''S'' then',
'',
'        -- Generamos el ID de la auditoria.',
'        select nvl(max(id_rprte_audtria_trza), 0) + 1 into v_id_rprte_audtria_trza',
'        from gn_g_reportes_auditoria_traza;',
'',
'		-- Validamos que el ID auditoria no sea nulo',
'		if v_id_rprte_audtria_trza is not null then',
'        ',
'            begin',
'',
'				v_object.put(''id_sjto_impsto'', :P2025034_ID_SJTO_IMPSTO);',
'				v_object.put(''id_rprte_audtria_trza'', v_id_rprte_audtria_trza);',
'				v_json    := v_object.to_clob(); ',
'',
'				--SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO',
'				apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'				apex_util.set_session_state(''P37_ID_RPRTE'', v_gn_d_reportes.id_rprte);',
'				apex_util.set_session_state(''P37_JSON'', :P2025034_IDNTFCCION_SJTO);',
'				apex_util.set_session_state(''P37_JSON_2'', v_json);',
'',
'				-- Generamos el Blob',
'				begin',
'					v_blob := apex_util.get_print_document( p_application_id     => 66000,',
'															p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'															p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'															p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'															p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo);',
'				exception ',
'					when others then',
'						v_blob := null;',
'				end;',
'				-- Validamos que se alla registrado correctamente el blob',
'				if v_blob is not null then ',
'					begin',
'						pkg_gn_reportes_auditoria.prc_rg_dcmnto_reporte_auditoria(p_cdgo_clnte   			=> :F_CDGO_CLNTE',
'																				, p_id_rprte_audtria_trza	=> v_id_rprte_audtria_trza',
'																				, p_id_rprte				=> v_gn_d_reportes.id_rprte',
'																				, p_id_sjto_impsto			=> :P2025034_ID_SJTO_IMPSTO --v_id_sjto_impsto',
'																				, p_id_usrio				=> :F_ID_USRIO',
'																				, p_file_name				=> ''Certificado_de_Responsabilidades_Todos_los_Impuestos''',
'																				, p_file_mimetype			=> ''application/pdf''',
'																				, p_file_blob				=> v_blob',
'																				, o_cdgo_rspsta   			=> v_cdgo_rspsta',
'																				, o_mnsje_rspsta  			=> v_mnsje_rspsta);',
'	',
'					exception',
'						when others then',
'                            if sqlcode = -20876 then',
'                                -- descarga exitosa/stop esperado: ignorar',
'                                null;',
'                            else',
'                              null;',
'                            end if;',
'					end;',
'					-- Descargamos el blob',
'					begin',
'    ',
'                        ',
'                        htp.init;',
'                        owa_util.mime_header(''application/pdf'', FALSE );',
'                        htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'                        htp.p(''Content-Disposition: attachment; filename="'' ||''Certificado.pdf'' || ''"'' );',
'                        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'                        owa_util.http_header_close;',
'                        wpg_docload.download_file(v_blob);',
'                        apex_application.stop_apex_engine;		',
'					exception ',
'						when others then',
'						null;',
'					end;',
'				end if;            ',
'            exception ',
'                when others then',
'                 null;',
'            end;        ',
'        end if;',
'	else',
'		begin',
'			--SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO',
'			apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'			apex_util.set_session_state(''P37_ID_RPRTE'', v_gn_d_reportes.id_rprte);',
'			apex_util.set_session_state(''P37_JSON'', :P2025034_IDNTFCCION_SJTO);',
'		',
'            v_blob := apex_util.get_print_document( p_application_id     => 66000,',
'                                                    p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                                    p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                                    p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                                    p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo);        ',
'',
'            htp.init;',
'            owa_util.mime_header(''application/pdf'', FALSE );',
'            htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'            htp.p(''Content-Disposition: attachment; filename="'' ||''Certificado.pdf'' || ''"'' );',
'            htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'            owa_util.http_header_close;',
'            wpg_docload.download_file(v_blob);',
'            apex_application.stop_apex_engine;',
'		exception',
'			 when others then',
'				null;',
'		end;',
'	end if; ',
'exception',
'  when others then',
'	v_blob := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GENERAR_CERTIFICADO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
