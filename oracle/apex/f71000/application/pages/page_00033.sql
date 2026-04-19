prompt --application/pages/page_00033
begin
wwv_flow_api.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Panel Control Ajustes'
,p_step_title=>'Panel Control Ajustes'
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
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20191109101153'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37886395430098026)
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
 p_id=>wwv_flow_api.id(48197356450435049)
,p_plug_name=>unistr('Par\00E1metros B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(37886395430098026)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>2
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48197447034435050)
,p_plug_name=>'Totales'
,p_parent_plug_id=>wwv_flow_api.id(37886395430098026)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36142236318599121)
,p_plug_name=>unistr('Total Ajustes Cr\00E9dito')
,p_parent_plug_id=>wwv_flow_api.id(48197447034435050)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   ',
'   ',
unistr('/*select ''$'' || nvl(to_char(sum(a.VLOR_AJSTE), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) mnto_ttal, ''Total Ajustes Aplicados Cr\00E9dito'' title'),
'  from v_gf_g_ajuste_detalle a',
'  join gf_g_ajustes b on a.id_ajste = b.id_ajste',
'   where  a.TPO_AJSTE = ''CR''  and ',
'  ((trunc(a.fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null )) ',
'   and b.cdgo_ajste_estdo=''AP''',
'   and b.cdgo_clnte = :F_CDGO_CLNTE   */',
' ',
' ',
unistr(' select nvl(to_char(sum(a.vlor),:F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) mnto_ttal, ''Total Ajustes Aplicados Cr\00E9dito'' title'),
'  from gf_g_ajustes a',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto            = nvl(:P33_ID_IMPSTO,a.id_impsto)',
'   and a.id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'   and  a.cdgo_ajste_estdo=''AP''',
'   and a.TPO_AJSTE = ''CR'' ',
'   and ((trunc(a.fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null )) ;',
'  ',
'',
'  ',
'   ',
' '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'MNTO_TTAL'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37886410450098027)
,p_plug_name=>'Total Ajustes'
,p_parent_plug_id=>wwv_flow_api.id(48197447034435050)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'select ''$'' || nvl(to_char(sum(a.VLOR_AJSTE), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) mnto_ttal, ''Total Ajustes Aplicados'' title',
'  from v_gf_g_ajuste_detalle a',
'  join gf_g_ajustes b on a.id_ajste = b.id_ajste',
'   where  ',
'  ((trunc(a.fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null )) ',
'   and b.cdgo_ajste_estdo=''AP''',
'   and b.cdgo_clnte = :F_CDGO_CLNTE*/',
'   ',
'  select  nvl(to_char(sum(a.vlor),:F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) mnto_ttal, ''Total Ajustes Aplicados'' title',
'    from gf_g_ajustes a',
'   where  a.cdgo_ajste_estdo=''AP''',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto            = nvl(:P33_ID_IMPSTO,a.id_impsto)',
'   and a.id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'   and ((trunc(a.fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null )) ;',
'   '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'MNTO_TTAL'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37886531974098028)
,p_plug_name=>unistr('Total Ajustes D\00E9bito')
,p_parent_plug_id=>wwv_flow_api.id(48197447034435050)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ',
unistr('select ''$'' || nvl(to_char(sum(a.VLOR_AJSTE), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) mnto_ttal, ''Total Ajustes D\00E9bito'' title'),
'  from v_gf_g_ajuste_detalle a',
'  join gf_g_ajustes b on a.id_ajste = b.id_ajste',
'   where  a.TPO_AJSTE = ''DB'' and ',
'  ((trunc(a.fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null )) ',
'   and b.cdgo_clnte = :F_CDGO_CLNTE   */',
'   ',
'   ',
unistr(' select nvl(to_char(sum(a.vlor),:F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) mnto_ttal, ''Total Ajustes Aplicados D\00E9bito'' title'),
'  from gf_g_ajustes a',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto            = nvl(:P33_ID_IMPSTO,a.id_impsto)',
'   and a.id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'   and  a.cdgo_ajste_estdo=''AP''',
'   and a.TPO_AJSTE = ''DB'' ',
'   and ((trunc(a.fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null )) ;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'MNTO_TTAL'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50098894777252828)
,p_plug_name=>'<b>Ajustes Aplicados</b>'
,p_region_name=>'rgnap1'
,p_parent_plug_id=>wwv_flow_api.id(37886395430098026)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37887382337098036)
,p_plug_name=>unistr('Ajustes Aplicados por Fecha Cr\00E9dito')
,p_region_name=>'rx10'
,p_parent_plug_id=>wwv_flow_api.id(50098894777252828)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(37887478422098037)
,p_region_id=>wwv_flow_api.id(37887382337098036)
,p_chart_type=>'bar'
,p_title=>unistr('Ajustes Cr\00E9dito Aplicados por Fecha ')
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
 p_id=>wwv_flow_api.id(37887574884098038)
,p_chart_id=>wwv_flow_api.id(37887478422098037)
,p_seq=>10
,p_name=>'Ajustes por Fecha Credito'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select to_char(fcha_frmtda, ''DD/MM/YYYY'') fcha_formatiada,',
'       fcha_frmtda, count(id_ajste) cantidad_ajustes_fcha,',
'       CDGO_TPO_AJSTE,',
'      ''<b>Fecha:</b> '' || to_char(fcha_frmtda, ''DD/MM/YYYY'')  || ''<br>'' ||',
'      ''<b>Ajustes Realizados Credito:</b> ''  || count(id_ajste) || ''<br>'' toltip_ajste_fcha',
' ',
'from v_gf_g_ajustes  ',
'where cdgo_clnte = :F_CDGO_CLNTE ',
'    and CDGO_TPO_AJSTE =''CR''',
'    and CDGO_AJSTE_ESTDO=''AP''',
'    and id_impsto            = nvl(:P33_ID_IMPSTO,id_impsto)',
'    and id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'    and((trunc(fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'    or (trunc(fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'    or (trunc(fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'    or(:P33_FECHA is null and :P33_FECHA_HASTA is null ))',
'  ',
'group by fcha_frmtda,CDGO_TPO_AJSTE',
'order by fcha_frmtda  asc;*/',
'',
'select to_char(fcha_aplccion_frmtda, ''DD/MM/YYYY'') fcha_formatiada,',
'       fcha_aplccion_frmtda fcha_frmtda, count(id_ajste) cantidad_ajustes_fcha,',
'       CDGO_TPO_AJSTE,',
'      ''<b>Fecha:</b> '' || to_char(fcha_aplccion_frmtda, ''DD/MM/YYYY'')  || ''<br>'' ||',
unistr('      ''<b>Ajustes Realizados Cr\00E9dito:</b> ''  || count(id_ajste) || ''<br>'' toltip_ajste_fcha'),
' ',
'from v_gf_g_ajustes  ',
'where cdgo_clnte = :F_CDGO_CLNTE ',
'    and CDGO_TPO_AJSTE =''CR''',
'    and CDGO_AJSTE_ESTDO=''AP''',
'    and id_impsto            = nvl(:P33_ID_IMPSTO,id_impsto)',
'    and id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'    and((trunc(fcha_aplccion) between :P33_FECHA and :P33_FECHA_HASTA)',
'    or (trunc(fcha_aplccion) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'    or (trunc(fcha_aplccion) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'    or(:P33_FECHA is null and :P33_FECHA_HASTA is null ))',
'  ',
'group by fcha_aplccion_frmtda,CDGO_TPO_AJSTE',
'order by fcha_aplccion_frmtda  asc;',
''))
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'CANTIDAD_AJUSTES_FCHA'
,p_items_label_column_name=>'FCHA_FORMATIADA'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE_FCHA'
,p_custom_column_name=>'FCHA_FORMATIADA'
,p_color=>'RGBA(48, 159, 219, 0.5)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,32:P36_FECHA,P36_FECHA_HASTA,P36_FECHA_BUSQUEDA,P36_CDGO_TPO_AJSTE,P36_ID_IMPSTO,P36_ID_IMPSTO_SBMPSTO:&P33_FECHA.,&P33_FECHA_HASTA.,&FCHA_FORMATIADA.,&CDGO_TPO_AJSTE.,&P33_ID_IMPSTO.,&P33_ID_IMPSTO_SBMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(37887758431098040)
,p_chart_id=>wwv_flow_api.id(37887478422098037)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('N\00FAmero de Ajustes')
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'thousand'
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
 p_id=>wwv_flow_api.id(37887636218098039)
,p_chart_id=>wwv_flow_api.id(37887478422098037)
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
 p_id=>wwv_flow_api.id(39675291092391740)
,p_plug_name=>unistr('Ajustes Cr\00E9dito')
,p_region_name=>'rx2'
,p_parent_plug_id=>wwv_flow_api.id(50098894777252828)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(39675336581391741)
,p_region_id=>wwv_flow_api.id(39675291092391740)
,p_chart_type=>'lineWithArea'
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
 p_id=>wwv_flow_api.id(40625553381824926)
,p_chart_id=>wwv_flow_api.id(39675336581391741)
,p_seq=>30
,p_name=>unistr('Ajuste Cr\00E9dito')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select to_char(fcha_frmtda, ''DD/MM/YYYY'') fcha_formatiada,fcha_frmtda,sum(vlor),',
' ''<b>Ajuste Credito</b>',
' <b>Fecha:</b> '' ||to_char(fcha_frmtda, ''DD/MM/YYYY'') || ''<br>'' ||',
' ''<b>Valor Ajuste:</b>''  || to_char(sum(vlor), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_vlor_fcha',
'from v_gf_g_ajustes ',
'where cdgo_clnte = :F_CDGO_CLNTE  ',
'   and CDGO_TPO_AJSTE = ''CR''',
'   and CDGO_AJSTE_ESTDO=''AP''',
'   and id_impsto            = nvl(:P33_ID_IMPSTO,id_impsto)',
'   and id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'   and ((trunc(fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null )) ',
'group by fcha_frmtda',
'order by fcha_frmtda asc;*/',
'',
'',
'',
'select to_char(fcha_aplccion_frmtda, ''DD/MM/YYYY'') fcha_formatiada,fcha_aplccion_frmtda fcha_frmtda,sum(vlor),',
unistr(' ''<b>Ajuste Cr\00E9dito</b>'),
' <b>Fecha:</b> '' ||to_char(fcha_aplccion_frmtda, ''DD/MM/YYYY'') || ''<br>'' ||',
' ''<b>Valor Ajuste:</b>''  || to_char(sum(vlor), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_vlor_fcha',
'from v_gf_g_ajustes ',
'where cdgo_clnte = :F_CDGO_CLNTE  ',
'   and CDGO_TPO_AJSTE = ''CR''',
'   and CDGO_AJSTE_ESTDO=''AP''',
'   and id_impsto            = nvl(:P33_ID_IMPSTO,id_impsto)',
'   and id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'   and ((trunc(fcha_aplccion) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(fcha_aplccion) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(fcha_aplccion) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null )) ',
'group by fcha_aplccion_frmtda',
'order by fcha_aplccion_frmtda asc;',
'',
'',
''))
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'SUM(VLOR)'
,p_items_label_column_name=>'FCHA_FORMATIADA'
,p_items_short_desc_column_name=>'TOLTIP_VLOR_FCHA'
,p_color=>'RGBA(48, 159, 219, 0.5)'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP:P8_FECHA_BUSQUEDA,P8_FECHA,P8_FECHA_HASTA:&FCHA_FORMATIADA.,&P33_FECHA.,&P33_FECHA_HASTA.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(39675507546391743)
,p_chart_id=>wwv_flow_api.id(39675336581391741)
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
 p_id=>wwv_flow_api.id(39675604102391744)
,p_chart_id=>wwv_flow_api.id(39675336581391741)
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
 p_id=>wwv_flow_api.id(50096277445252802)
,p_chart_id=>wwv_flow_api.id(39675336581391741)
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
 p_id=>wwv_flow_api.id(50098205759252822)
,p_plug_name=>unistr('Ajustes D\00E9bito')
,p_region_name=>'rx4'
,p_parent_plug_id=>wwv_flow_api.id(50098894777252828)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(50098308796252823)
,p_region_id=>wwv_flow_api.id(50098205759252822)
,p_chart_type=>'lineWithArea'
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
 p_id=>wwv_flow_api.id(50098448593252824)
,p_chart_id=>wwv_flow_api.id(50098308796252823)
,p_seq=>10
,p_name=>unistr('Ajuste D\00E9bito')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select to_char(fcha_frmtda, ''DD/MM/YYYY'') fcha_formatiada,fcha_frmtda,sum(vlor),',
unistr(' ''<b>Ajuste D\00E9bito</b>'),
' <b>Fecha:</b> '' ||to_char(fcha_frmtda, ''DD/MM/YYYY'') || ''<br>'' ||',
' ''<b>Valor Ajuste:</b> ''  || to_char(sum(vlor), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_vlor_fcha',
'from v_gf_g_ajustes ',
'where cdgo_clnte = :F_CDGO_CLNTE',
'   and CDGO_TPO_AJSTE = ''DB''',
'   and CDGO_AJSTE_ESTDO=''AP''',
'   and id_impsto            = nvl(:P33_ID_IMPSTO,id_impsto)',
'   and id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'   and ((trunc(fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null ))',
' ',
'group by fcha_frmtda',
'order by fcha_frmtda asc;*/',
'',
'select to_char(fcha_aplccion_frmtda, ''DD/MM/YYYY'') fcha_formatiada,fcha_aplccion_frmtda fcha_frmtda,sum(vlor),',
unistr(' ''<b>Ajuste D\00E9bito</b>'),
' <b>Fecha:</b> '' ||to_char(fcha_aplccion_frmtda, ''DD/MM/YYYY'') || ''<br>'' ||',
' ''<b>Valor Ajuste:</b> ''  || to_char(sum(vlor), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_vlor_fcha',
'from v_gf_g_ajustes ',
'where cdgo_clnte = :F_CDGO_CLNTE',
'   and CDGO_TPO_AJSTE = ''DB''',
'   and CDGO_AJSTE_ESTDO=''AP''',
'   and id_impsto            = nvl(:P33_ID_IMPSTO,id_impsto)',
'   and id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'   and ((trunc(fcha_aplccion) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(fcha_aplccion) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(fcha_aplccion) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null ))',
' ',
'group by fcha_aplccion_frmtda',
'order by fcha_aplccion_frmtda asc;',
'',
'',
'',
''))
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'SUM(VLOR)'
,p_items_label_column_name=>'FCHA_FORMATIADA'
,p_items_short_desc_column_name=>'TOLTIP_VLOR_FCHA'
,p_color=>'RGB(12,237,181,0.2)'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP:P34_FECHA_BUSQUEDA,P34_FECHA,P34_FECHA_HASTA,P34_ID_IMPSTO,P34_ID_IMPSTO_SBMPSTO:&FCHA_FORMATIADA.,&P33_FECHA.,&P33_FECHA_HASTA.,&P33_ID_IMPSTO.,&P33_ID_IMPSTO_SBMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(50098625051252826)
,p_chart_id=>wwv_flow_api.id(50098308796252823)
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
 p_id=>wwv_flow_api.id(50098779392252827)
,p_chart_id=>wwv_flow_api.id(50098308796252823)
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
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(50098509236252825)
,p_chart_id=>wwv_flow_api.id(50098308796252823)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50099943294252839)
,p_plug_name=>unistr('Ajustes Realizados por Fecha D\00E9bito')
,p_region_name=>'rx1'
,p_parent_plug_id=>wwv_flow_api.id(50098894777252828)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
begin
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(50100088670252840)
,p_region_id=>wwv_flow_api.id(50099943294252839)
,p_chart_type=>'bar'
,p_title=>unistr('Ajustes D\00E9bito Aplicados por Fecha')
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
 p_id=>wwv_flow_api.id(50100247321252842)
,p_chart_id=>wwv_flow_api.id(50100088670252840)
,p_seq=>20
,p_name=>unistr('Ajustes por Fecha D\00E9bito')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select to_char(fcha_frmtda, ''DD/MM/YYYY'') fcha_formatiada,fcha_frmtda, count(id_ajste) cantidad_ajustes_fcha,CDGO_TPO_AJSTE,',
' ''<b>Fecha:</b> '' || to_char(fcha_frmtda, ''DD/MM/YYYY'')  || ''<br>'' ||',
unistr(' ''<b>Ajustes Realizados D\00E9bito:</b> ''  || count(id_ajste) || ''<br>'' toltip_ajste_fcha'),
' ',
'from v_gf_g_ajustes  ',
'where cdgo_clnte = :F_CDGO_CLNTE',
'   and CDGO_TPO_AJSTE =''DB'' ',
'   and CDGO_AJSTE_ESTDO=''AP''',
'   and id_impsto            = nvl(:P33_ID_IMPSTO,id_impsto)',
'   and id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'   and ((trunc(fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null ))',
'',
'group by fcha_frmtda,CDGO_TPO_AJSTE',
'order by fcha_frmtda asc;*/',
'select to_char(fcha_aplccion_frmtda, ''DD/MM/YYYY'') fcha_formatiada,fcha_aplccion_frmtda fcha_frmtda, count(id_ajste) cantidad_ajustes_fcha,CDGO_TPO_AJSTE,',
' ''<b>Fecha:</b> '' || to_char(fcha_aplccion_frmtda, ''DD/MM/YYYY'')  || ''<br>'' ||',
unistr(' ''<b>Ajustes Realizados D\00E9bito:</b> ''  || count(id_ajste) || ''<br>'' toltip_ajste_fcha'),
' ',
'from v_gf_g_ajustes  ',
'where cdgo_clnte = :F_CDGO_CLNTE',
'   and CDGO_TPO_AJSTE =''DB'' ',
'   and CDGO_AJSTE_ESTDO=''AP''',
'   and id_impsto            = nvl(:P33_ID_IMPSTO,id_impsto)',
'   and id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'   and ((trunc(fcha_aplccion) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(fcha_aplccion) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(fcha_aplccion) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null ))',
'',
'group by fcha_aplccion_frmtda,CDGO_TPO_AJSTE',
'order by fcha_aplccion_frmtda asc;'))
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'CANTIDAD_AJUSTES_FCHA'
,p_items_label_column_name=>'FCHA_FORMATIADA'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE_FCHA'
,p_custom_column_name=>'FCHA_FORMATIADA'
,p_color=>'RGB(12,237,181,0.2)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,32:P36_FECHA,P36_FECHA_HASTA,P36_FECHA_BUSQUEDA,P36_CDGO_TPO_AJSTE,P36_ID_IMPSTO,P36_ID_IMPSTO_SBMPSTO:&P33_FECHA.,&P33_FECHA_HASTA.,&FCHA_FORMATIADA.,&CDGO_TPO_AJSTE.,&P33_ID_IMPSTO.,&P33_ID_IMPSTO_SBMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(50100304346252843)
,p_chart_id=>wwv_flow_api.id(50100088670252840)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('N\00FAmero de Ajustes')
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'thousand'
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
 p_id=>wwv_flow_api.id(50100422949252844)
,p_chart_id=>wwv_flow_api.id(50100088670252840)
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
 p_id=>wwv_flow_api.id(37886625833098029)
,p_plug_name=>'Ajustes Realizados por Usuario'
,p_region_name=>'rx0'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>35
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(37886942246098032)
,p_region_id=>wwv_flow_api.id(37886625833098029)
,p_chart_type=>'bar'
,p_title=>'Ajustes Realizados por Usuario'
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
 p_id=>wwv_flow_api.id(37887088176098033)
,p_chart_id=>wwv_flow_api.id(37886942246098032)
,p_static_id=>'rxo'
,p_seq=>10
,p_name=>'Ajustes Por Usuario Credito'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'        b.id_usrio,',
'        b.nmbre_trcro,',
'        a.CDGO_TPO_AJSTE,',
'        count(b.id_usrio) count,',
' ''<b>Funcionario :</b> '' || b.nmbre_trcro || ''<br>'' ||',
unistr(' ''<b>Ajustes Realizados Cr\00E9dito:</b> ''  || to_char(count(b.id_usrio),''999,999,999,999'')  || ''<br>'' toltip_ajste'),
'',
'  from v_gf_g_ajustes             a',
'  join v_sg_g_usuarios            b on a.id_usrio = b.id_usrio',
' where a.cdgo_clnte = :F_CDGO_CLNTE ',
'   and a.CDGO_TPO_AJSTE =''CR'' ',
'   and a.id_impsto            = nvl(:P33_ID_IMPSTO,a.id_impsto)',
'   and a.id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'   and ((trunc(a.fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null ))',
'  ',
'group by b.id_usrio, b.nmbre_trcro,a.CDGO_TPO_AJSTE',
'',
'',
'',
''))
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'COUNT'
,p_items_label_column_name=>'NMBRE_TRCRO'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE'
,p_color=>'RGBA(48, 159, 219, 0.5)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,32:P32_FECHA,P32_FECHA_HASTA,P32_USRIO,P32_ID_USRIO,P32_CDGO_TPO_AJSTE,P32_ID_IMPSTO,P32_ID_IMPSTO_SBMPSTO:&P33_FECHA.,&P33_FECHA_HASTA.,&NMBRE_TRCRO.,&ID_USRIO.,&CDGO_TPO_AJSTE.,&P33_ID_IMPSTO.,&P33_ID_IMPSTO_SB'
||'MPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(50099246924252832)
,p_chart_id=>wwv_flow_api.id(37886942246098032)
,p_static_id=>'rx5'
,p_seq=>20
,p_name=>unistr('Ajustes Por Usuario D\00E9bito')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'        b.id_usrio,',
'        b.nmbre_trcro,',
'        a.CDGO_TPO_AJSTE,',
'        count(b.id_usrio) count,',
' ''<b>Funcionario :</b> '' || b.nmbre_trcro || ''<br>'' ||',
unistr(' ''<b>Ajustes Realizados D\00E9bito:</b> ''  || to_char(count(b.id_usrio),''999,999,999,999'')  || ''<br>'' toltip_ajste'),
'',
'  from v_gf_g_ajustes             a',
'  join v_sg_g_usuarios            b on a.id_usrio = b.id_usrio',
' where  CDGO_TPO_AJSTE =''DB''',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto            = nvl(:P33_ID_IMPSTO,a.id_impsto)',
'   and a.id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,a.id_impsto_sbmpsto)',
'   and ((trunc(a.fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null )) ',
'  ',
'group by b.id_usrio, b.nmbre_trcro ,a.CDGO_TPO_AJSTE',
'',
'',
'',
''))
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'COUNT'
,p_items_label_column_name=>'NMBRE_TRCRO'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE'
,p_color=>'RGB(12,237,181,0.2)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,32:P32_FECHA,P32_FECHA_HASTA,P32_USRIO,P32_ID_USRIO,P32_CDGO_TPO_AJSTE,P32_ID_IMPSTO,P32_ID_IMPSTO_SBMPSTO:&P33_FECHA.,&P33_FECHA_HASTA.,&NMBRE_TRCRO.,&ID_USRIO.,&CDGO_TPO_AJSTE.,&P33_ID_IMPSTO.,&P33_ID_IMPSTO_SB'
||'MPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(48197121410435047)
,p_chart_id=>wwv_flow_api.id(37886942246098032)
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
 p_id=>wwv_flow_api.id(37887196289098034)
