prompt --application/pages/page_00027
begin
wwv_flow_api.create_page(
 p_id=>27
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('Resoluci\00F3n Aclaratoria')
,p_step_title=>unistr('Resoluci\00F3n Aclaratoria')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function generarDocumentos(p_id_rcrso_dcmnto){',
'    ',
'    apex.submit({',
'      request:"generarDocumentos",',
'      set:{"P27_ID_RCRSO_DCMNTO":p_id_rcrso_dcmnto}});        ',
'};'))
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20220118111728'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117134717184959101)
,p_plug_name=>unistr('Resoluci\00F3n Aclaratoria')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(485570327487473226)
,p_plug_name=>'Actos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  g.id_acto_tpo, g.dscrpcion_acto_tpo, g.ACCION, g.Confirmar, g.id_rcrso_dcmnto',
'from(',
'    select  a.id_actos_tpo_trea,',
'            a.id_acto_tpo,',
'            b.dscrpcion dscrpcion_acto_tpo,',
'            case',
'                 when ((a.id_acto_tpo_rqrdo is null and d.id_acto is null) or  (a.id_acto_tpo_rqrdo is not null and e.id_acto is not null and d.id_acto is null))then',
'                     ''<center>',
'                         <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                             ||nvl2(d.id_rcrso_dcmnto, ''Modificar '', ''Generar '')',
'                             ||''<span class="fa ''||nvl2(d.id_rcrso_dcmnto,''fa-edit'',''fa-gear fa-anim-spin'')||''"></span>',
'                         </button>',
'                     </center>''',
'                when((a.id_acto_tpo_rqrdo is null and d.id_acto is not null)or (a.id_acto_tpo_rqrdo is not null and e.id_acto is not null and d.id_acto is not null))then',
'                    ''<span aria-hidden="true" class="fa fa-check"></span>''',
'            end  ACCION,',
'            case',
'                 when ((a.id_acto_tpo_rqrdo is null and d.id_rcrso_dcmnto is not null and d.id_acto is null) or  (a.id_acto_tpo_rqrdo is not null and e.id_acto is not null and d.id_rcrso_dcmnto is not null and d.id_acto is null))then',
'                     ''<center>',
'                         <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Confirmar',
'                             <span class="fa fa-check"></span>',
'                         </button>',
'                      </center>''',
'            end Confirmar,',
'            d.id_rcrso_dcmnto,',
'            a.id_acto_tpo_rqrdo',
'    from gn_d_actos_tipo_tarea          a',
'    inner join  gn_d_actos_tipo         b on a.id_acto_tpo           =  b.id_acto_tpo',
' -- inner join  gj_g_recursos           c on c.id_instncia_fljo_hjo  = :P27_ID_INSTNCIA_FLJO_PDRE',
'    inner join  gj_g_recursos           c on c.id_instncia_fljo_pdre  = :P27_ID_INSTNCIA_FLJO_PDRE',
'    left  join  gj_g_recursos_documento d on c.id_rcrso              = d.id_rcrso           and',
'                                             a.id_fljo_trea          = d.id_fljo_trea       and',
'                                             d.id_acto_tpo           = b.id_acto_tpo',
'    left  join gj_g_recursos_documento  e on c.id_rcrso              = e.id_rcrso           and',
'                                             a.id_fljo_trea          = e.id_fljo_trea       and',
'                                             a.id_acto_tpo_rqrdo     = e.id_acto_tpo',
'    where a.cdgo_clnte      = :F_CDGO_CLNTE     and',
'          a.id_fljo_trea    = :F_ID_FLJO_TREA   and',
'          a.actvo           = ''S''',
') g',
'--start with  a.id_acto_tpo_rqrdo         is  null',
'--connect by  nocycle g.id_acto_tpo_rqrdo =   prior g.id_acto_tpo;',
'--order by g.id_acto_tpo_rqrdo desc',
'order by  g.dscrpcion_acto_tpo desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' not exists (select 1 from gj_g_recursos_accion where id_instncia_fljo_indc = :F_ID_INSTNCIA_FLJO and actvo = ''S'') and ',
' exists(select 1 ',
'        from wf_g_instancias_transicion a',
'        where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'              a.id_fljo_trea_orgen = :F_ID_FLJO_TREA and',
'              a.id_estdo_trnscion in (1,2))'))
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
 p_id=>wwv_flow_api.id(485570399699473227)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'NONE'
