prompt --application/pages/page_00042
begin
wwv_flow_api.create_page(
 p_id=>42
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Resoluciones de Embargo'
,p_step_title=>'Desembargo Manual'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function datos_resoluciones() {',
'',
'    var region = apex.region("resoluciones");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim(),',
'                     "ID_EC": model.getValue(record, "ID_EMBRGOS_CRTRA").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P42_JSON_RESOLUCIONES'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'         //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        if (json.length === 1 ){                ',
'            $s(''P42_ID_EMBRGOS_RSLCION'',  json[0]["ID_ER"] );//SETEAMOS EL VALOR DEL ID DEL EMBARGO SI SOLO HAY UNO SELECIONADO ',
'            $s(''P42_ID_EMBRGOS_CRTRA''  ,  json[0]["ID_EC"] );',
'        }else {',
'            $s(''P42_ID_EMBRGOS_RSLCION'',  '''');',
'            $s(''P42_ID_EMBRGOS_CRTRA'',  '''');',
'           ',
'        }     ',
'        ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("btn_desembargo_total").show();',
'            apex.item("btn_desembargo_parcial").hide();',
'        }else {',
'            apex.item("btn_desembargo_total").hide();',
'        }',
'		',
'        return;',
'    }',
'    ',
'    apex.item("btn_desembargo_total").hide();    ',
'    apex.item("btn_desembargo_parcial").hide();',
'}',
'',
'function datos_oficios() {',
'',
'    var region = apex.region("oficios");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_SO": model.getValue(record, "ID_SLCTD_OFCIO").trim(),',
'                     "ID_EC": model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P42_JSON_OFCIOS'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'         //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'       /* if (json.length === 1 ){                ',
'            $s(''P42_ID_EMBRGOS_RSLCION'',  json[0]["ID_ER"] );//SETEAMOS EL VALOR DEL ID DE LA CARTERA SI SOLO HAY UNO SELECIONADO ',
'        }else {',
'            $s(''P42_ID_EMBRGOS_RSLCION'',  '''');',
'        }     */',
'        ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("btn_desembargo_parcial").show();',
'        }else {',
'            apex.item("btn_desembargo_parcial").hide();',
'        }',
'		',
'        return;',
'    }',
'    ',
'    apex.item("btn_desembargo_parcial").hide();    ',
'',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'datos_resoluciones();',
'datos_oficios();'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20200108174746'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76651256274038511)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
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
unistr('<p>Funcionalidad que permite realizar el desembargo parcial o total de los embargos seleccionadas, adem\00E1s permite observar la informaci\00F3n del bien embargado y los responsables del embargo.</p>'),
unistr('<p><b>1.</b>El desembargo total se hace con los datos de las resoluciones de embargo, se deben seleccionar los embargos y luego presionar el bot\00F3n "Desembargo total" para luego seleccionar la causal e ingresar los datos de la causal para poder realiz')
||'ar el/los desembargos</p>',
unistr('<p><b>2.</b>El desembargo parcial se hace con los datos de los oficios de un embargo, se deben seleccionar los oficios asociados a un embargo y luego presionar el bot\00F3n "Desembargo Parcial" para luego seleccionar la causal e ingresar los datos de la ')
||'causal para poder realizar el/los desembargo</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76651723171038516)
,p_plug_name=>'Oficios de Embargo'
,p_region_name=>'oficios'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_slctd_ofcio,',
'       a.id_embrgos_crtra,',
'       a.id_entddes,',
'       a.nmro_acto_ofcio,',
'       a.dscrpcion,',
'       a.rspnsble,',
'       a.activo,',
'       a.id_embrgos_rslcion',
'  from v_mc_g_solicitudes_y_oficios a',
' where a.id_embrgos_rslcion is not null',
'   and not exists (select 2',
'                     from mc_g_desembargos_oficio c',
'                    where c.id_slctd_ofcio = a.id_slctd_ofcio',
'                      and c.estado_rvctria = ''N'');'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(77499706531852554)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76651981949038518)
,p_name=>'ID_SLCTD_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_OFCIO'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76652022274038519)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(76652286850038521)
,p_name=>'NMRO_ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Oficio')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(76652457734038523)
,p_name=>'ID_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDDES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(76652551983038524)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Entidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76652647794038525)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76652732467038526)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(82859818560223432)
,p_name=>'bienes'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Consultar Bienes',
'<span class="fa fa-external-link"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP,41:P41_ID_SLCTD_OFCIO,P41_ID_ENTDDES,P41_OCULTAR_APLICAR:&ID_SLCTD_OFCIO.,&ID_ENTDDES.,1'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96982168534168008)
,p_name=>'RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96982265603168009)
,p_name=>'ACTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96982326487168010)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(77501582793852560)
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(76651804521038517)
,p_internal_uid=>76651804521038517
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(77555809499041178)
,p_interactive_grid_id=>wwv_flow_api.id(76651804521038517)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(77555965488041179)
,p_report_id=>wwv_flow_api.id(77555809499041178)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77557712392041213)
,p_view_id=>wwv_flow_api.id(77555965488041179)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(76651981949038518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77558250737041214)
,p_view_id=>wwv_flow_api.id(77555965488041179)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(76652022274038519)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77559273896041219)
,p_view_id=>wwv_flow_api.id(77555965488041179)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(76652286850038521)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136.88890075683594
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77560270890041221)
,p_view_id=>wwv_flow_api.id(77555965488041179)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(76652457734038523)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77560748270041223)
,p_view_id=>wwv_flow_api.id(77555965488041179)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(76652551983038524)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>330.3333435058594
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77561278234041224)
,p_view_id=>wwv_flow_api.id(77555965488041179)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(76652647794038525)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83200616567103726)
,p_view_id=>wwv_flow_api.id(77555965488041179)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(82859818560223432)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148.55556106567383
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98228838409201480)
,p_view_id=>wwv_flow_api.id(77555965488041179)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(96982168534168008)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>405
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98229350226201483)
,p_view_id=>wwv_flow_api.id(77555965488041179)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(96982265603168009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98229873549201485)
,p_view_id=>wwv_flow_api.id(77555965488041179)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(96982326487168010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77499706531852554)
,p_plug_name=>'Resoluciones de Embargo'
,p_region_name=>'resoluciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgos_rslcion,',
'       a.id_embrgos_crtra,',
'       a.id_acto,',
'       a.nmro_acto,',
'       a.fcha_acto,       ',
'       a.dscrpcion_tipo_embargo,',
'       a.idntfccion,',
'       a.vgncias',
'from v_mc_g_embargos_resolucion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and (:P42_RSLCION_EMBARGO is null or a.nmro_acto = :P42_RSLCION_EMBARGO)',
'and (:P42_FCHA_RSLCION_DSDE is null or trunc(a.fcha_acto) >= trunc(to_date(:P42_FCHA_RSLCION_DSDE,''DD/MM/YYYY'')))',
'and (:P42_FCHA_RSLCION_HSTA is null or trunc(a.fcha_acto) <= trunc(to_date(:P42_FCHA_RSLCION_HSTA,''DD/MM/YYYY'')))',
'and a.id_tpos_embrgo = :P42_TPO_EMBRGO',
'and a.idntfccion = nvl(:P42_SUJETO,a.idntfccion)',
'and (:P42_SUJETO is null or a.idntfccion = :P42_SUJETO)',
'/*and exists (select 1',
'                 from mc_g_embargos_cartera b',
'                 where b.id_embrgos_crtra = a.id_embrgos_crtra',
'                 and b.cdgo_estdos_crtra = ''E'')*/',
'and exists (select 2',
'              from v_mc_g_solicitudes_y_oficios b',
'             where b.id_embrgos_rslcion = a.id_embrgos_rslcion',
'               and b.id_embrgos_crtra = a.id_embrgos_crtra',
'               and (:P42_OFCIO_EMBARGO is null or b.nmro_acto_ofcio = :P42_OFCIO_EMBARGO)',
'               and (:P42_FCHA_OFCIO_DSDE is null or trunc(b.fcha_ofcio) >= trunc(to_date(:P42_FCHA_OFCIO_DSDE,''DD/MM/YYYY'')))',
'               and (:P42_FCHA_OFCIO_HSTA is null or trunc(b.fcha_ofcio) <= trunc(to_date(:P42_FCHA_OFCIO_HSTA,''DD/MM/YYYY'')))',
'               and not exists (select 2',
'                                 from mc_g_desembargos_oficio c',
'                                where c.id_slctd_ofcio = b.id_slctd_ofcio',
'                                  and c.estado_rvctria = ''N''))',
'and exists (select d.id_embrgos_rspnsble,',
'                   d.id_embrgos_crtra,',
'                   d.id_embrgos_rslcion,',
'                   d.dscrpcion_idntfccion_tpo,',
'                   d.idntfccion,',
'                   d.nmbre_cmplto',
'              from v_mc_g_embargos_rspnsble_emb d',
'             where d.id_embrgos_crtra = a.id_embrgos_crtra',
'               and d.id_embrgos_rslcion = a.id_embrgos_rslcion',
'               and (:P42_ID_RSPNSBLE is null or trim(d.idntfccion) = trim(:P42_ID_RSPNSBLE)))',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76651435989038513)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76651530449038514)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(77501582793852560)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(77502144498852561)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(77502707272852561)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(77503397996852561)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(77503917670852562)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n de Embargo')
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96981876068168005)
,p_name=>'DSCRPCION_TIPO_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TIPO_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(96981952957168006)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(96982093032168007)
,p_name=>'VGNCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencias'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(77500220638852555)
,p_internal_uid=>77500220638852555
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(77500625557852556)
,p_interactive_grid_id=>wwv_flow_api.id(77500220638852555)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(77500742487852557)
,p_report_id=>wwv_flow_api.id(77500625557852556)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77501947316852561)
,p_view_id=>wwv_flow_api.id(77500742487852557)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(77501582793852560)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77502506461852561)
,p_view_id=>wwv_flow_api.id(77500742487852557)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(77502144498852561)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77503142568852561)
,p_view_id=>wwv_flow_api.id(77500742487852557)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(77502707272852561)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77503770812852562)
,p_view_id=>wwv_flow_api.id(77500742487852557)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(77503397996852561)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77504320381852562)
,p_view_id=>wwv_flow_api.id(77500742487852557)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(77503917670852562)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77556847680041182)
,p_view_id=>wwv_flow_api.id(77500742487852557)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(76651435989038513)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98216197864037608)
,p_view_id=>wwv_flow_api.id(77500742487852557)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(96981876068168005)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>195
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98216639963037611)
,p_view_id=>wwv_flow_api.id(77500742487852557)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(96981952957168006)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98217106429037613)
,p_view_id=>wwv_flow_api.id(77500742487852557)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(96982093032168007)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>337
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82859993500223433)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96982482929168011)
,p_plug_name=>'Responsables'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgos_rspnsble,',
'       a.id_embrgos_crtra,',
'       a.id_embrgos_rslcion,',
'       a.dscrpcion_idntfccion_tpo,',
'       a.idntfccion,',
'       A.nmbre_cmplto',
'from v_mc_g_embargos_rspnsble_emb a'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(77499706531852554)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96983536282168022)
,p_name=>'ID_EMBRGOS_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSPNSBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96983654127168023)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96983758752168024)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(77501582793852560)
,p_include_in_export=>false
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96983808332168025)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(96983965546168026)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(96984011252168027)
,p_name=>'NMBRE_CMPLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CMPLTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(96983403547168021)
,p_internal_uid=>96983403547168021
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(98264610998527830)
,p_interactive_grid_id=>wwv_flow_api.id(96983403547168021)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(98264742290527830)
,p_report_id=>wwv_flow_api.id(98264610998527830)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98265287563527833)
,p_view_id=>wwv_flow_api.id(98264742290527830)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(96983536282168022)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98265740560527836)
,p_view_id=>wwv_flow_api.id(98264742290527830)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(96983654127168023)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98266225185527838)
,p_view_id=>wwv_flow_api.id(98264742290527830)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(96983758752168024)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98266754938527839)
,p_view_id=>wwv_flow_api.id(98264742290527830)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(96983808332168025)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98267206699527840)
,p_view_id=>wwv_flow_api.id(98264742290527830)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(96983965546168026)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98267764196527843)
,p_view_id=>wwv_flow_api.id(98264742290527830)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(96984011252168027)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96984132677168028)
,p_plug_name=>'tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96984209588168029)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(82860045265223434)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(82859993500223433)
,p_button_name=>'btn_desembargo_total'
,p_button_static_id=>'btn_desembargo_total'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Desembargo Total'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100884994315481702)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(82859993500223433)
,p_button_name=>'btn_desembargo_parcial'
,p_button_static_id=>'btn_desembargo_parcial'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Desembargo Parcial'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100884808315481701)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(96984209588168029)
,p_button_name=>'btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:27px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(108555132610903329)
,p_branch_name=>unistr('Ir a P\00E1gina 66-T')
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,66:P66_TIPO_DESEMBARGO,P66_ID_TIPO_EMBARGO,P66_ID_EMBRGOS_CRTRA,P66_ID_EMBRGOS_RSLCION:T,&P42_TPO_EMBRGO.,&P42_ID_EMBRGOS_CRTRA.,&P42_ID_EMBRGOS_RSLCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(82860045265223434)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(108555221007903330)
,p_branch_name=>unistr('Ir a P\00E1gina 66-P')
,p_branch_action=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,66:P66_ID_EMBRGOS_RSLCION,P66_TIPO_DESEMBARGO,P66_ID_TIPO_EMBARGO,P66_ID_EMBRGOS_CRTRA:&P42_ID_EMBRGOS_RSLCION.,P,&P42_TPO_EMBRGO.,&P42_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(100884994315481702)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96984318439168030)
,p_name=>'P42_RSLCION_EMBARGO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_prompt=>unistr('Resoluci\00F3n de Embargo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la resoluci\00F3n de embargo a consultar')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96984477046168031)
,p_name=>'P42_FCHA_RSLCION_DSDE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_prompt=>unistr('Fecha Resoluci\00F3n Inicial')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Seleccione del calendario la fecha inicial de la resoluci\00F3n que desea consultar.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96984552306168032)
,p_name=>'P42_FCHA_RSLCION_HSTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_prompt=>unistr('Fecha Resoluci\00F3n Final')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Seleccione del calendario la fecha final de la resoluci\00F3n que desea consultar.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96984635743168033)
,p_name=>'P42_OFCIO_EMBARGO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_prompt=>'Oficio de Embargo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el oficio de embargo a consultar.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96984775661168034)
,p_name=>'P42_FCHA_OFCIO_DSDE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_prompt=>'Fecha Oficio Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha inicial del embargo a consultar.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96984801415168035)
,p_name=>'P42_FCHA_OFCIO_HSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_prompt=>'Fecha Oficio final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Seleccione del calendario la fecha final del embargo a consultar.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96984906027168036)
,p_name=>'P42_TPO_EMBRGO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_prompt=>'Tipo de Embargo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_tpos_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de embargo a consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96985004337168037)
,p_name=>'P42_SUJETO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_prompt=>'Sujeto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Es el n\00FAmero de identificaci\00F3n del sujeto asociado a un proceso jur\00EDdico, ingrese un n\00FAmero de identificaci\00F3n del sujeto para buscar de manera puntual el proceso donde este contenida esa identificaci\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108553311153903311)
,p_name=>'P42_JSON_RESOLUCIONES'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108553486064903312)
,p_name=>'P42_JSON_OFCIOS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108553551049903313)
,p_name=>'P42_ID_EMBRGOS_RSLCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115709196292426513)
,p_name=>'P42_ID_RSPNSBLE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_prompt=>unistr('Identificaci\00F3n Responsable')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n del responsable del embargo.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122609633045713919)
,p_name=>'P42_ID_EMBRGOS_CRTRA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(96984209588168029)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108553695167903314)
,p_name=>'Al seleccionar registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(77499706531852554)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108553739109903315)
,p_event_id=>wwv_flow_api.id(108553695167903314)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'datos_resoluciones();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108553865704903316)
,p_name=>'Al seleccionar oficios'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(76651723171038516)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108553946629903317)
,p_event_id=>wwv_flow_api.id(108553865704903316)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'datos_oficios();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76651692210038515)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(77499706531852554)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Resoluciones de Embargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76652886690038527)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(76651723171038516)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Notificaciones de Embargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
