prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Consulta PQR'
,p_step_title=>'Consulta PQR'
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
,p_last_updated_by=>'RVILLALOBOS'
,p_last_upd_yyyymmddhh24miss=>'20210309170751'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74164932079714642)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>20
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
unistr('<b>1.</b> Consultar las solicitudes ingresadas en el m\00F3dulo de PQR mediante el enlace del n\00FAmero de radicado.<br><br>	'),
unistr('<b>2.</b> Direccionar al usuario al proceso en el que se encuentra la solicitud, mediante el bot\00F3n Ir a Flujo.<br><br>'),
unistr('<b>3.</b> Direccionar al usuario a la correspondencia radicada haciendo clic en el N\00B0Radicado <br><br>'),
unistr('<b>4.</b> Generar los reportes asociados al m\00F3dulo PQR, seleccionar el tipo de reporte a generar y hacer clic en el bot\00F3n imprimir.<br><br>	'),
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74890220042213327)
,p_plug_name=>'Consulta PQR'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select s.cdgo_clnte,',
'       s.nmro_rdcdo_dsplay,',
'       initcap(upper(r.prmer_nmbre || '' '' || r.prmer_aplldo)) nmbre_rdcdor,',
'       m.dscrpcion,',
'       e.dscrpcion dscrpcion_estdo,',
'       sms.idntfccion,',
'       i.nmbre_impsto,',
'       i.nmbre_impsto_sbmpsto,',
'       s.fcha_rdcdo,',
'       s.fcha_pryctda,',
'       s.fcha_real,  ',
'       case when s.fcha_real is not null ',
'            then 0',
'            when trunc(sysdate) >= trunc(cast (s.fcha_pryctda as date))',
'            then 0',
'            when trunc(sysdate) < trunc(cast (s.fcha_pryctda as date))',
'            then trunc(abs( cast(s.fcha_pryctda as date) - cast(sysdate as date) )) ',
'      end dias_faltantes,      ',
'       case when s.fcha_real is not null',
'            then 0 ',
'            when trunc(sysdate) > trunc(cast (s.fcha_pryctda as date))',
'            then trunc(abs( cast(s.fcha_pryctda as date) - cast(sysdate as date) ))',
'            else 0',
'       end dias_vencidos,',
'       case when trunc(sysdate) > trunc(cast (s.fcha_pryctda as date)) and  s.fcha_real is null',
'            then 1',
'            else 0',
'       end estdo, ',
'       s.id_instncia_fljo,',
'       rs.dscrpcion dscrpcion_rspsta',
'     from pq_g_solicitudes              s',
'     join v_sg_g_usuarios               u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                  e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo       sm  on sm.id_slctud = s.id_slctud',
'     join pq_d_motivos                  m   on m.id_mtvo = sm.id_mtvo',
'left join pq_g_slctdes_mtvo_sjt_impst   sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo      p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'left join v_df_i_impuestos_subimpuesto  i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'left join pq_d_respuestas               rs   on rs.cdgo_rspsta = s.cdgo_rspsta',
'   where s.cdgo_clnte = :F_CDGO_CLNTE ',
'    and s.id_usrio  = nvl(:P12_USRIO, s.id_usrio)',
'      and 0 = case when sms.idntfccion = :P12_IDNTFCCION ',
'                  then 0',
'                  when :P12_IDNTFCCION is null',
'                  then 0',
'                  when sms.idntfccion is not null and :P12_IDNTFCCION is not null and :P12_IDNTFCCION = sms.idntfccion',
'                  then 0',
'                  else 1',
'              end',
'     and m.id_mtvo = nvl(:P12_ID_MTVO, m.id_mtvo) ',
'     and e.id_estdo = nvl(:P12_ESTDO, e.id_estdo)',
'     and nvl(rs.cdgo_rspsta,0) = nvl(:P12_CDGO_RSPSTA, nvl(rs.cdgo_rspsta,0))',
'     and s.nmro_rdcdo_dsplay = nvl(:P12_NMRO_RDCDO_DSPLAY, s.nmro_rdcdo_dsplay)',
'     and (TRUNC(s.fcha_rdcdo)   >= TRUNC(TO_DATE(:P12_FCHA_RDCDO_INCIO,''DD/MM/YYYY'')) OR :P12_FCHA_RDCDO_INCIO IS NULL) ',
'     and (TRUNC(s.fcha_rdcdo)   <= TRUNC(TO_DATE(:P12_FCHA_RDCDO_FIN,''DD/MM/YYYY'')) OR :P12_FCHA_RDCDO_FIN IS NULL) ',
'     and (TRUNC(s.fcha_pryctda) >= TRUNC(TO_DATE(:P12_FCHA_PRYCTDA_INCIO,''DD/MM/YYYY'')) OR :P12_FCHA_PRYCTDA_INCIO IS NULL) ',
'     and (TRUNC(s.fcha_pryctda) <= TRUNC(TO_DATE(:P12_FCHA_PRYCTDA_FIN,''DD/MM/YYYY'')) OR :P12_FCHA_PRYCTDA_FIN IS NULL) ',
'     and (TRUNC(s.fcha_real)    >= TRUNC(TO_DATE(:P12_FCHA_REAL_INCIO,''DD/MM/YYYY'')) OR :P12_FCHA_REAL_INCIO IS NULL) ',
'     and (TRUNC(s.fcha_real)    <= TRUNC(TO_DATE(:P12_FCHA_REAL_FIN,''DD/MM/YYYY'')) OR :P12_FCHA_REAL_FIN IS NULL) ) a',
'     where a.estdo = nvl(:P12_ESTDO_S, a.estdo)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(75133467674308446)
,p_heading=>'Fecha'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(75133670216308448)
,p_heading=>'Datos del Tributo'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(119763730895583801)
,p_heading=>'Acciones'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(119763802234583802)
,p_heading=>'Datos de la solicitud'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70391595925310712)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Normal;0,Vencida;1'
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
 p_id=>wwv_flow_api.id(70391721756310714)
