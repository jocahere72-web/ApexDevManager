prompt --application/pages/page_00040
begin
wwv_flow_api.create_page(
 p_id=>40
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Investigaci\00F3n de Bienes')
,p_step_title=>unistr('Investigaci\00F3n de Bienes')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel(valid) {',
'',
'    var region = apex.region("cartera");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_EMBRGOS_CRTRA": model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     //"ID_SJTO": model.getValue(record, "ID_SJTO").trim(),',
'                     "ID_INSTNCIA_FLJO": model.getValue(record, "ID_INSTNCIA_FLJO").trim(),',
'                     "ID_FLJO_TREA": model.getValue(record, "ID_FLJO_TREA").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        //$s(''P40_JSON'', json.length > 0 ? JSON.stringify(json) : '''');',
'                ',
'        window.localStorage.setItem(''jsonEmbargo'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'         //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        if (json.length === 1 ){',
'            apex.item("btn_agregar_entidades_a_investigacion").show();',
'            apex.item("btn_cambiar_estado_entidades").show();   ',
'            apex.item("BTN_AGREGAR_RSPNSBLE").show();                     ',
'            $s(''P40_ID_EMBRGOS_CRTRA'',  json[0]["ID_EMBRGOS_CRTRA"] );//SETEAMOS EL VALOR DEL ID DE LA CARTERA SI SOLO HAY UNO SELECIONADO ',
'        }else {',
'            apex.item("btn_agregar_entidades_a_investigacion").hide();',
'            apex.item("btn_cambiar_estado_entidades").hide();',
'            apex.item("BTN_AGREGAR_RSPNSBLE").hide();',
'            $s(''P40_ID_EMBRGOS_CRTRA'',  '''');',
'        }',
'        ',
'        ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("btn_Procesar_Embargo").show();',
'        }else {',
'            apex.item("btn_Procesar_Embargo").hide();',
'        }',
'		',
'        return;',
'    }',
'    ',
'    apex.item("btn_Procesar_Embargo").hide();',
'    apex.item("btn_agregar_entidades_a_investigacion").hide();',
'    apex.item("btn_cambiar_estado_entidades").hide();',
'    apex.item("BTN_AGREGAR_RSPNSBLE").hide();    ',
'',
'}',
'',
'function seleccionarTodos(e,btn,grid,data){',
'    var datos = data.map((m) => {',
'            return { "ID_EMBRGOS_CRTRA": m.ID_EMBRGOS_CRTRA,',
'                     "ID_INSTNCIA_FLJO": m.ID_INSTNCIA_FLJO,',
'                     "ID_FLJO_TREA": m.ID_FLJO_TREA',
'                   }; ',
'        }); ',
'    window.localStorage.setItem(''jsonEmbargo'', JSON.stringify(datos));',
'    //apex.submit(''btn_Procesar_Embargo'');',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_sel();',
'',
'apex.region("cartera").widget().interactiveGrid("setSelectedRecords", []);',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#responsables_ig_report_settings {',
'   display:none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20220729153840'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75112160419204701)
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
unistr('<p>Funcionalidad donde se realiza la investigaci\00F3n de bienes y se realiza el embargo a las diferentes carteras seleccionadas.</p>'),
unistr('<p><b>1.</b>Permite adicionar un responsable a la investigaci\00F3n seleccionada.</p>'),
unistr('<p><b>2.</b>Permite adicionar una o varias entidades a la investigaci\00F3n seleccionada</p>'),
'<p><b>3.</b>Permite el cambio de estado activo/inactivo de las entidades y de los responsables</p>',
unistr('<p><b>4.</b>Permite Realizar el proceso de embargo de la investigaci\00F3n seleccionada</p>'),
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75112557480204705)
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
 p_id=>wwv_flow_api.id(75112760756204707)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75115117922204731)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75103837668195811)
