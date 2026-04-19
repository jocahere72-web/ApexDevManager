prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n de Ajustes')
,p_step_title=>unistr('Gesti\00F3n de Ajustes')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iniciar_flujo(id_instancia,id_fljo_trea){',
'    apex.server.process("Continuar Flujo", {',
'        f01: id_instancia,',
'        f02: id_fljo_trea',
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
'        });',
'  /*  console.log(id_instancia)*/',
'}',
'',
'//Generar JSON desde un datagrid',
'function obtenerSeleccion(){',
'   var region = apex.region("P18_GRID_FLUJOS");',
'   var v_seleccionados  = [];',
'   if (region) {',
'       var view = region.widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'       if($.isEmptyObject(records) == false){',
'           for(let i=0; i<records.length; i++){',
'			   v_seleccionados.push(model.getValue(records[i], "ID_INSTNCIA_FLJO").trim());',
'           }',
'		   $s("P18_JSON",v_seleccionados);',
'           console.log(v_seleccionados);',
'       }',
'       else{',
'         //  console.log(v_seleccionados);',
'           $s("P18_JSON",null);  ',
'       }',
'   } ',
'}',
'',
'function procesarTodos(e,btn,grid, data){',
'    var v_seleccionados  = data.map((m) => {',
'        return m["ID_INSTNCIA_FLJO"];',
'    });',
'	if (v_seleccionados.length > 0) {',
unistr('    apex.message.confirm( "\00BFEst\00E1 seguro que desea procesar los " + v_seleccionados.length + " ajustes?", function( okPressed ) { '),
'				if( okPressed ) {',
'					let $waitPopup = apex.widget.waitPopup();',
'					apex.server.process ( "procesar_seleccon_todo", {',
'						f01: v_seleccionados.join()',
'					}).then((resp) => {',
'						if (resp.type === ''OK''){',
'							apex.message.showPageSuccess(''Ajuste procesados con exito!!!'');                ',
'						}else{',
'							apex.message.clearErrors();',
'							apex.message.showErrors([',
'								{',
'									type:       "error",',
'									location:   [ "page"],',
'									message:    resp.msg,',
'									unsafe:     false',
'								}',
'							]);',
'						}',
'						apex.region( "P18_GRID_FLUJOS" ).refresh();',
'						apex.region( "P18_USUARIO_FLUJOS_APLICADOS" ).refresh();',
'						 $waitPopup.remove();',
'					});',
'				}',
'   })',
'   } else {',
'			apex.message.confirm ("No tiene ajustes por procesar."  , function( Aceptar ){',
'			if( Aceptar ) {',
'			/*apex.page.submit( "" );*/',
'		  }',
'			});',
'		}',
'    ',
'};',
'',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210728173258'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86923889886613401)
,p_plug_name=>'Administrador Ajustes'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ajste, ',
'	   to_char(a.fcha,''DD/MM/YYYY'') fcha,',
'	   a.nmbre_impsto,',
'	   a.nmbre_impsto_sbmpsto,',
'	   a.nmro_slctud,',
'        ''$'' || to_char(a.vlor, ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor,',
'	   a.tpo_ajste,',
'       c.nmbre_trcro,',
'	   a.dscrpcion_estado',
'	   ',
'from v_gf_g_ajustes a',
'join v_sg_g_usuarios                  c on a.id_usrio = c.id_usrio',
'where a.cdgo_clnte=:F_CDGO_CLNTE',
'order by a.id_ajste desc;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(86924106481613404)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(86924287002613405)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(86924322471613406)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub Tributo'
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
 p_id=>wwv_flow_api.id(86924412593613407)
,p_name=>'NMRO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(86924518467613408)
,p_name=>'TPO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>7
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
 p_id=>wwv_flow_api.id(86924622965613409)
,p_name=>'Dscrpcion Estado'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(86924793352613410)
,p_name=>'ID_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(99437370398851901)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>13
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
 p_id=>wwv_flow_api.id(104610580852406501)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(86923935070613402)
,p_internal_uid=>86923935070613402
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
 p_id=>wwv_flow_api.id(86929427502615326)
,p_interactive_grid_id=>wwv_flow_api.id(86923935070613402)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(86929540628615327)
,p_report_id=>wwv_flow_api.id(86929427502615326)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86930598825615335)
,p_view_id=>wwv_flow_api.id(86929540628615327)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(86924106481613404)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114.38333129882812
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86931030981615337)
,p_view_id=>wwv_flow_api.id(86929540628615327)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(86924287002613405)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86931556605615338)
,p_view_id=>wwv_flow_api.id(86929540628615327)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(86924322471613406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86932046244615340)
,p_view_id=>wwv_flow_api.id(86929540628615327)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(86924412593613407)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>149.36666870117188
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86932570739615341)
,p_view_id=>wwv_flow_api.id(86929540628615327)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(86924518467613408)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104.35000610351562
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86933001316615342)
,p_view_id=>wwv_flow_api.id(86929540628615327)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(86924622965613409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>175.6999969482422
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86938512727633447)
,p_view_id=>wwv_flow_api.id(86929540628615327)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(86924793352613410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89.23333740234375
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99443323083853633)
,p_view_id=>wwv_flow_api.id(86929540628615327)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(99437370398851901)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138.36666870117188
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104616585502406710)
,p_view_id=>wwv_flow_api.id(86929540628615327)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(104610580852406501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110423861960984403)
,p_plug_name=>'<b>Ajustes Aplicados por el Funcionario &F_NMBRE_USRIO.</b>'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28939806228954504)
,p_plug_name=>'Ajustes Aplicados por Usuario 2'
,p_region_name=>'P18_USUARIO_FLUJOS_APLICADOS'
,p_parent_plug_id=>wwv_flow_api.id(110423861960984403)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_ajste,',
'        a.numro_ajste,',
'        a.idntfccion_sjto,',
'        a.nmbre_impsto,',
'		a.nmbre_impsto_sbmpsto,',
'        to_char(a.vlor, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor,',
'        a.dscrpcion_orgen,',
'        to_char(a.fcha_aplccion,''DD/MM/YYYY'') fcha_aplccion,',
'		a.tpo_ajste,',
'		a.dscrpcion_estado,',
'	    a.dscrpcion_motivo,',
'        a.dscrpcion_dcmnto_sprte,',
'        a.id_acto,',
'        a.nmro_dcmto_sprte,',
'		a.id_instncia_fljo',
'',
'        from v_gf_g_ajustes a',
'  ',
' where a.cdgo_clnte           = :F_CDGO_CLNTE ',
'                                   and a.id_usrio= :F_ID_USRIO ',
'								   and a.id_impsto              = nvl(:P18_ID_IMPSTO_JAP, a.id_impsto)',
'								   and a.id_impsto_sbmpsto      = nvl(:P18_ID_IMPSTO_SBMPSTO_AJAP, a.id_impsto_sbmpsto)',
'								   and a.idntfccion_sjto        = nvl(:P18_IDNTFCCION_AJAP, a.idntfccion_sjto)',
'								   and a.cdgo_ajste_estdo= ''AP''',
'                                --   and a.id_acto                = nvl(:P18_ID_ACTO_AJAP, a.id_acto)',
'                                   and a.id_ajste_mtvo          = nvl(:P18_ID_MTVO_AJAP, a.id_ajste_mtvo)',
'                                   and a.orgen                  = nvl(:P18_ORGEN_AJAP, a.orgen)',
'                                   and  ((trunc(a.fcha_aplccion) between :P18_FECHA_AJAP and :P18_FECHA_HASTA_AJAP)',
'                                   or (trunc(a.fcha_aplccion) >= :P18_FECHA_AJAP and :P18_FECHA_HASTA_AJAP is null) ',
'                                   or (trunc(a.fcha_aplccion) <= :P18_FECHA_HASTA_AJAP and :P18_FECHA_AJAP  is null)',
'                                   or(:P18_FECHA is null and :P18_FECHA_HASTA_AJAP is null )) ;',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28940067266954506)
,p_name=>'ID_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE'
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
 p_id=>wwv_flow_api.id(28940101891954507)
