prompt --application/pages/page_00083
begin
wwv_flow_api.create_page(
 p_id=>83
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripci\00F3n Proyecci\00F3n')
,p_step_title=>unistr('Prescripci\00F3n Proyecci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function revertir(){',
'    var event = new Event(''eventRevertir'');',
'    window.dispatchEvent(event);',
'}',
'',
'function validar_sel() {',
'    var region = apex.region("P83_GRID_RGLAS_NGCIO");',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records_ = view.view$.grid("getSelectedRecords");//todos los seleccionados',
'        var records = model._data; //todos los datos de la grilla',
'        //REALIZAMOS UN FILTRO DE TODOS LOS DATOS SELECCIONADOS DEL INTERACTIVE GRID QUE NO ESTEN PROCESADOS',
'        records = records.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_EDTA_RGLA").v === ''N''',
'        });',
'        ',
'        records_.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_EDTA_RGLA").v !== ''N''',
'        }).forEach(function (f){',
'            records.push(f);',
'        });',
'        ',
'        ',
'        var json  = records.map(function (m) {',
'           return model.getValue(m, "ID_RGLA_NGCIO_CLNTE_FNCION").trim();',
'        });',
'         $s("P83_RGLAS_NGCIO", json.length > 0 ? json : '''');',
'        //SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID ',
'        region.widget().interactiveGrid("setSelectedRecords", records);',
'        return;',
'    }',
'}',
'',
'async function fnc_generarDocumentos(p_id_rcrso_dcmnto){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_generarDocumentos", {',
'            x01 : p_id_rcrso_dcmnto,',
'            pageItems: "#P83_ID_PRSCRPCION"',
'        }, {',
'            success: function( pData ){',
'                if (pData.o_cdgo_rspsta != 0){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P83_DTOS_FLJO .t-TabsRegion-items{',
'    min-height: 100px !important;',
'}',
'#P83_DCMNTOS_GNRDOS_ig_report_settings {',
'    display: none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20221031144746'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75764526754565119)
,p_plug_name=>'WorkFlow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76364512909683201)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77543623236993401)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
unistr('</h5>Funcionalidad que autom\00E1ticamente analiza y genera una respuesta a la prescripci\00F3n.</i>'),
'<br>',
'<br>',
unistr('<i><b>1. </b>Seleccionar las reglas de validaci\00F3n para analizar a prescripci\00F3n.</i>'),
'<br>',
'<br>',
unistr('<i><b>2. </b>Seg\00FAn el caso gestionar las respuestas generadas por el an\00E1lisis hecho a cada una de las vigencias.</i>'),
'<br>',
'<br>',
unistr('<i><b>3. </b>Ir a p\00E1gina de gesti\00F3n de documentos donde se generan basados en plantillas creadas previamente.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96686539704518901)
,p_plug_name=>'Resumen Sujeto-Tributo'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96657013438458201)
,p_plug_name=>'Reglas de Negocio'
,p_region_name=>'P83_GRID_RGLAS_NGCIO'
,p_parent_plug_id=>wwv_flow_api.id(96686539704518901)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_rgla_ngcio_clnte',
'           ,b.id_impsto',
'           ,e.nmbre_impsto',
'           ,b.id_impsto_sbmpsto ',
'           ,e.nmbre_impsto_sbmpsto',
'           ,c.nmbre nmbre_rgla_ngcio',
'           ,b.indcdor_edta_rgla',
'           ,a.id_rgla_ngcio_clnte_fncion',
'           ,d.dscrpcion',
'from        gn_d_rglas_ngcio_clnte_fnc      a',
'inner join  gn_d_reglas_negocio_cliente     b   on  b.id_rgla_ngcio_clnte   =   a.id_rgla_ngcio_clnte',
'inner join  gn_d_reglas_negocio             c   on  c.id_rgla_ngcio         =   b.id_rgla_ngcio',
'inner join  gn_d_funciones                  d   on  d.id_fncion             =   a.id_fncion',
'inner join  v_df_i_impuestos_subimpuesto    e   on  e.id_impsto             =   b.id_impsto',
'                                                and e.id_impsto_sbmpsto     =   b.id_impsto_sbmpsto',
'where       b.cdgo_clnte    =       :F_CDGO_CLNTE',
'and         c.id_prcso      =       12',
'and         a.actvo         =       ''S''',
'and         sysdate         between b.fcha_incio and b.fcha_fin',
'and         exists(select   1',
'                   from     gf_g_prscrpcnes_sjto_impsto f',
'                   where    f.id_prscrpcion     =   :P83_ID_PRSCRPCION',
'                   and      f.cdgo_clnte        =   b.cdgo_clnte',
'                   and      f.id_impsto         =   b.id_impsto',
'                   and      f.id_impsto_sbmpsto =   b.id_impsto_sbmpsto',
'            )'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P83_DSCRPCION_RSPSTA'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96657372076458204)
,p_name=>'ID_RGLA_NGCIO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96657484393458205)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(96657548452458206)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(96657640895458207)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96657723960458208)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(96657850200458209)
,p_name=>'NMBRE_RGLA_NGCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RGLA_NGCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Regla de Negocio'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96657944296458210)
,p_name=>'INDCDOR_EDTA_RGLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_EDTA_RGLA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Editable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(177372678491050686)
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96658184513458212)
,p_name=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RGLA_NGCIO_CLNTE_FNCION'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96658243197458213)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Funci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(96658421834458215)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(96657208321458203)
,p_internal_uid=>96657208321458203
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
 p_id=>wwv_flow_api.id(96665094056478381)
