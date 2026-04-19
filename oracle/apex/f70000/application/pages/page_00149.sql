prompt --application/pages/page_00149
begin
wwv_flow_api.create_page(
 p_id=>149
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Consulta Detalle de Liquidaci\00F3n de Rentas Varias')
,p_step_title=>unistr('Consulta Detalle de Liquidaci\00F3n de Rentas Varias')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251112150728'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84415904949868513)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82625194172749337)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(84415904949868513)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	<br>',
'	<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'	<i>',
unistr('	Esta funcionalidad permite consultar las solicitudes de liquidaci\00F3n de rentas varias y su exenci\00F3n si fue solicitada.<br><br>'),
unistr('		<p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'	</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(106040505061748722)
,p_plug_name=>'Tab Selector'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86480342636177218)
,p_plug_name=>unistr('Recaudo Liquidaci\00F3n de Rentas')
,p_parent_plug_id=>wwv_flow_api.id(106040505061748722)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P149_INDCDOR_RNTA_PGADA'
,p_plug_display_when_cond2=>'S'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86482124022177236)
,p_plug_name=>'<b>Conceptos de Recaudo</b>'
,p_parent_plug_id=>wwv_flow_api.id(86480342636177218)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select case',
'        when cdgo_cncpto_tpo = ''D'' then',
'            ''DESCUENTO DE '' || a.dscrpcion_rlcnal || '' ['' || (a.prcntje_dscnto * 100)|| ''%]''',
'        else',
'            dscrpcion',
'        end as dscrpcion',
'        , sum(a.vlor_dbe) vlor_dbe',
'        , sum(a.vlor_hber) vlor_hber',
'    from v_re_g_documentos_detalle a',
'    where id_dcmnto = :F_ID_DCMNTO',
'    group by a.cdgo_cncpto_tpo',
'        , a.dscrpcion_rlcnal',
'        , a.dscrpcion',
'        , a.prcntje_dscnto',
'    order by a.cdgo_cncpto_tpo;'))
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
 p_id=>wwv_flow_api.id(86482363735177238)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>86482363735177238
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86482454825177239)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86482925477177244)
,p_db_column_name=>'VLOR_DBE'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Valor Debe'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86483078095177245)
,p_db_column_name=>'VLOR_HBER'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Valor Haber'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(86662038788495820)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'866621'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION:VLOR_DBE:VLOR_HBER::APXWS_CC_001'
,p_sum_columns_on_break=>'VLOR_DBE:VLOR_HBER:APXWS_CC_001'
);
wwv_flow_api.create_worksheet_computation(
 p_id=>wwv_flow_api.id(88161570553256542)
,p_report_id=>wwv_flow_api.id(86662038788495820)
,p_db_column_name=>'APXWS_CC_001'
,p_column_identifier=>'C01'
,p_computation_expr=>'D - E'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_column_type=>'NUMBER'
,p_column_label=>'SubTotal'
,p_report_label=>'SubTotal'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89960818029975918)
,p_plug_name=>unistr('Informaci\00F3n Adicional')
,p_parent_plug_id=>wwv_flow_api.id(106040505061748722)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select b.nmbre, ',
'         case ',
'         when   regexp_like(a.vlor, ''^[0-9]+$'')  then',
'            to_char(nvl(a.vlor,0) , ''999G999G999G999G999G990'') ',
'         else',
'            a.vlor',
'         end valor',
'  from gi_g_informacion_metadata a',
'  join df_i_impstos_sbmpsto_mtdta b   on b.id_impsto_sbmpsto_mtdta = a.id_impstos_sbmpsto_mtdta',
'  where a.id_orgen = :P149_ID_RNTA',
'  order by b.orden;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P149_ID_RNTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'  from gi_g_informacion_metadata a  ',
'  where a.id_orgen = :P149_ID_RNTA'))
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
 p_id=>wwv_flow_api.id(89961034869975920)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JLUJAN'