,p_show_detail_link=>'N'
,p_owner=>'JCUAO'
,p_internal_uid=>485570399699473227
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117460990514622179)
,p_db_column_name=>'DSCRPCION_ACTO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tipo de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117461717166622191)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117462122119622192)
,p_db_column_name=>'ID_RCRSO_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Id Rcrso Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117461398346622191)
,p_db_column_name=>'ACCION'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>'Accion'
,p_column_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,16:P16_ID_ACTO_TPO,P16_ID_RCRSO_DCMNTO,P16_XML,P16_PGNA_ORGN,P16_ID_INSTNCIA_FLJO,P16_ID_INSTNCIA_FLJO_HJO:#ID_ACTO_TPO#,#ID_RCRSO_DCMNTO#,<cdgo_clnte value="&F_CDGO_CLNTE."/> <id_acto_rr value="&P27_ID_ACTO_RR."'
||'/> <id_slctud value="&P27_ID_SLCTUD."/> <id_acto_tpo value="#ID_ACTO_TPO#"/> <id_fncnrio value="&F_ID_FNCNRIO."/> <id_rcrso value="&P27_ID_RCRSO."/>,&APP_PAGE_ID.,&P27_ID_INSTNCIA_FLJO_HJO.,&F_ID_INSTNCIA_FLJO.'
,p_column_linktext=>'#ACCION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117462524676622192)
,p_db_column_name=>'CONFIRMAR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Confirmar'
,p_column_link=>'javascript:generarDocumentos(#ID_RCRSO_DCMNTO#);'
,p_column_linktext=>'#CONFIRMAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(485652182846076241)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1174629'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ACTO_TPO:ACCION:ID_ACTO_TPO:ID_RCRSO_DCMNTO:CONFIRMAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(765487755268549968)
,p_plug_name=>'Acto Seleccionado'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(886023375159973268)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(920868537289073788)
,p_plug_name=>'Solicitud'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(72932069932094503)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71414102545811111)
,p_plug_name=>'Etapas Recurso'
,p_parent_plug_id=>wwv_flow_api.id(920868537289073788)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.id_rcrso',
'           ,b.id_fljo_trea',
'           ,b.nmbre_trea',
'           ,a.fcha_incio fcha',
'           ,a.fcha_fin_real fcha_fin',
'           ,case',
'               when a.id_estdo_trnscion in (1, 2) then',
unistr('                   ''S\00ED'''),
'               when a.id_estdo_trnscion in (3, 4) then',
'                   ''No''',
'               else',
'                   ''Invalido''',
'           end actvo',
'from        wf_g_instancias_transicion      a',
'inner join  v_wf_d_flujos_tarea             b   on  b.id_fljo_trea          =   a.id_fljo_trea_orgen',
'left  join  gj_g_recursos                   c   on  c.id_instncia_fljo_hjo  =   a.id_instncia_fljo   ',
'where       b.cdgo_clnte                 =       :F_CDGO_CLNTE',
'--and         a.id_instncia_fljo      =       :F_ID_INSTNCIA_FLJO',
'and c.id_instncia_fljo_gnrdo_rsl_acl = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71414337092811113)
,p_name=>'ID_RCRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71414412644811114)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71414574913811115)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(71414666423811116)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(71414782967811117)
,p_name=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FIN'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Final'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(71414865081811118)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(71414935388811119)
,p_name=>'BTN_OBSRVCNES'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_ID_FLJO_TREA,P17_ID_RCRSO:&ID_FLJO_TREA.,&ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71415097174811120)
,p_name=>'BTN_DCMNTOS_GNRDOS'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Documentos Generados'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19:P19_ID_FLJO_TREA,P19_ID_RCRSO:&ID_FLJO_TREA.,&ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(71414221571811112)
,p_internal_uid=>71414221571811112
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
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
 p_id=>wwv_flow_api.id(71429555923930606)
,p_interactive_grid_id=>wwv_flow_api.id(71414221571811112)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(71429625841930606)
,p_report_id=>wwv_flow_api.id(71429555923930606)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71430186231930607)
,p_view_id=>wwv_flow_api.id(71429625841930606)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(71414337092811113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71430652792930609)
,p_view_id=>wwv_flow_api.id(71429625841930606)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(71414412644811114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71431129803930610)
,p_view_id=>wwv_flow_api.id(71429625841930606)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(71414574913811115)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71431629728930612)
,p_view_id=>wwv_flow_api.id(71429625841930606)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(71414666423811116)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71432181813930613)
,p_view_id=>wwv_flow_api.id(71429625841930606)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(71414782967811117)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71432695139930615)
,p_view_id=>wwv_flow_api.id(71429625841930606)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(71414865081811118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71433122382930616)
,p_view_id=>wwv_flow_api.id(71429625841930606)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(71414935388811119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71433696517930618)
,p_view_id=>wwv_flow_api.id(71429625841930606)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(71415097174811120)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71415129647811121)
,p_plug_name=>'Observaciones del Recurso'
,p_parent_plug_id=>wwv_flow_api.id(920868537289073788)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.obsrvcion,c.nmbre_trea, b.nmbre_trcro,a.fcha ,a.id_rcrso_dtlle',
'from gj_g_recursos_detalle a',
'join v_sg_g_usuarios b  on  a.id_usrio = b.id_usrio',
'join v_wf_d_flujos_tarea c on a.id_fljo_trea = c.id_fljo_trea',
'where a.id_rcrso = :P27_ID_RCRSO',
'order by a.fcha desc;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
 p_id=>wwv_flow_api.id(71415879793811128)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>71415879793811128
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71415923638811129)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71416097726811130)
,p_db_column_name=>'NMBRE_TREA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Etapa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71416124541811131)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71416232839811132)
,p_db_column_name=>'FCHA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71416387749811133)
,p_db_column_name=>'ID_RCRSO_DTLLE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Rcrso Dtlle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(71446984309106218)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'714470'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OBSRVCION:NMBRE_TREA:NMBRE_TRCRO:FCHA:ID_RCRSO_DTLLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(938224034940232207)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(920868537289073788)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1003036475352583402)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(938224034940232207)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion',
'     , md.dscrpcion_dcmnto',
'     , d.fcha',
'     , case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P27_ID_SLCTUD '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
 p_id=>wwv_flow_api.id(930274716502702907)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>930274716502702907
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117335678923791313)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117336054199791317)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117336432204791318)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117336843334791318)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117337208791791318)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117337651591791319)
,p_db_column_name=>'ACTVO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFActivo?')
,p_column_html_expression=>'#ACTVO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(117338042009791319)
,p_db_column_name=>'FCHA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Fecha Subida'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(930288183788709174)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1173384'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FCHA:FILE_NAME:ID_DCMNTO:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1003026892278579895)
,p_plug_name=>'Datos del Gestor'
,p_parent_plug_id=>wwv_flow_api.id(920868537289073788)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1003031774367581497)
,p_plug_name=>'Datos del Solicitante'
,p_parent_plug_id=>wwv_flow_api.id(920868537289073788)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1003275133673904475)
,p_plug_name=>'Datos Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(920868537289073788)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1269068978783468123)
,p_plug_name=>unistr('Etapas Resoluci\00F3n Aclaratoria')
,p_parent_plug_id=>wwv_flow_api.id(920868537289073788)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.id_rcrso',
'           ,b.id_fljo_trea',
'           ,b.nmbre_trea',
'           ,a.fcha_incio fcha',
'           ,a.fcha_fin_real fcha_fin',
'           ,case',
'               when a.id_estdo_trnscion in (1, 2) then',
unistr('                   ''S\00ED'''),
'               when a.id_estdo_trnscion in (3, 4) then',
'                   ''No''',
'               else',
'                   ''Invalido''',
'           end actvo',
'from        wf_g_instancias_transicion      a',
'inner join  v_wf_d_flujos_tarea             b   on  b.id_fljo_trea          =   a.id_fljo_trea_orgen',
'left  join  gj_g_recursos                   c   on  c.id_instncia_fljo_hjo  =   :P27_ID_INSTNCIA_FLJO_PDRE ',
'where       b.cdgo_clnte            =       :F_CDGO_CLNTE',
'and         a.id_instncia_fljo      =       :F_ID_INSTNCIA_FLJO',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1032235161304750168)
,p_name=>'ID_RCRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCRSO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1032235256450750169)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1032235406542750170)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1032235463152750171)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(1032235626727750172)
,p_name=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_FIN'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Final'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(1032235805746750174)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(1032258622224873370)
,p_name=>'BTN_OBSRVCNES'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Observaciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_ID_FLJO_TREA,P17_ID_RCRSO:&ID_FLJO_TREA.,&ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1032258646190873371)
,p_name=>'BTN_DCMNTOS_GNRDOS'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Documentos Generados'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver <span class="fa fa-eye"></span>',
'    </button>',
'</center>'))
,p_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19:P19_ID_FLJO_TREA,P19_ID_RCRSO:&ID_FLJO_TREA.,&P27_ID_RCRSO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(1032234932852750166)
,p_internal_uid=>1032234932852750166
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
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
 p_id=>wwv_flow_api.id(1032240902059750655)
