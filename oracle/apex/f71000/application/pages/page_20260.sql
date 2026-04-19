prompt --application/pages/page_20260
begin
wwv_flow_api.create_page(
 p_id=>2026009
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Liquidaci\00F3n Origen Vigencia Periodo Prescripci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>'Vigencia - Periodo Origen '
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Registrar_Origen(id_lqdcion) {',
'',
'    console.log("Entrando a Registrar_Origen");',
'    console.log("id_lqdcion: " + id_lqdcion);',
'',
'    let $waitPopup = apex.widget.waitPopup();',
'    ',
'    try {',
unistr('        console.log(''Entrando a la funci\00F3n Registrar_Origen'');'),
'        ',
'        // Llamada al proceso AJAX para registrar paz y salvo',
'        var rs = await apex.server.process("ajax_registrar_origen", {',
'            x01: id_lqdcion,',
'            pageItems: "#F_CDGO_CLNTE, #P2026009_ID_PRSCRPCION_VGNCIA"',
'        });',
'',
'        // Verificar el tipo de respuesta',
'        if (rs.type === ''OK'') {',
'',
unistr('            apex.item("P2026009_ID_LQDCION").setValue(rs.id_lqdcion); // Asignar el valor devuelto al elemento en la p\00E1gina'),
'',
unistr('            //apex.message.showPageSuccess(rs.msg); // Mostrar mensaje de \00E9xito'),
'            Swal.fire({',
'                icon: ''Success'',',
'                title: ''<h2>Contribuyente.</h2>'',',
unistr('                html: ''liquidaci\00F3n'','),
'                confirmButtonText: ''Aceptar''',
'            });',
'',
'            apex.page.submit();',
'            return;',
'        } else {',
'            console.log(''Respuesta error: '');',
'            Swal.fire({',
'                icon: ''error'',',
'                title: ''<h2>Contribuyente.</h2>'',',
'                text: rs.msg',
'            });',
'        }',
'    } catch (e) {',
'        console.error("Error en Registrar_Origen:", e); // Capturar y mostrar el error en la consola',
'    } finally {',
'        $waitPopup.remove(); // Asegurarse de que el popup se remueva',
'    }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_last_updated_by=>'JBADRAN'
,p_last_upd_yyyymmddhh24miss=>'20260318152841'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17274837943435602)
,p_plug_name=>'Origen Vigencia Periodo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17275142640435605)
,p_plug_name=>'Liquidaciones'
,p_region_name=>'LQ'
,p_parent_plug_id=>wwv_flow_api.id(17274837943435602)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_lqdcion',
'     , a.nmbre_impsto_sbmpsto',
'     , a.vgncia',
'     , a.prdo',
'     , to_char(a.fcha_lqdcion, ''DD/MM/YYYY'') as fcha_lqdcion',
'     , a.vlor_ttal',
'     , a.dscrpcion_lqdcion_estdo',
'from v_gi_g_liquidaciones a',
'where a.cdgo_clnte        = :P2026009_CDGO_CLNTE',
'  and a.id_impsto         = :P2026009_ID_IMPSTO',
'  and a.id_impsto_sbmpsto = :P2026009_ID_IMPSTO_SBMPSTO',
'  and a.id_sjto_impsto    = :P2026009_ID_SJTO_IMPSTO',
'  and a.vgncia            = :P2026009_VGNCIA',
'  and a.id_prdo           = :P2026009_ID_PRDO',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P2026009_ID_LQDCION'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17275321624435607)
,p_name=>'ID_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(17275414194435608)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Subtributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(17275585929435609)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(17275618638435610)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(17275719641435611)
,p_name=>'FCHA_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_LQDCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_api.id(17275805362435612)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(17275930728435613)
,p_name=>'DSCRPCION_LQDCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_LQDCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(17299124765834605)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(17275240235435606)
,p_internal_uid=>17275240235435606
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(17284472101691919)
,p_interactive_grid_id=>wwv_flow_api.id(17275240235435606)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(17284548732691919)
,p_report_id=>wwv_flow_api.id(17284472101691919)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17285015725691918)
,p_view_id=>wwv_flow_api.id(17284548732691919)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(17275321624435607)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17285572429691916)
,p_view_id=>wwv_flow_api.id(17284548732691919)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(17275414194435608)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17286042845691915)
,p_view_id=>wwv_flow_api.id(17284548732691919)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(17275585929435609)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17286561676691913)
,p_view_id=>wwv_flow_api.id(17284548732691919)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(17275618638435610)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17287014327691912)
,p_view_id=>wwv_flow_api.id(17284548732691919)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(17275719641435611)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17287574166691910)
,p_view_id=>wwv_flow_api.id(17284548732691919)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(17275805362435612)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(17288037639691909)
,p_view_id=>wwv_flow_api.id(17284548732691919)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(17275930728435613)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17318755271816403)
,p_plug_name=>unistr('Liquidaci\00F3n Registrada ')
,p_parent_plug_id=>wwv_flow_api.id(17274837943435602)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_lqdcion',
'     , a.nmbre_impsto_sbmpsto',
'     , a.vgncia',
'     , a.prdo',
'     , to_char(a.fcha_lqdcion, ''DD/MM/YYYY'') as fcha_lqdcion',
'     , a.vlor_ttal',
'     , a.dscrpcion_lqdcion_estdo',
'from v_gi_g_liquidaciones a',
'where a.cdgo_clnte        = :P2026009_CDGO_CLNTE',
'  and a.id_lqdcion        = :P2026009_ID_LQDCION',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2026009_ID_LQDCION'
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
 p_id=>wwv_flow_api.id(17318831406816404)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JBADRAN'