,p_chart_id=>wwv_flow_api.id(37886942246098032)
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
 p_id=>wwv_flow_api.id(37887250011098035)
,p_chart_id=>wwv_flow_api.id(37886942246098032)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('N\00FAmero de Ajustes')
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'thousand'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40625669296824927)
,p_plug_name=>'Ajustes por Estados'
,p_region_name=>'rx3'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>45
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(40625716277824928)
,p_region_id=>wwv_flow_api.id(40625669296824927)
,p_chart_type=>'bar'
,p_title=>'Ajustes por Estados'
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
 p_id=>wwv_flow_api.id(40625801579824929)
,p_chart_id=>wwv_flow_api.id(40625716277824928)
,p_static_id=>'rx7'
,p_seq=>10
,p_name=>unistr('Estado de los Ajustes Cr\00E9dito')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  DSCRPCION_ESTADO,count(DSCRPCION_ESTADO) , CDGO_AJSTE_ESTDO,CDGO_TPO_AJSTE,',
'',
'''<b>Descripcion:</b> '' ||DSCRPCION_ESTADO|| ''<br>'' ||',
unistr('''<b>Ajustes Cr\00E9dito:</b> ''  || count(DSCRPCION_ESTADO) || ''<br>'' toltip_ajste_estado'),
'',
'',
'from v_gf_g_ajustes ',
'where    CDGO_TPO_AJSTE =''CR'' and cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto            = nvl(:P33_ID_IMPSTO,id_impsto)',
'   and id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'   and ((trunc(fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null ))',
'',
'group by DSCRPCION_ESTADO,CDGO_AJSTE_ESTDO,CDGO_TPO_AJSTE;',
'',
''))
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'COUNT(DSCRPCION_ESTADO)'
,p_items_label_column_name=>'DSCRPCION_ESTADO'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE_ESTADO'
,p_color=>'RGBA(48, 159, 219, 0.5)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:RP:P35_ESTDO_AJSTE,P35_FECHA,P35_FECHA_HASTA,P35_DSCRPCN_ESTD_AJSTE,P35_CDGO_TPO_AJSTE,P35_ID_IMPSTO,P35_ID_IMPSTO_SBMPSTO:&CDGO_AJSTE_ESTDO.,&P33_FECHA.,&P33_FECHA_HASTA.,&DSCRPCION_ESTADO.,&CDGO_TPO_AJSTE.,&P33_ID'
||'_IMPSTO.,&P33_ID_IMPSTO_SBMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(50099329386252833)
,p_chart_id=>wwv_flow_api.id(40625716277824928)
,p_static_id=>'rx6'
,p_seq=>20
,p_name=>unistr('Estado de los Ajustes D\00E9bito')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  DSCRPCION_ESTADO,count(DSCRPCION_ESTADO) , CDGO_AJSTE_ESTDO,CDGO_TPO_AJSTE,',
'',
'''<b>Descripcion:</b> '' ||DSCRPCION_ESTADO|| ''<br>'' ||',
unistr('''<b>Ajustes D\00E9bito:</b> ''  || count(DSCRPCION_ESTADO) || ''<br>'' toltip_ajste_estado'),
'',
'',
'from v_gf_g_ajustes ',
'where CDGO_TPO_AJSTE =''DB'' and cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto            = nvl(:P33_ID_IMPSTO,id_impsto)',
'   and id_impsto_sbmpsto    = nvl(:P33_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'   and ((trunc(fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null ))',
'   ',
'group by DSCRPCION_ESTADO,CDGO_AJSTE_ESTDO,CDGO_TPO_AJSTE;',
'',
''))
,p_ajax_items_to_submit=>'P33_FECHA,P33_FECHA_HASTA,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_items_value_column_name=>'COUNT(DSCRPCION_ESTADO)'
,p_items_label_column_name=>'DSCRPCION_ESTADO'
,p_items_short_desc_column_name=>'TOLTIP_AJSTE_ESTADO'
,p_color=>'RGB(12,237,181,0.2)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:RP:P35_ESTDO_AJSTE,P35_FECHA,P35_FECHA_HASTA,P35_DSCRPCN_ESTD_AJSTE,P35_CDGO_TPO_AJSTE,P35_ID_IMPSTO,P35_ID_IMPSTO_SBMPSTO:&CDGO_AJSTE_ESTDO.,&P33_FECHA.,&P33_FECHA_HASTA.,&DSCRPCION_ESTADO.,&CDGO_TPO_AJSTE.,&P33_ID'
||'_IMPSTO.,&P33_ID_IMPSTO_SBMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(40626055571824931)
,p_chart_id=>wwv_flow_api.id(40625716277824928)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'thousand'
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
 p_id=>wwv_flow_api.id(40625908961824930)
