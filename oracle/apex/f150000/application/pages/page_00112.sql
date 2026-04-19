prompt --application/pages/page_00112
begin
wwv_flow_api.create_page(
 p_id=>112
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Cartera -  Proyecci\00F3n de Acuerdo')
,p_step_title=>unistr('Cartera -  Proyecci\00F3n de Acuerdo')
,p_autocomplete_on_off=>'OFF'
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
'    if($v(''P112_VGNCIA_PRDO'')){',
'        try{',
'            // convierte en tipo json',
'            vgncia_prdo = JSON.parse($v(''P112_VGNCIA_PRDO''));                    ',
'        }catch(e){',
'            vgncia_prdo = [];',
'        }',
'    }   ',
unistr('    //si el json est\00E1 lleno '),
'    if (vgncia_prdo.length > 0){      ',
'        // construye la vista',
'        var view = apex.region(''deuda'').widget().interactiveGrid("getCurrentView"); ',
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
'',
' '))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buttonCollapse(''t_Button_rightControlButton'');',
'apenascargue();',
'if( apex.region("deuda") )',
'    apex.region("deuda").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200608160520'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116336594093266997)
,p_plug_name=>'Cartera'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(72870253246195914)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116336693910266997)
,p_plug_name=>'Cartera'
,p_region_name=>'deuda'
,p_parent_plug_id=>wwv_flow_api.id(116336594093266997)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id',
'        , a.vgncia',
'        , a.prdo',
'        , sum(a.vlor_sldo_cptal) vlor_sldo_cptal',
'        , sum(a.vlor_intres) vlor_intres',
'        , sum(a.vlor_sldo_cptal) + sum(a.vlor_intres) vlor_ttal',
'        , a.vgncia_pryccion',
'        , a.id_orgen',
'        , a.cdgo_mvmnto_orgn',
'     from (',
'            select a.vgncia || a.prdo || a.cdgo_mvmnto_orgn || a.id_orgen as id',
'                 , a.vgncia',
'                 , a.prdo',
'                 , vlor_sldo_cptal',
'                 , case when gnra_intres_mra = ''S'' then ',
'                        pkg_gf_movimientos_financiero.fnc_cl_interes_mora (  p_cdgo_clnte         =>  a.cdgo_clnte,',
'                                                                             p_id_impsto          =>  a.id_impsto,',
'                                                                             p_id_impsto_sbmpsto  =>  a.id_impsto_sbmpsto,',
'                                                                             p_vgncia             =>  a.vgncia,',
'                                                                             p_id_prdo            =>  a.id_prdo,',
'                                                                             p_id_cncpto          =>  a.id_cncpto,',
'                                                                             p_cdgo_mvmnto_orgn   =>  a.cdgo_mvmnto_orgn,',
'                                                                             p_id_orgen           =>  a.id_orgen,',
'                                                                             p_vlor_cptal         =>  a.vlor_sldo_cptal ,',
'                                                                             p_indcdor_clclo      =>  ''CLD'',',
'                                                                             p_fcha_pryccion      =>  sysdate)',
'                    else',
'                        0',
'                   end as           vlor_intres',
'                 , a.vgncia         vgncia_pryccion',
'                 , a.id_orgen',
'                 , a.cdgo_mvmnto_orgn',
'              from v_gf_g_cartera_x_concepto        a',
'         left join gf_g_proyecciones_cartera        b on b.id_pryccion = :P111_ID_PRYCCION',
'               and b.vgncia                         = a.vgncia',
'               and b.id_prdo                        = a.id_prdo',
'               and b.id_orgen                       = a.id_orgen',
'             where a.cdgo_clnte                     = :F_CDGO_CLNTE',
'               and a.id_impsto                      = :P111_ID_IMPSTO',
'               and a.id_impsto_sbmpsto              = :P111_ID_IMPSTO_SBMPSTO',
'               and a.id_sjto_impsto                 = :P111_ID_SJTO_IMPSTO',
'               and (a.cdgo_mvnt_fncro_estdo         = ''NO'' or b.id_pryccion is not null)',
'           order by a.vgncia',
'                  , a.prdo',
'     ) a',
' where a.vlor_sldo_cptal > 0',
' group by id',
'        , a.vgncia',
'        , a.prdo',
'        , a.vgncia_pryccion',
'        , a.id_orgen',
'        , a.cdgo_mvmnto_orgn',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101985315930868489)
,p_name=>'VGNCIA_PRYCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA_PRYCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(115231613334316107)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(115231775957316108)
,p_name=>'Selector'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116214513003492832)
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116214620443492833)
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116214783617492834)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(116214869285492835)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Interes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(120858328880822990)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(120858486314822991)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(138651344205065298)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(116214398643492831)
,p_internal_uid=>116214398643492831
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
 p_id=>wwv_flow_api.id(116803120165983458)
