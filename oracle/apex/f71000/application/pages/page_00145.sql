prompt --application/pages/page_00145
begin
wwv_flow_api.create_page(
 p_id=>145
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Prescripciones Panel Control'
,p_step_title=>'Prescripciones Panel Control'
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
'}',
'',
'var v_clres = [''#91C4EF'', ''#FFD964'', ''#9C9BF2'', ''#FFBE64'']',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'tooltipRXI();',
'',
'buttonCollapse(''t_Button_rightControlButton'');'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*.t-Cards--compact .t-Card .t-Card-title {',
'    font-style: italic;',
'    font-weight: bold;',
'    text-align: center;',
'}',
'',
'.t-Card-title, .t-ClassicCalendar-monthTitle {',
'    color: #726d6d;',
'}',
'',
'.t-Card-info {',
'    font-size: 1.1rem;',
'    line-height: 1.0rem;',
'    margin-top: 8px;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'',
'}',
'',
'',
'.t-Cards--compact .t-Card .t-Card-initials {',
'    font-size: 1.1rem;',
'    line-height: 3rem;',
'    font-weight: 200;',
'}',
'*/',
'',
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.t-Card-body {',
'    flex-grow: 21;',
'    padding: 16px;',
'    display: flex;',
'    flex-direction: inherit;',
'}',
'',
'.t-Card-info {',
'    font-size: 1.4rem;',
'    font-weight: 500;',
'}',
'',
'.t-Card-body img {',
'    width: 35px;',
'    height: 35px;',
'    border-radius: 50%;',
'}',
'',
'.t-Cards--compact .t-Card .t-Card-title {',
'    font-size: 1.4rem;',
'    line-height: 1.6rem;',
'    margin: 0;',
'    font-weight: bold;',
'    position: relative;',
'    font-style: italic;',
'    top: 50%;',
'    -webkit-transform: translateY(-50%);',
'    transform: translateY(-50%);',
'    white-space: nowrap;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222102136'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(135080847193124460)
,p_plug_name=>'Panel de Control'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>25
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24308055979560319)
,p_plug_name=>'Vigencias Solicitadas'
,p_region_name=>'rx11'
,p_parent_plug_id=>wwv_flow_api.id(135080847193124460)
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
 p_id=>wwv_flow_api.id(24308108413560320)
,p_region_id=>wwv_flow_api.id(24308055979560319)
,p_chart_type=>'bar'
,p_title=>'Vigencias Solicitadas'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
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
,p_time_axis_type=>'disabled'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(24308203870560321)
,p_chart_id=>wwv_flow_api.id(24308108413560320)
,p_seq=>10
,p_name=>'Vigencias Solicitadas'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Cantidades agrupadas por vigencias',
'select      c.vgncia,',
'            count(c.vgncia) numero_prescripciones,',
'            c.vgncia title,',
'            ''<b>Vigencia: </b>'' || c.vgncia || ''<br>'' ||',
'            ''<b>Cantidad: </b>'' || count(c.vgncia) || ''<br>'' ||',
'            ''<b>Valor Ajustes: </b>'' || nvl(to_char(sum(d.vlor_ajste), :F_FRMTO_MNDA, ''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) tooltip',
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b on    b.id_prscrpcion                =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c on    c.id_prscrpcion_sjto_impsto    =   b.id_prscrpcion_sjto_impsto',
'left  join  gf_g_ajuste_detalle         d on    d.id_ajste                     =   c.id_ajste',
'                                          and   d.vgncia                       =   c.vgncia',
'                                          and   d.id_prdo                      =   c.id_prdo',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_tpo =   nvl(:P145_ID_PRSCRPCION_TPO, a.id_prscrpcion_tpo)',
'and         b.id_impsto         =   nvl(:P145_ID_IMPSTO, b.id_impsto)',
'and         b.id_impsto_sbmpsto =   nvl(:P145_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'and         a.cdgo_rspsta       =   nvl(:P145_CDGO_RSPSTA, a.cdgo_rspsta)',
'and         a.id_usrio_rspsta   =   nvl(:P145_ID_USRIO, a.id_usrio_rspsta)',
'and         ((trunc(a.fcha_rgstro) between :P145_FECHA         and :P145_FECHA_HASTA)              or',
'             (trunc(a.fcha_rgstro) >=      :P145_FECHA         and :P145_FECHA_HASTA   is null)    or',
'             (trunc(a.fcha_rgstro) <=      :P145_FECHA_HASTA   and :P145_FECHA         is null)    or',
'             (:P145_FECHA          is      null                and :P145_FECHA_HASTA   is null ))',
'group by    c.vgncia',
'order by    c.vgncia;'))
,p_ajax_items_to_submit=>'P145_FECHA,P145_FECHA_HASTA'
,p_items_value_column_name=>'NUMERO_PRESCRIPCIONES'
,p_items_label_column_name=>'TITLE'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#91C4EF'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:134:&SESSION.::&DEBUG.:RP,134:P134_FECHA_DESDE,P134_FECHA_HASTA,P134_ID_IMPSTO,P134_ID_IMPSTO_SBMPSTO,P134_ID_PRSCRPCION_TPO,P134_CDGO_RSPSTA,P134_USRIO,P134_VGNCIA:&P145_FECHA.,&P145_FECHA_HASTA.,&P145_ID_IMPSTO.,&P145_ID_IMPSTO_SBMPSTO'
||'.,&P145_ID_PRSCRPCION_TPO.,&P145_CDGO_RSPSTA.,&P145_ID_USRIO.,&VGNCIA.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24308360728560322)
,p_chart_id=>wwv_flow_api.id(24308108413560320)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('N\00FAmero de Prescripciones')
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
 p_id=>wwv_flow_api.id(24308405352560323)
