prompt --application/pages/page_00213
begin
wwv_flow_api.create_page(
 p_id=>213
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Panel de control'
,p_step_title=>'Panel de control'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function initTooltip(obj){',
'    return $(obj).tooltipster({ contentAsHTML: true , theme: "tooltipster-shadow" , animation: "swing" });',
'}',
'',
'function tooltipRXI() {',
'  $("#rxi .t-Card a").hover(',
'    function() {',
'        var texto = $(this).find(".t-Card-titleWrap").text();',
'        var valor ="<b>" +$(this).find(".t-Card-info").text() +"</b>";',
'        initTooltip(this).tooltipster("content", texto + " : " + valor)',
'                         .tooltipster("open");',
'    },',
'    function() {',
'        initTooltip(this).tooltipster("hide");',
'    }',
'  );',
'}',
'function buttonCollapse(id){',
'	if($(''#''+id).attr(''aria-expanded'') != ''true''){',
'		$(''#''+id).click();',
'	}',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20191212104748'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24765680228914001)
,p_plug_name=>unistr('Par\00E1metro de B\00FAsquedas')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25249107120619201)
,p_plug_name=>unistr('Total compensaci\00F3n por vigencia')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(25249240004619202)
,p_region_id=>wwv_flow_api.id(25249107120619201)
,p_chart_type=>'bar'
,p_title=>'Vigencias Compensadas'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
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
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(25249365001619203)
,p_chart_id=>wwv_flow_api.id(25249240004619202)
,p_seq=>10
,p_name=>unistr('Total compensaci\00F3n por vigencia')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.vgncia    as  vgncias,',
'        sum(nvl(b.vlor_cmpnscion,0)) as ttl_vgncias,',
'        ''<b>Vigencia:</b> '' ||b.vgncia || ''<br>'' ||',
'       ''<b>Total Compensado </b> '' || to_char(sum(nvl(b.vlor_cmpnscion,0)), :F_FRMTO_MNDA) || ''<br>'' toltip_dscrpcion_rspsta ',
'from v_gf_g_saldos_favor                 s',
'left join gf_g_sldos_fvr_cmpnscn_dtll    b   on  s.id_sldo_fvor  =   b.id_sldo_fvor',
'where   s.cdgo_clnte            =   :F_CDGO_CLNTE',
'and     s.id_impsto             =   nvl(:P213_TRBTO, s.id_impsto)',
'and     s.id_impsto_sbmpsto     =   nvl(:P213_SBTRBTO, s.id_impsto_sbmpsto)',
'and     s.cdgo_sldo_fvor_tpo    =   nvl(:P213_TPO_SLDO_FVOR, s.cdgo_sldo_fvor_tpo)',
'and     s.indcdor_rgstro        =   nvl(:P213_INDCDOR_RGSTRO, s.indcdor_rgstro)',
'and trunc(s.fcha_rcncmnto) between nvl(:P213_FCH_DSDE, trunc(s.fcha_rcncmnto)) and nvl(:P213_FCH_HSTA, trunc(s.fcha_rcncmnto))',
'and     s.indcdor_rcncdo    =   ''S''',
'and     b.vgncia is not null ',
'group by b.vgncia;'))
,p_items_value_column_name=>'TTL_VGNCIAS'
,p_items_label_column_name=>'VGNCIAS'
,p_items_short_desc_column_name=>'TOLTIP_DSCRPCION_RSPSTA'
,p_color=>'#0AFFFF'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(25249571150619205)
,p_chart_id=>wwv_flow_api.id(25249240004619202)
,p_axis=>'y'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_api.id(25249446656619204)
,p_chart_id=>wwv_flow_api.id(25249240004619202)
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
 p_id=>wwv_flow_api.id(25249695078619206)