,p_plug_name=>'Cartera a Embargar'
,p_region_name=>'cartera'
,p_parent_plug_id=>wwv_flow_api.id(75115117922204731)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgos_crtra,',
'       a.cdgo_clnte,',
'       a.cdgo_crtra,',
'       --a.id_sjto,',
'       a.idntfccion,',
'       to_char(a.fcha_ingrso,''dd/mm/yyyy'') as fcha_ingrso,',
'       a.cdgo_estdos_crtra,',
'       a.dscrpcion_estado_crtra,',
'       a.id_tpos_embrgo,',
'       a.dscrpcion_tipo_embargo,',
'       a.vgncias,',
'       b.id_fljo_trea,',
'       a.id_instncia_fljo',
'  from v_mc_g_embargos_cartera a, mc_d_estados_cartera b',
' where a.cdgo_estdos_crtra = b.cdgo_estdos_crtra',
' --c.id_fncnrio = :F_ID_FNCNRIO',
' and a.cdgo_estdos_crtra = ''I''',
' and a.cdgo_clnte = :f_cdgo_clnte',
'   and (a.fcha_ingrso >= :P40_FCHA_INI or :P40_FCHA_INI is null)',
'   and (a.fcha_ingrso <= :P40_FCHA_FIN or :P40_FCHA_FIN is null)',
'   and (a.idntfccion = :P40_SJTO or :P40_SJTO is null)',
'   --and (a.id_tpos_embrgo = :P40_TPO_EMBRGO or :P40_TPO_EMBRGO is null)',
'   and a.id_tpos_embrgo = :P40_TPO_EMBRGO',
'   /*and (select sum(f.vlor_sldo_cptal+f.vlor_intres) as sldo_crtra',
'          from mc_g_embargos_cartera_detalle e',
'         inner join v_gf_g_cartera_x_concepto f on e.id_sjto_impsto = f.id_sjto_impsto',
'           and e.vgncia = f.vgncia',
'           and e.id_prdo = f.id_prdo',
'           and e.id_cncpto = f.id_cncpto',
'         where e.id_embrgos_crtra = a.id_embrgos_crtra) > 0*/',
'   and exists (select 2',
'                 from mc_g_solicitudes_y_oficios d',
'                where d.Id_Embrgos_Crtra = a.id_embrgos_crtra',
'                  and (:P40_ID_ENTDDES is null or d.id_entddes = :P40_ID_ENTDDES))',
'   and exists (select 1',
'                 from v_mc_g_embargos_responsable c',
'                where c.id_embrgos_crtra = a.id_embrgos_crtra',
'                  and (:P40_IDNTFCCION is null or trim(c.idntfccion) = trim(:P40_IDNTFCCION))',
'                  and (:P40_NMBRE_CMPLTO is null or upper(c.nmbre_cmplto) like ''%''||upper(:P40_NMBRE_CMPLTO)||''%''))'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(57850098420104914)
,p_name=>'FLUJO'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Flujo<span class="fa fa-external-link-square"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.:RP,125:P125_ID_INSTNCIA_FLJO,P125_ID_FLJO_TREA:&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75105689221195819)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75106244648195820)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75106803755195820)
,p_name=>'CDGO_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('C\00F3digo de Cartera')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
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
 p_id=>wwv_flow_api.id(75108052616195821)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75108624410195821)
