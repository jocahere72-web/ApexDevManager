prompt --application/pages/page_00148
begin
wwv_flow_api.create_page(
 p_id=>148
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Consulta Solicitudes de Liquidaci\00F3n de Rentas')
,p_step_title=>unistr('Consulta Solicitudes de Liquidaci\00F3n de Rentas')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251112151020'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82220585247111903)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="justify">En esta opci\00F3n se puede consultar las liquidaciones de rentas registradas en el sistema.<br> '),
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89722317175905248)
,p_plug_name=>'Parametros de Busqueda '
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89722379336905249)
,p_plug_name=>'<b>Solicitudes de Liquidaciones</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_rnta',
'        , ''<span class="fa fa-eye"></span>''  ver',
'        , a.nmro_rnta',
'        , a.idntfccion_sjto',
'		, a.fcha_rgstro',
'        , a.fcha_expdcion',
'		, case when txto_ascda is not null then ',
'            initcap(a.dscrpcion_ascda) || '': '' || a.txto_ascda ',
'          else',
'              ''--''',
'          end as txto_ascda',
'		, a.nmbre_impsto_sbmpsto',
'		, (select case ',
'                    when upper(m.txto_bse_grvble ) = ''BASE GRAVABLE'' then ',
'                        to_char(vlor_bse_grvble, ''999G999G999G999G999G999'') ',
'                    else  ',
'                        upper(m.txto_bse_grvble )  || '': '' || to_char(vlor_bse_grvble, ''999G999G999G999G999G999'') ',
'                    end as txto_bse',
'                   from df_i_impuestos_acto m ',
'                   join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'                  where n.id_rnta           = a.id_rnta',
'                    and rownum = 1',
'			) txto_bse',
'        , a.txto_ascda as txt',
'        , a.dscrpcion_rnta_estdo',
'        , a.dscrpcion_indcdor_rnta_pgda',
'        , a.dscrpcion_indcdor_exncion',
'        , a.cdgo_exncion_estdo',
'        , a.nmbre_rzon_scial',
'        , a.fcha_vncmnto',
'      --  , a.dscrpcion_indcdor_cntrto_gsnla',
'        , a.dscrpcion_indcdor_cntrto_ese',
'        , trim(to_char(a.vlor_cntrto_ese, ''999G999G999G999G999G999G990'')) vlor_cntrto_ese',
'        , to_char(b.vlor_ttal_dcmnto,''999G999G999G999G999G999'') vlor_ttal_dcmnto',
'        , c.nmbre scrsal',
'        , a.nmro_dcmnto',
'	 from v_gi_g_rentas		        a',
'     left join re_g_documentos b on b.id_dcmnto = a.id_dcmnto',
'     left join si_i_sujetos_sucursal c on c.id_sjto_scrsal = a.id_sjto_scrsal',
'	where a.cdgo_clnte		        = :F_CDGO_CLNTE',
'  	  and a.id_impsto_sbmpsto       = :P148_ID_IMPSTO_SBMPSTO',
'      and (a.nmro_rnta              = :P148_NMRO_RNTA  or :P148_NMRO_RNTA  is null)',
'      and (a.id_usrio               = :P148_USRIO      or :P148_USRIO  is null)',
'      and (a.cdgo_rnta_estdo        = :P148_CDGO_RNTA_ESTDO',
'           or  ( :P148_CDGO_RNTA_ESTDO is NULL and cdgo_rnta_estdo in (''APB'',''RCH'', ''LQD'') ) ',
'          )  ',
'      and (a.idntfccion_sjto        = :P148_IDNTFCCION               or :P148_IDNTFCCION         is null)',
'      and (a.id_sbmpsto_ascda       = :P148_ID_SBMPSTO_ASCDA         or :P148_ID_SBMPSTO_ASCDA   is null)',
'      and (a.txto_ascda             = :P148_TXTO_ASCDA               or :P148_TXTO_ASCDA         is null)',
'      and (a.indcdor_exncion        = :P148_INDCDOR_EXNCION          or :P148_INDCDOR_EXNCION    is null)',
'      and (a.indcdor_rnta_pgda      = :P148_INDCDOR_RNTA_PGADA       or :P148_INDCDOR_RNTA_PGADA is null)',
'      and (a.nmro_dcmnto            = :P148_NMRO_DCMNTO              or :P148_NMRO_DCMNTO is null)',
'      and ((trunc(a.fcha_rgstro)           between :P148_FCHA_SLCTUD_INCIO  and :P148_FCHA_SLCTUD_FIN)',
'       or :P148_FCHA_SLCTUD_INCIO   is null ',
'       or :P148_FCHA_SLCTUD_FIN     is null)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75730803973243601)
,p_name=>'VLOR_TTAL_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_DCMNTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Liquidado'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>24
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
 p_id=>wwv_flow_api.id(75730933022243602)
