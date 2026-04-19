prompt --application/pages/page_00058
begin
wwv_flow_api.create_page(
 p_id=>58
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Informe de Cambios Masivos de Estrato'
,p_step_title=>'Informe de Cambios Masivos de Estrato'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item("BTN_NTFCR").disable(); // Se deshabilita el boton.',
'',
'//Funcion que obtiene el id del lote de la determinacion de la fila selecionada en el interactive grid',
'function obtener_id_lote_determinacion(){  ',
' ',
'    //console.log("click");    ',
'    var v_id_lote; // variable que almacena el id del lote seleccionado    ',
'    let fla_slccnda = apex.region("info_lote").widget().interactiveGrid("getViews").grid.getSelectedRecords(); // variable que almacena la fila seleccionada',
'    //console.log(table);',
'    apex.item("P60_ID_LTE").setValue(fla_slccnda[0][0]);//Se le seta el id del lote al item - esto se hace para pasar el item por sesion',
'    v_id_lote = (apex.item("P60_ID_LTE").getValue());// Se le pasa el valor del item a la variable',
'    console.log(v_id_lote);',
'    Valida_documentos(v_id_lote);// se llama a la funcion que valida si el lote tiene o no documentos   ',
'     ',
'}',
'',
'',
'',
'//funcion que realiza el llamado al callback para determinar si el lote tiene o no documentos',
'function Valida_documentos(v_id_lote){',
'    apex.server.process(',
'                    ''validar_documentos'',',
'                    {',
'                        x01: v_id_lote //se envia el id del lote al callback',
'                       ',
'                    }).then((resp) => {              ',
'                            console.log(''Respuesta:  '',resp);',
'                            //Si la respuesta es cero significa que se encontraron documentos para ese lote',
'                            if (resp.o_cdgo_rspsta === 0){',
'                                //Se realiza el redireccionamiento a la pagina de notificacion',
'                                window.open(''f?p=65000:32:&APP_SESSION.:::32:P32_ID_LTE_NTFCAR:''+$v(''P60_ID_LTE''), ''_self'');',
'                                console.log("Tiene documentos");',
'                            }else{',
'                                ',
'                                Swal.fire(',
unistr('                                  ''<h2><b>\00A1No puede seguir el proceso!</b></h2>'','),
'                                  ''<h3>El lote no tiene documentos asociados</h3>'',',
'                                  ''error''',
'                                ).then((result) => {',
'                                    apex.navigation.dialog.close(true);',
'                                });',
'                                //alert(''No tiene documentos asociados!'');',
'                                console.log("Nooo Tiene documentos");',
'                            }',
'                    }); ',
'}',
'',
''))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220526150429'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(367490705011247080)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(367490887159247082)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'',
'<i>',
'    Funcionalidad que permite: <br><br>',
unistr('    <b>1.</b> Visualizar la informaci\00F3n de los Cargue Masivos de Estratos procesados. <br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(376784517012413524)
,p_plug_name=>'Informe de Cambios Masivos de Estrato'
,p_region_name=>'info_lote'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id_nvdad_prdio_rsmen,',
'       a.id_prcso_crga,',
'       a.cdgo_clnte,',
'       a.id_impsto,',
'       b.cdgo_impsto,',
'       b.nmbre_impsto,',
'       a.id_impsto_sbmpsto,',
'       c.cdgo_impsto_sbmpsto,',
'       c.nmbre_impsto_sbmpsto,',
'       a.fcha_incio,',
'	   a.fcha_fin,',
'	   regexp_substr((a.fcha_fin - a.fcha_incio), ''[[0-9]{2}:[[0-9]{2}:[[0-9]{2}'', 1 ,  1 ) drcion,',
'       a.nmro_rgstro,',
'       a.nmro_cmbio_estrtos,',
'	   g.nmbre_trcro',
'  from si_g_novedades_prdio_rsumen 	a',
'  join df_c_impuestos 				b on a.id_impsto 		 = b.id_impsto',
'  join df_i_impuestos_subimpuesto 	c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'  join v_sg_g_usuarios				g on a.id_usrio			 = g.id_usrio     ',
' where a.cdgo_clnte     = :F_CDGO_CLNTE',
'  -- and a.id_usrio       = :F_ID_USRIO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10663083654872608)
,p_name=>'ID_PRCSO_CRGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSO_CRGA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(10663144690872609)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(10663271350872610)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(10663345280872611)
,p_name=>'CDGO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IMPSTO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(10663427681872612)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(10663518336872613)
,p_name=>'CDGO_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(10663666344872614)
,p_name=>'NMBRE_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TRCRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10663797712872615)
,p_name=>'NMRO_CMBIO_ESTRTOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CMBIO_ESTRTOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cambios de<br>Estratos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(10664329486872621)
,p_name=>'ID_NVDAD_PRDIO_RSMEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NVDAD_PRDIO_RSMEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190641268665796110)
,p_name=>'NMRO_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RGSTRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Registros')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(240781293212855635)
,p_name=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(240781416619855636)
,p_name=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FIN'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Fin'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(240781579493855637)
,p_name=>'DRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Duraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>27
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
 p_id=>wwv_flow_api.id(336342724139511113)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(367491080246247084)
,p_name=>'Ver Registro'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton "  title="Ver Detalle Cargue" onclick="$(''#Con'').dialog(''open'');">Ver',
'    <span class="fa fa-eye"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP,62:P59_ID_PRCSO_CRGA,P59_ID_NVDAD_PRDIO_RSMEN:&ID_PRCSO_CRGA.,&ID_NVDAD_PRDIO_RSMEN.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(376786867849413539)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(376787475877413545)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(376785003058413530)
,p_internal_uid=>376785003058413530
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
 p_id=>wwv_flow_api.id(376785410435413532)
,p_interactive_grid_id=>wwv_flow_api.id(376785003058413530)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(376785511445413533)
,p_report_id=>wwv_flow_api.id(376785410435413532)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10676595974700035)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(10663083654872608)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10677032034700043)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(10663144690872609)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10677563025700046)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(10663271350872610)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10678046676700048)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(10663345280872611)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10678554547700050)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(10663427681872612)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10679093980700051)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(10663518336872613)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10679578577700053)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(10663666344872614)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10694563276915304)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(10663797712872615)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10711128075442909)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(10664329486872621)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188267485302895537)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(240781293212855635)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188267994864895552)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(240781416619855636)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(188268537904895557)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(240781579493855637)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190880972711436516)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(190641268665796110)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(336432789160376590)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(336342724139511113)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(376787233036413545)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(376786867849413539)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(376787875247413545)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(376787475877413545)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(376798005018466767)
,p_view_id=>wwv_flow_api.id(376785511445413533)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(367491080246247084)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188266834892702118)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(367490705011247080)
,p_button_name=>'BTN_NVO_CRGUE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Cargue'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:RP,54::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(188275131368702175)
,p_name=>'Eliminar_Collecction_RANGO_IMPRESION'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(376784517012413524)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(188275640661702181)
,p_event_id=>wwv_flow_api.id(188275131368702175)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if  apex_collection.collection_exists(''RANGO_IMPRESION'') then',
'       APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => ''RANGO_IMPRESION'');',
'    ',
'    end if;    ',
'end;    '))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(188276028490702186)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(376784517012413524)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(188274391730702163)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(376784517012413524)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Informe de Lotes de Determinaciones - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
