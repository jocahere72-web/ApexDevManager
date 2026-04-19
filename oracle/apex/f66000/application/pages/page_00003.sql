prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Ajustes por Parametros'
,p_step_title=>unistr('Ajustes por Par\00E1metros')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'$(''#''+id).click();',
'}',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'    font-weight: 700;',
'    BACKGROUND: #e4e4e4;',
'}'))
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210531161735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51185633502973213)
,p_plug_name=>'Ayuda '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
unistr('Esta funcionalidad permite filtrar los Ajustes por Tributo, Sub Tributo, identificaci\00F3n, estado,'),
unistr('tipo de ajuste, usuario, valor y fechas dando clic en el bot\00F3n consultar.'),
'</br>',
'<br>',
unistr('Adem\00E1s permite imprimir el reporte de la consulta realizada escogiendo el tipo de reporte y dando clic en el bot\00F3n imprimir.</i>'),
'</br>',
'<br>',
unistr('<i> <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>'),
'</br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73283753106965009)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73360431785243516)
,p_plug_name=>'Ajustes Realizados'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ajste,',
'       a.numro_ajste,',
'       pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion_sjto, p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) idntfccion_sjto,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.id_sjto_impsto,',
'       a.nmbre_impsto,',
'       a.nmbre_impsto_sbmpsto,',
'       a.drccion,',
'--       upper(c.nmbre_rzon_scial) prptrio_prcpal,',
'       to_char(a.fcha, ''DD/MM/YYYY'') fecha,',
'      -- a.fcha,',
'       a.nmro_slctud,',
'       a.cdgo_tpo_ajste,',
'       a.tpo_ajste,',
'       a.dscrpcion_motivo,',
'       a.dscrpcion_estado,',
'     --  a.vlor,',
'       to_char(a.vlor, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_ajste,       ',
'      -- b.vlor_ajste,',
'       d.nmbre_trcro,',
'       a.id_instncia_fljo',
'       ',
'from v_gf_g_ajustes a       ',
'--join v_gf_g_ajuste_detalle      b on a.id_ajste = b.id_ajste',
'--left join v_si_i_sujetos_responsable c on a.id_sjto  = c.id_sjto',
'join v_sg_g_usuarios            d on a.id_usrio = d.id_usrio',
' where a.cdgo_clnte =:F_CDGO_CLNTE ',
'   and a.id_impsto              = nvl(:P3_ID_IMPSTO, a.id_impsto)',
'   and a.id_impsto_sbmpsto      = nvl(:P3_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'   and a.idntfccion_sjto        = nvl(:P3_IDNTFCCION, a.idntfccion_sjto)',
'   and a.cdgo_ajste_estdo       = nvl(:P3_CDGO_AJSTE, a.cdgo_ajste_estdo)',
'   and a.id_ajste_mtvo			= nvl(:P3_ID_AJSTE_MTVO, a.id_ajste_mtvo)',
' --  and a.tpo_ajste              = nvl(:P3_TPO_AJSTE, a.tpo_ajste)',
'   and a.cdgo_tpo_ajste             = nvl(:P3_TPO_AJSTE, a.cdgo_tpo_ajste)',
'   and a.id_usrio               = nvl(:P3_AJSTE_USRIOS, a.id_usrio) ',
'   and ( (a.vlor  between replace(:P3_VLOR_AJSTE,''.'','''') and replace(:P3_VLOR_AJSTE_HASTA,''.'',''''))',
'    or (a.vlor >= replace(:P3_VLOR_AJSTE,''.'','''') and :P3_VLOR_AJSTE_HASTA is null) ',
'   or (a.vlor <= replace(:P3_VLOR_AJSTE_HASTA,''.'','''') and :P3_VLOR_AJSTE is null)',
'   or (:P3_VLOR_AJSTE is null and :P3_VLOR_AJSTE_HASTA is null ))',
'/* ',
'   and ( (a.vlor  between :P3_VLOR_AJSTE and :P3_VLOR_AJSTE_HASTA)  ',
'   or (a.vlor >= :P3_VLOR_AJSTE and :P3_VLOR_AJSTE_HASTA is null) ',
'   or (a.vlor <= :P3_VLOR_AJSTE_HASTA and :P3_VLOR_AJSTE is null)',
'   or (:P3_VLOR_AJSTE is null and :P3_VLOR_AJSTE_HASTA is null )) */',
'      ',
'   and  ((trunc(a.fcha) between :P3_FECHA and :P3_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P3_FECHA and :P3_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P3_FECHA_HASTA and :P3_FECHA  is null)',
'   or(:P3_FECHA is null and :P3_FECHA_HASTA is null ))',
'  -- order by a.id_ajste desc;',
'  ;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35355581847614202)
,p_name=>'VLOR_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(39672824387391716)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(73362816330243523)
,p_name=>'ID_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(73363446780243524)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(73364102631243524)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(73365255658243525)
,p_name=>'DSCRPCION_MOTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MOTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>300
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
 p_id=>wwv_flow_api.id(73365877874243525)