,p_name=>'DIAS_FALTANTES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_FALTANTES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Dias Faltantes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(70391877806310715)
,p_name=>'DIAS_VENCIDOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_VENCIDOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Dias Vencidos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(75132276938308434)
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
,p_group_id=>wwv_flow_api.id(119763802234583802)
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
 p_id=>wwv_flow_api.id(75132303800308435)
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
,p_group_id=>wwv_flow_api.id(75133670216308448)
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
 p_id=>wwv_flow_api.id(75132488869308436)
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
,p_group_id=>wwv_flow_api.id(75133670216308448)
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
 p_id=>wwv_flow_api.id(75132579289308437)
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
,p_group_id=>wwv_flow_api.id(75133670216308448)
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
 p_id=>wwv_flow_api.id(75132644165308438)
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
,p_group_id=>wwv_flow_api.id(119763802234583802)
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
 p_id=>wwv_flow_api.id(75132757916308439)
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
,p_group_id=>wwv_flow_api.id(119763730895583801)
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
 p_id=>wwv_flow_api.id(75132997809308441)
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
,p_group_id=>wwv_flow_api.id(75133467674308446)
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
 p_id=>wwv_flow_api.id(75133076779308442)
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
,p_group_id=>wwv_flow_api.id(75133467674308446)
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
 p_id=>wwv_flow_api.id(75811273705596628)
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
 p_id=>wwv_flow_api.id(77951640809237401)
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
,p_group_id=>wwv_flow_api.id(119763730895583801)
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
 p_id=>wwv_flow_api.id(81317792518850226)
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
,p_group_id=>wwv_flow_api.id(119763802234583802)
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
 p_id=>wwv_flow_api.id(89235736951238601)
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
,p_group_id=>wwv_flow_api.id(75133467674308446)
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
 p_id=>wwv_flow_api.id(120006177822799001)
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
,p_group_id=>wwv_flow_api.id(119763802234583802)
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
 p_id=>wwv_flow_api.id(75132192662308433)
,p_internal_uid=>75132192662308433
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
 p_id=>wwv_flow_api.id(75348465236009438)
