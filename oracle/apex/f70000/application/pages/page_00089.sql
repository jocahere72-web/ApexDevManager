prompt --application/pages/page_00089
begin
wwv_flow_api.create_page(
 p_id=>89
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Consulta de Rentas Liquidadas'
,p_step_title=>'Consulta de Rentas Liquidadas'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'apex.item(''BTN_NRMLZAR_CRTRA'').hide(); '
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#rentas_ig_report_settings{',
'    display:none;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(164121496469722963)
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20221220134536'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16221237424689117)
,p_plug_name=>'Opciones'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16221338236689118)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'<i>',
'Esta funcionalidad permite<br><br>',
'    <b>1.</b> Liquidar rentas varias.<br><br>',
'    <b>2.</b> Consultar las preliquidaciones de rentas varias.<br><br>',
unistr('        <b>3.</b> Modificar las preliquidaciones de rentas varias, siempre y cuando no exista una liquidaci\00F3n oficial.<br><br>'),
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16221549955689120)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21128532925677885)
,p_plug_name=>'Solicitudes de Liquidaciones'
,p_region_name=>'rentas'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_rnta',
'        , a.nmro_rnta',
'		, a.fcha_rgstro',
'		, a.txto_ascda',
'		, a.usa_mxto',
'		, a.usa_extrnjro',
'		, a.nmbre_impsto_sbmpsto',
'		, a.idntfccion_sjto_frmtda',
'		, a.dscrpcion_ascda',
'		, case ',
'			when a.id_lqdcion is null and (a.cdgo_mvnt_fncro_estdo = ''AN'' or a.cdgo_mvnt_fncro_estdo is null)then ',
'				''<span class="fa fa-pencil"></span>'' ',
'		  end  ver',
'		, a.nmro_dcmnto',
'		, a.id_lqdcion',
'		, a.cdgo_mvnt_fncro_estdo',
'		, a.dscrpcion_rnta_estdo',
'		, case ',
'			when upper(c.txto_bse_grvble) = ''BASE GRAVABLE'' then ',
'				to_char(a.vlor_bse_grvble, :F_FRMTO_MNDA) ',
'			else upper(c.txto_bse_grvble) || '': '' || trim(to_char(a.vlor_bse_grvble, ''999G999G999G999G999G999G990'')) ',
'		  end txto_bse',
'          , a.dscrpcion_indcdor_exncion',
'          , a.nmbre_rzon_scial',
'	 from v_gi_g_rentas					    a',
'     join table (pkg_sg_autorizacion.fnc_sub_impuestos_x_usuario(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                                 p_id_usrio   => :F_ID_USRIO)) d  on a.id_impsto = d.id_impsto     ',
'	 join gi_g_rentas_acto					b on a.id_rnta				= b.id_rnta',
'	 join df_i_impuestos_acto				c on b.id_impsto_acto 		= c.id_impsto_acto',
'	where a.cdgo_clnte						= :F_CDGO_CLNTE',
'      and (a.id_impsto						= :P89_ID_IMPSTO 			or :P89_ID_IMPSTO 			is null)',
'      and (a.id_impsto_sbmpsto 				= :P89_ID_IMPSTO_SBMPSTO	or :P89_ID_IMPSTO_SBMPSTO	is null)',
'      and (a.id_impsto_sbmpsto 				= d.id_impsto_sbmpsto)--28/07/2020',
'      and a.cdgo_rnta_estdo                 = ''RGS''',
'      and (a.nmro_rnta                      = :P89_NMRO_RNTA            or :P89_NMRO_RNTA           is null)',
'      and (a.idntfccion_sjto 				= :P89_SJTO 				or :P89_SJTO 				is null)',
'      and (a.id_sbmpsto_ascda 				= :P89_ID_SBMPSTO_ASCDA 	or :P89_ID_SBMPSTO_ASCDA 	is null)           ',
'      and ((trunc(a.fcha_rgstro) 			between :P89_FCHA_INCIAL 	and :P89_FCHA_FNAL)',
'           or (trunc(a.fcha_rgstro) 		>= :P89_FCHA_INCIAL 		and :P89_FCHA_FNAL 			is null) ',
'           or (trunc(a.fcha_rgstro) 		<= :P89_FCHA_FNAL 			and :P89_FCHA_INCIAL  		is null)',
'           or (:P89_FCHA_INCIAL 			is null 					and :P89_FCHA_FNAL 			is null))',
'      and ((trunc(a.vlor_bse_grvble)		between to_number(:P89_BSE_INCIAL, ''999G999G999G999G999G999G990D99'') and to_number(:P89_BSE_FNAL,''999G999G999G999G999G999G990D99''))',
'       or (trunc(a.vlor_bse_grvble) 		>= to_number(:P89_BSE_INCIAL, ''999G999G999G999G999G999G990D99'') and to_number(:P89_BSE_FNAL, ''999G999G999G999G999G999G990D99'') is null) ',
'       or (trunc(a.vlor_bse_grvble) 		<= to_number(:P89_BSE_FNAL,''999G999G999G999G999G999G990D99'') and to_number(:P89_BSE_INCIAL, ''999G999G999G999G999G999G990D99'')  is null)',
'       or (to_number(:P89_BSE_INCIAL, ''999G999G999G999G999G999G990D99'') is null and to_number(:P89_BSE_FNAL,''999G999G999G999G999G999G990D99'') is null)',
'			)',
'           ;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21130288460677957)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21130887267677958)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha <br>Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_max_length=>19
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21132089674677958)
,p_name=>'TXTO_ASCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_ASCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Soporte <br>Asociada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21133840863677959)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21134411848677959)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n  <br> Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37512056063196623)
,p_name=>'DSCRPCION_ASCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ASCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Asociada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(37512176406196624)
,p_name=>'USA_MXTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USA_MXTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFMixto?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(37512200325196625)
,p_name=>'USA_EXTRNJRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USA_EXTRNJRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFExtranjero?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(39262573503813831)
,p_name=>'NMRO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Nmro Dcmnto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(39264231038813848)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(40479559886382203)
,p_name=>'ID_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION'
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
 p_id=>wwv_flow_api.id(40479662318382204)