,p_chart_id=>wwv_flow_api.id(24308108413560320)
,p_static_id=>'eje_fecha_x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'date-short'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
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
 p_id=>wwv_flow_api.id(24308570262560324)
,p_plug_name=>'Respuestas de Vigencias'
,p_region_name=>'rx9'
,p_parent_plug_id=>wwv_flow_api.id(135080847193124460)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(24308619555560325)
,p_region_id=>wwv_flow_api.id(24308570262560324)
,p_chart_type=>'bar'
,p_title=>'Vigencias por Respuesta'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
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
,p_time_axis_type=>'disabled'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(24308794615560326)
,p_chart_id=>wwv_flow_api.id(24308619555560325)
,p_seq=>10
,p_name=>'Respuestas de Vigencias'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Respuestas de Vigencias',
'select      c.indcdor_aprbdo,',
'            count(c.id_prscrpcion_vgncia) numero_prescripciones,',
'            decode(c.indcdor_aprbdo, ''S'', ''Vigencias Aceptadas'', ''Vigencias Rechazadas'') title,',
'            ''<b>'' || decode(c.indcdor_aprbdo, ''S'', ''Vigencias Aceptadas'', null, ''Sin Resolver'', ''Vigencias Rechazadas'') || '':</b> '' || ',
'            count(c.id_prscrpcion_vgncia) || ''<br>'' ||',
'            ''<b>Valor Ajustes:</b> '' ||  nvl(to_char(sum(d.vlor_ajste), :F_FRMTO_MNDA, ''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) tooltip',
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b on    b.id_prscrpcion                =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c on    c.id_prscrpcion_sjto_impsto    =   b.id_prscrpcion_sjto_impsto',
'left  join  gf_g_ajuste_detalle         d on    d.id_ajste                     =   c.id_ajste',
'                                          and   d.vgncia                       =   c.vgncia',
'                                          and   d.id_prdo                      =   c.id_prdo',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_tpo =   nvl(:P145_ID_PRSCRPCION_TPO, a.id_prscrpcion_tpo)',
'and         b.id_impsto         =   nvl(:P145_ID_IMPSTO, b.id_impsto)',
'and         b.id_impsto_sbmpsto =   nvl(:P145_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'and         a.cdgo_rspsta       =   nvl(:P145_CDGO_RSPSTA, a.cdgo_rspsta)',
'and         a.id_usrio_rspsta   =   nvl(:P145_ID_USRIO, a.id_usrio_rspsta)',
'and         ((trunc(a.fcha_rgstro) between :P145_FECHA         and :P145_FECHA_HASTA)              or',
'             (trunc(a.fcha_rgstro) >=      :P145_FECHA         and :P145_FECHA_HASTA   is null)    or',
'             (trunc(a.fcha_rgstro) <=      :P145_FECHA_HASTA   and :P145_FECHA         is null)    or',
'             (:P145_FECHA          is      null                and :P145_FECHA_HASTA   is null ))',
'group by    c.indcdor_aprbdo;'))
,p_ajax_items_to_submit=>'P145_FECHA,P145_FECHA_HASTA'
,p_items_value_column_name=>'NUMERO_PRESCRIPCIONES'
,p_items_label_column_name=>'TITLE'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#9C9BF2'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:134:&SESSION.::&DEBUG.:RP,134:P134_FECHA_DESDE,P134_FECHA_HASTA,P134_ID_IMPSTO,P134_ID_IMPSTO_SBMPSTO,P134_ID_PRSCRPCION_TPO,P134_CDGO_RSPSTA,P134_USRIO,P134_INDCDOR_APRBDO:&P145_FECHA.,&P145_FECHA_HASTA.,&P145_ID_IMPSTO.,&P145_ID_IMPSTO'
||'_SBMPSTO.,&P145_ID_PRSCRPCION_TPO.,&P145_CDGO_RSPSTA.,&P145_ID_USRIO.,&INDCDOR_APRBDO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(24308919939560328)
,p_chart_id=>wwv_flow_api.id(24308619555560325)
,p_static_id=>'eje_fecha_x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'date-short'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
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
 p_id=>wwv_flow_api.id(24308887178560327)
