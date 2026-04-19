prompt --application/pages/page_00158
begin
wwv_flow_api.create_page(
 p_id=>158
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Registro de Embargo Remanente'
,p_step_title=>'Registro de Embargo Remanente'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function buildJsonEmbargos() {',
'    ',
'    var region = apex.region("cautelar");',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("cautelar").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        //var records = model._data;//view.view$.grid("getSelectedRecords");',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonEmbargos = records.map((embargos) => {',
'            return {"ID_EMBRGOS_RSLCION" : model.getValue(embargos, "ID_EMBRGOS_RSLCION"),',
'                    "ESTADO_CARTERA" : model.getValue(embargos, "ESTADO_CARTERA"),',
'                    "CONSECUTIVO" : model.getValue(embargos, "CONSECUTIVO")',
'                   }; ',
'        });',
'        $s(''P158_JSON_EMBRGOS'', JSON.stringify(jsonEmbargos));',
'      //  console.log(''jsonEmbargos: ''+JSON.stringify(jsonEmbargos));',
'        //window.localStorage.setItem(''jsonEmbargos'', JSON.stringify(jsonEmbargos));',
'    }',
'};',
'',
'function fnc_construirJson() {',
'    //console.log(''entrando a fnc_jsonSeleccion con accion ''+accion);',
'    var region = apex.region("cautelar");',
'    var jsonEmbargos = [];',
'',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        jsonEmbargos = records.map((record) => {',
'            return {"ID_EMBRGOS_RSLCION" : model.getValue(record, "ID_EMBRGOS_RSLCION"),',
'                    "ESTADO_CARTERA" : model.getValue(record, "ESTADO_CARTERA"),',
'                    "CONSECUTIVO" : model.getValue(record, "CONSECUTIVO")',
'                   };',
'        });',
'',
'        var json = JSON.stringify(jsonEmbargos);',
'        $s(''P158_JSON_EMBRGOS'', JSON.stringify(jsonEmbargos));       ',
'        console.log(''Jason embargos: '' + json);',
'        return jsonEmbargos;',
'        //  console.log(''funcion isEmptyObject: ''+isEmptyObject(jsonTitulos));',
'',
'     /*   if (isEmptyObject(jsonEmbargos)) {',
'            // console.log(''Esta vacio'');',
'            return null;',
'        } else {',
'            //  console.log(''Esta lleno'');',
'            return json;',
'        }',
'*/',
'    }',
'}',
'',
'function isEmptyObject(obj) {',
'    return Object.entries(obj).length === 0;',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240722145517'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(649358862338293467)
,p_plug_name=>'Tab embargos'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P158_ID_EMBRGOS_RMNTE'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(649355907107293437)
,p_plug_name=>'<b>Embargos Asociados</b>'
,p_parent_plug_id=>wwv_flow_api.id(649358862338293467)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_embrgos_rslcion',
'        ,a.cnsctvo_embrgo                              as consecutivo',
'        ,to_char(a.fcha_rgstro_embrgo,''DD/MM/YYYY'')    as Fecha_Embargo',
'        ,t.dscrpcion                                   as Estado_Cartera',
'        , a.vgncias                                    as Vigencias',
'        , a.dscrpcion_tipo_embargo                     as Tipo_Embargo',
'from v_mc_g_embargos_resolucion a',
'    join mc_g_embargos_responsable c on c.id_embrgos_crtra = a.id_embrgos_crtra',
'    join v_sg_g_usuarios b on b.id_fncnrio = a.id_fncnrio',
'    join mc_d_estados_cartera t on t.id_estdos_crtra = a.id_estdos_crtra and t.cdgo_estdos_crtra != ''D''    ',
'where rtrim(ltrim(c.idntfccion,''0'')) = rtrim(ltrim(:P158_IDNTFCCION_DMNDDO,''0''))',
'  and a.id_embrgos_rslcion  in  (select z.id_embrgos_rslcion',
'                                            from mc_g_embrgo_remnte_dtlle z',
'                                            join mc_g_embargos_remanente y on y.id_embrgos_rmnte = z.id_embrgos_rmnte',
'                                           where y.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                                          )',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(649356130769293439)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(649356184486293440)
,p_name=>'CONSECUTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CONSECUTIVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Consecutivo Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(649356316717293441)
,p_name=>'FECHA_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(649356433883293442)
,p_name=>'ESTADO_CARTERA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO_CARTERA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado Cartera'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(649356531933293443)
,p_name=>'VIGENCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VIGENCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencias'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(649356568692293444)
,p_name=>'TIPO_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(649355966180293438)
,p_internal_uid=>649355966180293438
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
 p_id=>wwv_flow_api.id(649370727764320549)
,p_interactive_grid_id=>wwv_flow_api.id(649355966180293438)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(649370795923320556)
,p_report_id=>wwv_flow_api.id(649370727764320549)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649371276476320570)
,p_view_id=>wwv_flow_api.id(649370795923320556)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(649356130769293439)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649371685943320575)
,p_view_id=>wwv_flow_api.id(649370795923320556)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(649356184486293440)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649372222673320577)
,p_view_id=>wwv_flow_api.id(649370795923320556)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(649356316717293441)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649372663187320579)
,p_view_id=>wwv_flow_api.id(649370795923320556)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(649356433883293442)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649373159512320582)
,p_view_id=>wwv_flow_api.id(649370795923320556)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(649356531933293443)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649373655506320584)
,p_view_id=>wwv_flow_api.id(649370795923320556)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(649356568692293444)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(649356768073293446)
,p_plug_name=>'<b>Remanente Registrado</b>'
,p_parent_plug_id=>wwv_flow_api.id(649358862338293467)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_embrgos_rmnte',
'        ,a.nmro_rslcn',
'        ,a.fcha_rslcn',
'        ,a.nro_oficio',
'        ,a.fcha_ofcio',
'        --,cdgo_entdad_tpo',
'        ,decode(a.id_entdad, a.id_entdad, b.nmbre_rzon_scial , ''-'') as id_entdad',
'        ,a.nro_ofcio_jzgdo',
'        ,a.fcha_ofcio_jzgdo',
'        ,a.rdcdo_jzgdo',
'        --,cdgo_tpo_prcso',
'        ,decode(a.cdgo_tpo_prcso, a.cdgo_tpo_prcso, c.nmbre_prcso , ''-'') as cdgo_tpo_prcso',
'        ,a.idntfccion_dmndte',
'        ,a.nmbre_dmndte',
'        ,a.nro_pqr',
'        ,a.fcha_pqr',
'        ,a.observacion',
'        ,a.id_instncia_fljo',
'        ,a.id_fncnrio',
'        ,a.id_slctud ',
'        ,decode(a.cdgo_tpo_idntfccn_dmndt, a.cdgo_tpo_idntfccn_dmndt, d.dscrpcion_idntfccion_tpo , ''-'') as cdgo_tpo_idntfccn_dmndt',
'        ,decode(a.cdgo_estdo_embrgo, a.cdgo_estdo_embrgo, e.dscrpcion , ''-'') as cdgo_estdo_embrgo',
'from mc_g_embargos_remanente a',
'join df_s_entidades b on b.id_entdad = a.id_entdad',
'join mc_d_procesos_remanente c on c.cdgo_tpo_prcso = a.cdgo_tpo_prcso',
'join df_s_identificaciones_tipo d on d.cdgo_idntfccion_tpo = a.cdgo_tpo_idntfccn_dmndt',
'join mc_d_remanentes_rspsta e on e.cdgo_rspsta = a.cdgo_estdo_embrgo',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and rtrim(ltrim(a.idntfccion_dmndte)) = rtrim(ltrim(:P158_IDNTFCCION_DMNDTE))   ',
'--and a.cdgo_estdo_embrgo <> ''D''',
'/*and a.id_embrgos_rmnte not in  (select z.id_embrgo_rmnte',
'                                  from mc_g_dsmbrgs_remanente z)*/',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22922218707095804)
,p_name=>'CDGO_TPO_IDNTFCCN_DMNDT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_IDNTFCCN_DMNDT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(22922301045095805)
,p_name=>'CDGO_ESTDO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTDO_EMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado Remanente'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(217733586464413306)
,p_name=>'ID_ENTDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Entidad Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(649357019204293448)
,p_name=>'ID_EMBRGOS_RMNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RMNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(649357051134293449)
,p_name=>'NMRO_RSLCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RSLCN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Nro. Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(649357219706293450)
,p_name=>'FCHA_RSLCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RSLCN'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(649357297613293451)
,p_name=>'NRO_OFICIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_OFICIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nro. Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(649357404733293452)
,p_name=>'FCHA_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(649357597299293454)
,p_name=>'NRO_OFCIO_JZGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_OFCIO_JZGDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nro. Oficio Juzgado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(649357711805293455)
,p_name=>'FCHA_OFCIO_JZGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO_JZGDO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Oficio Juzgado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(649357821930293456)
,p_name=>'RDCDO_JZGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RDCDO_JZGDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Radicado Juzgado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(649357849924293457)
,p_name=>'CDGO_TPO_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_PRCSO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Proceso'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(649358036379293458)
,p_name=>'IDNTFCCION_DMNDTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n Demandante')
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
 p_id=>wwv_flow_api.id(649358087976293459)
