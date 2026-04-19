prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Comparativos'
,p_step_title=>'Comparativos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1;'))
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
'	if($(''#''+id).attr(''aria-expanded'') != ''false''){',
'		$(''#''+id).click();',
'	}',
'}',
'',
'function setText(){',
'    $(''#rx2_heading'').text($(''#rx2_heading'').text() + ''-'' + $(''#P6_ID_IMPSTO'').select2(''data'')[0].text);',
'    /*+ ''-'' + $(''#P6_ID_IMPSTO_SBMPSTO'').select2(''data'')[0].text);*/',
'    $(''#rx3_heading'').text($(''#rx3_heading'').text() + ''-'' + $(''#P6_ID_IMPSTO'').select2(''data'')[0].text)',
' /*   $(''#rx3_heading'').text($(''#rx3_heading'').text() +  ''-'' + $(''#P6_ID_IMPSTO'').select2(''data'')[0].text) ''-'' + $(''#P6_ID_IMPSTO_SBMPSTO'').select2(''data'')[0].text);*/',
'',
'}',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});',
'buttonCollapse(''t_Button_rightControlButton'');',
'tooltipRXI();',
'setText();'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#rx0 polygon{',
'    stroke: #309fdb;',
'    stroke-width: 1px;',
'}',
'',
'#rx1 polygon{',
'    stroke: #309fdb;',
'    stroke-width: 1px;',
'}',
'',
'#rx10 polygon{',
'    stroke: #309fdb;',
'    stroke-width: 1px;',
'}',
'',
'#rx2 polygon{',
'    stroke: #309fdb;',
'    stroke-width: 1px;',
'}',
'',
'#rx3 polygon{',
'  stroke: #309fdb;',
'    stroke-width: 1px;',
'}',
'',
'#rx4 polygon{',
'    stroke: #0CEDB5;',
'    stroke-width: 1px;}',
'',
'#rx5 polygon{',
'    stroke: #0CEDB5;',
'    stroke-width: 1px;}',
'#rx6 polygon{',
'    stroke: #0CEDB5;',
'   stroke-width: 1px;',
'}',
'#rx7 polygon{',
'    stroke: #309fdb;',
' stroke-width: 1px;',
'}',
'',
'comparar{',
'',
'}',
''))
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210531161735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24474981141711301)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86110229944432802)
,p_plug_name=>unistr('Parametros de Comparaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(24474981141711301)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:margin-right-md'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86863239550219501)
,p_plug_name=>'Ajustes Totales Aplicados - &P6_VIGENCIA_INICIAL. - &P6_VIGENCIA_FINAL.'
,p_region_name=>'rx1'
,p_parent_plug_id=>wwv_flow_api.id(24474981141711301)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(86863393352219502)
,p_region_id=>wwv_flow_api.id(86863239550219501)
,p_chart_type=>'bar'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(86863478417219503)
,p_chart_id=>wwv_flow_api.id(86863393352219502)
,p_static_id=>'rx4'
,p_seq=>10
,p_name=>'Total Ajuste Aplicados'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select sum(a.VLOR_AJSTE) mnto_ttal,',
'        to_char(extract(year from a.fcha)) as etiqueta_ajste_ttal,',
'	''<b>Ajustes Total Aplicados:</b> $''  || to_char(sum(a.VLOR_AJSTE), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_ajste_estado--,',
' --   b.cdgo_tpo_ajste    ',
'  from v_gf_g_ajuste_detalle a',
'  join v_gf_g_ajustes b on a.id_ajste = b.id_ajste',
'   where extract(year from a.fcha) between :P6_VIGENCIA_INICIAL and  :P6_VIGENCIA_FINAL',
'   and b.cdgo_ajste_estdo=''AP''',
' --  and b.cdgo_tpo_ajste=''CR''',
'   and b.cdgo_clnte = :F_CDGO_CLNTE',
'   group by extract(year from a.fcha)--,b.cdgo_tpo_ajste',
'   order by  extract(year from a.fcha) asc*/',
'   ',
'   select b.vgncia,',
'   :P6_VIGENCIA_INICIAL,',
'   :P6_VIGENCIA_FINAL,',
'   sum(b.VLOR_AJSTE) mnto_ttal,',
'   b.vgncia as etiqueta_ajste_ttal,',
'	  ''<b>Ajustes Total Aplicados:</b> ''  || to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_ajste_estado--,',
'  from ',
'  v_gf_g_ajustes  a',
'  join v_gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'    where b.vgncia between :P6_VIGENCIA_INICIAL and  :P6_VIGENCIA_FINAL',
'	 and a.cdgo_clnte           = :F_CDGO_CLNTE',
'     and a.id_impsto            = nvl(:P6_ID_IMPSTO,a.id_impsto)',
'     and a.id_impsto_sbmpsto    = nvl(:P6_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'     and a.cdgo_ajste_estdo=''AP''',
'	group by b.vgncia',
'    order by b.vgncia asc;',
'   ',
''))
,p_ajax_items_to_submit=>'P6_VIGENCIA_INICIAL,P6_VIGENCIA_FINAL'
,p_items_value_column_name=>'MNTO_TTAL'
,p_items_label_column_name=>'ETIQUETA_AJSTE_TTAL'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE_ESTADO'
,p_color=>'RGBA(48, 159, 219, 0.8)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP:P4_VIGENCIA_INICIAL,P4_VIGENCIA_FINAL,P4_VIGENCIA:&P6_VIGENCIA_INICIAL.,&P6_VIGENCIA_FINAL.,&VGNCIA.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(86863506526219504)
,p_chart_id=>wwv_flow_api.id(86863393352219502)
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
 p_id=>wwv_flow_api.id(86863685169219505)
,p_chart_id=>wwv_flow_api.id(86863393352219502)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'currency'
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
 p_id=>wwv_flow_api.id(86924890911613411)
,p_plug_name=>unistr('Ajustes Totales Aplicados Cr\00E9dito - &P6_VIGENCIA_INICIAL. - &P6_VIGENCIA_FINAL.')
,p_region_name=>'rx2'
,p_parent_plug_id=>wwv_flow_api.id(24474981141711301)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(86924996315613412)
,p_region_id=>wwv_flow_api.id(86924890911613411)
,p_chart_type=>'bar'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(86925060526613413)
,p_chart_id=>wwv_flow_api.id(86924996315613412)
,p_static_id=>'rx5'
,p_seq=>10
,p_name=>unistr('Total Ajuste Aplicados Cr\00E9dito')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select sum(a.VLOR_AJSTE) mnto_ttal,',
'        to_char(extract(year from a.fcha)) as etiqueta_ajste_ttal,',
'	''<b>Ajustes Total Aplicados:</b> $''  || to_char(sum(a.VLOR_AJSTE), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_ajste_estado,',
'      b.cdgo_tpo_ajste ',
'  from v_gf_g_ajuste_detalle a',
'  join v_gf_g_ajustes b on a.id_ajste = b.id_ajste',
' --  where  extract(year from a.fcha)=:P6_VIGENCIA_INICIAL',
'   where extract(year from a.fcha)  between :P6_VIGENCIA_INICIAL and :P6_VIGENCIA_FINAL ',
'   and  extract(month from a.fcha) = nvl(:P6_VIGENCIA_FINAL_MES, extract(month from a.fcha))  ',
'   and b.cdgo_ajste_estdo=''AP''',
'   and b.cdgo_tpo_ajste=''CR''',
'   and b.cdgo_clnte = :F_CDGO_CLNTE',
'   group by extract(year from a.fcha),b.cdgo_tpo_ajste ',
'   order by extract(year from a.fcha) asc */',
'',
'   select b.vgncia,',
'    :P6_VIGENCIA_INICIAL,',
'   :P6_VIGENCIA_FINAL,',
'   sum(b.VLOR_AJSTE) mnto_ttal,',
'      b.vgncia as etiqueta_ajste_ttal,',
'	  ''<b>Ajustes Total Aplicados:</b> ''  || to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_ajste_estado--,',
'  from ',
'  v_gf_g_ajustes  a',
'  join v_gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'    where b.vgncia between :P6_VIGENCIA_INICIAL and  :P6_VIGENCIA_FINAL',
'	 and a.cdgo_clnte = :F_CDGO_CLNTE',
'     and a.id_impsto        = nvl(:P6_ID_IMPSTO,a.id_impsto)',
'     and a.id_impsto_sbmpsto= nvl(:P6_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'	 and a.cdgo_ajste_estdo=''AP''',
'    and a.cdgo_tpo_ajste=''CR''',
'	group by b.vgncia',
'    order by b.vgncia asc;',
'   ',
'   '))
,p_ajax_items_to_submit=>'P6_VIGENCIA_INICIAL,P6_VIGENCIA_FINAL,P6_ID_IMPSTO,P6_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'MNTO_TTAL'
,p_items_label_column_name=>'ETIQUETA_AJSTE_TTAL'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE_ESTADO'
,p_color=>'RGBA(48, 159, 219, 0.5)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP:P4_VIGENCIA_INICIAL,P4_CDGO_TPO_AJSTE,P4_VIGENCIA_FINAL,P4_VIGENCIA,P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:&P6_VIGENCIA_INICIAL.,CR,&P6_VIGENCIA_FINAL.,&VGNCIA.,&P6_ID_IMPSTO.,&P6_ID_IMPSTO_SBMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(86925151181613414)
,p_chart_id=>wwv_flow_api.id(86924996315613412)
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
 p_id=>wwv_flow_api.id(86925202736613415)