,p_chart_id=>wwv_flow_api.id(24308619555560325)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('N\00FAmero de Prescripciones')
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
 p_id=>wwv_flow_api.id(121822853114715611)
,p_plug_name=>'Prescripciones por Tipo'
,p_region_name=>'rx8'
,p_parent_plug_id=>wwv_flow_api.id(135080847193124460)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(121822982676715612)
,p_region_id=>wwv_flow_api.id(121822853114715611)
,p_chart_type=>'donut'
,p_title=>'Prescripciones por Tipo'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'  options.dataFilter = function(data) {',
'      data.series.forEach(function(v, i){',
'          v.color = v_clres[i]',
'      });',
'      return data;',
'  };',
'  return options;',
'}'))
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(121823002744715613)
,p_chart_id=>wwv_flow_api.id(121822982676715612)
,p_seq=>10
,p_name=>'Prescripciones por Tipo'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Cantidades agrupadas por vigencias',
'select      a.id_prscrpcion_tpo,',
'            d.dscrpcion,',
'            count(a.id_prscrpcion_tpo) cntdad,',
unistr('            ''<b>Tipo de Prescripci\00F3n:</b> '' || d.dscrpcion || ''<br>'' ||'),
'            ''<b>Prescripciones: </b>'' || count(a.id_prscrpcion_tpo) || ''<br>'' ||',
'            ''<b>Valor Ajustes:</b> '' ||  nvl(to_char(sum(e.vlor_ajste), :F_FRMTO_MNDA, ''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) tooltip',
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b on    b.id_prscrpcion                =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c on    c.id_prscrpcion_sjto_impsto    =   b.id_prscrpcion_sjto_impsto',
'inner join  gf_d_prescripciones_tipo    d on    d.id_prscrpcion_tpo            =   a.id_prscrpcion_tpo',
'left  join  gf_g_ajuste_detalle         e on    e.id_ajste                     =   c.id_ajste',
'                                          and   e.vgncia                       =   c.vgncia',
'                                          and   e.id_prdo                      =   c.id_prdo',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_tpo =   nvl(:P145_ID_PRSCRPCION_TPO, a.id_prscrpcion_tpo)',
'and         b.id_impsto         =   nvl(:P145_ID_IMPSTO, b.id_impsto)',
'and         b.id_impsto_sbmpsto =   nvl(:P145_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'and         a.cdgo_rspsta       =   nvl(:P145_CDGO_RSPSTA, a.cdgo_rspsta)',
'and         a.id_usrio_rspsta   =   nvl(:P145_ID_USRIO, a.id_usrio_rspsta)',
'and         ((trunc(a.fcha_rgstro) between :P145_FECHA         and :P145_FECHA_HASTA)              or',
'             (trunc(a.fcha_rgstro) >=      :P145_FECHA         and :P145_FECHA_HASTA   is null)    or',
'             (trunc(a.fcha_rgstro) <=      :P145_FECHA_HASTA   and :P145_FECHA         is null)    or',
'             (:P145_FECHA          is      null                and :P145_FECHA_HASTA   is null ))',
'group by    a.id_prscrpcion_tpo,',
'            d.dscrpcion;'))
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'DSCRPCION'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:134:&SESSION.::&DEBUG.:RP,134:P134_FECHA_DESDE,P134_FECHA_HASTA,P134_ID_IMPSTO,P134_ID_IMPSTO_SBMPSTO,P134_ID_PRSCRPCION_TPO,P134_CDGO_RSPSTA,P134_USRIO:&P145_FECHA.,&P145_FECHA_HASTA.,&P145_ID_IMPSTO.,&P145_ID_IMPSTO_SBMPSTO.,&ID_PRSCRP'
||'CION_TPO.,&P145_CDGO_RSPSTA.,&P145_ID_USRIO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(135081077596124463)
,p_plug_name=>'Prescripciones Realizadas por Usuario'
,p_region_name=>'rx0'
,p_parent_plug_id=>wwv_flow_api.id(135080847193124460)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(97195498439026462)
,p_region_id=>wwv_flow_api.id(135081077596124463)
,p_chart_type=>'bar'
,p_title=>'Prescripciones Realizadas por Usuario'
,p_animation_on_display=>'alphaFade'
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
 p_id=>wwv_flow_api.id(97197758933026471)