,p_interactive_grid_id=>wwv_flow_api.id(116214398643492831)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(116803265885983459)
,p_report_id=>wwv_flow_api.id(116803120165983458)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101991467449868660)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(101985315930868489)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116803696495983461)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(116214513003492832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116804294169983464)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(116214620443492833)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116804785287983466)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(116214783617492834)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(116805215903983467)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(116214869285492835)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117152602315532393)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(115231613334316107)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120904962018399614)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(120858328880822990)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120912075010557634)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(120858486314822991)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138781411304230482)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(138651344205065298)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(40712000030)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(116214783617492834)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(212517000035)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(116214869285492835)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(306959000035)
,p_view_id=>wwv_flow_api.id(116803265885983459)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(115231613334316107)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117559692929581491)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
unistr('    <p align="justify"> Funcionalidad de Proyecci\00F3n de Acuerdos de Pago.<br> '),
'        <b> <center> Paso 2 Seleccionar Cartera </center> </b> <br>',
'        Se muestran las vigencias con saldo aptas para ser parte de un acuerdo de pago. <br> <br>',
unistr('        De acuerdo al tipo de acuerdo de pago seleccionado, se deber\00E1n seleccionar todas las vigencias o s\00F3lo algunas.<br>   '),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72887114598200688)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(116336594093266997)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Salir de la Funcionalidad?, Tenga en Cuenta Pueden Perderse los Datos.'',''CANCEL'')'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72887500790200744)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(116336594093266997)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72887963081200744)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(116336594093266997)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72897013560201029)
,p_branch_name=>'Go To Page 114 - Datos del Convenio'
,p_branch_action=>'f?p=&APP_ID.:114:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72887500790200744)
,p_branch_sequence=>20
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72897484509201030)
,p_branch_name=>'Go To Page 113 - Cuota Inicial'
,p_branch_action=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72887500790200744)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(72896644020201029)
,p_branch_name=>unistr('Ir a P\00E1gina 111 -  Sujeto Impuesto')
,p_branch_action=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72887963081200744)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(70821160731843732)
,p_branch_name=>unistr('Ir a P\00E1gina 110 - Inicio')
,p_branch_action=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,111,112,113,114,115::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(72887114598200688)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5618188005742844)
,p_name=>'P112_RNGO_VGNCIA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(116336693910266997)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72893176962200938)
,p_name=>'P112_NMRO_VGNCIA_SLCCNDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(116336693910266997)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72893459650200938)
,p_name=>'P112_VGNCIA_PRDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(116336693910266997)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72893830521200975)
,p_name=>'P112_PRDOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(116336693910266997)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(72894517308200977)
,p_computation_sequence=>10
,p_computation_item=>'P112_VGNCIA_PRDO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select json_arrayagg( json_object(key ''VGNCIA'' is a.vgncia,',
'                                  key ''PRDO'' is a.prdo,',
'                                  key ''ID_ORGEN'' is a.id_orgen,',
'                                  key ''CDGO_MVMNTO_ORGEN'' is a.cdgo_mvmnto_orgen)) json',
'  from (select vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'          from v_gf_g_proyecciones_cartera',
'         where id_pryccion = :P111_ID_PRYCCION',
'        group by vgncia, prdo, id_orgen, cdgo_mvmnto_orgen',
'        )a;'))
,p_compute_when=>'P112_VGNCIA_PRDO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5618225901742845)
,p_computation_sequence=>20
,p_computation_item=>'P112_RNGO_VGNCIA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select rngo_vgncia',
'     from gf_d_convenios_tipo',
'    where id_cnvnio_tpo        = :P111_ID_CNVNIO_TPO'))
,p_compute_when=>'P111_ID_CNVNIO_TPO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72894938528201026)
,p_validation_name=>unistr('Selecci\00F3n una o mas Vigencias-Periodo')
,p_validation_sequence=>10
,p_validation=>'P112_VGNCIA_PRDO'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>unistr('Debe seleccionar una o m\00E1s Vigencias para poder continuar')
,p_when_button_pressed=>wwv_flow_api.id(72887500790200744)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72895371688201027)
,p_validation_name=>'Validar Cartera Convenida'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_vgncia_crtra            varchar2(2000);',
'    v_cntdad_orgen_cnvnda     number;',
'    v_cntdad_slccndos         number;',
'    ',
'begin',
'    ',
'   select count(1)',
'     into v_cntdad_slccndos',
'     from json_table (:P112_VGNCIA_PRDO, ''$[*]'' columns (id_orgen   path ''$.ID_ORGEN''',
'                                                       ,vgncia    path ''$.VGNCIA''  ',
'                                                       ,prdo      path ''$.PRDO''',
'                                                     )',
'                     )b ;',
'                                  ',
'    select listagg(a.id_orgen, '','') within group (order by a.id_orgen), count(c.id_orgen)',
'      into v_vgncia_crtra, v_cntdad_orgen_cnvnda',
'      from v_gf_g_convenios_cartera a',
'      join gf_g_proyecciones_cartera b on b.id_pryccion = :P111_ID_PRYCCION',
'                                     and b.vgncia = a.vgncia',
'                                     and b.id_prdo = a.id_prdo',
'                                     and b.id_orgen = a.id_orgen',
'      left join json_table (:P112_VGNCIA_PRDO, ''$[*]'' columns (id_orgen   path ''$.ID_ORGEN''',
'                                                         ,vgncia    path ''$.VGNCIA''  ',
'                                                         ,prdo      path ''$.PRDO''',
'                                                        )',
'                        )c on a.id_orgen    = c.id_orgen',
'                          and a.vgncia      = c.vgncia',
'                          and a.prdo        = c.prdo',
'     where a.cdgo_cnvnio_estdo = ''APL'';',
'     ',
'    if (v_vgncia_crtra is not null) then',
'        if (v_cntdad_orgen_cnvnda <> v_cntdad_slccndos) then',
unistr('            return ''la cartera se encuentra convenida para los or\00EDgenes ''|| v_vgncia_crtra||''. S\00ED desea realice una nueva proyecci\00F3n para las vigencias restantes''; '),
'        else',
unistr('            return ''la cartera se encuentra convenida para los or\00EDgenes ''|| v_vgncia_crtra; '),
'        end if;        ',
'    else',
'        return null;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(72887500790200744)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72895661774201027)
,p_name=>'Al seleccionar las vigencias'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(116336693910266997)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(72896116830201029)
,p_event_id=>wwv_flow_api.id(72895661774201027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(this.data.selectedRecords.length > 0) {',
'    var model = this.data.model;',
'    var records = this.data.selectedRecords; ',
'    var ids="";',
'    var vgncia_prdo="";',
'    ',
'    var json = records.map(function (record){',
'        ids += model.getValue( record, ''ID'' ) + '':'';',
'        vgncia_prdo += model.getValue( record, ''VGNCIA'' ) + model.getValue( record, ''PRDO'' ) + '':'';',
'        return {''VGNCIA'':  parseFloat(model.getValue(record, ''VGNCIA'')),',
'                ''PRDO'':  parseFloat(model.getValue(record, ''PRDO'')),',
'                ''CDGO_MVMNTO_ORGN'':  model.getValue(record, ''CDGO_MVMNTO_ORGN''),',
'                ''ID_ORGEN'': model.getValue(record, ''ID_ORGEN'' )',
'               };',
'    });',
'       ',
'      $s(''P112_PRDOS'', vgncia_prdo);',
'      $s(''P112_VGNCIA_PRDO'', ids);',
'}else{',
'    $s(''P112_VGNCIA_PRDO'', null);',
'}',
'',
'if($v(''P112_RNGO_VGNCIA'') == ''T'' ){',
'      apex.region("deuda").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");    ',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
