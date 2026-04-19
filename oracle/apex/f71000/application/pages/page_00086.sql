prompt --application/pages/page_00086
begin
wwv_flow_api.create_page(
 p_id=>86
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripci\00F3n Documento')
,p_step_title=>unistr('Prescripci\00F3n Documento')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function resolveAfter1Seconds(x) { ',
'    return new Promise(resolve => {',
'        setTimeout(() => {',
'            CKEDITOR.instances.P86_DCMNTO.insertHtml(x);',
'            resolve(x);',
'        }, 1500);',
'    });',
'}',
'async function fnc_crgrDcmnto() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        CKEDITOR.instances.P86_DCMNTO.setData('''');',
'        if ($v("P86_ID_DCMNTO")!== ""){',
'            const resp = await apex.server.process (''ajax_cargarDocumento'', {pageItems : "#P86_ID_DCMNTO"});  ',
'            //console.log(resp.v_dcmnto);',
'            await resolveAfter1Seconds(resp.v_dcmnto);',
'        }',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'}',
'',
'async function fnc_gstnrDcmnto(p_request){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        var v_dcmnto = CKEDITOR.instances.P86_DCMNTO.getData();',
'        await apex.server.process ( "ajax_gestionarDocumento", {',
'            pageItems: "#P86_ID_PRSCRPCION, #P86_ID_PRSCRPCION_SJTO_IMPSTO, #P86_ID_ACTO_TPO, #P86_ID_PLNTLLA, #P86_ID_DCMNTO",',
'			f01: v_dcmnto,',
'			x01: p_request',
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
'					if (["CREATE","SAVE"].includes(p_request)){',
'						apex.item( "P86_ID_DCMNTO" ).setValue(pData.o_id_dcmnto);',
'					}else if (p_request == "DELETE"){',
'						apex.item( "P86_ID_DCMNTO" ).setValue();',
'					};',
unistr('                    window.sessionStorage.v_mnsje_rspsta = "Acci\00F3n procesada con \00E9xito."'),
'					apex.submit();',
'                }',
'            }',
'        });',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
'/*async function fnc_gstnrDcmnto(p_request){',
'	let $waitPopup = apex.widget.waitPopup();',
'	try{',
'		var v_dcmnto = CKEDITOR.instances.P86_DCMNTO.getData();',
'		await apex.server.process (''ajax_gestionarDocumento'',',
'							 {pageItems : "#P86_ID_PRSCRPCION, #P86_ID_PRSCRPCION_SJTO_IMPSTO, #P86_ID_ACTO_TPO, #P86_ID_PLNTLLA, #P86_ID_DCMNTO", f01: v_dcmnto, x01: p_request}',
'							).then((resp) =>  {',
'			if (resp.type == ''0''){',
'				apex.message.showPageSuccess(resp.msg)',
'			}else{',
'				apex.message.showErrors(resp.msg)',
'			};',
'            if (resp.id_dcmnto){',
'                apex.item( "P86_ID_DCMNTO" ).setValue(resp.id_dcmnto);',
'            }else{',
'                apex.item( "P86_ID_DCMNTO" ).setValue();',
'            }',
'            console.log("id_dcmnto:''" + resp.id_dcmnto + "''");',
'		});',
'		CKEDITOR.instances.P86_DCMNTO.setData('''');',
'        apex.submit();',
'	}catch(e){',
'		console.log(e);',
'	}finally{',
'		$waitPopup.remove();',
'		//apex.submit();',
'	}',
'}*/'))
,p_javascript_code_onload=>'fnc_crgrDcmnto();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P86_DTOS_FLJO .t-TabsRegion-items{',
'    min-height: 100px !important;',
'}',
'#P86_DCMNTOS_GNRDOS_ig_report_settings {',
'    display: none !important;',
'}',
'#cke_P86_DCMNTO{',
'    width: 99% !important;',
'}',
'',
'#P86_PRSCRPCION_PLNTLLA {',
'    margin-bottom: 0px;',
'}'))
,p_step_template=>wwv_flow_api.id(177314991547050583)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20240730140946'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81378615913510902)
,p_plug_name=>unistr('Prescripci\00F3n Plantilla')
,p_region_name=>'P86_PRSCRPCION_PLNTLLA'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82355574486628701)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(82550328345374201)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
unistr('</h5>Funcionalidad que gestiona los documentos que puedan existir en un flujo de prescripci\00F3n, adem\00E1s, pueden utilizarse las respuestas generadas en el an\00E1lisis de las reglas de negocio.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107813145930197301)
,p_plug_name=>unistr('Respuestas de Validaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_prscrpcion_sjto_impsto,',
'        a.idntfccion',
'from    v_gf_g_prscrpcnes_sjto_impsto   a',
'where   a.id_prscrpcion =   :P86_ID_PRSCRPCION;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(107813369400197303)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:189:&SESSION.::&DEBUG.:RP,189:P189_ID_PRSCRPCION_SJTO_IMPSTO:&ID_PRSCRPCION_SJTO_IMPSTO.'
,p_link_text=>'&IDNTFCCION.'
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
 p_id=>wwv_flow_api.id(108850024400518101)
,p_name=>'ID_PRSCRPCION_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRSCRPCION_SJTO_IMPSTO'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(107813242268197302)
,p_internal_uid=>107813242268197302
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
 p_id=>wwv_flow_api.id(107819875279203094)
,p_interactive_grid_id=>wwv_flow_api.id(107813242268197302)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(107819903641203095)
,p_report_id=>wwv_flow_api.id(107819875279203094)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107820434493203102)
,p_view_id=>wwv_flow_api.id(107819903641203095)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(107813369400197303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108856002864519505)
,p_view_id=>wwv_flow_api.id(107819903641203095)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(108850024400518101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119605088311538401)
,p_plug_name=>unistr('Prescripci\00F3n Documento')
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(217402380394540455)
,p_plug_name=>'Datos del Flujo'
,p_region_name=>'P86_DTOS_FLJO'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(150881306338142465)
,p_plug_name=>'Criticas'
,p_parent_plug_id=>wwv_flow_api.id(217402380394540455)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56617879919749065)
,p_plug_name=>unistr('Gesti\00F3n de Vigencias')
,p_parent_plug_id=>wwv_flow_api.id(150881306338142465)
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
 p_id=>wwv_flow_api.id(28751638848363572)