,p_name=>'NUMRO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUMRO_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Ajuste'
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
 p_id=>wwv_flow_api.id(28940276783954508)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Identificacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(28940317862954509)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(28940450346954510)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(28940596485954511)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(28940644343954512)
,p_name=>'DSCRPCION_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Procesamiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>6
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
 p_id=>wwv_flow_api.id(28940739457954513)
,p_name=>'FCHA_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APLCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha de Aplicacion'
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
 p_id=>wwv_flow_api.id(28940867095954514)
,p_name=>'TPO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>7
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
 p_id=>wwv_flow_api.id(28940985401954515)
,p_name=>'DSCRPCION_ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
 p_id=>wwv_flow_api.id(28941022008954516)
,p_name=>'DSCRPCION_MOTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MOTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>300
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
 p_id=>wwv_flow_api.id(28941109942954517)
,p_name=>'DSCRPCION_DCMNTO_SPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_DCMNTO_SPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Documento Soporte'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(28941214892954518)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(28941319248954519)
,p_name=>'NMRO_DCMTO_SPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMTO_SPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'No. Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:gn_g_actos,FILE_BLOB,FILENAME,FILE_MIMETYPE,ID_ACTO,&ID_ACTO.'
,p_link_text=>'&NMRO_DCMTO_SPRTE.'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28941481203954520)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(28941599613954521)
,p_name=>'Ver'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:197:&SESSION.::&DEBUG.:RP:P197_ID_AJSTE,P197_ID_INSTNCIA_FLJO,P197_NUMRO_AJSTE:&ID_AJSTE.,&ID_INSTNCIA_FLJO.,&NUMRO_AJSTE.'
,p_link_text=>'&"Ver".<span class="fa fa-eye"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(28939967902954505)
,p_internal_uid=>28939967902954505
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('No se encontraron Ajustes Aplicados dentro de los par\00E1metros de la consulta.')
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
 p_id=>wwv_flow_api.id(28966784033014637)