,p_name=>'CDGO_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVNT_FNCRO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(40650477039356904)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&VER.'
,p_link_target=>'f?p=&APP_ID.:138:&SESSION.::&DEBUG.:RP,138,139,141,142,143:P138_ID_RNTA,P138_BRANCH:&ID_RNTA.,&APP_PAGE_ID.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(46643604083887601)
,p_name=>'TXTO_BSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_BSE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Base de Renta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(77073809515293003)
,p_name=>'DSCRPCION_RNTA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RNTA_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(79561924294385528)
,p_name=>'DSCRPCION_INDCDOR_EXNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_EXNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFExenci\00F3n?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(79882538131484509)
,p_name=>'NMRO_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(83749409936256203)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(21129086803677906)
,p_internal_uid=>21129086803677906
,p_is_editable=>true
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
 p_id=>wwv_flow_api.id(21129409801677924)
,p_interactive_grid_id=>wwv_flow_api.id(21129086803677906)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(21129513748677925)
,p_report_id=>wwv_flow_api.id(21129409801677924)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1006705008777)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(77073809515293003)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21130667315677957)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21130288460677957)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21131238244677958)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(21130887267677958)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21132433968677958)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(21132089674677958)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21134296299677959)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21133840863677959)
,p_is_visible=>false
,p_is_frozen=>true
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21134800591677960)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21134411848677959)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37807231909272886)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(37512056063196623)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>157
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37810109242300545)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(37512176406196624)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37810671996300547)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(37512200325196625)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40308945016839331)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(39262573503813831)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40506362178732578)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(40479559886382203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40506758564732588)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(40479662318382204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40666340999546696)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(40650477039356904)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46649582297887843)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(46643604083887601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>296
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80032456531487231)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(79882538131484509)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80627533155633895)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(79561924294385528)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83890668598729350)
,p_view_id=>wwv_flow_api.id(21129513748677925)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(83749409936256203)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>152
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16221442115689119)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(16221237424689117)
,p_button_name=>'BTN_NVO_RNTA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Renta'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:138:&SESSION.::&DEBUG.:RP,138,139,141,142,143:P138_BRANCH:&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-window-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39264042850813846)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(16221237424689117)
,p_button_name=>'BTN_NRMLZAR_CRTRA'
,p_button_static_id=>'BTN_NRMLZAR_CRTRA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Normalizar Cartera'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16222236111689127)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(16221549955689120)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16221627164689121)
,p_name=>'P89_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_prompt=>'Sub Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto,',
'       id_impsto_sbmpsto',
'  from table (pkg_sg_autorizacion.fnc_sub_impuestos_x_usuario(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                              p_id_usrio   => :F_ID_USRIO))',
' where id_impsto = :P89_ID_IMPSTO',
'order by 1;',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo correspondiente a la renta que desea consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16221778106689122)
,p_name=>'P89_FCHA_INCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_prompt=>'Fecha Inicial - Registro'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_date (''01/'' || extract(MONTH from sysdate) || ''/'' || extract(year from sysdate)) fcha_incio',
'    from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese valor m\00EDnimo del rango de fechas, correspondiente al registro de la renta que desea consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16221824062689123)
,p_name=>'P89_FCHA_FNAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_prompt=>'Fecha Final - Registro'
,p_source=>'sysdate'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese valor m\00E1ximo del rango de fechas, correspondiente al registro de la renta que desea consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16221917713689124)
,p_name=>'P89_ID_SBMPSTO_ASCDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_prompt=>'Asociada'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select dscrpcion d',
'       ,id_sbmpsto_ascda r',
'  from gi_d_subimpuestos_asociada',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and activo = ''S'';'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la asociada correspondiente a la renta que desea consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16222070471689125)
,p_name=>'P89_BSE_INCIAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_prompt=>'Base Gravable - Inicial'
,p_format_mask=>'FM999G999G999G999G999G999G990D99'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:2});"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese valor m\00EDnimo del rango de base gravable, correspondiente a la renta que desea consultar.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16222149398689126)
,p_name=>'P89_BSE_FNAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_prompt=>'Base Gravable - Final'
,p_format_mask=>'FM999G999G999G999G999G999G990D99'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:2});"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese valor m\00E1ximo del rango de base gravable, correspondiente a la renta que desea consultar.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20511624030041535)
,p_name=>'P89_SJTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n correspondiente al sujeto con el que se registr\00F3 la renta que desea consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40479442386382202)
,p_name=>'P89_JSON_RNTAS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40650376527356903)
,p_name=>'P89_RSPSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45243025864472103)
,p_name=>'P89_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto r',
'    ,  a.nmbre_impsto  d',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO'))
,p_lov_display_null=>'YES'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(1) a',
' from v_sg_g_menu_impuesto     a',
' join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
'where a.cdgo_clnte       = :F_CDGO_CLNTE',
'  and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'  and a.id_mnu           = :F_ID_MNU',
'  and b.id_usrio         = :F_ID_USRIO',
'having count(1) > 1;'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo que desea consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79882640568484510)
,p_name=>'P89_NMRO_RNTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(16221549955689120)
,p_prompt=>unistr('N\00B0 Liquidaci\00F3n')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>12
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese valor correspondiente al n\00FAmero de la liquidaci\00F3n de la renta que desea consultar.')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(45457734397856302)
,p_computation_sequence=>10
,p_computation_item=>'P89_ID_IMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39264414596813850)
,p_name=>'Al Cambiar Renta'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(21128532925677885)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40479319607382201)
,p_event_id=>wwv_flow_api.id(39264414596813850)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (this.data.selectedRecords.length > 0 ){',
'    const unique = (value, index, self) => {',
'      return self.indexOf(value) === index',
'    }    ',
'    var model = this.data.model;',
'    var r = ''000'';',
'    var records = this.data.selectedRecords;',
'    ',
'    records = records.filter(function (record) {',
'        return ((model.getValue(record, "ID_LQDCION") !== '''') && (model.getValue(record, "CDGO_MVNT_FNCRO_ESTDO") === ''AN''));',
'    });',
'    ',
'    console.log(''records'' ,records);',
'    ',
'    var json = records.map(function (record){',
'        return {"ID_LQDCION" : model.getValue(record, "ID_LQDCION")};',
'    });',
'    ',
'    if (json.length > 0){',
'        ',
'        var rs  = records.map(function (record) { return model.getValue(record, "CDGO_MVNT_FNCRO_ESTDO")});',
'    ',
'        const uniqueDC = rs.filter(unique); ',
'        r = rs.reduce(function(x, y){',
'            return x === y && x === ''AN'' ? x : ''000'';',
'        });',
'',
'',
'        if ( r === ''000'' || r !== ''AN'' ){ ',
'            $s(''P89_JSON_RNTAS'', '''');',
'            apex.item(''BTN_NRMLZAR_CRTRA'').hide();     ',
'        } else {    ',
'            $s(''P89_JSON_RNTAS'', JSON.stringify(json));',
'            apex.item(''BTN_NRMLZAR_CRTRA'').show();            ',
'        }   ',
'    }    ',
'}else{',
'     apex.item(''BTN_NRMLZAR_CRTRA'').hide(); ',
'}',
'   '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4253371700589311)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Envios'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'declare',
'    v_json_parametros clob;',
'begin',
'    select json_object( key ''ID_RNTA'' is nvl(''7163'',''7162'')) ',
'      into v_json_parametros ',
'      from dual;',
'',
'    pkg_ma_envios.prc_co_envio_programado( p_cdgo_clnte                => :F_CDGO_CLNTE,',
'                                           p_idntfcdor                 => ''REGISTRO_RENTA'',',
'                                           p_json_prmtros              => v_json_parametros );',
'exception',
'    when others then',
'        DBMS_OUTPUT.PUT_LINE(to_char(sqlerrm));	',
'end; --Fin Consultamos los envios programados',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40650223922356902)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Normalizar la Cartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta            number;',
'begin',
'    pkg_gi_rentas.prc_rg_movimientos_financiero(p_cdgo_clnte            =>    :F_CDGO_CLNTE',
'                                                ,p_json_lqdcion			=>    :P89_JSON_RNTAS',
'											    ,p_id_usrio				=>    :F_ID_USRIO',
'											    ,o_cdgo_rspsta			=>     v_cdgo_rspsta	',
'                                                ,o_mnsje_rspsta			=>    :P89_RSPSTA ',
'                                                );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(39264042850813846)
,p_process_success_message=>'&P89_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(77076032556293025)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    if (apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_RENTA'') ) then',
'        APEX_COLLECTION.DELETE_COLLECTION( p_collection_name => ''ADJUNTOS_RENTA'');',
'    end if;',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
