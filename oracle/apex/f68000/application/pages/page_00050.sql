prompt --application/pages/page_00050
begin
wwv_flow_api.create_page(
 p_id=>50
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>unistr('Edici\00F3n de Solicitud PQR')
,p_step_title=>unistr('Edici\00F3n de Solicitud PQR')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function callAjaxProcess(documentoId, motivoId) {',
'    try {',
'        let rs = await apex.server.process("Eliminardocumento", {',
unistr('            x01: documentoId,  // Primer par\00E1metro: ID del documento'),
unistr('            x02: motivoId     // Segundo par\00E1metro: ID del motivo del documento'),
'        });',
'',
'        // Verificar el tipo de respuesta',
'        if (rs.type === ''OK'') {',
'            console.log(''Respuesta exitosa: '');',
'            Swal.fire({',
'                icon: ''success'',  // Cambiado a ''success''',
'                title: ''<h2>Documento eliminado.</h2>'',',
'                text: rs.msg',
'            });',
'        } else {',
'            console.log(''Respuesta error: '');',
'            Swal.fire({',
'                icon: ''error'',',
'                title: ''<h2>Error.</h2>'',',
'                text: rs.msg',
'            });',
'        }',
'',
unistr('        // Actualizar la regi\00F3n solo una vez'),
'        apex.region("documentos").refresh();',
'',
'    } catch (error) {',
'        console.error(''Error en el proceso AJAX:'', error);',
'        Swal.fire({',
'            icon: ''error'',',
'            title: ''<h2>Error.</h2>'',',
'            text: ''Se produjo un error al procesar la solicitud.''',
'        });',
'    }',
'}',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var respuesta = $v("P50_RSPTA");',
'',
'  // Verifica si el valor es ''N''',
'  if (respuesta === "N") {',
'    // Lanza el SweetAlert2',
'    Swal.fire({',
'      icon: ''warning'',',
unistr('      title: ''Motivo de solicitud no v\00E1lido'','),
'      text: ''No se puede editar esta solicitud.'',',
'      confirmButtonText: ''Aceptar''',
'    });',
'  }'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_VLDAR {',
'    padding: 0.3rem !important;',
'}'))
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250425165717'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4699018482826302)
,p_plug_name=>'ayuda'
,p_region_name=>'radicador'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>90
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
unistr('<b>1.</b> Actualizar las solicitudes ingresadas en el m\00F3dulo de PQR con motivo <b>solitud de acuerdo de pago</b>.<br><br>'),
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8843581890431406)
,p_plug_name=>'Consulta'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8993836491091997)
,p_plug_name=>'Tabulador'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81738427187908385)
,p_plug_name=>'Datos del Sujeto Pasivo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpo ',
'  from v_pq_g_solicitudes',
'  where NMRO_RDCDO_DSPLAY = :P50_NMRO_RDCDO',
'  and :P50_RSPTA <> ''N'';'))
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81831321501076316)
,p_plug_name=>'Datos del Solicitante'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpo ',
'  from v_pq_g_solicitudes',
'  where NMRO_RDCDO_DSPLAY = :P50_NMRO_RDCDO',
'  and :P50_RSPTA <> ''N'';'))
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>',
'',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81868237858231613)
,p_plug_name=>'Opciones'
,p_region_name=>'radicador'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>80
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
'',
'',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P50_RSPTA <> ''N'';'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82000079381252025)
,p_plug_name=>'Datos Solicitud'
,p_region_name=>'radicador'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpo ',
'  from v_pq_g_solicitudes',
'  where NMRO_RDCDO_DSPLAY = :P50_NMRO_RDCDO',
'  and :P50_RSPTA <> ''N'';'))
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101676338498406238)
,p_plug_name=>'PQR Historicos'
,p_region_name=>'PQR_HISTORICOS'
,p_parent_plug_id=>wwv_flow_api.id(82000079381252025)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select s.cdgo_clnte,',
'       s.id_slctud,     ',
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
'       rs.dscrpcion dscrpcion_rspsta,',
'       s.obsrvcion_rspsta,',
'       p.dscrpcion tpo_prsntcion',
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
'   where s.cdgo_clnte = :F_CDGO_CLNTE',
'      and sms.idntfccion = :P50_IDNTFCCION_SJTO)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101676531917406240)
,p_name=>'NMRO_RDCDO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Radicado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(101676615776406241)
,p_name=>'NMBRE_RDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RDCDOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101676746705406242)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>400
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
 p_id=>wwv_flow_api.id(101676836358406243)
,p_name=>'DSCRPCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(101676928628406244)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(101677042706406245)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nmbre Impsto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(101677135205406246)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(101677269007406247)
,p_name=>'FCHA_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RDCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Radicaci\00F3n')
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101677347799406248)
,p_name=>'FCHA_PRYCTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRYCTDA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Pryctda'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101677421897406249)
,p_name=>'FCHA_REAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_REAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Real'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101677476757406250)
,p_name=>'DIAS_FALTANTES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_FALTANTES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Dias Faltantes'
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
 p_id=>wwv_flow_api.id(101677647855406251)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Estdo'
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
 p_id=>wwv_flow_api.id(101677676636406252)
,p_name=>'DSCRPCION_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(101677914127406254)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Slctud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101678056382406255)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cdgo Clnte'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101678117983406256)
,p_name=>'DIAS_VENCIDOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_VENCIDOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Dias Vencidos'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(101678188952406257)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Instncia Fljo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101678282560406258)
,p_name=>'OBSRVCION_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_api.id(101678958480406264)
,p_name=>'TPO_PRSNTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_PRSNTCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Presentaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>20
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
 p_id=>wwv_flow_api.id(101676417781406239)
