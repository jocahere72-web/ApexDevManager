prompt --application/pages/page_00121
begin
wwv_flow_api.create_page(
 p_id=>121
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Panel Control Recaudo 2'
,p_page_mode=>'MODAL'
,p_step_title=>'Panel Control Recaudo'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'auto'
,p_dialog_width=>'90%'
,p_last_updated_by=>'1111111112'
,p_last_upd_yyyymmddhh24miss=>'20220808184155'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35183579577762226)
,p_plug_name=>unistr('Panel de Estad\00EDstica de Recaudo')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24116422801325101)
,p_plug_name=>'Tab'
,p_parent_plug_id=>wwv_flow_api.id(35183579577762226)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--fillLabels:t-TabsRegion-mod--simple:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24116524901325102)
,p_plug_name=>unistr('Distribuci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(24116422801325101)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from re_g_recaudos a',
'  join re_g_recaudos_control b',
'    on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
' where a.cdgo_rcdo_estdo  = ''AP''',
'   and b.cdgo_clnte       = :F_CDGO_CLNTE ',
'   and b.id_impsto        = nvl( :P121_ID_IMPSTO , b.id_impsto )',
'   and b.cdgo_rcdo_orgen  = nvl( :P121_CDGO_RCDO_ORGEN , b.cdgo_rcdo_orgen)',
'   and trunc(a.fcha_rcdo) = nvl( :P121_FCHA_RCDO , trunc(a.fcha_rcdo))',
'   and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17964639345544710)
,p_plug_name=>'Tab 2'
,p_parent_plug_id=>wwv_flow_api.id(24116524901325102)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--fillLabels:t-TabsRegion-mod--simple:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17964789583544711)
,p_plug_name=>'<b>Conceptos</b>'
,p_parent_plug_id=>wwv_flow_api.id(17964639345544710)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--stacked:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_cncpto,',
'       dscrpcion_cncpto,',
'       sum(vlor_cptal) as vlor_cptal,',
'       sum(vlor_intres) as vlor_intres,',
'       sum(vlor_ttal) as vlor_ttal,',
'       sum(vlor_sldo_fvor) as vlor_sldo_fvor',
'  from (select z.cdgo_cncpto,',
'               z.dscrpcion_cncpto,',
'               z.vlor_cptal,',
'               z.vlor_intres,',
'               z.vlor_ttal,',
'               z.vlor_sldo_fvor',
'          from v_re_g_recaudos_detalle z',
'         where exists (select a.id_rcdo',
'                  from re_g_recaudos a',
'                  join re_g_recaudos_control b',
'                    on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                 where a.cdgo_rcdo_estdo = ''AP''',
'                   and b.cdgo_clnte = :F_CDGO_CLNTE',
'                   and a.id_rcdo = z.id_rcdo',
'                   and b.id_impsto = nvl(:P121_ID_IMPSTO, b.id_impsto)',
'                   and b.cdgo_rcdo_orgen =',
'                       nvl(:P121_CDGO_RCDO_ORGEN, b.cdgo_rcdo_orgen)',
'                   and trunc(a.fcha_rcdo) =',
'                       nvl(:P121_FCHA_RCDO, trunc(a.fcha_rcdo))',
'                   and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and',
'                       :P120_FCHA_FIN))',
' group by cdgo_cncpto, dscrpcion_cncpto',
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
 p_id=>wwv_flow_api.id(17964833344544712)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos que mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JLUJAN'
