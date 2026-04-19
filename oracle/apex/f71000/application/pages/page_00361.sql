prompt --application/pages/page_00361
begin
wwv_flow_api.create_page(
 p_id=>361
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Validar Cuota Incial'
,p_step_title=>'Validar Cuota Incial'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}',
'function apenascargue(){',
'      var vgncia_prdo = [];',
'    // trae el valor del json',
'    if($v(''P69_VGNCIA_PRDO'')){',
'        try{',
'            // convierte en tipo json',
'            vgncia_prdo = JSON.parse($v(''P69_VGNCIA_PRDO''));                    ',
'        }catch(e){',
'            vgncia_prdo = [];',
'        }',
'    }   ',
unistr('    //si el json est\00E1 lleno '),
'    if (vgncia_prdo.length > 0){      ',
'        // construye la vista',
'        var view = apex.region(''deudas'').widget().interactiveGrid("getCurrentView"); ',
'        // recorremos el json trayendo el valor',
'        vgncia_prdo = vgncia_prdo.map(m => Number(m.ID_ORGEN));',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;        ',
'        // trae todos los registros del modelo',
'        var records = model._data;',
'        console.log(vgncia_prdo, records);',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f)=> {',
'            return vgncia_prdo.indexOf(Number(model.getValue(f, ''ID_ORGEN''))) > -1',
'        });',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);',
'    } ',
'}',
'',
'/*function apenascargue(){',
'    var view = apex.region("deudas").widget().interactiveGrid("getCurrentView"),',
'    model = view.model;      ',
'    var seleccionados = $v("P69_VGNCIA_PRDO");',
'    var arrSeleccionados = seleccionados.split('':'').map((f) =>{',
'        return model._data.filter((data) => {',
'                var arr =f.split('','');',
'                return model.getValue(data, ''VGNCIA'') === arr[0] &&  model.getValue(data, ''PRDO'') === arr[1]',
'            })[0]',
'    }).filter(f => f);',
'        view.setSelectedRecords(arrSeleccionados); ',
'}',
'',
'function VigenciasSeleccionadas() {',
'    var i, records, record, sal, model,',
'        vgncia_prdo = '''',',
'        num_vigencias_seleccionadas = 0,',
'        view = apex.region("deudas").widget().interactiveGrid("getCurrentView");',
'        model = view.model;',
'        records = view.getSelectedRecords();',
'        if ( records.length > 0 ) { ',
'            for ( i = 0; i < records.length; i++ ) {',
'                record = records[i];',
'                console.log(i, record);',
'                num_vigencias_seleccionadas = num_vigencias_seleccionadas + 1; ',
'                 console.log(i, num_vigencias_seleccionadas);',
'                vgncia_prdo = vgncia_prdo + '':'' + parseFloat(model.getValue(record, "VGNCIA")) + '',''+ parseFloat(model.getValue(record, "PRDO")) + '','' + parseFloat(model.getValue(record, "ID_ORGEN"));',
'                console.log(i, vgncia_prdo);',
'           }               ',
'        } ',
'',
'         $s("P69_NMRO_VGNCIA_SLCCNDA", num_vigencias_seleccionadas);',
'         $s("P69_VGNCIA_PRDO", vgncia_prdo.substr(1, vgncia_prdo.length));',
'        console.log($v(''P69_VGNCIA_PRDO''));',
'}*/',
'',
' '))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buttonCollapse(''t_Button_rightControlButton'');',
'apenascargue();',
'',
'if($v(''P69_ID_CNVNIO'')){',
'    if ($v(''P69_INDCDOR_RQRE_CTA_INCIAL'')=== ''S''){',
'        apex.item(''cuotaInicial'').show();     ',
'    }else{',
'        apex.item(''cuotaInicial'').hide();',
'    }        ',
'} ',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_VALIDAR_DOCUMENTO{',
'    padding: 0.3rem !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20220104090101'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(421614279249174345)
,p_plug_name=>'Validaciones'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(73655524996021574)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(162524641414228979)
,p_plug_name=>'Carteras Revocadas'
,p_parent_plug_id=>wwv_flow_api.id(421614279249174345)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(nvl(a.vlor_sldo_cptal,0))                             vlor_sldo_cptal',
'        , sum(nvl(a.vlor_intres,0))                                 vlor_intres',
'        , sum(nvl(a.vlor_sldo_cptal,0)) + sum(nvl(a.vlor_intres,0)) vlor_ttal',
'        , a.vgncia',
'        , a.prdo',
'        , a.id_orgen ',
'        , a.cdgo_mvmnto_orgn ',
'        , a.vgncia || a.prdo || a.cdgo_mvmnto_orgn || a.id_orgen as id',
'        , ''Revocada'' Estado',
'from v_gf_g_cartera_x_concepto    a',
'       join v_gf_g_convenios_cartera  b on a.vgncia = b.vgncia',
'                                            and a.id_prdo                   = b.id_prdo',
'                                            and a.id_orgen                  = b.id_orgen',
'                                            and a.id_cncpto                 = b.id_cncpto',
'                                            and b.cdgo_cnvnio_estdo         = ''RVC''',
'  where a.id_sjto_impsto              = :P41_ID_SJTO_IMPSTO',
'     and a.id_impsto                  = :P41_ID_IMPSTO           ',
'     and a.id_impsto_sbmpsto          = :P41_ID_IMPSTO_SBMPSTO',
'    and a.cdgo_mvnt_fncro_estdo      = ''NO''',
'    and a.vlor_sldo_cptal            > 0',
' group by a.vgncia',
'        , a.prdo',
'        , a.id_orgen',
'        , a.id_orgen',
'        , a.cdgo_mvmnto_orgn;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(162527008433229003)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(162527121939229004)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Interes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(162527294008229005)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(162527319976229006)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(162527467016229007)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(162527586109229008)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Origen'
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
 p_id=>wwv_flow_api.id(162527646326229009)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cdgo Mvmnto Orgn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(162527781023229010)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>123
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
 p_id=>wwv_flow_api.id(162527987019229012)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(162526981604229002)
