prompt --application/pages/page_00130
begin
wwv_flow_api.create_page(
 p_id=>130
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripci\00F3n Notificaci\00F3n')
,p_step_title=>unistr('Prescripci\00F3n Notificaci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function revertir(){',
'    var event = new Event(''eventRevertir'');',
'    window.dispatchEvent(event);',
'}',
'',
'async function fnc_generarDocumentos(p_id_rcrso_dcmnto){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        await apex.server.process ( "ajax_generarDocumentos", {',
'            x01 : p_id_rcrso_dcmnto,',
'            pageItems: "#P113_ID_PRSCRPCION"',
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
'};',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P130_DTOS_FLJO .t-TabsRegion-items{',
'    min-height: 100px !important;',
'}',
'#P130_DCMNTOS_GNRDOS_ig_report_settings {',
'    display: none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200318144557'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172666937118227672)
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
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173266923273345754)
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
 p_id=>wwv_flow_api.id(174446033600655954)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
unistr('</h5>Funcionalidad que valida que todos los documentos hayan sido notificados antes de aplicarse la prescripci\00F3n o finalizarse el flujo, adem\00E1s, permite generar documentos siguientes a la resoluci\00F3n de prescripci\00F3n.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(201773899091367343)
,p_plug_name=>'Actos'
,p_region_name=>'P113_DTOS_FLJO'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_acto_tpo,',
'            b.dscrpcion,',
'            f.id_acto,',
'            f.id_dcmnto,',
'            decode(a.indcdor_oblgtrio, ''S'', ''Si'', ''No'') indcdor_oblgtrio,',
'            case',
'                when (a.id_acto_tpo_rqrdo is null       and f.id_acto is null)',
'                or   (a.id_acto_tpo_rqrdo is not null   and k.id_acto is not null and f.id_acto is null) then',
'                    ''<center>',
'                        <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                            ||nvl2(f.id_dcmnto, ''Modificar '', ''Generar '')',
'                            ||''<span class="fa ''||nvl2(f.id_dcmnto,''fa-edit'',''fa-gear fa-anim-spin'')||''"></span>',
'                        </button>',
'                    </center>''',
'            end accion,',
'            case',
'                when (a.id_fljo_trea = e.id_fljo_trea_cnfrmcion and a.id_acto_tpo_rqrdo is null       and f.id_dcmnto is not null and f.id_acto is null)',
'                or   (a.id_fljo_trea = e.id_fljo_trea_cnfrmcion and a.id_acto_tpo_rqrdo is not null   and k.id_acto is not null   and f.id_dcmnto is not null and f.id_acto is null) then',
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
'where       b.cdgo_clnte    =   :F_CDGO_CLNTE',
'and         a.id_fljo_trea  =   :F_ID_FLJO_TREA',
'and         (e.cdgo_rspsta  =   d.cdgo_rspsta or',
'             e.cdgo_rspsta  is  null)',
'and         a.actvo         =   ''S'';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P130_DSCRPCION_RSPSTA'
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
 p_id=>wwv_flow_api.id(201960433521927155)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JDIAZ'
,p_internal_uid=>201960433521927155
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(105869788505037743)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(105870130316037743)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(105870533410037743)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(105870975842037743)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(105871307776037744)
,p_db_column_name=>'INDCDOR_OBLGTRIO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Obligatorio'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(105871716020037744)
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
 p_id=>wwv_flow_api.id(105872159461037744)
,p_db_column_name=>'CONFIRMAR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Confirmar Acto'
,p_column_link=>'javascript:fnc_generarDocumentos(#ID_DCMNTO#);'
,p_column_linktext=>'#CONFIRMAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(201975423264027022)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1058725'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ACTO_TPO:DSCRPCION:ID_ACTO:ID_DCMNTO:INDCDOR_OBLGTRIO:ACCION:CONFIRMAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(217589280534768493)
,p_plug_name=>'Datos del Flujo'
,p_region_name=>'P130_DTOS_FLJO'
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
 p_id=>wwv_flow_api.id(208126230888413072)
,p_plug_name=>'Criticas'
,p_parent_plug_id=>wwv_flow_api.id(217589280534768493)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113862804470019672)
,p_plug_name=>unistr('Gesti\00F3n de Vigencias')
,p_parent_plug_id=>wwv_flow_api.id(208126230888413072)
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
 p_id=>wwv_flow_api.id(28682617179219760)
,p_region_id=>wwv_flow_api.id(113862804470019672)
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
 p_id=>wwv_flow_api.id(28684322575219761)
,p_chart_id=>wwv_flow_api.id(28682617179219760)
,p_seq=>10
,p_name=>'Vigencias Pendientes'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia,',
'        count(*) cntdad,',
'        ''<b>Vigencias '' || a.vgncia || '' Pendientes: </b>'' || rtrim(to_char(count(*), ''FM9G999G990D999'', ''NLS_NUMERIC_CHARACTERS='''',.''''''), '','') tooltip',
'from    v_gf_g_prscrpcnes_vgncia    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prscrpcion =   :P130_ID_PRSCRPCION',
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
 p_id=>wwv_flow_api.id(28684997621219761)
,p_chart_id=>wwv_flow_api.id(28682617179219760)
,p_seq=>20
,p_name=>'Vigencias Aceptadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia,',
'        count(*) cntdad,',
'        ''<b>Vigencias '' || a.vgncia || '' Aceptadas: </b>'' || rtrim(to_char(count(*), ''FM9G999G990D999'', ''NLS_NUMERIC_CHARACTERS='''',.''''''), '','') tooltip',
'from    v_gf_g_prscrpcnes_vgncia    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prscrpcion =   :P130_ID_PRSCRPCION',
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
 p_id=>wwv_flow_api.id(28685568176219762)
,p_chart_id=>wwv_flow_api.id(28682617179219760)
,p_seq=>30
,p_name=>'Vigencias Rechazadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia,',
'        count(*) cntdad,',
'        ''<b>Vigencias '' || a.vgncia || '' Rechazadas: </b>'' || rtrim(to_char(count(*), ''FM9G999G990D999'', ''NLS_NUMERIC_CHARACTERS='''',.''''''), '','') tooltip',
'from    v_gf_g_prscrpcnes_vgncia    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prscrpcion =   :P130_ID_PRSCRPCION',
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
 p_id=>wwv_flow_api.id(28683170819219761)
,p_chart_id=>wwv_flow_api.id(28682617179219760)
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
 p_id=>wwv_flow_api.id(28683710673219761)
,p_chart_id=>wwv_flow_api.id(28682617179219760)
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
 p_id=>wwv_flow_api.id(114276615718073072)
,p_plug_name=>'Sujetos-Tributos'
,p_parent_plug_id=>wwv_flow_api.id(208126230888413072)
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
'and     a.id_prscrpcion =   :P130_ID_PRSCRPCION;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITTLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114607816269720972)
,p_plug_name=>unistr('Gesti\00F3n de Validaciones')
,p_parent_plug_id=>wwv_flow_api.id(208126230888413072)
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
 p_id=>wwv_flow_api.id(28678889423219758)
,p_region_id=>wwv_flow_api.id(114607816269720972)
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
 p_id=>wwv_flow_api.id(28681730853219760)
,p_chart_id=>wwv_flow_api.id(28678889423219758)
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
'where       a.id_prscrpcion =   :P130_ID_PRSCRPCION',
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
 p_id=>wwv_flow_api.id(28681186789219759)
,p_chart_id=>wwv_flow_api.id(28678889423219758)
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
'where       a.id_prscrpcion =   :P130_ID_PRSCRPCION',
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
 p_id=>wwv_flow_api.id(28679973695219759)
,p_chart_id=>wwv_flow_api.id(28678889423219758)
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
 p_id=>wwv_flow_api.id(28680529391219759)
,p_chart_id=>wwv_flow_api.id(28678889423219758)
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
 p_id=>wwv_flow_api.id(28679323019219758)
,p_chart_id=>wwv_flow_api.id(28678889423219758)
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
 p_id=>wwv_flow_api.id(220446033451736199)
,p_plug_name=>'Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(217589280534768493)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(177336177026050608)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P130_ID_SLCTUD'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(200045808855558192)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(220446033451736199)
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
'and         a.id_slctud     =   :P130_ID_SLCTUD;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P130_ID_SLCTUD'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(200046032242558194)
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
 p_id=>wwv_flow_api.id(200046129314558195)
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
 p_id=>wwv_flow_api.id(200046175115558196)
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
 p_id=>wwv_flow_api.id(200046262900558197)
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
 p_id=>wwv_flow_api.id(200046390539558198)
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
 p_id=>wwv_flow_api.id(200045913810558193)
,p_internal_uid=>200045913810558193
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
 p_id=>wwv_flow_api.id(200051407976564863)
,p_interactive_grid_id=>wwv_flow_api.id(200045913810558193)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
end;
/
begin
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(200051544874564864)
,p_report_id=>wwv_flow_api.id(200051407976564863)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(200051910653564866)
,p_view_id=>wwv_flow_api.id(200051544874564864)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(200046032242558194)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(200052403390564869)
,p_view_id=>wwv_flow_api.id(200051544874564864)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(200046129314558195)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(200052946249564870)
,p_view_id=>wwv_flow_api.id(200051544874564864)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(200046175115558196)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(200053368136564873)
,p_view_id=>wwv_flow_api.id(200051544874564864)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(200046262900558197)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(200056296934583906)
,p_view_id=>wwv_flow_api.id(200051544874564864)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(200046390539558198)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220445290569736192)
,p_plug_name=>unistr('Datos B\00E1sicos')
,p_parent_plug_id=>wwv_flow_api.id(220446033451736199)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P130_ID_SLCTUD'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220446113554736200)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(217589280534768493)
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
'and         a.id_prscrpcion                 =   :P130_ID_PRSCRPCION',
'and         dbms_lob.getlength(c.file_blob) >   0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(220501443913028692)
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
 p_id=>wwv_flow_api.id(220501483595028693)
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
 p_id=>wwv_flow_api.id(220501599838028694)
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
 p_id=>wwv_flow_api.id(220501734609028695)
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
 p_id=>wwv_flow_api.id(220501782106028696)
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
 p_id=>wwv_flow_api.id(220501929397028697)
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
 p_id=>wwv_flow_api.id(220446200544736201)
,p_internal_uid=>220446200544736201
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
 p_id=>wwv_flow_api.id(220499978450938516)
,p_interactive_grid_id=>wwv_flow_api.id(220446200544736201)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(220500082217938517)
,p_report_id=>wwv_flow_api.id(220499978450938516)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220507384232028848)
,p_view_id=>wwv_flow_api.id(220500082217938517)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(220501443913028692)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220507902405028851)
,p_view_id=>wwv_flow_api.id(220500082217938517)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(220501483595028693)
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
 p_id=>wwv_flow_api.id(220508420514028853)
,p_view_id=>wwv_flow_api.id(220500082217938517)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(220501599838028694)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220508900907028854)
,p_view_id=>wwv_flow_api.id(220500082217938517)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(220501734609028695)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>3
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220512410758057364)
,p_view_id=>wwv_flow_api.id(220500082217938517)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(220501782106028696)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(220512873812057369)
,p_view_id=>wwv_flow_api.id(220500082217938517)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(220501929397028697)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(225621933102640694)
,p_plug_name=>'Observaciones'
,p_parent_plug_id=>wwv_flow_api.id(217589280534768493)
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
'and         a.id_prscrpcion =   :P130_ID_PRSCRPCION;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(225796773903243396)
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
 p_id=>wwv_flow_api.id(225796896009243397)
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
 p_id=>wwv_flow_api.id(225796968164243398)
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
 p_id=>wwv_flow_api.id(225797082615243399)
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
 p_id=>wwv_flow_api.id(225797169723243400)
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
 p_id=>wwv_flow_api.id(225797446881243402)
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
 p_id=>wwv_flow_api.id(225796738409243395)
,p_internal_uid=>225796738409243395
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
 p_id=>wwv_flow_api.id(225815459451348205)
,p_interactive_grid_id=>wwv_flow_api.id(225796738409243395)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(225815465008348205)
,p_report_id=>wwv_flow_api.id(225815459451348205)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225815990323348209)
,p_view_id=>wwv_flow_api.id(225815465008348205)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(225796773903243396)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225816462518348213)
,p_view_id=>wwv_flow_api.id(225815465008348205)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(225796896009243397)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225817027242348214)
,p_view_id=>wwv_flow_api.id(225815465008348205)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(225796968164243398)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>232
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225817533412348216)
,p_view_id=>wwv_flow_api.id(225815465008348205)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(225797082615243399)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>172
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225818020705348217)
,p_view_id=>wwv_flow_api.id(225815465008348205)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(225797169723243400)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>224
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(225825776190368385)
,p_view_id=>wwv_flow_api.id(225815465008348205)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(225797446881243402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(284934671448168848)
,p_plug_name=>unistr('Datos B\00E1sicos')
,p_parent_plug_id=>wwv_flow_api.id(217589280534768493)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105839306378902716)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(173266923273345754)
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(96929179121662631)
,p_branch_name=>'Actualizar Pagina'
,p_branch_action=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:RP,83::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105873835016245901)
,p_name=>'P130_ID_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(201773899091367343)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121672187334345530)
,p_name=>'P130_NMRO_PRSCRPCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(284934671448168848)
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
 p_id=>wwv_flow_api.id(121672572503345534)
,p_name=>'P130_ID_PRSCRPCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(284934671448168848)
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
,p_read_only_when=>'P130_ID_PRSCRPCION_TPO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121672926812345538)
,p_name=>'P130_TTAL_SJTOS_TRBTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(284934671448168848)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121673308588345547)
,p_name=>'P130_ID_INSTNCIA_FLJO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(284934671448168848)
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
 p_id=>wwv_flow_api.id(121673601805345547)
,p_name=>'P130_FCHA_FLJO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(284934671448168848)
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
 p_id=>wwv_flow_api.id(121674053201345547)
,p_name=>'P130_DSCRPCION_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(284934671448168848)
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
 p_id=>wwv_flow_api.id(121674424678345547)
,p_name=>'P130_FCHA_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(284934671448168848)
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
 p_id=>wwv_flow_api.id(121674862812345548)
,p_name=>'P130_ID_PRSCRPCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(284934671448168848)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121678752344345592)
,p_name=>'P130_ID_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(220445290569736192)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121679143914345596)
,p_name=>'P130_ID_INSTNCIA_FLJO_PQR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(220445290569736192)
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
 p_id=>wwv_flow_api.id(121679587440345596)
,p_name=>'P130_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(220445290569736192)
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
 p_id=>wwv_flow_api.id(121679925669345596)
,p_name=>'P130_FCHA_RDCDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(220445290569736192)
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
 p_id=>wwv_flow_api.id(121680344725345597)
,p_name=>'P130_FCHA_LMTE_LEY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(220445290569736192)
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
 p_id=>wwv_flow_api.id(121712978294364301)
,p_computation_sequence=>10
,p_computation_item=>'P130_TTAL_SJTOS_TRBTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count(*)',
'from    gf_g_prscrpcnes_sjto_impsto a',
'where   a.id_prscrpcion =   :P130_ID_PRSCRPCION;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(105804366013232702)
,p_name=>'Al cerrar observaciones btn'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(105839306378902716)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(121811543937646001)
,p_event_id=>wwv_flow_api.id(105804366013232702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(225621933102640694)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(121811611041646002)
,p_name=>'Al cerrar observaciones'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(225621933102640694)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(121811772987646003)
,p_event_id=>wwv_flow_api.id(121811611041646002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(225621933102640694)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107669460963046801)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Confirmar Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'    v_json           clob;',
'begin',
'    v_json := ''{"ID_PRSCRPCION" : ''||:P113_ID_PRSCRPCION||'',',
'                "ID_DCMNTO"     : ''||:P130_ID_DCMNTO||'',',
'                "ID_USRIO"      : ''||:F_ID_USRIO||'',',
'                "TPO_OPCION"    :  "P"',
'               }'';    ',
'    pkg_gf_prescripcion.prc_rg_prscrpcion_actos(p_cdgo_clnte	=>	:F_CDGO_CLNTE,',
'                                                p_json			=>	v_json,',
'                                                o_cdgo_rspsta	=>	v_cdgo_rspsta,',
'                                                o_mnsje_rspsta	=>	v_mnsje_rspsta);',
'	if (v_cdgo_rspsta <> 0) then',
'		RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta); ',
'	end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Acci\00F3n Procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105838394433900166)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Datos de Prescripci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      to_char(a.fcha_incio, ''DD/MM/YYYY''),',
'            a.id_instncia_fljo,',
'            b.id_prscrpcion,',
'            b.nmro_prscrpcion,',
'            to_char(b.fcha_rspsta, ''DD/MM/YYYY''),',
'            b.cdgo_rspsta,',
'            b.id_slctud,',
'            b.id_prscrpcion_tpo',
'into        :P130_FCHA_FLJO,',
'            :P130_ID_INSTNCIA_FLJO,',
'            :P130_ID_PRSCRPCION,',
'            :P130_NMRO_PRSCRPCION,',
'            :P130_FCHA_RSPSTA,',
'            :P130_DSCRPCION_RSPSTA,',
'            :P130_ID_SLCTUD,',
'            :P130_ID_PRSCRPCION_TPO',
'from        wf_g_instancias_flujo   a',
'left join   gf_g_prescripciones     b   on  b.id_instncia_fljo  =   a.id_instncia_fljo',
'where       a.id_instncia_fljo  =   :F_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105838624560900966)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos de solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select      a.nmro_rdcdo_dsplay,',
'                a.id_instncia_fljo,',
'                a.fcha_rdcdo,',
'                a.fcha_lmte_ley',
'    into        :P130_NMRO_RDCDO_DSPLAY,',
'                :P130_ID_INSTNCIA_FLJO_PQR,',
'                :P130_FCHA_RDCDO,',
'                :P130_FCHA_LMTE_LEY',
'    from        pq_g_solicitudes    a',
'    where       a.id_slctud     =   :P130_ID_SLCTUD;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P130_ID_SLCTUD'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(115401898388960601)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_generarDocumentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'    v_json           clob;',
'begin',
'    v_json := ''{"ID_PRSCRPCION" : ''||:P113_ID_PRSCRPCION   ||'',',
'                "ID_DCMNTO"     : ''||apex_application.g_x01||'',',
'                "ID_USRIO"      : ''||:F_ID_USRIO           ||'',',
'                "TPO_OPCION"    :  "P"',
'               }'';    ',
'    pkg_gf_prescripcion.prc_rg_prscrpcion_actos(p_cdgo_clnte	=>	:F_CDGO_CLNTE,',
'                                                p_json			=>	v_json,',
'                                                o_cdgo_rspsta	=>	v_cdgo_rspsta,',
'                                                o_mnsje_rspsta	=>	v_mnsje_rspsta);',
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
end;
/