,p_plug_name=>unistr('Total de Compensaci\00F3n por Impuesto')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(25249705626619207)
,p_region_id=>wwv_flow_api.id(25249695078619206)
,p_chart_type=>'bar'
,p_title=>'Impuestos Compensados'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
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
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(25249882827619208)
,p_chart_id=>wwv_flow_api.id(25249705626619207)
,p_seq=>10
,p_name=>unistr('Total de Compensaci\00F3n por Impuesto')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  s.nmbre_impsto    as  impsto,',
'        sum(nvl(b.vlor_cmpnscion,0)) as ttl_sldo_fvr,',
'        ''<b>Tributo:</b> '' ||s.nmbre_impsto || ''<br>'' ||',
'        ''<b>Total Compensado: </b> '' || to_char(sum(nvl(b.vlor_cmpnscion,0)), :F_FRMTO_MNDA) || ''<br>'' toltip_dscrpcion_rspsta ',
'from      v_gf_g_saldos_favor            s',
'left join gf_g_sldos_fvr_cmpnscn_dtll    b   on  s.id_sldo_fvor  =   b.id_sldo_fvor',
'where   s.cdgo_clnte                     =   :F_CDGO_CLNTE',
'and     s.id_impsto                      =   nvl(:P213_TRBTO, s.id_impsto)',
'and     s.id_impsto_sbmpsto              =   nvl(:P213_SBTRBTO, s.id_impsto_sbmpsto)',
'and     s.cdgo_sldo_fvor_tpo             =   nvl(:P213_TPO_SLDO_FVOR, s.cdgo_sldo_fvor_tpo)',
'and     s.indcdor_rgstro                 =   nvl(:P213_INDCDOR_RGSTRO, s.indcdor_rgstro)',
'and trunc(s.fcha_rcncmnto) between nvl(:P213_FCH_DSDE, trunc(s.fcha_rcncmnto)) and nvl(:P213_FCH_HSTA, trunc(s.fcha_rcncmnto))',
'group by s.nmbre_impsto',
'having sum(nvl(b.vlor_cmpnscion,0)) > 0;'))
,p_items_value_column_name=>'TTL_SLDO_FVR'
,p_items_label_column_name=>'IMPSTO'
,p_items_short_desc_column_name=>'TOLTIP_DSCRPCION_RSPSTA'
,p_color=>'#2466FF'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(25249982965619209)
,p_chart_id=>wwv_flow_api.id(25249705626619207)
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
 p_id=>wwv_flow_api.id(25250026858619210)
,p_chart_id=>wwv_flow_api.id(25249705626619207)
,p_axis=>'y'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_api.id(25250194549619211)
,p_plug_name=>'Total Saldo a Favor por Tipo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(25250200037619212)
,p_region_id=>wwv_flow_api.id(25250194549619211)
,p_chart_type=>'bar'
,p_title=>'Total Saldo a Favor por Tipo'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
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
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(25250306298619213)
,p_chart_id=>wwv_flow_api.id(25250200037619212)
,p_seq=>10
,p_name=>'Total'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  s.nmbre_sldo_fvor_tpo   as  tpo_sldo_fvor,',
'        sum(s.vlor_sldo_fvor)   as ttl_sldo_fvr,',
'        ''<b>Origen:</b> '' || s.nmbre_sldo_fvor_tpo || ''<br>'' ||',
'        ''<b>Total: </b> '' || to_char(sum(s.vlor_sldo_fvor), :F_FRMTO_MNDA) || ''<br>'' toltip_dscrpcion_rspsta ',
'from v_gf_g_saldos_favor            s',
'where   s.cdgo_clnte            =   :F_CDGO_CLNTE',
'and     s.id_impsto             =   nvl(:P213_TRBTO, s.id_impsto)',
'and     s.id_impsto_sbmpsto     =   nvl(:P213_SBTRBTO, s.id_impsto_sbmpsto)',
'and     s.cdgo_sldo_fvor_tpo    =   nvl(:P213_TPO_SLDO_FVOR, s.cdgo_sldo_fvor_tpo)',
'and     s.indcdor_rgstro        =   nvl(:P213_INDCDOR_RGSTRO, s.indcdor_rgstro)',
'and trunc(s.fcha_rcncmnto) between nvl(:P213_FCH_DSDE, trunc(s.fcha_rcncmnto)) and nvl(:P213_FCH_HSTA, trunc(s.fcha_rcncmnto))',
'and     s.indcdor_rcncdo    =   ''S''',
'group by s.nmbre_sldo_fvor_tpo;',
''))
,p_items_value_column_name=>'TTL_SLDO_FVR'
,p_items_label_column_name=>'TPO_SLDO_FVOR'
,p_items_short_desc_column_name=>'TOLTIP_DSCRPCION_RSPSTA'
,p_color=>'#FFAD0A'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(25250591708619215)
,p_chart_id=>wwv_flow_api.id(25250200037619212)
,p_axis=>'y'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_api.id(25250438450619214)
,p_chart_id=>wwv_flow_api.id(25250200037619212)
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
 p_id=>wwv_flow_api.id(47243453342108505)