,p_internal_uid=>17318831406816404
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17318971852816405)
,p_db_column_name=>'ID_LQDCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Liquidaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17319050619816406)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Subtributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17319155996816407)
,p_db_column_name=>'VGNCIA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17319253070816408)
,p_db_column_name=>'PRDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17319383811816409)
,p_db_column_name=>'FCHA_LQDCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Fecha Liquidaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17319409868816410)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17319523322816411)
,p_db_column_name=>'DSCRPCION_LQDCION_ESTDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(17334098938104590)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'173341'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_LQDCION:NMBRE_IMPSTO_SBMPSTO:VGNCIA:PRDO:FCHA_LQDCION:VLOR_TTAL:DSCRPCION_LQDCION_ESTDO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17299530471834609)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(17274837943435602)
,p_button_name=>'BTN_REGISTRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P2026009_ID_LQDCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17276096080435614)
,p_name=>'P2026009_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(17274837943435602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17276152802435615)
,p_name=>'P2026009_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(17274837943435602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17276277758435616)
,p_name=>'P2026009_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(17274837943435602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17276333480435617)
,p_name=>'P2026009_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(17274837943435602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17276422668435618)
,p_name=>'P2026009_VGNCIA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(17274837943435602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17276563287435619)
,p_name=>'P2026009_ID_PRDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(17274837943435602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17276790009435621)
,p_name=>'P2026009_ID_LQDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(17275142640435605)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17298903127834603)
,p_name=>'P2026009_ID_PRSCRPCION_SJTO_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(17274837943435602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17299719309834611)
,p_name=>'P2026009_ID_PRSCRPCION_VGNCIA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(17274837943435602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17299332913834607)
,p_name=>'Al seleccionar registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(17275142640435605)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17299407375834608)
,p_event_id=>wwv_flow_api.id(17299332913834607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerLiquidacion() {',
unistr('    console.log(''Entrando a la funci\00F3n: obtenerLiquidacion'');'),
'',
'    var view = apex.region("LQ").widget().interactiveGrid("getCurrentView");',
'    var model = view.model;',
'    var records = view.getSelectedRecords();',
'',
'    if (records.length === 0) {',
'        console.log("No hay contratos seleccionados.");',
'        return;',
'    }',
'',
'    // Tomar el primer ID_CNTRTO de los registros seleccionados',
'    var id_lqdcion = model.getValue(records[0], ''ID_LQDCION'');',
'',
'    console.log(''P2026009_ID_LQDCION seleccionado:'', id_lqdcion);',
'',
'    // Guardar en localStorage',
'    window.localStorage.setItem(''id_lqdcion'', id_lqdcion);',
'',
'    console.log("guardado:", id_lqdcion);',
'    ',
'/*',
'    // Guardar en un item APEX',
'    apex.item("P2026009_ID_LQDCION").setValue(id_lqdcion);',
'    ',
'    // Resfrescamos el Item',
'    apex.item("P2026009_ID_LQDCION").refresh();',
'    ',
'    // Verificar en consola',
unistr('    console.log("ID_LQDCION guardado en el \00EDtem:", apex.item("P2026009_ID_LQDCION").getValue());'),
'*/',
'}',
'',
'',
'obtenerLiquidacion();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17299827832834612)
,p_name=>unistr('Actualizamos la regi\00F3n de liquidaciones')
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(17275142640435605)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17299910852834613)
,p_event_id=>wwv_flow_api.id(17299827832834612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(17275142640435605)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(17318561486816401)
,p_name=>'Al dar clic en registrar'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(17299530471834609)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(17318679799816402)
,p_event_id=>wwv_flow_api.id(17318561486816401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('//extraemos la liquidaci\00F3n del local stora'),
'let id_lqdcion = localStorage.getItem("id_lqdcion");',
'console.log(id_lqdcion);',
'',
'Registrar_Origen(id_lqdcion);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17299284274834606)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(17275142640435605)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Liquidaciones - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17298838039834602)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select b.id_impsto',
'       , b.id_impsto_sbmpsto',
'       , b.id_sjto_impsto',
'    into :P2026009_ID_IMPSTO',
'       , :P2026009_ID_IMPSTO_SBMPSTO',
'       , :P2026009_ID_SJTO_IMPSTO	',
'  from gf_g_prscrpcnes_sjto_impsto b',
'  where b.id_prscrpcion_sjto_impsto = :P2026009_ID_PRSCRPCION_SJTO_IMPSTO',
'  fetch first row only;',
'exception',
'    when others then',
'      :P2026009_ID_IMPSTO			:= null;',
'      :P2026009_ID_IMPSTO_SBMPSTO	:= null;',
'      :P2026009_ID_SJTO_IMPSTO	    := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17299691077834610)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_registrar_origen'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta   number := 0;',
'    v_mnsje_rspsta  varchar2(4000);',
'    v_id_lqdcion    number := to_number(apex_application.g_x01);',
'begin',
'',
unistr('    -- Inserci\00F3n para depuraci\00F3n'),
'    insert into muerto(c_001)',
'    values(',
'        ''Entrando agregar origen: F_CDGO_CLNTE: ''|| :F_CDGO_CLNTE ||',
'        '' - P2026009_ID_PRSCRPCION_VGNCIA: '' || :P2026009_ID_PRSCRPCION_VGNCIA ||',
'        '' - v_id_lqdcion: '' || v_id_lqdcion',
'    );',
'',
'    update gf_g_prscrpcnes_vgncia',
'       set id_lqdcion = v_id_lqdcion',
'     where id_prscrpcion_vgncia = :P2026009_ID_PRSCRPCION_VGNCIA;',
'/*',
'    if sql%rowcount = 0 then',
'        v_cdgo_rspsta  := 10;',
unistr('        v_mnsje_rspsta := ''No se encontr\00F3 el registro para actualizar.'';'),
'    else',
'        v_mnsje_rspsta := ''La origen asociado a la vigencia periodo correctamente.'';',
'    end if;',
'*/',
unistr('    v_mnsje_rspsta := ''La liquidaci\00F3n se actualiz\00F3 correctamente.'';'),
'',
'    if v_cdgo_rspsta <> 0 then',
'        apex_json.open_object;',
'        apex_json.write(''type'',''ERROR'');',
'        apex_json.write(''msg'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'    else',
'        apex_json.open_object;',
'        apex_json.write(''type'',''OK'');',
'        apex_json.write(''msg'', v_mnsje_rspsta);',
'        apex_json.write(''id_lqdcion'', v_id_lqdcion);',
'        apex_json.close_object;',
'    end if;',
'',
'exception',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''type'',''ERROR'');',
unistr('        apex_json.write(''msg'',''Error al actualizar la liquidaci\00F3n: '' || sqlerrm);'),
'        apex_json.close_object;',
'    return;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(17299530471834609)
,p_process_when=>'P2026009_ID_PRSCRPCION_VGNCIA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