,p_interactive_grid_id=>wwv_flow_api.id(28939967902954505)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(28966835855014637)
,p_report_id=>wwv_flow_api.id(28966784033014637)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28967334973014639)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(28940067266954506)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28967873831014640)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(28940101891954507)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28968360726014642)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(28940276783954508)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28968822391014643)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(28940317862954509)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>195
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28969313907014645)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(28940450346954510)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28969867561014647)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(28940596485954511)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>83
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28970317028014649)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(28940644343954512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28970877705014651)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(28940739457954513)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28971352937014652)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(28940867095954514)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28971824930014653)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(28940985401954515)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28972370670014655)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(28941022008954516)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>213
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28972810427014656)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(28941109942954517)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>168
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28973358852014658)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(28941214892954518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28973864959014660)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(28941319248954519)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28974385807014661)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(28941481203954520)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>65
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28991803593067190)
,p_view_id=>wwv_flow_api.id(28966835855014637)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(28941599613954521)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110065142745311536)
,p_plug_name=>'Ajustes Aplicados por Usuario'
,p_region_name=>'P18_USUARIO_FLUJOS_APLICADOS_2'
,p_parent_plug_id=>wwv_flow_api.id(110423861960984403)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_ajste,',
'        a.numro_ajste,',
'      --  a.id_impsto,',
'      --  a.id_impsto_sbmpsto,',
'      --  a.id_sjto_impsto,',
'        a.idntfccion_sjto,',
'        a.nmbre_impsto,',
'		a.nmbre_impsto_sbmpsto,',
'	--	a.vlor,',
'        to_char(a.vlor, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor,',
'      --  a.orgen,',
'        a.dscrpcion_orgen,',
'    --    a.drccion,',
'	--	b.nmbre_rzon_scial,',
'	--	to_char(a.fcha,''DD/MM/YYYY'') fcha,',
'        to_char(a.fcha_aplccion,''DD/MM/YYYY'') fcha_aplccion,',
'	--	a.nmro_slctud,',
'	--	a.cdgo_tpo_ajste,',
'		a.tpo_ajste,',
'	--	a.cdgo_ajste_estdo,',
'		a.dscrpcion_estado,',
'	--	c.nmbre_trcro,',
'        a.dscrpcion_motivo,',
'   --   a.dscrpcion_dcmnto_sprte,',
'   --   a.id_acto,',
'   --   a.nmro_dcmto_sprte,',
'		a.id_instncia_fljo--,',
'	--	a.id_fljo_trea,',
'    --    a.id_instncia_fljo_pdre',
'        from v_gf_g_ajustes a',
'    --    left  join v_si_i_sujetos_responsable b  on a.id_sjto_impsto = b.id_sjto  and b.prncpal_s_n = ''S''',
'	--	join v_sg_g_usuarios                  c on a.id_usrio = c.id_usrio',
'',
'',
' where a.cdgo_clnte           = :F_CDGO_CLNTE ',
'                                   and a.id_usrio= :F_ID_USRIO ',
'								   and a.id_impsto              = nvl(:P18_ID_IMPSTO_JAP, a.id_impsto)',
'								   and a.id_impsto_sbmpsto      = nvl(:P18_ID_IMPSTO_SBMPSTO_AJAP, a.id_impsto_sbmpsto)',
'								   and a.idntfccion_sjto        = nvl(:P18_IDNTFCCION_AJAP, a.idntfccion_sjto)',
'								   and a.cdgo_ajste_estdo= ''AP''',
'                                --   and a.id_acto                = nvl(:P18_ID_ACTO_AJAP, a.id_acto)',
'                                   and a.id_ajste_mtvo          = nvl(:P18_ID_MTVO_AJAP, a.id_ajste_mtvo)',
'                                   and a.orgen                  = nvl(:P18_ORGEN_AJAP, a.orgen)',
'                                   and  ((trunc(a.fcha_aplccion) between :P18_FECHA_AJAP and :P18_FECHA_HASTA_AJAP)',
'                                   or (trunc(a.fcha_aplccion) >= :P18_FECHA_AJAP and :P18_FECHA_HASTA_AJAP is null) ',
'                                   or (trunc(a.fcha_aplccion) <= :P18_FECHA_HASTA_AJAP and :P18_FECHA_AJAP  is null)',
'                                   or(:P18_FECHA is null and :P18_FECHA_HASTA_AJAP is null ))/*',
'                                                                   and a.cdgo_ajste_estdo in (''A'',''RG'')',
'								  ',
'        ',
'/*where a.cdgo_clnte  = :F_CDGO_CLNTE and',
'a.cdgo_ajste_estdo= ''AP'' and a.id_usrio= :F_ID_USRIO ',
'order by  a.fcha_aplccion desc*/ ;',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110065329053311538)
,p_name=>'ID_AJSTE_AP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(110065702782311542)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Identificacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(110065810982311543)
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
 p_id=>wwv_flow_api.id(110065942315311544)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(110066010267311545)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(110066246140311547)
,p_name=>'DSCRPCION_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Procesamiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>6
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
 p_id=>wwv_flow_api.id(110105249495411303)
,p_name=>'TPO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>7
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
 p_id=>wwv_flow_api.id(110105443611411305)
,p_name=>'DSCRPCION_ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(110105613535411307)
,p_name=>'DSCRPCION_MOTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MOTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>300
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
 p_id=>wwv_flow_api.id(110424089932984405)
,p_name=>'FCHA_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APLCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha de Aplicacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(110665875643065401)
,p_name=>'Ver'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:197:&SESSION.::&DEBUG.:RP:P197_ID_AJSTE,P197_ID_INSTNCIA_FLJO,P197_NUMRO_AJSTE:&ID_AJSTE_AP.,&ID_INSTNCIA_FLJO.,&NUMRO_AJSTE.'
,p_link_text=>'&"Ver".<span class="fa fa-eye"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110726279734141101)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Flujo'
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
 p_id=>wwv_flow_api.id(113635749836580102)
