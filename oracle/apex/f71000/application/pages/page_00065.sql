prompt --application/pages/page_00065
begin
wwv_flow_api.create_page(
 p_id=>65
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Panel Control Financiero'
,p_step_title=>'Panel Control Financiero'
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
'',
'function buttonCollapse(id){',
'	if($(''#''+id).attr(''aria-expanded'') != ''true''){',
'		$(''#''+id).click();',
'	}',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'tooltipRXI();',
'',
'buttonCollapse(''t_Button_rightControlButton'');'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'.t-Cards--compact .t-Card .t-Card-title {',
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
'',
'',
'*/',
'',
'.t-Card-body {',
'    flex-grow: 21;',
'    padding: 16px;',
'    display: flex;',
'    flex-direction: inherit;',
'  /*   flex-direction: row-reverse; */',
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
'',
' .t-Card-info {',
'     color: #666;',
'     /* color: #000; */',
'     font-size: 1.1rem;',
'     font-style: italic;',
'     font-weight: bold;',
'/*     font-weight: normal;*/',
'     ',
'}',
'',
'.t-Card-initials',
'{',
'   font-size: 1rem;',
'    ',
'}',
'',
'',
'',
'#rx0 polygon{',
'    stroke: #309fdb;',
'    stroke-width: 2px;',
'}',
'',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200926095619'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31772333423501124)
,p_plug_name=>'Panel de Control'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31772681496501127)
,p_plug_name=>'Deuda Total'
,p_parent_plug_id=>wwv_flow_api.id(31772333423501124)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs:margin-top-sm:margin-left-sm:margin-right-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''$'' || nvl(to_char(sum(vlor_dbe - vlor_hber), ''999G999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) sldo_ttal, ''Total Movimientos'' title',
'from v_gf_g_movimientos_detalle a',
'where cdgo_clnte = :F_CDGO_CLNTE ',
'  and (a.id_sjto_impsto in (select m.id_sjto_impsto ',
'                              from gi_g_obras_sujeto_impuesto m ',
'                              join gi_g_obras n on m.id_obra = n.id_obra',
'                             where n.cdgo_clnte = :F_CDGO_CLNTE ',
'                               and n.id_obra = :P65_ID_OBRA)',
'    or :P65_ID_OBRA is null)',
'    and (',
'            (:P65_FILTRAR_POR = ''VG'' and a.vgncia = :P65_VGNCIA) ',
'         or (:P65_FILTRAR_POR = ''FC'' and (',
'                                            (trunc(a.fcha_mvmnto) between :P65_FCHA_INCIO and :P65_FCHA_FIN)',
'                                         or (trunc(a.fcha_mvmnto) >= :P65_FCHA_INCIO and :P65_FCHA_FIN is null) ',
'                                         or (trunc(a.fcha_mvmnto) <= :P65_FCHA_FIN and :P65_FCHA_INCIO  is null)',
'                                          or(:P65_FCHA_INCIO is null and :P65_FCHA_FIN is null )  ',
'                                         ) ',
'            ) ',
'         );'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P65_VGNCIA,P65_FCHA_INCIO,P65_FCHA_FIN,P65_FILTRAR_POR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'SLDO_TTAL'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TITLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31772914496501130)
,p_plug_name=>'<b><i>Deuda por Tributos</i></b>'
,p_region_name=>'rx0'
,p_parent_plug_id=>wwv_flow_api.id(31772333423501124)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(31773020716501131)
,p_region_id=>wwv_flow_api.id(31772914496501130)
,p_chart_type=>'bar'
,p_height=>'200'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'on'
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
 p_id=>wwv_flow_api.id(31773173906501132)