,p_chart_id=>wwv_flow_api.id(97195498439026462)
,p_seq=>10
,p_name=>'Prescripciones Realizadas por Usuario'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Cantidades agrupadas por Usuarios',
'select      a.id_usrio_rspsta,',
'            d.nmbre_trcro,',
'            count(id_usrio_rspsta) cntdad,',
'            ''<b>Funcionario Respuesta:</b> '' || d.nmbre_trcro || ''<br>'' ||',
'            ''<b>Prescripciones: </b>'' || count(a.id_usrio_rspsta) || ''<br>'' ||',
'            ''<b>Valor Ajustes:</b> '' ||  nvl(to_char(sum(e.vlor_ajste), :F_FRMTO_MNDA, ''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) tooltip',
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b on    b.id_prscrpcion                =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c on    c.id_prscrpcion_sjto_impsto    =   b.id_prscrpcion_sjto_impsto',
'inner join  v_sg_g_usuarios             d on    d.id_usrio                     =   a.id_usrio_rspsta',
'left  join  gf_g_ajuste_detalle         e on    e.id_ajste                     =   c.id_ajste',
'                                          and   e.vgncia                       =   c.vgncia',
'                                          and   e.id_prdo                      =   c.id_prdo',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_tpo =   nvl(:P145_ID_PRSCRPCION_TPO, a.id_prscrpcion_tpo)',
'and         b.id_impsto         =   nvl(:P145_ID_IMPSTO, b.id_impsto)',
'and         b.id_impsto_sbmpsto =   nvl(:P145_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'and         a.cdgo_rspsta       =   nvl(:P145_CDGO_RSPSTA, a.cdgo_rspsta)',
'and         a.id_usrio_rspsta   =   nvl(:P145_ID_USRIO, a.id_usrio_rspsta)',
'and         ((trunc(a.fcha_rgstro) between :P145_FECHA         and :P145_FECHA_HASTA)              or',
'             (trunc(a.fcha_rgstro) >=      :P145_FECHA         and :P145_FECHA_HASTA   is null)    or',
'             (trunc(a.fcha_rgstro) <=      :P145_FECHA_HASTA   and :P145_FECHA         is null)    or',
'             (:P145_FECHA          is      null                and :P145_FECHA_HASTA   is null ))',
'group by    a.id_usrio_rspsta,',
'            d.nmbre_trcro;'))
,p_ajax_items_to_submit=>'P145_FECHA,P145_FECHA_HASTA'
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'NMBRE_TRCRO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#91C4EF'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:134:&SESSION.::&DEBUG.:RP,134:P134_FECHA_DESDE,P134_FECHA_HASTA,P134_ID_IMPSTO,P134_ID_IMPSTO_SBMPSTO,P134_ID_PRSCRPCION_TPO,P134_CDGO_RSPSTA,P134_USRIO:&P145_FECHA.,&P145_FECHA_HASTA.,&P145_ID_IMPSTO.,&P145_ID_IMPSTO_SBMPSTO.,&P145_ID_P'
||'RSCRPCION_TPO.,&P145_CDGO_RSPSTA.,&ID_USRIO_RSPSTA.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(97196591281026469)
,p_chart_id=>wwv_flow_api.id(97195498439026462)
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
 p_id=>wwv_flow_api.id(97197128653026470)
,p_chart_id=>wwv_flow_api.id(97195498439026462)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('N\00FAmero de Prescripciones')
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
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
 p_id=>wwv_flow_api.id(97195922036026465)