,p_region_id=>wwv_flow_api.id(56617879919749065)
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
 p_id=>wwv_flow_api.id(28753317607363575)
,p_chart_id=>wwv_flow_api.id(28751638848363572)
,p_seq=>10
,p_name=>'Vigencias Pendientes'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia,',
'        count(*) cntdad,',
'        ''<b>Vigencias '' || a.vgncia || '' Pendientes: </b>'' || rtrim(to_char(count(*), ''FM9G999G990D999'', ''NLS_NUMERIC_CHARACTERS='''',.''''''), '','') tooltip',
'from    v_gf_g_prscrpcnes_vgncia    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prscrpcion =   :P86_ID_PRSCRPCION',
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
 p_id=>wwv_flow_api.id(28753988957363575)
,p_chart_id=>wwv_flow_api.id(28751638848363572)
,p_seq=>20
,p_name=>'Vigencias Aceptadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia,',
'        count(*) cntdad,',
'        ''<b>Vigencias '' || a.vgncia || '' Aceptadas: </b>'' || rtrim(to_char(count(*), ''FM9G999G990D999'', ''NLS_NUMERIC_CHARACTERS='''',.''''''), '','') tooltip',
'from    v_gf_g_prscrpcnes_vgncia    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prscrpcion =   :P86_ID_PRSCRPCION',
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
 p_id=>wwv_flow_api.id(28754559046363576)
,p_chart_id=>wwv_flow_api.id(28751638848363572)
,p_seq=>30
,p_name=>'Vigencias Rechazadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia,',
'        count(*) cntdad,',
'        ''<b>Vigencias '' || a.vgncia || '' Rechazadas: </b>'' || rtrim(to_char(count(*), ''FM9G999G990D999'', ''NLS_NUMERIC_CHARACTERS='''',.''''''), '','') tooltip',
'from    v_gf_g_prscrpcnes_vgncia    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prscrpcion =   :P86_ID_PRSCRPCION',
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
 p_id=>wwv_flow_api.id(28752704390363573)
,p_chart_id=>wwv_flow_api.id(28751638848363572)
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
 p_id=>wwv_flow_api.id(28752118863363572)
,p_chart_id=>wwv_flow_api.id(28751638848363572)
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
 p_id=>wwv_flow_api.id(57031691167802465)
,p_plug_name=>'Sujetos-Tributos'
,p_parent_plug_id=>wwv_flow_api.id(150881306338142465)
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
'and     a.id_prscrpcion =   :P86_ID_PRSCRPCION;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITTLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(57362891719450365)
,p_plug_name=>unistr('Gesti\00F3n de Validaciones')
,p_parent_plug_id=>wwv_flow_api.id(150881306338142465)
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
 p_id=>wwv_flow_api.id(28747885207363566)
,p_region_id=>wwv_flow_api.id(57362891719450365)
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
 p_id=>wwv_flow_api.id(28750127178363571)
,p_chart_id=>wwv_flow_api.id(28747885207363566)
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
'where       a.id_prscrpcion =   :P86_ID_PRSCRPCION',
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
 p_id=>wwv_flow_api.id(28750789241363571)
,p_chart_id=>wwv_flow_api.id(28747885207363566)
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
'where       a.id_prscrpcion =   :P86_ID_PRSCRPCION',
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
 p_id=>wwv_flow_api.id(28748349178363569)
,p_chart_id=>wwv_flow_api.id(28747885207363566)
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
 p_id=>wwv_flow_api.id(28748948613363569)
,p_chart_id=>wwv_flow_api.id(28747885207363566)
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
 p_id=>wwv_flow_api.id(28749514940363570)
,p_chart_id=>wwv_flow_api.id(28747885207363566)
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
 p_id=>wwv_flow_api.id(220259133311508161)
,p_plug_name=>'Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(217402380394540455)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P86_ID_SLCTUD'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(199858908715330154)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(220259133311508161)
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
'and         a.id_slctud     =   :P86_ID_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P86_ID_SLCTUD'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(199859132102330156)
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
 p_id=>wwv_flow_api.id(199859229174330157)
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
 p_id=>wwv_flow_api.id(199859274975330158)
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
 p_id=>wwv_flow_api.id(199859362760330159)
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
 p_id=>wwv_flow_api.id(199859490399330160)
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
 p_id=>wwv_flow_api.id(199859013670330155)
,p_internal_uid=>199859013670330155
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
 p_id=>wwv_flow_api.id(199864507836336825)
,p_interactive_grid_id=>wwv_flow_api.id(199859013670330155)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(199864644734336826)
,p_report_id=>wwv_flow_api.id(199864507836336825)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199865010513336828)
,p_view_id=>wwv_flow_api.id(199864644734336826)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(199859132102330156)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199865503250336831)
,p_view_id=>wwv_flow_api.id(199864644734336826)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(199859229174330157)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199866046109336832)
,p_view_id=>wwv_flow_api.id(199864644734336826)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(199859274975330158)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199866467996336835)
,p_view_id=>wwv_flow_api.id(199864644734336826)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(199859362760330159)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(199869396794355868)
,p_view_id=>wwv_flow_api.id(199864644734336826)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(199859490399330160)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220258390429508154)
,p_plug_name=>unistr('Datos B\00E1sicos')
,p_parent_plug_id=>wwv_flow_api.id(220259133311508161)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P86_ID_SLCTUD'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220259213414508162)
,p_plug_name=>'Documentos Generados'
,p_parent_plug_id=>wwv_flow_api.id(217402380394540455)
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
'and         a.id_prscrpcion                 =   :P86_ID_PRSCRPCION',
'and         dbms_lob.getlength(c.file_blob) >   0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(220314543772800654)
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
 p_id=>wwv_flow_api.id(220314583454800655)
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
 p_id=>wwv_flow_api.id(220314699697800656)
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
 p_id=>wwv_flow_api.id(220314834468800657)
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
 p_id=>wwv_flow_api.id(220314881965800658)
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
 p_id=>wwv_flow_api.id(220315029256800659)
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
 p_id=>wwv_flow_api.id(220259300404508163)
,p_internal_uid=>220259300404508163
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
 p_id=>wwv_flow_api.id(220313078310710478)
,p_interactive_grid_id=>wwv_flow_api.id(220259300404508163)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(220313182077710479)
,p_report_id=>wwv_flow_api.id(220313078310710478)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220320484091800810)
,p_view_id=>wwv_flow_api.id(220313182077710479)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(220314543772800654)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220321002264800813)
,p_view_id=>wwv_flow_api.id(220313182077710479)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(220314583454800655)
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
 p_id=>wwv_flow_api.id(220321520373800815)
,p_view_id=>wwv_flow_api.id(220313182077710479)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(220314699697800656)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220322000766800816)
,p_view_id=>wwv_flow_api.id(220313182077710479)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(220314834468800657)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>3
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220325510617829326)
,p_view_id=>wwv_flow_api.id(220313182077710479)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(220314881965800658)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220325973671829331)
,p_view_id=>wwv_flow_api.id(220313182077710479)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(220315029256800659)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(225435032962412656)
,p_plug_name=>'Observaciones'
,p_parent_plug_id=>wwv_flow_api.id(217402380394540455)
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
'and         a.id_prscrpcion =   :P86_ID_PRSCRPCION;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(225609873763015358)
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
 p_id=>wwv_flow_api.id(225609995869015359)
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
 p_id=>wwv_flow_api.id(225610068024015360)
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
 p_id=>wwv_flow_api.id(225610182475015361)
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
 p_id=>wwv_flow_api.id(225610269583015362)
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
 p_id=>wwv_flow_api.id(225610546741015364)
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
 p_id=>wwv_flow_api.id(225609838269015357)
,p_internal_uid=>225609838269015357
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
 p_id=>wwv_flow_api.id(225628559311120167)
,p_interactive_grid_id=>wwv_flow_api.id(225609838269015357)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(225628564868120167)
,p_report_id=>wwv_flow_api.id(225628559311120167)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225629090183120171)
,p_view_id=>wwv_flow_api.id(225628564868120167)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(225609873763015358)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225629562378120175)
,p_view_id=>wwv_flow_api.id(225628564868120167)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(225609995869015359)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225630127102120176)
,p_view_id=>wwv_flow_api.id(225628564868120167)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(225610068024015360)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>232
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225630633272120178)
,p_view_id=>wwv_flow_api.id(225628564868120167)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(225610182475015361)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>172
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225631120565120179)
,p_view_id=>wwv_flow_api.id(225628564868120167)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(225610269583015362)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>224
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225638876050140347)
,p_view_id=>wwv_flow_api.id(225628564868120167)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(225610546741015364)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(284747771307940810)
,p_plug_name=>unistr('Datos B\00E1sicos de Prescripci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(217402380394540455)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(87703577403497101)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(82355574486628701)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        wf_g_instancias_transicion  a',
'inner join  gn_d_actos_tipo_tarea       b   on  b.id_fljo_trea  =   a.id_fljo_trea_orgen',
'                                            and b.id_acto_tpo   =   :P86_ID_ACTO_TPO',
'                                            and b.actvo         =   ''S''',
'where       a.id_instncia_fljo  =   :F_ID_INSTNCIA_FLJO',
'and         a.id_fljo_trea_orgen=   :F_ID_FLJO_TREA',
'and         a.id_estdo_trnscion in  (1, 2)',
'and         :P86_ID_DCMNTO      is  null;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(81423840740664502)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(82355574486628701)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        v_gf_g_prscrpcns_dcmnto     a',
'inner join  wf_g_instancias_transicion  b   on  b.id_instncia_fljo  =   a.id_instncia_fljo',
'                                            and b.id_fljo_trea_orgen=   :F_ID_FLJO_TREA',
'                                            and b.id_estdo_trnscion in  (1, 2)',
'where       a.id_dcmnto =   :P86_ID_DCMNTO;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(81423919574664503)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(82355574486628701)
,p_button_name=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        v_gf_g_prscrpcns_dcmnto       a',
'inner join  wf_g_instancias_transicion    b   on  b.id_instncia_fljo  =   a.id_instncia_fljo',
'                                              and b.id_fljo_trea_orgen=   a.id_fljo_trea',
'                                              and b.id_estdo_trnscion in  (1, 2)',
'where       a.id_dcmnto     =   :P86_ID_DCMNTO',
'and         a.id_fljo_trea  =   :F_ID_FLJO_TREA;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104696713554662087)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(82355574486628701)
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
 p_id=>wwv_flow_api.id(82355765959628703)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(82355574486628701)