,p_name=>'NUMRO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUMRO_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(110065201427311537)
,p_internal_uid=>110065201427311537
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(110110692739411666)
,p_interactive_grid_id=>wwv_flow_api.id(110065201427311537)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(110110740906411666)
,p_report_id=>wwv_flow_api.id(110110692739411666)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35901474188958)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(110424089932984405)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>143
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110111298987411667)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(110065329053311538)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110113233621411672)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(110065702782311542)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>208
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110113723167411673)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(110065810982311543)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>212
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110114217184411674)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(110065942315311544)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110114706834411676)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(110066010267311545)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110115744942411678)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(110066246140311547)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110118792114411686)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(110105249495411303)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110119704122411689)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(110105443611411305)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110120735139411692)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(110105613535411307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110671190223071829)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(110665875643065401)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110732210906141344)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(110726279734141101)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113643610243601917)
,p_view_id=>wwv_flow_api.id(110110740906411666)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(113635749836580102)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>93
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118089715642256201)
,p_plug_name=>'<b>Ajustes por Gestionar</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179601957578635106)
,p_plug_name=>'Ajustes '
,p_region_name=>'P18_GRID_FLUJOS'
,p_parent_plug_id=>wwv_flow_api.id(118089715642256201)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  s.id_ajste,',
'        s.numro_ajste,',
'        s.id_impsto,',
'        s.id_impsto_sbmpsto,',
'        s.id_sjto_impsto,',
'        s.idntfccion_sjto,',
'        s.idntfccion_sjto_frmtda,',
'        s.nmbre_impsto,',
'        s.nmbre_impsto_sbmpsto,',
'        to_char(s.vlor, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor,',
'        s.orgen,',
'        s.dscrpcion_orgen,',
'        s.drccion,',
'    --    s.nmbre_rzon_scial,',
'        s.fcha,',
'        s.nmro_slctud,',
'        s.cdgo_tpo_ajste,',
'        s.tpo_ajste,',
'        s.cdgo_ajste_estdo,',
'        s.dscrpcion_estado,',
'    --    s.nmbre_trcro,',
'        s.dscrpcion_motivo,',
' --       s.dscrpcion_dcmnto_sprte,',
' --       s.id_acto,',
' --       s.nmro_dcmto_sprte,       ',
'        s.id_instncia_fljo,',
'		s.id_fljo_trea,',
'        s.id_instncia_fljo_pdre ,',
'		fnc ',
'        from (',
'                             select  a.id_ajste,',
'                                     a.numro_ajste,',
'									 a.id_impsto,',
'									 a.id_impsto_sbmpsto,',
'								     a.id_sjto_impsto,',
'                                    case when length(a.idntfccion_sjto) = 15 then ',
'											pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion_sjto, p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) ',
'									 when length(a.idntfccion_sjto) = 25 then',
'											pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion_sjto, p_frmto => ''xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'' , p_crcter_dlmtdor => ''-'' )',
'									 end as idntfccion_sjto_frmtda,',
'                                     a.idntfccion_sjto,',
'									 a.nmbre_impsto,',
'									 a.nmbre_impsto_sbmpsto,',
'									 a.vlor,',
'                                     a.orgen,',
'                                     a.dscrpcion_orgen,',
'                                     a.drccion,',
'								/*	 case',
'										when b.cdgo_idntfccion_tpo = ''N'' then',
'											b.prmer_nmbre ',
'										else',
'											nvl2( b.sgndo_nmbre, b.prmer_nmbre || '' '' || b.sgndo_nmbre, b.prmer_nmbre) || ',
'											'' ''  || nvl2( b.sgndo_aplldo, b.prmer_aplldo || '' '' || b.sgndo_aplldo, b.prmer_aplldo) ',
'									 end nmbre_rzon_scial,*/',
'									 to_char(a.fcha,''DD/MM/YYYY'') fcha,',
'								 	 a.nmro_slctud,',
'									 a.cdgo_tpo_ajste,',
'									 a.tpo_ajste,',
'									 a.cdgo_ajste_estdo,',
'									 a.dscrpcion_estado,',
'								--	 c.nmbre_trcro,',
'                                     a.dscrpcion_motivo,',
'                                --   a.dscrpcion_dcmnto_sprte,',
'                                --   a.id_acto,',
'                                --   a.nmro_dcmto_sprte,',
'									 a.id_instncia_fljo,',
'									 a.id_fljo_trea,',
'                                     a.id_instncia_fljo_pdre,',
'                                     pkg_pl_workflow_1_0.fnc_vl_tarea_particpnte_s_n(p_id_fljo_trea => d.id_fljo_trea_orgen , p_user_apex  => :F_ID_USRIO )   fnc',
'				                /*     pkg_pl_workflow_1_0.fnc_vl_tarea_particpnte_s_n(p_id_fljo_trea => a.id_fljo_trea , p_user_apex  => :F_ID_USRIO )   fnc */',
'                                   ',
'                             from  v_gf_g_ajustes a',
'							--	  left  join si_i_sujetos_responsable b  on a.id_sjto_impsto = b.id_sjto_impsto and b.prncpal_s_n = ''S''',
'							--	  join v_sg_g_usuarios                  c on a.id_usrio = c.id_usrio',
'                                  join wf_g_instancias_transicion       d  on a.id_instncia_fljo = d.id_instncia_fljo and d.id_estdo_trnscion in (1,2,4) and d.id_usrio=:F_ID_USRIO',
'								   where a.cdgo_clnte           = :F_CDGO_CLNTE',
'								   and a.id_impsto              = nvl(:P18_ID_IMPSTO, a.id_impsto)',
'								   and a.id_impsto_sbmpsto      = nvl(:P18_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'								   and a.idntfccion_sjto        = nvl(:P18_IDNTFCCION, a.idntfccion_sjto)',
'								   and a.cdgo_ajste_estdo       = nvl(:P18_CDGO_AJSTE, a.cdgo_ajste_estdo)',
'                           --        and a.id_acto                = nvl(:P18_ID_ACTO, a.id_acto)',
'                                   and a.id_ajste_mtvo          = nvl(:P18_ID_MTVO, a.id_ajste_mtvo)',
'                                   and a.orgen                  = nvl(:P18_ORGEN, a.orgen) ',
'                                    and  ((trunc(a.fcha) between :P18_FECHA and :P18_FECHA_HASTA)',
'                                   or (trunc(a.fcha) >= :P18_FECHA and :P18_FECHA_HASTA is null) ',
'                                   or (trunc(a.fcha) <= :P18_FECHA_HASTA and :P18_FECHA  is null)',
'                                   or(:P18_FECHA is null and :P18_FECHA_HASTA is null )) ',
'								   and a.cdgo_ajste_estdo in (''A'',''RG'')',
'								  )s ',
'                            where s.fnc = ''S'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48194677296435022)
,p_name=>'ID_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_AJSTE'
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
 p_id=>wwv_flow_api.id(48194772258435023)
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
 p_id=>wwv_flow_api.id(48194860503435024)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(48194909413435025)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(48195066156435026)
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
 p_id=>wwv_flow_api.id(48195128156435027)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SubTributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(48195221909435028)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>25
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48195334026435029)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48195525447435031)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
 p_id=>wwv_flow_api.id(48195621806435032)