,p_internal_uid=>162526981604229002
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
 p_id=>wwv_flow_api.id(162550652384330437)
,p_interactive_grid_id=>wwv_flow_api.id(162526981604229002)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(162550768050330437)
,p_report_id=>wwv_flow_api.id(162550652384330437)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(162551214289330439)
,p_view_id=>wwv_flow_api.id(162550768050330437)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(162527008433229003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(162551747777330441)
,p_view_id=>wwv_flow_api.id(162550768050330437)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(162527121939229004)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(162552211090330446)
,p_view_id=>wwv_flow_api.id(162550768050330437)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(162527294008229005)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(162552790631330448)
,p_view_id=>wwv_flow_api.id(162550768050330437)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(162527319976229006)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(162553232846330450)
,p_view_id=>wwv_flow_api.id(162550768050330437)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(162527467016229007)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(162553755463330452)
,p_view_id=>wwv_flow_api.id(162550768050330437)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(162527586109229008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(162554298701330454)
,p_view_id=>wwv_flow_api.id(162550768050330437)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(162527646326229009)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(162554710880330456)
,p_view_id=>wwv_flow_api.id(162550768050330437)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(162527781023229010)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(162564361098364845)
,p_view_id=>wwv_flow_api.id(162550768050330437)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(162527987019229012)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(422837378085488839)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
'    <p align="justify">Funcionalidad de Solicitud de Acuerdo de Pago.<br> ',
'        <b> <center> Paso 2 Datos de Acuerdo de Pago</center> </b> <br>',
unistr('        <b>1.</b> Se debe ingresar el n\00FAmero del documento de la cuota inicial y validarlo haciendo clic en el bot\00F3n que esta a su derecha.<br><br>'),
unistr('        Si el documeto de cuota inicial ingresado se gener\00F3 desde una proyecci\00F3n de acuerdo de pago, al validar se carga la informaci\00F3n de la proyecci\00F3n.<br><br>'),
'        ',
unistr('        <b>2.</b> Debe seleccionar o confirmar la fecha de la primera cuota, el n\00FAmero de cuotas del acuerdo (respetando el n\00FAmero m\00E1ximo de cuotas) y seleccionar la periodicidad.<br> <br> '),
'        <b>Nota:</b> Se debe tener en cuenta la fecha limite de cuotas para diligenciar la fecha para presentar la solicitud y la fecha en la cual va a pagar la cuota inicial.</br> <br>',
unistr('        <b>3.</b> Selecionar la cartera que har\00E1 parte del acuerdo de pago.<br>   '),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(152335271764709294)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(421614279249174345)
,p_button_name=>'CANCEL'
,p_button_static_id=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''CANCEL'')'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(152336474205709308)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(421614279249174345)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(152347964804709349)
,p_branch_name=>unistr('Ir a P\00E1gina')
,p_branch_action=>'f?p=&APP_ID.:&P361_BRANCH.:&SESSION.::&DEBUG.:RP,41,44,43,53,72::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(152335271764709294)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(152348302527709349)
,p_branch_name=>unistr('Ir a P\00E1gina 41- Informaci\00F3n B\00E1sica')
,p_branch_action=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(152336474205709308)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10269803458937501)
,p_name=>'P361_MENSAJE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(162524641414228979)
,p_prompt=>'<b><p style="color:blue">El Sujeto Impuesto tiene carteras revocadas con saldo, debe cancelarlas para realizar un acuerdo de pago.</b> '
,p_display_as=>'NATIVE_PCT_GRAPH'
,p_colspan=>10
,p_grid_column=>3
,p_grid_label_column_span=>7
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152336838508709308)
,p_name=>'P361_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(421614279249174345)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152337218289709311)
,p_name=>'P361_BRANCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(421614279249174345)
,p_item_default=>'47'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(152342560314709340)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P361_ID_INSTNCIA_FLJO'
,p_compute_when=>'P361_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(152346007346709347)
,p_name=>unistr('Actualizar Pag\00EDna')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P361_ID_CNVNIO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152346579323709347)
,p_event_id=>wwv_flow_api.id(152346007346709347)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(152346958149709348)
,p_name=>'Al Ingresar Documento'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P361_NMRO_DCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(152347414784709348)
,p_event_id=>wwv_flow_api.id(152346958149709348)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P361_NMRO_DCMNTO'')){',
'    apex.item(''BTN_VALIDAR_DOCUMENTO'').show();',
'}else{',
'    apex.item(''BTN_VALIDAR_DOCUMENTO'').hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
end;
/