,p_name=>'NMBRE_DMNDTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Demandante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(649358177484293460)
,p_name=>'NRO_PQR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_PQR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Nro. PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(649358263846293461)
,p_name=>'FCHA_PQR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PQR'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(649358395047293462)
,p_name=>'OBSERVACION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSERVACION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(649358439638293463)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(649358569354293464)
,p_name=>'ID_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FNCNRIO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(649358698366293465)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(649356858219293447)
,p_internal_uid=>649356858219293447
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
 p_id=>wwv_flow_api.id(649390405431333134)
,p_interactive_grid_id=>wwv_flow_api.id(649356858219293447)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(649390518966333134)
,p_report_id=>wwv_flow_api.id(649390405431333134)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22932654459209201)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(22922218707095804)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22933129061209203)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(22922301045095805)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217770664028961418)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(217733586464413306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649390978249333136)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(649357019204293448)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649391524390333138)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(649357051134293449)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649391978622333139)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(649357219706293450)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649392487642333141)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(649357297613293451)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649393031578333147)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(649357404733293452)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649393962208333151)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(649357597299293454)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649394440519333153)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(649357711805293455)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649394946180333156)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(649357821930293456)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649395480024333158)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(649357849924293457)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649395948985333161)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(649358036379293458)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649396518867333163)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(649358087976293459)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649396993479333165)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(649358177484293460)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649397441804333167)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(649358263846293461)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649397907265333169)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(649358395047293462)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649398345321333171)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(649358439638293463)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649398847054333176)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(649358569354293464)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(649399421406333178)
,p_view_id=>wwv_flow_api.id(649390518966333134)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(649358698366293465)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(715480272427935262)
,p_plug_name=>'Embargos'
,p_region_name=>'cautelar'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion,',
'       k.nmro_prcso_jrdco,',
'       a.id_embrgos_rslcion,',
'       a.cnsctvo_embrgo as consecutivo,',
'       to_char(a.fcha_rgstro_embrgo, ''DD/MM/YYYY'') as Fecha_Embargo,',
'       t.dscrpcion as Estado_Cartera,',
'       a.vgncias as Vigencias,',
'       a.dscrpcion_tipo_embargo as Tipo_Embargo',
'  from v_mc_g_embargos_resolucion a',
'  join mc_g_embargos_responsable c',
'    on c.id_embrgos_crtra = a.id_embrgos_crtra',
'  join mc_d_estados_cartera t',
'    on t.id_estdos_crtra = a.id_estdos_crtra --and t.cdgo_estdos_crtra != ''D''',
'    join mc_g_embrgos_crt_prc_jrd j',
'    on j.id_embrgos_crtra = a.id_embrgos_crtra',
'  join cb_g_procesos_juridico k',
'    on k.id_prcsos_jrdco = j.id_prcsos_jrdco',
' where ltrim(c.idntfccion, ''0'') = ltrim(:P158_IDNTFCCION_DMNDDO, ''0'')',
' and a.id_tpos_embrgo <> 2',
'   and a.id_embrgos_rslcion not in',
'       (select z.id_embrgos_rslcion',
'          from mc_g_embrgo_remnte_dtlle z',
'          join mc_g_embargos_remanente y',
'            on y.id_embrgos_rmnte = z.id_embrgos_rmnte',
'         where y.id_instncia_fljo = :F_ID_INSTNCIA_FLJO)',
' and a.id_impsto = :P158_ID_IMPSTO        ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P158_ID_EMBRGOS_RMNTE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(27739981104084701)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(27740049311084702)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Proceso Juridico'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(431381524409962161)
,p_name=>'CONSECUTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CONSECUTIVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Embargo'
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
 p_id=>wwv_flow_api.id(431381678260962162)