,p_chart_id=>wwv_flow_api.id(31773020716501131)
,p_seq=>10
,p_name=>'Deuda por Impuestos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto, a.nmbre_impsto, nvl(sum(vlor_dbe - vlor_hber),0) sldo_ttal, ''Deuda por Impuestos'' title,',
'        ''<b>Impuesto :</b> '' || a.nmbre_impsto || ''<br>'' ||',
'        ''<b>Saldo:</b> $'' || nvl(to_char(sum(vlor_dbe - vlor_hber), ''999G999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) || ''<br>'' toltip_impsto,',
'       ''$'' ||  nvl(to_char(sum(vlor_dbe - vlor_hber), ''999G999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) sldo_ttal_impsto',
'  from df_c_impuestos a ',
'  left join v_gf_g_movimientos_detalle b on a.id_impsto= b.id_impsto ',
'       and ((:P65_FILTRAR_POR = ''VG'' and vgncia = nvl(:P65_VGNCIA,vgncia))',
'      or ( ',
'          :P65_FILTRAR_POR = ''FC'' ',
'                                                                     and ((trunc(b.fcha_mvmnto) between :P65_FCHA_INCIO and :P65_FCHA_FIN)',
'                                                                     or (trunc(b.fcha_mvmnto) >= :P65_FCHA_INCIO and :P65_FCHA_FIN is null) ',
'                                                                     or (trunc(b.fcha_mvmnto) <= :P65_FCHA_FIN and :P65_FCHA_INCIO  is null)',
'                                                                     or(:P65_FCHA_INCIO is null and :P65_FCHA_FIN is null ))))',
'  where a.cdgo_clnte = :F_CDGO_CLNTE ',
'    and (b.id_sjto_impsto in (select m.id_sjto_impsto ',
'                              from gi_g_obras_sujeto_impuesto m ',
'                              join gi_g_obras n on m.id_obra = n.id_obra',
'                             where n.cdgo_clnte = :F_CDGO_CLNTE ',
'                               and n.id_obra = :P65_ID_OBRA)',
'                                or :P65_ID_OBRA is null)',
'  and a.actvo = ''S''',
'  group by a.id_impsto, a.nmbre_impsto',
'  order by a.nmbre_impsto;'))
,p_ajax_items_to_submit=>'P65_VGNCIA,P65_FCHA_INCIO,P65_FCHA_FIN'
,p_items_value_column_name=>'SLDO_TTAL'
,p_items_label_column_name=>'NMBRE_IMPSTO'
,p_items_short_desc_column_name=>'TOLTIP_IMPSTO'
,p_color=>'RGBA(48, 159, 219, 0.2)'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,66:P66_ID_IMPSTO,P66_VGNCIA,P66_SLDO_TTAL:&ID_IMPSTO.,&P65_VGNCIA.,&SLDO_TTAL_IMPSTO.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(31773372091501134)
,p_chart_id=>wwv_flow_api.id(31773020716501131)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Deuda por Tributos'
,p_format_type=>'currency'
,p_currency=>'COP'
,p_format_scaling=>'million'
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
 p_id=>wwv_flow_api.id(31773228506501133)
,p_chart_id=>wwv_flow_api.id(31773020716501131)
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
 p_id=>wwv_flow_api.id(32959862334518106)
