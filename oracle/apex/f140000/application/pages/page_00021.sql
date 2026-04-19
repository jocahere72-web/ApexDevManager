prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>unistr('Proceso Jur\00EDdico')
,p_page_mode=>'NON_MODAL'
,p_step_title=>unistr('Proceso Jur\00EDdico')
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20240912121520'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25052429842296210)
,p_plug_name=>unistr('Proceso Jur\00EDdico')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' with vgncias_prcso as',
' (select distinct  e.id_prcsos_jrdco,',
'         LISTAGG(e.vgncia, '', '') WITHIN GROUP(ORDER BY e.vgncia) vgncias',
'    from (select b.id_prcsos_jrdco, b.vgncia',
'            from cb_g_procesos_jrdco_mvmnto b',
'           where b.id_sjto_impsto = :P21_ID_SJTO_IMPSTO',
'             and b.estdo = ''A''',
'             and exists (select 1 from gi_g_determinacion_detalle x ',
'             where x.id_sjto_impsto = b.id_sjto_impsto',
'             and x.vgncia = b.vgncia',
'             and x.id_prdo = b.id_prdo)',
'           group by b.id_prcsos_jrdco, b.vgncia) e',
'   group by e.id_prcsos_jrdco)',
'',
'select distinct a.nmro_prcso_jrdco as "No Proceso Juridico",',
'       trunc(a.fcha) as "Fecha Proceso Juridico",',
'       c.nmro_acto as "Numero Acto",',
'       trunc(c.fcha_acto) as "Fecha Acto",',
'       f.nmbre_trcro "Abogado",',
'       g.dscrpcion "Tipo de Acto",',
'       d.vgncias,',
'       c.id_acto',
'  from cb_g_procesos_juridico a',
'  join v_cb_g_procesos_jrdco_dcmnto c on c.id_prcsos_jrdco = a.id_prcsos_jrdco',
'  join cb_g_procesos_jrdco_mvmnto m on C.id_prcsos_jrdco = M.id_prcsos_jrdco ',
'  join v_gf_g_cartera_x_concepto n on n.ID_SJTO_IMPSTO = M.ID_SJTO_IMPSTO',
'  join vgncias_prcso                d on d.id_prcsos_jrdco = a.id_prcsos_jrdco',
'  join v_sg_g_usuarios              f on f.id_fncnrio = a.id_fncnrio',
'  join gn_d_actos_tipo              g on g.id_acto_tpo = c.id_acto_tpo',
'  where (',
'      (m.id_impsto = 230011 AND pkg_cb_proceso_juridico.fnc_vl_determinacion_vigencia_prdo(',
'          p_id_sjto_impsto => m.id_sjto_impsto,',
'          p_vgncia         => m.vgncia,',
'          p_id_prdo        => m.id_prdo,',
'          p_id_cncpto      => m.id_cncpto',
'      ) = ''S'')',
'      OR',
'      (m.id_impsto = 230012 AND ''S'' = ''S'')',
'  )',
'',
'',
'',
'',
'',
'',
'/*with vgncias_prcso as',
' (select e.id_prcsos_jrdco,',
'         LISTAGG(e.vgncia, '', '') WITHIN GROUP(ORDER BY e.vgncia) vgncias',
'    from (select b.id_prcsos_jrdco, b.vgncia',
'            from cb_g_procesos_jrdco_mvmnto b',
'           where b.id_sjto_impsto = :P21_ID_SJTO_IMPSTO',
'             and b.estdo = ''A''',
'           group by b.id_prcsos_jrdco, b.vgncia) e',
'   group by e.id_prcsos_jrdco)',
'',
'select a.nmro_prcso_jrdco as "No Proceso Juridico",',
'       trunc(a.fcha) as "Fecha Proceso Juridico",',
'       c.nmro_acto as "Numero Acto",',
'       trunc(c.fcha_acto) as "Fecha Acto",',
'       f.nmbre_trcro "Abogado",',
'       g.dscrpcion "Tipo de Acto",',
'       d.vgncias,',
'       c.id_acto',
'  from cb_g_procesos_juridico a',
'  join v_cb_g_procesos_jrdco_dcmnto c',
'    on c.id_prcsos_jrdco = a.id_prcsos_jrdco',
'  join vgncias_prcso d',
'    on d.id_prcsos_jrdco = a.id_prcsos_jrdco',
'  join v_sg_g_usuarios f',
'    on f.id_fncnrio = a.id_fncnrio',
'    join gn_d_actos_tipo g on g.id_acto_tpo = c.id_acto_tpo*/',
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
 p_id=>wwv_flow_api.id(25052571873296211)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>25052571873296211
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25052755917296213)
,p_db_column_name=>'Fecha Proceso Juridico'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha Proceso Juridico'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15549219396518001)
,p_db_column_name=>'No Proceso Juridico'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'No Proceso Juridico'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11712531705427703)
,p_db_column_name=>'Numero Acto'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Numero Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11712664189427704)
,p_db_column_name=>'Fecha Acto'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha Acto'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11712781889427705)
,p_db_column_name=>'Abogado'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Abogado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11713075526427708)
,p_db_column_name=>'Tipo de Acto'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Tipo De Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11713192131427709)
,p_db_column_name=>'VGNCIAS'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Vgncias'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85166393172979629)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Ver Acto'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,#ID_ACTO#'
,p_column_linktext=>'<button type="button" class="t-Button t-Button--icon t-Button--success t-Button--simple t-Button--iconRight">Ver<span aria-hidden="true" class="t-Icon t-Icon--right fa fa-eye"></span></button>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25084053039384377)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'250841'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'No Proceso Juridico:Numero Acto:Fecha Proceso Juridico:Fecha Acto:Tipo de Acto:VGNCIAS:Abogado::ID_ACTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172596480535319521)
,p_plug_name=>'&P21_DSCRPCION.'
,p_icon_css_classes=>'&P21_ICNO.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52124852663074800)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25075336159360824)
,p_name=>'P21_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(172596480535319521)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25075745174360825)
,p_name=>'P21_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(172596480535319521)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25076109729360826)
,p_name=>'P21_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(172596480535319521)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
