prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Gesti\00F3n Sujeto Impuesto')
,p_step_title=>unistr('Gesti\00F3n Sujeto Impuesto')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function actualizar_temporal(p_this){  ',
'    ',
'    var item_nmbre =  p_this.triggeringElement.name;',
'    var item_vlor  =  apex.item(item_nmbre).getValue();',
'    //item_text = $( "#P34_TPO_PRSNA option:selected" ).text();',
'    var item_text  = $( "#" + item_nmbre + " option:selected" ).text();',
'    ',
'    ',
'    ',
'    apex.server.process(''actualizar_temporal'', {',
'        f01: item_nmbre,',
'        f02: item_vlor,',
'        f03: item_text',
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
'',
'function actualizar_valor_ant(p_this){',
'    var item_nmbre =  p_this.triggeringElement.name;',
'    var item_vlor  =  apex.item(item_nmbre).getValue();',
'    var txto_vlor_antrior = $( "#" + item_nmbre + " option:selected" ).text();',
'    ',
'    apex.server.process(''actualizar_valor_ant'', {',
'        f01: item_nmbre,',
'        f02: item_vlor,',
'        f03: txto_vlor_antrior',
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
'    ',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'$(document).ready(() => {',
'    ',
'    if($v( "P56_SJTO_IMPSTO" ) === ''''){',
'        apex.item(''SR_rspnsble_tab'').hide();',
'    }else if ( $v( "P56_TPO_PRSNA_OCULTO" ) === ''N''){',
'        apex.item(''SR_rspnsble_tab'').hide();',
'    }',
'});',
'*/',
'',
''))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20250115151741'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25144060227674696)
,p_plug_name=>'Observaciones Novedad'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 ',
'from si_g_novedades_observacion a',
'join sg_g_usuarios b on a.id_usrio = b.id_usrio',
'join si_c_terceros c on b.id_trcro = c.id_trcro',
'where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25144277638674698)
,p_plug_name=>'observaciones'
,p_parent_plug_id=>wwv_flow_api.id(25144060227674696)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_nvddes_obsrvcion,',
'       a.id_nvdad,',
'       a.cdgo_nvdad_prsna_estdo,',
'       a.id_instncia_fljo,',
'       a.id_fljo_trea,',
'       a.id_usrio,',
'       a.obsrvcion,',
'       a.fcha_obsrvcion,',
'       (c.prmer_nmbre ||'' ''|| c.sgndo_nmbre ||'' ''|| c.prmer_aplldo ||'' ''|| c.sgndo_aplldo) usuario',
'from si_g_novedades_observacion a',
'join sg_g_usuarios b on a.id_usrio = b.id_usrio',
'join si_c_terceros c on b.id_trcro = c.id_trcro',
'where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25173563760028640)
,p_name=>'ID_NVDDES_OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NVDDES_OBSRVCION'
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
 p_id=>wwv_flow_api.id(25173718863028641)
,p_name=>'ID_NVDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NVDAD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(25173818194028642)
,p_name=>'CDGO_NVDAD_PRSNA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_NVDAD_PRSNA_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(25173937119028643)
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(25173983109028644)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(25174093752028645)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(25216196185138596)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Obsrvcion'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(25216335315138597)
,p_name=>'FCHA_OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OBSRVCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Obsrvcion'
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
 p_id=>wwv_flow_api.id(25216402742138598)
,p_name=>'USUARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USUARIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Usuario'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(25173523043028639)
,p_internal_uid=>25173523043028639
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
 p_id=>wwv_flow_api.id(25222136207138795)
,p_interactive_grid_id=>wwv_flow_api.id(25173523043028639)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(25222246877138795)
,p_report_id=>wwv_flow_api.id(25222136207138795)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25222729186138796)
,p_view_id=>wwv_flow_api.id(25222246877138795)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(25173563760028640)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25223251670138798)
,p_view_id=>wwv_flow_api.id(25222246877138795)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(25173718863028641)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25223716110138799)
,p_view_id=>wwv_flow_api.id(25222246877138795)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(25173818194028642)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25224230219138800)
,p_view_id=>wwv_flow_api.id(25222246877138795)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(25173937119028643)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25224713256138802)
,p_view_id=>wwv_flow_api.id(25222246877138795)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(25173983109028644)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25225222416138803)
,p_view_id=>wwv_flow_api.id(25222246877138795)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(25174093752028645)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25225617978138804)
,p_view_id=>wwv_flow_api.id(25222246877138795)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(25216196185138596)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25226070645138806)
,p_view_id=>wwv_flow_api.id(25222246877138795)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(25216335315138597)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>166
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(25226612945138807)
,p_view_id=>wwv_flow_api.id(25222246877138795)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(25216402742138598)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70102564942135801)
,p_plug_name=>'Flujo &P28_DSCRPCION_NVDAD_TPO. '
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
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
 p_id=>wwv_flow_api.id(84333783033015517)
,p_plug_name=>'Datos'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84335518548015534)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P28_ID_NVDAD_PRSNA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70103385232135809)
,p_plug_name=>'Tab Selector'
,p_parent_plug_id=>wwv_flow_api.id(84335518548015534)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8818621331671801)
,p_plug_name=>'Sucursales'
,p_parent_plug_id=>wwv_flow_api.id(70103385232135809)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        , c001 id_sjto_impsto',
'        , c002 nmbre',
'        , c003 prncpal_s_n',
'        , c004 cdgo_scrsal',
'        , c005 id_dprtmnto_ntfccion',
'        , c006 id_mncpio_ntfccion',
'        , c007 drccion_ntfccion',
'        , c008 email',
'        , c009 tlfno',
'        , c010 cllar',
'        , c011 actvo ',
'        , c012 estdo',
'     from apex_collections    a',
'    where collection_name     = ''SUCURSALES''',
'      and n001                = :F_ID_INSTNCIA_FLJO',
'    order by cdgo_scrsal;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(8818786102671802)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:55:&SESSION.:actualizar:&DEBUG.:RP,55:P55_SEQ_ID:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JPRADA'
,p_internal_uid=>8818786102671802
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8818993803671804)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8819652846671811)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>90
,p_column_identifier=>'E'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9022159183176003)
,p_db_column_name=>'CDGO_SCRSAL'
,p_display_order=>100
,p_column_identifier=>'Q'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8821079747671825)
,p_db_column_name=>'NMBRE'
,p_display_order=>110
,p_column_identifier=>'P'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8820152889671816)
,p_db_column_name=>'ID_DPRTMNTO_NTFCCION'
,p_display_order=>120
,p_column_identifier=>'G'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70569261834676479)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8820293985671817)
,p_db_column_name=>'ID_MNCPIO_NTFCCION'
,p_display_order=>130
,p_column_identifier=>'H'
,p_column_label=>'Municipio'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70579007349685835)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8820397487671818)
,p_db_column_name=>'DRCCION_NTFCCION'
,p_display_order=>140
,p_column_identifier=>'I'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8820401072671819)
,p_db_column_name=>'EMAIL'
,p_display_order=>150
,p_column_identifier=>'J'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8820511684671820)
,p_db_column_name=>'TLFNO'
,p_display_order=>160
,p_column_identifier=>'K'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8820685909671821)
,p_db_column_name=>'CLLAR'
,p_display_order=>170
,p_column_identifier=>'L'
,p_column_label=>'Celular'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8820753956671822)
,p_db_column_name=>'ACTVO'
,p_display_order=>180
,p_column_identifier=>'M'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8820995364671824)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>190
,p_column_identifier=>'O'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(152455977444100201)
,p_db_column_name=>'ESTDO'
,p_display_order=>200
,p_column_identifier=>'R'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(8829222950684082)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'88293'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_SCRSAL:NMBRE:DRCCION_NTFCCION:EMAIL:TLFNO:CLLAR:ACTVO::ESTDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70102801622135804)
,p_plug_name=>'Actividades Economicas'
,p_parent_plug_id=>wwv_flow_api.id(70103385232135809)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select SEQ_ID',
'        , n001                id_actvdad_ecnmca        ',
'     from APEX_collections    a    ',
'    where collection_name     = ''ACTIVIDADES_ECONOMICAS'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70103531601135811)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70103699139135812)
,p_name=>'ID_ACTVDAD_ECNMCA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTVDAD_ECNMCA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Actividad Economica'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ''['' || a.cdgo_dclrcns_esqma_trfa || ''] '' || a.dscrpcion',
'         , a.id_dclrcns_esqma_trfa     id_actvdad_ecnmca',
'from    gi_d_dclrcns_esqma_trfa     a',
'join    gi_d_dclrcns_esqma_trfa_tpo b   on  b.id_dclrcns_esqma_trfa_tpo =   a.id_dclrcns_esqma_trfa_tpo',
'where   b.cdgo_clnte                =   :F_CDGO_CLNTE',
'        and cdgo_dclrcns_esqma_trfa_tpo in (''1'',''2'',''3'',''4'') ',
'        and sysdate between fcha_dsde and fcha_hsta',
'order by    a.dscrpcion',
'',
'',
'/*   select  ''['' || b.cdgo_actvdad_ecnmca || ''] '' || b.dscrpcion',
'        , id_actvdad_ecnmca',
'     from gi_d_actividades_ecnmca_tpo    a',
'     join gi_d_actividades_economica     b on a.id_actvdad_ecnmca_tpo = b.id_actvdad_ecnmca_tpo',
'    where a.cdgo_clnte                   = :F_CDGO_CLNTE',
' order by b.cdgo_actvdad_ecnmca*/'))
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
 p_id=>wwv_flow_api.id(70103893927135814)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(70103945498135815)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(70103446402135810)