,p_chart_id=>wwv_flow_api.id(86924996315613412)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'currency'
,p_currency=>'COP'
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
 p_id=>wwv_flow_api.id(86925310392613416)
,p_plug_name=>unistr('Ajustes Totales Aplicados D\00E9bito - &P6_VIGENCIA_INICIAL. - &P6_VIGENCIA_FINAL.')
,p_region_name=>'rx3'
,p_parent_plug_id=>wwv_flow_api.id(24474981141711301)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(86925440314613417)
,p_region_id=>wwv_flow_api.id(86925310392613416)
,p_chart_type=>'bar'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(86925519644613418)
,p_chart_id=>wwv_flow_api.id(86925440314613417)
,p_seq=>10
,p_name=>unistr('Total Ajuste Aplicados D\00E9bito')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select sum(a.VLOR_AJSTE) mnto_ttal,',
'        to_char(extract(year from a.fcha)) as etiqueta_ajste_ttal,',
'	''<b>Ajustes Total Aplicados:</b> $''  || to_char(sum(a.VLOR_AJSTE), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_ajste_estado,',
'      b.cdgo_tpo_ajste',
'  from v_gf_g_ajuste_detalle a',
'  join v_gf_g_ajustes b on a.id_ajste = b.id_ajste',
' --  where  extract(year from a.fcha)=:P6_VIGENCIA_INICIAL',
'   where extract(year from a.fcha) between  :P6_VIGENCIA_INICIAL  and :P6_VIGENCIA_FINAL',
'   and  extract(month from a.fcha) = nvl(:P6_VIGENCIA_FINAL_MES, extract(month from a.fcha))  ',
'   and b.cdgo_ajste_estdo=''AP''',
'   and b.cdgo_tpo_ajste=''DB''',
'   and b.cdgo_clnte = :F_CDGO_CLNTE',
'  group by extract(year from a.fcha),b.cdgo_tpo_ajste ',
'   order by extract(year from a.fcha) asc*/',
'select b.vgncia,',
'      :P6_VIGENCIA_INICIAL,',
'      :P6_VIGENCIA_FINAL,  ',
'      sum(b.VLOR_AJSTE) mnto_ttal,',
'      b.vgncia as etiqueta_ajste_ttal,',
'	  ''<b>Ajustes Total Aplicados:</b> ''  || to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_ajste_estado--,',
'  from ',
'  v_gf_g_ajustes  a',
'  join v_gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'    where b.vgncia between :P6_VIGENCIA_INICIAL and  :P6_VIGENCIA_FINAL',
'	 and a.cdgo_clnte = :F_CDGO_CLNTE',
'     and a.id_impsto        = nvl(:P6_ID_IMPSTO,a.id_impsto)',
'     and a.id_impsto_sbmpsto= nvl(:P6_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'	 and a.cdgo_ajste_estdo=''AP''',
'   and a.cdgo_tpo_ajste=''DB''',
'	group by b.vgncia',
'    order by b.vgncia asc;',
'',
''))
,p_ajax_items_to_submit=>'P6_VIGENCIA_INICIAL,P6_VIGENCIA_FINAL,P6_ID_IMPSTO,P6_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'MNTO_TTAL'
,p_items_label_column_name=>'ETIQUETA_AJSTE_TTAL'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE_ESTADO'
,p_color=>'RGB(12,237,181,0.2)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP:P4_VIGENCIA_INICIAL,P4_CDGO_TPO_AJSTE,P4_VIGENCIA_FINAL,P4_VIGENCIA,P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:&P6_VIGENCIA_INICIAL.,DB,&P6_VIGENCIA_FINAL.,&VGNCIA.,&P6_ID_IMPSTO.,&P6_ID_IMPSTO_SBMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(86925765394613420)
,p_chart_id=>wwv_flow_api.id(86925440314613417)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'currency'
,p_currency=>'COP'
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
 p_id=>wwv_flow_api.id(86925636403613419)