,p_button_name=>'REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8693761866154102)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(81378615913510902)
,p_button_name=>'Btn_Generar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P86_ID_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81378739888510903)
,p_name=>'P86_ID_PLNTLLA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(81378615913510902)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion,',
'            b.id_plntlla            ',
'from        gn_d_actos_tipo a',
'inner join  gn_d_plantillas b   on  b.id_acto_tpo   =   a.id_acto_tpo',
'where       a.id_acto_tpo   =       :P86_ID_ACTO_TPO',
'and         b.actvo         =       ''S''',
'and         sysdate         between b.fcha_incio and b.fcha_fin;'))
,p_read_only_when=>'P86_ID_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82452692103825902)
,p_name=>'P86_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(119605088311538401)
,p_prompt=>'Documento'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_tag_attributes=>'contenteditable="true"'
,p_colspan=>12
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    ',
'    CKEDITOR.on( ''instanceReady'', function(ev) {',
'           ev.editor.on(''paste'', function (ev) {',
'                var value = window.localStorage[''dataCopy''];',
'               try {',
'                   var json = JSON.parse(value);',
'                   var v_rfrncia = Object.keys(json)[0];',
'                   if (json[v_rfrncia].SI.length > 0 || json[v_rfrncia].NO.length > 0){',
'                       var v_html = ''<p>''+v_rfrncia+''</p>'';',
'                       if (json[v_rfrncia].SI.length > 0){',
'                           v_html += ''<p>Aceptadas:</p>'';',
'                           json[v_rfrncia].SI.forEach((e) => {',
'                               var v_vgncia = Object.keys(e)[0];',
'                               v_html += ''<p>''+v_vgncia+''</p>'';',
'                               v_html += ''<ul>'';',
'                               e[v_vgncia].forEach((f) => {',
'                                   v_html += ''<li>''+f+''</li>'';',
'                               });',
'                               v_html += ''</ul>'';',
'                           });',
'                       }',
'                       if (json[v_rfrncia].NO.length > 0){',
'                           v_html += ''<p>Rechazadas:</p>'';',
'                           json[v_rfrncia].NO.forEach((e) => {',
'                               var v_vgncia = Object.keys(e)[0];',
'                               v_html += ''<p>''+v_vgncia+''</p>'';',
'                               v_html += ''<ul>'';',
'                               e[v_vgncia].forEach((f) => {',
'                                   v_html += ''<li>''+f+''</li>'';',
'                               });',
'                               v_html += ''</ul>'';',
'                           });',
'                       }',
'                       CKEDITOR.instances.P86_DCMNTO.insertHtml(v_html);',
'                   }',
'                   //CKEDITOR.instances.P86_DCMNTO.insertHtml( ''<ul><li>'' + value + ''</li></ul>'' );',
'                   ev.stop();',
'                   return;',
'                } catch(error) {',
'                    console.log(error);',
'                }                             ',
'           });',
'    });',
'   ',
'    opt.uiColor = ''#f1f1f1'';',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.height = 400;',
'    opt.resize_enabled = false;    ',
'    opt.enterMode = 2;	opt.removePlugins = ''contextmenu,liststyle,tabletools'';	return;',
'}'))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96080657534487901)
,p_name=>'P86_PGNA_ORGN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(81378615913510902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96080717668487902)
,p_name=>'P86_APLCCION_ORGN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(81378615913510902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96080989821487904)
,p_name=>'P86_ID_ACTO_TPO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(81378615913510902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96089852100889402)
,p_name=>'P86_ID_DCMNTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(81378615913510902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121485294985117461)
,p_name=>'P86_NMRO_PRSCRPCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(284747771307940810)
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
 p_id=>wwv_flow_api.id(121485618403117462)
