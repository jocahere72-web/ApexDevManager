prompt --application/pages/page_00172
begin
wwv_flow_api.create_page(
 p_id=>172
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Finalizaci\00F3n Gesti\00F3n de solicitud de Productos  ')
,p_step_title=>unistr('Finalizaci\00F3n Gesti\00F3n de solicitud de Productos  ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20201218132712'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95919521218512604)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(96415776131605501)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
'<i>',
'    Funcionalidad que permite visualizar el estado final de la solicitud de productos.',
unistr('    <br><br> Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192263571604012322)
,p_plug_name=>unistr('Informaci\00F3n  del Sujeto Tributo ')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'P172_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192458289925082740)
,p_plug_name=>'Solicitud'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192324352352737138)
,p_plug_name=>unistr('Tab Gesti\00F3n solicitud')
,p_parent_plug_id=>wwv_flow_api.id(192458289925082740)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple:t-TabsRegion-mod--large'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192251292513010639)
,p_plug_name=>'Resoluciones '
,p_parent_plug_id=>wwv_flow_api.id(192324352352737138)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_rslcion,',
'        a.file_name,',
'       -- a.file_blob,',
'       a.nmro_rslcion,',
'       a.fcha_incial,',
'       a.fcha_fnal,',
'       case when trunc(sysdate) >= trunc(a.fcha_incial) and trunc(sysdate) <= trunc(a.fcha_fnal) then',
'                ''Vigente''',
'            else',
'                ''No Vigente''',
'       end as stdo,     ',
'        1 DESCARGAR        ',
'from    si_d_resoluciones a ',
'where   a.id_sjto_impsto = :P172_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(192324370523737139)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JRANGEL'
,p_internal_uid=>192324370523737139
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96299128280859903)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Nombre Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96299564655859911)
,p_db_column_name=>'ID_RSLCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Rslcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96299948666859911)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:SI_D_RESOLUCIONES:FILE_BLOB:ID_RSLCION::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-cloud-arrow-down" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99489626021346501)
,p_db_column_name=>'NMRO_RSLCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('N\00FAmero de Resoluci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99489730785346502)
,p_db_column_name=>'FCHA_INCIAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha Inicial '
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99489889533346503)
,p_db_column_name=>'FCHA_FNAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha Final '
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99489970308346504)
,p_db_column_name=>'STDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estado '
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(192352008313825459)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'963003'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_RSLCION:FCHA_INCIAL:FCHA_FNAL:STDO:FILE_NAME:DESCARGAR:'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(101513336143360566)
,p_report_id=>wwv_flow_api.id(192352008313825459)
,p_name=>'Resoluciones No VIgentes'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'STDO'
,p_operator=>'='
,p_expr=>'No Vigente'
,p_condition_sql=>' (case when ("STDO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''No Vigente''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#ECF7A8'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192253070431010657)
,p_plug_name=>'Detalle Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(192324352352737138)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192251683817010643)
,p_plug_name=>'Detalle de la Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(192253070431010657)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select x.id_rnta_prdcto',
'      , x.id_subprdcto',
'      , x.id_rnta',
'      , x.cntdad_slctda',
'      , x.cntdad_aprbda',
'      , x.vlor_untrio',
'      , x.vlor_ttal',
'      , x.cntdad_actal',
'      , x.cntdad_rsrvda',
'      , x.cntdad_actal - x.cntdad_rsrvda as stock',
'      , case',
'            when x.cntdad_slctda > (x.cntdad_dspnble - nvl(x.cntdad_rsrvda, 0)) then',
'                    0',
'            when x.cntdad_dspnble - nvl(x.cntdad_rsrvda, 0) > x.cntdad_slctda then',
'                    1',
'        end as indcdor',
'   from (',
'             select a.id_rnta_prdcto',
'                  , a.id_subprdcto',
'                  , a.id_rnta',
'                  , a.cntdad_slctda',
'                  , a.cntdad_aprbda',
'                  , a.vlor_untrio',
'                  , a.vlor_ttal',
'                  , a.cntdad_actal',
'                  , c.cntdad_dspnble                  ',
'                  , ( select sum(cntdad_rsrvda)',
'                        from gi_g_rentas_producto',
'                       where id_subprdcto   = a.id_subprdcto',
'                         and indcdor_rsrvdo = 1)   cntdad_rsrvda',
'              ',
'               from gi_g_rentas_producto      a',
'               join gi_d_subproductos         b on a.id_subprdcto     = b.id_subprdcto',
'               left join v_ex_almacen_externo c on b.cdgo_subproducto = c.cdgo_prdcto',
'              where a.id_rnta = :P172_ID_RNTA',
'        ) x '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97343823056979903)
,p_name=>'ID_SUBPRDCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SUBPRDCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Descripci\00F3n Producto ')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion as v',
'     , a.id_subprdcto                                                                                  as r       ',
'  from v_gi_d_productos a',
' where a.actvo = ''S'''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101134225280819201)
,p_name=>'CNTDAD_ACTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNTDAD_ACTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad Actual'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(101134332135819202)
,p_name=>'CNTDAD_RSRVDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNTDAD_RSRVDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad Reservada '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(101134444039819203)
,p_name=>'STOCK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCK'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Stock'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(101134506556819204)
,p_name=>'INDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Indcdor'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(192252041554010646)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192252079599010647)
,p_name=>'CNTDAD_SLCTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNTDAD_SLCTDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad Solicitada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192252172889010648)
,p_name=>'CNTDAD_APRBDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNTDAD_APRBDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad Aprobada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_item_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')"'
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
 p_id=>wwv_flow_api.id(192252275340010649)