,p_internal_uid=>89961034869975920
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89961113121975921)
,p_db_column_name=>'NMBRE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89961221840975922)
,p_db_column_name=>'VALOR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(116440127362894337)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1164402'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE:VALOR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104296515190321920)
,p_plug_name=>'Contribuyentes'
,p_parent_plug_id=>wwv_flow_api.id(106040505061748722)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ( select dscrpcion_idntfccion_tpo from df_s_identificaciones_tipo t where t.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo) cdgo_idntfccion_tpo, ',
'        b.idntfccion, ',
'        b.prncpal_s_n, ',
'        b.prmer_nmbre||'' ''||b.sgndo_nmbre||'' ''||b.prmer_aplldo||'' ''||b.sgndo_aplldo nombre',
'from    gi_g_rentas                 a ',
'join    si_i_sujetos_responsable    b on a.id_sjto_impsto = b.id_sjto_impsto',
'where   id_rnta         = :P149_ID_RNTA',
'and     indcdor_intrfaz = ''S''',
'order by b.prncpal_s_n desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select  1',
'   from    gi_g_rentas  a',
'   where   id_rnta         = :P149_ID_RNTA',
'   and     indcdor_intrfaz = ''S'''))
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
 p_id=>wwv_flow_api.id(104296626837321921)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>104296626837321921
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104297435593321929)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Tipo de Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104297543899321930)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104297610639321931)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104297755250321932)
,p_db_column_name=>'NOMBRE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre Contribuyente'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(107376356741332520)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1073764'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_IDNTFCCION_TPO:IDNTFCCION:PRNCPAL_S_N:NOMBRE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(106039942056748716)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(106040505061748722)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_rnta_adjnto',
'        , id_sbmpto_adjnto_tpo',
'        , (select dscrpcion',
'             from table (pkg_gi_rentas.fnc_tipos_adjunto (p_cdgo_clnte              => :F_CDGO_CLNTE,',
'                                                          p_id_impsto               => :P149_ID_IMPSTO,',
'                                                          p_id_impsto_sbmpsto       => :P149_ID_IMPSTO_SBMPSTO,',
'                                                          p_id_impsto_acto          => :P149_ID_IMPSTO_ACTO,',
'                                                          p_id_impsto_acto_slccndo  => :P149_ACTOS_SLCCNDOS ))',
'            where id_adjnto_tpo = id_sbmpto_adjnto_tpo ) dscrpcion ',
'        , file_name',
'        , obsrvcion',
'        , 1 descargar',
'        , 2 ver',
'     from gi_g_rentas_adjnto     a',
'    where id_rnta                = :P149_ID_RNTA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from gi_g_rentas_adjnto     a',
'    where id_rnta                = :P149_ID_RNTA'))
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
 p_id=>wwv_flow_api.id(106040039725748717)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>106040039725748717
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78808514176125796)
,p_db_column_name=>'ID_RNTA_ADJNTO'
,p_display_order=>10
,p_column_identifier=>'D'
,p_column_label=>'Id Rnta Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(84651511040004702)
,p_db_column_name=>'ID_SBMPTO_ADJNTO_TPO'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78808986893125796)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78809353859125797)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86379702482043107)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>50
,p_column_identifier=>'J'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:GI_G_RENTAS_ADJNTO:FILE_BLOB:ID_RNTA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class=" fa fa-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86380195784043111)
,p_db_column_name=>'VER'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>'Ver'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:GI_G_RENTAS_ADJNTO,ID_RNTA_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,#ID_RNTA_ADJNTO#'
,p_column_linktext=>'<center><span class=" fa fa-eye fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96755477737114802)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>70
,p_column_identifier=>'N'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(106066686737278771)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'788097'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SBMPTO_ADJNTO_TPO:FILE_NAME:OBSRVCION:DESCARGAR:DSCRPCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(106040676966748723)
,p_plug_name=>'Conceptos'
,p_region_name=>'conceptos'
,p_parent_plug_id=>wwv_flow_api.id(106040505061748722)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  b.nmbre_impsto_acto nmbre_impsto_acto',
'        , ''['' || d.cdgo_cncpto || ''] '' || d.dscrpcion_cncpto dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres',
'        , a.vlor_lqddo + a.vlor_intres vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.txto_trfa',
'        , a.id_impsto_acto_cncpto',
'        , a.prcntje_bse_lqdcion||''%'' prcntje_bse_lqdcion',
'        , a.bse_cncpto',
'        , a.fctor',
'     from gi_g_rentas_acto_concepto         a',
'     join v_gi_g_rentas_acto                b on a.id_rnta_acto     = b.id_rnta_acto',
'     join gi_g_rentas                       c on b.id_rnta          = c.id_rnta',
'     join v_df_i_impuestos_acto_concepto    d on a.id_impsto_acto_cncpto    = d.id_impsto_acto_cncpto',
'    where c.id_rnta                         = :P149_ID_RNTA;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5069104158697139)
,p_name=>'NMBRE_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Impuesto Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>250
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
 p_id=>wwv_flow_api.id(11021912478370612)
,p_name=>'FCTOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCTOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Factor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(89254619770381716)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(100844087649392687)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor<br> Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(106041067865748727)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>108
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(106041199768748729)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(106041435839748731)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br>Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(106041545938748732)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de<br> Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'SQL_EXPRESSION'
,p_display_condition=>':DIAS_MORA > 0'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106041767701748734)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(163687161191149515)
,p_name=>'PRCNTJE_BSE_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCNTJE_BSE_LQDCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('% Base<br> Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>41
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
 p_id=>wwv_flow_api.id(163687271882149516)
,p_name=>'BSE_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Base Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(106040894836748725)
,p_internal_uid=>106040894836748725
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
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
 p_id=>wwv_flow_api.id(106081020516364092)