,p_chart_id=>wwv_flow_api.id(86925440314613417)
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
 p_id=>wwv_flow_api.id(86926462073613427)
,p_plug_name=>unistr('Ajustes D\00E9bito Vigencia - &P6_VIGENCIA_INICIAL.  - &P6_VIGENCIA_FINAL.')
,p_parent_plug_id=>wwv_flow_api.id(24474981141711301)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(86926524715613428)
,p_region_id=>wwv_flow_api.id(86926462073613427)
,p_chart_type=>'pie'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'percent'
,p_value_decimal_places=>2
,p_value_numeric_pattern=>'##.##.##'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(86926637702613429)
,p_chart_id=>wwv_flow_api.id(86926524715613428)
,p_seq=>10
,p_name=>unistr('Estado Ajuste D\00E9bito  Inicial')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select  DSCRPCION_ESTADO,count(DSCRPCION_ESTADO) , CDGO_AJSTE_ESTDO,CDGO_TPO_AJSTE,',
'''<b>Descripcion:</b> '' ||DSCRPCION_ESTADO|| ''<br>'' ||',
'''<b>Ajustes Credito:</b> ''  || count(DSCRPCION_ESTADO) || ''<br>'' toltip_ajste_estado,',
'to_char(extract(year from fcha)) as etiqueta_fecha_ttal',
'from v_gf_g_ajustes ',
'where  extract(year from fcha)=:P6_VIGENCIA_INICIAL',
'   and  extract(month from fcha) = nvl(:P6_VIGENCIA_FINAL_MES, extract(month from fcha))  ',
'   and cdgo_tpo_ajste =''DB'' and cdgo_clnte = :F_CDGO_CLNTE',
'group by dscrpcion_estado,cdgo_ajste_estdo,cdgo_tpo_ajste,to_char(extract(year from fcha));*/',
'select ',
' :P6_VIGENCIA_INICIAL,',
'   :P6_VIGENCIA_FINAL,',
'b.vgncia,',
'sum(b.VLOR_AJSTE),',
'''<b>Vigencia:</b> '' ||b.vgncia|| ''<br>'' ||',
unistr('''<b>Ajustes D\00E9bito:</b> ''  ||  to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''')|| ''<br>'' toltip_ajste_estado,'),
'',
'''Vigencia ''|| b.vgncia || '' -  Total: ''  ||  to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') etiqueta',
'--b.vgncia || '' - '' || sum(b.VLOR_AJSTE) etiqueta',
'from v_gf_g_ajustes  a',
'join v_gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'where b.vgncia between :P6_VIGENCIA_INICIAL and  :P6_VIGENCIA_FINAL',
'and a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_impsto        = nvl(:P6_ID_IMPSTO,a.id_impsto)',
'and a.id_impsto_sbmpsto= nvl(:P6_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'and a.cdgo_ajste_estdo=''AP''',
'and a.cdgo_tpo_ajste=''DB''',
'group by b.vgncia',
'  order by b.vgncia asc;'))
,p_ajax_items_to_submit=>'P6_VIGENCIA_INICIAL,P6_VIGENCIA_FINAL,P6_ID_IMPSTO,P6_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'SUM(B.VLOR_AJSTE)'
,p_items_label_column_name=>'ETIQUETA'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE_ESTADO'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP:P4_VIGENCIA_INICIAL,P4_CDGO_AJSTE_ESTDO,P4_CDGO_TPO_AJSTE,P4_VIGENCIA,P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:&ETIQUETA_FECHA_TTAL.,&CDGO_AJSTE_ESTDO.,DB,&VGNCIA.,&P6_ID_IMPSTO.,&P6_ID_IMPSTO_SBMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86927169790613434)
,p_plug_name=>'Ajustes Aplicados Vigencia  - &P6_VIGENCIA_INICIAL. - &P6_VIGENCIA_FINAL.'
,p_parent_plug_id=>wwv_flow_api.id(24474981141711301)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(86927267484613435)
,p_region_id=>wwv_flow_api.id(86927169790613434)
,p_chart_type=>'pie'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'percent'
,p_value_decimal_places=>2
,p_value_numeric_pattern=>'##.##.##'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(86927352268613436)
,p_chart_id=>wwv_flow_api.id(86927267484613435)
,p_seq=>10
,p_name=>'Estado Ajuste Aplicados Vigencias'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* select  DSCRPCION_ESTADO,count(DSCRPCION_ESTADO) , CDGO_AJSTE_ESTDO,CDGO_TPO_AJSTE,',
'''<b>Descripcion:</b> '' ||DSCRPCION_ESTADO|| ''<br>'' ||',
'''<b>Ajustes Credito:</b> ''  || count(DSCRPCION_ESTADO) || ''<br>'' toltip_ajste_estado,',
'to_char(extract(year from fcha)) as etiqueta_fecha_ttal',
'from v_gf_g_ajustes ',
'where  extract(year from fcha)=:P6_VIGENCIA_FINAL',
'and  extract(month from fcha) = nvl(:P6_VIGENCIA_FINAL_MES, extract(month from fcha))  ',
'   and cdgo_tpo_ajste =''CR'' and cdgo_clnte = :F_CDGO_CLNTE',
'group by dscrpcion_estado,cdgo_ajste_estdo,cdgo_tpo_ajste,to_char(extract(year from fcha)) ;*/',
'',
'select ',
'-- :P6_VIGENCIA_INICIAL,',
'--   :P6_VIGENCIA_FINAL,',
'b.vgncia,',
'sum(b.VLOR_AJSTE),',
'''<b>Vigencia:</b> '' ||b.vgncia|| ''<br>'' ||',
'''<b>Ajustes Aplicados:</b> ''  ||  to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''')|| ''<br>'' toltip_ajste_estado,',
'''Vigencia ''|| b.vgncia || '' -  Total: ''  ||  to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') etiqueta',
'from v_gf_g_ajustes  a',
'join v_gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'where b.vgncia between :P6_VIGENCIA_INICIAL and  :P6_VIGENCIA_FINAL',
'and a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_impsto        = nvl(:P6_ID_IMPSTO,a.id_impsto)',
'and a.id_impsto_sbmpsto= nvl(:P6_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'and a.cdgo_ajste_estdo=''AP''',
'',
'group by b.vgncia',
'  order by b.vgncia asc;;',
' '))
,p_ajax_items_to_submit=>'P6_VIGENCIA_INICIAL,P6_VIGENCIA_FINAL,P6_ID_IMPSTO,P6_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'SUM(B.VLOR_AJSTE)'
,p_items_label_column_name=>'ETIQUETA'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE_ESTADO'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP:P4_VIGENCIA_INICIAL,P4_VIGENCIA_FINAL,P4_VIGENCIA,P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:&P6_VIGENCIA_INICIAL.,&P6_VIGENCIA_FINAL.,&VGNCIA.,&P6_ID_IMPSTO.,&P6_ID_IMPSTO_SBMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86927836965613441)
,p_plug_name=>unistr('Ajustes Cr\00E9dito Vigencia - &P6_VIGENCIA_INICIAL.  - &P6_VIGENCIA_FINAL.')
,p_parent_plug_id=>wwv_flow_api.id(24474981141711301)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(86927950099613442)
,p_region_id=>wwv_flow_api.id(86927836965613441)
,p_chart_type=>'pie'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'percent'
,p_value_decimal_places=>2
,p_value_numeric_pattern=>'##.##.##'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(86928080366613443)
,p_chart_id=>wwv_flow_api.id(86927950099613442)
,p_seq=>10
,p_name=>'Estado Ajuste Credito Vigencia Inicial'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select  DSCRPCION_ESTADO,',
'        count(DSCRPCION_ESTADO),',
'        CDGO_AJSTE_ESTDO,',
'        CDGO_TPO_AJSTE,',
'''<b>Descripcion:</b> '' ||DSCRPCION_ESTADO|| ''<br>'' ||',
'''<b>Ajustes Credito:</b> ''  || count(DSCRPCION_ESTADO) || ''<br>'' toltip_ajste_estado,',
'to_char(extract(year from fcha)) as etiqueta_fecha_ttal',
'from v_gf_g_ajustes ',
'where  extract(year from fcha)=:P6_VIGENCIA_INICIAL',
'   and  extract(month from fcha) = nvl(:P6_VIGENCIA_FINAL_MES, extract(month from fcha))  ',
'   and cdgo_tpo_ajste =''CR'' and cdgo_clnte = :F_CDGO_CLNTE',
'group by dscrpcion_estado,cdgo_ajste_estdo,cdgo_tpo_ajste,to_char(extract(year from fcha));*/',
'',
'select  ',
' :P6_VIGENCIA_INICIAL,',
':P6_VIGENCIA_FINAL,',
'b.vgncia,',
'sum(b.VLOR_AJSTE),',
'''<b>Vigencia:</b> '' ||b.vgncia|| ''<br>'' ||',
unistr('''<b>Ajustes Cr\00E9dito:</b> ''  ||  to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''')|| ''<br>'' toltip_ajste_estado,'),
'''Vigencia ''|| b.vgncia || '' -  Total: ''  ||  to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') etiqueta',
'from v_gf_g_ajustes  a',
'join v_gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'where b.vgncia between :P6_VIGENCIA_INICIAL and  :P6_VIGENCIA_FINAL',
'and a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_impsto        = nvl(:P6_ID_IMPSTO,a.id_impsto)',
'and a.id_impsto_sbmpsto= nvl(:P6_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'and a.cdgo_ajste_estdo=''AP''',
'and a.cdgo_tpo_ajste=''CR''',
'group by b.vgncia',
'  order by b.vgncia asc;',
' '))
,p_ajax_items_to_submit=>'P6_VIGENCIA_INICIAL,P6_VIGENCIA_FINAL,P6_ID_IMPSTO,P6_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'SUM(B.VLOR_AJSTE)'
,p_items_label_column_name=>'ETIQUETA'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE_ESTADO'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP:P4_VIGENCIA_INICIAL,P4_CDGO_AJSTE_ESTDO,P4_CDGO_TPO_AJSTE,P4_VIGENCIA,P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:&ETIQUETA_FECHA_TTAL.,&CDGO_AJSTE_ESTDO.,CR,&VGNCIA.,&P6_ID_IMPSTO.,&P6_ID_IMPSTO_SBMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24478161386711333)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66686373469089826)
,p_plug_name=>'Reporte'
,p_parent_plug_id=>wwv_flow_api.id(24478161386711333)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120048282741064601)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'<p align="justify">',
'Esta funcionalidad permite:<br><br>',
'<b>1.</b>Comparar el Total del Valor de los Ajustes Aplicados entre el Rango de Vigencias Seleccionadas. <br><br>',
unistr('<b>2.</b>Comparar el Total del Valor de los Ajustes Aplicados Cr\00E9dito entre el Rango de Vigencias Seleccionadas. <br><br>'),
unistr('<b>3.</b>Comparar el Total del Valor de los Ajustes Aplicados D\00E9bito entre el Rango de Vigencias Seleccionadas. <br><br>'),
'<b>4.</b>Comparar el Porcentaje Total del Valor de los Ajustes Aplicados entre el Rango de Vigencias Seleccionadas. <br><br>',
unistr('<b>5.</b>Comparar el Porcentaje Total del Valor de los Ajustes Aplicados Cr\00E9dito entre el Rango de Vigencias Seleccionadas. <br><br>'),
unistr('<b>6.</b>Comparar el Porcentaje Total del Valor de los Ajustes Aplicados D\00E9bito entre el Rango de Vigencias Seleccionadas. <br><br>'),
'</p>',
'</i> ',
'',
'<br>',
unistr('<i> <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24478202577711334)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(24478161386711333)
,p_button_name=>'Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=50000:115:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86133005296637325)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(66686373469089826)
,p_button_name=>'Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86863756168219506)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(86110229944432802)
,p_button_name=>'Comparar'
,p_button_static_id=>'comparar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Comparar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-balance-scale'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(66685915416089822)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P6_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(86133005296637325)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24475077871711302)
,p_name=>'P6_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(86110229944432802)
,p_prompt=>'<b>Tributo</b>'
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
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24475330118711305)
,p_name=>'P6_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(86110229944432802)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P6_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P6_ID_IMPSTO'
,p_ajax_items_to_submit=>'P6_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66685864547089821)
,p_name=>'P6_ID_RPRTE_PRMTRO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(86110229944432802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66686192061089824)
,p_name=>'P6_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(86110229944432802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86110375984432803)
,p_name=>'P6_VIGENCIA_FINAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(86110229944432802)
,p_item_default=>':P6_VIGENCIA_INICIAL'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Vigencia Final</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(vgncia) ,to_char(vgncia)',
'from gf_g_ajuste_detalle',
'where vgncia >= :P6_VIGENCIA_INICIAL',
'order by vgncia asc;',
'',
'',
'',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P6_VIGENCIA_INICIAL'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86110411872432804)
,p_name=>'P6_VIGENCIA_INICIAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(86110229944432802)
,p_prompt=>'<b>Vigencia Inicial</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(vgncia) ,to_char(vgncia)',
'from gf_g_ajuste_detalle',
'order by vgncia asc;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86132731287635953)
,p_name=>'P6_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(66686373469089826)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ,',
'       id_rprte r',
'        from gn_d_reportes',
' where cdgo_rprte_grpo = ''AJG'''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96489926698576201)
,p_name=>'P6_VIGENCIA_FINAL_MES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(86110229944432802)
,p_prompt=>'MES'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'STATIC2:Enero;1,Febrero;2,Marzo;3,Abril;4,Mayo;5,Junio;6,Julio;7,Agosto;8,Septiembre;9,Octubre;10,Noviembre;11,Diciembre;12 '
,p_lov_display_null=>'YES'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86863804869219507)
,p_name=>'Refrescar Comparativo de Ajustes Totales Aplicados'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86863756168219506)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86863906949219508)
,p_event_id=>wwv_flow_api.id(86863804869219507)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86863239550219501)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87311166115739901)
,p_event_id=>wwv_flow_api.id(86863804869219507)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var d = $(''#rx2_heading'');',
'var txt = d.data(''texto'') ? d.data(''texto'') : d.text()',
'd.data(''texto'',  txt);',
'var valor = $(''#P6_VIGENCIA_INICIAL'').val();',
'd.text(txt + valor);',
'console.log(d);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87321957368824901)
,p_event_id=>wwv_flow_api.id(86863804869219507)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86926017699613423)
,p_name=>'Refrescar Comparativo de Ajustes Totales Aplicados Credito'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86863756168219506)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86926107413613424)
,p_event_id=>wwv_flow_api.id(86926017699613423)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86924890911613411)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86926286308613425)
,p_name=>'Refrescar Comparativo de Ajustes Totales Aplicados Debito'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86863756168219506)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86926327036613426)
,p_event_id=>wwv_flow_api.id(86926286308613425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86925310392613416)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86926909706613432)
,p_name=>'Refrescar Comparativo Estados del Ajuste Credito Vig_1'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86863756168219506)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86927053640613433)
,p_event_id=>wwv_flow_api.id(86926909706613432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86927836965613441)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86927525084613438)
,p_name=>'Refrescar Comparativo Estados del Ajuste Credito  Vig_2'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86863756168219506)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86927667134613439)
,p_event_id=>wwv_flow_api.id(86927525084613438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86927169790613434)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86928456011613447)
,p_name=>'Refrescar Comparativo Estados del Ajuste Debito Vig_1'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86863756168219506)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(86928511978613448)
,p_event_id=>wwv_flow_api.id(86928456011613447)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(86926462073613427)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(86928649743613449)
,p_name=>'Refrescar Comparativo Estados del Ajuste Debito Vig_2'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(86863756168219506)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(114795890068364001)
,p_name=>'habilitar boton imprimir'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_RPRTE'
,p_condition_element=>'P6_RPRTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114795909178364002)
,p_event_id=>wwv_flow_api.id(114795890068364001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(86133005296637325)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114796090160364003)
,p_event_id=>wwv_flow_api.id(114795890068364001)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(86133005296637325)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24475414329711306)
,p_name=>'Calcular el primer Sub impuesto'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_ID_IMPSTO'
,p_condition_element=>'P6_ID_IMPSTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24475562028711307)
,p_event_id=>wwv_flow_api.id(24475414329711306)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_ID_IMPSTO_SBMPSTO'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_impsto_sbmpsto            number;',
'    ',
'begin',
'',
'select id_impsto_sbmpsto into v_id_impsto_sbmpsto from df_i_impuestos_subimpuesto where id_impsto = :P6_ID_IMPSTO and rownum = 1;',
'return v_id_impsto_sbmpsto;',
'end;'))
,p_attribute_07=>'P6_ID_IMPSTO,P6_ID_IMPSTO_SBMPSTO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24475687989711308)
,p_name=>unistr('Guardar en sesi\00F3n el valor del sub-impuesto selccionado')
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24475730386711309)
,p_event_id=>wwv_flow_api.id(24475687989711308)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P6_ID_IMPSTO_SBMPSTO'',:P6_ID_IMPSTO_SBMPSTO);',
'END;',
''))
,p_attribute_02=>'P6_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(66685750665089820)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte             gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t(); ',
'     v_id_rprte_prmtro         gn_t_reportes_parametro.id_rprte_prmtro%type;',
'     v_json                    clob;',
'begin          ',
'    ',
'    --:P6_ID_RPRTE_PRMTRO := :F_APP_ID  || :F_ID_USRIO || :P6_RPRTE || to_char( systimestamp , ''DDMMYYYYHHMISSFF3'' );',
'   ',
'     --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P6_RPRTE;',
'',
'    v_object.put(''P_ID_IMPSTO'', :P6_ID_IMPSTO);   ',
'    v_object.put(''P_ID_IMPSTO_SBMPSTO'', :P6_ID_IMPSTO_SBMPSTO);    ',
'    v_object.put(''P_VIGENCIA_INICIAL'', :P6_VIGENCIA_INICIAL);',
'    v_object.put(''P_VIGENCIA_FINAL'', :P6_VIGENCIA_FINAL);    ',
'    v_object.put(''nmbre_rprte'', v_nmbre_rprte);',
'    ',
'    v_json   := v_object.to_clob();     ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);        ',
'        ',
'exception',
'     when no_data_found then',
'          null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(86133005296637325)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86427903066409001)
,p_process_sequence=>10
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Borrar sesion'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P6_ID_IMPSTO,P6_ID_IMPSTO_SBMPSTO,P6_VIGENCIA_INICIAL,P6_VIGENCIA_FINAL,P6_VIGENCIA_FINAL_MES,P6_RPRTE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