,p_name=>'DSCRPCION_ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(73366809907243525)
,p_name=>'TPO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo <br>'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>7
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(77835652573433200)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
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
 p_id=>wwv_flow_api.id(77835767650433201)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
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
 p_id=>wwv_flow_api.id(77835884477433202)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
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
 p_id=>wwv_flow_api.id(77835966259433203)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(77836088209433204)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'SubTributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(77836175958433205)
,p_name=>'NMRO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Solicitud'
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
 p_id=>wwv_flow_api.id(77836230301433206)
,p_name=>'CDGO_TPO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
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
 p_id=>wwv_flow_api.id(77837011718433213)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110755235672495901)
,p_name=>'Ver'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_link_target=>'f?p=71000:197:&SESSION.::&DEBUG.:RP:P197_ID_AJSTE,P197_ID_INSTNCIA_FLJO:&ID_AJSTE.,&ID_INSTNCIA_FLJO.'
,p_link_text=>'&"Ver".<span class="fa fa-eye"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110755350025495902)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attribute_01=>'Y'
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
 p_id=>wwv_flow_api.id(113657062047741101)
,p_name=>'NUMRO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUMRO_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Ajuste')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(73360988629243517)
,p_internal_uid=>73360988629243517
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'<b>No hay ajustes realizados para esta fecha</b>'
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(73361351094243517)
,p_interactive_grid_id=>wwv_flow_api.id(73360988629243517)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(73361463979243517)
,p_report_id=>wwv_flow_api.id(73361351094243517)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35365063138629519)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(35355581847614202)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39959556075583108)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(77837011718433213)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40013320248661429)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(39672824387391716)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>92
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73363279243243524)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(73362816330243523)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73363817141243524)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(73363446780243524)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>202
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73364434494243524)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(73364102631243524)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>159
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73365632628243525)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(73365255658243525)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>274
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73366516273243525)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(73365877874243525)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73367140141243526)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(73366809907243525)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77845709698550300)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(77835652573433200)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77846234324550303)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(77835767650433201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77846905350550305)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(77835884477433202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77847438272550306)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(77835966259433203)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>227
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77848027413550308)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(77836088209433204)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77848711990550309)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(77836175958433205)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77849230943550311)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(77836230301433206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110760563838497583)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(110755235672495901)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>167
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110764274862546974)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(110755350025495902)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113663008809741437)
,p_view_id=>wwv_flow_api.id(73361463979243517)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(113657062047741101)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>90
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77837375642433217)
,p_plug_name=>'Impresion reporte'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39964997108335224)
,p_button_sequence=>25
,p_button_plug_id=>wwv_flow_api.id(77837375642433217)
,p_button_name=>'Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39952524672335208)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(73283753106965009)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(66685523312089818)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P3_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(39964997108335224)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39952901378335209)
,p_name=>'P3_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39953382919335211)
,p_name=>'P3_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>31
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P3_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P3_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39953749635335211)
,p_name=>'P3_IDNTFCCION'
,p_item_sequence=>32
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39954136051335211)
,p_name=>'P3_CDGO_AJSTE'
,p_item_sequence=>33
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>'<b>Estado</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_AJUSTES_ESTADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'     dscrpcion as d,',
'     cdgo_ajste_estdo as r',
'from gf_d_ajuste_estado',
'where cdgo_ajste_estdo in (select distinct cdgo_ajste_estdo from gf_g_ajustes)',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39954551497335211)
,p_name=>'P3_TPO_AJSTE'
,p_item_sequence=>53
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>'<b>Tipo Ajuste</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LVL_TIPO_AJUSTES'
,p_lov=>'.'||wwv_flow_api.id(39989996613538127)||'.'
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39954951642335212)
,p_name=>'P3_AJSTE_USRIOS'
,p_item_sequence=>63
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>'<b>Usuario</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_AJUSTE_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  DISTINCT a.nmbre_trcro as d,b.id_usrio as r from v_sg_g_usuarios a',
'join v_gf_g_ajustes     b on a.id_usrio = b.id_usrio ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39955343500335212)
,p_name=>'P3_VLOR_AJSTE'
,p_item_sequence=>73
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>'<b>Valor Desde</b>'
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39955791399335212)
,p_name=>'P3_VLOR_AJSTE_HASTA'
,p_item_sequence=>83
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>'<b>Valor Hasta</b>'
,p_format_mask=>'999G999G999G999G999G999G990D99'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39956110617335212)
,p_name=>'P3_FECHA'
,p_item_sequence=>103
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>'<b>Fecha Desde</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'sysdate  - 7'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return false "'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39956544267335212)
,p_name=>'P3_FECHA_HASTA'
,p_item_sequence=>113
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>'<b>Fecha Hasta</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'sysdate'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P3_FECHA.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39965384231335224)
,p_name=>'P3_RPRTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(77837375642433217)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ,',
'       id_rprte r',
'        from gn_d_reportes',
' where cdgo_rprte_grpo = ''AJ1''',
' and id_rprte=10;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66685416233089817)
,p_name=>'P3_ID_RPRTE_PRMTRO'
,p_item_sequence=>123
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66685627499089819)
,p_name=>'P3_JSON'
,p_item_sequence=>133
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85000325367585901)
,p_name=>'P3_ID_AJSTE_MTVO'
,p_item_sequence=>93
,p_item_plug_id=>wwv_flow_api.id(73283753106965009)
,p_prompt=>'<b>Motivo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select ',
'    distinct(a.dscrpcion_motivo),a.id_ajste_mtvo',
'      ',
'       ',
'from v_gf_g_ajustes a       ',
'--join v_gf_g_ajuste_detalle      b on a.id_ajste = b.id_ajste',
'--left join v_si_i_sujetos_responsable c on a.id_sjto  = c.id_sjto',
'join v_sg_g_usuarios            d on a.id_usrio = d.id_usrio',
' where a.cdgo_clnte =:F_CDGO_CLNTE '))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35034984798204701)
,p_validation_name=>'Validar Valor'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*:P3_VLOR_AJSTE_HASTA >= :P3_VLOR_AJSTE*/',
'',
'TO_NUMBER(:P3_VLOR_AJSTE_HASTA, ''999G999G999G999G999G999G990D99'') >= TO_NUMBER(:P3_VLOR_AJSTE, ''999G999G999G999G999G999G990D99'')'))
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'EL "Valor Hasta" del ajuste debe ser mayor que el "valor Desde" del ajuste'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(39955791399335212)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39965781334335229)
,p_name=>'Al Cambiar Fecha inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_FECHA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39966282656335230)
,p_event_id=>wwv_flow_api.id(39965781334335229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P3_FECHA_HASTA").datepicker( ''option'' , ''minDate'' , $("#P3_FECHA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39966682973335230)
,p_name=>'Activar Imprimir'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_RPRTE'
,p_condition_element=>'P3_RPRTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P3_RPRTE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39967196754335231)
,p_event_id=>wwv_flow_api.id(39966682973335230)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(39964997108335224)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39967620076335231)
,p_event_id=>wwv_flow_api.id(39966682973335230)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(39964997108335224)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(66685342511089816)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte             gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t(); ',
'     --v_id_rprte_prmtro         gn_t_reportes_parametro.id_rprte_prmtro%type;',
'     v_json                    clob;',
'begin          ',
'    ',
'    --:P3_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P3_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
'     ',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P3_RPRTE;',
'',
'    v_object.put(''P_ID_IMPSTO'', :P3_ID_IMPSTO);   ',
'    v_object.put(''P_ID_IMPSTO_SBMPSTO'', :P3_ID_IMPSTO_SBMPSTO);',
'    v_object.put(''P_IDNTFCCION'', :P3_IDNTFCCION);  ',
'    v_object.put(''P_CDGO_AJSTE'', :P3_CDGO_AJSTE);  ',
'    v_object.put(''P_TPO_AJSTE'', :P3_TPO_AJSTE);  ',
'    v_object.put(''P_AJSTE_USRIOS'', :P3_AJSTE_USRIOS);  ',
'    v_object.put(''P_VLOR_AJSTE'', :P3_VLOR_AJSTE);  ',
'    v_object.put(''P_ID_AJSTE_MTVO'', :P3_ID_AJSTE_MTVO); ',
'    v_object.put(''P_VLOR_AJSTE_HASTA'', :P3_VLOR_AJSTE_HASTA); ',
'    v_object.put(''P_FECHA'', :P3_FECHA); ',
'    v_object.put(''P_FECHA_HASTA'', :P3_FECHA_HASTA); ',
'    v_object.put(''nmbre_rprte'', v_nmbre_rprte);',
'    v_json   := v_object.to_clob();  ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);       ',
'        ',
'exception',
'     when no_data_found then',
'          null;',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(39964997108335224)
);
end;
/