,p_chart_id=>wwv_flow_api.id(97195498439026462)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(135081834100124470)
,p_plug_name=>'Vigencias por Fecha'
,p_region_name=>'rx10'
,p_parent_plug_id=>wwv_flow_api.id(135080847193124460)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(97199293609026478)
,p_region_id=>wwv_flow_api.id(135081834100124470)
,p_chart_type=>'bar'
,p_title=>'Vigencias por Fecha'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
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
,p_time_axis_type=>'disabled'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(97200986536026479)
,p_chart_id=>wwv_flow_api.id(97199293609026478)
,p_seq=>10
,p_name=>'Vigencias Por Fecha'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Vigencias gestionadas por fecha',
'select      to_char(trunc(a.fcha_rgstro), ''DD/MM/YYYY'') fcha_rgstro,',
'            count(c.id_prscrpcion_vgncia) numero_prescripciones,',
'            ''<b>Fecha Respuesta: </b>'' || to_char(trunc(fcha_rgstro), ''DD/MM/YYYY'') || ''<br>'' ||',
'            ''<b>Prescripciones: </b>'' || count(a.id_prscrpcion) || ''<br>'' ||',
'            ''<b>Valor Ajustes:</b> '' ||  nvl(to_char(sum(d.vlor_ajste), :F_FRMTO_MNDA, ''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) tooltip',
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b on    b.id_prscrpcion                =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c on    c.id_prscrpcion_sjto_impsto    =   b.id_prscrpcion_sjto_impsto',
'left  join  gf_g_ajuste_detalle         d on    d.id_ajste                     =   c.id_ajste',
'                                          and   d.vgncia                       =   c.vgncia',
'                                          and   d.id_prdo                      =   c.id_prdo',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_tpo =   nvl(:P145_ID_PRSCRPCION_TPO, a.id_prscrpcion_tpo)',
'and         b.id_impsto         =   nvl(:P145_ID_IMPSTO, b.id_impsto)',
'and         b.id_impsto_sbmpsto =   nvl(:P145_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'and         a.cdgo_rspsta       =   nvl(:P145_CDGO_RSPSTA, a.cdgo_rspsta)',
'and         a.id_usrio_rspsta   =   nvl(:P145_ID_USRIO, a.id_usrio_rspsta)',
'and         ((trunc(a.fcha_rgstro) between :P145_FECHA         and :P145_FECHA_HASTA)              or',
'             (trunc(a.fcha_rgstro) >=      :P145_FECHA         and :P145_FECHA_HASTA   is null)    or',
'             (trunc(a.fcha_rgstro) <=      :P145_FECHA_HASTA   and :P145_FECHA         is null)    or',
'             (:P145_FECHA          is      null                and :P145_FECHA_HASTA   is null ))',
'group by    trunc(a.fcha_rgstro)',
'order by    trunc(a.fcha_rgstro);'))
,p_ajax_items_to_submit=>'P145_FECHA,P145_FECHA_HASTA'
,p_items_value_column_name=>'NUMERO_PRESCRIPCIONES'
,p_items_label_column_name=>'FCHA_RGSTRO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#FFBE64'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:134:&SESSION.::&DEBUG.:RP,134:P134_FECHA_DESDE,P134_FECHA_HASTA,P134_ID_IMPSTO,P134_ID_IMPSTO_SBMPSTO,P134_ID_PRSCRPCION_TPO,P134_CDGO_RSPSTA,P134_USRIO:&FCHA_RGSTRO.,&FCHA_RGSTRO.,&P145_ID_IMPSTO.,&P145_ID_IMPSTO_SBMPSTO.,&P145_ID_PRSCR'
||'PCION_TPO.,&P145_CDGO_RSPSTA.,&P145_ID_USRIO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(97199747752026478)
,p_chart_id=>wwv_flow_api.id(97199293609026478)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('N\00FAmero de Prescripciones')
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
 p_id=>wwv_flow_api.id(97200327881026478)