,p_name=>'SCRSAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCRSAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sucursal'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(78136288366685825)
,p_name=>'TXT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78137094112685833)
,p_name=>'DSCRPCION_RNTA_ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RNTA_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado <br> Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(79560328794385512)
,p_name=>'NMRO_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0  <br>Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(79883265316484516)
,p_name=>'DSCRPCION_INDCDOR_RNTA_PGDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_RNTA_PGDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFPagada?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(80928207267670814)
,p_name=>'DSCRPCION_INDCDOR_EXNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_EXNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(80928329384670815)
,p_name=>'CDGO_EXNCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_EXNCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(83749341950256202)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(84405966740851673)
,p_name=>'FCHA_EXPDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_EXPDCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de <br> Suscripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89255323374381723)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha <br>Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89723156705905256)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89723214404905257)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n <br> Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(89961367409975923)
,p_name=>'NMRO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero<br>Documento')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(90072059919750408)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY HH:MI:SS PM'
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90072147428750409)
,p_name=>'TXTO_ASCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_ASCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Asociada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>302
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
 p_id=>wwv_flow_api.id(90072270794750410)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(90072443686750412)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&VER.'
,p_link_target=>'f?p=&APP_ID.:149:&SESSION.::&DEBUG.:RP,149:P149_ID_RNTA,P149_BRANCH:&ID_RNTA.,&APP_PAGE_ID.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90072501498750413)
,p_name=>'TXTO_BSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_BSE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Base Gravable | Aval\00FAo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>86
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
 p_id=>wwv_flow_api.id(102857468747131220)
