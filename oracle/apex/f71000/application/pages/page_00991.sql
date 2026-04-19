prompt --application/pages/page_00991
begin
wwv_flow_api.create_page(
 p_id=>991
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Emision recibos masivos'
,p_step_title=>'Emision recibos masivos'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#datos_archivo_duplicados{',
'    width : 90%;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222102136'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(365604805070399227)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(366637592985638402)
,p_plug_name=>'Datos Archivo Duplicados'
,p_region_name=>'datos_archivo_duplicados'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n001, -- Id Sujeto Impuesto ',
unistr('        c001, -- Identificaci\00F3n'),
'        c002, -- Indicador Existe',
unistr('        c003, -- Direcci\00F3n'),
'        c004 -- Nombre Responsable',
'  from ( select n001, -- Id Sujeto Impuesto ',
unistr('                c001, -- Identificaci\00F3n'),
'                c002, -- Indicador Existe',
unistr('                c003, -- Direcci\00F3n'),
'                c004, -- Nombre Responsable',
'                case ',
'                    when (row_number() over(partition by c001 order by c001))>1 then ',
'                        ''Duplicado''',
'                    else ',
'                        ''Ok''',
'                end Estado',
'          from apex_collections ',
'         where collection_name = ''IDNTFCCION_SJTO_IMPSTO'') ',
' where estado = ''Duplicado'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P991_SLCCION_PBLCION'
,p_plug_display_when_cond2=>'ACV'
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
 p_id=>wwv_flow_api.id(367345504694527991)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>365167065283929532
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184807878801700120)
,p_db_column_name=>'N001'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'N001'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184808336905700121)
,p_db_column_name=>'C001'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'C001'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184808734911700122)
,p_db_column_name=>'C002'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'C002'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184809128033700122)
,p_db_column_name=>'C003'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'C003'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184809480239700123)
,p_db_column_name=>'C004'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'C004'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(367360576433538348)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1826314'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'N001:C001:C002:C003:C004'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(366639405834638420)
,p_plug_name=>'Consolidado Archivo'
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
 p_id=>wwv_flow_api.id(366639306071638419)