,p_name=>'CDGO_ESTDOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTDOS_CRTRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(75109272491195821)
,p_name=>'DSCRPCION_ESTADO_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTADO_CRTRA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(75109848214195822)
,p_name=>'ID_TPOS_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_EMBRGO'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75110497315195822)
,p_name=>'DSCRPCION_TIPO_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TIPO_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Embargo a Realizar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75111029599195822)
,p_name=>'VGNCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Vigencias a Embargar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75112237489204702)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75112314132204703)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75112951755204709)
,p_name=>'FCHA_INGRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INGRSO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(75465477289221222)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(75465523635221223)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(75104310814195813)
,p_internal_uid=>75104310814195813
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'	config.initialSelection = false;',
'   window.localStorage.removeItem(''jsonEmbargo'');',
'    return selectAll(config, {',
'        name: ''Seleccionar Todos'',',
'        action: seleccionarTodos',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(75104739744195814)
,p_interactive_grid_id=>wwv_flow_api.id(75104310814195813)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(75104800933195815)
,p_report_id=>wwv_flow_api.id(75104739744195814)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(58484255734309949)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(57850098420104914)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68.5556
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75106095802195820)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(75105689221195819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75106621510195820)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(75106244648195820)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75107295227195820)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(75106803755195820)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144.667
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75108496706195821)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(75108052616195821)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>187.667
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75109006991195821)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(75108624410195821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75109608762195821)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(75109272491195821)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75110267179195822)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(75109848214195822)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75110818176195822)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(75110497315195822)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>176
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75111444750195822)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(75111029599195822)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>278
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75119024817218257)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(75112237489204702)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75169724253371752)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(75112951755204709)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76106782224153961)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(75465477289221222)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76107873873161806)
,p_view_id=>wwv_flow_api.id(75104800933195815)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(75465523635221223)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75113626941204716)
,p_plug_name=>unistr('Entidades en Investigaci\00F3n')
,p_region_name=>'entidades'
,p_parent_plug_id=>wwv_flow_api.id(75115117922204731)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_slctd_ofcio,',
'       id_embrgos_crtra,',
'       id_entddes,',
'       nmro_acto_slctud,',
'       dscrpcion,',
'       rspnsble,',
'       activo',
'  from v_mc_g_solicitudes_y_oficios',
' where acto_ofcio is null'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(75103837668195811)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75113807201204718)
,p_name=>'ID_SLCTD_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_OFCIO'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75113968567204719)
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
,p_parent_column_id=>wwv_flow_api.id(75105689221195819)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75114089114204720)
,p_name=>'ID_ENTDDES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDDES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('C\00F3digo Entidad')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(75114102721204721)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n de Entidad')
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75114255955204722)
,p_name=>'RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75115280172204732)
,p_name=>'Investigacion'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Recepci\00F3n de Bienes'),
'<span class="fa fa-external-link"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP,41:P41_ID_SLCTD_OFCIO,P41_ID_ENTDDES:&ID_SLCTD_OFCIO.,&ID_ENTDDES.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95331457947269143)
,p_name=>'ACTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Activo;S,Inactivo;N'
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
 p_id=>wwv_flow_api.id(96981679670168003)
,p_name=>'NMRO_ACTO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_SLCTUD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Acto')
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(75113763841204717)
,p_internal_uid=>75113763841204717
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
 p_id=>wwv_flow_api.id(75314182301833427)
,p_interactive_grid_id=>wwv_flow_api.id(75113763841204717)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(75314244720833427)
,p_report_id=>wwv_flow_api.id(75314182301833427)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75314737655833431)
,p_view_id=>wwv_flow_api.id(75314244720833427)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(75113807201204718)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75315266295833434)
,p_view_id=>wwv_flow_api.id(75314244720833427)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(75113968567204719)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75315796902833436)
,p_view_id=>wwv_flow_api.id(75314244720833427)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(75114089114204720)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>117
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75316295954833437)
,p_view_id=>wwv_flow_api.id(75314244720833427)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(75114102721204721)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>251
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75316718122833439)
,p_view_id=>wwv_flow_api.id(75314244720833427)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(75114255955204722)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>385
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75336209519924797)
,p_view_id=>wwv_flow_api.id(75314244720833427)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(75115280172204732)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>175
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96762883690183211)
,p_view_id=>wwv_flow_api.id(75314244720833427)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(95331457947269143)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97026766159890288)
,p_view_id=>wwv_flow_api.id(75314244720833427)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(96981679670168003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75114315390204723)
,p_plug_name=>'Responsables'
,p_region_name=>'responsables'
,p_parent_plug_id=>wwv_flow_api.id(75115117922204731)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.ID_EMBRGOS_RSPNSBLE,',
'       a.ID_EMBRGOS_CRTRA,',
'       a.idntfccion,',
'       b.dscrpcion_idntfccion_tpo,',
'       a.prmer_nmbre || '' '' || a.sgndo_nmbre || '' '' || a.prmer_aplldo  || '' '' || a.sgndo_aplldo nombre,',
'       a.prncpal_s_n,',
'       a.activo',
'  from MC_G_EMBARGOS_RESPONSABLE a',
'  join df_s_identificaciones_tipo b',
'    on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(75103837668195811)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75114563419204725)
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
 p_id=>wwv_flow_api.id(75114626871204726)
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
,p_parent_column_id=>wwv_flow_api.id(75105689221195819)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(75114792966204727)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(75114869543204728)
,p_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(75114990506204729)
,p_name=>'NOMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(75115061701204730)
,p_name=>'PRNCPAL_S_N'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRNCPAL_S_N'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(93975773741433423)
,p_name=>'editar'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Editar',
'<span class="fa fa-pencil"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:RP,56:P56_ID_EMBRGOS_RSPNSBLE,P56_MOSTRAR_TAB:&ID_EMBRGOS_RSPNSBLE.,N'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95331241080269141)
,p_name=>'ACTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Activo;S,Inactivo;N'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(75114474308204724)
,p_internal_uid=>75114474308204724
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
 p_id=>wwv_flow_api.id(75323346038886121)