,p_internal_uid=>17964833344544712
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17965062718544714)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('C\00F3digo Concepto  ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17965190216544715)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n  Concepto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17965279464544716)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17965311644544717)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>unistr('Valor Inter\00E9s ')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17965557815544719)
,p_db_column_name=>'VLOR_SLDO_FVOR'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Saldo a Favor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17965486328544718)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>100
,p_column_identifier=>'F'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(21471154393188024)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'214712'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_CNCPTO:DSCRPCION_CNCPTO:VLOR_CPTAL:VLOR_INTRES:VLOR_SLDO_FVOR:VLOR_TTAL'
,p_sum_columns_on_break=>'VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17966322223544727)
,p_plug_name=>'<b>Rural Urbano</b>'
,p_parent_plug_id=>wwv_flow_api.id(17964639345544710)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--stacked:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion',
'     , cdgo_cncpto',
'     , dscrpcion_cncpto',
'     , sum(vlor_cptal) as vlor_cptal',
'     , sum(vlor_intres) as vlor_intres',
'     , sum(vlor_ttal) as vlor_ttal',
'     , sum(vlor_sldo_fvor) as vlor_sldo_fvor         ',
'  from (',
'            select c.dscrpcion_prdio_clsfccion',
'                 , z.cdgo_cncpto',
'                 , z.dscrpcion_cncpto',
'                 , z.vlor_cptal',
'                 , z.vlor_intres ',
'                 , z.vlor_ttal',
'                 , z.vlor_sldo_fvor                      ',
'               from v_re_g_recaudos_detalle z',
'               join v_si_i_predios c on c.id_sjto_impsto = z.id_sjto_impsto',
'               where exists (',
'                                select a.id_rcdo        ',
'                                  from re_g_recaudos a',
'                                  join re_g_recaudos_control b',
'                                    on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                                 where a.cdgo_rcdo_estdo  = ''AP''',
'                                   and b.cdgo_clnte       = :F_CDGO_CLNTE',
'                                   and a.id_rcdo          = z.id_rcdo',
'                                   and b.id_impsto        = nvl( :P121_ID_IMPSTO , b.id_impsto )',
'                                   and b.cdgo_rcdo_orgen  = nvl( :P121_CDGO_RCDO_ORGEN , b.cdgo_rcdo_orgen)',
'                                   and trunc(a.fcha_rcdo) = nvl( :P121_FCHA_RCDO , trunc(a.fcha_rcdo))',
'                                   and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN',
'                             )',
'         )         ',
'  group by dscrpcion_prdio_clsfccion',
'         , cdgo_cncpto',
'         , dscrpcion_cncpto   '))
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
 p_id=>wwv_flow_api.id(17966475152544728)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos que mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JLUJAN'
,p_internal_uid=>17966475152544728
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17967611053544740)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>10
,p_column_identifier=>'K'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17966583249544729)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo Concepto  ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17966665119544730)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n  Concepto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17966787307544731)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17966819752544732)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>unistr('Valor Inter\00E9s ')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17966992205544733)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17967005315544734)
,p_db_column_name=>'VLOR_SLDO_FVOR'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Saldo a Favor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(21493145650343683)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'214932'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_PRDIO_CLSFCCION:CDGO_CNCPTO:DSCRPCION_CNCPTO:VLOR_CPTAL:VLOR_INTRES:VLOR_SLDO_FVOR:VLOR_TTAL:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17967855476544742)
,p_plug_name=>'<b>Destinos y Estratos</b>'
,p_parent_plug_id=>wwv_flow_api.id(17964639345544710)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--stacked:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdo_dstno,',
'       dscrpcion_estrto,',
'       cdgo_cncpto,',
'       dscrpcion_cncpto,',
'       sum(vlor_cptal) as vlor_cptal,',
'       sum(vlor_intres) as vlor_intres,',
'       sum(vlor_ttal) as vlor_ttal,',
'       sum(vlor_sldo_fvor) as vlor_sldo_fvor',
'  from (select c.dscrpcion_prdo_dstno,',
'               c.dscrpcion_estrto,',
'               z.cdgo_cncpto,',
'               z.dscrpcion_cncpto,',
'               z.vlor_cptal,',
'               z.vlor_intres,',
'               z.vlor_ttal,',
'               z.vlor_sldo_fvor',
'          from v_re_g_recaudos_detalle z',
'          join v_si_i_predios c',
'            on c.id_sjto_impsto = z.id_sjto_impsto',
'         where exists (select a.id_rcdo',
'                  from re_g_recaudos a',
'                  join re_g_recaudos_control b',
'                    on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                 where a.cdgo_rcdo_estdo = ''AP''',
'                   and b.cdgo_clnte = :F_CDGO_CLNTE',
'                   and a.id_rcdo = z.id_rcdo',
'                   and b.id_impsto = nvl(:P121_ID_IMPSTO, b.id_impsto)',
'                   and b.cdgo_rcdo_orgen =',
'                       nvl(:P121_CDGO_RCDO_ORGEN, b.cdgo_rcdo_orgen)',
'                   and trunc(a.fcha_rcdo) =',
'                       nvl(:P121_FCHA_RCDO, trunc(a.fcha_rcdo))',
'                   and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and',
'                       :P120_FCHA_FIN))',
' group by dscrpcion_prdo_dstno,',
'          dscrpcion_estrto,',
'          cdgo_cncpto,',
'          dscrpcion_cncpto',
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
 p_id=>wwv_flow_api.id(17967915406544743)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos que mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JLUJAN'