,p_interactive_grid_id=>wwv_flow_api.id(75132192662308433)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(50050058123292)
,p_report_id=>wwv_flow_api.id(75348465236009438)
,p_view_type=>'CHART'
,p_chart_type=>'bar'
,p_chart_orientation=>'vertical'
,p_chart_stack=>'off'
);
wwv_flow_api.create_ig_report_chart_col(
 p_id=>wwv_flow_api.id(24432000001)
,p_view_id=>wwv_flow_api.id(50050058123292)
,p_column_type=>'LABEL'
,p_column_id=>wwv_flow_api.id(75132644165308438)
);
wwv_flow_api.create_ig_report_chart_col(
 p_id=>wwv_flow_api.id(165186000001)
,p_view_id=>wwv_flow_api.id(50050058123292)
,p_column_type=>'VALUE'
,p_column_id=>wwv_flow_api.id(77951640809237401)
,p_function=>'COUNT_DISTINCT'
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(75348566541009438)
,p_report_id=>wwv_flow_api.id(75348465236009438)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70401387764650301)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(70391595925310712)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70406698257882617)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(70391721756310714)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70407197230882620)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(70391877806310715)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75349080122009443)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(75132276938308434)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>186
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75349543510009446)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(75132303800308435)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75350042124009448)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(75132488869308436)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>184
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75350567953009450)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(75132579289308437)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>124
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75351034833009451)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(75132644165308438)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75351556085009453)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(75132757916308439)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>124
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75352508799009456)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(75132997809308441)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75353053444009458)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(75133076779308442)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76013104928851335)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(75811273705596628)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77957575830242173)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(77951640809237401)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>107
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83045920861015555)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(81317792518850226)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89241802840238754)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(89235736951238601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120012203153799225)
,p_view_id=>wwv_flow_api.id(75348566541009438)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(120006177822799001)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75133742202308449)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71804482016951559)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119104244745339001)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72685812514414337)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(75133742202308449)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(119104319729339002)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(119104244745339001)
,p_button_name=>'BTN_INCIAR_FLJO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva PQR'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16594069713846501)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(74164932079714642)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16594612941846507)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_XML,P2_ID_RPRTE:<data><P_ID_MTVO>&P12_ID_MTVO.</P_ID_MTVO><P_ID_ESTDO>&P12_ESTDO.</P_ID_ESTDO><P_NMR_RDCDO_DSPLAY>&P12_NMR_RDCDO_DSPLAY.</P_NMR_RDCDO_DSPLAY><P_FCHA_RDCDO_INCIO>&P12_FCHA_RDCDO_INCIO.</P_FCHA_RDCDO_INCIO><P_FCHA_RDCDO_FIN>&P12_FCHA_RDCDO_FIN.</P_FCHA_RDCDO_FIN><P_FCHA_PRYCTDA_INCIO>&P12_FCHA_PRYCTDA_INCIO.</P_FCHA_PRYCTDA_INCIO><P_FCHA_PRYCTDA_FIN>&P12_FCHA_PRYCTDA_FIN.</P_FCHA_PRYCTDA_FIN><P_FCHA_REAL_INCIO>&P12_FCHA_REAL_INCIO.</P_FCHA_REAL_INCIO><P_FCHA_REAL_FIN>&P12_FCHA_REAL_FIN.</P_FCHA_REAL_FIN><P_CDGO_RSPSTA>&P12_CDGO_RSPSTA.</P_CDGO_RSPSTA><ID_USRIO>&P12_USRIO.</ID_USRIO><P_NMRO_RDCDO_DSPLAY>&P12_NMRO_RDCDO_DSPLAY.</P_NMRO_RDCDO_DSPLAY></data>,&P12_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(16594069713846501)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(119104419981339003)
,p_branch_name=>'Go To Page 17'
,p_branch_action=>'f?p=62000:17:&SESSION.::&DEBUG.:RP,17:P17_ID_PRCSO:9&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(119104319729339002)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16594377214846504)
,p_name=>'P12_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(74164932079714642)
,p_prompt=>'Reporte'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte,',
'      id_rprte ',
'       from gn_d_reportes',
'where cdgo_rprte_grpo = ''PQR'' ',
'  and id_rprte  in (100 ,101, 635, 636) ;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccionar Reporte'
,p_field_template=>wwv_flow_api.id(71867060529951592)
,p_item_template_options=>'t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17202259261404802)
,p_name=>'P12_USRIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
,p_prompt=>'<b>Usuario</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro',
'     , id_usrio',
'from   v_sg_g_usuarios',
'where cdgo_clnte = :F_CDGO_CLNTE '))
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
 p_id=>wwv_flow_api.id(55012268038187501)
