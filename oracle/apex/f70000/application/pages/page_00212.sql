prompt --application/pages/page_00212
begin
wwv_flow_api.create_page(
 p_id=>212
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Panel de Control Declaraciones'
,p_step_title=>'Panel de Control Declaraciones'
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
'	if($(''#''+id).attr(''aria-expanded'') != ''false''){',
'		$(''#''+id).click();',
'	}',
'}',
'',
'',
'function setText(){',
' $(''#rgnap1_heading'').text(''Ajustes Aplicados'');',
'    $(''#rgnap1_heading'').text($(''#rgnap1_heading'').text() + ''-'' + $(''#P33_ID_IMPSTO'').select2(''data'')[0].text);',
'  ',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'tooltipRXI();',
'',
'buttonCollapse(''t_Button_rightControlButton'');',
'',
'$(document).on("scroll",function() {',
'   apex.navigation.dialog.close(true);',
'});'))
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
'}',
'',
'#rx0 polygon{',
'    stroke: #309fdb;',
'    stroke-width: 2px;',
'}',
'',
'#rx1 polygon{',
'    stroke: #0CEDB5;',
'    stroke-width: 2px;',
'}',
'',
'#rx10 polygon{',
'    stroke: #309fdb;',
'    stroke-width: 2px;',
'}',
'',
'#rx2 polygon{',
'    stroke: #309fdb;',
'    stroke-width: 2px;',
'}',
'',
'#rx3 polygon{',
'  stroke: #309fdb;',
'    stroke-width: 2px;',
'}',
'',
'#rx4 polygon{',
'    stroke: #0CEDB5;',
'    stroke-width: 2px;}',
'',
'#rx5 polygon{',
'    stroke: #0CEDB5;',
'    stroke-width: 2px;}',
'#rx6 polygon{',
'    stroke: #0CEDB5;',
'   stroke-width: 2px;',
'}',
'#rx7 polygon{',
'    stroke: #309fdb;',
' stroke-width: 2px;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210616113755'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17187695393910334)
,p_plug_name=>unistr('Panel Control Declaraci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17187821001910335)
,p_plug_name=>unistr('Par\00E1metros B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(17187695393910334)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>2
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17187857631910336)
,p_plug_name=>'Totales'
,p_parent_plug_id=>wwv_flow_api.id(17187695393910334)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17187948155910337)
,p_plug_name=>'Declaraciones Gestionadas'
,p_parent_plug_id=>wwv_flow_api.id(17187857631910336)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count (a.id_dclrcion) mnto_ttal, ''Total Declaraciones Gestionadas'' title',
'--nvl(to_char(count (a.id_dclrcion),:F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) mnto_ttal, ''Total Declaraciones Gestionadas'' title',
'from    v_gi_g_declaraciones  a',
'where a.cdgo_dclrcion_estdo = :P212_CDGO_DCLRCION_ESTDO',
'',
'and (  (a.cdgo_dclrcion_estdo = ''REG'' and  a.fcha_rgstro        between :P212_FECHA  and :P212_FECHA_HASTA) or',
'      (a.cdgo_dclrcion_estdo = ''AUT''  and  a.fcha_rgstro        between :P212_FECHA  and :P212_FECHA_HASTA) or',
'      (a.cdgo_dclrcion_estdo = ''PRS''  and  a.fcha_prsntcion     between :P212_FECHA  and :P212_FECHA_HASTA) or',
'      (a.cdgo_dclrcion_estdo = ''APL''  and  a.fcha_aplccion      between :P212_FECHA  and :P212_FECHA_HASTA)',
'      );',
'',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P212_CDGO_DCLRCION_ESTDO,P212_FECHA,P212_FECHA_HASTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'MNTO_TTAL'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17199039837111134)
,p_plug_name=>'Total Valor a Pagar Declarado'
,p_parent_plug_id=>wwv_flow_api.id(17187857631910336)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nvl(to_char(sum(a.vlor_pago),:F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) mnto_ttal, ''Total Valor a Pagar Declaraciones'' title',
'from    v_gi_g_declaraciones  a',
'where a.cdgo_dclrcion_estdo = :P212_CDGO_DCLRCION_ESTDO',
'and vlor_ttal < 1656666666952342000',
'and (  (a.cdgo_dclrcion_estdo = ''REG'' and  a.fcha_rgstro        between :P212_FECHA  and :P212_FECHA_HASTA) or',
'      (a.cdgo_dclrcion_estdo = ''AUT''  and  a.fcha_rgstro        between :P212_FECHA  and :P212_FECHA_HASTA) or',
'      (a.cdgo_dclrcion_estdo = ''PRS''  and  a.fcha_prsntcion     between :P212_FECHA  and :P212_FECHA_HASTA) or',
'      (a.cdgo_dclrcion_estdo = ''APL''  and  a.fcha_aplccion      between :P212_FECHA  and :P212_FECHA_HASTA)',
'      );',
' ',
'      ',
'',
'',
'',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P212_CDGO_DCLRCION_ESTDO,P212_FECHA,P212_FECHA_HASTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'MNTO_TTAL'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17268133030229534)
,p_plug_name=>'Valor a Pagar - Tipo de Contribuyente'
,p_region_name=>'rx10'
,p_parent_plug_id=>wwv_flow_api.id(17187857631910336)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(13900937416866851)
,p_region_id=>wwv_flow_api.id(17268133030229534)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
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
 p_id=>wwv_flow_api.id(13902699025866858)