,p_plug_name=>'Parametros'
,p_parent_plug_id=>wwv_flow_api.id(31772333423501124)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(32959920278518107)
,p_name=>'Cartera por Estado'
,p_region_name=>'rxi'
,p_parent_plug_id=>wwv_flow_api.id(31772333423501124)
,p_template=>wwv_flow_api.id(177332998617050607)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-sm:margin-bottom-md:margin-left-sm:margin-right-none'
,p_component_template_options=>'u-colors:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with c_ttal_sjto_impsto as (',
'                            select count (distinct a.id_sjto_impsto) ttal_sjto_impsto',
'                              from v_gf_g_movimientos_detalle a ',
'                             where a.cdgo_clnte = :F_CDGO_CLNTE',
'                               and a.CDGO_MVNT_FNCRO_ESTDO in (''NO'',''CN'',''RC'') ',
'                                 and (a.id_sjto_impsto in (select m.id_sjto_impsto ',
'                                                             from gi_g_obras_sujeto_impuesto m ',
'                                                             join gi_g_obras n on m.id_obra = n.id_obra',
'                                                            where n.cdgo_clnte = :F_CDGO_CLNTE ',
'                                                              and n.id_obra = :P65_ID_OBRA)',
'                                  or :P65_ID_OBRA is null)',
'    ',
'                               and (',
'                                    (:P65_FILTRAR_POR = ''VG'' and a.vgncia = :P65_VGNCIA) ',
'                                 or (:P65_FILTRAR_POR = ''FC'' and (',
'                                                                    (trunc(a.fcha_mvmnto) between :P65_FCHA_INCIO and :P65_FCHA_FIN)',
'                                                                 or (trunc(a.fcha_mvmnto) >= :P65_FCHA_INCIO and :P65_FCHA_FIN is null) ',
'                                                                 or (trunc(a.fcha_mvmnto) <= :P65_FCHA_FIN and :P65_FCHA_INCIO  is null)',
'                                                                 or (:P65_FCHA_INCIO is null and :P65_FCHA_FIN is null )  ',
'                                                                 ) ',
'                                    ) ',
'                                  )',
'                                 ',
'                            ) ',
'',
' select a.cdgo_mvnt_fncro_estdo,',
'        upper (a.DSCRPCION)                                                                                                  card_title,',
'        count (distinct c.id_sjto_impsto) count_sjto_impsto,',
'        dbms_lob.getlength(a.file_blob)                                                                                      card_text,',
'        ''Total Deuda: $'' || nvl(to_char(sum(vlor_dbe - vlor_hber), ''999G999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0)',
'       || ''<br> Total Sujetos: '' ||nvl(to_char(count (distinct c.id_sjto_impsto), ''999G999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) ',
'       || ''<br> Porcentaje: '' || to_char( (nvl( count(distinct c.id_sjto_impsto),0)  * 100)  /  decode(b.ttal_sjto_impsto,0,1,b.ttal_sjto_impsto), ''9990D99'')',
'       || ''%''                     card_subtext',
'   from gf_d_mvmnto_fncro_estdo          a',
'   join c_ttal_sjto_impsto               b on b.ttal_sjto_impsto       = b.ttal_sjto_impsto',
'   left join v_gf_g_movimientos_detalle  c on a.CDGO_MVNT_FNCRO_ESTDO  = c.cdgo_mvnt_fncro_estdo     ',
'         and (',
'                (:P65_FILTRAR_POR = ''VG'' and c.vgncia = :P65_VGNCIA) ',
'             or (:P65_FILTRAR_POR = ''FC'' and (',
'                                                (trunc(c.fcha_mvmnto) between :P65_FCHA_INCIO and :P65_FCHA_FIN)',
'                                             or (trunc(c.fcha_mvmnto) >= :P65_FCHA_INCIO and :P65_FCHA_FIN is null) ',
'                                             or (trunc(c.fcha_mvmnto) <= :P65_FCHA_FIN and :P65_FCHA_INCIO  is null)',
'                                              or(:P65_FCHA_INCIO is null and :P65_FCHA_FIN is null )  ',
'                                             ) ',
'                ) ',
'             )                                        ',
'   where c.cdgo_clnte = :F_CDGO_CLNTE ',
'     and a.cdgo_mvnt_fncro_estdo in (''NO'',''CN'',''RC'')  ',
'     and (c.id_sjto_impsto in (select m.id_sjto_impsto ',
'                              from gi_g_obras_sujeto_impuesto m ',
'                              join gi_g_obras n on m.id_obra = n.id_obra',
'                             where n.cdgo_clnte = :F_CDGO_CLNTE ',
'                               and n.id_obra = :P65_ID_OBRA)',
'                                or :P65_ID_OBRA is null)',
'   group by b.ttal_sjto_impsto , ',
'            a.dscrpcion,',
'            a.cdgo_mvnt_fncro_estdo,',
'            dbms_lob.getlength(a.file_blob) ',
'   order by 3 desc;            ',
'   ',
'',
''))
,p_ajax_items_to_submit=>'P65_VGNCIA,P65_FCHA_INCIO,P65_FCHA_FIN,P65_FILTRAR_POR'
,p_query_row_template=>wwv_flow_api.id(177340194218050611)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30167968602586827)
,p_query_column_id=>1
,p_column_alias=>'CDGO_MVNT_FNCRO_ESTDO'
,p_column_display_sequence=>1
,p_column_heading=>'Cdgo Mvnt Fncro Estdo'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30168086350586828)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(51645974143643521)
,p_query_column_id=>3
,p_column_alias=>'COUNT_SJTO_IMPSTO'
,p_column_display_sequence=>5
,p_column_heading=>'Count Sjto Impsto'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30168109816586829)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_column_format=>'IMAGE:GF_D_MVMNTO_FNCRO_ESTDO:FILE_BLOB:CDGO_MVNT_FNCRO_ESTDO::::::::'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30168257372586830)
,p_query_column_id=>5
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Card Subtext'
,p_column_format=>'PCT_GRAPH:::'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52536218359931902)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52536320902931903)
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
'Funcionalidad que permite mostrar el resumen Financiero indicando el monto total de la cartera por vigencia y por tipo de tributos.<br><br>',
unistr('<b>1.</b>Permite imprimir el reporte con los datos m\00E1s destacados de la cartera.<br><br>'),
'',
'<b>Deuda vs Tributos</b><br><br>',
'<b>2.</b> Permite observar el valor de la dauda por tipo de tributos. Haciendo clic en la barra del tributos muestra el detalle de cada correspondiente a cada tributos ',
'',
'',
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52536100541931901)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(52536218359931902)
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
 p_id=>wwv_flow_api.id(30168330382586831)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(32959862334518106)