,p_internal_uid=>101676417781406239
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(101703204503530886)
,p_interactive_grid_id=>wwv_flow_api.id(101676417781406239)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(101703367138530886)
,p_report_id=>wwv_flow_api.id(101703204503530886)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8959812687068989)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(101678958480406264)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101703771038530888)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(101676531917406240)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101704299557530890)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(101676615776406241)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101704776454530892)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(101676746705406242)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>325
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101705307024530894)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(101676836358406243)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83.47499771118164
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101705790122530896)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(101676928628406244)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>194
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101706298614530898)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(101677042706406245)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>233
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101706820497530900)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(101677135205406246)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>195.15
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101707368108530902)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(101677269007406247)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>167.075
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101707802857530904)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(101677347799406248)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101708293666530906)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(101677421897406249)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101708783747530908)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(101677476757406250)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101709283603530910)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(101677647855406251)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101709824511530912)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(101677676636406252)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101710357297530914)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(101677914127406254)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101710775398530915)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(101678056382406255)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101711294203530918)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(101678117983406256)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101711857089530920)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(101678188952406257)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101712294612530922)
,p_view_id=>wwv_flow_api.id(101703367138530886)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(101678282560406258)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68.39997940063476
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(239289767932034456)
,p_plug_name=>'Documentos'
,p_region_name=>'documentos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion     ',
'     , d.file_blob',
'     , md.dscrpcion_dcmnto',
'     , ''<a href="javascript:callAjaxProcess('''''' || d.id_dcmnto || '''''', '''''' || md.id_mtvo || '''''');" class="fa fa-trash-o" data-id="'' || d.id_dcmnto || ''" data-id-mtvo="'' || md.id_mtvo || ''"></a>'' AS Borrar',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P50_ID_SLCTUD ',
'        and md.actvo = ''S'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpo ',
'  from v_pq_g_solicitudes',
'  where NMRO_RDCDO_DSPLAY = :P50_NMRO_RDCDO',
'  and :P50_RSPTA <> ''N'';'))
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
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(9147468671588641)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JADIES'
,p_internal_uid=>9147468671588641
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4656251694307931)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4656669680307932)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4657014889307932)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4657426590307932)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Obsrvcion'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4657838466307933)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'File Blob'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4658230430307933)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Dscrpcion Dcmnto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4658612376307933)
,p_db_column_name=>'BORRAR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Borrar'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(9213316652108789)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'46590'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:OBSRVCION:DSCRPCION_DCMNTO:BORRAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81849830024157703)
,p_plug_name=>'Documentos1'
,p_parent_plug_id=>wwv_flow_api.id(239289767932034456)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P50_ID_SLCTUD'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="row">',
'        <div  class="col col-2" style="text-align: left !important;">',
'            <font size="4" color="black">Cargar documentos</font>',
'        </div>',
'</div>',
'<br>'))
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82294101937230906)
,p_plug_name=>'Documentos2'
,p_parent_plug_id=>wwv_flow_api.id(81849830024157703)
,p_region_template_options=>'#DEFAULT#:margin-top-lg'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_mtvo_dcmnto',
'    , dscrpcion_dcmnto',
'    , blob001 file_blob',
'    , c002 file_name',
'    , c001 obsrvcion,',
'    case',
'        when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'        else  ''Pendiente''',
'    end Estado,',
'    m.dscrpcion_indcdor_oblgtrio       ',
'from v_pq_d_motivos_documento m',
'left join apex_collections    c on id_mtvo_dcmnto = n001    ',
'  and collection_name = ''DOCUMENTOS''',
'where id_mtvo = :P50_ID_MTVO',
' and m.actvo =''S'''))
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
 p_id=>wwv_flow_api.id(82295960650230924)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>82295960650230924
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4665737823307941)
,p_db_column_name=>'ID_MTVO_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Mtvo Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4666175878307941)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4666565254307942)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Archivo'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4666915551307942)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4667376034307942)
,p_db_column_name=>'ESTADO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4667737203307942)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4668173768307942)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\00BFObligatorio?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(82399609070523713)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'46685'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:ESTADO::FILE_NAME:DSCRPCION_INDCDOR_OBLGTRIO'
,p_sort_column_1=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(4668920911307943)
,p_report_id=>wwv_flow_api.id(82399609070523713)
,p_name=>'Obligatorio'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_operator=>'='
,p_expr=>'Si'
,p_condition_sql=>' (case when ("DSCRPCION_INDCDOR_OBLGTRIO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Si''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#D0F1CD'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4614367082307896)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(81868237858231613)
,p_button_name=>'BTN_ACTUALIZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpo ',
'  from v_pq_g_solicitudes',
'  where NMRO_RDCDO_DSPLAY = :P50_NMRO_RDCDO;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7603335943515801)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(81868237858231613)
,p_button_name=>'BTN_EDTAR_DTO_SLCTUD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Editar datos de la solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP:P33_NMRO_RDCCION:&P50_NMRO_RDCDO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(s.id_slctud)       ',
'     from pq_g_solicitudes                    s',
'     join pq_g_solicitantes                   b   on s.id_slctud = b.id_slctud',
'     join v_sg_g_usuarios                     u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                        e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                      r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo             sm  on sm.id_slctud = s.id_slctud',
'     join pq_d_motivos                        m   on m.id_mtvo = sm.id_mtvo',
'     left join pq_g_slctdes_mtvo_sjt_impst    sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo            p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'     left join v_df_i_impuestos_subimpuesto   i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'     left join pq_d_respuestas                rs  on rs.cdgo_rspsta = s.cdgo_rspsta',
'     join si_c_terceros                       aa  on aa.id_trcro = u.id_trcro',
'     join wf_g_instancias_flujo               bb  on bb.id_instncia_fljo=s.id_instncia_fljo',
'     join wf_g_instancias_flujo_gnrdo         z   on z.id_instncia_fljo = s.id_instncia_fljo',
'     join wf_g_instancias_transicion          v   on z.id_instncia_fljo_gnrdo_hjo = v.id_instncia_fljo and v.id_estdo_trnscion != 3',
'     join wf_d_flujos_transicion              x   on x.id_fljo_trea = v.id_fljo_trea_orgen',
'     join wf_d_flujos_tarea                   cc  on cc.id_fljo_trea = x.id_fljo_trea',
'     left join v_wf_d_flujos_tarea_prtcpnte   zz  on zz.id_fljo = m.id_fljo and zz.id_prtcpte = v.id_usrio',
'   where s.cdgo_clnte = :F_CDGO_CLNTE',
'     and cc.indcdor_incio =''S'' ',
'     and m.edta_slctud = ''S''',
'     and s.nmro_rdcdo_dsplay = :P50_NMRO_RDCDO',
'     and e.id_estdo not in (5,9)',
'     and :F_ID_USRIO in (230042,230137);'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4615478711307897)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(8843581890431406)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>8
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4642044539307922)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(81831321501076316)
,p_button_name=>'BTN_COPIAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Copiar Datos del Sujeto Pasivo'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-copy'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4616502385307899)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(82000079381252025)
,p_button_name=>'BTN_CNSLTA_PRMTROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4659718921307937)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(81849830024157703)
,p_button_name=>'BTN_SCANNER'
,p_button_static_id=>'BTN_SCANNER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Escaner'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4660144772307938)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(81849830024157703)
,p_button_name=>'BTN_AGRGAR'
,p_button_static_id=>'BTN_AGRGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Cargar este Archivo?'',''BTN_AGRGAR'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4616978422307899)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(82000079381252025)
,p_button_name=>'BTN_VLDAR'
,p_button_static_id=>'BTN_VLDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>wwv_flow_api.id(71867586854951593)
,p_button_image_alt=>'Validar Sujeto'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
,p_grid_column_attributes=>'style="margin-top:10px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4617323687307900)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(82000079381252025)
,p_button_name=>'BTN_DSCRGAR'
,p_button_static_id=>'BTN_DSCRGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-down'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4615802710307897)
,p_name=>'P50_NMRO_RDCDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8843581890431406)
,p_prompt=>'<b>Numero de radicado</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4617748798307900)
,p_name=>'P50_ID_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4618169273307900)
,p_name=>'P50_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4618535215307900)
,p_name=>'P50_ID_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tipo de PQR que corresponda.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4619416052307902)
,p_name=>'P50_ID_PRSNTCION_TPO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,',
'       a.id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo a',
'  join pq_d_tipos_presentacion b',
'    on b.id_prsntcion_tpo = a.id_prsntcion_tpo',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.actvo = ''S''',
'   and b.id_tpo = :P50_ID_TPO',
'  order by a.id_prsntcion_tpo '))
,p_lov_cascade_parent_items=>'P50_ID_TPO'
,p_ajax_items_to_submit=>'P50_ID_PRSNTCION_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione la forma de presentaci\00F3n de la solicitud.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4620391916307903)
,p_name=>'P50_ID_MTVO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_prompt=>'Motivo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and actvo      = ''S''',
'   and id_tpo    = :P50_ID_TPO ',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P50_ID_TPO'
,p_ajax_items_to_submit=>'P50_ID_TPO,P50_ID_MTVO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el motivo y valide en el bot\00F3n de descarga si el motivo tiene documentos requeridos.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4621267244307903)
,p_name=>'P50_FCHA_RDCDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4621655376307904)
,p_name=>'P50_ID_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo por el que se hace la solicitud.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4622528069307904)
,p_name=>'P50_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P50_ID_IMPSTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P50_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el Sub-tributo por el que se hace la solicitud.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4623404985307905)
,p_name=>'P50_IDNTFCCION_SJTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')"onkeyup="campoMayuscula(this)" '
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n del sujeto tributo y haga clic en el bot\00F3n validar sujeto.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4624319975307906)
,p_name=>'P50_JSON'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4624770774307906)
,p_name=>'P50_EXPDNTE_FSCLZCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_prompt=>unistr('Expediente de Fiscalizaci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select --a.nmro_expdnte ||'' - ''|| to_char(a.fcha_aprtra, ''DD/MM/YYYY'') as d,',
'       a.nmro_expdnte||'' - ''||f.dscrpcion||'' - ''||e.nmro_acto_dsplay as d,',
'       --a.nmro_expdnte as r ',
'       d.id_fsclzcion_expdnte_acto as r',
'from fi_g_fiscalizacion_expdnte a',
'join fi_g_candidatos b on b.id_cnddto = a.id_cnddto',
'join v_si_i_sujetos_impuesto c on c.id_sjto_impsto = b.id_sjto_impsto',
'join fi_g_fsclzcion_expdnte_acto d on d.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'join gn_g_actos e on e.id_acto = d.id_acto',
'join gn_d_actos_tipo f on f.id_acto_tpo = e.id_acto_tpo',
'where c.idntfccion_sjto = :P50_IDNTFCCION_SJTO',
'  and a.cdgo_expdnte_estdo = ''ABT''',
'  and f.cdgo_acto_tpo in (''ROO'', ''RE'')',
';'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Indica si el motivo requiere asociar un expediente de Fiscalizaci\00F3n.')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4625679097307906)
,p_name=>'P50_XML'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4626092073307907)
,p_name=>'P50_OBSRVCION_S'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_prompt=>unistr('Observaci\00F3n de la solicitud')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_colspan=>10
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4626439816307907)
,p_name=>'P50_VLDAR_TRBTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4626864373307907)
,p_name=>'P50_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4635991686307918)
,p_name=>'P50_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(81738427187908385)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4636345709307919)
,p_name=>'P50_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(81738427187908385)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de identificaci\00F3n presentada por el gestor de la solicitud.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4637233180307919)
,p_name=>'P50_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(81738427187908385)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Escriba el n\00FAmero de identificaci\00F3n de la persona que gestiona la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4638172355307920)
,p_name=>'P50_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(81738427187908385)
,p_prompt=>unistr('Primer Nombre o Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el primer nombre del gestor de la solicitud.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4639033507307920)
,p_name=>'P50_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(81738427187908385)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el segundo nombre del gestor de la solicitud.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4639993290307921)
,p_name=>'P50_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(81738427187908385)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el Primer Apellido del gestor de la solicitud.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4640870717307921)
,p_name=>'P50_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(81738427187908385)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el segundo apellido del gestor de la solicitud.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4642405247307922)
,p_name=>'P50_CDGO_RSPNSBLE_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>'Tipo Solicitante'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo',
'  where cdgo_rspnsble_tpo not in (''R'',''CO'',''RF'',''RS'')'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la relaci\00F3n del solicitante con el sujeto del tributo.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4643308416307922)
,p_name=>'P50_CDGO_IDNTFCCION_TPO_S'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de identificaci\00F3n presentada por el gestor de la solicitud.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4644285576307923)
,p_name=>'P50_IDNTFCCION_S'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>19
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n del solicitante.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4645140351307923)
,p_name=>'P50_PRMER_NMBRE_S'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el primer nombre del solicitante.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4646046745307924)
,p_name=>'P50_SGNDO_NMBRE_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el segundo nombre del solicitante.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4646984973307925)
,p_name=>'P50_PRMER_APLLDO_S'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el primer apellido del solicitante.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4647859635307925)
,p_name=>'P50_SGNDO_APLLDO_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el segundo apellido del solicitante.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4648712349307925)
,p_name=>'P50_ID_PAIS_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>unistr('Pa\00EDs')
,p_source=>'&F_ID_PAIS_CLNTE.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el pa\00EDs de notificaci\00F3n donde se encuentra el solicitante')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4649645916307926)
,p_name=>'P50_ID_DPRTMNTO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto',
'     , id_dprtmnto ',
'  from df_s_departamentos ',
' where id_pais = :P50_ID_PAIS_NTFCCION_S;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P50_ID_PAIS_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el departamento de notificaci\00F3n donde se encuentra el solicitante')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4650535853307926)
,p_name=>'P50_ID_MNCPIO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio',
'     , id_mncpio ',
'  from df_s_municipios ',
' where id_dprtmnto = :P50_ID_DPRTMNTO_NTFCCION_S'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P50_ID_DPRTMNTO_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el municipio de notificaci\00F3n donde se encuentra el solicitante.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4651462063307927)
,p_name=>'P50_DRCCION_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la direcci\00F3n de notificaci\00F3n del solicitante')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4652336249307927)
,p_name=>'P50_EMAIL_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el correo electr\00F3nico del solicitante')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4653223349307928)
,p_name=>'P50_NTFCA_EMIL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>unistr('\00BFAutoriza notificaci\00F3n v\00EDa correo electr\00F3nico?')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:SI;S,NO;N'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_output=>'N'
,p_help_text=>unistr('Marcar si, si autoriza el ser notificado v\00EDa correo electr\00F3nico.')
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4654199890307929)
,p_name=>'P50_TLFNO_S'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>7
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de tel\00E9fono local del solicitante ')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4655059391307929)
,p_name=>'P50_CLLAR_S'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(81831321501076316)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>10
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de celular del solicitante')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4660566422307938)
,p_name=>'P50_ID_MTVO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(81849830024157703)
,p_prompt=>'Documentos'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_dcmnto',
'     , id_mtvo_dcmnto',
'  from v_pq_d_motivos_documento',
' where id_mtvo = :P50_ID_MTVO',
'       and actvo = ''S''',
'  ',
' '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P50_ID_MTVO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de documento que se requiere adjuntar para la solicitud.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4661467160307938)
,p_name=>'P50_OPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(81849830024157703)
,p_item_default=>'F'
,p_prompt=>unistr('Opci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Explorador de Archivos;F'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione una de las opciones para adjuntar el documento a la solicitud.'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4662362769307939)
,p_name=>'P50_FILE_BLOB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(81849830024157703)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Habilita ventana de b\00FAsqueda para ingresar el documento adjunto correspondiente.')
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4663256473307939)
,p_name=>'P50_OBSRVCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(81849830024157703)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>99
,p_cHeight=>2
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la observaci\00F3n correspondiente a la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4664158282307940)
,p_name=>'P50_NMRO_FLIO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(81849830024157703)
,p_item_default=>'1'
,p_prompt=>unistr('N\00FAmero de Folios')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>10
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de documentos f\00EDsicos recibidos en la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4665083561307940)
,p_name=>'P50_ID_DCMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(81849830024157703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4744404699650101)
,p_name=>'P50_ID_INSTNCIA_FLJO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5045777484620801)
,p_name=>'P50_ID_FLJO_TREA'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(82000079381252025)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7756088275552502)
,p_name=>'P50_RSPTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8843581890431406)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4753401990707423)
,p_computation_sequence=>10
,p_computation_item=>'P50_ID_DCMNTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>':P50_ID_DCMNTO := null;'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4874877075557206)
,p_computation_sequence=>10
,p_computation_item=>'P50_EXPDNTE_FSCLZCION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_expdnte||'' - ''||f.dscrpcion||'' - ''||e.nmro_acto_dsplay ',
'from fi_g_fiscalizacion_expdnte a',
'join fi_g_candidatos b on b.id_cnddto = a.id_cnddto',
'join v_si_i_sujetos_impuesto c on c.id_sjto_impsto = b.id_sjto_impsto',
'join fi_g_fsclzcion_expdnte_acto d on d.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'join gn_g_actos e on e.id_acto = d.id_acto',
'join gn_d_actos_tipo f on f.id_acto_tpo = e.id_acto_tpo',
'where d.id_slctud_rqrmnto = :P50_ID_SLCTUD',
';'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5021025572309104)
,p_computation_sequence=>10
,p_computation_item=>'P50_OBSRVCION_S'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>':P50_OBSRVCION_S := null;'
,p_compute_when=>'P50_FILE_BLOB'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4674132145307947)
,p_name=>'al cambiar la identificacion'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_IDNTFCCION,P50_CDGO_IDNTFCCION_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4674642913307948)
,p_event_id=>wwv_flow_api.id(4674132145307947)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function BuscarRadicador() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'            await apex.server.process("BuscarRadicador", {',
'            pageItems: "#P50_CDGO_IDNTFCCION_TPO,#P50_IDNTFCCION"',
'        }).then(function (resp) {',
'            Object.keys(resp).forEach((f) => {',
'                apex.item(''P50_'' + f).setValue(('''' + resp[f]).trim());',
'            });',
'        }',
'        );',
'      ',
'',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'BuscarRadicador();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4807706377927616)
,p_name=>'al dar clic en BTN_AGRGAR'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4660144772307938)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4807806897927617)
,p_event_id=>wwv_flow_api.id(4807706377927616)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Agregar_archivos() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        // Espera la respuesta del proceso del servidor',
'        let res = await apex.server.process("Agregar_archivos", {});',
'        ',
'        // Verifica el tipo de respuesta',
'        if (res && res.type === ''OK'') {',
'            console.log(''Respuesta exitosa: '');',
'            ',
unistr('            // Muestra un mensaje de \00E9xito con SweetAlert'),
'            Swal.fire({',
'                icon: ''success'',  // Cambiado a ''success''',
'                title: ''<h2>Documento agregado.</h2>'',',
'                text: res.msg',
'            });',
'            ',
'            // Itera sobre la respuesta y establece los valores de los elementos',
'            Object.keys(res).forEach((f) => {',
'                apex.item(''P50_'' + f).setValue(('''' + res[f]).trim());',
'            });',
'',
'        } else {',
'            console.log(''Respuesta error: '');',
'            ',
'            // Muestra un mensaje de error con SweetAlert',
'            Swal.fire({',
'                icon: ''error'',',
'                title: ''<h2>Error.</h2>'',',
'                text: res ? res.msg : ''Se produjo un error desconocido.''',
'            });',
'        }',
'',
unistr('        // Actualiza la regi\00F3n'),
'        apex.region("documentos").refresh();',
'        ',
'    } catch (error) {',
'        console.log("Error:", error);',
'        ',
unistr('        // Muestra un mensaje de error con SweetAlert en caso de excepci\00F3n'),
'        Swal.fire({',
'            icon: ''error'',',
'            title: ''<h2>Error.</h2>'',',
'            text: ''Se produjo un error al procesar la solicitud.''',
'        });',
'    } finally {',
unistr('        // Aseg\00FArate de eliminar el popup de espera'),
'        if ($waitPopup) {',
'            $waitPopup.remove();',
'        }',
'    }',
'}',
'',
unistr('// Llama a la funci\00F3n'),
'Agregar_archivos();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4874611249557204)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar Datos de la coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'if apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') then ',
'    apex_collection.delete_collection( p_collection_name => ''DOCUMENTOS'');            ',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'PAGELOAD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4672182547307946)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar_archivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob blob;',
'     v_seq  varchar2(4000);',
'     r_temp_files apex_application_temp_files%rowtype;',
'begin',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P50_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') ) then',
'            apex_collection.create_collection( p_collection_name => ''DOCUMENTOS'');',
'        end if;',
'',
'        begin',
'            select seq_id',
'              into v_seq',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS''',
'               and n001 = :P50_ID_MTVO_DCMNTO;',
'            ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 => :P50_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P50_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_c001 => :P50_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P50_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        end;       ',
'    end if;',
'end;'))
,p_process_error_message=>'No se encontro archivo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4660144772307938)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4672573542307946)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'',
'    pkg_pq_pqr.prc_ac_solicitud_pqr(  p_id_tpo      			  => :P50_ID_TPO 				',
'                                    , p_id_usrio                  => :F_ID_USRIO',
'                                    , p_id_prsntcion_tpo          => :P50_ID_PRSNTCION_TPO',
'                                    , p_cdgo_clnte                => :F_CDGO_CLNTE',
'                                    , p_id_instncia_fljo          => :P50_ID_INSTNCIA_FLJO    ',
'                                    , p_nmro_flio                 => :P50_NMRO_FLIO',
'                                    , p_id_rdcdor                 => :P50_ID_RDCDOR               ',
'                                    , p_cdgo_rspnsble_tpo         => :P50_CDGO_RSPNSBLE_TPO       ',
'                                    , p_cdgo_idntfccion_tpo       => :P50_CDGO_IDNTFCCION_TPO     ',
'                                    , p_idntfccion                => :P50_IDNTFCCION              ',
'                                    , p_prmer_nmbre               => :P50_PRMER_NMBRE             ',
'                                    , p_sgndo_nmbre               => :P50_SGNDO_NMBRE             ',
'                                    , p_prmer_aplldo              => :P50_PRMER_APLLDO            ',
'                                    , p_sgndo_aplldo              => :P50_SGNDO_APLLDO            ',
'                                    , p_cdgo_idntfccion_tpo_s     => :P50_CDGO_IDNTFCCION_TPO_S   ',
'                                    , p_idntfccion_s              => :P50_IDNTFCCION_S            ',
'                                    , p_prmer_nmbre_s             => :P50_PRMER_NMBRE_S           ',
'                                    , p_sgndo_nmbre_s             => :P50_SGNDO_NMBRE_S           ',
'                                    , p_prmer_aplldo_s            => :P50_PRMER_APLLDO_S          ',
'                                    , p_sgndo_aplldo_s            => :P50_SGNDO_APLLDO_S          ',
'                                    , p_id_pais_ntfccion          => :P50_ID_PAIS_NTFCCION_S       ',
'                                    , p_id_dprtmnto_ntfccion      => :P50_ID_DPRTMNTO_NTFCCION_S    ',
'                                    , p_id_mncpio_ntfccion        => :P50_ID_MNCPIO_NTFCCION_S',
'                                    , p_drccion_ntfccion          => :P50_DRCCION_NTFCCION_S',
'                                    , p_email                     => :P50_EMAIL_S',
'                                    , p_tlfno                     => :P50_TLFNO_S',
'                                    , p_cllar                     => :P50_CLLAR_S                               ',
'                                    , p_id_motivo                 => :P50_ID_MTVO',
'                                    , p_idntfccion_sjto           => :P50_IDNTFCCION_SJTO  ',
'                                    , p_id_impsto                 => :P50_ID_IMPSTO ',
'                                    , p_id_impsto_sbmpsto         => :P50_ID_IMPSTO_SBMPSTO',
'                                    , p_obsrvcion                 => :P50_OBSRVCION_S',
'                                    , p_fcha_rdcdo                => null--:P50_FCHA_RDCDO -- req. 0023223',
'                                    , p_ntfca_emil                => :P50_NTFCA_EMIL',
'                                    , p_id_fljo_trea              => :P50_ID_FLJO_TREA',
'                                    , o_cdgo_rspsta               => v_cdgo_rspsta',
'                                    , o_mnsje_rspsta              => v_mnsje_rspsta);',
'',
'    if(v_cdgo_rspsta != 0) then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4614367082307896)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4670554761307945)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P50_FILE_BLOB is null then',
'        select id_tpo',
'             , id_mtvo',
'             , id_impsto',
'             , id_impsto_sbmpsto',
'             , idntfccion',
'             , id_rdcdor',
'             , id_slctud',
'             , id_prsntcion_tpo',
'             , fcha_rdcdo',
'             , nmro_rdcdo_dsplay',
'             , id_instncia_fljo',
'             ,''S''',
'           into :P50_ID_TPO',
'             , :P50_ID_MTVO',
'             , :P50_ID_IMPSTO',
'             , :P50_ID_IMPSTO_SBMPSTO',
'             , :P50_IDNTFCCION_SJTO',
'             , :P50_ID_RDCDOR',
'             , :P50_ID_SLCTUD',
'             , :P50_ID_PRSNTCION_TPO',
'             , :P50_FCHA_RDCDO',
'             , :P50_NMRO_RDCDO_DSPLAY',
'             , :P50_ID_INSTNCIA_FLJO',
'             , :P50_RSPTA',
'          from v_pq_g_solicitudes',
'          where NMRO_RDCDO_DSPLAY = :P50_NMRO_RDCDO',
'          and edta_slctud = ''S'';',
'    end if;',
'exception',
'    when others then',
'        :P50_Rspta := ''N'';',
unistr('        --raise_application_error(-20001, ''Motivo de solicitud no valido para edici\00F3n de solicitud'');'),
'        ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P50_NMRO_RDCDO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4669752071307944)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'if :P50_FILE_BLOB is null then',
'    select cdgo_idntfccion_tpo',
'         , idntfccion ',
'         , prmer_nmbre ',
'         , sgndo_nmbre ',
'         , prmer_aplldo ',
'         , sgndo_aplldo',
'      into :P50_CDGO_IDNTFCCION_TPO',
'         , :P50_IDNTFCCION',
'         , :P50_PRMER_NMBRE',
'         , :P50_SGNDO_NMBRE',
'         , :P50_PRMER_APLLDO',
'         , :P50_SGNDO_APLLDO',
'      from pq_g_radicador',
'     where id_rdcdor = :P50_ID_RDCDOR;',
'end if;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P50_NMRO_RDCDO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4670174674307945)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'if :P50_FILE_BLOB is null then',
'    select cdgo_rspnsble_tpo',
'         , cdgo_idntfccion_tpo ',
'         , idntfccion ',
'         , prmer_nmbre ',
'         , sgndo_nmbre ',
'         , prmer_aplldo ',
'         , sgndo_aplldo ',
'         , id_pais_ntfccion ',
'         , id_dprtmnto_ntfccion ',
'         , id_mncpio_ntfccion ',
'         , drccion_ntfccion ',
'         , email ',
'         , tlfno ',
'         , cllar',
'         , ntfca_emil',
'      into :P50_CDGO_RSPNSBLE_TPO ',
'         , :P50_CDGO_IDNTFCCION_TPO_S ',
'         , :P50_IDNTFCCION_S',
'         , :P50_PRMER_NMBRE_S',
'         , :P50_SGNDO_NMBRE_S ',
'         , :P50_PRMER_APLLDO_S',
'         , :P50_SGNDO_APLLDO_S',
'         , :P50_ID_PAIS_NTFCCION_S',
'         , :P50_ID_DPRTMNTO_NTFCCION_S',
'         , :P50_ID_MNCPIO_NTFCCION_S',
'         , :P50_DRCCION_NTFCCION_S',
'         , :P50_EMAIL_S',
'         , :P50_TLFNO_S',
'         , :P50_CLLAR_S',
'         , :P50_NTFCA_EMIL',
'      from pq_g_solicitantes',
'     where id_slctud = :P50_ID_SLCTUD;',
'end if;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P50_NMRO_RDCDO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4670989565307945)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'if :P50_FILE_BLOB is null then',
'    select idntfccion_sjto',
'          , id_impsto',
'       into :P50_IDNTFCCION_SJTO ',
'          , :P50_ID_IMPSTO',
'       from v_si_i_sujetos_impuesto',
'      where cdgo_clnte      = :F_CDGO_CLNTE',
'        and id_sjto_impsto  = :30_ID_SJTO_IMPSTO;',
'end if;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P50_NMRO_RDCDO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4671360086307946)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('cargar observaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'if :P50_FILE_BLOB is null then',
'    select obsrvcion, id_fljo_trea',
'      into :P50_OBSRVCION_S , :P50_ID_FLJO_TREA',
'      from pq_g_solicitudes_obsrvcion ',
'     where id_slctud = :P50_ID_SLCTUD',
'     order by id_slctd_obsrvcion ',
'     fetch first 1 rows only;',
'end if;',
'exception',
'    when others then ',
'        :P50_OBSRVCION_S := null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select obsrvcion  ',
'  from pq_g_solicitudes_obsrvcion ',
' where id_slctud = :P50_ID_SLCTUD'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4671786854307946)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Asociar PQR al expediente de Fiscalizaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje_rspsta    varchar2(100);',
'begin',
'    begin',
'        update fi_g_fsclzcion_expdnte_acto a',
'        set a.id_slctud_rqrmnto = :P50_ID_SLCTUD',
'          , a.nmro_rdcdo_dsplay_rq = :P50_NMRO_RDCDO_DSPLAY',
'        where a.id_fsclzcion_expdnte_acto = :P50_EXPDNTE_FSCLZCION;',
'    exception',
'        when others then',
'            v_mnsje_rspsta := ''Error al asociar solicitud al acto del requerimiento.'';',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'(:P50_EXPDNTE_FSCLZCION is not null and :P50_ID_SLCTUD is not null)'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4672917468307947)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BuscarRadicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_prmer_nmbre   pq_g_radicador.prmer_nmbre%type;',
'    v_sgndo_nmbre   pq_g_radicador.sgndo_nmbre%type;',
'    v_prmer_aplldo  pq_g_radicador.prmer_aplldo%type;',
'    v_sgndo_aplldo  pq_g_radicador.sgndo_aplldo%type; ',
'    v_id_rdcdor     pq_g_radicador.id_rdcdor%type;',
'begin',
'    select id_rdcdor,',
'           prmer_nmbre,',
'           sgndo_nmbre,',
'           prmer_aplldo,',
'           sgndo_aplldo',
'      into v_id_rdcdor,',
'           v_prmer_nmbre,',
'           v_sgndo_nmbre,',
'           v_prmer_aplldo,',
'           v_sgndo_aplldo',
'      from pq_g_radicador ',
'     where idntfccion          = :P50_IDNTFCCION ',
'       and cdgo_idntfccion_tpo = :P50_CDGO_IDNTFCCION_TPO;',
'   ',
'        apex_json.open_object; ',
'        apex_json.write(''ID_RDCDOR'', v_id_rdcdor);',
'        apex_json.write(''PRMER_NMBRE'', v_prmer_nmbre);',
'        apex_json.write(''SGNDO_NMBRE'', v_sgndo_nmbre);',
'        apex_json.write(''PRMER_APLLDO'', v_prmer_aplldo);',
'        apex_json.write(''SGNDO_APLLDO'', v_sgndo_aplldo);',
'        apex_json.close_all;',
'       ',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''PRMER_NMBRE'', '' '');',
'        apex_json.write(''SGNDO_NMBRE'', '' '');',
'        apex_json.write(''PRMER_APLLDO'', '' '');',
'        apex_json.write(''SGNDO_APLLDO'', '' '');',
'        apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P50_IDNTFCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4673306022307947)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BuscarSolicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'   ',
'    declare',
'    v_prmer_nmbre   si_c_terceros.prmer_nmbre%type;',
'    v_sgndo_nmbre   si_c_terceros.sgndo_nmbre%type;',
'    v_prmer_aplldo  si_c_terceros.prmer_aplldo%type;',
'    v_sgndo_aplldo  si_c_terceros.sgndo_aplldo%type;',
'    v_id_pais       si_c_terceros.id_pais%type;',
'    v_id_dprtmnto   si_c_terceros.id_dprtmnto%type;',
'    v_id_mncpio     si_c_terceros.id_mncpio%type;',
'    v_drccion       si_c_terceros.drccion%type;',
'    v_email         si_c_terceros.email%type;',
'    v_tlfno         si_c_terceros.tlfno%type;',
'',
'begin',
'    select prmer_nmbre,',
'           sgndo_nmbre,',
'           prmer_aplldo,',
'           sgndo_aplldo,',
'           id_pais,',
'           id_dprtmnto,',
'           id_mncpio,',
'           drccion,',
'           email,',
'           tlfno',
'      into v_prmer_nmbre,',
'           v_sgndo_nmbre,',
'           v_prmer_aplldo,',
'           v_sgndo_aplldo,',
'           v_id_pais,',
'           v_id_dprtmnto,',
'           v_id_mncpio,',
'           v_drccion,',
'           v_email,',
'           v_tlfno',
'      from si_c_terceros ',
'     where idntfccion          = :P50_IDNTFCCION_S',
'       and cdgo_idntfccion_tpo = :P50_CDGO_IDNTFCCION_TPO_S',
'       and cdgo_clnte = :F_CDGO_CLNTE;',
'        ',
'        apex_json.open_object; ',
'        apex_json.write(''PRMER_NMBRE_S'', v_prmer_nmbre);',
'        apex_json.write(''SGNDO_NMBRE_S'', v_sgndo_nmbre);',
'        apex_json.write(''PRMER_APLLDO_S'', v_prmer_aplldo);',
'        apex_json.write(''SGNDO_APLLDO_S'', v_sgndo_aplldo);',
'        apex_json.write(''ID_PAIS_NTFCCION_S'', v_id_pais);',
'        apex_json.write(''ID_DPRTMNTO_NTFCCION_S'', v_id_dprtmnto);',
'        apex_json.write(''ID_MNCPIO_NTFCCION_S'', v_id_mncpio);',
'        apex_json.write(''DRCCION_NTFCCION_S'', v_drccion);',
'        apex_json.write(''EMAIL_S'', v_email);',
'        apex_json.write(''TLFNO_S'', v_tlfno);',
'        apex_json.close_all;',
'       ',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''PRMER_NMBRE_S'', '' '');',
'        apex_json.write(''SGNDO_NMBRE_S'', '' '');',
'        apex_json.write(''PRMER_APLLDO_S'', '' '');',
'        apex_json.write(''SGNDO_APLLDO_S'', '' '');',
'        apex_json.write(''ID_PAIS_NTFCCION_S'', '' '');',
'        apex_json.write(''ID_DPRTMNTO_NTFCCION_S'', '' '');',
'        apex_json.write(''ID_MNCPIO_NTFCCION_S'', '' '');',
'        apex_json.write(''DRCCION_NTFCCION_S'', '' '');',
'        apex_json.write(''EMAIL_S'', '' '');',
'        apex_json.write(''TLFNO_S'', '' '');',
'        apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P50_IDNTFCCION_S'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4807658322927615)
,p_process_sequence=>110
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminardocumento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_cdgo_rspsta NUMBER;',
'  v_mnsje_rspsta VARCHAR2(200);',
'  l_row_id NUMBER;',
'  l_id_mtvo_dcmnto NUMBER; -- Nueva variable para el ID del motivo del documento',
'BEGIN',
'  -- Obtener los valores del ID y motivo del documento pasados por Ajax',
'  l_row_id := apex_application.g_x01;',
unistr('  l_id_mtvo_dcmnto := apex_application.g_x02; -- Obtener el segundo par\00E1metro'),
'  ',
'  -- Verificar si l_row_id es nulo (opcional, si el ID es obligatorio)',
'  IF l_row_id IS NULL THEN',
'    raise_application_error(-20002, ''ID del documento no proporcionado.'');',
'  END IF;',
'',
'  -- Verificar si l_id_mtvo_dcmnto es nulo (opcional, si el motivo es obligatorio)',
'  IF l_id_mtvo_dcmnto IS NULL THEN',
'    raise_application_error(-20003, ''ID del motivo del documento no proporcionado.'');',
'  END IF;',
'',
'',
'  -- Llamar al procedimiento almacenado',
'  pkg_pq_pqr.prc_elm_archivos_adjuntos (p_id_slctud     => :P50_ID_SLCTUD,',
'                                        p_id_dcmnto     => l_row_id, -- Pasamos el ID del documento recibido por Ajax',
'                                        p_cdgo_clnte    => :F_CDGO_CLNTE,',
'                                        p_id_mtvo       => l_id_mtvo_dcmnto, -- Pasamos el ID del motivo del documento',
'                                        o_cdgo_rspsta   => v_cdgo_rspsta,',
'                                        o_mnsje_rspsta  => v_mnsje_rspsta',
'                                       );',
'',
'',
unistr('  -- Comprobar el c\00F3digo de respuesta y lanzar un error si es necesario'),
'  if v_cdgo_rspsta <> 0 then ',
'        apex_json.open_object;',
'        apex_json.write(''msg'', v_mnsje_rspsta);  ',
'        apex_json.close_object;',
'    else',
'        apex_json.open_object;',
'        apex_json.write(''type'', ''OK'');    ',
'        apex_json.write(''msg'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'    end if;',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