,p_chart_id=>wwv_flow_api.id(40625716277824928)
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
 p_id=>wwv_flow_api.id(52536771866931907)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52536933917931909)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'<p align="justify">',
'Funcionalidad que permite observar el comportamiento de los ajustes realizados a la cartera. <br><br>',
unistr('<b>1.</b> Muestra el total de ajustes aplicados, desglosa el total de ajustes de tipo d\00E9bito y total de ajustes de tipo cr\00E9dito hasta la fecha, adicionalmente se puede establecer un periodo determinado .<br><br>'),
'<b>Valor del ajuste Vs Fecha de ajuste:<br><br> </b>',
unistr('<b>1.</b>Muestra el desglose del valor del ajuste de tipo d\00E9bito o cr\00E9dito incluyendo el detalle que da origen a la gr\00E1fica haciendo clic en los puntos de control.</b><br><br> '),
unistr('<b>Cantidad de ajustes realizados cr\00E9dito o d\00E9bito Vs Fecha de ajuste:</b><br><br> '),
unistr('<b>1.</b>Muestra  la cantidad de ajustes procesados a la fecha o en un periodo determinado de los d\00E9bitos o cr\00E9ditos realizados haciendo clic en las barras obtendr\00E1 el detalle del ajuste en la fecha seleccionada (impuesto, valor, tipo de ajuste, esta')
||'do del ajuste, el usuario que lo proceso entre otros datos).<br><br>',
'<b>Cantidad de ajustes Vs Usuario:</b><br><br>',
'<b>1.</b>Muestra la cantidad de ajustes realizados por los usuarios del sistema habilitados para tal fin, es posible ver el detalle de los ajustes (impuesto, tipo de ajuste, valor del ajuste, estado del ajuste, entre otros) haciendo clic en la barra '
||unistr('correspondiente al usuario que tramit\00F3 el ajuste.<br><br>'),
'<b>Cantidad de ajustes Vs Estado del ajuste:</b><br><br>',
'<b>1.</b>Muestra los cuatro estados del ajuste (Anulado, Aplicado, No Aplicado, Registrado) vs la cantidad de ajuste que se encuentran en ese estado, es posible ver el detalle del ajuste haciendo clic en la barra correspondiente al estado (Fecha, imp'
||'uesto, estado, tipo, usuario que lo registro, entre otros). ',
'</i>',
'</p>',
'</br>',
'<br>        ',
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>        '),
'</br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52536877929931908)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(52536771866931907)
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
 p_id=>wwv_flow_api.id(37888335659098046)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(48197356450435049)
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
 p_id=>wwv_flow_api.id(24475863088711310)
