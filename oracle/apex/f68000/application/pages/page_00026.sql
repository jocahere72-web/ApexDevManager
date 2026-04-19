prompt --application/pages/page_00026
begin
wwv_flow_api.create_page(
 p_id=>26
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>unistr('Gesti\00F3n de Ventanilla')
,p_step_title=>unistr('Gesti\00F3n de Ventanilla')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iniciar_flujo(name, id_instancia){',
'    apex.server.process(name, {',
'        f01: id_instancia',
'    }, {',
'        success: function (data) { ',
'                if (data.type === ''OK'') {',
'                    window.localStorage.clear();',
'                    window.location.href = data.url;',
'                }else{',
'                    apex.message.showErrors({',
'                        type: apex.message.TYPE.ERROR,',
'                        location: ["page"],',
'                        message: data.msg,',
'                        unsafe: false',
'                    });',
'                }',
'            },',
'            error: function () {',
'                console.log(arguments);',
'            }',
'        }); ',
'}',
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20250815085747'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13221891406524201)
,p_plug_name=>'ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'Funcionalidad que permite:<br><br>',
unistr('<b>1.</b> Consultar las solicitudes ingresadas en el m\00F3dulo de PQR con motivo <b>Queja o Reclamo</b> mediante el enlace ir a flujo.<br><br>'),
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84036633085768114)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71804482016951559)
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88075156403973261)
,p_plug_name=>'Consulta PQR'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select s.cdgo_clnte,',
'          s.nmro_rdcdo_dsplay,',
'          initcap(upper(r.prmer_nmbre || '' '' || r.prmer_aplldo)) nmbre_rdcdor,',
'          m.dscrpcion,',
'          e.dscrpcion dscrpcion_estdo,',
'          sms.idntfccion,',
'          i.nmbre_impsto,',
'          i.nmbre_impsto_sbmpsto,',
'          s.fcha_rdcdo,',
'          s.fcha_pryctda,',
'          s.fcha_real,',
'          s.id_instncia_fljo,',
'          rs.dscrpcion dscrpcion_rspsta,',
'          s.indcdor_dcmnto_pndnte,',
'          trunc(s.fcha_pryctda)-trunc(sysdate) dias,',
'          ft.nmbre_trea,',
'          (select ''SI'' from pq_g_rvsion_trea_fljo a where a.id_instncia_fljo=tr.id_instncia_fljo fetch first 1 row only ) as rchzdo',
'     from pq_g_solicitudes              s',
'     join v_sg_g_usuarios               u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                  e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo       sm  on sm.id_slctud = s.id_slctud',
'     join pq_d_motivos                  m   on m.id_mtvo = sm.id_mtvo',
'left join pq_g_slctdes_mtvo_sjt_impst   sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo      p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'left join v_df_i_impuestos_subimpuesto  i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'left join pq_d_respuestas               rs  on rs.cdgo_rspsta = s.cdgo_rspsta',
'     join wf_g_instancias_flujo_gnrdo   fg  on fg.id_instncia_fljo = s.id_instncia_fljo',
'     join v_wf_g_instancias_flujo       wf  on wf.id_instncia_fljo = fg.id_instncia_fljo_gnrdo_hjo',
'     join wf_g_instancias_transicion    tr  on tr.id_instncia_fljo = fg.id_instncia_fljo_gnrdo_hjo  ',
'     join wf_d_flujos                   fj  on wf.cdgo_fljo = fj.cdgo_fljo',
'     join v_wf_d_flujos_tarea           ft  on ft.id_fljo_trea=tr.id_fljo_trea_orgen',
'    where s.cdgo_clnte = :F_CDGO_CLNTE',
'      and tr.id_usrio  = :F_ID_USRIO',
'      and wf.cdgo_fljo = fj.cdgo_fljo ',
'      /*and wf.cdgo_fljo in (''QRE'', ''DCI'', ''FMC'', ''FIO'', ''EMP'', ''EMI'', ''SNC'', ''EXO'', ''SPV'', ''SET'', ''SRP'', ''SAF'', ''LRE'', ''PSD'', ''PYS'', ',
'                           ''NPP'', ''1'', ''SVA'', ''DCI'', ''SCP'', ''SCI'', ''SIP'', ''SII'', ''RDP'', ''RDI'', ''RGP'', ''TCP'', ''SIT'', ''SAI'', ''EXP'', ',
'                           ''PRC'', ''SPI'', ''SAP'', ''SEP'', ''SEI'', ''CBM'', ''NCP'', ''NMP'', ''CNV'', ''RAP'', ''EXV'', ''LDU'', ''PLG'', ''LVC'', ''REI'', ',
'                           ''RPR'', ''RPC'', ''RDT'', ''SLP'', ''SRT'', ''SCR'', ''SCC'', ''SIR'', ''SCU'', ''IGI'', ''CCI'', ''DIP'', ''SPR'', ''NPR'', ''PQR'', ',
'                           ''FUS'', ''DIC'', ''DCA'', ''DII'', ''RRI'', ''RRP'', ''SEX'' )*/',
'      and tr.id_estdo_trnscion in (1,2)',
'      ',
'       and 0 = case when sms.idntfccion = :P26_IDNTFCCION ',
'                  then 0',
'                  when :P26_IDNTFCCION is null',
'                  then 0',
'                  when sms.idntfccion is not null and :P26_IDNTFCCION is not null and :P26_IDNTFCCION = sms.idntfccion',
'                  then 0',
'                  else 1',
'              end',
'     and m.id_mtvo = nvl(:P26_ID_MTVO, m.id_mtvo) ',
'     and e.id_estdo = nvl(:P26_ESTDO, e.id_estdo)',
'     and nvl(rs.cdgo_rspsta,0)  = nvl(:P26_CDGO_RSPSTA, nvl(rs.cdgo_rspsta,0))',
'     and (s.nmro_rdcdo_dsplay   like ''%'' || :P26_NMRO_RDCDO_DSPLAY ||''%'' or :P26_NMRO_RDCDO_DSPLAY is null)',
'     and (TRUNC(s.fcha_rdcdo)   >= TRUNC(TO_DATE(:P26_FCHA_RDCDO_INCIO,''DD/MM/YYYY''))   OR :P26_FCHA_RDCDO_INCIO IS NULL) ',
'     and (TRUNC(s.fcha_rdcdo)   <= TRUNC(TO_DATE(:P26_FCHA_RDCDO_FIN,''DD/MM/YYYY''))     OR :P26_FCHA_RDCDO_FIN IS NULL) ',
'     and (TRUNC(s.fcha_pryctda) >= TRUNC(TO_DATE(:P26_FCHA_PRYCTDA_INCIO,''DD/MM/YYYY'')) OR :P26_FCHA_PRYCTDA_INCIO IS NULL) ',
'     and (TRUNC(s.fcha_pryctda) <= TRUNC(TO_DATE(:P26_FCHA_PRYCTDA_FIN,''DD/MM/YYYY''))   OR :P26_FCHA_PRYCTDA_FIN IS NULL) ',
'     and (TRUNC(s.fcha_real)    >= TRUNC(TO_DATE(:P26_FCHA_REAL_INCIO,''DD/MM/YYYY''))    OR :P26_FCHA_REAL_INCIO IS NULL) ',
'     and (TRUNC(s.fcha_real)    <= TRUNC(TO_DATE(:P26_FCHA_REAL_FIN,''DD/MM/YYYY''))      OR :P26_FCHA_REAL_FIN IS NULL) ;',
'     '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(88318404036068380)
,p_heading=>'Fecha'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(88318606578068382)
,p_heading=>'Datos del Tributo'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(132948667257343735)
,p_heading=>'Acciones'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(132948738596343736)
,p_heading=>'Datos de la solicitud'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88317213300068368)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(132948738596343736)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>400
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88317240162068369)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(88318606578068382)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(88317425231068370)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(88318606578068382)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(88317515651068371)
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
,p_group_id=>wwv_flow_api.id(88318606578068382)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88317580527068372)
,p_name=>'DSCRPCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(132948738596343736)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(88317694278068373)
,p_name=>'NMRO_RDCDO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('N\00B0 Radicado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(132948667257343735)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'<a href="#" onclick="iniciar_flujo(''IniciarFlujo'',&ID_INSTNCIA_FLJO.)" style="color:blue">&NMRO_RDCDO_DSPLAY.</a>'
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
 p_id=>wwv_flow_api.id(88317934171068375)