,p_interactive_grid_id=>wwv_flow_api.id(96657208321458203)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(96665137778478382)
,p_report_id=>wwv_flow_api.id(96665094056478381)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96665615099478384)
,p_view_id=>wwv_flow_api.id(96665137778478382)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(96657372076458204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96666154935478388)
,p_view_id=>wwv_flow_api.id(96665137778478382)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(96657484393458205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96666646303478389)
,p_view_id=>wwv_flow_api.id(96665137778478382)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(96657548452458206)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96667121142478391)
,p_view_id=>wwv_flow_api.id(96665137778478382)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(96657640895458207)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96667610963478392)
,p_view_id=>wwv_flow_api.id(96665137778478382)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(96657723960458208)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>2
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96668100594478393)
,p_view_id=>wwv_flow_api.id(96665137778478382)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(96657850200458209)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
,p_break_order=>10
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96668640017478395)
,p_view_id=>wwv_flow_api.id(96665137778478382)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(96657944296458210)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96669624742478397)
,p_view_id=>wwv_flow_api.id(96665137778478382)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(96658184513458212)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(96670103955478398)
,p_view_id=>wwv_flow_api.id(96665137778478382)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(96658243197458213)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120600715681024701)
,p_plug_name=>'No. de Sujetos Tributo: &P83_TTAL_SJTOS_TRBTO.'
,p_parent_plug_id=>wwv_flow_api.id(96686539704518901)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select     ',
'            a.id_prscrpcion,',
'            a.id_instncia_fljo,',
'            b.idntfccion_sjto_frmtda idntfccion,',
'            a.nmbre_impsto,',
'            a.nmbre_impsto_sbmpsto,',
'            a.id_prscrpcion_sjto_impsto,',
'            c.id_prscrpcion_vgncia,',
'            c.vgncia,',
'            c.prdo,',
'            c.dscrpcion_prdo,',
'            c.indcdor_aprbdo',
'from        v_gf_g_prscrpcnes_sjto_impsto   a',
'inner join  v_si_i_sujetos_impuesto         b   on  b.cdgo_clnte                =   a.cdgo_clnte',
'                                                and b.id_impsto                 =   a.id_impsto',
'                                                and b.id_sjto_impsto            =   a.id_sjto_impsto',
'inner join  v_gf_g_prscrpcnes_vgncia        c   on  c.id_prscrpcion_sjto_impsto =   a.id_prscrpcion_sjto_impsto',
'where       a.id_prscrpcion =   :P83_ID_PRSCRPCION;*/',
'',
'select      /*+ RESULT_CACHE */ ',
'            a.id_prscrpcion,',
'            a.id_instncia_fljo,',
'            a.idntfccion_sjto_frmtda idntfccion,',
'            a.nmbre_impsto,',
'            a.nmbre_impsto_sbmpsto,',
'            a.id_prscrpcion_sjto_impsto,',
'            c.id_prscrpcion_vgncia,',
'            c.vgncia,',
'            c.prdo,',
'            c.dscrpcion_prdo,',
'            c.indcdor_aprbdo',
'from        v_gf_g_prscrpcnes_sjto_impsto   a',
'inner join  v_gf_g_prscrpcnes_vgncia        c   on  c.id_prscrpcion_sjto_impsto =   a.id_prscrpcion_sjto_impsto',
'where       a.id_prscrpcion =   :P83_ID_PRSCRPCION;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(120606904030098102)
,p_name=>'ID_PRSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(120607075786098103)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(120607181416098104)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(120607224818098105)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(120607342931098106)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(120608161595098114)
,p_name=>'ID_PRSCRPCION_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(121257962247815301)
,p_name=>'ID_PRSCRPCION_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(121258021237815302)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(121258104360815303)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(121258207466815304)
,p_name=>'DSCRPCION_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n Periodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(121258316958815305)
,p_name=>'INDCDOR_APRBDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_APRBDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFAplica Prescripci\00F3n?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>unistr('STATIC:S\00ED;S,No;N,Pendiente;P')
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
 p_id=>wwv_flow_api.id(121258464785815306)
,p_name=>'VALIDACIONES'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Validaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:85:&SESSION.::&DEBUG.:RP,85:P85_ID_PRSCRPCION_VGNCIA:&ID_PRSCRPCION_VGNCIA.'
,p_link_text=>'Ver <span aria-hidden="true" class="fa fa-eye"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(120606861401098101)
,p_internal_uid=>120606861401098101
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
 p_id=>wwv_flow_api.id(120612787069098878)
,p_interactive_grid_id=>wwv_flow_api.id(120606861401098101)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(120612843248098878)
,p_report_id=>wwv_flow_api.id(120612787069098878)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120613383725098883)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(120606904030098102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120613876065098885)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(120607075786098103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120614370306098887)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(120607181416098104)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>256
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120614828994098888)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(120607224818098105)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120615350713098889)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(120607342931098106)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120629179487143440)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(120608161595098114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121263978289815474)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(121257962247815301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121264421348815477)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(121258021237815302)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121264956298815478)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(121258104360815303)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121265489196815479)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(121258207466815304)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121265919644815481)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(121258316958815305)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121270467891845967)
,p_view_id=>wwv_flow_api.id(120612843248098878)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(121258464785815306)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(314387321560466712)
,p_plug_name=>'Actos'
,p_parent_plug_id=>wwv_flow_api.id(96686539704518901)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_acto_tpo,',
'            b.dscrpcion,',
'            f.id_acto,',
'            f.id_dcmnto,',
unistr('            decode(a.indcdor_oblgtrio, ''S'', ''S\00ED'', ''No'') indcdor_oblgtrio,'),
'            case',
'                when (a.id_acto_tpo_rqrdo is null and f.id_acto is null) or',
'              (a.id_acto_tpo_rqrdo is null and f.id_acto is not null and l.id_dcmnto is null) then',
'                    ''<center>',
'                        <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                            ||nvl2(f.id_dcmnto, ''Modificar '', ''Generar '')',
'                            ||''<span class="fa ''||nvl2(f.id_dcmnto,''fa-edit'',''fa-cog fa-spin'')||''"></span>',
'                        </button>',
'                    </center>''',
'            end accion,',
'            case',
'                when (a.id_fljo_trea = e.id_fljo_trea_cnfrmcion and a.id_acto_tpo_rqrdo is null and f.id_dcmnto is not null and f.id_acto is null)',
'                or   (a.id_fljo_trea = e.id_fljo_trea_cnfrmcion and a.id_acto_tpo_rqrdo is null and f.id_dcmnto is not null and f.id_acto is not null and l.id_dcmnto is null) then',
'                    ''<center>',
'                        <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Confirmar ''',
'                            ||''<span class="fa fa-check"></span>',
'                        </button>',
'                     </center>''',
'            end confirmar',
'from        gn_d_actos_tipo_tarea       a',
'inner join  gn_d_actos_tipo             b   on  b.id_acto_tpo       =   a.id_acto_tpo',
'inner join  wf_g_instancias_transicion  c   on  c.id_instncia_fljo  =   :F_ID_INSTNCIA_FLJO',
'                                            and c.id_fljo_trea_orgen=   a.id_fljo_trea',
'                                            and c.id_estdo_trnscion in  (1, 2)',
'inner join  gf_g_prescripciones         d   on  d.id_instncia_fljo  =   c.id_instncia_fljo',
'inner join  gf_d_prescripciones_dcmnto  e   on  e.id_prscrpcion_tpo =   d.id_prscrpcion_tpo',
'                                            and e.id_actos_tpo_trea =   a.id_actos_tpo_trea',
'left  join  gf_g_prscrpcns_dcmnto       f   on  f.id_fljo_trea      =   a.id_fljo_trea',
'                                            and f.id_acto_tpo       =   a.id_acto_tpo',
'                                            and f.id_prscrpcion     =   d.id_prscrpcion',
'left  join  (select      g.id_instncia_fljo,',
'                         i.id_fljo_trea,',
'                         i.id_acto_tpo',
'             from        wf_g_instancias_flujo   g',
'             inner join  wf_d_flujos_tarea       h   on  h.id_fljo       =   g.id_fljo',
'                                                     and h.actvo         =   ''S''',
'             inner join  gn_d_actos_tipo_tarea   i   on  i.id_fljo_trea  =   h.id_fljo_trea',
'            )                           j   on  j.id_acto_tpo       =   a.id_acto_tpo_rqrdo',
'                                            and j.id_instncia_fljo  =   :F_ID_INSTNCIA_FLJO',
'left  join  gf_g_prscrpcns_dcmnto       k   on  k.id_acto_tpo       =   j.id_acto_tpo',
'                                            and k.id_prscrpcion     =   d.id_prscrpcion',
'  left join gn_g_actos l',
'    on l.id_acto = f.id_acto                                            ',
'where       b.cdgo_clnte    =   :F_CDGO_CLNTE',
'and         a.id_fljo_trea  =   :F_ID_FLJO_TREA',
'and         (e.cdgo_rspsta  =   d.cdgo_rspsta or',
'             e.cdgo_rspsta  is  null)',
'and         a.actvo         =   ''S'';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P83_DSCRPCION_RSPSTA'
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
 p_id=>wwv_flow_api.id(314573855991026524)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JDIAZ'