,p_button_name=>'Imprimir'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapLeft:t-Button--gapRight:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:65:&SESSION.:PRINT_REPORT=re_p_gestion_financiera:&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(30168525721586833)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:&P65_RPRTE.,<P_VIGENCIA>&P65_VGNCIA.</P_VIGENCIA>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(30168330382586831)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30168466496586832)
,p_name=>'P65_RPRTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(32959862334518106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31772494912501125)
,p_name=>'P65_VGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(32959862334518106)
,p_prompt=>'Vigencia'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_vgncia    number;',
'    ',
'begin',
'    select max(vgncia) vgncia into v_vgncia from v_gf_g_movimientos_detalle where cdgo_clnte = :F_CDGO_CLNTE;',
'    ',
'    return v_vgncia;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>'<i>Vigencia a la cual se le realizaron los movimientos financieros</i>'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51460918545827615)
,p_name=>'P65_FCHA_INCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(32959862334518106)
,p_item_default=>'''01-'' || to_char( systimestamp , ''MON-YYYY'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Inicio:'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<i>Fecha de inicio en que se realizaron los movimientos financieros</i>'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51461979607830227)
,p_name=>'P65_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(32959862334518106)
,p_item_default=>'to_char( systimestamp , ''DD-MON-YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Fin:'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<i>Fecha final en que se realizaron los movimientos financieros</i>'
,p_attribute_02=>'&P120_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51644391747643505)
,p_name=>'P65_FILTRAR_POR'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(32959862334518106)
,p_item_default=>'VG'
,p_prompt=>'Filtrar Por'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Vigencia;VG,Fechas;FC'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77220462814794201)
,p_name=>'P65_ID_OBRA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(32959862334518106)
,p_prompt=>'Obra'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select dscrpcion d,',
'        id_obra r',
'   from gi_g_obras',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'  order by d'))
,p_lov_display_null=>'YES'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_obra r',
'   from gi_g_obras',
'  where cdgo_clnte = :F_CDGO_CLNTE '))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31772781026501128)
,p_name=>unistr('Al cambiar el valor de la vigencia se refrezca la regi\00F3n de Deuda Total')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P65_VGNCIA,P65_FCHA_INCIO,P65_FCHA_FIN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31772808423501129)
,p_event_id=>wwv_flow_api.id(31772781026501128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(31772681496501127)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32619128052032603)
,p_name=>unistr('Al cambiar el valor de la vigencia se refrezca la regi\00F3n de Deuda por impuesto')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P65_VGNCIA,P65_FCHA_FIN,P65_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32619251106032604)
,p_event_id=>wwv_flow_api.id(32619128052032603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(31772914496501130)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35405579686267601)
,p_name=>unistr('Al cambiar el valor de la vigencia se refrezca la regi\00F3n de Cartera por Estado')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P65_VGNCIA,P65_FCHA_INCIO,P65_FCHA_FIN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35405670391267602)
,p_event_id=>wwv_flow_api.id(35405579686267601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(32959920278518107)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(51644405087643506)
,p_name=>unistr('Mostrar \00EDtems de filtro')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P65_FILTRAR_POR'
,p_condition_element=>'P65_FILTRAR_POR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'VG'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51644521517643507)
,p_event_id=>wwv_flow_api.id(51644405087643506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P65_VGNCIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51645076448643512)
,p_event_id=>wwv_flow_api.id(51644405087643506)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P65_VGNCIA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51645262180643514)
,p_event_id=>wwv_flow_api.id(51644405087643506)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P65_FCHA_INCIO,P65_FCHA_FIN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51644758735643509)
,p_event_id=>wwv_flow_api.id(51644405087643506)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P65_FCHA_INCIO,P65_FCHA_FIN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51645306268643515)
,p_event_id=>wwv_flow_api.id(51644405087643506)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P65_VGNCIA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51645114267643513)
,p_event_id=>wwv_flow_api.id(51644405087643506)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P65_FCHA_INCIO,P65_FCHA_FIN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(51646239060643524)
,p_name=>unistr('Refrescar P\00E1gina')
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P65_VGNCIA,P65_ID_OBRA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51646305550643525)
,p_event_id=>wwv_flow_api.id(51646239060643524)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
end;
/