,p_name=>'P12_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70391678842310713)
,p_name=>'P12_ESTDO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Normal;0,Vencida;1'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75517207095287402)
,p_name=>'P12_ID_MTVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
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
 p_id=>wwv_flow_api.id(75517376184287403)
,p_name=>'P12_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
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
 p_id=>wwv_flow_api.id(75808511254596601)
,p_name=>'P12_FCHA_RDCDO_INCIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_placeholder=>'Radicado'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'P12_FCHA_RDCDO_INCIO'
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
 p_id=>wwv_flow_api.id(75808631659596602)
,p_name=>'P12_FCHA_PRYCTDA_INCIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_placeholder=>'Proyectada'
,p_source=>'P12_FCHA_PRYCTDA_INCIO'
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
 p_id=>wwv_flow_api.id(75808803913596604)
,p_name=>'P12_FCHA_REAL_INCIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_placeholder=>'Cierre'
,p_source=>'P12_FCHA_REAL_INCIO'
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
 p_id=>wwv_flow_api.id(85600886468204002)
,p_name=>'P12_FCHA_PRYCTDA_FIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
,p_prompt=>'<b>Fecha Final</b>'
,p_placeholder=>'Proyectada'
,p_source=>'P12_FCHA_PRYCTDA_INCIO'
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
 p_id=>wwv_flow_api.id(85600970905204003)
,p_name=>'P12_FCHA_REAL_FIN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
,p_prompt=>'<b>Fecha Final</b>'
,p_placeholder=>'Cierre'
,p_source=>'P12_FCHA_REAL_INCIO'
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
 p_id=>wwv_flow_api.id(87902469476878702)
,p_name=>'P12_FCHA_RDCDO_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
,p_prompt=>'<b>Fecha Final</b>'
,p_placeholder=>'Radicado'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'P12_FCHA_RDCDO_INCIO'
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
 p_id=>wwv_flow_api.id(119565824658447903)
,p_name=>'P12_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
,p_prompt=>unistr('<b>N\00BA Radicado</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(120006210335799002)
,p_name=>'P12_CDGO_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(75133742202308449)
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16595318823846514)
,p_name=>'Activar Imprimir'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_ID_RPRTE'
,p_condition_element=>'P12_ID_RPRTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P12_ID_RPRTE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16595425268846515)
,p_event_id=>wwv_flow_api.id(16595318823846514)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(16594069713846501)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16595782805846518)
,p_event_id=>wwv_flow_api.id(16595318823846514)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(16594069713846501)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55012382825187502)
,p_name=>unistr('Limpiar p\00E1gina')
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55012470741187503)
,p_event_id=>wwv_flow_api.id(55012382825187502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(75133742202308449)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56955989748600316)
,p_name=>'New'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_FCHA_RDCDO_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56956024225600317)
,p_event_id=>wwv_flow_api.id(56955989748600316)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//$("#P12_FCHA_RDCDO_FIN").datepicker( {''minDate'': $("#P12_FCHA_RDCDO_INCIO").val()});',
'$("#P12_FCHA_RDCDO_FIN").datepicker(''option'' , ''minDate'' , $("#P12_FCHA_RDCDO_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56956189165600318)
,p_name=>'New_1'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_FCHA_PRYCTDA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56956297068600319)
,p_event_id=>wwv_flow_api.id(56956189165600318)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P12_FCHA_PRYCTDA_FIN").datepicker( ''option'' , ''minDate'' , $("#P12_FCHA_PRYCTDA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56956336341600320)
,p_name=>'New_1_1'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_FCHA_REAL_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56956487042600321)
,p_event_id=>wwv_flow_api.id(56956336341600320)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P12_FCHA_REAL_FIN").datepicker( ''option'' , ''minDate'' , $("#P12_FCHA_REAL_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(77951789493237402)
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
 p_id=>wwv_flow_api.id(89249704487328301)
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
'           and a.id_estdo_trnscion in (1,2)',
'           and rownum = 1;',
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