,p_name=>'NMRO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(48195702127435033)
,p_name=>'CDGO_TPO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48195867749435034)
,p_name=>'TPO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_AJSTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>7
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
 p_id=>wwv_flow_api.id(48195992924435035)
,p_name=>'DSCRPCION_ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
 p_id=>wwv_flow_api.id(48196158592435037)
,p_name=>'Ir al Flujo'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir al Flujo &ID_INSTNCIA_FLJO.<span class="fa fa-external-link-square"></span>',
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
 p_id=>wwv_flow_api.id(82205926620635301)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(82736147838442501)
,p_name=>'CDGO_AJSTE_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_AJSTE_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(83072384499886601)
,p_name=>'FNC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FNC'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(85931905935571901)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(91915864036881501)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(91915964738881502)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99321554677636701)
,p_name=>'Adjuntos'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Adjuntos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:152:&SESSION.::&DEBUG.:RP:P152_ID_AJSTE,P152_ID_ACTO,P152_DSCRPCION_ACTO:&ID_AJSTE.,&ID_ACTO.,&DSCRPCION_DCMNTO_SPRTE.'
,p_link_text=>'&"Adjuntos".<span class="fa fa-eye"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99321656559636702)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(108490015276381901)
,p_name=>'ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
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
 p_id=>wwv_flow_api.id(108716790006959402)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
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
 p_id=>wwv_flow_api.id(109401430669436411)
,p_name=>'DSCRPCION_MOTIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MOTIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>300
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
 p_id=>wwv_flow_api.id(109813736464762602)
,p_name=>'DSCRPCION_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Procesamiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>6
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
 p_id=>wwv_flow_api.id(113635664859580101)
,p_name=>'NUMRO_AJSTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUMRO_AJSTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Ajuste'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
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
 p_id=>wwv_flow_api.id(119738904252495501)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(48194549176435021)
