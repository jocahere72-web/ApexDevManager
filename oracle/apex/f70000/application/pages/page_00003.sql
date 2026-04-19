prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Clase de Predios Urbano y Rural'
,p_page_mode=>'MODAL'
,p_step_title=>'Clase de Predios Urbano y Rural'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'auto'
,p_dialog_width=>'80%'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220122203526'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175072731603017376)
,p_plug_name=>unistr('<b>Estad\00EDsticas por clase de Predios</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.clse as "Clase Predio",',
'       count(distinct(rfrncia_igac)) as "No. Predios",',
'       sum(a.avluo_igac) as "Total Avaluos",',
'       sum(case',
'             when a.prdio_nvo = ''S'' then',
'              1',
'             else',
'              0',
'           end) as "Nuevos",',
'       sum(case',
'             when a.prdio_nvo = ''S'' then',
'              a.avluo_igac',
'             else',
'              0',
'           end) as "Total Avaluos Nuevos"',
'  from (select ',
'               decode(substr(c.rfrncia_igac, 1, 2), ''01'', ''Urbano'', ''Rural'') as clse,',
'               c.avluo_igac,',
'               nvl(p.prdio_nvo, ''S'') as prdio_nvo,',
'               c.rfrncia_igac',
'          from gi_g_cinta_igac c',
'          join et_g_procesos_carga d',
'            on d.id_prcso_crga = c.id_prcso_crga',
'          left join (select ''N'' as prdio_nvo, c.idntfccion, b.id_impsto',
'                      from si_i_predios a',
'                      join si_i_sujetos_impuesto b',
'                        on a.id_sjto_impsto = b.id_sjto_impsto                       ',
'                      join si_c_sujetos c',
'                        on b.id_sjto = c.id_sjto) p',
'            on c.rfrncia_igac = p.idntfccion',
'            and d.id_impsto = p.id_impsto',
'         where c.id_prcso_crga = :P40_ARCHIVO',
'           and c.nmro_orden_igac = ''001'') a',
' group by a.clse',
' order by a.clse',
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
 p_id=>wwv_flow_api.id(175073400432017382)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ECASTILLO'
,p_internal_uid=>172901370866428422
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175073446602017383)
,p_db_column_name=>'Clase Predio'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Clase predio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175073621253017384)
,p_db_column_name=>'No. Predios'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'No. predios'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175073644684017385)
,p_db_column_name=>'Total Avaluos'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Total avaluos'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175073761427017386)
,p_db_column_name=>'Nuevos'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nuevos'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(175073910967017387)
,p_db_column_name=>'Total Avaluos Nuevos'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Total avaluos nuevos'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(175161690284335510)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1729897'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'Clase Predio:No. Predios:Total Avaluos:Nuevos:Total Avaluos Nuevos'
,p_sum_columns_on_break=>'No. Predios:Total Avaluos:Total Avaluos Nuevos:Nuevos'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33301637179531601)
,p_name=>'P3_INDICADOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(175072731603017376)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