,p_plug_name=>'Saldos a Favor Reconocidos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(47243560742108506)
,p_region_id=>wwv_flow_api.id(47243453342108505)
,p_chart_type=>'lineWithArea'
,p_title=>'Saldos a Favor Reconocidos'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
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
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(47243651604108507)
,p_chart_id=>wwv_flow_api.id(47243560742108506)
,p_seq=>10
,p_name=>'Saldos a Favor'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(t.fcha_rcncmnto, ''DD/MM/YYYY'') fcha_formatiada,',
'       to_char(t.fcha_rcncmnto, ''DD/MM/YYYY''),',
'       sum(t.vlor_sldo_fvor),',
unistr('       ''<b>Total T\00EDtulo Ejecutivo</b>'),
'        <b>Fecha: </b> '' ||to_char(t.fcha_rcncmnto, ''DD/MM/YYYY'') || ''<br>'' ||',
'        ''<b>Total: </b> '' || nvl(to_char(sum(t.vlor_sldo_fvor), :F_FRMTO_MNDA),0) || ''<br>'' toltip_vlor_fcha ',
'from v_gf_g_saldos_favor t',
'where   t.cdgo_clnte            =   :F_CDGO_CLNTE',
'and     t.id_impsto             =   nvl(:P213_TRBTO, t.id_impsto)',
'and     t.id_impsto_sbmpsto     =   nvl(:P213_SBTRBTO, t.id_impsto_sbmpsto)',
'and     t.cdgo_sldo_fvor_tpo    =   nvl(:P213_TPO_SLDO_FVOR, t.cdgo_sldo_fvor_tpo)',
'and     t.indcdor_rgstro        =   nvl(:P213_INDCDOR_RGSTRO, t.indcdor_rgstro)',
'and trunc(t.fcha_rcncmnto) between nvl(:P213_FCH_DSDE, trunc(t.fcha_rcncmnto)) and nvl(:P213_FCH_HSTA, trunc(t.fcha_rcncmnto))',
'and     t.indcdor_rcncdo    =   ''S'' group by to_char(t.fcha_rcncmnto, ''DD/MM/YYYY''), to_char(t.fcha_rcncmnto, ''DD/MM/YYYY'');'))
,p_items_value_column_name=>'SUM(T.VLOR_SLDO_FVOR)'
,p_items_label_column_name=>'TO_CHAR(T.FCHA_RCNCMNTO,''DD/MM/YYYY'')'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(47243753569108508)
,p_chart_id=>wwv_flow_api.id(47243560742108506)
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
 p_id=>wwv_flow_api.id(47243831295108509)