,p_name=>'FCHA_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RDCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Radicada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(88318404036068380)
,p_use_group_for=>'HEADING'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_max_length=>11
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
 p_id=>wwv_flow_api.id(88318013141068376)
,p_name=>'FCHA_PRYCTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRYCTDA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Proyectada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(88318404036068380)
,p_use_group_for=>'HEADING'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_max_length=>11
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
 p_id=>wwv_flow_api.id(88996210067356562)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'&F_CDGO_CLNTE.'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91136577170997335)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>' Flujo Generado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(132948667257343735)
,p_use_group_for=>'BOTH'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(''IniciarFlujoGenerado'',&ID_INSTNCIA_FLJO.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir a flujo',
'    <span class="fa fa-external-link-square"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94502728880610160)
,p_name=>'NMBRE_RDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RDCDOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Radicador'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(132948738596343736)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>201
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
 p_id=>wwv_flow_api.id(96239169585124101)
,p_name=>'DIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Dias'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(97867490256502001)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(132948738596343736)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(97867589434502002)
,p_name=>'RCHZDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RCHZDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rechazado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(132948738596343736)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(102420673312998535)
,p_name=>'FCHA_REAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_REAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Cierre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(88318404036068380)
,p_use_group_for=>'HEADING'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_max_length=>11
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
 p_id=>wwv_flow_api.id(128084968884179116)
,p_name=>'INDCDOR_DCMNTO_PNDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_DCMNTO_PNDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFDoc Pendientes?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(132948667257343735)
,p_use_group_for=>'BOTH'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(72037036337839180)
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
 p_id=>wwv_flow_api.id(133191114184558935)
,p_name=>'DSCRPCION_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(132948738596343736)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
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
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(88317129024068367)
,p_internal_uid=>88317129024068367
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(88533401597769372)
,p_interactive_grid_id=>wwv_flow_api.id(88317129024068367)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(88533502902769372)
,p_report_id=>wwv_flow_api.id(88533401597769372)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88534016483769377)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(88317213300068368)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>186
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88534479871769380)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(88317240162068369)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>203
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88534978485769382)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(88317425231068370)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>184
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88535504314769384)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(88317515651068371)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>215
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88535971194769385)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(88317580527068372)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88536492446769387)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(88317694278068373)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>124
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88537445160769390)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(88317934171068375)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88537989805769392)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(88318013141068376)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89198041290611269)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(88996210067356562)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91142512192002107)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(91136577170997335)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>107
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96230857222775489)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(94502728880610160)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96245312301124350)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(96239169585124101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97873691634502222)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(97867490256502001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97874355800502224)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(97867589434502002)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102426739201998688)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(102420673312998535)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(128122845885413761)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(128084968884179116)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(133197139515559159)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(133191114184558935)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(112682000000)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_execution_seq=>10.625
,p_name=>'FINALIZACION'
,p_background_color=>'#8BB4E3'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(97867490256502001)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('Finalizaci\00F3n')
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(142710000001)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_execution_seq=>11.25
,p_name=>'REVISANDO'
,p_background_color=>'#D1D43B'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(97867589434502002)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'SI'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(327363005266)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_execution_seq=>10
,p_name=>'PQR PRONTO A VENCER'
,p_background_color=>'#D69561'
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(96239169585124101)
,p_condition_operator=>'BETWEEN'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'0~5'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(425012009949)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_execution_seq=>12.5
,p_name=>'PQR VENCIDOS'
,p_background_color=>'#DE8A8A'
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(96239169585124101)
,p_condition_operator=>'LTE'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'0'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(761758009155)
,p_view_id=>wwv_flow_api.id(88533502902769372)
,p_execution_seq=>15
,p_name=>'PQR EN TERMINO'
,p_background_color=>'#64E878'
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(96239169585124101)
,p_condition_operator=>'GT'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'5'
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8903154209459668)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(84036633085768114)
,p_button_name=>'Consultar'
,p_button_static_id=>'btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13210351208760526)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_XML,P2_ID_RPRTE:<P_ID_MTVO>&P26_ID_MTVO.</P_ID_MTVO><P_ID_ESTDO>&P26_ESTDO.</P_ID_ESTDO><P_CDGO_RSPSTA>&P26_CDGO_RSPSTA.</P_CDGO_RSPSTA><P_NMR_RDCDO_DSPLAY>&P26_NMR_RDCDO_DSPLAY.</P_NMR_RDCDO_DSPLAY><P_FCHA_RDCDO_INCIO>&P26_FCHA_RDCDO_INCIO.</P_FCHA_RDCDO_INCIO><P_FCHA_RDCDO_FIN>&P26_FCHA_RDCDO_FIN.</P_FCHA_RDCDO_FIN><P_FCHA_PRYCTDA_INCIO>&P26_FCHA_PRYCTDA_INCIO.</P_FCHA_PRYCTDA_INCIO><P_FCHA_PRYCTDA_FIN>&P26_FCHA_PRYCTDA_FIN.</P_FCHA_PRYCTDA_FIN><P_FCHA_REAL_INCIO>&P26_FCHA_REAL_INCIO.</P_FCHA_REAL_INCIO><P_FCHA_REAL_FIN>&P26_FCHA_REAL_FIN.</P_FCHA_REAL_FIN><P_CDGO_RSPSTA>&P26_CDGO_RSPSTA.</P_CDGO_RSPSTA><ID_USRIO>&P26_USRIO.</ID_USRIO><P_NMRO_RDCDO_DSPLAY>&P26_NMRO_RDCDO_DSPLAY.</P_NMRO_RDCDO_DSPLAY>,&P26_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(16594069713846501)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13210714153760542)
,p_branch_name=>'Go To Page 17'
,p_branch_action=>'f?p=62000:17:&SESSION.::&DEBUG.:RP,17:P17_ID_PRCSO:9&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8903564812459668)
,p_name=>'P26_ID_MTVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>'<b>Motivo</b>'
,p_format_mask=>'DD/MM/YY'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,',
'       a.id_mtvo',
'  from pq_d_motivos a',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and a.actvo    = ''S'''))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el motivo que desea consultar'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8904437518459676)
,p_name=>'P26_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto de impuesto que desea consultar')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8905337479459676)
,p_name=>'P26_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>'<b>Estado</b>'
,p_format_mask=>'DD/MM/YY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_estdo',
' from pq_d_estados',
'where  cdgo_clnte = :F_CDGO_CLNTE',
'',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el Estado de la solicitudes que desea consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8906282697459681)
,p_name=>'P26_CDGO_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>'<b>Respuesta</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select dscrpcion, cdgo_rspsta from pq_d_respuestas'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8906639089459681)
,p_name=>'P26_FCHA_RDCDO_INCIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_placeholder=>'Radicado'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'P26_FCHA_RDCDO_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8907022390459681)
,p_name=>'P26_FCHA_RDCDO_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>'<b>Fecha Final</b>'
,p_placeholder=>'Radicado'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'P26_FCHA_RDCDO_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Selecione la fecha de radicado inicio y fin que desea consultar'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8907908084459682)
,p_name=>'P26_FCHA_PRYCTDA_INCIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_placeholder=>'Proyectada'
,p_source=>'P26_FCHA_PRYCTDA_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8908360803459682)
,p_name=>'P26_FCHA_PRYCTDA_FIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>'<b>Fecha Final</b>'
,p_placeholder=>'Proyectada'
,p_source=>'P26_FCHA_PRYCTDA_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Selecione la fecha proyectada de inicio y fin que desea consultar'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8909287174459683)
,p_name=>'P26_FCHA_REAL_INCIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_placeholder=>'Cierre'
,p_source=>'P26_FCHA_REAL_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8909649050459683)
,p_name=>'P26_FCHA_REAL_FIN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>'<b>Fecha Final</b>'
,p_placeholder=>'Cierre'
,p_source=>'P26_FCHA_REAL_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Selecione la fecha de cierre de inicio y fin que desea consultar'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8910566385459684)
,p_name=>'P26_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>unistr('<b>N\00BA Radicado</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8911317957459684)
,p_name=>'P26_ESTDO_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(84036633085768114)
,p_prompt=>'<b>Estado</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Normal;0,Vencida;1'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13205294426760490)
,p_name=>'Activar Imprimir'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P26_ID_RPRTE'
,p_condition_element=>'P26_ID_RPRTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P26_ID_RPRTE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13205736567760498)
,p_event_id=>wwv_flow_api.id(13205294426760490)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13206212244760511)
,p_event_id=>wwv_flow_api.id(13205294426760490)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13206617472760511)
,p_name=>unistr('Limpiar p\00E1gina')
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13207589966760514)
,p_name=>'New'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P26_FCHA_RDCDO_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13208082213760514)
,p_event_id=>wwv_flow_api.id(13207589966760514)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//$("#P26_FCHA_RDCDO_FIN").datepicker( {''minDate'': $("#P26_FCHA_RDCDO_INCIO").val()});',
'$("#P26_FCHA_RDCDO_FIN").datepicker(''option'' , ''minDate'' , $("#P26_FCHA_RDCDO_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13208442691760515)
,p_name=>'New_1'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P26_FCHA_PRYCTDA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13208906999760515)
,p_event_id=>wwv_flow_api.id(13208442691760515)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P26_FCHA_PRYCTDA_FIN").datepicker( ''option'' , ''minDate'' , $("#P26_FCHA_PRYCTDA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13209396759760515)
,p_name=>'New_1_1'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P26_FCHA_REAL_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13209882361760519)
,p_event_id=>wwv_flow_api.id(13209396759760515)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P26_FCHA_REAL_FIN").datepicker( ''option'' , ''minDate'' , $("#P26_FCHA_REAL_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13204523292760479)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujoGenerado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number;',
'    v_url varchar2(4000);',
'    v_id_instncia_fljo_gnrdo wf_g_instancias_flujo_gnrdo.id_instncia_fljo_gnrdo%Type;',
'    ',
'begin',
' begin',
'  apex_json.open_object(); ',
'   begin ',
'   select id_instncia_fljo_gnrdo_hjo into v_id_instncia_fljo_gnrdo from wf_g_instancias_flujo_gnrdo where id_instncia_fljo = v_id_instncia_fljo;',
'   exception when others then ',
'      apex_json.write(''type'', ''ERROR'');',
'      apex_json.write(''msg'', ''No existe flujo generado'');',
'      ',
'   end;       ',
'    ',
'    begin',
'    ',
'        select a.id_fljo_trea_orgen ',
'          into v_id_fljo_trea',
'          from wf_g_instancias_transicion a',
'         where a.id_instncia_fljo = v_id_instncia_fljo_gnrdo',
'           and a.id_estdo_trnscion in (1,2);',
'           ',
'    exception when no_data_found then',
'              ',
'              begin                   ',
'                  select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                    into v_id_fljo_trea',
'                    from wf_g_instancias_transicion ',
'                   where id_instncia_fljo = v_id_instncia_fljo_gnrdo;',
'                   ',
'              exception when no_data_found  then',
'                        v_id_fljo_trea := null;',
'              end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo_gnrdo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo_gnrdo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'        ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'        ',
'        else',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'        ',
'        end if;',
'        apex_json.close_object();',
'    ',
'    exception when others then ',
'      apex_json.open_object();',
'      apex_json.write(''type'', ''OK'');',
'      apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'      apex_json.close_object();',
'  end;',
'  ',
'  apex_json.close_all();',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13204807980760483)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number;',
'    v_url varchar2(4000);',
'    v_id_instncia_fljo_gnrdo wf_g_instancias_flujo_gnrdo.id_instncia_fljo_gnrdo%Type;',
'    ',
'begin',
' begin',
'  apex_json.open_object(); ',
'    ',
'    begin',
'    ',
'        select a.id_fljo_trea_orgen ',
'          into v_id_fljo_trea',
'          from wf_g_instancias_transicion a',
'         where a.id_instncia_fljo = v_id_instncia_fljo',
'           and a.id_estdo_trnscion in (1,2);',
'           ',
'    exception when no_data_found then',
'              ',
'              begin                   ',
'                  select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                    into v_id_fljo_trea',
'                    from wf_g_instancias_transicion ',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception when no_data_found  then',
'                        v_id_fljo_trea := null;',
'              end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'        ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'        ',
'        else',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'        ',
'        end if;',
'        apex_json.close_object();',
'    ',
'    exception when others then ',
'      apex_json.open_object();',
'      apex_json.write(''type'', ''OK'');',
'      apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'      apex_json.close_object();',
'  end;',
'  ',
'  apex_json.close_all();',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