,p_name=>'DSCRPCION_INDCDOR_CNTRTO_ESE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_CNTRTO_ESE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(102857509190131221)
,p_name=>'VLOR_CNTRTO_ESE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CNTRTO_ESE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(89723007602905255)
,p_internal_uid=>89723007602905255
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(90079084402781687)
,p_interactive_grid_id=>wwv_flow_api.id(89723007602905255)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(90079269675781696)
,p_report_id=>wwv_flow_api.id(90079084402781687)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10315965052121)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(75730803973243601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13588427080921)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(75730933022243602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35069904121784)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(89961367409975923)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78792361944114120)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(84405966740851673)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(78936360576877837)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(78136288366685825)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(79034042816745824)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(78137094112685833)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80049078970678998)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(79560328794385512)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81029425547186749)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(79883265316484516)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81232590832157826)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(80928207267670814)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>75
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81233037175157830)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(80928329384670815)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83757446627280436)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(83749341950256202)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89454145574950471)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(89255323374381723)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90079587702781710)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(89723156705905256)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90080121890781717)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(89723214404905257)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90080638010781719)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(90072059919750408)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>147
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90081089335781721)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(90072147428750409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>331
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90081647687781722)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(90072270794750410)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>161
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90082593154781726)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(90072443686750412)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>59
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90083115300781727)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(90072501498750413)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102999519823291749)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(102857468747131220)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(103000034114291751)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(102857509190131221)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(45645000001)
,p_view_id=>wwv_flow_api.id(90079269675781696)
,p_execution_seq=>5
,p_name=>unistr('Liquidaci\00F3n Pagada')
,p_background_color=>'#99FF99'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(79883265316484516)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(94660546656396891)
,p_interactive_grid_id=>wwv_flow_api.id(89723007602905255)
,p_name=>'Liquidaciones VUR'
,p_type=>'ALTERNATIVE'
,p_default_view=>'GRID'
,p_authorization_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(94660731929396900)
,p_report_id=>wwv_flow_api.id(94660546656396891)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83373824197729324)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(84405966740851673)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83517822830493041)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(78136288366685825)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83615505070361028)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(78137094112685833)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84630541224294202)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(79560328794385512)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(85610887800801953)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(79883265316484516)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(85814053085773030)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(80928207267670814)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>75
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(85814499428773034)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(80928329384670815)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88338908880895640)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(83749341950256202)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94035607828565675)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(89255323374381723)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94661049956396914)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(89723156705905256)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94661584144396921)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(89723214404905257)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94662100264396923)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(90072059919750408)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>147
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94662551589396925)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(90072147428750409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94663109941396926)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(90072270794750410)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>161
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94664055408396930)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(90072443686750412)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>59
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94664577554396931)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(90072501498750413)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>284
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107580982076906953)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(102857468747131220)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107581496367906955)
,p_view_id=>wwv_flow_api.id(94660731929396900)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(102857509190131221)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(78791996883108917)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(89722317175905248)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58196548555678802)
,p_name=>'P148_USRIO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>unistr('<b>Usuario que liquid\00F3</b>')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    a.nmbre_trcro,',
'    a.id_usrio',
'FROM',
'    v_sg_g_usuarios     a',
'    JOIN df_c_funcionarios   b ON b.id_fncnrio = a.id_fncnrio',
'where exists (select 1 from gi_g_rentas c where c.ID_IMPSTO_SBMPSTO = :P148_ID_IMPSTO_SBMPSTO and c.id_usrio = a.id_usrio) ',
'ORDER BY',
'    1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P148_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la asociada correspondiente a la renta que desea consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67292332537147604)
,p_name=>'P148_NMRO_DCMNTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>unistr('<b>N\00FAmero Documento</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de documento de pago correspondiente a la liquidaci\00F3n de la renta que desea consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78206934875692019)
,p_name=>'P148_CDGO_RNTA_ESTDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>'<b>Estado</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion ',
'     , cdgo_rnta_estdo',
'  from gi_d_rentas_estado',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione es estado en que se encuentra la renta que desea consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78792356696108926)
,p_name=>'P148_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto',
'  from gi_d_rentas_configuracion',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78792739903108934)
,p_name=>'P148_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.nmbre_impsto_sbmpsto',
'        , a.id_impsto_sbmpsto',
'     from df_i_impuestos_subimpuesto    a',
'    where a.id_impsto_sbmpsto           in (select id_impsto_sbmpsto',
'                                              from gi_g_rentas        m',
'                                             where m.cdgo_clnte       = :F_CDGO_CLNTE)',
' order by a.nmbre_impsto_sbmpsto'))
,p_lov_display_null=>'YES'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el sub tributo correspondiente a la renta que desea consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78793128489108935)
,p_name=>'P148_IDNTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>unistr('<b>Identificaci\00F3n del Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n correspondiente al sujeto con el que se registr\00F3 la renta que desea consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78793584270108935)
,p_name=>'P148_ID_SBMPSTO_ASCDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>'<b>Tipo Soporte</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion                    d',
'        , id_sbmpsto_ascda             r',
'     from gi_d_subimpuestos_asociada',
'    where cdgo_clnte                   = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto            = :P148_ID_IMPSTO_SBMPSTO',
'      and activo                       = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P148_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la asociada correspondiente a la renta que desea consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78793997609108935)
,p_name=>'P148_FCHA_SLCTUD_INCIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>'<b>Fecha Inicio Solicitud</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_colspan=>3
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ingrese valor m\00EDnimo del rango de fechas, correspondiente al registro de la renta que desea consultar.'),
''))
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78794308107108936)
,p_name=>'P148_FCHA_SLCTUD_FIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>'<b>Fecha Fin Solicitud</b>'
,p_source=>'select last_day(sysdate) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ingrese valor m\00E1ximo del rango de fechas, correspondiente al registro de la renta que desea consultar.'),
''))
,p_attribute_02=>'&P148_FCHA_SLCTUD_INCIO.'
,p_attribute_03=>' &P148_ULTMO_DIA_MES.'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78794741377108936)
,p_name=>'P148_ULTMO_DIA_MES'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_day(sysdate)',
'	from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79560268349385511)
,p_name=>'P148_NMRO_RNTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>unistr('<b>N\00B0 Liquidaci\00F3n</b>')
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmro_rnta',
'     from gi_g_rentas',
'    where cdgo_clnte           = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto    = :P148_ID_IMPSTO_SBMPSTO',
' order by nmro_rnta'))
,p_lov_cascade_parent_items=>'P148_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>20
,p_cMaxlength=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Ingrese valor correspondiente al n\00FAmero de la liquidaci\00F3n de la renta que desea consultar.')
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79886210801484546)
,p_name=>'P148_INDCDOR_EXNCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>unistr('<b>\00BFSolicit\00F3 Exenci\00F3n?</b>')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>10
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione si la renta que desea consultar, solicito o no exenci\00F3n.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79886398314484547)
,p_name=>'P148_INDCDOR_RNTA_PGADA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>unistr('<b>\00BFLiquidaci\00F3n Pagada?</b>')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(5646119019866897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione si la renta que desea consultar fue o no pagada.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82220494877111902)
,p_name=>'P148_TXTO_ASCDA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(89722317175905248)
,p_prompt=>'<b>Soporte</b>'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select txto_ascda',
'     from gi_g_rentas',
'    where cdgo_clnte                 = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto          = :P148_ID_IMPSTO_SBMPSTO',
'      and (id_sbmpsto_ascda          = :P148_ID_SBMPSTO_ASCDA        or :P148_ID_SBMPSTO_ASCDA is null)',
'      and ((fcha_rgstro              between :P148_FCHA_SLCTUD_INCIO  and :P148_FCHA_SLCTUD_FIN)',
'       or :P148_FCHA_SLCTUD_INCIO    is null ',
'       or :P148_FCHA_SLCTUD_FIN      is null)'))
,p_lov_cascade_parent_items=>'P148_ID_IMPSTO_SBMPSTO,P148_ID_SBMPSTO_ASCDA,P148_FCHA_SLCTUD_INCIO,P148_FCHA_SLCTUD_FIN'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Ingrese el valor correspondiente al soporte de la renta que desea consultar.'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
end;
/