,p_chart_id=>wwv_flow_api.id(97199293609026478)
,p_static_id=>'eje_fecha_x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'date-short'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
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
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(136869742855418174)
,p_plug_name=>'Valor Prescripciones Aplicadas Por Fecha'
,p_region_name=>'rx2'
,p_parent_plug_id=>wwv_flow_api.id(135080847193124460)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(97205312237026481)
,p_region_id=>wwv_flow_api.id(136869742855418174)
,p_chart_type=>'lineWithArea'
,p_title=>'Valor de Prescripciones Aplicadas por Fecha'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_fill_multi_series_gaps=>false
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
,p_legend_position=>'top'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(97207696897026483)
,p_chart_id=>wwv_flow_api.id(97205312237026481)
,p_seq=>30
,p_name=>'Valor Prescripciones Aplicadas Por Fecha'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      to_char(trunc(a.fcha_rgstro), ''DD/MM/YYYY'') fcha_frmtda,',
'            sum(d.vlor_ajste),',
'            ''<b>Ajuste Credito Por Prescripcion</b>',
'             <b>Fecha: </b> '' ||to_char(trunc(a.fcha_rgstro), ''DD/MM/YYYY'') || ''<br>'' ||',
'             ''<b>Valor Ajuste: </b> $''  || to_char(sum(d.vlor_ajste),',
'             ''999G999G999G999G999''',
'            ,''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' tooltip',
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b on    b.id_prscrpcion                =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c on    c.id_prscrpcion_sjto_impsto    =   b.id_prscrpcion_sjto_impsto',
'inner join  gf_g_ajuste_detalle         d on    d.id_ajste                     =   c.id_ajste',
'                                          and   d.vgncia                       =   c.vgncia',
'                                          and   d.id_prdo                      =   c.id_prdo',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_tpo =   nvl(:P145_ID_PRSCRPCION_TPO, a.id_prscrpcion_tpo)',
'and         b.id_impsto         =   nvl(:P145_ID_IMPSTO, b.id_impsto)',
'and         b.id_impsto_sbmpsto =   nvl(:P145_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'and         a.cdgo_rspsta       =   nvl(:P145_CDGO_RSPSTA, a.cdgo_rspsta)',
'and         a.id_usrio_rspsta   =   nvl(:P145_ID_USRIO, a.id_usrio_rspsta)',
'and         ((trunc(a.fcha_rgstro) between :P145_FECHA         and :P145_FECHA_HASTA)              or',
'             (trunc(a.fcha_rgstro) >=      :P145_FECHA         and :P145_FECHA_HASTA   is null)    or',
'             (trunc(a.fcha_rgstro) <=      :P145_FECHA_HASTA   and :P145_FECHA         is null)    or',
'             (:P145_FECHA          is      null                and :P145_FECHA_HASTA   is null ))',
'group by    trunc(a.fcha_rgstro)',
'order by    trunc(a.fcha_rgstro);'))
,p_ajax_items_to_submit=>'P145_FECHA,P145_FECHA_HASTA'
,p_items_value_column_name=>'SUM(D.VLOR_AJSTE)'
,p_items_label_column_name=>'FCHA_FRMTDA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#FFD964'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:134:&SESSION.::&DEBUG.:RP,134:P134_FECHA_DESDE,P134_FECHA_HASTA,P134_ID_IMPSTO,P134_ID_IMPSTO_SBMPSTO,P134_ID_PRSCRPCION_TPO,P134_CDGO_RSPSTA,P134_USRIO:&FCHA_FRMTDA.,&FCHA_FRMTDA.,&P145_ID_IMPSTO.,&P145_ID_IMPSTO_SBMPSTO.,&P145_ID_PRSCR'
||'PCION_TPO.,&P145_CDGO_RSPSTA.,&P145_ID_USRIO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(97205874415026482)
,p_chart_id=>wwv_flow_api.id(97205312237026481)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'date-short'
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
 p_id=>wwv_flow_api.id(97206406283026482)
,p_chart_id=>wwv_flow_api.id(97205312237026481)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Valor del Ajuste'
,p_format_type=>'currency'
,p_decimal_places=>0
,p_currency=>'COP'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
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
 p_id=>wwv_flow_api.id(97207092447026483)
,p_chart_id=>wwv_flow_api.id(97205312237026481)
,p_axis=>'y2'
,p_is_rendered=>'off'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(137820121059851361)
,p_plug_name=>'Estados de Repuesta de Prescripcion'
,p_region_name=>'rx3'
,p_parent_plug_id=>wwv_flow_api.id(135080847193124460)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>90
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(97201879514026479)
,p_region_id=>wwv_flow_api.id(137820121059851361)
,p_chart_type=>'bar'
,p_title=>'Prescripciones por Respuesta'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
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
 p_id=>wwv_flow_api.id(97203533556026480)