,p_internal_uid=>48194549176435021
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('No se encontraron Ajustes para gestionar dentro de los par\00E1metros de la consulta.')
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
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
'function(config){',
'    return selectAll(config, {',
'       name: ''Procesar Todos'',',
'       action: procesarTodos ,',
'        icon :''fa-folder-play'',',
'        iconAlign:''left''',
'   });',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(49366748926153597)
,p_interactive_grid_id=>wwv_flow_api.id(48194549176435021)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(49366826804153597)
,p_report_id=>wwv_flow_api.id(49366748926153597)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4995123015167)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(99321656559636702)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49367360288153599)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(48194677296435022)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>72
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49367876377153601)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(48194772258435023)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49368331188153602)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(48194860503435024)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49368806071153604)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(48194909413435025)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49369358847153605)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(48195066156435026)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>180
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49369854067153606)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(48195128156435027)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>193
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49370352975153608)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(48195221909435028)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49370855634153610)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(48195334026435029)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49371851979153612)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(48195525447435031)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49372389242153614)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(48195621806435032)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49372856276153615)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(48195702127435033)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49373360927153616)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(48195867749435034)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49373871385153617)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(48195992924435035)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49382261740190499)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(48196158592435037)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(82211921093636949)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(82205926620635301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(82742174568443970)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(82736147838442501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83078312286886962)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(83072384499886601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(85937201013576671)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(85931905935571901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91921903288890176)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(91915864036881501)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99333437686643369)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(99321554677636701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108496099019382224)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(108490015276381901)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108723327793959655)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(108716790006959402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109732553950927693)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(109401430669436411)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>228
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109832586204315161)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(109813736464762602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113641624792580348)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(113635664859580101)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>92
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119744809913495853)
,p_view_id=>wwv_flow_api.id(49366826804153597)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(119738904252495501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>248
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179740358673438686)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
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
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179740605393438688)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_name=>'Busqueda_Collapsible'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(188250142675953171)
,p_plug_name=>'Ayuda '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
'<b>1.</b> Acceder a cada flujo de proceso de Ajuste para Ver su detalle Aprobar, No Aprobar, Aplicar o No Aplicar la solicitud.<br><br>',
'',
unistr('<b>2.</b> Procesar toda la poblaci\00F3n filtrada a trav\00E9s del bot\00F3n "Procesar Todos" Aprobando o Aplicando masivamente dependiendo en la etapa del flujo de proceso que en el que se encuentren cada uno de estos.<br><br>'),
unistr('<b>3.</b>Procesar todos los flujos de proceso seleccionados  a trav\00E9s del bot\00F3n "Aplicar Acci\00F3n Masiva" Aprobando o Aplicando masivamente dependiendo en la etapa del flujo de proceso que en el que se encuentren cada uno de estos.<br><br>'),
'<b>4.</b> Consultar cada flujo de proceso de Ajuste  Aplicado por el Usuario para Ver su detalle.<br><br>',
'',
'</i> ',
'<br>',
'',
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(177374655004050691)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(118562714045740607)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(110423861960984403)
,p_button_name=>'BTN_CONSULTA_AJAP'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consulta'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(177374655004050691)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91957246559048602)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(179740358673438686)
,p_button_name=>'BTN_APLCR_ACCN_MSVA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Gestionar Selecci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check-square-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(178949700625947483)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(179740605393438688)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Par\00E1metros')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:P3_NMRO_PGNA,P3_NMRO_APP,P3_NMBRE_ITEM:&APP_PAGE_ID.,&APP_ID.,P18_ID_SJTO_IMPSTO'
,p_button_condition=>'1=0'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(177374655004050691)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(179740458520438687)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(179740358673438686)
,p_button_name=>'BTN_NUEVO_AJSTE'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Nuevo Ajuste'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=62000:17:&SESSION.::&DEBUG.:RP,17,105,106:P17_ID_PRCSO:6'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(177374655004050691)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(178949580353947482)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(179740605393438688)
,p_button_name=>'BTN_CONSULTA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consulta'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(177374655004050691)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(111056759618360102)
,p_branch_name=>'Redirigir al flujo'
,p_branch_action=>'DECLARE'||wwv_flow.LF||
'    v_url varchar2(4000);'||wwv_flow.LF||
'    l_app number := v(''APP_ID'');'||wwv_flow.LF||
'    l_session number := v(''APP_SESSION'');'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'    apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', :P18_ID_INSTNCIA_FLJO);--ITEM'||wwv_flow.LF||
'    apex_util.set_session_state(''F_ID_FLJO_TREA'', :P18_ID_FLJO_TREA);--ITEM'||wwv_flow.LF||
'    v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => :P18_ID_INSTNCIA_FLJO,'||wwv_flow.LF||
'                                                    p_id_fljo_trea     => :P18_ID_FLJO_TREA,'||wwv_flow.LF||
'                                                    p_clear_session    => ''S'');'||wwv_flow.LF||
'    return v_url;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
''
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'cargarflujo'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28579625870789001)
,p_name=>'P18_MNSJE_RSPSTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91957130803048601)
,p_name=>'P18_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(179601957578635106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108716917688959404)
,p_name=>'P18_ID_ACTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_prompt=>'<b>Acto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select distinct(a.nmro_dcmto_sprte),a.id_acto',
' from v_gf_g_ajustes a',
'  join wf_g_instancias_transicion       b  on a.id_instncia_fljo = b.id_instncia_fljo and b.id_estdo_trnscion in (1,2,4) and b.id_usrio=:F_ID_USRIO',
'--where id_acto in (select distinct(id_acto) from gf_g_ajustes);',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109813686172762601)
,p_name=>'P18_ORGEN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_prompt=>'<b>Procesamiento</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(a.dscrpcion_orgen),a.orgen',
' from v_gf_g_ajustes a',
'  join wf_g_instancias_transicion       b  on a.id_instncia_fljo = b.id_instncia_fljo and b.id_estdo_trnscion in (1,2,4) and b.id_usrio=:F_ID_USRIO;',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110583274891933801)
,p_name=>'P18_ID_MTVO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_prompt=>'<b>Motivo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select distinct(a.dscrpcion_motivo),a.id_ajste_mtvo',
' from v_gf_g_ajustes a',
'  join wf_g_instancias_transicion       b  on a.id_instncia_fljo = b.id_instncia_fljo and b.id_estdo_trnscion in (1,2,4) and b.id_usrio=:F_ID_USRIO',
'--where id_acto in (select distinct(id_acto) from gf_g_ajustes);',
''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110755932879495908)
,p_name=>'P18_ID_INSTNCIA_FLJO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(110423861960984403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110756034859495909)
,p_name=>'P18_ID_FLJO_TREA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(110423861960984403)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118194655432251901)
,p_name=>'P18_MENSAJE_SUBMIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(118089715642256201)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118562195118740601)
,p_name=>'P18_ID_IMPSTO_AJAP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(110423861960984403)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select distinct(a.nmbre_impsto),a.id_impsto',
' from v_gf_g_ajustes a',
'  join wf_g_instancias_transicion       b  on a.id_instncia_fljo = b.id_instncia_fljo and b.id_usrio=:F_ID_USRIO',
'where cdgo_ajste_estdo IN (''AP'',''A'');'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118562279488740602)
,p_name=>'P18_IDNTFCCION_AJAP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(110423861960984403)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118562581312740605)
,p_name=>'P18_ID_MTVO_AJAP'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(110423861960984403)
,p_prompt=>'<b>Motivo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(a.dscrpcion_motivo),a.id_ajste_mtvo',
' from v_gf_g_ajustes a',
'  join wf_g_instancias_transicion       b  on a.id_instncia_fljo = b.id_instncia_fljo and b.id_usrio=:F_ID_USRIO',
'where cdgo_ajste_estdo =''AP'';',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118562674499740606)
,p_name=>'P18_TIPO_AJSTE_AJAP'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(110423861960984403)
,p_prompt=>'<b>Tipo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(a.tpo_ajste) ,a.cdgo_tpo_ajste',
' from v_gf_g_ajustes a',
'  join wf_g_instancias_transicion       b  on a.id_instncia_fljo = b.id_instncia_fljo and b.id_usrio=:F_ID_USRIO',
'where cdgo_ajste_estdo =''AP'';',
'',
'',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118562842950740608)
,p_name=>'P18_FECHA_AJAP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(110423861960984403)
,p_item_default=>'SYSDATE-7'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('<b>Fecha de Aplicaci\00F3n Desde</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118562942619740609)
,p_name=>'P18_FECHA_HASTA_AJAP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(110423861960984403)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('<b>Fecha de Aplicaci\00F3n Hasta</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118797957128031901)
,p_name=>'P18_FECHA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_prompt=>'<b>Fecha Desde</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118798013960031902)
,p_name=>'P18_FECHA_HASTA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_prompt=>'<b>Fecha Hasta</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178949288200947479)
,p_name=>'P18_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select distinct(a.nmbre_impsto),a.id_impsto',
' from v_gf_g_ajustes a',
'  join wf_g_instancias_transicion       b  on a.id_instncia_fljo = b.id_instncia_fljo and b.id_estdo_trnscion in (1,2,4) and b.id_usrio=:F_ID_USRIO',
'--where id_acto in (select distinct(id_acto) from gf_g_ajustes);'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178949408008947480)
,p_name=>'P18_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P18_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P18_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178949440328947481)
,p_name=>'P18_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178950031641947486)
,p_name=>'P18_ID_SJTO_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181977218525443874)
,p_name=>'P18_CDGO_AJSTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_prompt=>'<b>Estado</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(a.dscrpcion_estado),a.cdgo_ajste_estdo',
' from v_gf_g_ajustes a',
'  join wf_g_instancias_transicion       b  on a.id_instncia_fljo = b.id_instncia_fljo and b.id_estdo_trnscion in (1,2,4) and b.id_usrio=:F_ID_USRIO',
'--where id_acto in (select distinct(id_acto) from gf_g_ajustes)',
'',
'',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181978758754443890)
,p_name=>'P18_ID_AJSTE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(179740605393438688)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(186921964990771111)
,p_name=>unistr('Guardar en sesi\00F3n el valor del sub-impuesto selccionado')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_SUB_IMPUESTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186922416425771123)
,p_event_id=>wwv_flow_api.id(186921964990771111)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P14_ID_IMPSTO_SBMPSTO'',:P14_ID_IMPSTO_SBMPSTO);',
'END;'))
,p_attribute_02=>'P14_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91916104326881504)
,p_name=>'Al Seleccionar'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(179601957578635106)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91916264978881505)
,p_event_id=>wwv_flow_api.id(91916104326881504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerSeleccion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110171686638577006)
,p_name=>'Confrimacion de Aplicacion de Accion Masiva'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(91957246559048602)
,p_condition_element=>'P18_JSON'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'mousedown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110171758287577007)
,p_event_id=>wwv_flow_api.id(110171686638577006)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm ("\00BFEst\00E1 seguro de realizar la Gesti\00F3n por Selecci\00F3n de los ajustes seleccionados?"  , function( Aceptar ){'),
'   if( Aceptar ) {',
'      apex.page.submit( "ACEPTAR" );',
'   }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113984470747794401)
,p_name=>'Al Hacer Click en APlicacion Masiva'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(91957246559048602)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113984568768794402)
,p_event_id=>wwv_flow_api.id(113984470747794401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var lSpinner$ = apex.widget.waitPopup();',
'apex.submit({request: ''BTN_APLCR_ACCN_MSVA''});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(118563014746740610)
,p_name=>'al cambiar fecha desde'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P18_FECHA_AJAP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(118563199331740611)
,p_event_id=>wwv_flow_api.id(118563014746740610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P18_FECHA_HASTA_AJAP").datepicker( ''option'' , ''minDate'' , $("#P18_FECHA_AJAP").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(118798168538031903)
,p_name=>'al cambiar fecha desde_1'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P18_FECHA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(118798281261031904)
,p_event_id=>wwv_flow_api.id(118798168538031903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P18_FECHA_HASTA").datepicker( ''option'' , ''minDate'' , $("#P18_FECHA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32377550453610703)
,p_name=>unistr('Restricci\00F3n de la fecha hasta')
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32377632130610704)
,p_event_id=>wwv_flow_api.id(32377550453610703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P18_FECHA_HASTA").datepicker( ''option'' , ''minDate'' , $("#P18_FECHA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32377776636610705)
,p_name=>unistr('Restricci\00F3n de la fecha hasta_AP')
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32377865628610706)
,p_event_id=>wwv_flow_api.id(32377776636610705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P18_FECHA_HASTA_AJAP").datepicker( ''option'' , ''minDate'' , $("#P18_FECHA_AJAP").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35356430070614211)
,p_name=>unistr('Confirmar Validaci\00F3n de selecci\00F3n ')
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(91957246559048602)
,p_condition_element=>'P18_JSON'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'mousedown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35356579923614212)
,p_event_id=>wwv_flow_api.id(35356430070614211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.confirm ("Debe seleccionar al menos un ajuste para gestionar."  , function( Aceptar ){',
'   if( Aceptar ) {',
'  /*    apex.page.submit( "" );*/',
'   }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(178950306006947489)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular Id Ajuste'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'o_cdgo_rspsta       number;',
'v_mnsje             varchar2(10000);',
'V_IDNTFCCION        varchar2(100);',
'begin',
'    begin',
'--     :P18_MNSJE_RSPSTA:='''';',
'     o_cdgo_rspsta := 0;',
'     V_IDNTFCCION := :P18_IDNTFCCION;',
'',
'        select id_sjto_impsto ',
'          into :P18_ID_SJTO_IMPSTO ',
'          from v_si_i_sujetos_impuesto ',
'         where cdgo_clnte = :F_CDGO_CLNTE ',
'         and IDNTFCCION_SJTO = V_IDNTFCCION ;',
'',
'',
'    exception ',
'        when no_data_found then ',
'            o_cdgo_rspsta := 10;',
'            v_mnsje := ''El Sujeto impuesto no existe'';',
'         ',
'     end; ',
'    if (o_cdgo_rspsta > 0) then ',
'    /*    apex_error.add_error ( p_message          => v_mnsje,',
'                                    p_display_location => apex_error.c_inline_in_notification);*/',
'   ',
'        :P18_MNSJE_RSPSTA:=''El Sujeto impuesto no existe'';',
'    end if;',
'    ',
'end;    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(178949580353947482)
,p_process_when_type=>'NEVER'
,p_process_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'&P18_MNSJE_RSPSTA.',
'',
''))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(185871680266517694)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Item ID_AJSTE'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P18_ID_AJSTE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_CONSULTA,BTN_CONSULTA_PARAMETROS'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91916055875881503)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(179601957578635106)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Ajustes : Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91916384057881506)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Proceso Masivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_error   number;',
'    v_mnsje        varchar2(4000);',
'    v_xml          clob;',
'begin',
'   /* v_xml :=        ''<CDGO_CLNTE>''      ||:F_CDGO_CLNTE          ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_USRIO>''        ||:F_ID_USRIO            ||''</ID_USRIO>'';',
'    v_xml := v_xml||''<REQUEST>''         ||''BTN_APLCR_ACCN_MSVA''  ||''</REQUEST>'';',
'    v_xml := v_xml||''<SLCCION>''         ||:P18_JSON              ||''</SLCCION>'';*/',
'    ',
'    if :P18_JSON is null then ',
'      :P18_MENSAJE_SUBMIT:=''Debe seleccionar al menos un Ajuste para gestionar'';',
'      ',
'    else ',
'        pkg_gf_ajustes.prc_rg_ajste_accon_msva	( p_cdgo_clnte => :F_CDGO_CLNTE',
'                                                , p_id_usrio   => :F_ID_USRIO ',
'                                                , p_request    => ''BTN_APLCR_ACCN_MSVA'' ',
'                                                , p_slccion    => :P18_JSON',
'                                                , o_cdgo_error => v_cdgo_error',
'                                                , o_mnsje      => v_mnsje );',
' ',
'	    if (v_cdgo_error > 0) then',
'	--	RAISE_APPLICATION_ERROR (-20000,v_mnsje); ',
'            :P18_MENSAJE_SUBMIT:=v_mnsje;',
'        else',
'            :P18_MENSAJE_SUBMIT:=''la accion masiva se realizo correctamente'';',
'	    end if;',
'    ',
'      ',
'    end if;',
'    ',
'    ',
'    ',
'   ',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'''ACEPTAR'''
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'&P18_MENSAJE_SUBMIT.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(85932067799571902)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Continuar Flujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number := apex_application.g_f02(1);',
'    v_url varchar2(4000);',
'    v_id_fljo_trea_orgen number;',
'    ',
'begin',
'                begin',
'                ',
'                    select id_fljo_trea_orgen',
'                      into v_id_fljo_trea_orgen',
'                    from wf_g_instancias_transicion',
'                    where id_instncia_fljo = v_id_instncia_fljo',
'                      and id_estdo_trnscion in (1,2);',
'                ',
'                exception',
'                    when others then',
'                        v_id_fljo_trea_orgen := v_id_fljo_trea;',
'                end;',
'     ',
'     ',
'     apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'     apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea_orgen );            	',
'      v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                    p_id_fljo_trea     => v_id_fljo_trea_orgen,',
'                                                    p_clear_session    => ''S'');',
'        ',
'     apex_json.open_object;',
'     apex_json.write(''type'', ''OK'');',
'     apex_json.write(''msg'', ''Url generada exitosamente'');',
'     apex_json.write(''url'', v_url);',
'     apex_json.close_all();',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110606785957089301)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'procesar_seleccon_todo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_error   number;',
'    v_mnsje        varchar2(4000);',
'    v_xml          clob;',
'    v_json         clob;',
'begin',
'    for i in 1..apex_application.g_f01.count ',
'    loop',
'        v_json :=  v_json || apex_application.g_f01(i);',
'    end loop;',
'--    delete from muerto;',
'   /* v_xml :=        ''{"CDGO_CLNTE":"''     ||v(''F_CDGO_CLNTE'')          ||''",'';',
'    v_xml := v_xml||''"ID_USRIO":"''        ||v(''F_ID_USRIO'')            ||''",'';',
'    v_xml := v_xml||''"REQUEST":"''         ||''BTN_APLCR_ACCN_MSVA''  ||''",'';',
'    v_xml := v_xml||''"SLCCION":"''         || v_json         ||''"}'';',
'   insert into muerto (x) values (v_xml);*/',
'    begin',
'   /* insert into muerto (x)values(v_json);*/',
'       pkg_gf_ajustes.prc_rg_ajste_accon_msva	( p_cdgo_clnte => v(''F_CDGO_CLNTE'')',
'                                                , p_id_usrio   => v(''F_ID_USRIO'')',
'                                                , p_request    => ''BTN_APLCR_ACCN_MSVA'' ',
'                                                , p_slccion    => v_json',
'                                                , o_cdgo_error => v_cdgo_error',
'                                                , o_mnsje      => v_mnsje );',
'                                      ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'' );',
'            apex_json.write(''msg'',  ''error up'' || sqlerrm || v_cdgo_error|| ''-'' || v_mnsje);',
'            apex_json.close_object;',
'            return;',
'    end;                                                                                                               ',
'    apex_json.open_object;',
'    apex_json.write(''type'', case when v_cdgo_error = 0 then ''OK'' else ''ERROR'' end );',
'    apex_json.write(''msg'',  v_mnsje);',
'    apex_json.close_object;',
'exception',
'    when others then',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''ERROR'' );',
'    apex_json.write(''msg'',  sqlerrm );',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