,p_name=>'VLOR_UNTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_UNTRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Unitario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192252401920010650)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192252655611010652)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192252785442010654)
,p_name=>'ID_RNTA_PRDCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA_PRDCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(192251799767010644)
,p_internal_uid=>192251799767010644
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(192260218950067558)
,p_interactive_grid_id=>wwv_flow_api.id(192251799767010644)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(192260361890067558)
,p_report_id=>wwv_flow_api.id(192260218950067558)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97352334825008165)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(97343823056979903)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>486
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101140234525819383)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(101134225280819201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101140775327819385)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(101134332135819202)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101141165994819391)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(101134444039819203)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>149
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101141619468819393)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(101134506556819204)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192261346104067566)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(192252041554010646)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192261791281067568)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(192252079599010647)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192262333172067569)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(192252172889010648)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192262837768067572)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(192252275340010649)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192263330228067574)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(192252401920010650)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192265317510075620)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(192252785442010654)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(105291000010)
,p_view_id=>wwv_flow_api.id(192260361890067558)
,p_execution_seq=>5
,p_name=>'Cantidad Solicitada no Disponible '
,p_background_color=>'#ECF7A8'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(101134506556819204)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'0'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192325147973737146)
,p_plug_name=>'Adjuntos '
,p_parent_plug_id=>wwv_flow_api.id(192324352352737138)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.id_rnta_adjnto,',
'        b.file_name,',
'       -- b.file_blob,',
'        1 DESCARGAR',
'from    gi_g_rentas_adjnto b',
'where   b.id_rnta = :P172_ID_RNTA',
'',
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
 p_id=>wwv_flow_api.id(192325193057737147)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JRANGEL'
,p_internal_uid=>192325193057737147
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96306961801859950)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Nombre Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96307349388859952)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GI_G_RENTAS_ADJNTO:FILE_BLOB:ID_RNTA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-cloud-arrow-down" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96307729644859953)
,p_db_column_name=>'ID_RNTA_ADJNTO'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Id Rnta Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(192362948890073135)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'963081'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:DESCARGAR:ID_RNTA_ADJNTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192604672793001032)
,p_plug_name=>'Opciones '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96449447046787601)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(192604672793001032)
,p_button_name=>'Btn_regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96297251579859868)
,p_name=>'P172_NMRO_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(192324352352737138)
,p_prompt=>unistr('N\00FAmero de Solicitud ')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96297618746859876)
,p_name=>'P172_FCHA_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(192324352352737138)
,p_prompt=>'Fecha de Solicitud '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96298057958859878)
,p_name=>'P172_USRIO_SLCTUD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(192324352352737138)
,p_prompt=>'Usuario que Solicita '
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96298404325859894)
,p_name=>'P172_VLOR_SLCTUD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(192324352352737138)
,p_prompt=>'Total de la Solicitud'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96301024323859919)
,p_name=>'P172_ID_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(192253070431010657)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96301411995859926)
,p_name=>'P172_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(192253070431010657)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96391051813192501)
,p_name=>'P172_ESTDO_SLCTUD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(192324352352737138)
,p_prompt=>'Estado de la Solicitud'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(96306086483859947)
,p_tabular_form_region_id=>wwv_flow_api.id(192251683817010643)
,p_validation_name=>'Cantidad aprobada menor que la solicitada'
,p_validation_sequence=>10
,p_validation=>'to_number(:CNTDAD_SLCTDA) >= to_number(:CNTDAD_APRBDA)'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'#COLUMN_HEADER# no debe se mayor que la cantidad solicitada.'
,p_when_button_pressed=>wwv_flow_api.id(96161421817222901)
,p_associated_column=>'CNTDAD_APRBDA'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96456060202821101)
,p_name=>unistr('Al cargar pagina desactivar bot\00F3n regresar ')
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NOT_EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'       from WF_G_INSTANCIAS_FLUJO',
'      where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'        and estdo_instncia   = ''FINALIZADA'';'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96456176419821102)
,p_event_id=>wwv_flow_api.id(96456060202821101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(96449447046787601)
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96306212111859947)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(192251683817010643)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Actualizar valor total '
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_vlor_ttal number;        ',
'begin',
'    v_vlor_ttal := :CNTDAD_APRBDA * :VLOR_UNTRIO;',
'    case :APEX$ROW_STATUS   ',
'    ',
'    when ''U'' then                          ',
'       update gi_g_rentas_producto',
'          set cntdad_aprbda  = :CNTDAD_APRBDA',
'            , vlor_ttal      = v_vlor_ttal',
'        where id_rnta_prdcto = :ID_RNTA_PRDCTO;  ',
'      commit;',
'    end case;',
'    ',
'end;'))
,p_attribute_05=>'N'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(96161421817222901)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96308903385863198)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar datos de la renta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'        select a.id_rnta',
'             , a.id_sjto_impsto',
'             , a.nmro_rnta',
'             , a.id_usrio',
'             , a.fcha_rgstro',
'             , to_char(a.vlor_bse_grvble, :F_FRMTO_MNDA)',
'             , b.dscrpcion',
'          into :P172_ID_RNTA',
'             , :P172_ID_SJTO_IMPSTO   ',
'             , :P172_NMRO_SLCTUD',
'             , :P172_USRIO_SLCTUD',
'             , :P172_FCHA_SLCTUD',
'             , :P172_VLOR_SLCTUD',
'             , :P172_ESTDO_SLCTUD',
'          from gi_g_rentas         a',
'          join gi_d_rentas_estado  b on a.cdgo_rnta_estdo =  b.cdgo_rnta_estdo',
'         where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;       ',
'         ',
'exception ',
'        when no_data_found then',
'                raise_application_error(-20000, ''No se encontraron los datos de la solicitud'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