,p_chart_id=>wwv_flow_api.id(13900937416866851)
,p_seq=>10
,p_name=>'TIPO DE CONTRIBUYENTE'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''<b>Total a Pagar </b>''|| nmbre_sjto_tpo|| '':'' ||nvl(to_char(sum(a.vlor_pago),:F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) vlot_total_pgar_tool_tip,',
'       sum( a.vlor_pago) vlot_total_pgar,',
'       nmbre_sjto_tpo',
'from v_gi_g_declaraciones  a',
'where       a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and         a.cdgo_dclrcion_estdo = :P212_CDGO_DCLRCION_ESTDO',
'and (  (a.cdgo_dclrcion_estdo = ''REG'' and  a.fcha_rgstro        between :P212_FECHA  and :P212_FECHA_HASTA) or',
'      (a.cdgo_dclrcion_estdo = ''AUT''  and  a.fcha_rgstro        between :P212_FECHA  and :P212_FECHA_HASTA) or',
'      (a.cdgo_dclrcion_estdo = ''PRS''  and  a.fcha_prsntcion     between :P212_FECHA  and :P212_FECHA_HASTA) or',
'      (a.cdgo_dclrcion_estdo = ''APL''  and  a.fcha_aplccion      between :P212_FECHA  and :P212_FECHA_HASTA)',
'      )',
'',
'group by a.id_sjto_tpo,a.nmbre_sjto_tpo;',
''))
,p_ajax_items_to_submit=>'P212_CDGO_DCLRCION_ESTDO,P212_FECHA,P212_FECHA_HASTA'
,p_items_value_column_name=>'VLOT_TOTAL_PGAR'
,p_items_label_column_name=>'NMBRE_SJTO_TPO'
,p_items_short_desc_column_name=>'VLOT_TOTAL_PGAR_TOOL_TIP'
,p_color=>'RGBA(48, 159, 219, 0.5)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(13902064514866857)
,p_chart_id=>wwv_flow_api.id(13900937416866851)
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
 p_id=>wwv_flow_api.id(13901474847866855)
,p_chart_id=>wwv_flow_api.id(13900937416866851)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13898417888866834)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(17187821001910335)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13898850367866839)
,p_name=>'P212_CDGO_DCLRCION_ESTDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(17187821001910335)
,p_prompt=>'Estado de la Declaracion'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'STATIC:FIRME;FRM,AUTORIZADA;AUT,PRESENTADA;PRS,APLICADA;APL'
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13899284233866840)
,p_name=>'P212_FECHA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(17187821001910335)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select to_date(sysdate, ''DD/MM/YYYY'') - to_char(to_date(sysdate, ''DD/MM/YYYY''),''d'') - 1 lunes',
'   from dual;',
''))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'<b>Fecha Desde</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13899633127866840)
,p_name=>'P212_FECHA_HASTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(17187821001910335)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select to_date(sysdate, ''DD/MM/YYYY'') - to_char(to_date(sysdate, ''DD/MM/YYYY''),''d'') + 6 Domingo',
'   from dual;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'<b>Fecha Hasta</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13903522970866861)
,p_name=>'Al modificar Fecha desde'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P212_FECHA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13904005273866877)
,p_event_id=>wwv_flow_api.id(13903522970866861)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P212_FECHA_HASTA").datepicker( ''option'' , ''minDate'' , $("#P212_FECHA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