,p_chart_id=>wwv_flow_api.id(47243560742108506)
,p_axis=>'y'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_api.id(119925206491039713)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(165180500890386130)
,p_plug_name=>'Totales'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24766506020914010)
,p_plug_name=>'Total de Saldos a Favor'
,p_parent_plug_id=>wwv_flow_api.id(165180500890386130)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(a.id_sldo_fvor),',
'        ''Total Saldo a favor Gestionados'' title ',
'from v_gf_g_saldos_favor            a',
'where   a.cdgo_clnte                =   :F_CDGO_CLNTE',
'and     a.id_impsto                 =   nvl(:P213_TRBTO, a.id_impsto)',
'and     a.id_impsto_sbmpsto         =   nvl(:P213_SBTRBTO, a.id_impsto_sbmpsto)',
'and     a.cdgo_sldo_fvor_tpo        =   nvl(:P213_TPO_SLDO_FVOR, a.cdgo_sldo_fvor_tpo)',
'and     a.indcdor_rgstro            =   nvl(:P213_INDCDOR_RGSTRO, a.indcdor_rgstro)',
'and     a.indcdor_rcncdo            =   ''S''',
'and trunc(a.fcha_rgstro) between nvl(:P213_FCH_DSDE, trunc(a.fcha_rgstro)) and nvl(:P213_FCH_HSTA, trunc(a.fcha_rgstro));'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'COUNT(A.ID_SLDO_FVOR)'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153125290174550201)
,p_plug_name=>'Total Saldos a Favor Devueltos'
,p_parent_plug_id=>wwv_flow_api.id(165180500890386130)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  to_char(nvl(sum(nvl(b.vlor_dvlcion,0)),0), :F_FRMTO_MNDA) as ttl_dvlcion,',
'       ''Total Saldo a favor Devueltos'' title ',
'from v_gf_g_saldos_favor   a',
'join gf_g_sldos_fvr_dvlcion_dtll    b  on  a.id_sldo_fvor = b.id_sldo_fvor',
'where   a.cdgo_clnte            =   :F_CDGO_CLNTE',
'and     a.id_impsto             =   nvl(:P213_TRBTO, a.id_impsto)',
'and     a.id_impsto_sbmpsto     =   nvl(:P213_SBTRBTO, a.id_impsto_sbmpsto)',
'and     a.cdgo_sldo_fvor_tpo    =   nvl(:P213_TPO_SLDO_FVOR, a.cdgo_sldo_fvor_tpo)',
'and     a.indcdor_rgstro        =   nvl(:P213_INDCDOR_RGSTRO, a.indcdor_rgstro)',
'and trunc(a.fcha_rcncmnto) between nvl(:P213_FCH_DSDE, trunc(a.fcha_rcncmnto)) and nvl(:P213_FCH_HSTA, trunc(a.fcha_rcncmnto));',
'',
'',
'',
' '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TTL_DVLCION'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(154869464306049107)
,p_plug_name=>'Total Saldos a Favor Compensados'
,p_parent_plug_id=>wwv_flow_api.id(165180500890386130)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    to_char(nvl(sum(nvl(b.vlor_cmpnscion, 0)),0), :F_FRMTO_MNDA)  as ttl_cmpnsdo,',
'        ''Total Saldo a favor Compensado'' title',
'from v_gf_g_saldos_favor            a',
'join gf_g_sldos_fvr_cmpnscn_dtll    b  on  a.id_sldo_fvor = b.id_sldo_fvor',
'where   a.cdgo_clnte            =   :F_CDGO_CLNTE',
'and     a.id_impsto             =   nvl(:P213_TRBTO, a.id_impsto)',
'and     a.id_impsto_sbmpsto     =   nvl(:P213_SBTRBTO, a.id_impsto_sbmpsto)',
'and     a.cdgo_sldo_fvor_tpo    =   nvl(:P213_TPO_SLDO_FVOR, a.cdgo_sldo_fvor_tpo)',
'and     a.indcdor_rgstro        =   nvl(:P213_INDCDOR_RGSTRO, a.indcdor_rgstro)',
'and trunc(a.fcha_rcncmnto) between nvl(:P213_FCH_DSDE, trunc(a.fcha_rcncmnto)) and nvl(:P213_FCH_HSTA, trunc(a.fcha_rcncmnto));'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TTL_CMPNSDO'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(154869585830049108)
,p_plug_name=>'Total Saldo a Favor Compensado Devueltos'
,p_parent_plug_id=>wwv_flow_api.id(165180500890386130)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  to_char(nvl(sum(nvl(b.vlor_cmpnscion, 0) + nvl(c.vlor_dvlcion, 0)),0), :F_FRMTO_MNDA) as ttl_cmpnscion_dvlcion,',
'       ''Total Saldo a favor Compensados y Devueltos'' title',
'from v_gf_g_saldos_favor              a',
'left join gf_g_sldos_fvr_cmpnscn_dtll b on A.ID_SLDO_FVOR = B.ID_SLDO_FVOR',
'left join gf_g_sldos_fvr_dvlcion_dtll c on A.ID_SLDO_FVOR = c.ID_SLDO_FVOR',
'where   a.cdgo_clnte            =   :F_CDGO_CLNTE',
'and     a.id_impsto             =   nvl(:P213_TRBTO, a.id_impsto)',
'and     a.id_impsto_sbmpsto     =   nvl(:P213_SBTRBTO, a.id_impsto_sbmpsto)',
'and     a.cdgo_sldo_fvor_tpo    =   nvl(:P213_TPO_SLDO_FVOR, a.cdgo_sldo_fvor_tpo)',
'and     a.indcdor_rgstro        =   nvl(:P213_INDCDOR_RGSTRO, a.indcdor_rgstro)',
'and trunc(a.fcha_rcncmnto) between nvl(:P213_FCH_DSDE, trunc(a.fcha_rcncmnto)) and nvl(:P213_FCH_HSTA, trunc(a.fcha_rcncmnto));'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TTL_CMPNSCION_DVLCION'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(273795489022048305)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            ',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'',
unistr('Funcionalidad que permite consultar informaci\00F3n de los saldos a favor gestionados en el sistema.<br><br>'),
'<b>1.</b> Muestra un total de saldos a favor gestionados.<br><br>',
unistr('<b>Total de compensaci\00F3n por vigencia:<br><br> </b>'),
'<b>1.</b>Muestra el valor total que se ha compensado en cada vigencia.</b><br><br>',
unistr('<b>Total de compensaci\00F3n por Impuesto:<br><br> </b>'),
'<b>1.</b>Muestra el valor total que se ha compensado al impuesto.</b><br><br>',
'<b>Total de saldos a favor por origen:<br><br> </b>',
'<b>1.</b>Muestra el valor total de los saldos a favor de los distintos origenes.</b><br><br>',
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'Barra de Herramientas de Desarrollador         ',
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25473279566333298)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(119925206491039713)
,p_button_name=>'BTN_RGRSAR'
,p_button_static_id=>'Btn_Proyeccion'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:115:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24766400554914009)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(24765680228914001)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24765775729914002)
,p_name=>'P213_TRBTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(24765680228914001)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24765811630914003)
,p_name=>'P213_SBTRBTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(24765680228914001)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P213_TRBTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P213_TRBTO'
,p_ajax_items_to_submit=>'P213_SBTRBTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24765967987914004)
,p_name=>'P213_TPO_SLDO_FVOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(24765680228914001)
,p_prompt=>'Tipo Saldo a Favor'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.nmbre as d,',
'       s.cdgo_sldo_fvor_tpo as r',
'from gf_d_saldos_favor_tipo s;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24766151893914006)
,p_name=>'P213_INDCDOR_RGSTRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(24765680228914001)
,p_prompt=>'Registro'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'STATIC:Automatico;A,Manual;M'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24766232363914007)
,p_name=>'P213_FCH_DSDE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(24765680228914001)
,p_prompt=>'Fecha desde '
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24766357330914008)
,p_name=>'P213_FCH_HSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(24765680228914001)
,p_prompt=>'Fecha hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(117058441683519411)
,p_name=>'Al modificar Fecha desde'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P213_FECHA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(117058584450519412)
,p_event_id=>wwv_flow_api.id(117058441683519411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P213_FECHA_HASTA").datepicker( ''option'' , ''minDate'' , $("#P213_FECHA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47243200682108503)
,p_name=>'Al cambiar la fecha'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P213_FCH_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47243320931108504)
,p_event_id=>wwv_flow_api.id(47243200682108503)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P213_FCH_HSTA").datepicker( ''option'' , ''minDate'' , $("#P213_FCH_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