,p_name=>'P33_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(48197356450435049)
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
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24475930965711311)
,p_name=>'P33_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(48197356450435049)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P33_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P33_ID_IMPSTO'
,p_ajax_items_to_submit=>'P33_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39427666950117454)
,p_name=>'P33_FECHA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(48197356450435049)
,p_item_default=>'SYSDATE-30'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Desde</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39428152063126176)
,p_name=>'P33_FECHA_HASTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(48197356450435049)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Hasta</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>18
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(37888464924098047)
,p_name=>'click en el boton consultar Ajustes por fechas creditos'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37888511657098048)
,p_event_id=>wwv_flow_api.id(37888464924098047)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(37887382337098036)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50100520081252845)
,p_name=>'click en el boton consultar Ajustes por fechas debito'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50100661145252846)
,p_event_id=>wwv_flow_api.id(50100520081252845)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(50099943294252839)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(37888626609098049)
,p_name=>'click boton consultar Ajustes totales'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37888787891098050)
,p_event_id=>wwv_flow_api.id(37888626609098049)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(37886410450098027)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39671304807391701)
,p_name=>'Click boton consultar Ajustes funcionarios'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39671427752391702)
,p_event_id=>wwv_flow_api.id(39671304807391701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(37886625833098029)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39671750156391705)
,p_name=>'click boton consultar Ajuste Credito'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39671898809391706)
,p_event_id=>wwv_flow_api.id(39671750156391705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(36142236318599121)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39671989643391707)
,p_name=>'click boton consultar Ajuste Debito'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39672049900391708)
,p_event_id=>wwv_flow_api.id(39671989643391707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(37886531974098028)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40626779842824938)
,p_name=>'Click Boton consultar Ajustes Aplicados Creditos'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40626842167824939)
,p_event_id=>wwv_flow_api.id(40626779842824938)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(39675291092391740)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50098978495252829)
,p_name=>'Click Boton consultar Ajustes Aplicados Debito'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50099014288252830)
,p_event_id=>wwv_flow_api.id(50098978495252829)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(50098205759252822)
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40626991866824940)
,p_name=>'Click boton Consultar estado Ajustes'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40627043764824941)
,p_event_id=>wwv_flow_api.id(40626991866824940)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(40625669296824927)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40627382474824944)
,p_name=>'Click boton Consultar Informacion General Ajustes'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48193800440435014)
,p_name=>'Al modificar Fecha desde'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P33_FECHA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48193967540435015)
,p_event_id=>wwv_flow_api.id(48193800440435014)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P33_FECHA_HASTA").datepicker( ''option'' , ''minDate'' , $("#P33_FECHA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24476086096711312)
,p_name=>'Calcular el primer Sub impuesto'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P33_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24476176183711313)
,p_event_id=>wwv_flow_api.id(24476086096711312)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P33_ID_IMPSTO_SBMPSTO'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_impsto_sbmpsto            number;',
'    ',
'begin',
'',
'select id_impsto_sbmpsto into v_id_impsto_sbmpsto from df_i_impuestos_subimpuesto where id_impsto = :P33_ID_IMPSTO and rownum = 1;',
'return v_id_impsto_sbmpsto;',
'end;'))
,p_attribute_07=>'P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24476256872711314)
,p_name=>unistr('Guardar en sesi\00F3n el valor del sub-impuesto selccionado')
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P33_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24476364921711315)
,p_event_id=>wwv_flow_api.id(24476256872711314)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P33_ID_IMPSTO_SBMPSTO'',:P33_ID_IMPSTO_SBMPSTO);',
'END;',
''))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24476461248711316)
,p_name=>'Nuevo'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37888335659098046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24476500180711317)
,p_event_id=>wwv_flow_api.id(24476461248711316)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setText();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32378473046610712)
,p_name=>'Calculo de Fecha Hasta'
,p_event_sequence=>170
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32378561661610713)
,p_event_id=>wwv_flow_api.id(32378473046610712)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P33_FECHA_HASTA").datepicker( ''option'' , ''minDate'' , $("#P33_FECHA").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