,p_internal_uid=>70103446402135810
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(70148378530347053)
,p_interactive_grid_id=>wwv_flow_api.id(70103446402135810)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(70148454428347058)
,p_report_id=>wwv_flow_api.id(70148378530347053)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70148971084347079)
,p_view_id=>wwv_flow_api.id(70148454428347058)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(70103531601135811)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70149403817347084)
,p_view_id=>wwv_flow_api.id(70148454428347058)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(70103699139135812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(70152533859348839)
,p_view_id=>wwv_flow_api.id(70148454428347058)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(70103893927135814)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89682919758408448)
,p_plug_name=>'Responsables'
,p_parent_plug_id=>wwv_flow_api.id(70103385232135809)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        , c001 id_sjto_rspnsble',
'        , c002 id_sjto_impsto',
'        , c003 cdgo_idntfccion_tpo',
'        , c004 idntfccion',
'        , c005 prmer_nmbre',
'        , c006 sgndo_nmbre',
'        , c007 prmer_aplldo',
'        , c008 sgndo_aplldo',
'        , c009 prncpal_s_n',
'        , c010 cdgo_tpo_rspnsble',
'        , c011 prcntje_prtcpcion',
'        , c012 orgen_dcmnto',
'        , c013 id_pais_ntfccion',
'        , c014 id_dprtmnto_ntfccion',
'        , c015 id_mncpio_ntfccion',
'        , c016 drccion_ntfccion',
'        , c017 email',
'        , c018 tlfno',
'        , c019 cllar',
'        , c020 actvo',
'        , c021 id_trcro',
'        , c022 estdo',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'      and n001                = :F_ID_INSTNCIA_FLJO;'))
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
 p_id=>wwv_flow_api.id(89683033457408449)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:35:&SESSION.:actualizar:&DEBUG.:RP,35:P35_SEQ_ID:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'LTORRES'