,p_internal_uid=>17967915406544743
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21500283795453901)
,p_db_column_name=>'DSCRPCION_PRDO_DSTNO'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21500346071453902)
,p_db_column_name=>'DSCRPCION_ESTRTO'
,p_display_order=>20
,p_column_identifier=>'G'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21500461030453903)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>30
,p_column_identifier=>'H'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17968184187544745)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>40
,p_column_identifier=>'A'
,p_column_label=>unistr('Descripci\00F3n  Concepto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17968266314544746)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17968388792544747)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>unistr('Valor Inter\00E9s ')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17968402908544748)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17968545174544749)
,p_db_column_name=>'VLOR_SLDO_FVOR'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>'Saldo a Favor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(21509888498457169)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'215099'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_PRDO_DSTNO:DSCRPCION_ESTRTO:DSCRPCION_CNCPTO:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL:VLOR_SLDO_FVOR:CDGO_CNCPTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23697591588233530)
,p_plug_name=>'<b>Vigencia Concepto</b>'
,p_parent_plug_id=>wwv_flow_api.id(17964639345544710)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--stacked:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia',
'     , cdgo_cncpto',
'     , dscrpcion_cncpto',
'     , sum(vlor_cptal) as vlor_cptal',
'     , sum(vlor_intres) as vlor_intres',
'     , sum(vlor_ttal) as vlor_ttal',
'     , sum(vlor_sldo_fvor) as vlor_sldo_fvor         ',
'  from (',
'            select z.vgncia',
'                 , z.cdgo_cncpto',
'                 , z.dscrpcion_cncpto',
'                 , z.vlor_cptal',
'                 , z.vlor_intres ',
'                 , z.vlor_ttal',
'                 , z.vlor_sldo_fvor                      ',
'               from v_re_g_recaudos_detalle z',
'               where exists (',
'                                select a.id_rcdo        ',
'                                  from re_g_recaudos a',
'                                  join re_g_recaudos_control b',
'                                    on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                                 where a.cdgo_rcdo_estdo  = ''AP''',
'                                   and b.cdgo_clnte       = :F_CDGO_CLNTE',
'                                   and a.id_rcdo          = z.id_rcdo',
'                                   and b.id_impsto        = nvl( :P121_ID_IMPSTO , b.id_impsto )',
'                                   and b.cdgo_rcdo_orgen  = nvl( :P121_CDGO_RCDO_ORGEN , b.cdgo_rcdo_orgen)',
'                                   and trunc(a.fcha_rcdo) = nvl( :P121_FCHA_RCDO , trunc(a.fcha_rcdo))',
'                                   and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN',
'                             )',
'         )         ',
'  group by vgncia',
'         , cdgo_cncpto',
'         , dscrpcion_cncpto   '))
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
 p_id=>wwv_flow_api.id(23698976779233544)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos que mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>23698976779233544
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23699154146233546)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('C\00F3digo Concepto  ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23699230597233547)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n  Concepto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23699324090233548)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23699475312233549)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Valor Inter\00E9s ')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23699536035233550)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25270927404692501)
,p_db_column_name=>'VLOR_SLDO_FVOR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Saldo a Favor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17967795440544741)
,p_db_column_name=>'VGNCIA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Vgncia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25295156579714640)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'252952'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:CDGO_CNCPTO:DSCRPCION_CNCPTO:VLOR_CPTAL:VLOR_INTRES:VLOR_SLDO_FVOR:VLOR_TTAL:'
,p_sum_columns_on_break=>'VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL:VLOR_SLDO_FVOR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24117172077325108)
,p_plug_name=>unistr('Distribuci\00F3n (K + I + S)')
,p_parent_plug_id=>wwv_flow_api.id(24116524901325102)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>5
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(23696354116233518)
,p_region_id=>wwv_flow_api.id(24117172077325108)
,p_chart_type=>'donut'
,p_title=>unistr('Distribuci\00F3n de Recaudos')
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'No hay datos por mostrar.'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'   options.dataFilter = function(data) {',
'       if(data.series.length > 0){           ',
'          data.series[0].color = ''#3F94DB'';',
'          data.series[1].color = ''#FFCF3C'';',
'          data.series[2].color = ''#FF763C'';',
'       }',
'       return data;',
'   };',
'   return options;',
'}'))
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(23696491731233519)
,p_chart_id=>wwv_flow_api.id(23696354116233518)
,p_seq=>10
,p_name=>'Consulta Recaudo Detalle'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion ',
'        , sum(vlor) as vlor',
'        , ''<b>'' || dscrpcion  || '':</b> '' || to_char( sum(vlor) , ''FM$999G999G999G999G999G999G990'' ) || ''<br>'' as tooltip',
'    from (',
'             select z.vlor_cptal',
'                  , z.vlor_intres',
'                  , z.vlor_sldo_fvor',
'               from v_re_g_recaudos_detalle z',
'              where exists (',
'                                select a.id_rcdo        ',
'                                  from re_g_recaudos a',
'                                  join re_g_recaudos_control b',
'                                    on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                                 where a.cdgo_rcdo_estdo  = ''AP''',
'                                   and b.cdgo_clnte       = :F_CDGO_CLNTE',
'                                   and a.id_rcdo          = z.id_rcdo',
'                                   and b.id_impsto        = nvl( :P121_ID_IMPSTO , b.id_impsto )',
'                                   and b.cdgo_rcdo_orgen  = nvl( :P121_CDGO_RCDO_ORGEN , b.cdgo_rcdo_orgen)',
'                                   and trunc(a.fcha_rcdo) = nvl( :P121_FCHA_RCDO , trunc(a.fcha_rcdo))',
'                                   and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN',
'                           )                    ',
'         )',
' unpivot ( vlor for dscrpcion in ( ',
'                                       vlor_cptal as ''Capital''',
unistr('                                     , vlor_intres as ''Inter\00E9s'''),
'                                     , vlor_sldo_fvor as ''Saldo a favor'') ',
'                                 )',
' group by dscrpcion',
' order by dscrpcion'))
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'VLOR'
,p_items_label_column_name=>'DSCRPCION'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25029476825237104)
,p_plug_name=>unistr('Distribuci\00F3n de Vigencias')
,p_parent_plug_id=>wwv_flow_api.id(24116524901325102)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>unistr('<small>Para seleccionar la/las vigencia(s) a observar en la gr\00E1fica de Distribuci\00F3n de Vigencias, debe posicionarse sobre la barra de vigencia haciendo clic sostenido arrastrar de izquierda a derecha las vigencias que desea observar.</small>')
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(23696961590233524)
,p_region_id=>wwv_flow_api.id(25029476825237104)
,p_chart_type=>'bar'
,p_title=>unistr('Distribuci\00F3n de Vigencias')
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'delayed'
,p_initial_zooming=>'none'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'on'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
end;
/
begin
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(23697335853233528)
,p_chart_id=>wwv_flow_api.id(23696961590233524)
,p_seq=>20
,p_name=>'Capital'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select sum(vlor_cptal) as vlor_cptal',
'       , vgncia',
'       , ''<b>Vigencia:</b> '' || vgncia || ''<br>'' || ',
'         ''<b>Valor:</b> '' || to_char( sum(vlor_cptal) , ''FM$999G999G999G999G999G999G990'' ) || ''<br>'' as tooltip ',
'    from (',
'                 select z.vlor_cptal',
'                      , z.vlor_intres                          ',
'                      , z.vgncia        ',
'                   from v_re_g_recaudos_detalle z',
'                  where exists (',
'                                    select a.id_rcdo        ',
'                                      from re_g_recaudos a',
'                                      join re_g_recaudos_control b',
'                                        on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                                     where a.cdgo_rcdo_estdo  = ''AP''',
'                                       and b.cdgo_clnte       = :F_CDGO_CLNTE',
'                                       and a.id_rcdo          = z.id_rcdo',
'                                       and b.id_impsto        = nvl( :P121_ID_IMPSTO , b.id_impsto )',
'                                       and b.cdgo_rcdo_orgen  = nvl( :P121_CDGO_RCDO_ORGEN , b.cdgo_rcdo_orgen)',
'                                       and trunc(a.fcha_rcdo) = nvl( :P121_FCHA_RCDO , trunc(a.fcha_rcdo))',
'                                       and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN',
'                               )   ',
'                    and vlor_cptal <> 0',
'         )',
' group by vgncia '))
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'VLOR_CPTAL'
,p_items_label_column_name=>'VGNCIA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#3F94DB'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(23697084386233525)
,p_chart_id=>wwv_flow_api.id(23696961590233524)
,p_seq=>30
,p_name=>unistr('Inter\00E9s')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select sum(vlor_intres) as vlor_intres',
'       , vgncia',
'       , ''<b>Vigencia:</b> '' || vgncia || ''<br>'' || ',
'         ''<b>Valor:</b> '' || to_char( sum(vlor_intres) , ''FM$999G999G999G999G999G999G990'' ) || ''<br>'' as tooltip ',
'    from (',
'                 select z.vlor_cptal',
'                      , z.vlor_intres                          ',
'                      , z.vgncia',
'                   from v_re_g_recaudos_detalle z',
'                  where exists (',
'                                    select a.id_rcdo        ',
'                                      from re_g_recaudos a',
'                                      join re_g_recaudos_control b',
'                                        on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                                     where a.cdgo_rcdo_estdo  = ''AP''',
'                                       and b.cdgo_clnte       = :F_CDGO_CLNTE',
'                                       and a.id_rcdo          = z.id_rcdo',
'                                       and b.id_impsto        = nvl( :P121_ID_IMPSTO , b.id_impsto )',
'                                       and b.cdgo_rcdo_orgen  = nvl( :P121_CDGO_RCDO_ORGEN , b.cdgo_rcdo_orgen)',
'                                       and trunc(a.fcha_rcdo) = nvl( :P121_FCHA_RCDO , trunc(a.fcha_rcdo))',
'                                       and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN',
'                               )   ',
'                    and vlor_cptal <> 0',
'         )',
'  group by vgncia '))
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'VLOR_INTRES'
,p_items_label_column_name=>'VGNCIA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#FFCF3C'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(23697411947233529)
,p_chart_id=>wwv_flow_api.id(23696961590233524)
,p_seq=>40
,p_name=>'Total'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select sum(vlor_ttal) as vlor_ttal',
'       , vgncia',
'       , ''<b>Vigencia:</b> '' || vgncia || ''<br>'' || ',
'         ''<b>Valor:</b> '' || to_char( sum(vlor_ttal) , ''FM$999G999G999G999G999G999G990'' ) || ''<br>'' as tooltip',
'    from (',
'                select z.vlor_cptal',
'                     , z.vlor_ttal                          ',
'                     , z.vgncia',
'                  from v_re_g_recaudos_detalle z',
'                  where exists (',
'                                    select a.id_rcdo        ',
'                                      from re_g_recaudos a',
'                                      join re_g_recaudos_control b',
'                                        on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                                     where a.cdgo_rcdo_estdo  = ''AP''',
'                                       and b.cdgo_clnte       = :F_CDGO_CLNTE',
'                                       and a.id_rcdo          = z.id_rcdo',
'                                       and b.id_impsto        = nvl( :P121_ID_IMPSTO , b.id_impsto )',
'                                       and b.cdgo_rcdo_orgen  = nvl( :P121_CDGO_RCDO_ORGEN , b.cdgo_rcdo_orgen)',
'                                       and trunc(a.fcha_rcdo) = nvl( :P121_FCHA_RCDO , trunc(a.fcha_rcdo))',
'                                       and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN',
'                                )',
'                    and vlor_cptal <> 0',
'         )',
'group by vgncia   '))
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'VLOR_TTAL'
,p_items_label_column_name=>'VGNCIA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#FF763C'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(23697136468233526)
,p_chart_id=>wwv_flow_api.id(23696961590233524)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Vigencias'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(23697271041233527)
,p_chart_id=>wwv_flow_api.id(23696961590233524)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Recaudos'
,p_format_type=>'currency'
,p_currency=>'COP'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59377168688712665)
,p_plug_name=>'Recaudo Total'
,p_parent_plug_id=>wwv_flow_api.id(24116524901325102)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char( nvl( sum(a.vlor) , 0 ) , ''FM$999G999G999G999G999G999G990'' ) as ttal_rcaudo',
'    , ''Total Recaudo'' as title',
' from re_g_recaudos a',
' join re_g_recaudos_control b',
'   on a.id_rcdo_cntrol  = b.id_rcdo_cntrol',
'where a.cdgo_rcdo_estdo  = ''AP''',
'  and b.cdgo_clnte       = :F_CDGO_CLNTE ',
'  and b.id_impsto        = nvl( :P121_ID_IMPSTO , b.id_impsto )',
'  and b.cdgo_rcdo_orgen  = nvl( :P121_CDGO_RCDO_ORGEN , b.cdgo_rcdo_orgen)',
'  and trunc(a.fcha_rcdo) = nvl( :P121_FCHA_RCDO , trunc(a.fcha_rcdo))',
'  and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P121_FCHA_INCIO,P121_FCHA_FIN'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TTAL_RCAUDO'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25029524746237105)
,p_plug_name=>'Informe de Recaudos'
,p_parent_plug_id=>wwv_flow_api.id(24116422801325101)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25271081366692502)
,p_plug_name=>'Grafica de Recaudos por Bancos'
,p_parent_plug_id=>wwv_flow_api.id(25029524746237105)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(25271174855692503)
,p_region_id=>wwv_flow_api.id(25271081366692502)
,p_chart_type=>'pie'
,p_title=>'Recaudos por Bancos'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'percent'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_title=>'Bancos'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(25271230858692504)
,p_chart_id=>wwv_flow_api.id(25271174855692503)
,p_seq=>10
,p_name=>'Recaudo por Banco'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select b.nmbre_bnco',
'         , sum(a.vlor) as vlor',
'         , ''<b>'' || b.nmbre_bnco  || '':</b> '' || to_char( sum(a.vlor) , ''FM$999G999G999G999G999G999G990'' ) || ''<br>'' as tooltip',
'      from re_g_recaudos a',
'      join v_re_g_recaudos_control b',
'        on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'     where a.cdgo_rcdo_estdo  = ''AP''',
'       and b.cdgo_clnte       = :F_CDGO_CLNTE ',
'       and b.id_impsto        = nvl( :P121_ID_IMPSTO , b.id_impsto )',
'       and b.cdgo_rcdo_orgen  = nvl( :P121_CDGO_RCDO_ORGEN , b.cdgo_rcdo_orgen)',
'       and trunc(a.fcha_rcdo) = nvl( :P121_FCHA_RCDO , trunc(a.fcha_rcdo))',
'       and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN',
'  group by b.nmbre_bnco',
'         , b.id_bnco',
'  order by b.nmbre_bnco'))
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'VLOR'
,p_items_label_column_name=>'NMBRE_BNCO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35182164506762212)
,p_plug_name=>'Informe de Recaudos Detallado'
,p_parent_plug_id=>wwv_flow_api.id(25029524746237105)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_impsto',
'     , b.nmbre_impsto',
'     , b.id_impsto_sbmpsto  ',
'     , b.nmbre_impsto_sbmpsto',
'     , a.id_sjto_impsto',
'     , a.idntfccion_sjto',
'     , a.dscrpcion_sjto_tpo',
'     , a.nmro_dcmnto',
'     , a.fcha_rcdo',
'     , b.dscrpcion_bnco',
'     , b.nmro_cnta',
'     , b.dscrpcion_orgen',
'     , a.vlor',
'  from v_re_g_recaudos a',
'  join v_re_g_recaudos_control b',
'    on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
' where a.cdgo_rcdo_estdo  = ''AP''',
'   and b.cdgo_clnte       = :F_CDGO_CLNTE ',
'   and b.id_impsto        = nvl( :P121_ID_IMPSTO , b.id_impsto )',
'   and b.cdgo_rcdo_orgen  = nvl( :P121_CDGO_RCDO_ORGEN , b.cdgo_rcdo_orgen)',
'   and trunc(a.fcha_rcdo) = nvl( :P121_FCHA_RCDO , trunc(a.fcha_rcdo))',
'   and trunc(a.fcha_rcdo) between :P120_FCHA_INCIO and :P120_FCHA_FIN'))
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
 p_id=>wwv_flow_api.id(35182387856762214)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos que mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>35182387856762214
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35182402935762215)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35182529412762216)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35182679096762217)
,p_db_column_name=>'DSCRPCION_SJTO_TPO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tipo Sujeto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35182753677762218)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35182875432762219)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P121_FCHA_RCDO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35183076637762221)
,p_db_column_name=>'DSCRPCION_BNCO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35183151438762222)
,p_db_column_name=>'NMRO_CNTA'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Cuenta'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35183209951762223)
,p_db_column_name=>'DSCRPCION_ORGEN'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Origen'
,p_column_type=>'STRING'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P121_CDGO_RCDO_ORGEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35183361653762224)
,p_db_column_name=>'VLOR'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35183682397762227)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35183704722762228)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35183888175762229)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35183963346762230)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Sub-Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(35238524369663796)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'352386'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO:DSCRPCION_SJTO_TPO:NMRO_DCMNTO:FCHA_RCDO:DSCRPCION_BNCO:NMRO_CNTA:DSCRPCION_ORGEN:VLOR:'
,p_sum_columns_on_break=>'VLOR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35183493760762225)
,p_name=>'P121_FCHA_RCDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(35183579577762226)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35184102756762232)
,p_name=>'P121_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(35183579577762226)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35184242042762233)
,p_name=>'P121_CDGO_RCDO_ORGEN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(35183579577762226)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