,p_interactive_grid_id=>wwv_flow_api.id(75114474308204724)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(75323430918886121)
,p_report_id=>wwv_flow_api.id(75323346038886121)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75323941202886123)
,p_view_id=>wwv_flow_api.id(75323430918886121)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(75114563419204725)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75324475278886125)
,p_view_id=>wwv_flow_api.id(75323430918886121)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(75114626871204726)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75324926312886126)
,p_view_id=>wwv_flow_api.id(75323430918886121)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(75114792966204727)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>166
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75325477706886127)
,p_view_id=>wwv_flow_api.id(75323430918886121)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(75114869543204728)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>214
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75325906980886129)
,p_view_id=>wwv_flow_api.id(75323430918886121)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(75114990506204729)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>260
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(75326467240886130)
,p_view_id=>wwv_flow_api.id(75323430918886121)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(75115061701204730)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95235398291174822)
,p_view_id=>wwv_flow_api.id(75323430918886121)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(93975773741433423)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96730122428761571)
,p_view_id=>wwv_flow_api.id(75323430918886121)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(95331241080269141)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(82717000005)
,p_view_id=>wwv_flow_api.id(75323430918886121)
,p_execution_seq=>5
,p_name=>'esta inactivo'
,p_background_color=>'#A6A6A6'
,p_text_color=>'#FFFFFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(95331241080269141)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Inactivo'
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75464403405221212)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(75112557480204705)
,p_button_name=>'btn_Procesar_Embargo'
,p_button_static_id=>'btn_Procesar_Embargo'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enviar a Procesar<br> Embargo'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93975897020433424)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(75112557480204705)
,p_button_name=>'btn_agregar_entidades_a_investigacion'
,p_button_static_id=>'btn_agregar_entidades_a_investigacion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Agregar Entidades <br> A Investigacion'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-clipboard-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95329663274269125)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(75112557480204705)
,p_button_name=>'BTN_AGREGAR_RSPNSBLE'
,p_button_static_id=>'BTN_AGREGAR_RSPNSBLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Agregar Responsable'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-user-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96895812354574901)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(75112557480204705)
,p_button_name=>'btn_cambiar_estado_entidades'
,p_button_static_id=>'btn_cambiar_estado_entidades'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Cambiar Estado <br>de Entidades'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-edit'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6071469742867302)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(75112557480204705)
,p_button_name=>'BTN_RSLTDOS_PRCSMNTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Resultados de <br>Procesamiento'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:109:&SESSION.::&DEBUG.:RP,109:P109_ID_LTE_MDDA_CTLAR_IP:&P40_ID_LTE_MDDA_CTLAR_IP.'
,p_button_condition=>'P40_ID_LTE_MDDA_CTLAR_IP'
,p_button_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6075808738867346)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(75112557480204705)
,p_button_name=>'Ir_a_Embargos'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Ir a Embargos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,110:P110_TPO_EMBRGO:&P40_TPO_EMBRGO.'
,p_icon_css_classes=>'fa-box-arrow-in-ne'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75113300419204713)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(75112760756204707)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95327605171269105)
,p_branch_name=>unistr('Ir a P\00E1gina 57')
,p_branch_action=>'f?p=&APP_ID.:57:&SESSION.::&DEBUG.:RP,57:P57_ID_EMBRGOS_CRTRA:&P40_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(93975897020433424)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95330884938269137)
,p_branch_name=>unistr('Ir a P\00E1gina 56')
,p_branch_action=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:RP,56:P56_ID_EMBRGOS_CRTRA,P56_MOSTRAR_TAB:&P40_ID_EMBRGOS_CRTRA.,S&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(95329663274269125)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(96981531619168002)
,p_branch_name=>unistr('Ir a P\00E1gina 55')
,p_branch_action=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:RP,55:P55_ID_EMBRGOS_CRTRA:&P40_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(96895812354574901)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(103143052910723824)
,p_branch_name=>unistr('Ir a P\00E1gina 67')
,p_branch_action=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:RP,67:P67_ID_TIPO_EMBARGO:&P40_TPO_EMBRGO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(75464403405221212)
,p_branch_sequence=>40
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6071379899867301)
,p_name=>'P40_ID_LTE_MDDA_CTLAR_IP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(75112760756204707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75112843455204708)
,p_name=>'P40_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(75112760756204707)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Es el n\00FAmero de identificaci\00F3n del sujeto asociado a un proceso jur\00EDdico, ingrese un n\00FAmero de identificaci\00F3n del sujeto para buscar de manera puntual el proceso donde este contenida esa identificaci\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75113069610204710)
,p_name=>'P40_TPO_EMBRGO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(75112760756204707)
,p_prompt=>'Tipo de Medida Cautelar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_tpos_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista presentada el tipo de embargo a consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75113108017204711)
,p_name=>'P40_FCHA_INI'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(75112760756204707)
,p_prompt=>'Fecha Desde'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Seleccione del calendario la Fecha inicial para consultar el proceso de investigaci\00F3n de bienes y embargo.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75113227245204712)
,p_name=>'P40_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(75112760756204707)
,p_prompt=>'Fecha Hasta'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Seleccione del calendario la Fecha final para consultar el proceso de investigaci\00F3n de bienes y embargo.')
,p_attribute_02=>'&P40_FECHA_INI.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76650611236038505)
,p_name=>'P40_JSON'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(75112760756204707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91489188598759442)
,p_name=>'P40_IDNTFCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(75112760756204707)
,p_prompt=>unistr('Identificaci\00F3n Responsables')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n del responsable a consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91489212577759443)
,p_name=>'P40_NMBRE_CMPLTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(75112760756204707)
,p_prompt=>'Nombre Completo Responsable'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct r.nmbre_cmplto ||''-[''||trim(r.idntfccion)||'']-[''||trim(r.drccion_ntfccion)||'']'' as nmbre_cmplto ,r.nmbre_cmplto as descripcion',
'from v_mc_g_embargos_responsable r;'))
,p_lov_display_null=>'YES'
,p_cSize=>90
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Ingrese el nombre completo del responsable a consultar.'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91489330528759444)
,p_name=>'P40_ID_ENTDDES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(75112760756204707)
,p_prompt=>'Entidades'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_entddes',
'from  mc_d_entidades a, mc_d_entidades_tipo_embargo b',
'where a.id_entddes = b.id_entddes',
'and b.id_tpos_mdda_ctlar = :P40_TPO_EMBRGO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P40_TPO_EMBRGO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de entidad a consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95327572197269104)
,p_name=>'P40_ID_EMBRGOS_CRTRA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(75112760756204707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76650765433038506)
,p_name=>'al seleccionar datos de la grilla '
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(75103837668195811)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76650809367038507)
,p_event_id=>wwv_flow_api.id(76650765433038506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91489067859759441)
,p_event_id=>wwv_flow_api.id(76650765433038506)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var texto = this.data.selectedRecords.length === 1 ? '' - <b>Cartera: '' + this.data.model.getValue(this.data.selectedRecords[0], "CDGO_CRTRA") + ''</b>'' : '''';',
'console.log(texto)',
'$setDetailTab(''#SR_cartera_tab'', texto);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95329243428269121)
,p_name=>'Al cerrar ventana de agregar entidades'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(93975897020433424)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95329311632269122)
,p_event_id=>wwv_flow_api.id(95329243428269121)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95329465248269123)
,p_name=>'close dialog'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95329587603269124)
,p_event_id=>wwv_flow_api.id(95329465248269123)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var actElment = this.affectedElements[0].activeElement;',
'var idActive = $(actElment).attr(''id'') || $(actElment).data(''action'');',
'var region = (idActive === ''btn_agregar_entidades_a_investigacion''|| idActive === ''btn_Procesar_Embargo''|| idActive === ''all_process'') ? apex.region("entidades") ',
'                                                                                                  : apex.region("responsables");',
'region.refresh();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(60407432490351705)
,p_event_id=>wwv_flow_api.id(95329465248269123)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var actElment = this.affectedElements[0].activeElement;',
'var idActive = $(actElment).attr(''id'') || $(actElment).data(''action'');',
'/*var region = (idActive === ''btn_agregar_entidades_a_investigacion''|| idActive === ''btn_Procesar_Embargo''|| idActive === ''all_process'') ? apex.region("entidades") ',
'                                                                                                  : apex.region("responsables");',
'region.refresh();*/',
'',
'if (idActive === ''btn_cambiar_estado_entidades'') { ',
'    apex.region("entidades").refresh();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95331058675269139)
,p_event_id=>wwv_flow_api.id(95329465248269123)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(75114315390204723)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116932835376382735)
,p_name=>'al hacer clic en el boton iniciar'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(75464403405221212)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116932935786382736)
,p_event_id=>wwv_flow_api.id(116932835376382735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_sel(true);',
'apex.submit(''btn_Procesar_Embargo'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6071535855867303)
,p_name=>'Al hacer clic en el boton enviar a embargo'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(75464403405221212)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6071631624867304)
,p_event_id=>wwv_flow_api.id(6071535855867303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = window.localStorage.jsonEmbargo;',
'let $waitPopup;',
'try {',
'    JSON.parse(json);',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de enviar los registros para realizar el/los embargo(s)?'', (ok) => {'),
'        if (ok) {',
'            if (apex.page.validate()) {',
'                $waitPopup = apex.widget.waitPopup();',
'                apex.server.process("EnviarEmbargo", {',
'                    f01: json,',
'                    pageItems: ""',
'                }).then((resp) => {',
'                    $waitPopup.remove();',
'                    if (resp.o_cdgo_rspsta === 0) {',
'                        //apex.message.showPageSuccess(''Proceso de embargos realizado de forma exitosa. ''+resp.o_mnsje_rspsta);',
'                        //apex.submit();',
'                        Swal.fire({',
unistr('                            title: ''Informaci\00F3n'','),
'                            html: `<h6>Proceso de embargos realizado de forma exitosa. ${resp.o_mnsje_rspsta}</h6>`,',
'                            icon: ''info'',',
'                            allowEscapeKey: false,',
'                            allowOutsideClick: false,',
'                            allowEnterKey: false',
'                        }).then((result) => {',
'                            if (resp.o_url !== ''#''){',
'                                window.location.href = resp.o_url;',
'                            }',
'                        });',
'                        ',
'                        /*if (resp.o_url !== ''#''){',
'                            window.location.href = resp.o_url;',
'                        }*/',
'                    }else{',
'                        Swal.fire({        ',
'                            icon: ''error'',',
unistr('                            title:  ''<H2 >Validaci\00F3n</H2>'','),
'                            html:   `<h4>${resp.o_cdgo_rspsta+''-''+resp.o_mnsje_rspsta}</h4>`',
'                        }); ',
'                    }',
'                });',
'            }',
'        }',
'    })',
'',
'} catch (e) {',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'        {',
'            type: "error",',
'            location: ["page"],',
'            message: "No se encontraron datos seleccionados",',
'            unsafe: false',
'        }]);',
'} finally {',
'    if ($waitPopup)',
'        $waitPopup.remove();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57849827376104912)
,p_name=>'Al cambiar fecha'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P40_FCHA_INI'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57849914113104913)
,p_event_id=>wwv_flow_api.id(57849827376104912)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P40_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P40_FCHA_INI").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75112439896204704)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(75103837668195811)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Investigaci\00F3n de Bienes: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76651171147038510)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar embargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'PKG_CB_MEDIDAS_CAUTELARES.prc_procesar_embargo(p_cdgo_clnte => :f_cdgo_clnte,',
'                                                   p_id_usuario => :f_id_usrio,',
'                                                   p_json => :p40_json);',
'                                                   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(75464403405221212)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6071761632867305)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EnviarEmbargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                     clob;',
'    v_url                      varchar2(4000);',
'    v_id_lte_mdda_ctlar_ip    number := 0;',
'    o_cdgo_rspsta             number;',
'    o_mnsje_rspsta            varchar2(1000);',
'    v_rgstros_no_prcsdos        number;',
'    v_mnsje                    varchar2(1000);',
'begin',
'     for i in 1..apex_application.g_f01.count ',
'     loop',
'         v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;',
'                                                   ',
'    PKG_CB_MEDIDAS_CAUTELARES.prc_rg_embargos(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                   p_id_usuario     => :F_ID_USRIO,',
'                                                   p_json           => v_json,',
'                                                   o_id_lte_mdda_ctlar_ip => v_id_lte_mdda_ctlar_ip,',
'                                                   o_cdgo_rspsta => o_cdgo_rspsta,',
'                                                   o_mnsje_rspsta => o_mnsje_rspsta);',
'    ',
'    v_url := ''#'';',
'    ',
'    if o_cdgo_rspsta = 0 then',
'        v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':40:''|| v(''APP_SESSION'')||''::NO::P40_ID_LTE_MDDA_CTLAR_IP:''||v_id_lte_mdda_ctlar_ip, p_checksum_type => ''SESSION'');',
'    end if;',
'    /*htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_id_lte_mdda_ctlar_ip is null ',
'                                 then ''Registros enviados a Embargar Correctamente!!''',
'                                 else ''Algunos registros no fueron procesados'' ',
'                            end||''"}'');*/',
'                            ',
'    select count(1) into v_rgstros_no_prcsdos',
'    from mc_g_lotes_mdda_ctlar_dtlle a',
'    join mc_g_lotes_mdda_ctlar b on a.id_lte_mdda_ctlar = b.id_lte_mdda_ctlar',
'    where a.id_lte_mdda_ctlar = v_id_lte_mdda_ctlar_ip',
'    and b.tpo_lte = ''NPE'';',
'    ',
'    if v_rgstros_no_prcsdos > 0 then',
'       -- o_cdgo_rspsta := 10;',
unistr('        o_mnsje_rspsta := v_rgstros_no_prcsdos||'' registros no pudieron ser procesados, consulte el lote #''||v_id_lte_mdda_ctlar_ip||'' para m\00E1s infromaci\00F3n.'';'),
'    end if;',
'                           ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'',  o_mnsje_rspsta);',
'    apex_json.write(''o_url'', v_url); ',
'    apex_json.close_object;',
'exception',
'    when others then',
'        --htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}'');',
'        v_mnsje := ''Callback: Error al intentar procesar registros a la etapa de embargos.''||sqlerrm;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', 99);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