,p_internal_uid=>89683033457408449
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70523056771301927)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'BD'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70056783899857673)
,p_db_column_name=>'ID_SJTO_RSPNSBLE'
,p_display_order=>20
,p_column_identifier=>'AI'
,p_column_label=>'Id Sjto Rspnsble'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70520761186301904)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'AJ'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70520882024301905)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO'
,p_display_order=>40
,p_column_identifier=>'AK'
,p_column_label=>unistr('Tipo de<br> Indentificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70586543772699932)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70520977508301906)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>50
,p_column_identifier=>'AL'
,p_column_label=>unistr('Indentificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70521066077301907)
,p_db_column_name=>'PRMER_NMBRE'
,p_display_order=>60
,p_column_identifier=>'AM'
,p_column_label=>'Primer Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70521115098301908)
,p_db_column_name=>'SGNDO_NMBRE'
,p_display_order=>70
,p_column_identifier=>'AN'
,p_column_label=>'Segundo Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70521292016301909)
,p_db_column_name=>'PRMER_APLLDO'
,p_display_order=>80
,p_column_identifier=>'AO'
,p_column_label=>'Primer Apellidos'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70521365347301910)
,p_db_column_name=>'SGNDO_APLLDO'
,p_display_order=>90
,p_column_identifier=>'AP'
,p_column_label=>'Segundo Apellidos'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70521471825301911)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>100
,p_column_identifier=>'AQ'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70521567551301912)
,p_db_column_name=>'CDGO_TPO_RSPNSBLE'
,p_display_order=>110
,p_column_identifier=>'AR'
,p_column_label=>'Tipo de <br>Responsable'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(70591738739699933)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70521608159301913)
,p_db_column_name=>'PRCNTJE_PRTCPCION'
,p_display_order=>120
,p_column_identifier=>'AS'
,p_column_label=>'Prcntje Prtcpcion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70521779445301914)
,p_db_column_name=>'ORGEN_DCMNTO'
,p_display_order=>130
,p_column_identifier=>'AT'
,p_column_label=>'Orgen Dcmnto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
end;
/
begin
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70521839944301915)
,p_db_column_name=>'ID_PAIS_NTFCCION'
,p_display_order=>140
,p_column_identifier=>'AU'
,p_column_label=>'Id Pais Ntfccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70521902687301916)
,p_db_column_name=>'ID_DPRTMNTO_NTFCCION'
,p_display_order=>150
,p_column_identifier=>'AV'
,p_column_label=>'Id Dprtmnto Ntfccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70522021185301917)
,p_db_column_name=>'ID_MNCPIO_NTFCCION'
,p_display_order=>160
,p_column_identifier=>'AW'
,p_column_label=>'Id Mncpio Ntfccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70522194115301918)
,p_db_column_name=>'DRCCION_NTFCCION'
,p_display_order=>170
,p_column_identifier=>'AX'
,p_column_label=>'Drccion Ntfccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70522238700301919)
,p_db_column_name=>'EMAIL'
,p_display_order=>180
,p_column_identifier=>'AY'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70522373635301920)
,p_db_column_name=>'TLFNO'
,p_display_order=>190
,p_column_identifier=>'AZ'
,p_column_label=>'Tlfno'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70522419737301921)
,p_db_column_name=>'CLLAR'
,p_display_order=>200
,p_column_identifier=>'BA'
,p_column_label=>'Cllar'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70522552151301922)
,p_db_column_name=>'ACTVO'
,p_display_order=>210
,p_column_identifier=>'BB'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70522673547301923)
,p_db_column_name=>'ID_TRCRO'
,p_display_order=>220
,p_column_identifier=>'BC'
,p_column_label=>'Id Trcro'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(152487065386080801)
,p_db_column_name=>'ESTDO'
,p_display_order=>230
,p_column_identifier=>'BE'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(89933855557440831)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'700571'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'V_DSCRPCION_IDNTFCCION_R_R_R_R:DRCCION_R_R_R::ID_SJTO_IMPSTO:CDGO_IDNTFCCION_TPO:IDNTFCCION:PRMER_NMBRE:SGNDO_NMBRE:PRMER_APLLDO:SGNDO_APLLDO:PRNCPAL_S_N:CDGO_TPO_RSPNSBLE:PRCNTJE_PRTCPCION:ORGEN_DCMNTO:ID_PAIS_NTFCCION:ID_DPRTMNTO_NTFCCION:ID_MNCPIO'
||'_NTFCCION:DRCCION_NTFCCION:EMAIL:TLFNO:CLLAR:ACTVO:ID_TRCRO:SEQ_ID:ESTDO'
,p_sort_column_1=>'IDNTFCCION_R'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103965118790556632)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(153179878026850105)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'Funcionalidad que permite: <br><br>',
'<i>',
'',
unistr('Registrar y modificar Sujeto Impuesto tipo persona \00F3 establecimiento. <br><br>'),
'Registrar y modificar responsables si la naturaleza es Juridica. <br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario. <br><br>'),
'',
'',
'',
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70058247595857681)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(103965118790556632)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=68000:26:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70058606046857681)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(103965118790556632)
,p_button_name=>'BTN_AGRGAR_RSPNSBLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Agregar Responsable'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:RP,35::'
,p_icon_css_classes=>'fa-user-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8785004883572701)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(103965118790556632)
,p_button_name=>'BTN_AGRGAR_SCRSLES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar Sucursal'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:RP,55::'
,p_icon_css_classes=>'fa-network-hub'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70033290809775402)
,p_name=>'P34_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_source=>'P28_ID_SJTO_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70040415239857620)
,p_name=>'P34_TPO_PRSNA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_item_default=>'N'
,p_prompt=>'Tipo de persona'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Natural;N,Juridica;J'
,p_cHeight=>1
,p_read_only_when=>'P34_SJTO_IMPSTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70040896883857626)
,p_name=>'P34_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a',
'order by a.dscrpcion_idntfccion_tpo; '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70041237877857627)
,p_name=>'P34_IDNTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P34_SJTO_IMPSTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70041602221857630)
,p_name=>'P34_NMBRE_RZON_SCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>unistr('Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70042012337857630)
,p_name=>'P34_PRMER_NMBRE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70042479781857630)
,p_name=>'P34_SGNDO_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70042899139857631)
,p_name=>'P34_PRMER_APLLDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70043290991857631)
,p_name=>'P34_SGNDO_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70044045161857631)
,p_name=>'P34_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>unistr('Departamento de Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'from df_s_departamentos a;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70044439381857632)
,p_name=>'P34_ID_MNCPIO_NTFCCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>unistr('Municipio de Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P34_ID_DPRTMNTO_NTFCCION;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P34_ID_DPRTMNTO_NTFCCION'
,p_ajax_items_to_submit=>'P34_ID_MNCPIO_NTFCCION'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70044824696857632)
,p_name=>'P34_DRCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70045206597857632)
,p_name=>'P34_TLFNO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70045664807857632)
,p_name=>'P34_EMAIL'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70046077544857632)
,p_name=>'P34_ID_SJTO_TPO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Tipo Regimen'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select a.nmbre_sjto_tpo    as d',
'        , a.id_sjto_tpo       as r',
'     from df_i_sujetos_tipo    a',
'    where a.cdgo_clnte         = :F_CDGO_CLNTE',
'     --and a.id_impsto          = :P28_ID_IMPSTO ',
'     and a.id_impsto         = :P34_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70046456820857633)
,p_name=>'P34_ID_ACTVDAD_ECNMCA'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>unistr('Actividad Econ\00F3mica Principal')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.cdgo_dclrcns_esqma_trfa || '' - '' || a.dscrpcion as d',
'       , a.id_dclrcns_esqma_trfa     id_actvdad_ecnmca',
'from    gi_d_dclrcns_esqma_trfa     a',
'join    gi_d_dclrcns_esqma_trfa_tpo b   on  b.id_dclrcns_esqma_trfa_tpo =   a.id_dclrcns_esqma_trfa_tpo',
'where   b.cdgo_clnte                =   :F_CDGO_CLNTE',
'        and cdgo_dclrcns_esqma_trfa_tpo in (''1'',''2'',''3'',''4'', ''7'') ',
'        and sysdate between fcha_dsde and fcha_hsta',
'order by    a.dscrpcion',
'',
'',
'/*SELECT a.cdgo_dclrcns_esqma_trfa || '' - '' || a.dscrpcion AS actvdad_ecnmca,',
'       a.id_dclrcns_esqma_trfa AS id_actvdad_ecnmca',
'  FROM gi_d_dclrcns_esqma_trfa a',
'  JOIN gi_d_dclrcns_esqma_trfa_tpo b',
'    ON b.id_dclrcns_esqma_trfa_tpo = a.id_dclrcns_esqma_trfa_tpo',
' WHERE b.cdgo_clnte = :F_CDGO_CLNTE',
'   AND b.cdgo_dclrcns_esqma_trfa_tpo IN (''1'', ''2'', ''3'', ''4'')',
'   AND sysdate BETWEEN a.fcha_dsde AND a.fcha_hsta',
' ORDER BY actvdad_ecnmca*/',
'',
'',
'',
'/*select dscrpcion as d,',
'       id_actvdad_ecnmca as r',
'from gi_d_actividades_economica;*/'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70046846405857633)
,p_name=>'P34_NMRO_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Camara de Comercio'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70047262030857633)
,p_name=>'P34_FCHA_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Fecha Camara Comercio'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70047630106857633)
,p_name=>'P34_FCHA_INCIO_ACTVDDES'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Fecha inicio Actividades'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70048082590857633)
,p_name=>'P34_NMRO_SCRSLES'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'N.  Sucursales'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70048417132857634)
,p_name=>'P34_DRCCION_CMRA_CMRCIO'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>unistr('Direcci\00F3n Camara Comercio')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70059678085857683)
,p_name=>'P34_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84333783033015517)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70060084791857683)
,p_name=>'P34_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84333783033015517)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70060491036857683)
,p_name=>'P34_SEQ_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84333783033015517)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70060804482857684)
,p_name=>'P34_PGNA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84333783033015517)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70061291028857684)
,p_name=>'P34_APPLCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84333783033015517)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70061656008857684)
,p_name=>'P34_TPO_PRSNA_OCULTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84333783033015517)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70062017782857685)
,p_name=>'P34_REQUEST'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(84333783033015517)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70062486864857686)
,p_name=>'P34_ID_SJTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(84333783033015517)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70062820997857686)
,p_name=>'P34_ID_SJTO_RSPNSBLE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(84333783033015517)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70063264776857686)
,p_name=>'P34_SJTO_RSPNSBLE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(84333783033015517)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70102647586135802)
,p_name=>'P34_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70791563746779901)
,p_name=>'P34_ID_DPRTMNTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPARTAMENTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70791699873779902)
,p_name=>'P34_ID_MNCPIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P34_ID_DPRTMNTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P34_ID_DPRTMNTO'
,p_ajax_items_to_submit=>'P34_ID_DPRTMNTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70791815532779904)
,p_name=>'P34_DRCCION_NTFCCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_prompt=>unistr('Direcci\00F3n de Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(151913454320467801)
,p_name=>'P34_CDGO_NVDAD_TPO'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152379825130904202)
,p_name=>'P34_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(84335518548015534)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70063747950857693)
,p_validation_name=>unistr('Valida Campo tipo identificaci\00F3n')
,p_validation_sequence=>10
,p_validation=>'P34_CDGO_IDNTFCCION_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_associated_item=>wwv_flow_api.id(70040896883857626)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70064087330857693)
,p_validation_name=>unistr('Valida campo identificaci\00F3n')
,p_validation_sequence=>20
,p_validation=>'P34_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_associated_item=>wwv_flow_api.id(70041237877857627)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70064403347857693)
,p_validation_name=>unistr('Valida raz\00F3n social')
,p_validation_sequence=>30
,p_validation=>'P34_NMBRE_RZON_SCIAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P34_TPO_PRSNA_OCULTO'
,p_validation_condition2=>'J'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(70041602221857630)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70064840442857694)
,p_validation_name=>'Valida primer nombre'
,p_validation_sequence=>40
,p_validation=>'P34_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P34_TPO_PRSNA'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(70042012337857630)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70065232438857694)
,p_validation_name=>'Valida campo primer apellido'
,p_validation_sequence=>50
,p_validation=>'P34_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P34_TPO_PRSNA'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(70042899139857631)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70066040608857694)
,p_validation_name=>'Valida campo departamento'
,p_validation_sequence=>70
,p_validation=>'P34_ID_DPRTMNTO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_associated_item=>wwv_flow_api.id(70044045161857631)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70066439683857694)
,p_validation_name=>'Valida campo municipio'
,p_validation_sequence=>80
,p_validation=>'P34_ID_MNCPIO_NTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_associated_item=>wwv_flow_api.id(70044439381857632)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70066832758857694)
,p_validation_name=>unistr('Valida campo direcci\00F3n')
,p_validation_sequence=>90
,p_validation=>'P34_DRCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_associated_item=>wwv_flow_api.id(70044824696857632)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70067294540857695)
,p_validation_name=>'Valida campo tipo regimen'
,p_validation_sequence=>100
,p_validation=>'P34_ID_SJTO_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(70046077544857632)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70067642582857695)
,p_validation_name=>'Valida campo numero registro'
,p_validation_sequence=>110
,p_validation=>'P34_NMRO_RGSTRO_CMRA_CMRCIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(70046846405857633)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70068035971857695)
,p_validation_name=>unistr('Valida campo fecha c\00E1mara comercio ')
,p_validation_sequence=>120
,p_validation=>'P34_FCHA_RGSTRO_CMRA_CMRCIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(70047262030857633)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70068451530857695)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>270
,p_validation=>'regexp_like (:P34_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(70045664807857632)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15614305012899301)
,p_validation_name=>'Valida responsables'
,p_validation_sequence=>280
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'      and n001                = :F_ID_INSTNCIA_FLJO;'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Por favor ingrese un responsable'
,p_validation_condition=>'P34_TPO_PRSNA'
,p_validation_condition2=>'J'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70071126579857698)
,p_name=>unistr('Al cambiar la identificaci\00F3n')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34_IDNTFCCION_R'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70071698851857699)
,p_event_id=>wwv_flow_api.id(70071126579857698)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70072008936857699)
,p_name=>'Al cambiar'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34_TPO_PRSNA'
,p_condition_element=>'P34_TPO_PRSNA'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'J'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70073579529857703)
,p_event_id=>wwv_flow_api.id(70072008936857699)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34_ID_SJTO_TPO,P34_NMBRE_RZON_SCIAL,P34_NMRO_RGSTRO_CMRA_CMRCIO,P34_FCHA_RGSTRO_CMRA_CMRCIO,P34_FCHA_INCIO_ACTVDDES,P34_NMRO_SCRSLES,P34_DRCCION_CMRA_CMRCIO,P34_ID_ACTVDAD_ECNMCA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70074006293857704)
,p_event_id=>wwv_flow_api.id(70072008936857699)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34_NMBRE_RZON_SCIAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70074503489857704)
,p_event_id=>wwv_flow_api.id(70072008936857699)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34_PRMER_NMBRE,P34_SGNDO_NMBRE,P34_PRMER_APLLDO,P34_SGNDO_APLLDO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70075032488857704)
,p_event_id=>wwv_flow_api.id(70072008936857699)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34_PRMER_NMBRE,P34_SGNDO_NMBRE,P34_PRMER_APLLDO,P34_SGNDO_APLLDO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70075527293857705)
,p_event_id=>wwv_flow_api.id(70072008936857699)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(89682919758408448)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70073000478857703)
,p_event_id=>wwv_flow_api.id(70072008936857699)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(70058606046857681)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70076061631857705)
,p_event_id=>wwv_flow_api.id(70072008936857699)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(89682919758408448)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70072540251857700)
,p_event_id=>wwv_flow_api.id(70072008936857699)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(70058606046857681)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70076436779857705)
,p_name=>unistr('Al Cambiar Fecha registro c\00E1mara de comercio ')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34_FCHA_RGSTRO_CMRA_CMRCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70076989518857721)
,p_event_id=>wwv_flow_api.id(70076436779857705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P34_FCHA_INCIO_ACTVDDES").datepicker( ''option'' , ''minDate'' , $("#P34_FCHA_RGSTRO_CMRA_CMRCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70279364584117604)
,p_name=>unistr('Al cambiar actualizar en la colecci\00F3n el nuevo valor')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34_ID_SJTO_IMPSTO,P34_ID_IMPSTO,P34_TPO_PRSNA,P34_CDGO_IDNTFCCION_TPO,P34_IDNTFCCION,P34_NMBRE_RZON_SCIAL,P34_PRMER_NMBRE,P34_SGNDO_NMBRE,P34_PRMER_APLLDO,P34_SGNDO_APLLDO,P34_ID_DPRTMNTO_NTFCCION,P34_ID_MNCPIO_NTFCCION,P34_DRCCION,P34_TLFNO,P34_EMA'
||'IL,P34_ID_SJTO_TPO,P34_ID_ACTVDAD_ECNMCA,P34_FCHA_INCIO_ACTVDDES,P34_NMRO_RGSTRO_CMRA_CMRCIO,P34_FCHA_RGSTRO_CMRA_CMRCIO,P34_NMRO_SCRSLES,P34_DRCCION_CMRA_CMRCIO,P34_ID_DPRTMNTO,P34_ID_MNCPIO,P34_DRCCION_NTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70292179744463801)
,p_event_id=>wwv_flow_api.id(70279364584117604)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'actualizar_temporal(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70503763618609701)
,p_name=>'Al cambiar calcular el nmbre_rzon_scial'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34_PRMER_NMBRE,P34_SGNDO_NMBRE,P34_PRMER_APLLDO,P34_SGNDO_APLLDO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70503893129609702)
,p_event_id=>wwv_flow_api.id(70503763618609701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    var rzon_scial ;',
'    rzon_scial = $v("P34_PRMER_NMBRE") + " " + $v("P34_SGNDO_NMBRE") + " " + $v("P34_PRMER_APLLDO") + " " + $v("P34_SGNDO_APLLDO");',
'    apex.item("P34_NMBRE_RZON_SCIAL").setValue(rzon_scial);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70678941069912404)
,p_name=>'Inactivar Botones cuando la novedad este registrada'
,p_event_sequence=>90
,p_condition_element=>'P28_ID_NVDAD_PRSNA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70679042778912405)
,p_event_id=>wwv_flow_api.id(70678941069912404)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(70058606046857681)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70818030719843701)
,p_name=>'Al Obtener el Foco Guardar el Valor que tiene en la temporal'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34_ID_SJTO_IMPSTO,P34_ID_IMPSTO,P34_TPO_PRSNA,P34_CDGO_IDNTFCCION_TPO,P34_IDNTFCCION,P34_NMBRE_RZON_SCIAL,P34_PRMER_NMBRE,P34_SGNDO_NMBRE,P34_PRMER_APLLDO,P34_SGNDO_APLLDO,P34_ID_DPRTMNTO_NTFCCION,P34_ID_MNCPIO_NTFCCION,P34_DRCCION,P34_TLFNO,P34_EMA'
||'IL,P34_ID_SJTO_TPO,P34_ID_ACTVDAD_ECNMCA,P34_FCHA_INCIO_ACTVDDES,P34_NMRO_RGSTRO_CMRA_CMRCIO,P34_FCHA_RGSTRO_CMRA_CMRCIO,P34_NMRO_SCRSLES,P34_DRCCION_CMRA_CMRCIO,P34_ID_DPRTMNTO,P34_ID_MNCPIO,P34_DRCCION_NTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusin'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70818123695843702)
,p_event_id=>wwv_flow_api.id(70818030719843701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'actualizar_valor_ant(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9013380478467903)
,p_name=>'Cerrar Modal Sucursal -  Boton BTN_AGRGAR_SCRSLES'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8785004883572701)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9013475761467904)
,p_event_id=>wwv_flow_api.id(9013380478467903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(8818621331671801)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153038799317739301)
,p_name=>'Al cerrar modal de Responsables - Boton  BTN_AGRGAR_RSPNSBLE'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(70058606046857681)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153045684017781303)
,p_event_id=>wwv_flow_api.id(153038799317739301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(89682919758408448)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153038800287739302)
,p_event_id=>wwv_flow_api.id(153038799317739301)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(89682919758408448)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153045473825781301)
,p_name=>'Al cargar - ocultar responsables'
,p_event_sequence=>130
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NOT_EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from apex_collections    a',
'    where collection_name     = ''RESPONSABLES''',
'      and n001                = :F_ID_INSTNCIA_FLJO;'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153045516128781302)
,p_event_id=>wwv_flow_api.id(153045473825781301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(89682919758408448)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153045723542781304)
,p_name=>'Al cerrar modal de Responsables - Region  Responsable'
,p_event_sequence=>150
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(89682919758408448)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153045894040781305)
,p_event_id=>wwv_flow_api.id(153045723542781304)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(89682919758408448)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153059620625864001)
,p_name=>'Al cerrar modal de Sucursales - Boton  BTN_AGRGAR_SCRSLES'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8785004883572701)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153059764336864002)
,p_event_id=>wwv_flow_api.id(153059620625864001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(8818621331671801)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153059875238864003)
,p_event_id=>wwv_flow_api.id(153059620625864001)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(8818621331671801)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153059953854864004)
,p_name=>'Al cerrar modal de Sucursales - Region Sucursales'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(8818621331671801)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153060032602864005)
,p_event_id=>wwv_flow_api.id(153059953854864004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(8818621331671801)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(153069576708941101)
,p_name=>'Al cargar - Ocultar Sucursales'
,p_event_sequence=>180
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NOT_EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from apex_collections    a',
'    where collection_name     = ''SUCURSALES''',
'      and n001                = :F_ID_INSTNCIA_FLJO;'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(153069656004941102)
,p_event_id=>wwv_flow_api.id(153069576708941101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(8818621331671801)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70427527170009501)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Pagina'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from gn_g_temporal      a',
'where --a.id_ssion         = :APP_SESSION and ',
'    a.n001             =  :F_ID_INSTNCIA_FLJO;'))
,p_process_when_type=>'NOT_EXISTS'
,p_process_comment=>'Borro cache'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152004054157716903)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar parametros del flujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_instncia_trnscion    number := 0; ',
'    v_cdgo_nvdad_tpo          si_d_novedades_tipo.cdgo_nvdad_tpo%type;',
'    v_idntfccion              varchar(25);',
'    v_id_sjto_impsto          number := 0; ',
'    v_id_impsto               number := 0; ',
'    v_id_impsto_sbmpsto       number := 0; ',
'begin',
'',
'        --insert into muerto (v_001, v_002, t_001) values (''PARAMETROS'',:F_ID_INSTNCIA_FLJO||''-''|| :F_ID_FLJO_TREA,SYSDATE); commit;',
'        select id_instncia_trnscion',
'        into v_id_instncia_trnscion',
'        from wf_g_instancias_transicion',
'        where  id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'        and id_fljo_trea_orgen = :F_ID_FLJO_TREA;',
'',
'       --insert into muerto  (v_001, v_002, t_001)  values (''PARAMETROS'',''v_id_instncia_trnscion : '' || v_id_instncia_trnscion,SYSDATE); commit;',
' ',
'        select vlor',
'        into v_cdgo_nvdad_tpo ',
'        from wf_g_instancias_item_valor',
'        where  id_instncia_trnscion = v_id_instncia_trnscion',
'        and nmbre_item =  ''P34_CDGO_NVDAD_TPO''; ',
' ',
'        :P34_CDGO_NVDAD_TPO := v_cdgo_nvdad_tpo ;',
'        :P28_CDGO_NVDAD_TPO := v_cdgo_nvdad_tpo ;  ',
'        --insert into muerto  (v_001, v_002, t_001)  values (''PARAMETROS'',''P34_CDGO_NVDAD_TPO : '' || :P34_CDGO_NVDAD_TPO,SYSDATE); commit;',
'',
'        select vlor',
'        into v_idntfccion',
'        from wf_g_instancias_item_valor',
'        where  id_instncia_trnscion = v_id_instncia_trnscion',
'        and nmbre_item =  ''P34_IDNTFCCION'';',
'',
'        :P34_IDNTFCCION := v_idntfccion;',
'        :P28_IDNTFCCION := v_idntfccion; ',
'        ',
'       -- insert into muerto  (v_001, v_002, t_001)  values (''PARAMETROS'','':P34_IDNTFCCION  :'' || :P34_IDNTFCCION,SYSDATE); commit;',
'        select vlor',
'        into v_id_sjto_impsto ',
'        from wf_g_instancias_item_valor',
'        where  id_instncia_trnscion = v_id_instncia_trnscion',
'        and nmbre_item =  ''P34_ID_SJTO_IMPSTO'';',
'',
'        :P34_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'        :P28_ID_SJTO_IMPSTO := v_id_sjto_impsto; ',
'',
'       -- insert into muerto  (v_001, v_002, t_001)  values (''PARAMETROS'','':P34_IDNTFCCION  :'' || :P34_IDNTFCCION,SYSDATE); commit;',
'        select vlor',
'        into v_id_impsto ',
'        from wf_g_instancias_item_valor',
'        where  id_instncia_trnscion = v_id_instncia_trnscion',
'        and nmbre_item =  ''P34_ID_IMPSTO'';',
'',
'        :P34_ID_IMPSTO := v_id_impsto; ',
'        :P28_ID_IMPSTO := v_id_impsto; ',
'',
'        select vlor',
'        into v_id_impsto_sbmpsto ',
'        from wf_g_instancias_item_valor',
'        where  id_instncia_trnscion = v_id_instncia_trnscion',
'        and nmbre_item =  ''P34_ID_IMPSTO_SBMPSTO'';',
'',
'        :P34_ID_IMPSTO_SBMPSTO := v_id_impsto_sbmpsto; ',
'        :P28_ID_IMPSTO_SBMPSTO := v_id_impsto_sbmpsto; ',
'',
'   end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70069956255857697)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Sujeto, Sujeto Impuesto y Persona'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'',
' if :P34_TPO_PRSNA is null then ',
'select a.id_sjto',
'        , b.id_sjto_impsto',
'		, b.id_impsto',
'		, c.tpo_prsna',
'		, c.cdgo_idntfccion_tpo',
'		, a.idntfccion',
'		, d.id_sjto_rspnsble',
'		, d.prmer_nmbre',
'		, d.sgndo_nmbre',
'		, d.prmer_aplldo',
'		, d.sgndo_aplldo',
'		, c.nmbre_rzon_scial',
'		, a.id_dprtmnto',
'		, a.id_mncpio',
'		, a.drccion',
'		, b.id_dprtmnto_ntfccion',
'		, b.id_mncpio_ntfccion',
'		, b.drccion_ntfccion',
'		, b.tlfno',
'		, b.email',
'		, c.id_sjto_tpo',
'		, c.nmro_rgstro_cmra_cmrcio',
'		, to_char(c.fcha_rgstro_cmra_cmrcio, ''dd/mm/yyyy'')',
'		, to_char(c.fcha_incio_actvddes, ''dd/mm/yyyy'')',
'		, c.nmro_scrsles',
'		, c.drccion_cmra_cmrcio',
'		, c.id_actvdad_ecnmca ',
'     into :P34_ID_SJTO',
'        , :P34_ID_SJTO_IMPSTO',
'		, :P34_ID_IMPSTO',
'        , :P34_TPO_PRSNA',
'		, :P34_CDGO_IDNTFCCION_TPO',
'		, :P34_IDNTFCCION',
'		, :P34_ID_SJTO_RSPNSBLE',
'		, :P34_PRMER_NMBRE',
'		, :P34_SGNDO_NMBRE',
'		, :P34_PRMER_APLLDO',
'		, :P34_SGNDO_APLLDO',
'        , :P34_NMBRE_RZON_SCIAL',
'        , :P34_ID_DPRTMNTO',
'        , :P34_ID_MNCPIO',
'		, :P34_DRCCION',
'        , :P34_ID_DPRTMNTO_NTFCCION',
'        , :P34_ID_MNCPIO_NTFCCION',
'		, :P34_DRCCION_NTFCCION',
'		, :P34_TLFNO',
'		, :P34_EMAIL',
'		, :P34_ID_SJTO_TPO',
'        , :P34_NMRO_RGSTRO_CMRA_CMRCIO',
'        , :P34_FCHA_RGSTRO_CMRA_CMRCIO',
'        , :P34_FCHA_INCIO_ACTVDDES',
'        , :P34_NMRO_SCRSLES',
'        , :P34_DRCCION_CMRA_CMRCIO',
'        , :P34_ID_ACTVDAD_ECNMCA ',
'	 from si_c_sujetos				    a',
'	 join si_i_sujetos_impuesto		    b on a.id_sjto			= b.id_sjto',
'	 join si_i_personas				    c on b.id_sjto_impsto 	= c.id_sjto_impsto',
'	 left join si_i_sujetos_responsable d on b.id_sjto_impsto 	= d.id_sjto_impsto',
'      and c.tpo_prsna                   = ''N'' ',
'      and d.prncpal_s_n                 = ''S''',
'	where b.id_sjto_impsto 			    = nvl(:P28_ID_SJTO_IMPSTO, :P34_ID_SJTO_IMPSTO);',
'    ',
' end if;',
'',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'	 from si_c_sujetos				    a',
'	 join si_i_sujetos_impuesto		    b on a.id_sjto			= b.id_sjto',
'	 join si_i_personas				    c on b.id_sjto_impsto 	= c.id_sjto_impsto',
'	 left join si_i_sujetos_responsable d on b.id_sjto_impsto 	= d.id_sjto_impsto',
'      and c.tpo_prsna                   = ''N'' ',
'      and d.prncpal_s_n                 = ''S''',
'	where b.id_sjto_impsto 			    = nvl(:P28_ID_SJTO_IMPSTO, :P34_ID_SJTO_IMPSTO); '))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70523148432301928)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n de Responsables')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_total number;',
'begin',
'    ',
'    if (not apex_collection.collection_exists(p_collection_name => ''RESPONSABLES'') ) then',
'        apex_collection.create_collection( p_collection_name => ''RESPONSABLES'');',
'    end if;',
'',
'   for c_rspnsble in (select * ',
'                     from si_i_sujetos_responsable a',
'                    where id_sjto_impsto    = nvl(:P34_ID_SJTO_IMPSTO, :P28_ID_SJTO_IMPSTO) ) loop',
'',
'            select count(*)',
'            into v_total',
'            from gn_g_temporal',
'            where n001 =  :F_ID_INSTNCIA_FLJO',
'              and c023 = ''RESPONSABLE_NOVEDADES_PERSONA''',
'              and c004 = c_rspnsble.idntfccion;',
'              ',
'           if  v_total = 0 then ',
'           ',
'                insert into gn_g_temporal   (id_ssion								,n001								,c001										,c002				',
'                                            ,c003									,c004								,c005										,c006				',
'                                            ,c007									,c008								,c009										,c010				',
'                                            ,c011									,c012								,c013										,c014				',
'                                            ,c015									,c016								,c017										,c018				',
'                                            ,c019									,c020								,c021										,c022',
'                                            ,c023)								',
'                                    values (:F_ID_INSTNCIA_FLJO						,:F_ID_INSTNCIA_FLJO				,c_rspnsble.ID_SJTO_RSPNSBLE				,c_rspnsble.ID_SJTO_IMPSTO',
'                                            ,c_rspnsble.CDGO_IDNTFCCION_TPO			,c_rspnsble.IDNTFCCION				,c_rspnsble.PRMER_NMBRE						,c_rspnsble.SGNDO_NMBRE',
'                                            ,c_rspnsble.PRMER_APLLDO				,c_rspnsble.SGNDO_APLLDO			,c_rspnsble.PRNCPAL_S_N						,c_rspnsble.CDGO_TPO_RSPNSBLE',
'                                            ,c_rspnsble.PRCNTJE_PRTCPCION			,c_rspnsble.ORGEN_DCMNTO			,c_rspnsble.ID_PAIS_NTFCCION				,c_rspnsble.ID_DPRTMNTO_NTFCCION',
'                                            ,c_rspnsble.ID_MNCPIO_NTFCCION			,c_rspnsble.DRCCION_NTFCCION		,c_rspnsble.EMAIL							,c_rspnsble.TLFNO',
'                                            ,c_rspnsble.CLLAR						,c_rspnsble.ACTVO					,c_rspnsble.ID_TRCRO						,''EXISTENTE'',',
'                                             ''RESPONSABLE_NOVEDADES_PERSONA'' );',
'',
'                 for c_rspnsble_r in (select * ',
'                                     from gn_g_temporal a',
'                                     where n001 =  :F_ID_INSTNCIA_FLJO',
'                                          and c023 = ''RESPONSABLE_NOVEDADES_PERSONA'' ',
'                                          and c004  not in (select c004 ',
'                                                            from apex_collections    m',
'                                                           where collection_name     = ''RESPONSABLES'' ',
'                                                             and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop',
'',
'                               apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES'' ',
'                                                           , p_n001             => :F_ID_INSTNCIA_FLJO',
'                                                           , p_c001				=> c_rspnsble_r.c001',
'                                                           , p_c002				=> c_rspnsble_r.c002',
'                                                           , p_c003				=> c_rspnsble_r.c003',
'                                                           , p_c004				=> c_rspnsble_r.c004',
'                                                           , p_c005				=> c_rspnsble_r.c005',
'                                                           , p_c006				=> c_rspnsble_r.c006',
'                                                           , p_c007				=> c_rspnsble_r.c007',
'                                                           , p_c008				=> c_rspnsble_r.c008',
'                                                           , p_c009				=> c_rspnsble_r.c009',
'                                                           , p_c010				=> c_rspnsble_r.c010',
'                                                           , p_c011				=> c_rspnsble_r.c011',
'                                                           , p_c012				=> c_rspnsble_r.c012',
'                                                           , p_c013				=> c_rspnsble_r.c013',
'                                                           , p_c014				=> c_rspnsble_r.c014',
'                                                           , p_c015				=> c_rspnsble_r.c015',
'                                                           , p_c016				=> c_rspnsble_r.c016',
'                                                           , p_c017				=> c_rspnsble_r.c017',
'                                                           , p_c018				=> c_rspnsble_r.c018',
'                                                           , p_c019				=> c_rspnsble_r.c019',
'                                                           , p_c020				=> c_rspnsble_r.c020',
'                                                           , p_c021				=> c_rspnsble_r.c021',
'                                                           , p_c022				=> ''EXISTENTE'');',
'                end loop;',
'',
'        end if;',
'    end loop;',
'    ',
'    ',
'    select count(*)',
'    into v_total',
'    from gn_g_temporal',
'    where n001 =  :F_ID_INSTNCIA_FLJO',
'      and c023 = ''RESPONSABLE_NOVEDADES_PERSONA'';',
'',
'    if v_total > 0 then',
'',
'      for c_rspnsble in (select * ',
'                         from gn_g_temporal a',
'                         where n001 =  :F_ID_INSTNCIA_FLJO',
'                              and c023 = ''RESPONSABLE_NOVEDADES_PERSONA'' ',
'                              and c004  not in (select c004 ',
'                                                from apex_collections    m',
'                                               where collection_name     = ''RESPONSABLES'' ',
'                                                 and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop',
'',
'          apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES''',
'                                   , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                   , p_c001				=> c_rspnsble.c001',
'                                   , p_c002				=> c_rspnsble.c002',
'                                   , p_c003				=> c_rspnsble.c003',
'                                   , p_c004				=> c_rspnsble.c004',
'                                   , p_c005				=> c_rspnsble.c005',
'                                   , p_c006				=> c_rspnsble.c006',
'                                   , p_c007				=> c_rspnsble.c007',
'                                   , p_c008				=> c_rspnsble.c008',
'                                   , p_c009				=> c_rspnsble.c009',
'                                   , p_c010				=> c_rspnsble.c010',
'                                   , p_c011				=> c_rspnsble.c011',
'                                   , p_c012				=> c_rspnsble.c012',
'                                   , p_c013				=> c_rspnsble.c013',
'                                   , p_c014				=> c_rspnsble.c014',
'                                   , p_c015				=> c_rspnsble.c015',
'                                   , p_c016				=> c_rspnsble.c016',
'                                   , p_c017				=> c_rspnsble.c017',
'                                   , p_c018				=> c_rspnsble.c018',
'                                   , p_c019				=> c_rspnsble.c019',
'                                   , p_c020				=> c_rspnsble.c020',
'                                   , p_c021				=> c_rspnsble.c021 ',
'                                   , p_c022				=> c_rspnsble.c022);',
'      end loop;',
'    end if;',
'  ',
'  /*',
'    for c_rspnsble in (select * ',
'                         from si_i_sujetos_responsable a',
'                        where id_sjto_impsto    = nvl(:P34_ID_SJTO_IMPSTO, :P28_ID_SJTO_IMPSTO)',
'                          and idntfccion        not in (select c004 ',
'                                                          from apex_collections    m',
'                                                         where collection_name     = ''RESPONSABLES'' ',
'                                                           and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop',
'                        ',
'        apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES''',
'                                 , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                 , p_c001				=> c_rspnsble.ID_SJTO_RSPNSBLE',
'                                 , p_c002				=> c_rspnsble.ID_SJTO_IMPSTO',
'                                 , p_c003				=> c_rspnsble.CDGO_IDNTFCCION_TPO',
'                                 , p_c004				=> c_rspnsble.IDNTFCCION',
'                                 , p_c005				=> c_rspnsble.PRMER_NMBRE',
'                                 , p_c006				=> c_rspnsble.SGNDO_NMBRE',
'                                 , p_c007				=> c_rspnsble.PRMER_APLLDO',
'                                 , p_c008				=> c_rspnsble.SGNDO_APLLDO',
'                                 , p_c009				=> c_rspnsble.PRNCPAL_S_N',
'                                 , p_c010				=> c_rspnsble.CDGO_TPO_RSPNSBLE',
'                                 , p_c011				=> c_rspnsble.PRCNTJE_PRTCPCION',
'                                 , p_c012				=> c_rspnsble.ORGEN_DCMNTO',
'                                 , p_c013				=> c_rspnsble.ID_PAIS_NTFCCION',
'                                 , p_c014				=> c_rspnsble.ID_DPRTMNTO_NTFCCION',
'                                 , p_c015				=> c_rspnsble.ID_MNCPIO_NTFCCION',
'                                 , p_c016				=> c_rspnsble.DRCCION_NTFCCION',
'                                 , p_c017				=> c_rspnsble.EMAIL',
'                                 , p_c018				=> c_rspnsble.TLFNO',
'                                 , p_c019				=> c_rspnsble.CLLAR',
'                                 , p_c020				=> c_rspnsble.ACTVO',
'                                 , p_c021				=> c_rspnsble.ID_TRCRO',
'                                 , p_c022				=> ''EXISTENTE'');',
'    end loop;',
'',
'  */',
'end;    '))
,p_process_error_message=>'#SQLERRM# #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8821126172671826)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n de Sucursales')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_total number;',
'begin',
'',
'',
'    if (not apex_collection.collection_exists(p_collection_name => ''SUCURSALES'') ) then',
'        apex_collection.create_collection( p_collection_name => ''SUCURSALES'');',
'    end if;',
'',
'     for c_scrsal in (select * ',
'                         from si_i_sujetos_sucursal a',
'                        where id_sjto_impsto    = nvl(:P34_ID_SJTO_IMPSTO, :P28_ID_SJTO_IMPSTO) ) loop ',
'',
'        select count(*)',
'        into v_total',
'        from gn_g_temporal',
'        where n001 =  :F_ID_INSTNCIA_FLJO',
'          and c023 = ''SUCURSAL_NOVEDADES_PERSONA''',
'          and c004 = c_scrsal.CDGO_SCRSAL;',
'       ',
'       if v_total = 0 then',
'',
'            insert into gn_g_temporal   (id_ssion								,n001								,c001										,c002				',
'                                        ,c004								    ,c005										,c006				',
'                                        ,c007									,c008								,c009										,c010				',
'                                        ,c011									,c012								,c023)								',
'                                values (:F_ID_INSTNCIA_FLJO						,:F_ID_INSTNCIA_FLJO				,c_scrsal.ID_SJTO_IMPSTO				    ,c_scrsal.NMBRE',
'                                        ,c_scrsal.CDGO_SCRSAL				    ,c_scrsal.ID_DPRTMNTO_NTFCCION				,c_scrsal.ID_MNCPIO_NTFCCION',
'                                        ,c_scrsal.DRCCION				        ,c_scrsal.EMAIL						,c_scrsal.TLFNO								,c_scrsal.CLLAR',
'                                        ,c_scrsal.ACTVO							,''EXISTENTE''						,''SUCURSAL_NOVEDADES_PERSONA'');',
'',
'             for c_scrsal_s in (select * ',
'                                     from si_i_sujetos_sucursal a',
'                                    where id_sjto_impsto    = nvl(:P34_ID_SJTO_IMPSTO, :P28_ID_SJTO_IMPSTO)',
'                                      and cdgo_scrsal        not in (select c004 ',
'                                                                      from apex_collections    m',
'                                                                     where collection_name     = ''SUCURSALES'' ',
'                                                                       and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop ',
'',
'                       apex_collection.add_member(p_collection_name 	=> ''SUCURSALES''',
'                                                 , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                                 , p_c001				=> c_scrsal_s.ID_SJTO_IMPSTO',
'                                                 , p_c002				=> c_scrsal_s.NMBRE ',
'                                                 , p_c004				=> c_scrsal_s.CDGO_SCRSAL',
'                                                 , p_c005				=> c_scrsal_s.ID_DPRTMNTO_NTFCCION',
'                                                 , p_c006				=> c_scrsal_s.ID_MNCPIO_NTFCCION',
'                                                 , p_c007				=> c_scrsal_s.DRCCION',
'                                                 , p_c008				=> c_scrsal_s.EMAIL',
'                                                 , p_c009				=> c_scrsal_s.TLFNO',
'                                                 , p_c010				=> c_scrsal_s.CLLAR',
'                                                 , p_c011				=> c_scrsal_s.ACTVO',
'                                                 , p_c012				=>''EXISTENTE''	); ',
'                end loop;',
' ',
'       end if;',
'        ',
'    end loop;',
'    ',
'    ',
'    ',
'    select count(*)',
'    into v_total',
'    from gn_g_temporal',
'    where n001 =  :F_ID_INSTNCIA_FLJO',
'      and c023 = ''SUCURSAL_NOVEDADES_PERSONA'';',
'',
'',
'    if v_total > 0 then',
'',
'      for c_scrsal in (select * ',
'                         from gn_g_temporal a',
'                         where n001 =  :F_ID_INSTNCIA_FLJO',
'                              and c023 = ''SUCURSAL_NOVEDADES_PERSONA''',
'                              and c004  not in (select c004 ',
'                                                from apex_collections    m',
'                                               where collection_name     = ''SUCURSALES'' ',
'                                                 and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop',
'',
'          apex_collection.add_member(p_collection_name 	=> ''SUCURSALES''',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> c_scrsal.c001',
'									 , p_c002				=> c_scrsal.c002',
'								--	 , p_c003				=> c_scrsal.PRNCPAL_S_N',
'									 , p_c004				=> c_scrsal.c004',
'									 , p_c005				=> c_scrsal.c005',
'									 , p_c006				=> c_scrsal.c006',
'									 , p_c007				=> c_scrsal.c007',
'									 , p_c008				=> c_scrsal.c008',
'									 , p_c009				=> c_scrsal.c009',
'									 , p_c010				=> c_scrsal.c010',
'									 , p_c011				=> c_scrsal.c011	  ',
'                                     , p_c012				=> c_scrsal.c012);	 ',
'                                     ',
'      end loop;',
'    end if;',
'',
'/*',
'    ',
'    for c_scrsal in (select * ',
'                         from si_i_sujetos_sucursal a',
'                        where id_sjto_impsto    = nvl(:P34_ID_SJTO_IMPSTO, :P28_ID_SJTO_IMPSTO)',
'                          and cdgo_scrsal        not in (select c004 ',
'                                                          from apex_collections    m',
'                                                         where collection_name     = ''SUCURSALES'' ',
'                                                           and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop ',
'                        ',
'           apex_collection.add_member(p_collection_name 	=> ''SUCURSALES''',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> c_scrsal.ID_SJTO_IMPSTO',
'									 , p_c002				=> c_scrsal.NMBRE',
'									 --, p_c003				=> c_scrsal.PRNCPAL_S_N',
'									 , p_c004				=> c_scrsal.CDGO_SCRSAL',
'									 , p_c005				=> c_scrsal.ID_DPRTMNTO_NTFCCION',
'									 , p_c006				=> c_scrsal.ID_MNCPIO_NTFCCION',
'									 , p_c007				=> c_scrsal.DRCCION',
'									 , p_c008				=> c_scrsal.EMAIL',
'									 , p_c009				=> c_scrsal.TLFNO',
'									 , p_c010				=> c_scrsal.CLLAR',
'									 , p_c011				=> c_scrsal.ACTVO ); ',
'    end loop;*/',
'end;    '))
,p_process_error_message=>'#SQLERRM# #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70279043224117601)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Llenar temporal con los datos del sujeto impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral    number;',
'    v_error        varchar2(1000);',
'begin',
'   ',
'   begin',
'       select nvl(count(1),0)',
'         into v_id_tmpral',
'         from gn_g_temporal      a',
'        where --a.id_ssion         = :APP_SESSION and ',
'              a.n001             = :F_ID_INSTNCIA_FLJO',
'          and a.c005             = ''SUJETO'';',
'    exception ',
'        when others then ',
'            v_id_tmpral    := null;',
'    end;',
'    ',
'    /*',
'    c001    => nombre del item.       Eje: P34_TPO_PRSNA',
'    c002    => Valor anterior.        Eje: N',
'    c003    => Nuevo valor.           Eje: J',
'    c004    => Label del item.        Eje: Tipo de Persona',
'    c005    => Indica si el item es de cambios realizados al sujeto o al responsable',
'    c006    => Cuando el item es una lista se guarda el texto del valor anterior seleccionado en la lista Eje: Natural',
'    c007    => Cuando el item es una lista se guarda el texto del nuevo valor seleccionado en la lista Eje: Juridica',
'    c008    => Indica si se actualizo el texto del valor anterior',
'    */',
'        ',
'    if v_id_tmpral = 0 then ',
'       for c_items in (select item_name',
'                          , label',
'                          ,apex_util.get_session_state(item_name) session_value',
'                      from apex_application_page_items',
'                     where application_id                 = :APP_ID',
'                       and page_id                        = :APP_PAGE_ID) loop',
'',
'        insert into gn_g_temporal (id_ssion,                n001,                    c001,                c002,                     ',
'                                   c003,                    c004,                    c005,                c006,',
'                                   c007,                    c008)',
'                           values (:APP_SESSION,            :F_ID_INSTNCIA_FLJO,     c_items.item_name,   c_items.session_value,    ',
'                                   c_items.session_value,    c_items.label,          ''SUJETO'',            c_items.session_value,',
'                                   c_items.session_value,    ''N'');',
'        end loop;',
'    end if;',
'    ',
'    ',
'',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -- '' || sqlerrm;',
'        insert into gti_aux (col1, col2) values (''Error'', v_error); commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from gn_g_temporal      a',
'where --a.id_ssion         = :APP_SESSION  and ',
'        a.n001             = :F_ID_INSTNCIA_FLJO;'))
,p_process_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(151893538681015301)
,p_process_sequence=>70
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar datos de actualizacion y/o inscripcion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral    number := 0;  ',
'    v_id_ssion     number;  ',
'    v_json         clob;  ',
'    v_total        number := 0;  ',
' ',
'begin ',
'',
'    --Tener presente que este proceso esta en las paginas 34, 29,30',
'  -- al hacer modificacion, modificarlo en esas paginas',
'/*',
'    select count(1)',
'    into v_total',
'    from gn_g_temporal ',
'    where n001           = :F_ID_INSTNCIA_FLJO     --instancia flujo'',',
'    and   c005           =  ''SUJETO'' ;',
'',
'    if v_total > 0 then',
'  */ ',
'      for c_item in  ( ',
'                    --busco la instancia flujo de esa temporal'',',
'                    select c001, c003 ',
'                    from gn_g_temporal ',
'                    where n001           = :F_ID_INSTNCIA_FLJO     --instancia flujo'',',
'                    and   c005           =  ''SUJETO'' ',
'                ) loop ',
'',
'                --v(c_item.c001):= c_item.c003; '',',
'                --v(''''F_CDGO_CLNTE'''')'',',
'                --v(''''P34_CDGO_IDNTFCCION_TPO'''')'',',
'',
'               -- insert into muerto (v_001, v_002, T_001) values (''''NOVEDADES'''', c_item.c001, sysdate); commit;'',',
'                if c_item.c001 = ''P34_CDGO_IDNTFCCION_TPO''			then :P34_CDGO_IDNTFCCION_TPO		:= c_item.c003; end if ;',
'                if c_item.c001 = ''P34_PRMER_NMBRE''                  then :P34_PRMER_NMBRE               := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_SGNDO_NMBRE''                  then :P34_SGNDO_NMBRE               := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_PRMER_APLLDO''                 then :P34_PRMER_APLLDO              := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_SGNDO_APLLDO''                 then :P34_SGNDO_APLLDO              := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_NMBRE_RZON_SCIAL''             then :P34_NMBRE_RZON_SCIAL          := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_DPRTMNTO''                  then :P34_ID_DPRTMNTO               := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_MNCPIO''                    then :P34_ID_MNCPIO                 := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_DPRTMNTO_NTFCCION''         then :P34_ID_DPRTMNTO_NTFCCION      := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_MNCPIO_NTFCCION''           then :P34_ID_MNCPIO_NTFCCION        := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_DRCCION''                      then :P34_DRCCION                   := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_DRCCION_NTFCCION''             then :P34_DRCCION_NTFCCION          := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_SJTO_TPO''                  then :P34_ID_SJTO_TPO               := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_NMRO_SCRSLES''                 then :P34_NMRO_SCRSLES              := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_ACTVDAD_ECNMCA''            then :P34_ID_ACTVDAD_ECNMCA         := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_TLFNO''                        then :P34_TLFNO                     := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_EMAIL''                        then :P34_EMAIL                     := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_FCHA_INCIO_ACTVDDES''          then :P34_FCHA_INCIO_ACTVDDES       := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_NMRO_RGSTRO_CMRA_CMRCIO''      then :P34_NMRO_RGSTRO_CMRA_CMRCIO   := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_DRCCION_CMRA_CMRCIO''          then :P34_DRCCION_CMRA_CMRCIO       := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_FCHA_RGSTRO_CMRA_CMRCIO''      then :P34_FCHA_RGSTRO_CMRA_CMRCIO   := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_TPO_PRSNA''                    then :P34_TPO_PRSNA                 := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_IDNTFCCION''                   then :P34_IDNTFCCION                := c_item.c003; end if ;',
'',
'        end loop; ',
'  /*  else',
'        :P34_CDGO_IDNTFCCION_TPO	 := null;	',
'        :P34_PRMER_NMBRE             := null; ',
'        :P34_SGNDO_NMBRE             := null; ',
'        :P34_PRMER_APLLDO            := null; ',
'        :P34_SGNDO_APLLDO            := null; ',
'        :P34_NMBRE_RZON_SCIAL        := null; ',
'        :P34_ID_DPRTMNTO             := null; ',
'        :P34_ID_MNCPIO               := null; ',
'        :P34_ID_DPRTMNTO_NTFCCION    := null; ',
'        :P34_ID_MNCPIO_NTFCCION      := null; ',
'        :P34_DRCCION                 := null; ',
'        :P34_DRCCION_NTFCCION        := null; ',
'        :P34_ID_SJTO_TPO             := null; ',
'        :P34_NMRO_SCRSLES            := null; ',
'        :P34_ID_ACTVDAD_ECNMCA       := null; ',
'        :P34_TLFNO                   := null; ',
'        :P34_EMAIL                   := null; ',
'        :P34_FCHA_INCIO_ACTVDDES     := null; ',
'        :P34_NMRO_RGSTRO_CMRA_CMRCIO := null; ',
'        :P34_DRCCION_CMRA_CMRCIO     := null; ',
'        :P34_FCHA_RGSTRO_CMRA_CMRCIO := null; ',
'        :P34_TPO_PRSNA               := null; ',
'        :P34_IDNTFCCION              := null; ',
'    end if;*/',
'end;  '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from gn_g_temporal      a',
'where  a.n001             =  :F_ID_INSTNCIA_FLJO;'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70157889590048301)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Proceso WorkFlow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'WORKFLOW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70104077452135816)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(70102801622135804)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Actividades Economicas - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(70058606046857681)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70818263747843703)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'actualizar_valor_ant'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral                gn_g_temporal.id_tmpral%type;',
'    ',
'    v_item_nmbre               varchar2(1000) := apex_application.g_f01(1);',
'    v_item_vlor                varchar2(1000) := apex_application.g_f02(1);',
'    v_txto_vlor_antrior        varchar2(1000) := apex_application.g_f03(1);',
'    ',
'    v_error                    varchar2(1000);',
'    v_nmro                     number;',
'begin',
'    ',
'    begin',
'        begin',
'           select a.id_tmpral',
'             into v_id_tmpral',
'             from gn_g_temporal      a',
'            where --a.id_ssion         = :APP_SESSION and',
'                  a.n001             = :F_ID_INSTNCIA_FLJO',
'              and a.c001             = v_item_nmbre;',
'        exception ',
'            when others then ',
'                v_id_tmpral    := null;',
'        end;',
'        ',
'        /*',
'        c001    => nombre del item.       Eje: P34_TPO_PRSNA',
'        c002    => Valor anterior.        Eje: N',
'        c003    => Nuevo valor.           Eje: J',
'        c004    => Label del item.        Eje: Tipo de Persona',
'        c005    => Indica si el item es de cambios realizados al sujeto o al responsable',
'        c006    => Cuando el item es una lista se guarda el texto del valor anterior seleccionado en la lista Eje: Natural',
'        c007    => Cuando el item es una lista se guarda el texto del nuevo valor seleccionado en la lista Eje: Juridica',
'        c008    => Indica si se actualizo el texto del valor anterior',
'        */',
'        ',
'        if v_id_tmpral is not null then ',
'        ',
'            update gn_g_temporal',
'              set c006            = nvl(v_txto_vlor_antrior, v_item_vlor)',
'                , c008            = ''S''',
'             where --id_ssion       = :APP_SESSION and ',
'                   n001           = :F_ID_INSTNCIA_FLJO',
'               and c001           = v_item_nmbre',
'               and c008           = ''N'';',
'            v_nmro := sql%rowcount;',
'            /*insert into gti_aux(col1, col2) values (''v_item_nmbre'', v_item_nmbre);',
'            insert into gti_aux(col1, col2) values (''v_item_vlor'', v_item_vlor);*/',
'            commit;',
'            ',
'        else',
'            insert into gn_g_temporal (id_ssion,        n001,                   c001,             c002,          ',
'                                       c003,            c004,                   c005,             C006)',
'                               values (:APP_SESSION,    :F_ID_INSTNCIA_FLJO,    v_item_nmbre,    v_item_vlor,    ',
'                                       v_item_vlor,     v_item_nmbre,           ''SUJETO'',        v_txto_vlor_antrior);',
'                                   ',
'            commit;',
'        end if;',
'    ',
'    exception ',
'        when others then ',
'            null;',
'  end;',
'  ',
'  ',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -  ''|| sqlerrm;',
'         insert into gti_aux(col1, col2) values (''Error'', v_error);',
'         commit;        ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70292267863463802)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'actualizar_temporal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral                gn_g_temporal.id_tmpral%type;',
'    ',
'    v_item_nmbre               varchar2(1000) := apex_application.g_f01(1);',
'    v_item_vlor                varchar2(1000) := apex_application.g_f02(1);',
'    v_txto_vlor_nvo            varchar2(1000) := apex_application.g_f03(1);',
'    ',
'    v_error                    varchar2(1000);',
'    v_nmro                     number;',
'begin',
'    ',
'    begin',
'        begin',
'           select a.id_tmpral',
'             into v_id_tmpral',
'             from gn_g_temporal      a',
'            where-- a.id_ssion         = :APP_SESSION and',
'               a.n001             = :F_ID_INSTNCIA_FLJO',
'              and a.c001             = v_item_nmbre',
'              ;',
'        exception ',
'            when others then ',
'                v_id_tmpral    := null;',
'        end;',
'        ',
'        /*',
'        c001    => nombre del item.       Eje: P34_TPO_PRSNA',
'        c002    => Valor anterior.        Eje: N',
'        c003    => Nuevo valor.           Eje: J',
'        c004    => Label del item.        Eje: Tipo de Persona',
'        c005    => Indica si el item es de cambios realizados al sujeto o al responsable',
'        c006    => Cuando el item es una lista se guarda el texto del valor anterior seleccionado en la lista Eje: Natural',
'        c007    => Cuando el item es una lista se guarda el texto del nuevo valor seleccionado en la lista Eje: Juridica',
'        c008    => Indica si se actualizo el texto del valor anterior',
'        */',
'        ',
'        if v_id_tmpral is not null then ',
'        ',
'            update gn_g_temporal',
'              set c003            = v_item_vlor',
'                , c007            = nvl(v_txto_vlor_nvo, v_item_vlor)',
'             where -- id_ssion       = :APP_SESSION and',
'                   n001           = :F_ID_INSTNCIA_FLJO',
'               and c001           = v_item_nmbre;',
'            v_nmro := sql%rowcount;',
'            /*insert into gti_aux(col1, col2) values (''v_item_nmbre'', v_item_nmbre);',
'            insert into gti_aux(col1, col2) values (''v_item_vlor'', v_item_vlor);*/',
'            commit;',
'            ',
'        else',
'            insert into gn_g_temporal (id_ssion,        n001,                   c001,             c002,          ',
'                                       c003,            c004,                   c005,             C007)',
'                               values (:APP_SESSION,    :F_ID_INSTNCIA_FLJO,    v_item_nmbre,    v_item_vlor,    ',
'                                       v_item_vlor,     v_item_nmbre,           ''SUJETO'',        v_txto_vlor_nvo);',
'                                   ',
'            commit;',
'        end if;',
'    ',
'    exception ',
'        when others then ',
'            null;',
'  end;',
'  ',
'  ',
'exception',
'    when others then ',
'        v_error    := sqlcode || '' -  ''|| sqlerrm;',
'         insert into gti_aux(col1, col2) values (''Error'', v_error);',
'         commit;        ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
