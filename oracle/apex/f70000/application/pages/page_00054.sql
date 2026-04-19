prompt --application/pages/page_00054
begin
wwv_flow_api.create_page(
 p_id=>54
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Fin T\00EDtulos Ejecutivos')
,p_step_title=>unistr('Fin T\00EDtulos Ejecutivos')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20191203135710'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18953477902955901)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(71205587176954916)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(195974385561686115)
,p_plug_name=>'TAB-CONTAINER'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196092079054549907)
,p_plug_name=>unistr('T\00EDtulo Ejecutivo')
,p_parent_plug_id=>wwv_flow_api.id(195974385561686115)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196090225019549888)
,p_plug_name=>'Conceptos'
,p_region_name=>'titulosEjecutivos'
,p_parent_plug_id=>wwv_flow_api.id(196092079054549907)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'onkeypress="return soloNumero(event)"'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion,',
'       a.vgncia,',
'       c.prdo,',
'       d.vlor_cptal,',
'       d.vlor_intres',
'from df_i_impuestos_acto_concepto    a',
'join df_i_conceptos                  b on a.id_cncpto             = b.id_cncpto',
'join df_i_periodos                   c on a.id_prdo               = c.id_prdo',
'join gi_g_titulos_ejctvo_cncpto      d on a.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'join gi_g_titulos_ejecutivo          e on d.id_ttlo_ejctvo        = e.id_ttlo_ejctvo    ',
'where e.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(181943010555455528)
,p_name=>'VLOR_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(196090671359549892)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(196091614204549902)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(196091767498549903)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(200675793525418185)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_is_required=>true
,p_max_length=>15
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(196090316312549889)
,p_internal_uid=>196090316312549889
,p_is_editable=>true
,p_edit_operations=>'u'
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(196100634640639768)
,p_interactive_grid_id=>wwv_flow_api.id(196090316312549889)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(196100754824639768)
,p_report_id=>wwv_flow_api.id(196100634640639768)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(181949382204459320)
,p_view_id=>wwv_flow_api.id(196100754824639768)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(181943010555455528)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(196102604168639773)
,p_view_id=>wwv_flow_api.id(196100754824639768)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(196090671359549892)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>307
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(196116433154891150)
,p_view_id=>wwv_flow_api.id(196100754824639768)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(196091614204549902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(196117023001891152)
,p_view_id=>wwv_flow_api.id(196100754824639768)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(196091767498549903)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(200681956210439714)
,p_view_id=>wwv_flow_api.id(196100754824639768)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(200675793525418185)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(200129703301076511)
,p_plug_name=>'Nuevo'
,p_parent_plug_id=>wwv_flow_api.id(196092079054549907)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(pkg_gi_titulos_ejecutivo.fnc_gn_region_metadatos(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                        p_id_impsto => :P54_IMPUESTO,',
'                                                        p_id_impsto_sbmpsto => :P54_SUB_IMPUESTO,',
'                                                        p_id_orgen => :P54_ID_TTLO_EJCTVO,',
'                                                        p_dsbled   => ''S''));'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(202045311238315984)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(195974385561686115)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(195707480458252724)
,p_plug_name=>'Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(202045311238315984)
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(201130066104289584)
,p_plug_name=>'Plugin Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(202045311238315984)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P54_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21230780453025184)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(71205587176954916)
,p_button_name=>'BTN_RGRSR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45657822854195920)
,p_name=>'P54_ACTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto_acto as d,',
'        a.id_impsto_acto as r',
'from df_i_impuestos_acto a',
'where a.id_impsto_sbmpsto = :P54_SUB_IMPUESTO',
'and a.actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_cSize=>100
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45658282048195931)
,p_name=>'P54_SECRETARIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_prompt=>'Origen'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_area as d,',
'       a.id_area    as r',
'from df_c_areas a',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45658630914195931)
,p_name=>'P54_NMRO_TTLO_EJCTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_prompt=>unistr('# T\00EDtulo Ejecutivo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45659082343195932)
,p_name=>'P54_FCHA_TTLO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_item_default=>'nvl(:P54_FCHA_TTLO,sysdate)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha T\00EDtulo Ejecutivo')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45659427938195932)
,p_name=>'P54_FCHA_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_item_default=>'nvl(:P54_FCHA_NTFCCION,SYSDATE)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha Notificaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P54_FCHA_TTLO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45659876057195932)
,p_name=>'P54_FCHA_VNCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_item_default=>'nvl(:P54_FCHA_VNCMNTO,SYSDATE)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Vencimiento'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P54_FCHA_TTLO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45660206985195933)
,p_name=>'P54_N_GUIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_prompt=>unistr('No. Gu\00EDa')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45660627351195933)
,p_name=>'P54_MDIO_NTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_prompt=>unistr('Medio Notificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select m.dscrpcion as d,',
'       m.id_mdio as r',
'from nt_d_medio m;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'250'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45661001788195933)
,p_name=>'P54_FILE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Archivo'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FILE_MIMETYPE'
,p_attribute_03=>'FILE_NAME'
,p_attribute_06=>'Y'
,p_attribute_07=>'&P54_FILE_NAME.'
,p_attribute_08=>'attachment'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45661458842195933)
,p_name=>'P54_OBSRVCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45661828030195934)
,p_name=>'P54_FILE_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45662254775195934)
,p_name=>'P54_ID_DCMNTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45662678992195934)
,p_name=>'P54_IMPUESTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45663071210195942)
,p_name=>'P54_SUB_IMPUESTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45663467969195943)
,p_name=>'P54_ID_TTLO_EJCTVO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(196092079054549907)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45667455005196065)
,p_name=>'P54_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(195707480458252724)
,p_prompt=>'Id Sjto Impsto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45527359625055701)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Finaliza el FLujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_o_error         number;',
'    o_mnsje_rspsta    varchar2(1000);',
'    ',
'begin',
'    begin',
'        pkg_pl_workflow_1_0.prc_rg_finalizar_instancia(p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO,',
'													   p_id_fljo_trea     => :F_ID_FLJO_TREA,',
'													   p_id_usrio         => :F_ID_USRIO,',
'													   o_error            => v_o_error,',
'													   o_msg              => o_mnsje_rspsta );',
'    exception',
'        when others then',
'            o_mnsje_rspsta := v_o_error||'' - ''||''Error al llamar el procedimiento que finaliza el flujo'';',
'    ',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from wf_g_instancias_transicion a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'and a.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'and a.id_estdo_trnscion = 1;'))
,p_process_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45669165640199180)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Cargar Archivo'
,p_attribute_02=>'GD_G_DOCUMENTOS'
,p_attribute_03=>'P54_ID_DCMNTO'
,p_attribute_04=>'ID_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45670374452200617)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n T\00EDtulo Ejecutivo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    begin',
'        select a.nmro_ttlo_ejctvo,',
'               a.id_area,',
'               b.id_impsto,',
'               b.id_impsto_sbmpsto,',
'               a.id_impsto_acto,',
'               a.fcha_cnsttcion,',
'               a.fcha_ntfccion,',
'               a.fcha_vncmnto,',
'               a.nmro_guia,',
'               a.mdio_ntfccion,',
'               a.id_dcmnto,',
'               a.obsrvcion,',
'               a.id_sjto_impsto,',
'               a.id_ttlo_ejctvo',
'        into   :P54_NMRO_TTLO_EJCTVO,',
'               :P54_SECRETARIA,',
'               :P54_IMPUESTO,',
'               :P54_SUB_IMPUESTO,',
'               :P54_ACTOS,',
'               :P54_FCHA_TTLO,',
'               :P54_FCHA_NTFCCION,',
'               :P54_FCHA_VNCMNTO,',
'               :P54_N_GUIA,',
'               :P54_MDIO_NTFCCION,',
'               :P54_ID_DCMNTO,',
'               :P54_OBSRVCION,',
'               :P54_ID_SJTO_IMPSTO,',
'               :P54_ID_TTLO_EJCTVO',
'        from gi_g_titulos_ejecutivo a ',
'        join df_i_impuestos_acto    b on a.id_impsto_acto = b.id_impsto_acto',
'        join v_si_i_sujetos_impuesto c on a.id_sjto_impsto = c.id_sjto_impsto',
'        where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'        ',
'    exception',
'        when no_data_found then',
'               :P54_NMRO_TTLO_EJCTVO := null;',
'               :P54_SECRETARIA := null;',
'               :P54_IMPUESTO := null;',
'               :P54_SUB_IMPUESTO := null;',
'               :P54_ACTOS := null;',
'               :P54_FCHA_TTLO := null;',
'               :P54_FCHA_NTFCCION := null;',
'               :P54_FCHA_VNCMNTO := null;',
'               :P54_N_GUIA := null;',
'               :P54_MDIO_NTFCCION := null;',
'               :P54_ID_DCMNTO := null;',
'               :P54_OBSRVCION := null;',
'    end;',
'',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