,p_interactive_grid_id=>wwv_flow_api.id(1032234932852750166)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(1032240943323750656)
,p_report_id=>wwv_flow_api.id(1032240902059750655)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1032241988466750666)
,p_view_id=>wwv_flow_api.id(1032240943323750656)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(1032235161304750168)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1032242446819750668)
,p_view_id=>wwv_flow_api.id(1032240943323750656)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(1032235256450750169)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1032243020305750669)
,p_view_id=>wwv_flow_api.id(1032240943323750656)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(1032235406542750170)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1032243410286750670)
,p_view_id=>wwv_flow_api.id(1032240943323750656)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(1032235463152750171)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1032243830178750672)
,p_view_id=>wwv_flow_api.id(1032240943323750656)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(1032235626727750172)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1032244842675750675)
,p_view_id=>wwv_flow_api.id(1032240943323750656)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(1032235805746750174)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1032283355689163896)
,p_view_id=>wwv_flow_api.id(1032240943323750656)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(1032258622224873370)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1032286019808184357)
,p_view_id=>wwv_flow_api.id(1032240943323750656)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(1032258646190873371)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(215456288375511386)
,p_view_id=>wwv_flow_api.id(1032240943323750656)
,p_execution_seq=>5
,p_name=>'Etapa Seleccionada'
,p_background_color=>'#0472CE'
,p_text_color=>'#FFFFFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(1032235805746750174)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1146768707899973744)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
unistr('<i>Funcionalidad que permite la generaci\00F3n de resoluci\00F3n aclaratoria.'),
'    <br/>',
'    <br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117289156661665001)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(886023375159973268)
,p_button_name=>'BTN_REGRESAR_RECURSO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>unistr('Regresar a Gesti\00F3n Recurso ')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117398545543926704)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(886023375159973268)
,p_button_name=>'BTN_VER_ACCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>unistr('Ver Acci\00F3n Aplicada')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117379198848544306)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(886023375159973268)
,p_button_name=>'BTN_ACTLZAR_ACCION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Acci\00F3n Aclaratoria')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''¿Está seguro de actualizar las acciones?'', ''BTN_ACTLZAR_ACCION'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from gj_g_recursos_accion ',
'where id_instncia_fljo_indc = :F_ID_INSTNCIA_FLJO and actvo = ''S'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-refresh fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117398200592926701)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(886023375159973268)
,p_button_name=>'BTN_CNFRMAR_VIGENCIAS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Confirmar Vigencias'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''¿Está seguro de confirmar las vigencias ?'', ''BTN_CNFRMAR_VIGENCIAS'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from gj_g_recursos_accion ',
'where id_instncia_fljo_indc = :F_ID_INSTNCIA_FLJO and actvo = ''S'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117607306085186601)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(886023375159973268)
,p_button_name=>'BTN_CNFRMAR_RESOLUCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Confirmar Resoluci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' not exists (select 1 from gj_g_recursos_accion where id_instncia_fljo_indc = :F_ID_INSTNCIA_FLJO and actvo = ''S'') and ',
' exists(select 1 ',
'        from wf_g_instancias_transicion a',
'        where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'              a.id_fljo_trea_orgen = :F_ID_FLJO_TREA and',
'              a.id_estdo_trnscion in (1,2))'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117598698381999468)
,p_branch_name=>'Actualizar Pagina'
,p_branch_action=>'f?p=72000:27:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'generarDocumentos'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117379052984544305)
,p_branch_name=>unistr('Ir a P\00E1gina 34')
,p_branch_action=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP,26:P34_ID_RCRSO_ACCION,P34_ID_INSTNCIA_FLJO:&P27_ID_RCRSO_ACCION.,&P27_ID_INSTNCIA_FLJO_HJO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(117379198848544306)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117398701388926706)
,p_branch_name=>unistr('Ir a P\00E1gina 33')
,p_branch_action=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP,33:P33_ID_RCRSO_ACCION,P33_ID_INSTNCIA_FLJO,P33_INDC_LECTURA:&P27_ID_RCRSO_ACCION.,&P27_ID_INSTNCIA_FLJO_HJO.,S&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(117398545543926704)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117300815746678428)
,p_branch_name=>'Ir al Recurso'
,p_branch_action=>'--Consultamos la instancia del flujo padre'||wwv_flow.LF||
'declare'||wwv_flow.LF||
'   v_id_instncia_fljo number; '||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    select a.id_instncia_fljo'||wwv_flow.LF||
'    into v_id_instncia_fljo'||wwv_flow.LF||
'    from wf_g_instancias_flujo_gnrdo a'||wwv_flow.LF||
'    where a.id_instncia_fljo_gnrdo_hjo = :F_ID_INSTNCIA_FLJO;'||wwv_flow.LF||
'    '||wwv_flow.LF||
'    --Seteamos en Sesión la Instancia del Flujo'||wwv_flow.LF||
'    apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo);'||wwv_flow.LF||
'    '||wwv_flow.LF||
'    --Consultamos la ultima tarea'||wwv_flow.LF||
'    declare'||wwv_flow.LF||
'        v_id_fljo_trea_orgen number;'||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'        select id_fljo_trea_orgen'||wwv_flow.LF||
'        into v_id_fljo_trea_orgen'||wwv_flow.LF||
'        from wf_g_instancias_transicion'||wwv_flow.LF||
'        where id_instncia_fljo =  v_id_instncia_fljo and'||wwv_flow.LF||
'              id_estdo_trnscion in (1,2);'||wwv_flow.LF||
'              '||wwv_flow.LF||
'        --Seteamos en Sesión la tarea'||wwv_flow.LF||
'        apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea_orgen);'||wwv_flow.LF||
'        '||wwv_flow.LF||
'        return pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo , p_id_fljo_trea     => v_id_fljo_trea_orgen);'||wwv_flow.LF||
'    end;'||wwv_flow.LF||
'    '||wwv_flow.LF||
'exception'||wwv_flow.LF||
'    when others then'||wwv_flow.LF||
'        raise_application_error(-20001, ''Problemas al consultar flujo padre, ''||sqlerrm);'||wwv_flow.LF||
'end;'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_when_button_id=>wwv_flow_api.id(117289156661665001)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71416481096811134)
,p_name=>'P27_ID_INSTNCIA_FLJO_HJO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73163782006735701)
,p_name=>'P27_MNSJE_RSPSTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117322008741791286)
,p_name=>'P27_ID_PRSNTCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117322461144791292)
,p_name=>'P27_ID_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_cHeight=>1
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117322892294791292)
,p_name=>'P27_ID_MTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_prompt=>'Motivo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte = :f_cdgo_clnte',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117323227323791293)
,p_name=>'P27_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117323641167791293)
,p_name=>'P27_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P27_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117324009694791294)
,p_name=>'P27_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117324495842791294)
,p_name=>'P27_ID_SLCTUD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117324811517791294)
,p_name=>'P27_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_prompt=>unistr('N\00FAmero Radicado')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117325257658791294)
,p_name=>'P27_FCHA_RDCDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117325675909791295)
,p_name=>'P27_ID_INSTNCIA_FLJO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117326342915791295)
,p_name=>'P27_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1003026892278579895)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117326758957791296)
,p_name=>'P27_DSCRPCION_IDNTFCCION_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1003026892278579895)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117327178490791296)
,p_name=>'P27_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1003026892278579895)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117327597043791296)
,p_name=>'P27_PRMER_NMBRE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1003026892278579895)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117327912296791302)
,p_name=>'P27_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1003026892278579895)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117328341401791302)
,p_name=>'P27_PRMER_APLLDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1003026892278579895)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117328798670791302)
,p_name=>'P27_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1003026892278579895)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117329443096791302)
,p_name=>'P27_DSCRPCION_RSPNSBLE_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>'Tipo Radicador'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117329828385791302)
,p_name=>'P27_DSCRPCION_IDNTFCCION_TPO_S'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117330260319791303)
,p_name=>'P27_IDNTFCCION_S'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117330697153791303)
,p_name=>'P27_PRMER_NMBRE_S'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117331095914791303)
,p_name=>'P27_SGNDO_NMBRE_S'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117331455477791303)
,p_name=>'P27_PRMER_APLLDO_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117331842361791303)
,p_name=>'P27_SGNDO_APLLDO_S'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117332207441791305)
,p_name=>'P27_NMBRE_PAIS_NTFCCION_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>unistr('Pa\00EDs')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117332688546791305)
,p_name=>'P27_NMBRE_DPRTMNTO_NTFCCION_S'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117333096971791305)
,p_name=>'P27_NMBRE_MNCPIO_NTFCCION_S'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>'Municpio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117333457685791306)
,p_name=>'P27_DRCCION_NTFCCION_S'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117333889215791306)
,p_name=>'P27_EMAIL_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117334296358791306)
,p_name=>'P27_TLFNO_S'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117334698261791306)
,p_name=>'P27_CLLAR_S'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(1003031774367581497)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(72976600943094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117342206523859001)
,p_name=>'P27_ID_INSTNCIA_FLJO_PDRE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1003275133673904475)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117359611655953213)
,p_name=>'P27_ID_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117360097335953221)
,p_name=>'P27_ID_RCRSO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117360467642953221)
,p_name=>'P27_NMRO_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_prompt=>'No. Acto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117360871723953221)
,p_name=>'P27_FCHA_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_prompt=>unistr('Fecha de Notificaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117361254958953222)
,p_name=>'P27_FCHA_OPTIMA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_prompt=>'Fecha Optima'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117361610311953222)
,p_name=>'P27_ID_RCRSO_TIPO_CLNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_prompt=>'Tipo de Recurso'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_RECURSO_CLIENTE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion d, a.id_rcrso_tipo_clnte r',
'from gj_d_recursos_tipo_cliente a',
'inner join gj_d_recursos_tipo b on a.cdgo_rcrso_tpo = b.cdgo_rcrso_tpo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117362049447953223)
,p_name=>'P27_INDCDOR_AIR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117362429935953223)
,p_name=>'P27_AIR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_prompt=>unistr('Acci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:Admisi\00F3n;A,Inadmisi\00F3n;I,Rechazo;R')
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117363222491953230)
,p_name=>'P27_DSCRPCION_ACTO_TPO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117363693543953230)
,p_name=>'P27_DFRNCIA_DIAS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117378870190544303)
,p_name=>'P27_ID_RCRSO_ACCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117399273234926711)
,p_name=>'P27_ID_ACTO_RR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117399302493926712)
,p_name=>'P27_ID_ACTO_TPO_RR'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117399466300926713)
,p_name=>'P27_FCHA_RR'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(765487755268549968)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117586232594808602)
,p_name=>'P27_ID_RCRSO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(485570327487473226)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(72320316034096901)
,p_validation_name=>unistr('Validar inserci\00F3n recursos acci\00F3n')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select 1',
'from v_gj_g_recursos_accion',
'where id_rcrso = :P27_ID_RCRSO',
'and id_instncia_fljo_hjo_gnrdo is null;*/',
'',
'select 1',
'from v_gj_g_recursos_accion a',
'join gj_g_rcrsos_accn_vgnc_cncpt b on a.id_rcrso_accion = b.id_rcrso_accion',
'where a.id_rcrso = :P27_ID_RCRSO',
'and   a.id_instncia_fljo_hjo_gnrdo is null',
'and b.vlor_ajste <> 0;'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Debe generar una acci\00F3n aclaratoria')
,p_when_button_pressed=>wwv_flow_api.id(117398200592926701)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(117607425134186602)
,p_name=>'Al hacer clic en confirmar resolucion'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(117607306085186601)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(117607508723186603)
,p_event_id=>wwv_flow_api.id(117607425134186602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.clear();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(117667026599458901)
,p_name=>'Al hacer clic en regresar al recurso'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(117289156661665001)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(117667131615458902)
,p_event_id=>wwv_flow_api.id(117667026599458901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.removeItem("wf_link");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(72388917881038332)
,p_name=>'al cerrar accion aclaratoria'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(117379198848544306)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117339773631796011)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Recurso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select id_rcrso,',
'           id_acto, ',
'           nmro_acto, ',
'           dscrpcion_acto_tpo, ',
'           fcha_ntfccion, ',
'           fcha_optima, ',
'           trunc(to_date(fcha_optima,''DD/MM/YYYY hh24:mi:ss''))-trunc(to_date(sysdate,''DD/MM/YYYY hh24:mi:ss'')) as dfrncia_dias,',
'           id_rcrso_tipo_clnte,',
'           a_i_r,',
'           indcdor_a_i_r',
'    into :P27_ID_RCRSO,',
'         :P27_ID_ACTO, ',
'         :P27_NMRO_ACTO, ',
'         :P27_DSCRPCION_ACTO_TPO, ',
'         :P27_FCHA_NTFCCION, ',
'         :P27_FCHA_OPTIMA, ',
'         :P27_DFRNCIA_DIAS,',
'         :P27_ID_RCRSO_TIPO_CLNTE,',
'         :P27_AIR,',
'         :P27_INDCDOR_AIR       ',
'    from(select a.id_rcrso,',
'                a.id_acto,',
'                a.nmro_acto,',
'                a.dscrpcion_acto_tpo,',
'                a.fcha_ntfccion,',
'                to_char(pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => a.cdgo_clnte, ',
'                                                              p_fecha_inicial => a.fcha_ntfccion, ',
'                                                              p_undad_drcion  => a.undad_drcion_pr, ',
'                                                              p_drcion        => a.drcion_pr, ',
'                                                              p_dia_tpo       => a.dia_tpo_pr),''dd/MM/yyyy'') as fcha_optima,',
'               a.id_rcrso_tipo_clnte,',
'               a.a_i_r,',
'               a.indcdor_a_i_r',
'         from  v_gj_g_recursos a',
'         where id_instncia_fljo_pdre = :P27_ID_INSTNCIA_FLJO_PDRE);',
'exception',
'    when others then',
'        raise_application_error(-20000,''Problemas al consultar recurso'');',
'end; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117399535264926714)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultamos el Acto que Resuelve el Recurso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_instncia_fljo_hjo  number;',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(3000);',
'begin',
'    begin',
'       select id_instncia_fljo_hjo',
'       into   v_id_instncia_fljo_hjo  ',
'       from   gj_g_recursos ',
'       where id_instncia_fljo_gnrdo_rsl_acl = :F_ID_INSTNCIA_FLJO;',
'     exception',
'            when others then',
'                raise_application_error(-20001, ''Problemas al consultar flujo padre'');',
'    end;',
'',
'    begin',
'        pkg_gj_recurso.prc_co_acto_resolucion(',
'            p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'            p_id_instncia_fljo		=>  v_id_instncia_fljo_hjo,--:P27_ID_INSTNCIA_FLJO_PDRE,',
'            o_id_acto               => :P27_ID_ACTO_RR,',
'            o_id_acto_tpo           => :P27_ID_ACTO_TPO_RR,',
'            o_fcha                  => :P27_FCHA_RR,',
'            o_cdgo_rspsta			=> v_cdgo_rspsta,',
'            o_mnsje_rspsta          => v_mnsje_rspsta',
'        );',
'        if(v_cdgo_rspsta != 0)then',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'        end if;',
'    end;',
'end;    '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117398360772926702)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Acciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_instncia_fljo_hjo_gnrdo    number;',
'    v_id_rcrso             number;',
'    v_id_rcrso_tpo_accion  number;',
'    v_id_ajste_mtvo        number;',
'    v_id_rcrso_accion_a    number;',
'    v_id_rcrso_accion      number;',
'    v_exist                varchar2(1) := ''N'';',
'begin',
'delete muerto;',
'--insert into muerto (c_001) values (''entro ''); commit;',
'    --Consultamos el id del flujo hijo generado',
'    begin',
'        select id_instncia_fljo_hjo_gnrdo',
'        into v_id_instncia_fljo_hjo_gnrdo',
'        from v_gj_g_recursos_accion',
'        where id_instncia_fljo_hjo = :P27_ID_INSTNCIA_FLJO_HJO-- :F_ID_INSTNCIA_FLJO ;',
'        and id_instncia_fljo_hjo_gnrdo is not null;',
'    end;',
'--insert into muerto (c_001) values (''v_id_instncia_fljo_hjo_gnrdo ''||v_id_instncia_fljo_hjo_gnrdo); commit;    ',
'    --Consultamos la accion asociada a la instancia',
'    begin',
'        select a.id_rcrso_accion,',
'                a.id_rcrso,',
'                a.id_rcrso_tpo_accion,',
'                a.id_ajste_mtvo',
'        into    v_id_rcrso_accion_a,',
'                v_id_rcrso,',
'                v_id_rcrso_tpo_accion,',
'                v_id_ajste_mtvo',
'        from gj_g_recursos_accion a',
'        where a.id_instncia_fljo_hjo = v_id_instncia_fljo_hjo_gnrdo;--:F_ID_INSTNCIA_FLJO;',
'        ',
'',
'        --Validamos si ya existe una accion igual',
'        begin',
'            select id_rcrso_accion',
'            into v_id_rcrso_accion',
'            from gj_g_recursos_accion',
'            where id_rcrso_accion_antrior = v_id_rcrso_accion_a ',
'            and      actvo               = ''N'';',
'        exception',
'            when no_data_found then',
'                --Insertamos la nueva accion',
'                begin',
'                    insert into gj_g_recursos_accion (',
'                        id_rcrso_accion_antrior,',
'                        id_rcrso,',
'                        id_rcrso_tpo_accion,',
'                        id_ajste_mtvo,',
'                        actvo',
'                    ) values(',
'                        v_id_rcrso_accion_a,',
'                        v_id_rcrso,',
'                        v_id_rcrso_tpo_accion,',
'                        v_id_ajste_mtvo,',
'                        ''N''',
'                    )returning id_rcrso_accion into v_id_rcrso_accion;',
'                exception',
'                    when others then',
unistr('                        raise_application_error(-20001, ''Problemas al insertar acci\00F3n'');'),
'                end;',
'',
unistr('                --Asociamos las vigencias a la acci\00F3n'),
'                for c_conceptos in (select vgncia, id_prdo, id_cncpto, vlor_sldo_cptal, vlor_ajste',
'                                    from gj_g_rcrsos_accn_vgnc_cncpt',
'                                    where id_rcrso_accion = v_id_rcrso_accion_a)loop',
'                    begin',
'                        insert into gj_g_rcrsos_accn_vgnc_cncpt(',
'                            id_rcrso_accion,',
'                            vgncia,',
'                            id_prdo,',
'                            id_cncpto,',
'                            vlor_sldo_cptal,',
'                            vlor_ajste',
'                        ) values (',
'                            v_id_rcrso_accion,',
'                            c_conceptos.vgncia,',
'                            c_conceptos.id_prdo,',
'                            c_conceptos.id_cncpto,',
'                            c_conceptos.vlor_sldo_cptal,',
'                            0--c_conceptos.vlor_ajste',
'                        );',
'                    exception',
'                        when others then',
'                            raise_application_error(-20001, ''Problemas al registrar los conceptos, ''||sqlerrm);',
'                    end;                    ',
'                end loop;',
'            when others then',
unistr('                raise_application_error(-20001, ''Problemas al validar si existe un acci\00F3n igual'');'),
'        end;',
'        --Asociamos el id de la accion nueva',
'        :P27_ID_RCRSO_ACCION := v_id_rcrso_accion;',
'    ',
'    exception',
'        when others then',
'            :P27_ID_RCRSO_ACCION := null;',
'            raise_application_error(-20001, ''Problemas al consultar accion asociada al recurso,'' ||sqlerrm);',
'    end;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117379198848544306)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--select 1 from gj_g_recursos_accion where id_instncia_fljo_indc = :F_ID_INSTNCIA_FLJO and actvo = ''S'';',
'select 1 from gj_g_recursos where id_instncia_fljo_gnrdo_rsl_acl = :F_ID_INSTNCIA_FLJO ;'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117398423139926703)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Confirmar Vigencias'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_rcrso_accion_a    number;',
'    v_id_rcrso             number;',
'    v_id_rcrso_tpo_accion  number;',
'    v_id_ajste_mtvo        number;',
'begin',
'    --Consultamos la accion asociada a la instancia del flujo',
'    begin',
'        select  a.id_rcrso_accion,',
'                a.id_rcrso,',
'                a.id_rcrso_tpo_accion,',
'                a.id_ajste_mtvo',
'        into    v_id_rcrso_accion_a,',
'                v_id_rcrso,',
'                v_id_rcrso_tpo_accion,',
'                v_id_ajste_mtvo',
'        from gj_g_recursos_accion a',
'     --   where a.id_instncia_fljo_indc = :F_ID_INSTNCIA_FLJO',
'        where a.id_rcrso = :P27_ID_RCRSO  --a.id_instncia_fljo_indc = 1136614 --:F_ID_INSTNCIA_FLJO ',
'        and a.indcdor_extso = ''S''; ',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''Problemas al consultar accion asociada al flujo'');',
'    end;',
unistr('    --Actualizamos la acci\00F3n anterior'),
'    begin',
'        update gj_g_recursos_accion',
'        set actvo = ''N''',
'        where id_instncia_fljo_indc = :F_ID_INSTNCIA_FLJO;',
'       ',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''Problemas al actualizar accion anterior, ''||sqlerrm);',
'    end;',
unistr('    --Actualizamos la acci\00F3n nueva'),
'    begin',
'        update gj_g_recursos_accion',
'        set actvo = ''S''',
'        where id_rcrso_accion_antrior = v_id_rcrso_accion_a;',
'   ',
'    exception    ',
'        when others then',
'            raise_application_error(-20001, ''Problemas al actualizar accion nueva, ''||sqlerrm);',
'    end;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117398200592926701)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--select 1 from gj_g_recursos_accion where id_instncia_fljo_indc = :F_ID_INSTNCIA_FLJO and actvo = ''S'';',
'select 1 from gj_g_recursos where id_instncia_fljo_gnrdo_rsl_acl = :F_ID_INSTNCIA_FLJO ;'))
,p_process_when_type=>'EXISTS'
,p_process_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Acci\00F3n Aclaratoria Confirmada Exitosamente!'),
''))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117398666283926705)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Accion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_rcrso_accion_a    number;',
'    v_id_rcrso             number;',
'    v_id_rcrso_tpo_accion  number;',
'    v_id_ajste_mtvo        number;',
'begin',
'    --Consultamos la accion asociada a la instancia del flujo',
'    begin',
'        /*',
'        select a.id_rcrso_accion,a.id_rcrso, a.id_rcrso_tpo_accion, a.id_ajste_mtvo',
'        into v_id_rcrso_accion_a,v_id_rcrso, v_id_rcrso_tpo_accion, v_id_ajste_mtvo',
'        from gj_g_recursos_accion a',
'        where a.id_instncia_fljo_indc = :F_ID_INSTNCIA_FLJO and',
'              a.actvo = ''N''; */',
'        select  a.id_rcrso_accion,',
'                a.id_rcrso,',
'                a.id_rcrso_tpo_accion,',
'                a.id_ajste_mtvo',
'        into    v_id_rcrso_accion_a,',
'                v_id_rcrso,',
'                v_id_rcrso_tpo_accion,',
'                v_id_ajste_mtvo',
'        from gj_g_recursos_accion a',
'        where a.id_rcrso = :P27_ID_RCRSO  --a.id_instncia_fljo_indc = 1136614 --:F_ID_INSTNCIA_FLJO ',
'        and a.indcdor_extso = ''S'';      ',
'    exception    ',
'        when others then',
'            raise_application_error(-20001, ''Problemas al consultar accion referencia'');',
'    end;',
'    insert into muerto (c_001) values ('':P27_ID_RCRSO ''||:P27_ID_RCRSO); commit;    ',
'    --Consultamos la nueva accion',
'    begin',
'    /*  select id_rcrso_accion',
'        into :P27_ID_RCRSO_ACCION',
'        from gj_g_recursos_accion',
'        where id_rcrso_accion_antrior = v_id_rcrso_accion_a;*/',
'        select  id_rcrso_accion',
'        into :P27_ID_RCRSO_ACCION',
'        from gj_g_recursos_accion',
'        where id_rcrso = :P27_ID_RCRSO ',
'        and id_instncia_fljo_hjo is not null;',
'    exception    ',
'        when others then',
'            raise_application_error(-20001, ''Problemas al consultar accion nueva'');',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117398545543926704)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--select 1 from gj_g_recursos_accion where id_instncia_fljo_indc = :F_ID_INSTNCIA_FLJO and actvo = ''S''',
'select 1 from gj_g_recursos where id_instncia_fljo_gnrdo_rsl_acl = :F_ID_INSTNCIA_FLJO ;'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117463351039624769)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(4000); ',
'begin',
'  --  begin',
'        pkg_gj_recurso.prc_rg_etapa_documentos(p_cdgo_clnte			=>    :F_CDGO_CLNTE',
'                                              ,p_id_instncia_fljo	=>    :P27_ID_INSTNCIA_FLJO_HJO--:P27_ID_INSTNCIA_FLJO_PDRE',
'                                              ,p_id_fljo_trea		=>    :F_ID_FLJO_TREA',
'                                              ,p_id_usrio			=>    :F_ID_USRIO',
'                                              ,p_id_rcrso_dcmnto	=>    :P27_ID_RCRSO_DCMNTO',
'                                              ,o_cdgo_rspsta		=>    v_cdgo_rspsta',
'                                              ,o_mnsje_rspsta		=>    v_mnsje_rspsta);',
'        if (v_cdgo_rspsta <> 0) then',
'         --  :P27_MNSJE_RSPSTA:=''Problemas al Confimrar el acto - '' || v_mnsje_rspsta;',
'         --     v_mnsje_rspsta := ''Problemas al llamar el procedimiento.'' || v_cdgo_rspsta;',
'             raise_application_error(-20001,v_mnsje_rspsta);',
'             ',
'  ',
'	   end if;          ',
'        ',
'   /*     ',
'        exception',
'            when others then',
'                v_mnsje_rspsta := ''Problemas al llamar el procedimiento.'';',
'                raise_application_error(-20001,v_mnsje_rspsta);*/',
'  --  end;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'generarDocumentos'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>unistr('Documento(s) generado(s) con \00E9xito.;')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117616802692252487)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registra Item Recursos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta number := 0;',
'    v_mnsje_rspsta varchar2(32000);',
'begin',
'        --Registramos los item necesarios para el recurso',
'        pkg_gj_recurso.prc_rg_recursos_item(',
'            p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'            p_id_instncia_fljo		=> :P27_ID_INSTNCIA_FLJO_HJO,--:P27_ID_INSTNCIA_FLJO_PDRE,',
'            p_id_usrio              => :F_ID_USRIO,',
'            p_id_fljo_trea		    => :F_ID_FLJO_TREA,',
'            o_cdgo_rspsta			=> v_cdgo_rspsta,',
'            o_mnsje_rspsta          => v_mnsje_rspsta',
'        );',
'        ',
'        if(v_cdgo_rspsta != 0)then',
'             raise_application_error(-20001,v_mnsje_rspsta);',
'        end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117607306085186601)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117607611777186604)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Workflow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117607306085186601)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71517530821183801)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Flujo Hijo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_instncia_fljo_hjo',
'into :P27_ID_INSTNCIA_FLJO_HJO',
'from   gj_g_recursos ',
'where id_instncia_fljo_gnrdo_rsl_acl = :F_ID_INSTNCIA_FLJO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117342302029859002)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Flujo Padre'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*begin',
'    select id_instncia_fljo',
'    into :P27_ID_INSTNCIA_FLJO_PDRE',
'    from wf_g_instancias_flujo_gnrdo ',
'    where id_instncia_fljo_gnrdo_hjo = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when others then',
'        raise_application_error(-20001, ''Problemas al consultar flujo padre'');',
'end;*/',
'',
'begin',
'select a.id_instncia_fljo',
'into :P27_ID_INSTNCIA_FLJO_PDRE',
'from wf_g_instancias_flujo_gnrdo a',
'join gj_g_recursos              b on a.id_instncia_fljo_gnrdo_hjo = b.id_instncia_fljo_hjo',
'where b.id_instncia_fljo_gnrdo_rsl_acl =:F_ID_INSTNCIA_FLJO;',
'exception',
'    when others then',
'        raise_application_error(-20001, ''Problemas al consultar flujo padre'');',
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117338836591793521)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.id_tpo,',
'            a.id_mtvo,',
'            b.nmbre_impsto,',
'            c.nmbre_impsto_sbmpsto,',
'            a.idntfccion,',
'            a.id_rdcdor,',
'            a.id_slctud,',
'            a.nmro_rdcdo_dsplay,',
'            a.fcha_rdcdo,',
'            a.id_prsntcion_tpo,',
'            null,',
'            null',
'      into :P27_ID_TPO,',
'           :P27_ID_MTVO,',
'           :P27_NMBRE_IMPSTO,',
'           :P27_NMBRE_IMPSTO_SBMPSTO,',
'           :P27_IDNTFCCION_SJTO,',
'           :P27_ID_RDCDOR,',
'           :P27_ID_SLCTUD,',
'           :P27_NMRO_RDCDO_DSPLAY,',
'           :P27_FCHA_RDCDO,',
'           :P27_ID_PRSNTCION_TPO,',
'           :P27_CLIC_ACCION_ACLARATORIA,',
'           :P27_CLIC_CNFMR_VGNCS',
'      from v_pq_g_solicitudes a',
'      inner join df_c_impuestos b on a.id_impsto = b.id_impsto',
'      inner join df_i_impuestos_subimpuesto c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto and',
'                                                 a.id_impsto = c.id_impsto and',
'                                                 c.cdgo_clnte = :F_CDGO_CLNTE',
'   --    join   gj_g_recursos      d on d.id_instncia_fljo_hjo = a.id_instncia_fljo_gnrdo',
'   --   where d.id_instncia_fljo_gnrdo_rsl_acl = :F_ID_INSTNCIA_FLJO;                                            ',
'      where a.id_instncia_fljo = :P27_ID_INSTNCIA_FLJO_PDRE;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20001, ''Solicitud no encontrada''|| :P27_ID_INSTNCIA_FLJO_PDRE);',
'    when others then',
'       raise_application_error(-20001, ''Problemas al consultar radicador''); ',
'end;',
'  ',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117339186978794575)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  b.dscrpcion_idntfccion_tpo,',
'            a.idntfccion,',
'            a.prmer_nmbre,',
'            a.sgndo_nmbre,',
'            a.prmer_aplldo,',
'            a.sgndo_aplldo',
'    into    :P27_DSCRPCION_IDNTFCCION_TPO,',
'            :P27_IDNTFCCION,',
'            :P27_PRMER_NMBRE,',
'            :P27_SGNDO_NMBRE,',
'            :P27_PRMER_APLLDO,',
'            :P27_SGNDO_APLLDO',
'    from pq_g_radicador a',
'    inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'    where id_rdcdor = :P27_ID_RDCDOR;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20001, ''Radicador de PQR no encontrado'');',
'    when others then',
'       raise_application_error(-20001, ''Problemas al consultar radicador''); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117339419595795237)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select d.dscrpcion_rspnsble_tpo,',
'           b.dscrpcion_idntfccion_tpo,',
'           a.idntfccion,',
'           a.prmer_nmbre,',
'           a.sgndo_nmbre,',
'           a.prmer_aplldo,',
'           a.sgndo_aplldo,',
'           c.nmbre_pais,',
'           c.nmbre_dprtmnto,',
'           c.nmbre_mncpio,',
'           a.drccion_ntfccion,',
'           a.email,',
'           a.tlfno,',
'           a.cllar',
'      into :P27_DSCRPCION_RSPNSBLE_TPO,',
'           :P27_DSCRPCION_IDNTFCCION_TPO_S,',
'           :P27_IDNTFCCION_S,',
'           :P27_PRMER_NMBRE_S,',
'           :P27_SGNDO_NMBRE_S ,',
'           :P27_PRMER_APLLDO_S,',
'           :P27_SGNDO_APLLDO_S,',
'           :P27_NMBRE_PAIS_NTFCCION_S,',
'           :P27_NMBRE_DPRTMNTO_NTFCCION_S,',
'           :P27_NMBRE_MNCPIO_NTFCCION_S,',
'           :P27_DRCCION_NTFCCION_S,',
'           :P27_EMAIL_S,',
'           :P27_TLFNO_S,',
'           :P27_CLLAR_S',
'      from pq_g_solicitantes a',
'      inner join df_s_identificaciones_tipo b on a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'      inner join v_df_s_municipios c on a.id_mncpio_ntfccion = c.id_mncpio',
'      inner join df_s_responsables_tipo d on a.cdgo_rspnsble_tpo = d.cdgo_rspnsble_tpo',
'     where a.id_slctud = :P27_ID_SLCTUD;',
'exception',
'    when no_data_found then',
'       raise_application_error(-20000, ''Solicitante de PQR no encontrado'');',
'    when others then',
'       raise_application_error(-20000, ''Problemas al consultar Solicitante''); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