,p_name=>'P86_ID_PRSCRPCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(284747771307940810)
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
,p_read_only_when=>'P86_ID_PRSCRPCION_TPO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121486043959117463)
,p_name=>'P86_TTAL_SJTOS_TRBTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(284747771307940810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121486407060117463)
,p_name=>'P86_ID_INSTNCIA_FLJO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(284747771307940810)
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
 p_id=>wwv_flow_api.id(121486860121117463)
,p_name=>'P86_FCHA_FLJO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(284747771307940810)
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
 p_id=>wwv_flow_api.id(121487299001117464)
,p_name=>'P86_DSCRPCION_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(284747771307940810)
,p_prompt=>'Respuesta'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.dscrpcion, a.cdgo_rspsta',
'from        gf_d_prescripciones_rspsta       a;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121487686487117464)
,p_name=>'P86_FCHA_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(284747771307940810)
,p_prompt=>'Fecha de Respuesta'
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
 p_id=>wwv_flow_api.id(121488033930117464)
,p_name=>'P86_ID_PRSCRPCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(284747771307940810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121491929660117479)
,p_name=>'P86_ID_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(220258390429508154)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121492313389117481)
,p_name=>'P86_ID_INSTNCIA_FLJO_PQR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(220258390429508154)
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
 p_id=>wwv_flow_api.id(121492743453117481)