,p_name=>'FECHA_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(431381735538962163)
,p_name=>'ESTADO_CARTERA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO_CARTERA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado Cartera'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(431381845474962164)
,p_name=>'VIGENCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VIGENCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencias'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(431381967955962165)
,p_name=>'TIPO_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(431382309153962169)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(433591515111053454)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(433591637134053455)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(715480364707935263)
,p_internal_uid=>715480364707935263
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
 p_id=>wwv_flow_api.id(715489434617959592)
,p_interactive_grid_id=>wwv_flow_api.id(715480364707935263)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(715489532454959594)
,p_report_id=>wwv_flow_api.id(715489434617959592)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6025515314092)
,p_view_id=>wwv_flow_api.id(715489532454959594)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(27739981104084701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6679687314106)
,p_view_id=>wwv_flow_api.id(715489532454959594)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(27740049311084702)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(431399369080349126)
,p_view_id=>wwv_flow_api.id(715489532454959594)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(431381524409962161)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(431399800440349128)
,p_view_id=>wwv_flow_api.id(715489532454959594)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(431381678260962162)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(431402167662365344)
,p_view_id=>wwv_flow_api.id(715489532454959594)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(431381735538962163)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(431402630697365346)
,p_view_id=>wwv_flow_api.id(715489532454959594)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(431381845474962164)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(431403152170365348)
,p_view_id=>wwv_flow_api.id(715489532454959594)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(431381967955962165)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(431416860962495948)
,p_view_id=>wwv_flow_api.id(715489532454959594)
,p_display_seq=>35
,p_column_id=>wwv_flow_api.id(431382309153962169)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(433597498512054020)
,p_view_id=>wwv_flow_api.id(715489532454959594)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(433591515111053454)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_filter(
 p_id=>wwv_flow_api.id(63864000007)
,p_report_id=>wwv_flow_api.id(715489434617959592)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_api.id(431381735538962163)
,p_operator=>'C'
,p_is_case_sensitive=>false
,p_expression=>'EMBARGO'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(793340022402727133)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(728512221384856753)
,p_plug_name=>'<b>Documentos</b>'
,p_parent_plug_id=>wwv_flow_api.id(793340022402727133)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(793324661797207948)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(728512221384856753)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion',
'     , md.dscrpcion_dcmnto',
'     , d.fcha',
'     , case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P158_ID_SLCTUD '))
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
 p_id=>wwv_flow_api.id(720562902947327453)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>720562902947327453
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(216885774060117854)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(216886112062117862)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(216886576694117863)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(216886980601117863)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(216887349560117863)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(216887787059117863)
,p_db_column_name=>'ACTVO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Aceptado'
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(216888149747117864)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(720576370233333720)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2168885'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ID_DCMNTO:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(793315420886205426)
,p_plug_name=>'<b>Datos del Gestor</b>'
,p_parent_plug_id=>wwv_flow_api.id(793340022402727133)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(793320074561206730)
,p_plug_name=>'<b>Datos del Solicitante</b>'
,p_parent_plug_id=>wwv_flow_api.id(793340022402727133)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(793562781512529612)
,p_plug_name=>'<b>Datos Solicitud</b>'
,p_parent_plug_id=>wwv_flow_api.id(793340022402727133)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(880623957293176701)
,p_plug_name=>'Create Form'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17335434580919364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'MC_G_EMBARGOS_REMANENTE'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P158_ID_EMBRGOS_RMNTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(881098276734926684)
,p_plug_name=>'Datos Embargo Remanente'
,p_parent_plug_id=>wwv_flow_api.id(880623957293176701)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(913534794957429182)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i text-align: justify;>',
'Esta funcionalidad permite:<br><br>',
unistr('Realizar el registro de la anotaci\00F3n de embargo de remanente y asociar este registro a una o mas medidas cautelares.<br><br>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1073032809495256590)
,p_plug_name=>'<b>Registro de Embargo Remanente</b>'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1287577573758604702)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(216898408149117909)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1287577573758604702)
,p_button_name=>'REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(216898042812117909)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1287577573758604702)
,p_button_name=>'Btn_Registrar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P158_ID_EMBRGOS_RMNTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(216898814024117909)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1287577573758604702)
,p_button_name=>'ASCR_EMBRG_RMNTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Asociar Embargos'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from v_mc_g_embargos_resolucion a',
'    join mc_g_embargos_responsable c on c.id_embrgos_crtra = a.id_embrgos_crtra',
'  -- join v_sg_g_usuarios b on b.id_fncnrio = a.id_fncnrio',
'    join mc_d_estados_cartera t on t.id_estdos_crtra = a.id_estdos_crtra and t.cdgo_estdos_crtra != ''D''    ',
'where rtrim(ltrim(c.idntfccion,''0'')) = rtrim(ltrim(:P158_IDNTFCCION_DMNDDO,''0''))',
'  and a.id_embrgos_rslcion not in  (select z.id_embrgos_rslcion',
'                                    from mc_g_embrgo_remnte_dtlle z',
'                                    join mc_g_embargos_remanente y on y.id_embrgos_rmnte = z.id_embrgos_rmnte',
'                                    where y.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                                   )',
'  and :P158_ID_EMBRGOS_RMNTE is not null',
'  and exists (select 2',
'          from wf_g_instancias_transicion x',
'         where x.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'           and x.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'           and x.id_estdo_trnscion != 3)'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25693381209392801)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1287577573758604702)
,p_button_name=>'BTN_RECHAZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rechazar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from v_mc_g_embargos_resolucion e',
'  join mc_g_embargos_responsable r',
'    on r.id_embrgos_crtra = e.id_embrgos_crtra',
'  join mc_g_embargos_cartera c',
'    on c.id_embrgos_crtra = e.id_embrgos_crtra',
' where ltrim(r.idntfccion, ''0'') = ltrim(:P158_IDNTFCCION_DMNDDO, ''0'')',
'   and c.id_estdos_crtra =',
'       (select id_estdos_crtra',
'          from mc_d_estados_cartera',
'         where cdgo_estdos_crtra = ''E'')',
'   and e.id_tpos_embrgo in',
'       (select id_tpos_mdda_ctlar',
'          from mc_d_tipos_mdda_ctlar',
'         where cdgo_tpos_mdda_ctlar in (''BIM'', ''EBF''))',
'   and :P158_ID_EMBRGOS_RMNTE is not null',
'   and exists (select 1',
'          from wf_g_instancias_transicion',
'         where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'           and id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'           and id_estdo_trnscion != 3);'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(216903281921117919)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(715480272427935262)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28840600587975301)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(881098276734926684)
,p_button_name=>'BTN_NVA_ENTDAD'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(17408942694919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=50000:178:&SESSION.::&DEBUG.:RP,178::'
,p_icon_css_classes=>'fa-plus-circle'
,p_grid_column_attributes=>'style="margin-top:10px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>4
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(216885089765117825)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(728512221384856753)
,p_button_name=>'BTN_ACTLZAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.:BORRAR:&DEBUG.:RP,15:P15_ID_SLCTUD:&P158_ID_SLCTUD.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto ',
'  from pq_g_documentos d ',
' where id_slctud = :P158_ID_SLCTUD ',
'   and indcdor_actlzar = ''S'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-external-link-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25634597738171001)
,p_name=>'P158_CDGO_TPO_IDNTFCCION_DMNDDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>unistr('Tipo Identificaci\00F3n Demandado')
,p_source=>'CDGO_TPO_IDNTFCCION_DMNDDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_idntfccion_tpo as d,',
'       cdgo_idntfccion_tpo as r',
'  from df_s_identificaciones_tipo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25634635480171002)
,p_name=>'P158_IDNTFCCON_DMNDDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>unistr('Identificac\00EDon Demandado')
,p_source=>'IDNTFCCION_DMNDDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25634798855171003)
,p_name=>'P158_NMBRE_DMNDDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>'Nombres Demandado'
,p_source=>'NMBRE_DMNDDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216871588612117707)
,p_name=>'P158_ID_PRSNTCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216871800856117778)
,p_name=>'P158_ID_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216872262239117779)
,p_name=>'P158_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte = :f_cdgo_clnte',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216872627334117779)
,p_name=>'P158_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto  as d,',
'       id_impsto as r',
'  from df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'  and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216873007521117779)
,p_name=>'P158_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P158_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216873491695117798)
,p_name=>'P158_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216873892004117799)
,p_name=>'P158_ID_SLCTUD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_source=>'ID_SLCTUD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216874200060117812)
,p_name=>'P158_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_prompt=>unistr('N\00FAmero Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216874643761117813)
,p_name=>'P158_FCHA_RDCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216875082891117813)
,p_name=>'P158_OBSRVCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_prompt=>unistr('Observaci\00F3n de la solicitud')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216875403113117819)
,p_name=>'P158_VLDAR_TRBTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(793562781512529612)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216876027570117820)
,p_name=>'P158_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(793315420886205426)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216876453910117820)
,p_name=>'P158_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(793315420886205426)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216876850552117820)
,p_name=>'P158_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(793315420886205426)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216877231319117821)
,p_name=>'P158_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(793315420886205426)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216877636367117821)
,p_name=>'P158_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(793315420886205426)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216878080617117821)
,p_name=>'P158_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(793315420886205426)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216878483240117821)
,p_name=>'P158_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(793315420886205426)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216879108159117822)
,p_name=>'P158_CDGO_RSPNSBLE_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>'Tipo Radicador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216879529408117822)
,p_name=>'P158_CDGO_IDNTFCCION_TPO_S'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216879925702117822)
,p_name=>'P158_IDNTFCCION_S'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216880351086117822)
,p_name=>'P158_PRMER_NMBRE_S'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216880758716117823)
,p_name=>'P158_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216881151975117823)
,p_name=>'P158_PRMER_APLLDO_S'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216881579388117823)
,p_name=>'P158_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216881935867117823)
,p_name=>'P158_ID_PAIS_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select nmbre_pais,id_pais from df_s_paises'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216882303492117824)
,p_name=>'P158_ID_DPRTMNTO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto',
'     , id_dprtmnto ',
'  from df_s_departamentos ',
' where id_pais = :P158_ID_PAIS_NTFCCION_S;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P158_ID_PAIS_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216882734001117824)
,p_name=>'P158_ID_MNCPIO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio',
'     , id_mncpio ',
'  from df_s_municipios ',
' where id_dprtmnto = :P158_ID_DPRTMNTO_NTFCCION_S'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P158_ID_DPRTMNTO_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216883152302117824)
,p_name=>'P158_DRCCION_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216883559983117824)
,p_name=>'P158_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216883997237117824)
,p_name=>'P158_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216884396781117825)
,p_name=>'P158_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(793320074561206730)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216889272526117887)
,p_name=>'P158_ID_FNCNRIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(880623957293176701)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_item_default=>'F_ID_FNCNRIO'
,p_item_default_type=>'ITEM'
,p_source=>'ID_FNCNRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216889654068117887)
,p_name=>'P158_ID_INSTNCIA_FLJO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(880623957293176701)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_item_default=>'F_ID_INSTNCIA_FLJO'
,p_item_default_type=>'ITEM'
,p_source=>'ID_INSTNCIA_FLJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216891168077117893)
,p_name=>'P158_ID_EMBRGOS_RMNTE'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_source=>'ID_EMBRGOS_RMNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216891538403117893)
,p_name=>'P158_NMRO_RSLCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_source=>'NMRO_RSLCN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216891903644117894)
,p_name=>'P158_FCHA_RSLCN'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sysdate',
'from dual;'))
,p_item_default_type=>'SQL_QUERY'
,p_source=>'FCHA_RSLCN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216892329241117894)
,p_name=>'P158_NRO_OFICIO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>'No. Oficio'
,p_source=>'NRO_OFICIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216892714240117894)
,p_name=>'P158_FCHA_OFCIO'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>'Fecha Oficio'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_OFCIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216893194035117894)
,p_name=>'P158_ID_ENTDAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>'Entidad'
,p_source=>'ID_ENTDAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.nmbre_rzon_scial ,b.id_entdad',
'from df_s_entidades b',
'where b.cdgo_entdad_tpo = ''JZG'''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216893580458117895)
,p_name=>'P158_NRO_OFCIO_JZGDO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>'No. Oficio Juzgado'
,p_source=>'NRO_OFCIO_JZGDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216893991265117895)
,p_name=>'P158_FCHA_OFCIO_JZGDO'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>'Fecha Oficio Juzgado'
,p_source=>'FCHA_OFCIO_JZGDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216894312506117895)
,p_name=>'P158_RDCDO_JZGDO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>'Radicado Juzgado'
,p_source=>'RDCDO_JZGDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216894716597117895)
,p_name=>'P158_CDGO_TPO_PRCSO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>'Tipo Proceso'
,p_source=>'CDGO_TPO_PRCSO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.nmbre_prcso ,b.cdgo_tpo_prcso ',
'from mc_d_procesos_remanente b;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216895144057117895)
,p_name=>'P158_IDNTFCCION_DMNDTE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>unistr('Identificaci\00F3n Demandante')
,p_source=>'IDNTFCCION_DMNDTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216895557042117896)
,p_name=>'P158_NMBRE_DMNDTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>'Nombre Demandante'
,p_source=>'NMBRE_DMNDTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216895921432117896)
,p_name=>'P158_NRO_PQR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>unistr('N\00FAmero PQR')
,p_source=>'NRO_PQR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216896344316117907)
,p_name=>'P158_FCHA_PQR'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>'Fecha PQR'
,p_source=>'FCHA_PQR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216896717034117908)
,p_name=>'P158_OBSERVACION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>81
,p_cMaxlength=>1000
,p_cHeight=>8
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216903687557117919)
,p_name=>'P158_IDNTFCCION_DMNDDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(715480272427935262)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216904086345117919)
,p_name=>'P158_JSON_EMBRGOS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(715480272427935262)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216905181728117920)
,p_name=>'P158_ID_EMBG_RMNTE_DCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(649358862338293467)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216905575281117921)
,p_name=>'P158_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(649358862338293467)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(216905901843117921)
,p_name=>'P158_ID_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(649358862338293467)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(217733084765413301)
,p_name=>'P158_CDGO_TPO_IDNTFCCN_DMNDT'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(881098276734926684)
,p_item_source_plug_id=>wwv_flow_api.id(880623957293176701)
,p_prompt=>unistr('Tipo Identificaci\00F3n Demandante')
,p_source=>'CDGO_TPO_IDNTFCCN_DMNDT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_idntfccion_tpo as d,',
'       cdgo_idntfccion_tpo as r',
'  from df_s_identificaciones_tipo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(217733603099413307)
,p_computation_sequence=>10
,p_computation_item=>'P158_NRO_PQR'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_rdcdo_dsplay',
'  from v_pq_g_solicitudes',
'  --where id_instncia_fljo = :F_ID_INSTNCIA_FLJO ;',
'   where id_instncia_fljo = (select id_instncia_fljo from v_pq_g_solicitudes where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO);',
'  ',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(217774784380049101)
,p_computation_sequence=>10
,p_computation_item=>'P158_ID_FNCNRIO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_fncnrio',
'  from v_sg_g_usuarios a',
' where a.id_usrio = :F_ID_USRIO'))
);
end;
/
begin
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(217733795750413308)
,p_computation_sequence=>20
,p_computation_item=>'P158_FCHA_PQR'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  to_char(fcha_rdcdo,''DD/MM/YYYY'')',
'  from v_pq_g_solicitudes',
'  --where id_instncia_fljo = :F_ID_INSTNCIA_FLJO ;',
'   where id_instncia_fljo = (select id_instncia_fljo from v_pq_g_solicitudes where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO);',
'  ',
''))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(25635034592171006)
,p_validation_name=>unistr('Existe Identificaci\00F3n')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.idntfccion_rspnsble',
'   from v_si_i_sujetos_responsable a',
'  where a.cdgo_clnte            = :F_CDGO_CLNTE',
'    and a.cdgo_idntfccion_tpo   = :P158_CDGO_TPO_IDNTFCCION_DMNDDO',
'    and a.idntfccion_rspnsble   = :P158_IDNTFCCON_DMNDDO'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('No existe responsable con esta identificaci\00F3n.')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(25634635480171002)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(217733182748413302)
,p_name=>unistr('Al cambiar tipo de identificaci\00F3n')
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P158_CDGO_TPO_IDNTFCCN_DMNDT,P158_IDNTFCCION_DMNDTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(217733267519413303)
,p_event_id=>wwv_flow_api.id(217733182748413302)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Buscar_Demandante() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("buscarDemndnte", {',
'            pageItems: "#P158_CDGO_TPO_IDNTFCCN_DMNDT,#P158_IDNTFCCION_DMNDTE"',
'        }).then(function (resp) {',
'            Object.keys(resp).forEach((f) => {',
'                apex.item(''P158_'' + f).setValue(('''' + resp[f]).trim());',
'            });',
'        }',
'        );',
'',
'',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'Buscar_Demandante();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25634815260171004)
,p_name=>'Al cambiar P158_CDGO_TPO_IDNTFCCION_DMNDDO'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P158_CDGO_TPO_IDNTFCCION_DMNDDO,P158_IDNTFCCON_DMNDDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25634999174171005)
,p_event_id=>wwv_flow_api.id(25634815260171004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Buscar_Demandado() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("Buscar_Demandado", {',
'            pageItems: "#P158_CDGO_TPO_IDNTFCCION_DMNDDO, #P158_IDNTFCCON_DMNDDO"',
'        }).then(function (resp) {',
'            Object.keys(resp).forEach((f) => {          ',
'                apex.item(''P158_'' + f).setValue(('''' + resp[f]).trim());',
'            });',
'        }',
'        );',
'',
'',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'Buscar_Demandado();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25635324375171009)
,p_name=>'Al cambiar P158_IDENTIFCCON_DMNDDO'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P158_IDNTFCCON_DMNDDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25635477086171010)
,p_event_id=>wwv_flow_api.id(25635324375171009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Buscar_Demandado() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("Buscar_Demandado", {',
'            pageItems: "#P158_CDGO_TPO_IDNTFCCION_DMNDDO, #P158_IDNTFCCON_DMNDDO"',
'        }).then(function (resp) {',
'            Object.keys(resp).forEach((f) => {',
'                apex.item(''P158_'' + f).setValue(('''' + resp[f]).trim());',
'            });',
'        }',
'        );',
'',
'',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'Buscar_Demandado();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25718977157219602)
,p_name=>'Al dar Click BTN_RECHAZAR'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(25693381209392801)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25728912431028301)
,p_event_id=>wwv_flow_api.id(25718977157219602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_actualizarEstadoAnotacion(){',
'    try{                ',
'                ',
'        apex.server.process("actualizarEstdoRemanente",{',
'            pageItems: "#F_CDGO_CLNTE, #F_ID_INSTNCIA_FLJO, #P158_IDNTFCCION_DMNDDO"',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                   console.log(''RESPUESTA: ''+data.o_cdgo_rspsta);',
'                   apex.message.clearErrors();',
'                   apex.message.showErrors ([',
'                       {',
'                           type:       "error",',
'                           location:   "page",',
'                           message:    data.o_mnsje_rspsta,',
'                           unsafe:     false',
'                       }',
'                   ]);',
'                }else{',
unistr('                   apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de rechazar la solicitud?", function(okPressed) {'),
'    if(okPressed) {',
'        fnc_actualizarEstadoAnotacion();',
'    }',
'}); '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28595510238205102)
,p_name=>'clic en BTN_ASCR_EMBRG_RMNTE'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(216898814024117909)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28595681376205103)
,p_event_id=>wwv_flow_api.id(28595510238205102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_asociarEmbargo() {',
unistr('    console.log(''Entrando a la funci\00F3n fnc_asociarEmbargo'');'),
'',
'    var jsonEmbargos = fnc_construirJson();',
'',
'    if (jsonEmbargos.length === 0) {',
'        console.error("No hay embargos seleccionados.");',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
'            message: "Debe seleccionar al menos un embargo.",',
'            unsafe: false',
'        }]);',
'        return;',
'    }else{',
'        console.log(''Embargos seleccionados: ''+JSON.stringify(jsonEmbargos));',
'    }',
'',
'    apex.server.process("registrarMedida", {',
'        x01: JSON.stringify(jsonEmbargos),',
'        pageItems: "#F_CDGO_CLNTE, #P158_ID_EMBRGOS_RMNTE"',
'    }, {',
'        success: function(dato) {',
'            console.log(''Respuesta: '', dato);',
'            if (dato.o_cdgo_rspsta != 0) {',
unistr('                console.error(''C\00F3digo de respuesta no esperado: '', dato.o_cdgo_rspsta);'),
'            } else {',
unistr('                apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                apex.submit();',
'            }',
'        },',
'        error: function(request, status, error) {',
'            console.error(''Error en la solicitud: '', error);',
'            console.error(''Estado de la solicitud: '', status);',
'            console.error(''Respuesta del servidor: '', request.responseText);',
'            apex.message.showErrors([{',
'                type: "error",',
'                location: "page",',
unistr('                message: "Error al procesar la acci\00F3n.",'),
'                unsafe: false',
'            }]);',
'        }',
'    });',
'}',
'',
'fnc_asociarEmbargo();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(216890476040117888)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_region_id=>wwv_flow_api.id(880623957293176701)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(216923115900117941)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar datos solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpo',
'     , id_mtvo',
'     , id_impsto',
'     , id_impsto_sbmpsto',
'     , idntfccion',
'     , id_rdcdor',
'     , id_slctud',
'     , nmro_rdcdo_dsplay',
'     , fcha_rdcdo',
'     , id_prsntcion_tpo ',
'  into :P158_ID_TPO',
'     , :P158_ID_MTVO',
'     , :P158_ID_IMPSTO',
'     , :P158_ID_IMPSTO_SBMPSTO',
'     , :P158_IDNTFCCION_SJTO',
'     , :P158_ID_RDCDOR',
'     , :P158_ID_SLCTUD',
'     , :P158_NMRO_RDCDO_DSPLAY',
'     , :P158_FCHA_RDCDO',
'     , :P158_ID_PRSNTCION_TPO ',
'  from v_pq_g_solicitudes',
'  --where id_instncia_fljo = :F_ID_INSTNCIA_FLJO ;',
'   where id_instncia_fljo = (select id_instncia_fljo from v_pq_g_solicitudes where id_instncia_fljo_gnrdo = :F_ID_INSTNCIA_FLJO);',
'  ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(216923561936117945)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_idntfccion_tpo',
'     , idntfccion ',
'     , prmer_nmbre ',
'     , sgndo_nmbre ',
'     , prmer_aplldo ',
'     , sgndo_aplldo',
'  into :P158_CDGO_IDNTFCCION_TPO',
'     , :P158_IDNTFCCION',
'     , :P158_PRMER_NMBRE',
'     , :P158_SGNDO_NMBRE',
'     , :P158_PRMER_APLLDO',
'     , :P158_SGNDO_APLLDO',
'  from pq_g_radicador',
' where id_rdcdor = :P158_ID_RDCDOR;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(216923952278117945)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_rspnsble_tpo',
'     , cdgo_idntfccion_tpo ',
'     , idntfccion ',
'     , prmer_nmbre ',
'     , sgndo_nmbre ',
'     , prmer_aplldo ',
'     , sgndo_aplldo ',
'     , id_pais_ntfccion ',
'     , id_dprtmnto_ntfccion ',
'     , id_mncpio_ntfccion ',
'     , drccion_ntfccion ',
'     , email ',
'     , tlfno ',
'     , cllar',
'  into :P158_CDGO_RSPNSBLE_TPO',
'     , :P158_CDGO_IDNTFCCION_TPO_S ',
'     , :P158_IDNTFCCION_S',
'     , :P158_PRMER_NMBRE_S',
'     , :P158_SGNDO_NMBRE_S ',
'     , :P158_PRMER_APLLDO_S',
'     , :P158_SGNDO_APLLDO_S',
'     , :P158_ID_PAIS_NTFCCION_S',
'     , :P158_ID_DPRTMNTO_NTFCCION_S',
'     , :P158_ID_MNCPIO_NTFCCION_S',
'     , :P158_DRCCION_NTFCCION_S',
'     , :P158_EMAIL_S',
'     , :P158_TLFNO_S',
'     , :P158_CLLAR_S',
'  from pq_g_solicitantes',
' where id_slctud = :P158_ID_SLCTUD;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(216924778717117946)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar datos resoluci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select id_embrgos_rmnte, idntfccion_dmndte, ltrim(idntfccion_dmnddo,''0'')',
'    into :P158_ID_EMBRGOS_RMNTE, :P158_IDNTFCCION_DMNDTE, :P158_IDNTFCCION_DMNDDO',
'    from mc_g_embargos_remanente',
'   where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'exception ',
'     when no_data_found then',
'      raise_application_error(-20000, ''Remanente no encontrado.'');',
'        :P158_ID_EMBRGOS_RMNTE 	   := null;',
'        :P158_IDNTFCCION_DMNDTE 	   := null;',
'     when others        then   ',
'       raise_application_error(-20000, ''Problemas al consultar Remanente'');',
'        :P158_ID_EMBRGOS_RMNTE 	   := null; ',
'        :P158_IDNTFCCION_DMNDTE 	   := null;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23010599155701101)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Numero resolucion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P158_NMRO_RSLCION := pkg_gn_generalidades.fnc_cl_consecutivo( p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                               p_cdgo_cnsctvo => ''ERM'');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(216898042812117909)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(216890096255117888)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(880623957293176701)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Form'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'MC_G_EMBARGOS_REMANENTE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(216898042812117909)
,p_process_success_message=>unistr('\00A1Embargo Remanente Registrado!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(216904497224117920)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(715480272427935262)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Embargos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(217733321724413304)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Buscar_Demandado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_dmnddo   MC_G_EMBARGOS_REMANENTE.NMBRE_DMNDTE%type;',
'begin',
'           ',
'    select a.nmbre_rzon_scial',
'      into v_nmbre_dmnddo',
'      from v_si_i_sujetos_responsable a',
'     where a.cdgo_idntfccion_tpo = :P158_CDGO_TPO_IDNTFCCION_DMNDDO',
'       and ltrim(a.idntfccion_rspnsble,''0'') = ltrim(:P158_IDNTFCCON_DMNDDO,''0'')',
'       and rownum = 1;',
'   ',
'        apex_json.open_object; ',
'        --apex_json.write(''NMBRE_DMNDDO'', v_nmbre_dmnddo);',
'        apex_json.write(''NMBRE_DMNDDO'', v_nmbre_dmnddo);',
'        apex_json.close_all;',
'       ',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        --apex_json.write(''NMBRE_DMNDDO'', '' '');',
'        apex_json.write(''NMBRE_DMNDDO'', '' '');',
'        apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(28697957907172301)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'buscarDemndnte'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_dmndnte   v_si_c_terceros.nmbre_trcro%type;',
'begin',
'',
'select nmbre_trcro into v_nmbre_dmndnte',
'  from v_si_c_terceros',
' where cdgo_idntfccion_tpo = :P158_CDGO_TPO_IDNTFCCN_DMNDT',
'   and ltrim(idntfccion, ''0'') = ltrim(:P158_IDNTFCCION_DMNDTE, ''0'')',
'   and rownum = 1;',
'   ',
'   apex_json.open_object;    ',
'   apex_json.write(''NMBRE_DMNDTE'', v_nmbre_dmndnte);',
'   apex_json.close_all;',
'       ',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''NMBRE_DMNDTE'', '' '');',
'        apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25719243401219605)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'actualizarEstdoRemanente'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta  number := 0;',
'  v_mnsje_rspsta varchar2(1000);',
'  v_cartera      clob;',
'  v_exception    exception;',
'begin',
'',
'  pkg_cb_medidas_cautelares.prc_ac_estdo_embrgo_rmnte(p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                      p_id_instncia_fljo  => :F_ID_INSTNCIA_FLJO,',
'                                                      p_idntfccion        => :P158_IDNTFCCION_DMNDDO,',
'                                                      p_cdgo_estdo_embrgo => ''R'',',
'                                                      o_cdgo_rspsta       => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta      => v_mnsje_rspsta);',
'',
'  if v_cdgo_rspsta > 0 then',
'    raise v_exception;',
'  end if;',
'',
'  apex_json.open_object;',
'  apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'  apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'  apex_json.close_object;',
'',
'exception',
'  when v_exception then',
'    rollback;',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(28595723726205104)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrarMedida'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_fcha date;',
'  v_cdgo_rspsta number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_exception     exception;',
'  v_json_embargos clob;',
'begin',
'    ',
'    v_json_embargos := apex_application.g_x01;',
'    ',
'    pkg_cb_medidas_cautelares.prc_rg_embrgos_rmnnte (p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                    ,p_id_embrgo_rmnte   => :P158_ID_EMBRGOS_RMNTE',
'                                                    ,p_json_embrgs       => v_json_embargos',
'                                                    ,o_cdgo_rspsta       => v_cdgo_rspsta',
'                                                    ,o_mnsje_rspsta      => v_mnsje_rspsta',
'                                                    );',
'     if v_cdgo_rspsta > 0 then',
'       raise v_exception;     ',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta); ',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'    exception',
'	    when v_exception then',
'			rollback;',
'			apex_json.open_object;',
'			apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'			apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'			apex_json.close_object;  ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