,p_chart_id=>wwv_flow_api.id(97201879514026479)
,p_static_id=>'rx7'
,p_seq=>10
,p_name=>'Estados de Repuesta de Prescripcion'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Prescripciones por tipo de respuesta',
'select      b.dscrpcion dscrpcion_rspsta,',
'            count(b.dscrpcion) cntdad,',
'            b.cdgo_rspsta    cod_prscrpcion_rspsta,',
'            ''<b>Respuesta:</b> '' ||b.dscrpcion || ''<br>'' ||',
'            ''<b>Prescripciones: </b> '' || count(b.dscrpcion) || ''<br>'' tooltip',
'from        gf_g_prescripciones     a',
'inner join  gf_d_prscrpcnes_rspsta  b   on  b.cdgo_rspsta   =   a.cdgo_rspsta',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_tpo =   nvl(:P145_ID_PRSCRPCION_TPO, a.id_prscrpcion_tpo)',
'and         a.cdgo_rspsta       =   nvl(:P145_CDGO_RSPSTA, a.cdgo_rspsta)',
'and         a.id_usrio_rspsta   =   nvl(:P145_ID_USRIO, a.id_usrio_rspsta)',
'and         ((trunc(a.fcha_rgstro) between :P145_FECHA         and :P145_FECHA_HASTA)              or',
'             (trunc(a.fcha_rgstro) >=      :P145_FECHA         and :P145_FECHA_HASTA   is null)    or',
'             (trunc(a.fcha_rgstro) <=      :P145_FECHA_HASTA   and :P145_FECHA         is null)    or',
'             (:P145_FECHA          is      null                and :P145_FECHA_HASTA   is null ))',
'and         exists(select      1',
'                   from        gf_g_prscrpcnes_sjto_impsto c',
'                   where       c.id_prscrpcion     =   a.id_prscrpcion',
'                   and         c.id_impsto         =   nvl(:P145_ID_IMPSTO, c.id_impsto)',
'                   and         c.id_impsto_sbmpsto =   nvl(:P145_ID_IMPSTO_SBMPSTO, c.id_impsto_sbmpsto)',
'                  )',
'group by    b.cdgo_rspsta,',
'            b.dscrpcion;'))
,p_ajax_items_to_submit=>'P145_FECHA,P145_FECHA_HASTA'
,p_items_value_column_name=>'CNTDAD'
,p_items_label_column_name=>'DSCRPCION_RSPSTA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'#9C9BF2'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:134:&SESSION.::&DEBUG.:RP,134:P134_FECHA_DESDE,P134_FECHA_HASTA,P145_ID_IMPSTO,P134_ID_IMPSTO_SBMPSTO,P134_ID_PRSCRPCION_TPO,P134_CDGO_RSPSTA:&P145_FECHA.,&P145_FECHA_HASTA.,&P145_ID_IMPSTO.,&P145_ID_IMPSTO_SBMPSTO.,&P145_ID_PRSCRPCION_T'
||'PO.,&COD_PRSCRPCION_RSPSTA.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(97202362217026480)
,p_chart_id=>wwv_flow_api.id(97201879514026479)
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
 p_id=>wwv_flow_api.id(97202919193026480)
,p_chart_id=>wwv_flow_api.id(97201879514026479)
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
 p_id=>wwv_flow_api.id(145391808213461483)