,p_name=>'P86_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(220258390429508154)
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
 p_id=>wwv_flow_api.id(121493117688117482)
,p_name=>'P86_FCHA_RDCDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(220258390429508154)
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
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121493511568117482)
,p_name=>'P86_FCHA_LMTE_LEY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(220258390429508154)
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
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(110903744576152304)
,p_computation_sequence=>10
,p_computation_item=>'P86_ID_PLNTLLA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_plntlla',
'from    gf_g_prscrpcns_dcmnto    a',
'where   a.id_dcmnto = :P86_ID_DCMNTO;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(121478788392069304)
,p_computation_sequence=>20
,p_computation_item=>'P86_TTAL_SJTOS_TRBTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count(*)',
'from    gf_g_prscrpcnes_sjto_impsto    a',
'where   a.id_prscrpcion =   :P86_ID_PRSCRPCION;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104657314250412508)
,p_name=>'BTN Al cerrar observaciones'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(104696713554662087)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(121566637497845404)
,p_event_id=>wwv_flow_api.id(104657314250412508)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(225435032962412656)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110767413460597305)
,p_name=>'Clic en CREATE'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(87703577403497101)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110767534026597306)
,p_event_id=>wwv_flow_api.id(110767413460597305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_gstnrDcmnto("CREATE");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110903846217152305)
,p_name=>'Clic en SAVE'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(81423840740664502)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110903920713152306)
,p_event_id=>wwv_flow_api.id(110903846217152305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_gstnrDcmnto("SAVE");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110904084062152307)
,p_name=>'Clic en DELETE'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(81423919574664503)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110904159649152308)
,p_event_id=>wwv_flow_api.id(110904084062152307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de eliminar el documento generado?", function( okPressed ) {'),
'        if( okPressed ) {',
'            fnc_gstnrDcmnto("DELETE");',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(121566751822845405)
,p_name=>'Al cerrar observaciones'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(225435032962412656)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(121566856662845406)
,p_event_id=>wwv_flow_api.id(121566751822845405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(225435032962412656)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17779725801658106)
,p_name=>'Mensaje de respuesta'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17779822127658107)
,p_event_id=>wwv_flow_api.id(17779725801658106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (window.sessionStorage.v_mnsje_rspsta){',
'    apex.message.showPageSuccess(window.sessionStorage.v_mnsje_rspsta);',
'    window.sessionStorage.removeItem(''v_mnsje_rspsta'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17780113939658110)
,p_name=>'Confirmar Regresar'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(82355765959628703)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17780220458658111)
,p_event_id=>wwv_flow_api.id(17780113939658110)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de continuar? Antes aseg\00FArese de confirmar los cambios gestionados en el documento.", function( okPressed ) { '),
'    if( okPressed ) {',
'        apex.navigation.redirect("f?p=" + $v(''P86_APLCCION_ORGN'') + ":" + $v(''P86_PGNA_ORGN'') + ":" + $v(''pInstance'') + ":::::");',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(36735745766392201)
,p_name=>'Al cambiar seleccion en P86_ID_PLNTLLA'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P86_ID_PLNTLLA'
,p_condition_element=>'P86_ID_DCMNTO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_BE.CTB.SELECT2|ITEM TYPE|slctchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(36735808876392202)
,p_event_id=>wwv_flow_api.id(36735745766392201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (CKEDITOR.instances.P86_DCMNTO.getData() !== ''''){',
unistr('    apex.message.confirm( "\00BFEst\00E1 seguro que desea restablecer el documento?", function( okPressed ) {'),
'        if( okPressed ) {',
'            fnc_gnrarDcmnto();',
'        }',
'    });',
'}else{',
'    fnc_gnrarDcmnto();',
'}',
'',
'function fnc_gnrarDcmnto(){',
'    try {',
'        let $waitPopup = apex.widget.waitPopup();',
'        CKEDITOR.instances.P86_DCMNTO.setData('''');',
'        apex.server.process (''ajax_generarDocumento'', {pageItems : "#P86_ID_PRSCRPCION, #P86_ID_PLNTLLA"}).then((resp) => {        ',
'            CKEDITOR.instances.P86_DCMNTO.insertHtml(resp.doc);',
'            $waitPopup.remove();',
'        });',
'    }catch(e){',
'        console.log(e);',
'        $waitPopup.remove();',
'    }',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8693875535154103)
,p_name=>'Al dar click'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8693761866154102)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8693945576154104)
,p_event_id=>wwv_flow_api.id(8693875535154103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (CKEDITOR.instances.P86_DCMNTO.getData() !== ''''){',
unistr('    apex.message.confirm( "\00BFEst\00E1 seguro que desea restablecer el documento?", function( okPressed ) {'),
'        if( okPressed ) {',
'            fnc_gnrarDcmnto();',
'        }',
'    });',
'}else{',
'    fnc_gnrarDcmnto();',
'}',
'',
'function fnc_gnrarDcmnto(){',
'    try {',
'        let $waitPopup = apex.widget.waitPopup();',
'        CKEDITOR.instances.P86_DCMNTO.setData('''');',
'        apex.server.process (''ajax_generarDocumento'', {pageItems : "#P86_ID_PRSCRPCION, #P86_ID_PLNTLLA"}).then((resp) => {        ',
'            CKEDITOR.instances.P86_DCMNTO.insertHtml(resp.doc);',
'            $waitPopup.remove();',
'        });',
'    }catch(e){',
'        console.log(e);',
'        $waitPopup.remove();',
'    }',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104695268448647169)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Datos de Prescripci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*begin',
'    select      a.fcha_incio',
'               ,a.id_instncia_fljo',
'               ,a.id_prscrpcion',
'               ,a.nmro_prscrpcion',
'               ,a.fcha_rspsta',
'               ,a.cdgo_rspsta',
'               ,a.id_slctud',
'    into        :P86_FCHA_FLJO',
'               ,:P86_ID_INSTNCIA_FLJO',
'               ,:P86_ID_PRSCRPCION',
'               ,:P86_NMRO_PRSCRPCION',
'               ,:P86_FCHA_RSPSTA',
'               ,:P86_DSCRPCION_RSPSTA',
'               ,:P86_ID_SLCTUD',
'    from        v_gf_g_prescripciones   a',
'    where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'    and         a.id_instncia_fljo  =   :F_ID_INSTNCIA_FLJO;',
'end;*/',
'',
'select      to_char(a.fcha_incio, ''DD/MM/YYYY''),',
'            a.id_instncia_fljo,',
'            b.id_prscrpcion,',
'            b.nmro_prscrpcion,',
'            to_char(b.fcha_rspsta, ''DD/MM/YYYY''),',
'            b.cdgo_rspsta,',
'            b.id_slctud,',
'            b.id_prscrpcion_tpo,',
'            c.id_plntlla',
'into        :P86_FCHA_FLJO,',
'            :P86_ID_INSTNCIA_FLJO,',
'            :P86_ID_PRSCRPCION,',
'            :P86_NMRO_PRSCRPCION,',
'            :P86_FCHA_RSPSTA,',
'            :P86_DSCRPCION_RSPSTA,',
'            :P86_ID_SLCTUD,',
'            :P86_ID_PRSCRPCION_TPO,',
'            :P86_ID_PLNTLLA',
'from        wf_g_instancias_flujo   a',
'left join   gf_g_prescripciones     b   on  b.id_instncia_fljo  =   a.id_instncia_fljo',
'join        gf_d_prscrpcnes_rspsta  c   on  b.cdgo_rspsta       =   c.cdgo_rspsta',
'where       a.id_instncia_fljo  =   :F_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104695554518648407)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos de solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select      a.nmro_rdcdo_dsplay,',
'                a.id_instncia_fljo,',
'                a.fcha_rdcdo,',
'                a.fcha_lmte_ley',
'    into        :P86_NMRO_RDCDO_DSPLAY,',
'                :P86_ID_INSTNCIA_FLJO_PQR,',
'                :P86_FCHA_RDCDO,',
'                :P86_FCHA_LMTE_LEY',
'    from        pq_g_solicitudes    a',
'    where       a.id_slctud     =   :P86_ID_SLCTUD;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P83_ID_SLCTUD'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110767265237597303)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_generarDocumento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dcmnto clob;',
'begin',
'    apex_json.open_object;',
'    begin',
'        v_dcmnto := pkg_gn_generalidades.fnc_ge_dcmnto(''{"ID_PRSCRPCION" : ''||:P86_ID_PRSCRPCION||'', "CDGO_CLNTE" : ''||:F_CDGO_CLNTE||''}'', :P86_ID_PLNTLLA);',
'        apex_json.write(''type'', 0);',
unistr('        apex_json.write(''msg'', ''Acci\00F3n procesada con \00E9xito.'');'),
'        apex_json.write(''doc'', v_dcmnto);',
'    end;',
'    apex_json.close_object;    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110767349255597304)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_gestionarDocumento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_xml            clob;',
'    v_dcmnto         clob;',
'    v_request        varchar2(50) := apex_application.g_x01;',
'    v_id_dcmnto      number;',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'begin',
'    apex_json.open_object;',
'    for i in 1..apex_application.g_f01.count',
'    loop',
'        v_dcmnto := v_dcmnto || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    v_xml :=        ''<CDGO_CLNTE>''               ||:F_CDGO_CLNTE                 ||''</CDGO_CLNTE>'';',
'    v_xml := v_xml||''<ID_PRSCRPCION>''            ||:P86_ID_PRSCRPCION            ||''</ID_PRSCRPCION>'';',
'    v_xml := v_xml||''<ID_PRSCRPCION_SJTO_IMPSTO>''||:P86_ID_PRSCRPCION_SJTO_IMPSTO||''</ID_PRSCRPCION_SJTO_IMPSTO>'';',
'    v_xml := v_xml||''<ID_FLJO_TREA>''             ||:F_ID_FLJO_TREA               ||''</ID_FLJO_TREA>'';',
'    v_xml := v_xml||''<ID_ACTO_TPO>''              ||:P86_ID_ACTO_TPO              ||''</ID_ACTO_TPO>'';',
'    v_xml := v_xml||''<ID_PLNTLLA>''               ||:P86_ID_PLNTLLA               ||''</ID_PLNTLLA>'';',
'    v_xml := v_xml||''<ID_DCMNTO>''                ||:P86_ID_DCMNTO                ||''</ID_DCMNTO>'';',
'    v_xml := v_xml||''<REQUEST>''                  ||v_request                     ||''</REQUEST>'';',
'    v_xml := v_xml||''<ID_USRIO>''                 ||:F_ID_USRIO                   ||''</ID_USRIO>'';',
'    pkg_gf_prescripcion.prc_rg_prsc_documento	(p_xml			=>    v_xml,',
'												 p_dcmnto		=>    v_dcmnto,',
'												 o_id_dcmnto    =>    v_id_dcmnto,',
'												 o_cdgo_rspsta	=>    v_cdgo_rspsta,',
'												 o_mnsje_rspsta	=>    v_mnsje_rspsta);',
'                                                 ',
'    apex_json.write(''o_id_dcmnto'', v_id_dcmnto);',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    ',
'    apex_json.close_object;',
'    exception',
'        when others then',
'            apex_json.close_object;',
'                                                 ',
'    /*if (v_cdgo_rspsta <> 0) then',
'        if (v_request = ''DELETE'') then',
'            apex_util.set_session_state(''P86_ID_DCMNTO'', null);',
'        elsif (v_request in (''CREATE'', ''SAVE'')) then',
'            apex_util.set_session_state(''P86_ID_DCMNTO'', v_id_dcmnto);',
'        end if;        ',
'    end if;*/',
'    ',
'    /*owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache''); ',
'    owa_util.http_header_close;*/',
'    /*htp.p(''{"o_id_dcmnto" :"'' ||v_id_dcmnto||''"''||',
'          '',"o_cdgo_rspsta" :'' ||v_cdgo_rspsta||',
'          '',"o_mnsje_rspsta" :"''||v_mnsje_rspsta||''"}'');*/',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110767881321597309)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_cargarDocumento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_plntlla    number;',
'    v_dcmnto        clob;',
'begin',
'    apex_json.open_object;',
'    begin',
'        select  /*a.id_plntlla,',
'                */to_clob(a.dcmnto)',
'        into    /*:P86_ID_PLNTLLA,',
'                */v_dcmnto',
'        from    gf_g_prscrpcns_dcmnto    a',
'        where   a.id_dcmnto = :P86_ID_DCMNTO;',
'        apex_json.write(''type'', 0);',
unistr('        apex_json.write(''msg'', ''Acci\00F3n procesada con \00E9xito.'');'),
'        --apex_json.write(''v_id_plntlla'', v_id_plntlla);',
'        apex_json.write(''v_dcmnto'', v_dcmnto);',
'    end;',
'    apex_json.close_object; ',
'    exception',
'        when others then',
'            apex_json.write(''type'', 1);',
'            apex_json.write(''msg'', ''Error al cargar documento.'');',
'            apex_json.close_object; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