,p_interactive_grid_id=>wwv_flow_api.id(106040894836748725)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(106081168868364092)
,p_report_id=>wwv_flow_api.id(106081020516364092)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1110562008312)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(163687271882149516)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1175619010540)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(11021912478370612)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2774180004839)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(5069104158697139)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>307
,p_sort_order=>1
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6926837925951814)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(163687161191149515)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89277612177735250)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(89254619770381716)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(100953631683420010)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(100844087649392687)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106082109996364106)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(106041067865748727)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>400
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106083165805364110)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(106041199768748729)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106084182193364113)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(106041435839748731)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106084653921364115)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(106041545938748732)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106085682156364118)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(106041767701748734)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(78801298289125713)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(106041435839748731)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(78801397452126305)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(106041199768748729)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(78801414802126619)
,p_view_id=>wwv_flow_api.id(106081168868364092)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(100844087649392687)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(155875303660418709)
,p_plug_name=>'Otras Liquidaciones'
,p_parent_plug_id=>wwv_flow_api.id(106040505061748722)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1 ver',
'       , a.id_rnta',
'       , a.nmro_rnta   ',
'        , a.id_lqdcion',
'        , trunc(a.fcha_rgstro) fcha_rgstro',
'        , a.dscrpcion_ascda || '': '' || a.txto_ascda ascda',
'        , a.vlor_bse_grvble',
'        , a.fcha_expdcion',
'        , case ',
'            when a.id_rnta_antrior is not null then',
unistr('                ''S\00ED'''),
'            else',
'                ''No''',
'            end as indcdor_lqdcion_antrior',
'        , b.vlor_ttal',
unistr('        , decode(a.indcdor_rnta_pgda, ''S'',''S\00ED'',''N'',''No'') indcdor_rnta_pgda'),
'     from v_gi_g_rentas                 a',
'     join ( select a.id_rnta',
'                 , sum(d.vlor_dbe - d.vlor_hber) vlor_ttal',
'              from v_gi_g_rentas                 a',
'              join gi_g_liquidaciones            b on a.id_lqdcion       = b.id_lqdcion',
'              join gf_g_movimientos_financiero   c on b.id_lqdcion       = c.id_orgen',
'               and c.cdgo_mvnt_fncro_estdo      = ''NO''',
'              join gf_g_movimientos_detalle      d on c.id_mvmnto_fncro  = d.id_mvmnto_fncro',
'               and d.cdgo_mvmnto_tpo             not in (''PC'', ''PI'')',
'          group by a.id_rnta  )         b on a.id_rnta     = b.id_rnta',
'    where (a.id_rnta_antrior = :P149_ID_RNTA',
'            or  (a.id_rnta                      = :P149_ID_RNTA_ANTRIOR    ',
'                   or a.id_rnta_antrior         = :P149_ID_RNTA_ANTRIOR))',
'        and a.cdgo_rnta_estdo       in (''APB'', ''LQD'')',
'       and a.id_rnta                != :P149_ID_RNTA',
' order by a.id_lqdcion'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from  gi_g_rentas                 a',
'    where (a.id_rnta_antrior = :P149_ID_RNTA',
'            or  (a.id_rnta                      = :P149_ID_RNTA_ANTRIOR    ',
'                   or a.id_rnta_antrior         = :P149_ID_RNTA_ANTRIOR))',
'         and a.cdgo_rnta_estdo       in (''APB'', ''LQD'')'))
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
 p_id=>wwv_flow_api.id(155875400287418710)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>155875400287418710
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78804375444125750)
,p_db_column_name=>'ID_LQDCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Liquidaci\00F3n')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78804767873125767)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78805031850125767)
,p_db_column_name=>'ASCDA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Asociada'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78805401937125768)
,p_db_column_name=>'VLOR_BSE_GRVBLE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Base Gravable'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78805808752125768)
,p_db_column_name=>'FCHA_EXPDCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Fecha de Expedici\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78806295704125768)
,p_db_column_name=>'INDCDOR_LQDCION_ANTRIOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00BFLiquidaci\00F3n Adicional?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78806677434125769)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Liquidado'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78807031134125769)
,p_db_column_name=>'VER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Ver'
,p_column_link=>'f?p=140000:4:&SESSION.::&DEBUG.:RP,4:P4_ID_LQDCION:#ID_LQDCION#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-eye" style="color: blue;" ></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(105722722027279246)
,p_db_column_name=>'ID_RNTA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Id Rnta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(105722870022279247)
,p_db_column_name=>'NMRO_RNTA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('N\00B0 Liquidaci\00F3n')
,p_column_link=>'f?p=&APP_ID.:149:&SESSION.::&DEBUG.:RP,149:P149_ID_RNTA:#ID_RNTA#'
,p_column_linktext=>'#NMRO_RNTA#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8211311156511707)
,p_db_column_name=>'INDCDOR_RNTA_PGDA'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('\00BFLiquidaci\00F3n Pagada?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(156818285622827838)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'788074'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VER:NMRO_RNTA:FCHA_RGSTRO:ASCDA:VLOR_BSE_GRVBLE:FCHA_EXPDCION:INDCDOR_LQDCION_ANTRIOR:VLOR_TTAL:ID_RNTA::INDCDOR_RNTA_PGDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(160773921743369179)
,p_plug_name=>'Exenciones'
,p_parent_plug_id=>wwv_flow_api.id(106040505061748722)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P149_INDCDOR_EXNCION'
,p_plug_display_when_cond2=>'S'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79883470200484518)
,p_plug_name=>'<b>Motivos</b>'
,p_parent_plug_id=>wwv_flow_api.id(160773921743369179)
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'V_GF_G_EXENCIONES_SLCTUD_MTVO'
,p_query_where=>'ID_EXNCION_SLCTUD = :P149_ID_EXNCION_SLCTUD'
,p_query_order_by=>'MTVO'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P149_ID_EXNCION_SLCTUD'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P149_CDGO_EXNCION_ESTDO'
,p_plug_display_when_cond2=>'APB'
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
 p_id=>wwv_flow_api.id(79883652277484520)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>79883652277484520
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79883755083484521)
,p_db_column_name=>'ID_EXNCION_SLCTUD_MTVO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Exncion Slctud Mtvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79883815717484522)
,p_db_column_name=>'ID_EXNCION_SLCTUD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Exncion Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79883921178484523)
,p_db_column_name=>'ID_EXNCION_MTVO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Exncion Mtvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79884658617484530)
,p_db_column_name=>'NMTCNCO_MTVO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79884746857484531)
,p_db_column_name=>'MTVO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Motivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79884837979484532)
,p_db_column_name=>'ID_DCRTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Dcrto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79884911219484533)
,p_db_column_name=>'NMRO_DCRTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Nmro Dcrto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79885056648484534)
,p_db_column_name=>'DSCRPCION_DCRTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Decreto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79885176559484535)
,p_db_column_name=>'NMTCNCO_DCRTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Exenci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(81424620189437232)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'814247'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_EXNCION_SLCTUD_MTVO:ID_EXNCION_SLCTUD:ID_EXNCION_MTVO:NMTCNCO_MTVO:MTVO:ID_DCRTO:NMRO_DCRTO:DSCRPCION_DCRTO:NMTCNCO_DCRTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79883580320484519)
,p_plug_name=>'<b>Conceptos</b>'
,p_parent_plug_id=>wwv_flow_api.id(160773921743369179)
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion_cncpto ',
'        , a.vlor_cncpto',
'        , a.prcntje_exncion',
'        , a.vlor_exnto',
'        , a.vlor_cncpto - a.vlor_exnto vlor_ttal',
'     from v_gf_g_exncnes_slctud_dtlle   a',
'    where id_exncion_slctud             = :P149_ID_EXNCION_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P149_ID_EXNCION_SLCTUD'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P149_CDGO_EXNCION_ESTDO'
,p_plug_display_when_cond2=>'APB'
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
 p_id=>wwv_flow_api.id(79885284088484536)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>79885284088484536
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79885317376484537)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79885468931484538)
,p_db_column_name=>'VLOR_CNCPTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Valor concepto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79885544855484539)
,p_db_column_name=>'PRCNTJE_EXNCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('% Exenci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79885632688484540)
,p_db_column_name=>'VLOR_EXNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor Exento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79885710632484541)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor a Pagar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(81579000457474672)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'815791'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_CNCPTO:VLOR_CNCPTO:PRCNTJE_EXNCION:VLOR_EXNTO:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173091365668346912)
,p_plug_name=>'Trazabilidad'
,p_parent_plug_id=>wwv_flow_api.id(106040505061748722)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select to_char(a.fcha, ''DD/MM/YYYY HH:MI AM'') fcha',
'        , a.nmbre_trcro',
'        , a.estdo',
'        , a.obsrvcion',
'     from v_gi_g_rentas_solicitud_traza    a',
'    where a.id_rnta                         = :P149_ID_RNTA',
' order by a.fcha'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P149_ID_RNTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from v_gi_g_rentas_solicitud_traza    a',
'    where id_rnta                          = :P149_ID_RNTA;'))
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
 p_id=>wwv_flow_api.id(173091440122346913)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>173091440122346913
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86612646000169719)
,p_db_column_name=>'FCHA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Fecha'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86613069984169722)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86613437095169722)
,p_db_column_name=>'ESTDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Estados'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86613865887169723)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(173171456649220698)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'866142'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FCHA:NMBRE_TRCRO:ESTDO:OBSRVCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179933812663124792)
,p_plug_name=>unistr('<b>Liquidaci\00F3n N\00B0 &P149_NMRO_RNTA. [ &P149_DSCRPCION_RNTA_ESTDO. ]</b>')
,p_region_name=>'informacion_basica'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(78802146957125707)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(84415904949868513)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&P149_APP_ID.:&P149_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79885815259484542)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(84415904949868513)
,p_button_name=>'BTN_IMPRIMIR_RECIBO_EXENCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Imprimir Recibo Exenci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    :P149_INDCDOR_EXNCION        = ''S'' ',
'and :P149_CDGO_EXNCION_ESTDO     = ''APB''',
'and :P149_INDCDOR_PAGO_APLCDO    = ''N'''))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(78802973002125707)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(84415904949868513)
,p_button_name=>'BTN_IMPRIMIR_RECIBO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Imprimir Liquidaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    :P149_CDGO_RNTA_ESTDO in (''APB'', ''LQD'')   ',
'    and :P149_INDCDOR_RNTA_PGADA = ''N'' and :P149_NMRO_DCMNTO is not null',
'and (    (:P149_INDCDOR_EXNCION       = ''S'' ',
'      and :P149_CDGO_EXNCION_ESTDO    = ''APB'' ',
'     ',
'         ) ',
' or :P149_INDCDOR_EXNCION = ''N'' )'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107033982234474815)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(84415904949868513)
,p_button_name=>'BTN_IMPRIMIR_BONO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Imprimir Bono'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     :P149_CDGO_RNTA_ESTDO in (''APB'', ''LQD'')  and :P149_INDCDOR_RNTA_PGADA   = ''S''',
'and (    (:P149_INDCDOR_EXNCION       = ''S'' ',
'      and :P149_CDGO_EXNCION_ESTDO    = ''APB'' ',
'      ',
'         ) ',
' or :P149_INDCDOR_EXNCION = ''N'' )',
' and :P149_INDCDOR_GNRA_BNO_CJA = ''N'''))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4256862740589346)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(84415904949868513)
,p_button_name=>'BTN_IMPRIMIR_BONO_CAJA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Imprimir Bono '
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    :P149_CDGO_RNTA_ESTDO in (''APB'', ''LQD'')  and :P149_INDCDOR_RNTA_PGADA   = ''S''',
'and (    (:P149_INDCDOR_EXNCION       = ''S'' ',
'      and :P149_CDGO_EXNCION_ESTDO    = ''APB'' ',
'      ',
'         ) ',
' or :P149_INDCDOR_EXNCION = ''N'' )',
' and :P149_INDCDOR_GNRA_BNO_CJA = ''S'''))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(83210835772346809)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(84415904949868513)
,p_button_name=>'BTN_IMPRIMIR_CERTIFICADO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Imprimir Certificado Exenci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84231141034878803)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(84415904949868513)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Ver Certificado de Exenci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR:V_GN_G_ACTOS,ID_ACTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,&P149_ID_ACTO.'
,p_button_condition=>'P149_INDCDOR_PAGO_APLCDO'
,p_button_condition2=>'S'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89000646786837901)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(84415904949868513)
,p_button_name=>'BTN_CAMBIAR_FECHA_VNCMTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cambiar Fecha <br> de Vencimiento'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        :P149_CDGO_RNTA_ESTDO    in (''APB'',''LQD'')',
'     and :P149_INDCDOR_RNTA_PGADA  = ''N''',
'      and to_date(:P149_MAX_FCHA_VNCMNTO,''dd/mm/yyyy'') < to_date(sysdate,''dd/mm/yyyy'')',
'     and :P149_INDCDOR_INTRFAZ is null',
'     and :P149_ID_RCDO is null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(78825014115125925)
,p_branch_name=>'Imprimir Documento'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_PRMTRO_1,P2_NMBRE_RPRTE,P2_PRMTRO_2:&P149_ID_RPRTE.,&P149_ID_RNTA.,LIQUIDACIÃ“N_&P149_NMRO_RNTA.,&F_ID_DCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(78802973002125707)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(107034082848474816)
,p_branch_name=>'Imprimir Bono'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_PRMTRO_1,P2_NMBRE_RPRTE,P2_PRMTRO_2:&P149_ID_RPRTE.,&P149_ID_RNTA.,LIQUIDACIÃ“N_&P149_NMRO_RNTA.,&P149_ID_DCMNTO_RCDO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(107033982234474815)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(105722671718279245)
,p_branch_name=>'Imprimir Documento Bono Caja'
,p_branch_action=>'f?p=66000:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE,P37_NMBRE_RPRTE,P37_JSON:&P149_ID_RPRTE_BONO.,BONO_DE_LIQUIDACIÃ“N_&P149_NMRO_RNTA.,&P149_ID_DCMNTO_RCDO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4256862740589346)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(82220374083111901)
,p_branch_name=>unistr('Imprimir Documento Exenci\00F3n')
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_PRMTRO_1,P2_NMBRE_RPRTE,P2_PRMTRO_2:&P149_ID_RPRTE.,&P149_ID_RNTA.,Liquidacion_&P149_NMRO_DCMNTO_EXNCION.,&P149_ID_DCMNTO_EXNCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(79885815259484542)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(83749665584256205)
,p_branch_name=>unistr('Imprimir Certificado Exenci\00F3n')
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_PRMTRO_1,P2_NMBRE_RPRTE,P2_PRMTRO_2:&P149_ID_RPRTE.,&P149_ID_RPRTE_CRTFCDO.,Liquidacion_&P149_NMRO_DCMNTO_EXNCION..,&P149_ID_DCMNTO_EXNCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(83210835772346809)
,p_branch_sequence=>50
);
end;
/
begin
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(89000739301837902)
,p_branch_name=>'Ir a la pagina de cambio de Fecha vencimiento'
,p_branch_action=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:RP:P151_ID_RNTA,P151_FCHA_VNCMNTO_DCMNTO:&P149_ID_RNTA.,&P149_FCHA_VNCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(89000646786837901)
,p_branch_sequence=>40
,p_branch_condition_type=>'SQL_EXPRESSION'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    :P149_CDGO_RNTA_ESTDO     in (''APB'',''LQD'')',
'and :P149_INDCDOR_RNTA_PGADA  = ''N'''))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4032456122646103)
,p_name=>'P149_TXTO_SSCRPCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4032812253646107)
,p_name=>'P149_MAX_FCHA_VNCMNTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'Fecha de Vencimiento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4253478956589312)
,p_name=>'P149_ID_RPRTE_CRTFCDO'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4256923793589347)
,p_name=>'P149_INDCDOR_RNTA_PGADA'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('\00BFLiquidaci\00F3n Pagada?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5068050382697128)
,p_name=>'P149_VLOR_AUX_LQDCION_F'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'&P149_LBEL_VLOR_AUX_LQDCION.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P149_VLOR_AUX_LQDCION_F'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5068839752697136)
,p_name=>'P149_LBEL_VLOR_AUX_LQDCION'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5068997739697137)
,p_name=>'P149_VLOR_AUX_LQDCION'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5682958920312801)
,p_name=>'P149_NMBRE_ENTDAD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'Entidad Contratante'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8611049456591317)
,p_name=>'P149_BRANCH'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10251530748341525)
,p_name=>'P149_APP_ID'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11023801197370631)
,p_name=>'P149_ACTOS_SLCCNDOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(106039942056748716)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11889430903635208)
,p_name=>'P149_ID_SJTO_SCRSAL'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'Sucursal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'   select a.nmbre ',
'        , a.id_sjto_scrsal',
'     from si_i_sujetos_sucursal           a '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_display_when=>'P149_ID_SJTO_SCRSAL'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78813789974125838)
,p_name=>'P149_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78814191318125840)
,p_name=>'P149_NMBRE_RZON_SCIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('Nombre / Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78814548613125840)
,p_name=>'P149_UBCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('Ubicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78814970522125840)
,p_name=>'P149_DRCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78815375731125841)
,p_name=>'P149_CDGO_SJTO_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78815759916125854)
,p_name=>'P149_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_impsto_sbmpsto          d ',
'        , id_impsto_sbmpsto             r       ',
'     from df_i_impuestos_subimpuesto    a',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
' order by nmbre_impsto_sbmpsto'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78816172044125854)
,p_name=>'P149_ID_IMPSTO_ACTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78816578417125860)
,p_name=>'P149_TXTO_ASCDA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'Asociada'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>9
,p_display_when=>'P149_TXTO_ASCDA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78816989765125860)
,p_name=>'P149_FCHA_EXPDCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'&P149_TXTO_SSCRPCION.'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>2
,p_display_when=>'P149_INDCDOR_INTRFAZ'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78817393030125861)
,p_name=>'P149_BSE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'&P149_TXTO_BSE.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78817719685125877)
,p_name=>'P149_FCHA_VNCMNTO'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P149_FCHA_VNCMNTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78818195414125877)
,p_name=>'P149_INDCDOR_EXTRNJRO'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('\00BFExtranjero?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P149_INDCDOR_EXTRNJRO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78818541729125878)
,p_name=>'P149_INDCDOR_MXTO'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('\00BFMixto?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P149_INDCDOR_MXTO'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78818919876125878)
,p_name=>'P149_INDCDOR_CNTRTO_GSLNA'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('\00BFContrato de Combustible?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P149_INDCDOR_CNTRTO_GSLNA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78819391888125878)
,p_name=>'P149_INDCDOR_LQDCCION_ADCNAL'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('\00BFLiquidaci\00F3n Adicional?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78819781184125878)
,p_name=>'P149_NMRO_LQDCION_ANTRIOR'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('N\00B0 Liquidaciones Anteriores')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P149_INDCDOR_LQDCCION_ADCNAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78820150349125895)
,p_name=>'P149_TTAL_LQDCION_ANTRIOR'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'Total Liquidaciones Anteriores'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P149_INDCDOR_LQDCCION_ADCNAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78820532162125895)
,p_name=>'P149_NVA_BSE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'Nueva Base Gravable'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P149_INDCDOR_LQDCCION_ADCNAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78820909242125895)
,p_name=>'P149_CDGO_RNTA_ESTDO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dscrpcion',
'        , a.cdgo_rnta_estdo',
'     from gi_d_rentas_estado a',
'  '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78821348339125897)
,p_name=>'P149_ID_RPRTE'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78821763049125897)
,p_name=>'P149_RSPSTA'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78822145094125908)
,p_name=>'P149_ID_RNTA'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78822586632125909)
,p_name=>'P149_ID_LQDCION'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78822923381125909)
,p_name=>'P149_ID_DCMNTO'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78823303253125909)
,p_name=>'P149_NMRO_DCMNTO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('N\00FAmero Documento')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78823760833125910)
,p_name=>'P149_ID_RNTA_ANTRIOR'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79560441444385513)
,p_name=>'P149_NMRO_RNTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_source=>'P149_NMRO_RNTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79562051324385529)
,p_name=>'P149_INDCDOR_EXNCION'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('\00BFSolicit\00F3 Exenci\00F3n?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P149_INDCDOR_EXNCION'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79883378664484517)
,p_name=>'P149_TXTO_BSE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79886067444484544)
,p_name=>'P149_NMRO_DCMNTO_EXNCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_prompt=>unistr('N\00B0 Documento de Pago de Exenci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P149_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79886155056484545)
,p_name=>'P149_INDCDOR_PAGO_APLCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_prompt=>unistr('\00BFDocumento Exenci\00F3n pagado?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P149_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79886624127484550)
,p_name=>'P149_ID_DCMNTO_EXNCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81211550195983653)
,p_name=>'P149_ID_EXNCION_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_prompt=>unistr('N\00B0 de solicitud de exenci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81211919634983655)
,p_name=>'P149_FCHA_RGSTRO_EXNCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_prompt=>'Fecha de registro'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81212300022983655)
,p_name=>'P149_USRIO_RGSTRA_EXNCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_prompt=>'Usuario que registra'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81212774185983656)
,p_name=>'P149_CDGO_EXNCION_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_prompt=>unistr('Estado Exenci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_EXENCIONES_ESTADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_exncion_estdo as r',
'  from gf_d_exenciones_estado',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81213110765983656)
,p_name=>'P149_ID_USRIO_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_prompt=>'Usuario respuesta'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P149_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81213584299983657)
,p_name=>'P149_FCHA_RSPSTA_EXNCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_prompt=>'Fecha de respuesta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P149_CDGO_EXNCION_ESTDO'
,p_display_when2=>'APB'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81213950977983667)
,p_name=>'P149_OBSRVCION_RCHZO_EXNCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_prompt=>unistr('Observaci\00F3n del rechazo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P149_CDGO_EXNCION_ESTDO'
,p_display_when2=>'RCH'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84231279834878804)
,p_name=>'P149_ID_ACTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(160773921743369179)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84384754490611801)
,p_name=>'P149_DSCRPCION_RNTA_ESTDO'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86480643324177221)
,p_name=>'P149_FCHA_RCDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(86480342636177218)
,p_prompt=>'Fecha de Recaudo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86480735284177222)
,p_name=>'P149_FCHA_APLCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(86480342636177218)
,p_prompt=>unistr('Fecha de Aplicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>19
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86480866397177223)
,p_name=>'P149_VLOR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(86480342636177218)
,p_prompt=>'Valor Pagado'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86480954726177224)
,p_name=>'P149_DSCRPCION_FRMA_PGO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(86480342636177218)
,p_prompt=>'Forma de pago'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>13
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86481046288177225)
,p_name=>'P149_ID_USRIO_APLCO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(86480342636177218)
,p_prompt=>'Usuario Aplico Recaudo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86481176086177226)
,p_name=>'P149_DSCRPCION_RCDO_ORGEN_CNTROL'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(86480342636177218)
,p_prompt=>'Origen Recaudo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89004120831837936)
,p_name=>'P149_ID_SJTO_IMPSTO'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89004429924837939)
,p_name=>'P149_ID_IMPSTO'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89255698332381726)
,p_name=>'P149_VLOR_BSE'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_format_mask=>'99G999G999G999G990D0000'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102856120011131207)
,p_name=>'P149_VLOR_CNTRTO_ESE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>'Valor Contrato ESE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>3
,p_display_when=>'P149_INDCDOR_CNTRTO_ESE'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102856240936131208)
,p_name=>'P149_INDCDOR_CNTRTO_ESE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_prompt=>unistr('\00BFContrato de ESE?')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P149_INDCDOR_CNTRTO_ESE'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104297948447321934)
,p_name=>'P149_INDCDOR_INTRFAZ'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105722428111279243)
,p_name=>'P149_ID_RPRTE_BONO'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106796719143926014)
,p_name=>'P149_ID_DCMNTO_RCDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(86480342636177218)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107033590618474811)
,p_name=>'P149_ID_RCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(86480342636177218)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107033805140474814)
,p_name=>'P149_INDCDOR_GNRA_BNO_CJA'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(179933812663124792)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4032391078646102)
,p_computation_sequence=>10
,p_computation_item=>'P149_TXTO_SSCRPCION'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select decode(:P149_INDCDOR_INTRFAZ,''S'',null, ''Fecha de Suscripci\00F3n'')'),
'from dual',
';'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77078560331293050)
,p_validation_name=>'Validar reporte no nulo'
,p_validation_sequence=>10
,p_validation=>'P149_ID_RPRTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'No se encontro reporte parametrizado para generar el recibo de pago, por favor consulte con el ing de soporte'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(78802973002125707)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78824568057125922)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Renta')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select a.idntfccion_sjto_frmtda',
'        , a.nmro_rnta',
'        , upper(b.nmbre_pais || '' '' || b.nmbre_dprtmnto || '' '' || b.nmbre_mncpio) ubccion',
'        , a.id_sjto_impsto',
'        , b.drccion',
'        , c.nmbre_rzon_scial',
'        , a.id_impsto',
'        , a.id_impsto_sbmpsto',
'        --, d.id_impsto_acto',
'        , decode(dscrpcion_ascda,null,'''',initcap(dscrpcion_ascda)  || '': '' || a.txto_ascda)',
'        , a.fcha_expdcion',
'        , trunc(a.fcha_vncmnto)',
'        , (select txto_bse_grvble',
'             from df_i_impuestos_acto m ',
'             join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'            where n.id_rnta           = a.id_rnta',
'            and rownum = 1) txto_bse_grvble',
'        , to_char(a.vlor_bse_grvble, :F_FRMTO_MNDA) vlor_bse_grvble',
'        , a.vlor_bse_grvble   vlor_bse ',
'        , a.indcdor_usa_extrnjro',
'        , a.indcdor_usa_mxto',
'        , case ',
'            when a.id_rnta_antrior is not null then ',
'                ''S''',
'            else ',
'                ''N''',
'          end as indcdor_lqdcion_adcnal',
'        , a.id_rnta_antrior',
'        , a.indcdor_cntrto_gslna',
'        , a.cdgo_rnta_estdo',
'        , a.dscrpcion_rnta_estdo',
'        , a.id_dcmnto',
'        , a.nmro_dcmnto',
'        , a.indcdor_exncion',
'        , a.cdgo_exncion_estdo',
'        , a.id_exncion_slctud       ',
'		, a.usrio_rgstra_exncion		       ',
'		, a.fcha_rgstro_exncion			       ',
'		, a.id_usrio_rspsta       ',
'		, a.fcha_rspsta_exncion			       ',
'		, a.obsrvcion_rchzo_exncion',
'        , a.indcdor_rnta_pgda',
'        , a.id_lqdcion',
'       	, a.indcdor_cntrto_ese',
'        , to_char(a.vlor_cntrto_ese, :F_FRMTO_MNDA) vlor_cntrto_ese',
'        , a.indcdor_intrfaz',
'        , a.idntfccion_entdad ||'' - ''|| a.nmbre_entdad',
'        , a.id_sjto_scrsal ',
'        , to_char(a.vlor_aux_lqdcion, :F_FRMTO_MNDA) vlor_aux_lqdcion_f',
'        , a.vlor_aux_lqdcion vlor_aux_lqdcion',
'        , (select lbel_vlor_aux_lqdcion',
'          from gi_d_rntas_cnfgrcion_sbmpst',
'          where id_impsto_sbmpsto = a.id_impsto_sbmpsto) lbel_vlor_aux_lqdcion',
'     into :P149_IDNTFCCION_SJTO_FRMTDA',
'        , :P149_NMRO_RNTA',
'        , :P149_UBCCION',
'        , :P149_ID_SJTO_IMPSTO',
'        , :P149_DRCCION',
'        , :P149_NMBRE_RZON_SCIAL',
'        , :P149_ID_IMPSTO',
'        , :P149_ID_IMPSTO_SBMPSTO',
'        --, :P149_ID_IMPSTO_ACTO',
'        , :P149_TXTO_ASCDA',
'        , :P149_FCHA_EXPDCION',
'        , :P149_FCHA_VNCMNTO',
'        , :P149_TXTO_BSE',
'        , :P149_BSE',
'        , :P149_VLOR_BSE',
'        , :P149_INDCDOR_EXTRNJRO',
'        , :P149_INDCDOR_MXTO',
'        , :P149_INDCDOR_LQDCCION_ADCNAL',
'        , :P149_ID_RNTA_ANTRIOR',
'        , :P149_INDCDOR_CNTRTO_GSLNA',
'        , :P149_CDGO_RNTA_ESTDO',
'        , :P149_DSCRPCION_RNTA_ESTDO',
'        , :F_ID_DCMNTO',
'        , :P149_NMRO_DCMNTO',
'        , :P149_INDCDOR_EXNCION',
'        , :P149_CDGO_EXNCION_ESTDO',
'		, :P149_ID_EXNCION_SLCTUD   ',
'		, :P149_USRIO_RGSTRA_EXNCION		',
'		, :P149_FCHA_RGSTRO_EXNCION			',
'		, :P149_ID_USRIO_RSPSTA     ',
'		, :P149_FCHA_RSPSTA_EXNCION			',
'		, :P149_OBSRVCION_RCHZO_EXNCION				',
'		, :P149_INDCDOR_RNTA_PGADA	',
'        , :P149_ID_LQDCION		',
'        , :P149_INDCDOR_CNTRTO_ESE',
'        , :P149_VLOR_CNTRTO_ESE ',
'        , :P149_INDCDOR_INTRFAZ',
'        , :P149_NMBRE_ENTDAD',
'        , :P149_ID_SJTO_SCRSAL',
'        , :P149_VLOR_AUX_LQDCION_F',
'        , :P149_VLOR_AUX_LQDCION',
'        , :P149_LBEL_VLOR_AUX_LQDCION',
'    from v_gi_g_rentas     a',
'     join v_si_i_sujetos_impuesto    b on a.id_sjto_impsto  = b.id_sjto_impsto',
'     join si_i_personas              c on b.id_sjto_impsto  = c.id_sjto_impsto',
'     -- join gi_g_rentas_acto           d on a.id_rnta         = d.id_rnta',
'    where a.id_rnta                  = :P149_ID_RNTA;',
'',
'exception',
'    when others then',
'        :P149_IDNTFCCION_SJTO_FRMTDA    := null;',
'        :P149_NMRO_RNTA                 := null;',
'        :P149_UBCCION                   := null;',
'        :P149_ID_IMPSTO                 := null;',
'        :P149_ID_SJTO_IMPSTO            := null;',
'        :P149_DRCCION                   := null;',
'        :P149_CDGO_SJTO_TPO             := null;',
'        :P149_ID_IMPSTO_SBMPSTO         := null;',
'        --:P149_ID_IMPSTO_ACTO            := null;',
'        :P149_ID_SBMPSTO_ASCDA          := null;',
'        :P149_TXTO_ASCDA                := null;',
'        :P149_FCHA_EXPDCION             := null;',
'        :P149_FCHA_VNCMNTO              := null;',
'        :P149_BSE                       := null;',
'        :P149_VLOR_BSE                  := null;',
'        :P149_INDCDOR_EXTRNJRO          := null;',
'        :P149_INDCDOR_MXTO              := null;',
'        :P149_INDCDOR_LQDCCION_ADCNAL   := null;',
'        :P149_ID_RNTA_ANTRIOR           := null;',
'        :P149_INDCDOR_CNTRTO_GSLNA      := null;    ',
'        :P149_INDCDOR_EXNCION           := null;   ',
'        :P149_CDGO_EXNCION_ESTDO		:= null;',
'		:P149_ID_EXNCION_SLCTUD         := null;',
'		:P149_USRIO_RGSTRA_EXNCION		:= null;',
'		:P149_FCHA_RGSTRO_EXNCION		:= null;',
'		:P149_ID_USRIO_RSPSTA           := null;',
'		:P149_FCHA_RSPSTA_EXNCION		:= null;',
'		:P149_OBSRVCION_RCHZO_EXNCION	:= null;  ',
'        :P149_ID_LQDCION	            := null;  ',
' 		:P149_VLOR_CNTRTO_ESE		    := null;',
'		:P149_INDCDOR_CNTRTO_ESE        := null;',
'        :P149_INDCDOR_RNTA_PGADA	    := null; ',
'        :P149_INDCDOR_INTRFAZ           := null; ',
'        :P149_ID_SJTO_SCRSAL            := null;',
'        :P149_VLOR_AUX_LQDCION          := null; ',
'        :P149_LBEL_VLOR_AUX_LQDCION     := null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79885922400484543)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informacion de Exenci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_dcmnto',
'        , a.nmro_dcmnto',
'        , a.indcdor_pgo_aplcdo',
'        , a.id_acto',
'     into :P149_ID_DCMNTO_EXNCION',
'        , :P149_NMRO_DCMNTO_EXNCION',
'        , :P149_INDCDOR_PAGO_APLCDO',
'        , :P149_ID_ACTO',
'     from v_gf_g_exenciones_solicitud    a',
'    where a.id_exncion_slctud            = :P149_ID_EXNCION_SLCTUD;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P149_ID_EXNCION_SLCTUD'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79024002643411390)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta de Informaci\00F3n de liquidaciones anteriores')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select nvl(count(id_rnta),0) ',
'         , to_char( nvl(sum(vlor_bse_grvble),0) , :F_FRMTO_MNDA )',
'         , to_char(nvl(sum(vlor_bse_grvble),0)  + to_number(:P149_BSE, :F_FRMTO_MNDA) , :F_FRMTO_MNDA )',
'     into :P149_NMRO_LQDCION_ANTRIOR',
'        , :P149_TTAL_LQDCION_ANTRIOR',
'        , :P149_NVA_BSE',
'     from v_gi_g_rentas',
'    where (id_rnta                = :P149_ID_RNTA_ANTRIOR',
'      or id_rnta_antrior          = :P149_ID_RNTA_ANTRIOR)',
'      and cdgo_rnta_estdo         in (''LQD'', ''APB'')',
'      and cdgo_mvnt_fncro_estdo   = ''NO''',
'      and id_rnta                 != :P149_ID_RNTA',
'      and :P149_FCHA_EXPDCION     >= fcha_expdcion ',
'      ;',
'exception ',
'    when others then ',
'        :P149_NMRO_LQDCION_ANTRIOR  := 0;',
'        :P149_TTAL_LQDCION_ANTRIOR  := 0;',
'        :P149_NVA_BSE  := 0;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P149_INDCDOR_LQDCCION_ADCNAL'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'S'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79881893611484502)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de reporte del recibo de rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_rprte',
'      into :P149_ID_RPRTE',
'      from gn_d_reportes   a',
'       join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'       and cdgo_clnte              = :F_CDGO_CLNTE',
'     where cdgo_rprte_grpo = ''RRV'' ',
'       and a.indcdor_gnrco = ''N'';',
'exception',
'    when no_data_found then ',
'         select a.id_rprte',
'          into :P149_ID_RPRTE',
'          from gn_d_reportes   a',
'         where a.cdgo_rprte_grpo = ''RRV''  ',
'           and a.indcdor_gnrco = ''S''',
'           and rownum            = 1;',
'    when others then ',
'        :P149_ID_RPRTE := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(83749790513256206)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar reporte de certificado exencion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_rprte',
'      into :P149_ID_RPRTE_CRTFCDO',
'      from gn_d_reportes   a',
'       join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'       and cdgo_clnte              = :F_CDGO_CLNTE',
'     where cdgo_rprte_grpo = ''EXN'' ',
'       and a.indcdor_gnrco = ''N'';',
'exception',
'    when no_data_found then ',
'         select a.id_rprte',
'          into :P149_ID_RPRTE_CRTFCDO',
'          from gn_d_reportes   a',
'         where a.cdgo_rprte_grpo = ''EXN''  ',
'           and a.indcdor_gnrco = ''S''',
'           and rownum            = 1;',
'    when others then ',
'        :P149_ID_RPRTE := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P149_ID_EXNCION_SLCTUD'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86480566338177220)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Recaudo de rentas')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select to_char(fcha_rcdo, ''DD/MM/YYYY'')                 fcha_rcdo',
'        , to_char(fcha_apliccion, ''DD/MM/YYYY HH:MI AM'')   fcha_aplccion',
'        , to_char(sum(vlor) over () , :F_FRMTO_MNDA) vlor',
'        , dscrpcion_frma_pgo',
'        , id_usrio_aplco',
'        , dscrpcion_rcdo_orgen_cntrol',
'        , id_orgen',
'        , id_rcdo',
'     into :P149_FCHA_RCDO',
'        , :P149_FCHA_APLCCION',
'        , :P149_VLOR',
'        , :P149_DSCRPCION_FRMA_PGO',
'        , :P149_ID_USRIO_APLCO',
'        , :P149_DSCRPCION_RCDO_ORGEN_CNTROL',
'        , :P149_ID_DCMNTO_RCDO',
'        , :P149_ID_RCDO',
'     from v_re_g_recaudos ',
'    where nmro_dcmnto       = :P149_NMRO_DCMNTO',
'      and cdgo_rcdo_estdo   = ''AP''',
'    order by fcha_apliccion asc',
'    --order by id_orgen asc',
'    fetch first 1 rows only;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from v_re_g_recaudos ',
'    where nmro_dcmnto         = :P149_NMRO_DCMNTO',
'        and cdgo_rcdo_estdo   = ''AP''; '))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107033766468474813)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta generaci\00F3n de Bono')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select indcdor_gnra_bno_cja',
'    into  :P149_INDCDOR_GNRA_BNO_CJA',
'    from gi_d_rentas_configuracion',
'    where cdgo_clnte = :F_CDGO_CLNTE;',
'exception',
'    when others then ',
'         raise_application_error(-20001, ''No se encontro parametrizada la forma de generar el Bono'');',
'        :P149_INDCDOR_GNRA_BNO_CJA := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105722310447279242)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de reporte Bono'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_rprte',
'      into :P149_ID_RPRTE_BONO',
'      from gn_d_reportes   a',
'     where cdgo_rprte_grpo = ''BED'' ',
'       and a.indcdor_gnrco = ''N'';',
'exception',
'    when others then ',
'         raise_application_error(-20001, ''No se encontro parametrizada la plantilla de Bono'');',
'        :P149_ID_RPRTE := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    :P149_CDGO_RNTA_ESTDO in (''APB'', ''LQD'')  and :P149_INDCDOR_RNTA_PGADA   = ''S'' and :P149_INDCDOR_GNRA_BNO_CJA = ''S''',
'and (    (:P149_INDCDOR_EXNCION       = ''S'' ',
'      and :P149_CDGO_EXNCION_ESTDO    = ''APB'' ',
'      ',
'         ) ',
' or :P149_INDCDOR_EXNCION = ''N'' )'))
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104297824158321933)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Impuesto Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  min(a.id_impsto_acto)',
'into 	:P149_ID_IMPSTO_ACTO',
'from 	gi_g_rentas_acto     a',
'where   a.id_rnta = :P149_ID_RNTA ;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11024057114370633)
,p_process_sequence=>100
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Impuesto Acto json'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_arrayagg( json_object(''ID_IMPSTO_ACTO'' value id_impsto_acto) )',
'into  :P149_ACTOS_SLCCNDOS ',
'from  gi_g_rentas_acto     a',
'where a.id_rnta = :P149_ID_RNTA ;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4032748469646106)
,p_process_sequence=>110
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar fecha maxima de vencimiento del recibo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  trunc(max(fcha_vncmnto))',
'into :P149_MAX_FCHA_VNCMNTO',
'from re_g_documentos',
'where nmro_dcmnto = :P149_NMRO_DCMNTO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'    :P149_CDGO_RNTA_ESTDO in (''APB'', ''LQD'') '
,p_process_when_type=>'SQL_EXPRESSION'
);
end;
/