,p_internal_uid=>314573855991026524
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112613767478099385)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112614166844099389)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112614507687099389)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112614949721099389)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112615392792099389)
,p_db_column_name=>'INDCDOR_OBLGTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Obligatorio'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112615701369099390)
,p_db_column_name=>'ACCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Plantilla'
,p_column_link=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP,86:P86_APLCCION_ORGN,P86_PGNA_ORGN,P86_ID_ACTO_TPO,P86_ID_DCMNTO:&APP_ID.,&APP_PAGE_ID.,#ID_ACTO_TPO#,#ID_DCMNTO#'
,p_column_linktext=>'#ACCION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(112616150410099392)
,p_db_column_name=>'CONFIRMAR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Confirmar Acto'
,p_column_link=>'javascript:fnc_generarDocumentos(#ID_DCMNTO#);'
,p_column_linktext=>'#CONFIRMAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(314588845733126391)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1126165'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ACTO_TPO:DSCRPCION:ID_ACTO:ID_DCMNTO:INDCDOR_OBLGTRIO:ACCION:CONFIRMAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(217353589202346645)
,p_plug_name=>'Datos del Flujo'
,p_region_name=>'P83_DTOS_FLJO'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(150784344573980777)
,p_plug_name=>'Criticas'
,p_parent_plug_id=>wwv_flow_api.id(217353589202346645)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56520918155587377)
,p_plug_name=>unistr('Gesti\00F3n de Vigencias')
,p_parent_plug_id=>wwv_flow_api.id(150784344573980777)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(28654632023202113)
,p_region_id=>wwv_flow_api.id(56520918155587377)
,p_chart_type=>'bar'
,p_title=>unistr('Gesti\00F3n de Vigencias')
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>false
,p_show_row=>false
,p_show_start=>false
,p_show_end=>false
,p_show_progress=>false
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(28656326184202113)
,p_chart_id=>wwv_flow_api.id(28654632023202113)
,p_seq=>10
,p_name=>'Vigencias Pendientes'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia,',
'        count(*) cntdad,',
'        ''<b>Vigencias '' || a.vgncia || '' Pendientes: </b>'' || rtrim(to_char(count(*), ''FM9G999G990D999'', ''NLS_NUMERIC_CHARACTERS='''',.''''''), '','') tooltip',
'from    v_gf_g_prscrpcnes_vgncia    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prscrpcion =   :P83_ID_PRSCRPCION',
'and     a.indcdor_aprbdo=   ''P''',
'group by    a.vgncia',
'order by a.vgncia;'))
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'VGNCIA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#FAE282'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(28656902768202114)
,p_chart_id=>wwv_flow_api.id(28654632023202113)
,p_seq=>20
,p_name=>'Vigencias Aceptadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia,',
'        count(*) cntdad,',
'        ''<b>Vigencias '' || a.vgncia || '' Aceptadas: </b>'' || rtrim(to_char(count(*), ''FM9G999G990D999'', ''NLS_NUMERIC_CHARACTERS='''',.''''''), '','') tooltip',
'from    v_gf_g_prscrpcnes_vgncia    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prscrpcion =   :P83_ID_PRSCRPCION',
'and     a.indcdor_aprbdo=   ''S''',
'group by    a.vgncia',
'order by a.vgncia;'))
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'VGNCIA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#3CAF85'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(28657579892202114)
,p_chart_id=>wwv_flow_api.id(28654632023202113)
,p_seq=>30
,p_name=>'Vigencias Rechazadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia,',
'        count(*) cntdad,',
'        ''<b>Vigencias '' || a.vgncia || '' Rechazadas: </b>'' || rtrim(to_char(count(*), ''FM9G999G990D999'', ''NLS_NUMERIC_CHARACTERS='''',.''''''), '','') tooltip',
'from    v_gf_g_prscrpcnes_vgncia    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prscrpcion =   :P83_ID_PRSCRPCION',
'and     a.indcdor_aprbdo=   ''N''',
'group by    a.vgncia',
'order by a.vgncia;'))
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'VGNCIA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#FF8E57'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(28655141119202113)
,p_chart_id=>wwv_flow_api.id(28654632023202113)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(28655706798202113)
,p_chart_id=>wwv_flow_api.id(28654632023202113)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56934729403640777)
,p_plug_name=>'Sujetos-Tributos'
,p_parent_plug_id=>wwv_flow_api.id(150784344573980777)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ''Sujetos-Tributos'' tittle,',
'        rtrim(to_char(count(*), ''FM9G999G999G990D999'', ''NLS_NUMERIC_CHARACTERS='''',.''''''),'','') cntdad',
'from    gf_g_prscrpcnes_sjto_impsto a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prscrpcion =   :P83_ID_PRSCRPCION;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITTLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(57265929955288677)
,p_plug_name=>unistr('Gesti\00F3n de Validaciones')
,p_parent_plug_id=>wwv_flow_api.id(150784344573980777)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(28650992248202075)
,p_region_id=>wwv_flow_api.id(57265929955288677)
,p_chart_type=>'bar'
,p_title=>unistr('Gesti\00F3n de Validaciones')
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>false
,p_show_row=>false
,p_show_start=>false
,p_show_end=>false
,p_show_progress=>false
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(28653127111202111)
,p_chart_id=>wwv_flow_api.id(28650992248202075)
,p_seq=>10
,p_name=>'Validaciones Aceptadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      /*+ result_cache */',
'            f.dscrpcion ttlo,',
'            count(*) cntdad,',
unistr('            ''<b>'' || f.dscrpcion || ''</b><br>'' || ''<b>Cumplieron con validaci\00F3n: </b>'' || count(*) tooltip'),
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b   on  b.id_prscrpcion             =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c   on  c.id_prscrpcion_sjto_impsto =   b.id_prscrpcion_sjto_impsto',
'inner join  gf_g_prscrpcnes_vgncs_vldcn d   on  d.id_prscrpcion_vgncia      =   c.id_prscrpcion_vgncia',
'inner join  gn_d_rglas_ngcio_clnte_fnc  e   on  e.id_rgla_ngcio_clnte_fncion=   d.id_rgla_ngcio_clnte_fncion',
'inner join  gn_d_funciones              f   on  f.id_fncion                 =   e.id_fncion',
'where       a.id_prscrpcion =   :P83_ID_PRSCRPCION',
'and         (d.indcdr_cmplio_opcnl = ''S'' or (d.indcdr_cmplio_opcnl  is null and d.indcdr_cmplio = ''S''))',
'group by    f.id_fncion,',
'            f.dscrpcion;'))
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'TTLO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#3CAF85'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(28653726873202112)
,p_chart_id=>wwv_flow_api.id(28650992248202075)
,p_seq=>20
,p_name=>'Validaciones No Aceptadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      /*+ result_cache */',
'            f.dscrpcion ttlo,',
'            count(*) cntdad,',
unistr('            ''<b>'' || f.dscrpcion || ''</b><br>'' || ''<b>No cumplieron con validaci\00F3n: </b>'' || count(*) tooltip'),
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b   on  b.id_prscrpcion             =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c   on  c.id_prscrpcion_sjto_impsto =   b.id_prscrpcion_sjto_impsto',
'inner join  gf_g_prscrpcnes_vgncs_vldcn d   on  d.id_prscrpcion_vgncia      =   c.id_prscrpcion_vgncia',
'inner join  gn_d_rglas_ngcio_clnte_fnc  e   on  e.id_rgla_ngcio_clnte_fncion=   d.id_rgla_ngcio_clnte_fncion',
'inner join  gn_d_funciones              f   on  f.id_fncion                 =   e.id_fncion',
'where       a.id_prscrpcion =   :P83_ID_PRSCRPCION',
'and         (d.indcdr_cmplio_opcnl = ''N'' or (d.indcdr_cmplio_opcnl  is null and d.indcdr_cmplio = ''N''))',
'group by    f.id_fncion,',
'            f.dscrpcion;'))
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'TTLO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#FAE282'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(28651472634202077)
,p_chart_id=>wwv_flow_api.id(28650992248202075)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(28652005746202077)
,p_chart_id=>wwv_flow_api.id(28650992248202075)
,p_axis=>'y2'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_split_dual_y=>'auto'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(28652685100202077)
,p_chart_id=>wwv_flow_api.id(28650992248202075)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220210342119314351)
,p_plug_name=>'Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(217353589202346645)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P83_ID_SLCTUD'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(199810117523136344)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(220210342119314351)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.id_dcmnto,',
'            d.dscrpcion,',
'            b.obsrvcion,',
'            a.id_instncia_fljo',
'from        pq_g_solicitudes        a',
'inner join  pq_g_documentos         b   on  b.id_slctud     =   a.id_slctud',
'inner join  pq_d_motivos_documento  c   on  c.id_mtvo_dcmnto=   b.id_mtvo_dcmnto',
'inner join  pq_d_documentos         d   on  d.cdgo_dcmnto   =   c.cdgo_dcmnto',
'where       a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and         a.id_slctud     =   :P83_ID_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P83_ID_SLCTUD'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(199810340910136346)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
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
 p_id=>wwv_flow_api.id(199810437982136347)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(199810483783136348)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(199810571568136349)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(199810699207136350)
,p_name=>'VISUALIZAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Documento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:pq_g_documentos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_DCMNTO,&ID_DCMNTO.'
,p_link_text=>'Ver <span aria-hidden="true" class="fa fa-eye"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(199810222478136345)
,p_internal_uid=>199810222478136345
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
 p_id=>wwv_flow_api.id(199815716644143015)
,p_interactive_grid_id=>wwv_flow_api.id(199810222478136345)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(199815853542143016)
,p_report_id=>wwv_flow_api.id(199815716644143015)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199816219321143018)
,p_view_id=>wwv_flow_api.id(199815853542143016)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(199810340910136346)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199816712058143021)
,p_view_id=>wwv_flow_api.id(199815853542143016)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(199810437982136347)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199817254917143022)
,p_view_id=>wwv_flow_api.id(199815853542143016)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(199810483783136348)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199817676804143025)
,p_view_id=>wwv_flow_api.id(199815853542143016)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(199810571568136349)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199820605602162058)
,p_view_id=>wwv_flow_api.id(199815853542143016)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(199810699207136350)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220209599237314344)
,p_plug_name=>unistr('Datos B\00E1sicos')
,p_parent_plug_id=>wwv_flow_api.id(220210342119314351)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P83_ID_SLCTUD'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220210422222314352)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(217353589202346645)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_dcmnto,',
'            b.nmbre_trea,',
'            c.dscrpcion_acto_tpo,',
'            c.nmro_acto_dsplay,',
'            a.id_acto',
'from        gf_g_prscrpcns_dcmnto       a',
'inner join  v_wf_d_flujos_tarea         b   on  b.id_fljo_trea  =   a.id_fljo_trea',
'inner join  v_gn_g_actos                c   on  c.id_acto       =   a.id_acto',
'where       a.cdgo_clnte                    =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion                 =   :P83_ID_PRSCRPCION',
'and         dbms_lob.getlength(c.file_blob) >   0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(220265752580606844)
,p_name=>'ID_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCMNTO'
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
 p_id=>wwv_flow_api.id(220265792262606845)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarea'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(220265908505606846)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(220266043276606847)
,p_name=>'NMRO_ACTO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numero de Acto'
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
 p_id=>wwv_flow_api.id(220266090773606848)
,p_name=>'VISUALIZAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,FILE_BLOB,FILE_NAME,FILE_MIMETYPE,ID_ACTO,&ID_ACTO.'
,p_link_text=>'Ver <span aria-hidden="true" class="fa fa-eye"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(220266238064606849)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(220210509212314353)
,p_internal_uid=>220210509212314353
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
 p_id=>wwv_flow_api.id(220264287118516668)
,p_interactive_grid_id=>wwv_flow_api.id(220210509212314353)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(220264390885516669)
,p_report_id=>wwv_flow_api.id(220264287118516668)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220271692899607000)
,p_view_id=>wwv_flow_api.id(220264390885516669)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(220265752580606844)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220272211072607003)
,p_view_id=>wwv_flow_api.id(220264390885516669)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(220265792262606845)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220272729181607005)
,p_view_id=>wwv_flow_api.id(220264390885516669)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(220265908505606846)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220273209574607006)
,p_view_id=>wwv_flow_api.id(220264390885516669)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(220266043276606847)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>3
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220276719425635516)
,p_view_id=>wwv_flow_api.id(220264390885516669)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(220266090773606848)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220277182479635521)
,p_view_id=>wwv_flow_api.id(220264390885516669)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(220266238064606849)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(225386241770218846)
,p_plug_name=>'Observaciones'
,p_parent_plug_id=>wwv_flow_api.id(217353589202346645)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_obsrvcion,',
'            a.asnto_obsrvcion,',
'            c.nmbre_trea,',
'            case',
'                when a.fcha_ultma_actlzcion is null then a.fcha_obsrvcion',
'                else a.fcha_ultma_actlzcion',
'            end fcha,',
'            b.nmbre_trcro',
'from        v_gf_g_prscrpcnes_obsrvcion    a',
'inner join  v_sg_g_usuarios                b   on  b.id_usrio  =   a.id_usrio',
'inner join  wf_d_tareas                    c   on  c.id_trea   =   a.id_trea',
'where       a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion =   :P83_ID_PRSCRPCION;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(225561082570821548)
,p_name=>'ID_OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_OBSRVCION'
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
 p_id=>wwv_flow_api.id(225561204676821549)
,p_name=>'ASNTO_OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ASNTO_OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Asunto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(225561276831821550)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tarea'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(225561391282821551)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
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
 p_id=>wwv_flow_api.id(225561478390821552)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(225561755548821554)
,p_name=>'VER'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Ver<span class="fa fa-eye"></span>'
,p_link_target=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:RP,173:P173_ID_OBSRVCION:&ID_OBSRVCION.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(225561047076821547)
,p_internal_uid=>225561047076821547
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
 p_id=>wwv_flow_api.id(225579768118926357)
,p_interactive_grid_id=>wwv_flow_api.id(225561047076821547)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(225579773675926357)
,p_report_id=>wwv_flow_api.id(225579768118926357)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225580298990926361)
,p_view_id=>wwv_flow_api.id(225579773675926357)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(225561082570821548)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225580771185926365)
,p_view_id=>wwv_flow_api.id(225579773675926357)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(225561204676821549)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225581335909926366)
,p_view_id=>wwv_flow_api.id(225579773675926357)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(225561276831821550)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>232
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225581842079926368)
,p_view_id=>wwv_flow_api.id(225579773675926357)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(225561391282821551)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>172
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225582329372926369)
,p_view_id=>wwv_flow_api.id(225579773675926357)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(225561478390821552)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>224
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225590084857946537)
,p_view_id=>wwv_flow_api.id(225579773675926357)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(225561755548821554)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(284698980115747000)
,p_plug_name=>unistr('Datos B\00E1sicos')
,p_parent_plug_id=>wwv_flow_api.id(217353589202346645)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(118454059953772701)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(76364512909683201)
,p_button_name=>'P83_PROYECTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Proyectar<br>Prescripci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    wf_g_instancias_transicion  a',
'where   a.id_instncia_fljo      =   :F_ID_INSTNCIA_FLJO',
'and     a.id_fljo_trea_orgen    =   :F_ID_FLJO_TREA',
'and     a.id_estdo_trnscion     in  (1, 2)',
'and     :P83_DSCRPCION_RSPSTA   is  not null;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(87610270178537001)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(76364512909683201)
,p_button_name=>'P83_ANALIZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Analizar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P83_DSCRPCION_RSPSTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104294931665385744)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(76364512909683201)
,p_button_name=>'BTN_NVA_OBSRVCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Nueva Observacion'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:RP,173:P173_ID_PRSCRPCION,P173_ID_FLJO_TREA,P173_ID_USRIO,P173_CDGO_CLNTE:&P83_ID_PRSCRPCION.,&F_ID_FLJO_TREA.,&F_ID_USRIO.,&F_CDGO_CLNTE.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        wf_g_instancias_transicion      a',
'where       a.id_estdo_trnscion     in      (1, 2)',
'and         a.id_instncia_fljo      =       :F_ID_INSTNCIA_FLJO',
'and         a.id_fljo_trea_orgen    =       :F_ID_FLJO_TREA'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(81149437698690301)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(76364512909683201)
,p_button_name=>'P83_REVERSAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Reversar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        wf_g_instancias_transicion      a',
'where       a.id_estdo_trnscion     in      (1, 2)',
'and         a.id_instncia_fljo      =       :F_ID_INSTNCIA_FLJO',
'and         a.id_fljo_trea_orgen    =       :F_ID_FLJO_TREA'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12157702615264101)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(76364512909683201)
,p_button_name=>'P83_REVERSAR_ACTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Reversar Documento'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from gf_g_prescripciones a',
'join  gf_g_prscrpcns_dcmnto b on b.id_prscrpcion = a.id_prscrpcion',
'join gn_g_actos c on c.id_acto = b.id_acto',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and c.id_dcmnto is not null;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-file-word-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(81378577282510901)
,p_branch_name=>'Actualizar Pagina'
,p_branch_action=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.:RP,83::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(87610270178537001)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(81158414884715203)
,p_branch_name=>unistr('Revertir Etapa Proyecci\00F3n')
,p_branch_action=>'javascript:revertir();'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(81149437698690301)
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96686850648518904)
,p_name=>'P83_RGLAS_NGCIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96657013438458201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112616943214099401)
,p_name=>'P83_ID_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(314387321560466712)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121436492076923649)
,p_name=>'P83_NMRO_PRSCRPCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(284698980115747000)
,p_prompt=>unistr('N\00FAmero de Prescripci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121436814546923651)
,p_name=>'P83_ID_PRSCRPCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(284698980115747000)
,p_prompt=>unistr('Tipo de Prescripci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_prscrpcion_tpo',
'from    gf_d_prescripciones_tipo    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P83_ID_PRSCRPCION_TPO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121437207244923651)
,p_name=>'P83_TTAL_SJTOS_TRBTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(284698980115747000)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121437674778923651)
,p_name=>'P83_ID_INSTNCIA_FLJO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(284698980115747000)
,p_prompt=>'Instancia de Flujo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121438017996923652)
,p_name=>'P83_FCHA_FLJO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(284698980115747000)
,p_prompt=>'Fecha Inicio Proceso'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121438498310923657)
,p_name=>'P83_DSCRPCION_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(284698980115747000)
,p_prompt=>'Respuesta'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion, a.cdgo_rspsta',
'from        gf_d_prescripciones_rspsta       a;'))
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121438821964923658)
,p_name=>'P83_FCHA_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(284698980115747000)
,p_prompt=>'Fecha de Respuesta'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121439203981923658)
,p_name=>'P83_ID_PRSCRPCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(284698980115747000)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121443145477923670)
,p_name=>'P83_ID_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(220209599237314344)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121443596433923671)
,p_name=>'P83_ID_INSTNCIA_FLJO_PQR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(220209599237314344)
,p_prompt=>'Flujo de PQR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121443987299923671)
,p_name=>'P83_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(220209599237314344)
,p_prompt=>'Solicitud'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121444335182923672)
,p_name=>'P83_FCHA_RDCDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(220209599237314344)
,p_prompt=>'Fecha de Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121444763936923672)
,p_name=>'P83_FCHA_LMTE_LEY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(220209599237314344)
,p_prompt=>'Fecha Limite de Respuesta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121478407330069301)
,p_name=>'P83_INDCDOR_APRBCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(284698980115747000)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(121478609297069303)
,p_computation_sequence=>10
,p_computation_item=>'P83_TTAL_SJTOS_TRBTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count(*)',
'from    gf_g_prscrpcnes_sjto_impsto a',
'where   a.id_prscrpcion =   :P83_ID_PRSCRPCION;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96686619988518902)
,p_name=>'Al seleccionar regla'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(96657013438458201)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96686742532518903)
,p_event_id=>wwv_flow_api.id(96686619988518902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96686986777518905)
,p_name=>'Al cambiar modo'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(96657013438458201)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridreportchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96687044379518906)
,p_event_id=>wwv_flow_api.id(96686986777518905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96780914312674801)
,p_name=>'Al cerrar Validaciones'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(107121115099049301)
,p_event_id=>wwv_flow_api.id(96780914312674801)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P83_DSCRPCION_RSPSTA,P83_FCHA_RSPSTA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion, to_char(a.fcha_rspsta, ''DD/MM/YYYY'') fcha_rspsta',
'from        gf_g_prescripciones         a',
'inner join  gf_d_prscrpcnes_rspsta      b   on  b.cdgo_rspsta  =    a.cdgo_rspsta',
'where       a.id_prscrpcion =   :P83_ID_PRSCRPCION;'))
,p_attribute_07=>'P83_DSCRPCION_RSPSTA,P83_FCHA_RSPSTA'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(121258519567815307)
,p_event_id=>wwv_flow_api.id(96780914312674801)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(120600715681024701)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104348860356541201)
,p_name=>'Al cerrar Observaciones btn'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(104294931665385744)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(121566385235845401)
,p_event_id=>wwv_flow_api.id(104348860356541201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(225386241770218846)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113977480668769701)
,p_name=>'Al hacer clic P83_ANALIZAR'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(87610270178537001)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113977559196769702)
,p_event_id=>wwv_flow_api.id(113977480668769701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_analizarPrescripcion(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    console.log(''Inicio'');',
'    try{',
'        await apex.server.process ( "ajax_analizarPrescripcion", {',
'            pageItems: "#P83_ID_INSTNCIA_FLJO, #P83_RGLAS_NGCIO, #P83_ID_PRSCRPCION"',
'        }, {',
'            success: function( pData ){',
'                if (pData.o_cdgo_rspsta != 0){',
'                    console.log(pData.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de analizar la prescripci\00F3n con las funciones de reglas de negocio seleccionadas?", function( okPressed ) {'),
'        if( okPressed ) {',
'            fnc_analizarPrescripcion();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(114305888511006301)
,p_name=>'Al hacer clic P83_REVERSAR'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(81149437698690301)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114305991933006302)
,p_event_id=>wwv_flow_api.id(114305888511006301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_revertirAnalisis(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_revertirAnalisis", {',
'            pageItems: "#P83_ID_PRSCRPCION"',
'        }, {',
'            success: function( pData ){',
'                if (pData.o_cdgo_rspsta != 0){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    revertirTarea();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de reversar la etapa de proyecci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            fnc_revertirAnalisis();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(118454181937772702)
,p_name=>'Al hacer clic P83_PROYECTAR'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(118454059953772701)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(118454293294772703)
,p_event_id=>wwv_flow_api.id(118454181937772702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_proyectarPrescripcion(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_proyectarPrescripcion", {',
'            pageItems: "#P83_ID_PRSCRPCION"',
'        }, {',
'            success: function( pData ){',
'                if (pData.o_cdgo_rspsta != 0){',
'                    console.log(pData.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    window.localStorage.removeItem(''wf_link'')',
'                    apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de proyectar la prescripci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            fnc_proyectarPrescripcion();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(121566444754845402)
,p_name=>'Al cerrar Observaciones'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(225386241770218846)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(121566561169845403)
,p_event_id=>wwv_flow_api.id(121566444754845402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(225386241770218846)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12157964095264103)
,p_name=>'Al hacer clic P83_REVERSAR_ACTO'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(12157702615264101)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12158067714264104)
,p_event_id=>wwv_flow_api.id(12157964095264103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function fnc_deleteActo(){',
'    let $waitPopup = apex.widget.waitPopup();',
'    console.log(''Inicio'');',
'    try{',
'        await apex.server.process ( "ajax_deleteDocumentos", {',
'            pageItems: "#P83_ID_PRSCRPCION"',
'        }, {',
'            success: function( pData ){',
'                if (pData.o_cdgo_rspsta != 0){',
'                    console.log(pData.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    pData.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro que desea eliminar el documento actual de la prescripcion?", function( okPressed ) {'),
'        if( okPressed ) {',
'            fnc_deleteActo();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76544679902978402)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Analizar Prescripci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_xml             varchar2(1000);',
'begin',
'    v_xml :=        ''<CDGO_CLNTE>''                ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_INSTNCIA_FLJO>''          ||:P83_ID_INSTNCIA_FLJO  ||''</ID_INSTNCIA_FLJO>'';',
'    v_xml := v_xml||''<ID_FLJO_TREA>''              ||:F_ID_FLJO_TREA        ||''</ID_FLJO_TREA>'';',
'    v_xml := v_xml||''<ID_RGL_NGCO_CLNT_FNCN>''     ||:P83_RGLAS_NGCIO       ||''</ID_RGL_NGCO_CLNT_FNCN>'';',
'    v_xml := v_xml||''<ID_USRIO>''                  ||:F_ID_USRIO            ||''</ID_USRIO>'';',
'    ',
'    pkg_gf_prescripcion.prc_rg_prscrpcion_analisis	(p_xml            =>     v_xml',
'                                                    ,o_cdgo_rspsta    =>     v_cdgo_rspsta',
'                                                    ,o_mnsje_rspsta   =>     v_mnsje_rspsta',
'                                                    );',
'	if (v_cdgo_rspsta <> 0) then',
'        v_xml :=        ''<CDGO_CLNTE>''   ||:F_CDGO_CLNTE     ||''</CDGO_CLNTE>'';',
'        v_xml := v_xml||''<ID_PRSCRPCION>''||:P83_ID_PRSCRPCION||''</ID_PRSCRPCION>'';',
'        v_xml := v_xml||''<ID_FLJO_TREA>'' ||:F_ID_FLJO_TREA   ||''</ID_FLJO_TREA>'';',
'        pkg_gf_prescripcion.prc_el_prscrpcion_analisis	(p_xml                      =>    v_xml',
'                                                        ,o_cdgo_rspsta				=>    v_cdgo_rspsta',
'                                                        ,o_mnsje_rspsta				=>    v_mnsje_rspsta',
'                                                        );',
'        if (v_cdgo_rspsta <> 0) then',
'            RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta); ',
'        end if;',
'        RAISE_APPLICATION_ERROR (-20000, v_mnsje_rspsta); ',
'	end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(87610270178537001)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(81360510734315002)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reversa Respuesta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_xml             varchar2(1000);',
'begin',
'    v_xml :=        ''<CDGO_CLNTE>''   ||:F_CDGO_CLNTE     ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_PRSCRPCION>''||:P83_ID_PRSCRPCION||''</ID_PRSCRPCION>'';',
'    v_xml := v_xml||''<ID_FLJO_TREA>'' ||:F_ID_FLJO_TREA   ||''</ID_FLJO_TREA>'';',
'    pkg_gf_prescripcion.prc_el_prscrpcion_analisis	(p_xml                      =>    v_xml',
'                                                    ,o_cdgo_rspsta				=>    v_cdgo_rspsta',
'                                                    ,o_mnsje_rspsta				=>    v_mnsje_rspsta',
'                                                    );',
'	if (v_cdgo_rspsta > 0) then',
'		RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta); ',
'	end if;',
'    pkg_gf_prescripcion.prc_ac_prescripcion_observcn		(p_id_instncia_fljo    =>    :P83_ID_INSTNCIA_FLJO,',
'                                                             p_id_fljo_trea        =>    :F_ID_FLJO_TREA);',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(81149437698690301)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Acci\00F3n Procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96658575339458216)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(96657013438458201)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Reglas de Negocio: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107070485317661184)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Datos de Prescripci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select      a.fcha_incio,',
'            a.id_instncia_fljo,',
'            b.id_prscrpcion,',
'            b.nmro_prscrpcion,',
'            b.fcha_rspsta,',
'            b.cdgo_rspsta,',
'            b.id_slctud,',
'            c.indcdor_aprbcion',
'into        :P83_FCHA_FLJO,',
'            :P83_ID_INSTNCIA_FLJO,',
'            :P83_ID_PRSCRPCION,',
'            :P83_NMRO_PRSCRPCION,',
'            :P83_FCHA_RSPSTA,',
'            :P83_DSCRPCION_RSPSTA,',
'            :P83_ID_SLCTUD,',
'            :P83_INDCDOR_APRBCION',
'from        wf_g_instancias_flujo       a',
'left join   gf_g_prescripciones         b   on  b.id_instncia_fljo  =   a.id_instncia_fljo',
'left join   gf_d_prescripciones_tipo    c   on  c.id_prscrpcion_tpo =   b.id_prscrpcion_tpo',
'where       a.id_instncia_fljo  =   :F_ID_INSTNCIA_FLJO;',
'*/',
'select      to_char(a.fcha_incio, ''DD/MM/YYYY''),',
'            a.id_instncia_fljo,',
'            b.id_prscrpcion,',
'            b.nmro_prscrpcion,',
'            to_char(b.fcha_rspsta, ''DD/MM/YYYY''),',
'            b.cdgo_rspsta,',
'            b.id_slctud,',
'            c.indcdor_aprbcion,',
'            b.id_prscrpcion_tpo',
'into        :P83_FCHA_FLJO,',
'            :P83_ID_INSTNCIA_FLJO,',
'            :P83_ID_PRSCRPCION,',
'            :P83_NMRO_PRSCRPCION,',
'            :P83_FCHA_RSPSTA,',
'            :P83_DSCRPCION_RSPSTA,',
'            :P83_ID_SLCTUD,',
'            :P83_INDCDOR_APRBCION,',
'            :P83_ID_PRSCRPCION_TPO',
'from        wf_g_instancias_flujo       a',
'left join   gf_g_prescripciones         b   on  b.id_instncia_fljo  =   a.id_instncia_fljo',
'left join   gf_d_prescripciones_tipo    c   on  c.id_prscrpcion_tpo =   b.id_prscrpcion_tpo',
'where       a.id_instncia_fljo  =   :F_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104324852941413989)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos de solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select      a.nmro_rdcdo_dsplay,',
'                a.id_instncia_fljo,',
'                a.fcha_rdcdo,',
'                a.fcha_lmte_ley',
'    into        :P83_NMRO_RDCDO_DSPLAY,',
'                :P83_ID_INSTNCIA_FLJO_PQR,',
'                :P83_FCHA_RDCDO,',
'                :P83_FCHA_LMTE_LEY',
'    from        pq_g_solicitudes    a',
'    where       a.id_slctud     =   :P83_ID_SLCTUD;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P83_ID_SLCTUD'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(114993903358041401)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_analizarPrescripcion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_mnsje_rspsta2   varchar2(1000);',
'    v_xml             varchar2(1000);',
'begin',
'   ',
'    v_xml :=        ''<CDGO_CLNTE>''                ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_INSTNCIA_FLJO>''          ||:P83_ID_INSTNCIA_FLJO  ||''</ID_INSTNCIA_FLJO>'';',
'    v_xml := v_xml||''<ID_FLJO_TREA>''              ||:F_ID_FLJO_TREA        ||''</ID_FLJO_TREA>'';',
'    v_xml := v_xml||''<ID_RGL_NGCO_CLNT_FNCN>''     ||:P83_RGLAS_NGCIO       ||''</ID_RGL_NGCO_CLNT_FNCN>'';',
'    v_xml := v_xml||''<ID_USRIO>''                  ||:F_ID_USRIO            ||''</ID_USRIO>'';',
'    ',
'    pkg_gf_prescripcion.prc_rg_prscrpcion_analisis	(p_xml            =>     v_xml',
'                                                    ,o_cdgo_rspsta    =>     v_cdgo_rspsta',
'                                                    ,o_mnsje_rspsta   =>     v_mnsje_rspsta',
'                                                    );',
'	if (v_cdgo_rspsta <> 0) then',
'        v_xml :=        ''<CDGO_CLNTE>''   ||:F_CDGO_CLNTE     ||''</CDGO_CLNTE>'';',
'        v_xml := v_xml||''<ID_PRSCRPCION>''||:P83_ID_PRSCRPCION||''</ID_PRSCRPCION>'';',
'        v_xml := v_xml||''<ID_FLJO_TREA>'' ||:F_ID_FLJO_TREA   ||''</ID_FLJO_TREA>'';',
'        pkg_gf_prescripcion.prc_el_prscrpcion_analisis	(p_xml                      =>    v_xml',
'                                                        ,o_cdgo_rspsta				=>    v_cdgo_rspsta',
'                                                        ,o_mnsje_rspsta				=>    v_mnsje_rspsta2',
'                                                        );',
'        if (v_cdgo_rspsta <> 0) then',
'            v_mnsje_rspsta := v_mnsje_rspsta2;',
'        end if;',
'        v_cdgo_rspsta := 1000;',
'	end if;',
'    ',
'    owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    htp.p(''{"o_cdgo_rspsta" :''||v_cdgo_rspsta||',
'          '',"o_mnsje_rspsta":"''||v_mnsje_rspsta||''"}'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(115105149369423201)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_revertirAnalisis'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(4000);',
'    v_xml             varchar2(1000);',
'begin',
'    v_xml :=        ''<CDGO_CLNTE>''   ||:F_CDGO_CLNTE     ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_PRSCRPCION>''||:P83_ID_PRSCRPCION||''</ID_PRSCRPCION>'';',
'    v_xml := v_xml||''<ID_FLJO_TREA>'' ||:F_ID_FLJO_TREA   ||''</ID_FLJO_TREA>'';',
'    pkg_gf_prescripcion.prc_el_prscrpcion_analisis	(p_xml                      =>    v_xml',
'                                                    ,o_cdgo_rspsta				=>    v_cdgo_rspsta',
'                                                    ,o_mnsje_rspsta				=>    v_mnsje_rspsta',
'                                                    );',
'                                                    ',
'	owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    htp.p(''{"o_cdgo_rspsta" :''||v_cdgo_rspsta||',
'          '',"o_mnsje_rspsta":"''||v_mnsje_rspsta||''"}'');',
'          ',
'    begin',
'        pkg_gf_prescripcion.prc_ac_prescripcion_observcn		(p_id_instncia_fljo    =>    :P83_ID_INSTNCIA_FLJO,',
'                                                                 p_id_fljo_trea        =>    :F_ID_FLJO_TREA);',
'        exception',
'            when others then',
'                null;',
'    end;    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(118454321366772704)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_proyectarPrescripcion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(4000);',
'begin',
'    pkg_gf_prescripcion.prc_gn_prescrpcns_proyeccion 		(p_cdgo_clnte		=> :F_CDGO_CLNTE,',
'                                                             p_id_prscrpcion	=> :P83_ID_PRSCRPCION,',
'                                                             p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO,',
'                                                             p_id_fljo_trea     => :F_ID_FLJO_TREA,',
'                                                             o_cdgo_rspsta		=> v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta     => v_mnsje_rspsta',
'                                                            );',
'                                                            ',
'    if (v_cdgo_rspsta = 0) then',
'        APEX_UTIL.SET_SESSION_STATE(''F_ID_FLJO_TREA'','''');',
'    end if;',
'                                                    ',
'	owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    htp.p(''{"o_cdgo_rspsta" :''||v_cdgo_rspsta||',
'          '',"o_mnsje_rspsta":"''||v_mnsje_rspsta||''"}'');    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(118535656586653101)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_generarDocumentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'    v_json           clob;',
'begin',
'    v_json := ''{"ID_PRSCRPCION"         : ''||:P83_ID_PRSCRPCION    ||'',''||',
'               ''"ID_FLJO_TREA_CNFRMCION": ''||:F_ID_FLJO_TREA       ||'',''||',
'               ''"ID_DCMNTO"             : ''||apex_application.g_x01||'',''||',
'               ''"ID_USRIO"              : ''||:F_ID_USRIO           ||'',''||',
'               ''"TPO_OPCION"            :  "P"}'';    ',
'    pkg_gf_prescripcion.prc_rg_prscrpcion_actos(p_cdgo_clnte	=>	:F_CDGO_CLNTE,',
'                                                p_json			=>	v_json,',
'                                                o_cdgo_rspsta	=>	v_cdgo_rspsta,',
'                                                o_mnsje_rspsta	=>	v_mnsje_rspsta);',
'    if (v_cdgo_rspsta = 0) then',
'        commit;',
'    else',
'        rollback;',
'    end if;',
'	owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    htp.p(''{"o_cdgo_rspsta" :''||v_cdgo_rspsta||',
'          '',"o_mnsje_rspsta":"''||v_mnsje_rspsta||''"}'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12157830253264102)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_deleteDocumentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'',
'   ',
'    pkg_gf_prescripcion.prc_el_prescripcion_documento(',
'              p_id_prscrpcion  => :P83_ID_PRSCRPCION',
'            , o_cdgo_rspsta    => v_cdgo_rspsta',
'            , o_mnsje_rspsta   => v_mnsje_rspsta',
'    );',
'    ',
'    if v_cdgo_rspsta != 0 then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'   ',
'    owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;',
'    ',
'    htp.p(''{"o_cdgo_rspsta" :''||v_cdgo_rspsta||',
'          '',"o_mnsje_rspsta":"''||v_mnsje_rspsta||''"}''); ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
