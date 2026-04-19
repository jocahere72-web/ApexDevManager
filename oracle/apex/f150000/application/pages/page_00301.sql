prompt --application/pages/page_00301
begin
wwv_flow_api.create_page(
 p_id=>301
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Informe PQR'
,p_step_title=>'Informe PQR'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function descargar(solicitud, radicado) {',
'    var popup = apex.widget.waitPopup();',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
'    try {',
'        ',
'        $s(''P301_ID_SLCTUD'', solicitud);',
'        await apex.server.process(''set_session'', {pageItems: ''#P301_ID_SLCTUD''});',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=DOWNLOADFILE:NO:RP:::`;',
'        await fetch(url, {',
'            method: ''GET'',',
'            cache: ''default''',
'        }).then(resp => {',
'            return resp.blob()',
'        }).then(resp => {',
'            console.log(resp);',
'            let a = document.createElement("a");',
'            document.body.appendChild(a);',
'            let v_url = window.URL.createObjectURL(resp);',
'            a.download = radicado + ".pdf";',
'            a.href = v_url;',
'            a.click();',
'            document.body.removeChild(a);',
'            window.URL.revokeObjectURL(v_url);',
'        });',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        popup.remove();',
'    }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20220813000915'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72095929611408731)
,p_plug_name=>'Informe'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3748785968474319)
,p_plug_name=>'Nuevo PQR'
,p_parent_plug_id=>wwv_flow_api.id(72095929611408731)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3748811764474320)
,p_plug_name=>unistr('Hist\00F3rico PQR')
,p_parent_plug_id=>wwv_flow_api.id(72095929611408731)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'   from (',
'   select s.nmro_rdcdo_dsplay,',
'          initcap(upper(r.prmer_nmbre || '' '' || r.prmer_aplldo)) nmbre_rdcdor,',
'          m.dscrpcion,',
'          e.dscrpcion dscrpcion_estdo,',
'          sms.idntfccion,',
'          i.nmbre_impsto,',
'          i.nmbre_impsto_sbmpsto,',
'          s.fcha_rdcdo,',
'          s.fcha_pryctda,',
'          s.fcha_real,  ',
'          case when s.fcha_real is not null ',
'               then 0',
'               when trunc(sysdate) >= trunc(cast (s.fcha_pryctda as date))',
'               then 0',
'               when trunc(sysdate) < trunc(cast (s.fcha_pryctda as date))',
'               then trunc(abs( cast(s.fcha_pryctda as date) - cast(sysdate as date) )) ',
'          end dias_faltantes,      ',
'          /*case when s.fcha_real is not null',
'               then 0 ',
'               when trunc(sysdate) > trunc(cast (s.fcha_pryctda as date))',
'               then trunc(abs( cast(s.fcha_pryctda as date) - cast(sysdate as date) ))',
'               else 0',
'          end dias_vencidos,*/',
'          case when trunc(sysdate) > trunc(cast (s.fcha_pryctda as date)) and  s.fcha_real is null',
'               then 1',
'               else 0',
'          end estdo, ',
'          rs.dscrpcion dscrpcion_rspsta,',
'          ac.id_acto,',
'          --case when ac.id_acto is not null then ''<span class="fa fa-download" aria-hidden="true"></span>'' end as ver,',
'          --pkg_pq_pqr.fnc_cl_url_portal(p_id_slctud => s.id_slctud) url,',
'          s.id_slctud',
'     from pq_g_solicitudes              s',
'     join v_sg_g_usuarios               u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                  e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitantes             st  on st.id_slctud = s.id_slctud',
'     join si_c_terceros                 t   on t.cdgo_idntfccion_tpo = st.cdgo_idntfccion_tpo and t.idntfccion = st.idntfccion',
'     join sg_g_usuarios                 sg  on sg.id_trcro = t.id_trcro',
'     join pq_g_solicitudes_motivo       sm  on sm.id_slctud = s.id_slctud',
'left join pq_g_solicitudes_mtvo_acto    ac  on ac.id_slctud_mtvo = sm.id_slctud_mtvo     ',
'     join pq_d_motivos                  m   on m.id_mtvo = sm.id_mtvo',
'left join pq_g_slctdes_mtvo_sjt_impst   sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo      p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'left join v_df_i_impuestos_subimpuesto  i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'left join pq_d_respuestas               rs  on rs.cdgo_rspsta = s.cdgo_rspsta',
'    where s.cdgo_clnte = :F_CDGO_CLNTE ',
'      and sg.id_usrio  = :F_ID_USRIO ',
'      and s.id_estdo   = 4',
' order by s.fcha_incio desc',
'   ) a;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(3749280442474324)
,p_heading=>'Opciones'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(3749341550474325)
,p_heading=>'Datos de la solicitud'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(3749458314474326)
,p_heading=>unistr('Fechas y gesti\00F3n de la solicitud')
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3749561237474327)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(3749696002474328)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(3749765402474329)
,p_name=>'FCHA_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RDCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Radicada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(3749821469474330)
,p_name=>'FCHA_PRYCTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRYCTDA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Proyectada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(3749900284474331)
,p_name=>'FCHA_REAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_REAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Cierre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(3750067472474332)
,p_name=>'DIAS_FALTANTES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_FALTANTES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00EDas<br/>Faltantes')
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
 p_id=>wwv_flow_api.id(3750207511474334)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(3750402746474336)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3750532982474337)
,p_name=>'NMRO_RDCDO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('N\00B0 Radicado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<span>&NMRO_RDCDO_DSPLAY.</span>'
,p_link_target=>'javascript:descargar(&ID_SLCTUD., ''&NMRO_RDCDO_DSPLAY.'');'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3750694294474338)
,p_name=>'NMBRE_RDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RDCDOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre<br/>Radicador'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(3750747004474339)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(3750871354474340)
,p_name=>'DSCRPCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3750928076474341)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(3751147824474343)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(3751284210474344)
,p_name=>'DSCRPCION_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(3749176742474323)
,p_internal_uid=>3749176742474323
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
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>350
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(13352386372616498)
,p_interactive_grid_id=>wwv_flow_api.id(3749176742474323)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(13352441621616498)
,p_report_id=>wwv_flow_api.id(13352386372616498)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13354138023616529)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(3749561237474327)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13354659023616537)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(3749696002474328)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13355187658616540)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(3749765402474329)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13355694044616542)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(3749821469474330)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13356133026616544)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(3749900284474331)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13356613624616546)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(3750067472474332)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13357626212616558)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(3750207511474334)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13358539978616564)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(3750402746474336)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13359084554616588)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(3750532982474337)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13359562686616590)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(3750694294474338)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>221
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13360050628616592)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(3750747004474339)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13360534634616595)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(3750871354474340)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13361032266616597)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(3750928076474341)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13362011801616601)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(3751147824474343)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13362519264616603)
,p_view_id=>wwv_flow_api.id(13352441621616498)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(3751284210474344)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(142297111814668594)
,p_plug_name=>'PQR en Curso'
,p_parent_plug_id=>wwv_flow_api.id(72095929611408731)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'   from (',
'   select s.nmro_rdcdo_dsplay,',
'          initcap(upper(r.prmer_nmbre || '' '' || r.prmer_aplldo)) nmbre_rdcdor,',
'          m.dscrpcion,',
'          e.dscrpcion dscrpcion_estdo,',
'          sms.idntfccion,',
'          i.nmbre_impsto,',
'          i.nmbre_impsto_sbmpsto,',
'          s.fcha_rdcdo,',
'          s.fcha_pryctda,',
'          s.fcha_real,  ',
'          case when s.fcha_real is not null ',
'               then 0',
'               when trunc(sysdate) >= trunc(cast (s.fcha_pryctda as date))',
'               then 0',
'               when trunc(sysdate) < trunc(cast (s.fcha_pryctda as date))',
'               then trunc(abs( cast(s.fcha_pryctda as date) - cast(sysdate as date) )) ',
'          end dias_faltantes,      ',
'        /*  case when s.fcha_real is not null',
'               then 0 ',
'               when trunc(sysdate) > trunc(cast (s.fcha_pryctda as date))',
'               then trunc(abs( cast(s.fcha_pryctda as date) - cast(sysdate as date) ))',
'               else 0',
'          end dias_vencidos,*/',
'          case when trunc(sysdate) > trunc(cast (s.fcha_pryctda as date)) and  s.fcha_real is null',
'               then 1',
'               else 0',
'          end estdo, ',
'          rs.dscrpcion dscrpcion_rspsta,',
'          ac.id_acto,',
'          --case when ac.id_acto is not null then ''<span class="fa fa-download" aria-hidden="true"></span>'' end as ver,',
'         --pkg_pq_pqr.fnc_cl_url_portal(p_id_slctud => s.id_slctud) url,',
'          s.id_slctud',
'     from pq_g_solicitudes              s',
'     join v_sg_g_usuarios               u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                  e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitantes             st  on st.id_slctud = s.id_slctud',
'     join si_c_terceros                 t   on t.cdgo_idntfccion_tpo = st.cdgo_idntfccion_tpo and t.idntfccion = st.idntfccion',
'     join sg_g_usuarios                 sg  on sg.id_trcro = t.id_trcro',
'     join pq_g_solicitudes_motivo       sm  on sm.id_slctud = s.id_slctud',
'left join pq_g_solicitudes_mtvo_acto    ac  on ac.id_slctud_mtvo = sm.id_slctud_mtvo     ',
'     join pq_d_motivos                  m   on m.id_mtvo = sm.id_mtvo',
'left join pq_g_slctdes_mtvo_sjt_impst   sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo      p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'left join v_df_i_impuestos_subimpuesto  i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'left join pq_d_respuestas               rs  on rs.cdgo_rspsta = s.cdgo_rspsta',
'    where s.cdgo_clnte = :F_CDGO_CLNTE ',
'      and sg.id_usrio  = :F_ID_USRIO ',
'      and s.id_estdo  != 4',
' order by s.fcha_incio desc',
'   ) a;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(72096143938408733)
,p_heading=>'Opciones'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(72096255381408734)
,p_heading=>'Datos de la solicitud'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(72096377259408735)
,p_heading=>unistr('Fechas y gesti\00F3n de la solicitud')
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(72095673691408728)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(72096732758408739)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(142297683474668599)
,p_name=>'NMRO_RDCDO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('N\00B0 Radicado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(72096255381408734)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'<span>&NMRO_RDCDO_DSPLAY.</span>'
,p_link_target=>'javascript:descargar(&ID_SLCTUD., ''&NMRO_RDCDO_DSPLAY.'');'
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
 p_id=>wwv_flow_api.id(142297737416668600)
,p_name=>'NMBRE_RDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RDCDOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre<br/>Radicador'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(72096255381408734)
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(142297832692668601)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(72096255381408734)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(142297928295668602)
,p_name=>'DSCRPCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(72096255381408734)
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
 p_id=>wwv_flow_api.id(142298051903668603)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(72096255381408734)
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
 p_id=>wwv_flow_api.id(142298187619668604)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(72096255381408734)
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
 p_id=>wwv_flow_api.id(142298289492668605)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(72096255381408734)
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(142298303082668606)
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
,p_group_id=>wwv_flow_api.id(72096377259408735)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(142298451109668607)
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
,p_group_id=>wwv_flow_api.id(72096377259408735)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(142298538243668608)
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
,p_group_id=>wwv_flow_api.id(72096377259408735)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(142298647680668609)
,p_name=>'DIAS_FALTANTES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_FALTANTES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00EDas<br/>Faltantes')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(72096377259408735)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(142298800217668611)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(72096377259408735)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_api.id(142299012588668613)
,p_name=>'DSCRPCION_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(72096377259408735)
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
 p_id=>wwv_flow_api.id(142297423820668597)
,p_internal_uid=>142297423820668597
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
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>350
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(143382356002360591)
,p_interactive_grid_id=>wwv_flow_api.id(142297423820668597)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(143382482722360592)
,p_report_id=>wwv_flow_api.id(143382356002360591)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72373146890147553)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(72095673691408728)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73178721714753722)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(72096732758408739)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143383475277360599)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(142297683474668599)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143383901816360601)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(142297737416668600)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143384395750360603)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(142297832692668601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143384977267360604)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(142297928295668602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143385395425360606)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(142298051903668603)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143385978421360607)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(142298187619668604)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143386481692360609)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(142298289492668605)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143386934733360611)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(142298303082668606)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143387410247360612)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(142298451109668607)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143387943453360614)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(142298538243668608)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143388418179360615)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(142298647680668609)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143389398105360618)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(142298800217668611)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(143390450028360622)
,p_view_id=>wwv_flow_api.id(143382482722360592)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(142299012588668613)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71807170937911471)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(3748785968474319)
,p_button_name=>'BTN_PQR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva PQR'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP,302::'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72097245096408744)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(142297111814668594)
,p_button_name=>'btn_rgresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-arrow-left'
,p_button_cattributes=>'style="margin-right:.5rem;"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72096832325408740)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:212,<id_slctud>1106</id_slctud>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3748922830474321)
,p_name=>'P301_ID_ACTO_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3748811764474320)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3749045259474322)
,p_name=>'P301_ID_SLCTUD_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3748811764474320)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72095410013408726)
,p_name=>'P301_ID_ACTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(142297111814668594)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72097085815408742)
,p_name=>'P301_ID_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(142297111814668594)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72095324297408725)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOAD'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    file_name varchar2(2000);',
'    file_blob blob;',
'    file_mimetype varchar2(1000);',
'begin',
'    select file_blob',
'         , file_name',
'         , file_mimetype',
'      into file_blob',
'         , file_name',
'         , file_mimetype',
'      from v_gn_g_actos ',
'     where id_acto = :P301_ID_ACTO;  ',
'    if(file_blob is not null and file_name is not null and file_mimetype is not null)then',
'        htp.init;',
'        owa_util.mime_header(file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(file_blob);',
'        apex_application.stop_apex_engine;',
'    end if;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DOWNLOAD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72096972375408741)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOADFILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_blob          blob;',
'    v_gn_d_reportes gn_d_reportes%rowtype;    ',
'begin',
'    begin',
'        apex_session.attach( p_app_id     => 66000',
'                           , p_page_id    => 2',
'                           , p_session_id => v(''APP_SESSION'') );',
'',
'        --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'        select /*+ RESULT_CACHE */',
'               r.*',
'          into v_gn_d_reportes ',
'          from gn_d_reportes r',
'         where r.id_rprte = 212;',
'',
'        --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO                    ',
'        apex_util.set_session_state(''P2_XML'', ''<id_slctud>'' || :P301_ID_SLCTUD || ''</id_slctud>'');',
'        apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'',
'        v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                                p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                                p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                                p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                                p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'        htp.init;',
'        owa_util.mime_header(''application/pdf'', FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' || v_gn_d_reportes.nmbre_rprte || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_blob);',
'        apex_application.stop_apex_engine;',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72097137480408743)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object;',
'apex_json.write(''type'', ''OK'');',
'apex_json.close_object;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