,p_plug_name=>'Consolidado Total Registros del Archivo'
,p_parent_plug_id=>wwv_flow_api.id(366639405834638420)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Total Registros en el Archivo'' label,',
'       count(c001) value',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(366639550588638421)
,p_plug_name=>'Consolidado Total Sujetos Tributos Validos'
,p_parent_plug_id=>wwv_flow_api.id(366639405834638420)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Total Sujetos Impuestos Validos'' label,',
'       count(c002) value',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c002 = ''SI'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(366639673645638422)
,p_plug_name=>'Consolidado Total Sujetos Tributos NO Validos'
,p_parent_plug_id=>wwv_flow_api.id(366639405834638420)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Total Sujetos Impuestos NO Validos'' label,',
'       count(c002) value',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'   and c002 = ''NO'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(366639767236638423)
,p_plug_name=>'Consolidado Registros Duplicados'
,p_parent_plug_id=>wwv_flow_api.id(366639405834638420)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Total Registros Duplicados'' label,',
'       count(c001) value',
unistr('  from (select c001, -- Identificaci\00F3n'),
'               case ',
'                   when (row_number() over(partition by c001 order by c001))>1 then ',
'                        ''Duplicado''',
'                    else ',
'                        ''Ok''',
'               end Estado',
'          from apex_collections ',
'         where collection_name = ''IDNTFCCION_SJTO_IMPSTO'') ',
'  where estado =''Duplicado'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'DOT'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(366640039171638426)
,p_plug_name=>'Datos Archivo'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select n001, -- Id Sujeto Impuesto ',
unistr('        c001, -- Identificaci\00F3n'),
'        c002, -- Indicador Existe',
unistr('        c003, -- Direcci\00F3n'),
'        c004, -- Nombre Responsable',
'        case ',
'            when (row_number() over(partition by c001 order by c001))>1 then ',
'                ''Duplicado''',
'            else ',
'                ''Ok''',
'        end Estado',
'  from apex_collections ',
' where collection_name = ''IDNTFCCION_SJTO_IMPSTO'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P991_SLCCION_PBLCION'
,p_plug_display_when_cond2=>'ACV'
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
 p_id=>wwv_flow_api.id(366640124865638427)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>364461685455039968
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184810625883700126)
,p_db_column_name=>'C001'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184810990025700127)
,p_db_column_name=>'N001'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Sujeto Impuesto'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184811355400700127)
,p_db_column_name=>'C002'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Existe ?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184811736226700129)
,p_db_column_name=>'C003'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184812111837700129)
,p_db_column_name=>'C004'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(184812458863700129)
,p_db_column_name=>'ESTADO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(367327322124425907)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1826344'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'C001:N001:C002:C003:C004:ESTADO'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(184813331178700130)
,p_report_id=>wwv_flow_api.id(367327322124425907)
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'C002'
,p_operator=>'='
,p_expr=>'NO'
,p_condition_sql=>' (case when ("C002" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''NO''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FAB9B9'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(184813679996700131)
,p_report_id=>wwv_flow_api.id(367327322124425907)
,p_name=>'Duplicados'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'Duplicado'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Duplicado''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#D4D2F5'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(367346591558528002)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184814358834700136)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(367346591558528002)
,p_button_name=>'BTN_PROCESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184815439865700139)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(365604805070399227)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184815040174700139)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(365604805070399227)
,p_button_name=>'BTN_LEER_ARCHIVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Leer Archivo'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-dynamic-content'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184815869711700139)
,p_name=>'P991_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184816257816700142)
,p_name=>'P991_ID_IMSPTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto d, ',
'        id_impsto_sbmpsto r',
'   from df_i_impuestoS_subimpuesto ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto = :P991_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P991_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184816647961700143)
,p_name=>'P991_VGNCIA_DSDE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_prompt=>'Vigencia Desde'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184817040798700143)
,p_name=>'P991_ID_PRDO_DSDE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_prompt=>'Periodo Desde'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select prdo, ',
'        id_prdo ',
'   from df_i_periodos ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto =:P991_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P991_ID_IMSPTO_SBMPSTO',
'    and vgncia = :P991_VGNCIA_DSDE',
'order by prdo    '))
,p_lov_cascade_parent_items=>'P991_VGNCIA_DSDE,P991_ID_IMSPTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184817457163700143)
,p_name=>'P991_VGNCIA_HSTA'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_prompt=>'Vigencia Hasta'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184817857899700144)
,p_name=>'P991_ID_PRDO_HSTA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_prompt=>'Periodo Hasta'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select prdo, ',
'        id_prdo ',
'   from df_i_periodos ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto =:P991_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P991_ID_IMSPTO_SBMPSTO',
'    and vgncia = :P991_VGNCIA_HSTA',
'order by prdo    '))
,p_lov_cascade_parent_items=>'P991_VGNCIA_HSTA,P991_ID_IMSPTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184818322378700144)
,p_name=>'P991_FCHA_VNCMNTO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_prompt=>'Fecha Vencimiento'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_02=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184818701124700144)
,p_name=>'P991_SLCCION_PBLCION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_item_default=>'ACV'
,p_prompt=>unistr('Selecci\00F3n Pablaci\00F3n por:')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Archivo;ACV,SQL;SQL'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184819100369700144)
,p_name=>'P991_ARCHVO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184819524858700144)
,p_name=>'P991_SQL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_prompt=>'SQL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>150
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184819908724700144)
,p_name=>'P991_NMRO_DCMNTO_GNRDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(365604805070399227)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(184820361662700148)
,p_validation_name=>'Validar que la vigencia Hasta no sea menor a la Vigencia Desde'
,p_validation_sequence=>10
,p_validation=>':P991_VGNCIA_HSTA >= :P991_VGNCIA_DSDE'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La vigencia hasta no puede ser menor a la vigencia desde'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(184815040174700139)
,p_associated_item=>wwv_flow_api.id(184817457163700143)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(184820755603700150)
,p_validation_name=>unistr('Validar que la fecha de vencimiento este dentro de un rango de fechas en la parametrizaci\00F3n de tasas mora')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_fcha_vlda varchar2(1);',
'',
'begin ',
'',
'    v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P45_ID_IMPSTO, to_date(:P991_FCHA_VNCMNTO));',
'    ',
'    if v_fcha_vlda = ''S'' then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de Vencimiento seleccionada no es valida. Por favor revise las par\00E1metrizaci\00F3n de Tasas Mora')
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(184815040174700139)
,p_associated_item=>wwv_flow_api.id(184818322378700144)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184821926215700153)
,p_name=>'Al cambiar. Si es Archivo se muestra el item para seleccionar un archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P991_SLCCION_PBLCION'
,p_condition_element=>'P991_SLCCION_PBLCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ACV'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184825438388700160)
,p_event_id=>wwv_flow_api.id(184821926215700153)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P991_ARCHVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184822393627700155)
,p_event_id=>wwv_flow_api.id(184821926215700153)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(366639405834638420)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184825850676700160)
,p_event_id=>wwv_flow_api.id(184821926215700153)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P991_ARCHVO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184822924124700158)
,p_event_id=>wwv_flow_api.id(184821926215700153)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(366639405834638420)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184824354520700159)
,p_event_id=>wwv_flow_api.id(184821926215700153)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(366640039171638426)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184823438435700159)
,p_event_id=>wwv_flow_api.id(184821926215700153)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(184815040174700139)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184824884366700159)
,p_event_id=>wwv_flow_api.id(184821926215700153)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(366640039171638426)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184823917387700159)
,p_event_id=>wwv_flow_api.id(184821926215700153)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(184815040174700139)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184826438087700160)
,p_event_id=>wwv_flow_api.id(184821926215700153)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P991_SQL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184826858598700160)
,p_event_id=>wwv_flow_api.id(184821926215700153)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P991_SQL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184827253022700160)
,p_name=>unistr('Al cambiar el archivo se refresca la regi\00F3n de datos del archivo')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P991_ARCHVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184830245399700162)
,p_event_id=>wwv_flow_api.id(184827253022700160)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'APEX_UTIL.SET_SESSION_STATE(''P991_ARCHVO'',:P991_ARCHVO);'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184829764739700161)
,p_event_id=>wwv_flow_api.id(184827253022700160)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(366639306071638419)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184828766994700161)
,p_event_id=>wwv_flow_api.id(184827253022700160)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(366639550588638421)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184828314977700161)
,p_event_id=>wwv_flow_api.id(184827253022700160)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(366639673645638422)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184827801607700161)
,p_event_id=>wwv_flow_api.id(184827253022700160)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(366639767236638423)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184829287530700161)
,p_event_id=>wwv_flow_api.id(184827253022700160)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(366637592985638402)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184830713800700162)
,p_name=>'Al hacer clic Abrir modal de datos de archivos duplicados'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(366639767236638423)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184831204138700162)
,p_event_id=>wwv_flow_api.id(184830713800700162)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#datos_archivo_duplicados").dialog("open");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184845204306766871)
,p_event_id=>wwv_flow_api.id(184830713800700162)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(366637592985638402)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(184821048536700150)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select name',
'    into :P991_SQL',
'  from apex_application_temp_files',
' where name = :P991_ARCHVO;',
'    ',
'   -- :P991_SQL := v_registro;    ',
'*/',
'DECLARE',
'    v_blob_data       BLOB;',
'    v_blob_len        NUMBER;',
'    v_position        NUMBER;',
'    v_raw_chunk       RAW(10000);',
'    v_char            CHAR(1);',
'    c_chunk_len       number                  := 1;',
'    v_line            VARCHAR2 (32767)        := NULL;',
'    v_data_array      wwv_flow_global.vc_arr2;',
'',
'    v_id_sjto_impsto    si_i_sujetos_impuesto.id_sjto_impsto%type;',
'    v_drccion           si_i_sujetos_impuesto.drccion%type;  ',
'    v_nmbre_rspnsble    V_SI_I_SUJETOS_RESPONSABLE.nmbre_rspnsble%type;  ',
'    v_idntfccion        varchar2(30);',
'    v_indcdor_existe    varchar2(2);',
'                       ',
'BEGIN',
' APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''IDNTFCCION_SJTO_IMPSTO''); ',
'    -- Read data from wwv_flow_files',
'    select blob_content ',
'      into v_blob_data',
'     from apex_application_temp_files  ',
'    where name =  :P991_ARCHVO;',
'',
'    v_blob_len := dbms_lob.getlength(v_blob_data);',
'    v_position := 1;',
'    ',
'     if apex_collection.collection_exists(''IDNTFCCION_SJTO_IMPSTO'') then',
'        WHILE ( v_position <= v_blob_len ) LOOP',
'            v_raw_chunk := dbms_lob.substr(v_blob_data,c_chunk_len,v_position);',
'            v_char :=  chr(hex_to_decimal(rawtohex(v_raw_chunk)));',
'            v_position := v_position + c_chunk_len;',
'            ',
'            v_line := v_line || v_char;',
'            v_line := REPLACE (v_line,  CHR(10), '''');',
'            v_idntfccion := REPLACE (v_line,  CHR(13), '''');',
'            ',
'            -- Si es Fin de Linea',
'            IF v_char = CHR(13) THEN',
'            ',
'                --v_idntfccion := v_line;',
'            -- insert into gti_aux (col1, col2) values (v_char, v_idntfccion  );    commit;',
unistr('                -- Se valida si el la identificaci\00F3n es valida '),
'                begin ',
'                   select id_sjto_impsto,',
'                          ''SI'' indcdor_existe,',
'                          drccion,',
'                          nmbre_rspnsble',
'                     into v_id_sjto_impsto,',
'                          v_indcdor_existe,',
'                          v_drccion,',
'                          v_nmbre_rspnsble',
'                     from V_SI_I_SUJETOS_RESPONSABLE',
'                    where cdgo_clnte = :F_CDGO_CLNTE',
'                      and id_impsto = :P991_ID_IMPSTO',
'                      and idntfccion =  v_idntfccion  -- 0003000000000901900008312',
'                      and prncpal_s_n = ''S'';',
'                exception ',
'                   when no_data_found then ',
'                       v_id_sjto_impsto := null;',
'                       v_indcdor_existe := ''NO'' ;  ',
'                       v_drccion        := '' -- '';',
'                       v_nmbre_rspnsble    := '' -- '';',
'                end;       ',
'               ',
'                APEX_COLLECTION.ADD_MEMBER( p_collection_name => ''IDNTFCCION_SJTO_IMPSTO'',',
'                                          p_n001            =>  v_id_sjto_impsto,',
'                                          p_C001            =>  v_idntfccion,',
'                                          p_C002            => v_indcdor_existe,',
'                                          p_C003            => v_drccion,',
'                                          p_C004            => v_nmbre_rspnsble);  ',
'                -- Clear out',
'                v_line := NULL;',
'          --  else',
'                -- Si es Fin de Linea -->  CONCATENO CARACTER',
'               ',
'            END IF;',
'         END LOOP;',
'     ',
'          ',
'     end if;',
'    -- Read and convert binary to char',
'    ',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(184815040174700139)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(184821476682700151)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_msj      varchar2(5000);',
'v_count    number;',
'',
'begin',
'',
'    for c_sjto_impsto in (select n001 id_sjto_impsto',
'                            from apex_collections ',
'                           where collection_name = ''IDNTFCCION_SJTO_IMPSTO''',
'                             and c002 = ''SI'') loop                ',
'         ',
'         v_msj := pkg_re_documentos.fnc_gn_documento (p_cdgo_clnte 			=> :F_CDGO_CLNTE, ',
'                                                 p_id_impsto 			=> :P991_ID_IMPSTO, ',
'                                                 p_id_impsto_sbmpsto 	=> :P991_ID_IMPSTO_SBMPSTO, ',
'                                                 p_cdna_vgncia_prdo		=> :P991_VGNCIA_DSDE || '','' || :P991_ID_PRDO_DSDE || '':'' || :P991_VGNCIA_HSTA || '','' || :P991_ID_PRDO_HSTA,',
'                                                 p_cdna_vgncia_prdo_ps	=> null,',
'                                                 p_id_sjto_impsto       => c_sjto_impsto.id_sjto_impsto,',
'                                                 p_fcha_vncmnto			=> :P991_FCHA_VNCMNTO,',
'                                                 p_cdgo_dcmnto_tpo		=> ''DNO'',',
'                                                 p_vlor_ttal_dcmnto		=> 0);',
'    v_count := v_count +1;                                                 ',
'    end loop; ',
':P991_NMRO_DCMNTO_GNRDO := v_count; ',
'end;                               ',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(184719450691426376)
,p_process_success_message=>'Se Regeneron &P991_NMRO_DCMNTO_GNRDO. Documentos'
);
end;
/