,p_plug_name=>unistr('Par\00E1metros B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(135080847193124460)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145391898797461484)
,p_plug_name=>unistr('Gesti\00F3n de Vigencias')
,p_parent_plug_id=>wwv_flow_api.id(135080847193124460)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(133336688081625555)
,p_plug_name=>unistr('Total Ajustes Cr\00E9dito Por Prescripciones')
,p_parent_plug_id=>wwv_flow_api.id(145391898797461484)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Valor total de ajutes',
'select      nvl(to_char(sum(d.vlor_ajste), :F_FRMTO_MNDA, ''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) mnto_ttal',
'           ,''Valor Total de Ajustes'' title',
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b on    b.id_prscrpcion                =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c on    c.id_prscrpcion_sjto_impsto    =   b.id_prscrpcion_sjto_impsto',
'inner join  gf_g_ajuste_detalle         d on    d.id_ajste                     =   c.id_ajste',
'                                          and   d.vgncia                       =   c.vgncia',
'                                          and   d.id_prdo                      =   c.id_prdo',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_tpo =   nvl(:P145_ID_PRSCRPCION_TPO, a.id_prscrpcion_tpo)',
'and         b.id_impsto         =   nvl(:P145_ID_IMPSTO, b.id_impsto)',
'and         b.id_impsto_sbmpsto =   nvl(:P145_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'and         a.cdgo_rspsta       =   nvl(:P145_CDGO_RSPSTA, a.cdgo_rspsta)',
'and         a.id_usrio_rspsta   =   nvl(:P145_ID_USRIO, a.id_usrio_rspsta)',
'and         ((trunc(a.fcha_rgstro) between :P145_FECHA         and :P145_FECHA_HASTA)              or',
'             (trunc(a.fcha_rgstro) >=      :P145_FECHA         and :P145_FECHA_HASTA   is null)    or',
'             (trunc(a.fcha_rgstro) <=      :P145_FECHA_HASTA   and :P145_FECHA         is null)    or',
'             (:P145_FECHA          is      null                and :P145_FECHA_HASTA   is null ));'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P145_FECHA,P145_FECHA_HASTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'MNTO_TTAL'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(135080862213124461)
,p_plug_name=>'Vigencias Gestionadas'
,p_parent_plug_id=>wwv_flow_api.id(145391898797461484)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Vigencias Prescritas',
'select      count(c.id_prscrpcion_vgncia) numero_prescripciones,',
'            ''Vigencias Gestionadas'' title',
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b on    b.id_prscrpcion                =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c on    c.id_prscrpcion_sjto_impsto    =   b.id_prscrpcion_sjto_impsto',
'where       a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and         a.id_prscrpcion_tpo =   nvl(:P145_ID_PRSCRPCION_TPO, a.id_prscrpcion_tpo)',
'and         b.id_impsto         =   nvl(:P145_ID_IMPSTO, b.id_impsto)',
'and         b.id_impsto_sbmpsto =   nvl(:P145_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'and         a.cdgo_rspsta       =   nvl(:P145_CDGO_RSPSTA, a.cdgo_rspsta)',
'and         a.id_usrio_rspsta   =   nvl(:P145_ID_USRIO, a.id_usrio_rspsta)',
'and         ((trunc(a.fcha_rgstro) between :P145_FECHA         and :P145_FECHA_HASTA)              or',
'             (trunc(a.fcha_rgstro) >=      :P145_FECHA         and :P145_FECHA_HASTA   is null)    or',
'             (trunc(a.fcha_rgstro) <=      :P145_FECHA_HASTA   and :P145_FECHA         is null)    or',
'             (:P145_FECHA          is      null                and :P145_FECHA_HASTA   is null ));'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P145_FECHA,P145_FECHA_HASTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'NUMERO_PRESCRIPCIONES'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(149731223629958341)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(149731385680958343)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<i>',
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda<i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
unistr('Funcionalidad que permite consultar informaci\00F3n de las prescripciones gestionadas en el sistema.<br><br>'),
'<b>1.</b> Muestra el total de vigencias gestionadas y el valor que estas representan.<br>',
'<b>2.</b> Muestra el total de prescripciones agrupadas en vigencias y el valor gestionado.<br>',
unistr('<b>3.</b> Muestra el total de vigencias gestionadas por aceptaci\00F3n y el valor que estas representan.<br>'),
'<b>4.</b> Muestra el valor de los ajustes por fechas y las vigencias que estas representan.<br>',
'<b>5.</b> Muestra el total de vigencias gestionadas por fecha y el valor que estas representan.<br>',
unistr('<b>6.</b> Muestra el total de vigencias gestionadas por tipo de prescripci\00F3n y el valor que representan.<br>'),
'<b>7.</b> Muestra el total de vigencias gestionadas por usuario y el valor que representan.<br>',
'<b>8.</b> Muestra el total de prescripciones gestionadas por tipos de respuesta.<br>',
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97217066366026492)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(149731223629958341)
,p_button_name=>'Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=50000:115:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97214302408026487)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(145391808213461483)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24306245661560301)
,p_name=>'P145_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(145391808213461483)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24306340153560302)
,p_name=>'P145_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(145391808213461483)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto_sbmpsto,',
'        a.id_impsto_sbmpsto',
'from    df_i_impuestos_subimpuesto  a',
'where   a.id_impsto =   :P145_ID_IMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P145_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97214712502026488)
,p_name=>'P145_FECHA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(145391808213461483)
,p_item_default=>'add_months(systimestamp, -1)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Desde</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97215171071026490)
,p_name=>'P145_FECHA_HASTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(145391808213461483)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Hasta</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P145_FECHA.'
,p_attribute_03=>'+1d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121821848529715601)
,p_name=>'P145_ID_PRSCRPCION_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(145391808213461483)
,p_prompt=>unistr('Tipos de prescripci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_prscrpcion_tpo',
'from    gf_d_prescripciones_tipo    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121821977085715602)
,p_name=>'P145_ID_USRIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(145391808213461483)
,p_prompt=>'Usuario'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_trcro || '' - '' || a.idntfccion as text,',
'        a.id_usrio',
'from    V_SG_G_USUARIOS a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'order by    a.nmbre_trcro;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121822038639715603)
,p_name=>'P145_CDGO_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(145391808213461483)
,p_prompt=>unistr('Respuesta de Prescripci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.cdgo_rspsta',
'from    gf_d_prscrpcnes_rspsta a;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97222292409026513)
,p_name=>'Al modificar Fecha desde'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P145_FECHA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97222764441026514)
,p_event_id=>wwv_flow_api.id(97222292409026513)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P145_FECHA_HASTA").datepicker( ''option'' , ''minDate'' , $("#P145_FECHA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
