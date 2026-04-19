prompt --application/pages/page_00072
begin
wwv_flow_api.create_page(
 p_id=>72
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Desembargo Masivo'
,p_step_title=>'Desembargo Masivo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel(valid) {',
'',
'    var region = apex.region("Embargos_a_Desembargar");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_ER": model.getValue(record, "ID_EMBRGOS_RSLCION").trim(),',
'                     "ID_EC": model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "ID_TE": model.getValue(record, "ID_TPOS_EMBRGO").trim(),',
'                     "ID_CC": model.getValue(record, "CDGO_CLNTE").trim(),',
'                     "CD_TD": model.getValue(record, "CDGO_CSAL").trim(),',
'                     "ID_IF": model.getValue(record, "ID_INSTNCIA_FLJO").trim(),',
'                     "ID_IT": model.getValue(record, "ID_FLJO_TREA").trim()',
'                   };',
'        });',
'        ',
'        ',
'                       ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        //$s(''P72_JSON'', json.length > 0 ? JSON.stringify(json) : '''');',
'        if(valid){',
'            window.localStorage.setItem(''jsonDesembargosMasivos'', json.length > 0 ? JSON.stringify(json) : '''');',
'        }',
'                       ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("Desembargo_masivo").show();',
'        }else {',
'            apex.item("Desembargo_masivo").hide();',
'        }',
'		',
'        return;',
'    }',
'    ',
'    apex.item("Desembargo_masivo").hide();',
'    ',
'}',
'',
'function seleccionarTodos(e,btn,grid,data){',
'    var datos = data.map((m) => {',
'            return { "ID_ER": m.ID_EMBRGOS_RSLCION,',
'                     "ID_EC": m.ID_EMBRGOS_CRTRA,',
'                     "ID_TE": m.ID_TPOS_EMBRGO,',
'                     "ID_CC": m.CDGO_CLNTE,',
'                     "CD_TD": m.CDGO_CSAL,',
'                     "ID_IF": m.ID_INSTNCIA_FLJO,',
'                     "ID_IT": m.ID_FLJO_TREA',
'                   };',
'        }); ',
'    window.localStorage.setItem(''jsonDesembargosMasivos'', JSON.stringify(datos));',
'    //apex.submit(''Desembargo_masivo'');',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_sel();',
'apex.item("BTN_IR").hide();'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20241015095053'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11485582272559423)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105084476641319338)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105084950894319343)
,p_plug_name=>'Embargos_a_Desembargar'
,p_region_name=>'Embargos_a_Desembargar'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'distinct(c.nmro_acto) nmro_acto,',
'trunc(c.fcha_acto) AS fcha_acto,',
'c.dscrpcion_tipo_embargo,',
'c.idntfccion',
',c.id_instncia_fljo',
',c.id_fljo_trea',
',c.cdgo_clnte',
',c.Id_Embrgos_Rslcion',
',c.id_embrgos_crtra',
',c.id_tpos_mdda_ctlar id_tpos_embrgo',
',c.idntfccion_sjto',
',c.cdgo_csal',
',c.descripcion_csal_dsmbrgo',
'from v_gf_g_cartera_x_concepto a',
'join v_si_i_sujetos_impuesto b on b.id_sjto_impsto    = a.id_sjto_impsto',
'join mc_g_desembargos_poblacion  c on c.idntfccion_sjto=b.idntfccion_sjto',
'join v_gf_g_cartera_x_vigencia d on d.id_sjto_impsto=a.id_sjto_impsto',
'                                and d.vgncia=a.vgncia',
'join v_mc_g_embargos_cartera  e on e.id_sjto = b.id_sjto    ',
'join v_mc_g_embargos_resolucion h on h.id_embrgos_crtra = e.id_embrgos_crtra',
'                               and h.cdgo_estdos_crtra not in (''D'')',
'join gn_g_actos i on i.ID_ACTO = h.ID_ACTO',
'join gn_g_actos_sujeto_impuesto j on j.ID_ACTO = i.ID_ACTO',
'where  a.cdgo_clnte        = :F_CDGO_CLNTE ',
'       and exists (select 1',
'                 from mc_g_embargos_sjto x',
'                where x.id_sjto = b.id_sjto',
'                  and x.id_embrgos_crtra =c.id_embrgos_crtra)',
'                   --and a.vlor_sldo_cptal   > 0',
'                   and a.dscrpcion_mvnt_fncro_estdo = ''Normal''',
'                   and exists (select 1',
'                             from gf_g_movimientos_financiero m',
'                            where a.cdgo_clnte = m.cdgo_clnte',
'                              and a.id_impsto = m.id_impsto',
'                              and a.id_impsto_sbmpsto = m.id_impsto_sbmpsto',
'                              and a.id_sjto_impsto = m.id_sjto_impsto',
'                              and a.vgncia = m.vgncia',
'                              and a.id_prdo = m.id_prdo',
'                              and m.cdgo_mvnt_fncro_estdo in (''CN'',''NO'')',
'                              --and a.vlor_sldo_cptal > 0',
'                              )',
'        and   c.descripcion_csal_dsmbrgo not like ''%Causal:  (%''',
'        and  (c.id_tpos_mdda_ctlar  = :P72_TPOS_MDDA_CTLAR or  c.id_tpos_mdda_ctlar is null)',
'        and (:P72_IDNTFCCION is null or  ltrim(trim(c.idntfccion),0) = ltrim(trim(:P72_IDNTFCCION),0)    ) ',
'',
'',
'',
'',
'',
'/*select',
'distinct(c.nmro_acto) nmro_acto,',
'trunc(c.fcha_acto) AS fcha_acto,',
'c.dscrpcion_tipo_embargo,',
'c.idntfccion',
',c.id_instncia_fljo',
',c.id_fljo_trea',
',c.cdgo_clnte',
',c.Id_Embrgos_Rslcion',
',c.id_embrgos_crtra',
',c.id_tpos_mdda_ctlar id_tpos_embrgo',
',c.idntfccion_sjto',
',c.cdgo_csal',
',c.descripcion_csal_dsmbrgo',
'from v_gf_g_cartera_x_concepto a',
'join v_si_i_sujetos_impuesto b on b.id_sjto_impsto    = a.id_sjto_impsto',
'join mc_g_desembargos_poblacion  c on c.idntfccion_sjto=b.idntfccion_sjto',
'where  a.cdgo_clnte        = :F_CDGO_CLNTE ',
'               and exists (select 1',
'                             from mc_g_embargos_sjto x',
'                            where x.id_sjto = b.id_sjto',
'                              and x.id_embrgos_crtra =c.id_embrgos_crtra)',
'               and a.vlor_sldo_cptal   > 0',
'               and a.dscrpcion_mvnt_fncro_estdo = ''Normal''',
'               and exists (select 1',
'                             from gf_g_movimientos_financiero m',
'                            where a.cdgo_clnte = m.cdgo_clnte',
'                              and a.id_impsto = m.id_impsto',
'                              and a.id_impsto_sbmpsto = m.id_impsto_sbmpsto',
'                              and a.id_sjto_impsto = m.id_sjto_impsto',
'                              and a.vgncia = m.vgncia',
'                              and a.id_prdo = m.id_prdo',
'                              and m.cdgo_mvnt_fncro_estdo = ''NO''',
'                              and a.vlor_sldo_cptal > 0)',
' and         id_tpos_mdda_ctlar  in  (',
'                                            SELECT  cdna',
'                                            FROM    TABLE   (',
'                                                                pkg_gn_generalidades.fnc_ca_split_table (',
'                                                                                                            p_cdna          =>  :P72_TPOS_MDDA_CTLAR,',
'                                                                                                            p_crcter_dlmtdor=>  '':''',
'                                                                                                        )',
'                                                            ) )',
'   and (:P72_IDNTFCCION is null or  ltrim(trim(idntfccion),0) = ltrim(trim(:P72_IDNTFCCION),0)    )',
' */'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10639262123780518)
,p_name=>'CDGO_CSAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CSAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(10639677407780522)
,p_name=>'DESCRIPCION_CSAL_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION_CSAL_DSMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Causales de Desembargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(10639707140780523)
,p_name=>'ID_TPOS_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPOS_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(10640262105780528)
,p_name=>'DSCRPCION_TIPO_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TIPO_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(10640357898780529)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n del Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(62816861579590321)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62816994847590322)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(107423218419637007)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Resoluci\00F3n <br>de Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(107423301519637008)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha <br>Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(107423532769637010)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n <br> Responsable')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(107423811384637013)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(107423972279637014)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(107424090940637015)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(107424254570637017)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(107424316931637018)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(107423150839637006)
,p_internal_uid=>107423150839637006
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>false
,p_csv_separator=>';'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>400
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'	config.initialSelection = false;',
'   window.localStorage.removeItem(''jsonDesembargosMasivos'');',
'    return selectAll(config, {',
'        name: ''Todos'',',
'        action: seleccionarTodos',
'    }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(107455200985272750)
,p_interactive_grid_id=>wwv_flow_api.id(107423150839637006)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>100
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(107455354487272750)
,p_report_id=>wwv_flow_api.id(107455200985272750)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10845149664577774)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(10639262123780518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10877966381072553)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(10639677407780522)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>317
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10882130597131708)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(10639707140780523)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10912447204344915)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10640262105780528)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10912932740344924)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(10640357898780529)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>208
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(64344809010728694)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(62816861579590321)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(64345316890728700)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(62816994847590322)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107455834716272751)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(107423218419637007)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>137
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107456339712272754)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(107423301519637008)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107457355763272765)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(107423532769637010)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107458848864272771)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(107423811384637013)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107459367551272772)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(107423972279637014)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107459863617272775)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(107424090940637015)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107484657547331710)
,p_view_id=>wwv_flow_api.id(107455354487272750)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(107424254570637017)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107424560064637020)
,p_plug_name=>unistr('Par\00E1metros de Procesamiento')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107622823624608012)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <center>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </center>',
'</h5>',
'<p>',
'<b><i></i></b>Esta funcionalidad permite realizar los desembargos de manera masiva, contando con las siguientes opciones:<br><br>',
'',
'<b><i>1.</i></b>Consultar los embargos candidatos para desembargo donde se indica el motivo por el cual se va a desembargar.<br><br>',
'',
'<b><i>2.</i></b>Generar los desembargos de manera masiva es cogiendo los causales por los cuales se van a realizar los desembargos.<br><br>',
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</p>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11485631595559424)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(11485582272559423)
,p_button_name=>'BTN_IR'
,p_button_static_id=>'BTN_IR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Impresi\00F3n de actos')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-external-link-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105084772989319341)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(105084476641319338)
,p_button_name=>'Consultar_registros'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar Registros'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107424741738637022)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(11485582272559423)
,p_button_name=>'Desembargo_masivo'
,p_button_static_id=>'Desembargo_masivo'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Lote <br> Desembargo Masivo'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(11485726294559425)
,p_branch_name=>'Go To Page #'
,p_branch_action=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP,63:P63_ID_LTE_MDDA_CTLAR,P63_TIPO_PROCESO:&P72_ID_LTE_MDDA_CTLAR.,D&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(11485631595559424)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11485844627559426)
,p_name=>'P72_ID_LTE_MDDA_CTLAR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(105084476641319338)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23612722707126807)
,p_name=>'P72_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(105084476641319338)
,p_prompt=>unistr('Identificaci\00F3n Responsable')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105084536722319339)
,p_name=>'P72_TPO_CRTRA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105084476641319338)
,p_prompt=>'Tipo de Cartera'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Cartera Total;CT,Cartera de Embargo;CE'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de cartera a consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105084641267319340)
,p_name=>'P72_TPOS_MDDA_CTLAR'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105084476641319338)
,p_prompt=>'Tipos de Medida Cautelar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_tpos_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el/los tipo(s) de medida(s) cautelar(es) a consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107424621131637021)
,p_name=>'P72_CSLES_DSMBRGO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(107424560064637020)
,p_prompt=>'Causales de Desembargo'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_csal,id_csles_dsmbrgo',
'from mc_d_causales_desembargo',
'WHERE cdgo_clnte = :F_CDGO_CLNTE',
'and dsmbrgo_msvo = ''S'';'))
,p_tag_attributes=>'disabled'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el/los tipo(s) de causal(es) de desembargo a procesar.'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107621944836608003)
,p_name=>'P72_JSON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(105084476641319338)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(107622295731608006)
,p_name=>'al seleccionar datos de la grilla '
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(105084950894319343)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(107622375683608007)
,p_event_id=>wwv_flow_api.id(107622295731608006)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel(true);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(116933168043382738)
,p_name=>'al hacer click en el boton desembargo masivo'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(107424741738637022)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(116933267127382739)
,p_event_id=>wwv_flow_api.id(116933168043382738)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEst\00E1 seguro de realizar el/los Desembargo(s) de forma masiva?'', async function(ok) {'),
'    if (ok) {',
'',
'',
'        let $waitPopup = apex.widget.waitPopup();',
'        try {',
'            var json = window.localStorage.jsonDesembargosMasivos;',
'            JSON.parse(json);',
'        } catch (e) {',
'            apex.message.showErrors([{',
'                type: "error",',
'                location: ["page"],',
'                message: "Error al parsear JSON: " + e.message,',
'                unsafe: false',
'            }]);',
'            return; // Salir si hay un error con el JSON',
'        }',
'',
'        try {',
'            //debugger;',
'            if (apex.page.validate()) {',
'',
'                let resp = await apex.server.process("RegistrarDesembargos", {',
'                    f01: json,',
'                    pageItems: "#P72_CSLES_DSMBRGO,#P72_TPO_CRTRA,#P72_TPOS_MDDA_CTLAR"',
'                });',
'                ',
'                console.log("Respuesta completa del servidor:", resp);',
'',
'                if (resp.type === ''OK'') {',
'                    console.log(''Respuesta de Desembargo: '', resp.type);',
'                    apex.message.showPageSuccess(resp.msg);',
'                    apex.region(''Embargos_a_Desembargar'').refresh();',
'                    $s(''P72_ID_LTE_MDDA_CTLAR'', resp.v_id_lte_mdda_ctlar);',
'',
'                    if (resp.v_id_lte_mdda_ctlar > 0) {',
'                        apex.item("BTN_IR").show();',
'                    } else {',
'                        apex.item("BTN_IR").hide();',
'                    }',
'                    //window.location.href = resp.url;',
'                }',
'            }',
'        } catch (e) {',
'            console.error("Error capturado:", e);',
'            apex.message.clearErrors();',
'            apex.message.showErrors([{',
'                type: "error",',
'                location: ["page"],',
'                message: "No se encontraron datos seleccionados. Error: " + e.message,',
'                unsafe: false',
'            }]);',
'        } finally {',
'            if ($waitPopup)',
'                $waitPopup.remove();',
'        }',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10652257343987601)
,p_name=>unistr('Al dar click en el bot\00F3n Consultar_registros')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(105084772989319341)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10654456342987623)
,p_event_id=>wwv_flow_api.id(10652257343987601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var tpo_mdda_ctlar = $v(''P72_TPOS_MDDA_CTLAR'');',
'',
'if (tpo_mdda_ctlar == ''''){',
'    Swal.fire({        icon: ''error'',',
unistr('        title:  ''<H2 >Validaci\00F3n</H2>'','),
'        html: ''<H4>El campo Tipo de Medida Cautelar es requerido.</H4>''',
'    });',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10652424445987603)
,p_event_id=>wwv_flow_api.id(10652257343987601)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P72_IDNTFCCION,P72_TPOS_MDDA_CTLAR,P72_TPO_CRTRA,P72_CSLES_DSMBRGO'
,p_attribute_03=>'P72_IDNTFCCION,P72_TPOS_MDDA_CTLAR,P72_TPO_CRTRA,P72_CSLES_DSMBRGO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10652306096987602)
,p_event_id=>wwv_flow_api.id(10652257343987601)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(105084950894319343)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105084811531319342)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Registros a Desembargar'
,p_process_sql_clob=>'pkg_cb_medidas_cautelares.prc_vl_desembargo_masivo_2(p_cdgo_clnte => :F_CDGO_CLNTE, p_idntfccion => :P72_IDNTFCCION);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107424451690637019)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(105084950894319343)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Embargos_a_Desembargar: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107622421031608008)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar desembargos masivos'
,p_process_sql_clob=>'pkg_cb_medidas_cautelares.prc_vl_desembargo_masivo_2(p_cdgo_clnte => :F_CDGO_CLNTE, p_idntfccion => :P72_IDNTFCCION);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(107424741738637022)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Desembargos realizados con \00E9xito!!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116933036383382737)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RegistrarDesembargos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                      clob;',
'    v_url                       varchar2(4000);',
'    v_error                     varchar2(4000);',
'    v_cdgo_rspsta               number;',
'    v_mnsje_rspsta              varchar2(4000);',
'    v_id_lte_mdda_ctlar         number;',
'	v_nmro_mdda_ctlar_lte       number;',
'    v_nmro_cnsctvo_ofcio        number;',
'    v_cntdad_dsmbrgo_lote       number;',
'    o_cdgo_rspsta       		number;',
'    o_mnsje_rspsta       		varchar2(4000); ',
'	',
'begin',
'   -- delete from muerto;',
'    for i in 1..apex_application.g_f01.count loop   ',
'        v_json :=  v_json || apex_application.g_f01(i);',
'    end loop;',
'    v_error := null;      ',
'    ',
'    begin',
'       /* pkg_cb_medidas_cautelares.prc_ca_tpo_prcsmnto_desmbrgos( p_cdgo_clnte		 => v(''F_CDGO_CLNTE'')',
'                                                                ,p_id_usuario        => v(''F_ID_USRIO'')',
'                                                                ,p_csles_dsmbargo    => v(''P72_CSLES_DSMBRGO'')',
'                                                                ,p_json_embargos     => v_json',
'                                                                ,p_dsmbrgo_tpo		 => :P72_TPOS_MDDA_CTLAR--	p_dsmbrgo_tpo ',
'                                                                ,o_id_lte_mdda_ctlar => v_id_lte_mdda_ctlar ---- HACE FALTA',
'                                                                ,o_mnsje_rspsta		 => v_mnsje_rspsta',
'                                                                ,o_cdgo_rspsta		 => v_cdgo_rspsta) ;     */                                        ',
'        insert into muerto (c_001) values (''v_json: '' || v_json); commit; ',
'                       ',
'		pkg_mc_medidas_cautelares.pr_ca_prcsmnto_lte_dsmbrgo (p_cdgo_clnte          => v(''F_CDGO_CLNTE'')',
'															, p_csles_dsmbargo      => v(''P72_CSLES_DSMBRGO'')',
'															, p_dsmbrgo_tpo         => :P72_TPOS_MDDA_CTLAR',
'															, p_json                => v_json',
'															, p_id_usrio            => v(''F_ID_USRIO'')',
'															, p_app_ssion           => v(''APP_SESSION'')',
'															, o_id_mdda_ctlar_lte   => v_id_lte_mdda_ctlar',
'															, o_nmro_mdda_ctlar_lte => v_nmro_mdda_ctlar_lte',
'															, o_cdgo_rspsta         => v_cdgo_rspsta',
'															, o_mnsje_rspsta        => v_mnsje_rspsta);',
'',
'        insert into muerto (c_001) values (''v_mnsje_rspsta: '' || v_mnsje_rspsta); commit;      ',
'        insert into muerto (c_001) values (''v_cdgo_rspsta: '' || v_cdgo_rspsta); commit;      ',
'        ',
'        if v_cdgo_rspsta != 0 then ',
'            raise_application_error( -20001 , v_mnsje_rspsta );',
'        else',
'            if  v_id_lte_mdda_ctlar > 0 then',
'                select nmro_cnsctvo,',
'                       cntdad_dsmbrgo_lote',
'				  into v_nmro_cnsctvo_ofcio,',
'                       v_cntdad_dsmbrgo_lote',
'				  from mc_g_lotes_mdda_ctlar',
'				 where id_lte_mdda_ctlar    = v_id_lte_mdda_ctlar;',
'                -- v_mnsje_rspsta := ''Se Genero el acto de Desembargo No. ''|| v_nmro_cnsctvo_ofcio||'' con un numero total de '' ||v_cntdad_dsmbrgo_lote||'' de desembargos.'';',
'                 v_mnsje_rspsta := ''Se Genero el Lote de Desembargo No. ''|| v_nmro_cnsctvo_ofcio;',
'            end if;',
'             v_url := apex_util.prepare_url( p_url => ''f?p='' || v(''APP_ID'') || '':72:''|| v(''APP_SESSION'')||''::NO:::'', p_checksum_type => ''SESSION'');',
'             ',
'             htp.p(''{"type":"OK","url":"''||v_url||''","msg":"''||case when v_cdgo_rspsta = 0 ',
'                                 then  v_mnsje_rspsta',
'                                 else v_mnsje_rspsta',
'                            end ||''", "v_id_lte_mdda_ctlar":''||  nvl(v_id_lte_mdda_ctlar,0)  ||''}''); ',
'        end if;',
'    ',
'    exception',
'        when others then',
'                    o_cdgo_rspsta  := 1;',
'                    o_mnsje_rspsta := ''CDG-'' ||  v_cdgo_rspsta|| '''' ||  v_mnsje_rspsta || sqlerrm; ',
'                    insert into muerto (c_001) values (''o_mnsje_rspsta: '' || o_mnsje_rspsta); commit;    ',
'                    rollback;',
'                    return;                                                   ',
'     end; ',
'exception',
'    when others then',
'      -- insert into muerto (c_001) values (''Entro_03 exception'');     commit;      ',
'    ',
'        htp.p(''{"type":"ERROR","msg":"''||sqlerrm||''"}''); ',
'        --raise_application_error( -20001 , sqlerrm );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
