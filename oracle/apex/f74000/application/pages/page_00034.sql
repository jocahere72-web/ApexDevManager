prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Liquidaci\00F3n Oficial de Aforo')
,p_step_title=>unistr('Liquidaci\00F3n Oficial de Aforo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'async function generarActo(p_id_expdnte_acto){',
'    console.log(''pageId:''+pageId)',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'    console.log(''entrando al JS:''+pageId)',
'    await apex.server.process("generarActo", {',
'            pageItems: "#P"+pageId+"_ID_CNDDTO",',
'            x01: p_id_expdnte_acto}, {',
'            success: function(data) {',
'                    console.log(''DATA:''+JSON.stringify(data));',
'                    if (data.cdgo_rspsta > 0) {',
'                        console.log(''ERROR:''+data.mnsje_rspsta)',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([{',
'                            type: "error",',
'                            location: "page",',
'                            message: data.mnsje_rspsta,',
'                            unsafe: false',
'                        }]);',
'                    } else {',
'                        console.log(''OK:''+data.mnsje_rspsta)',
'                        apex.submit();',
'                    }',
'                }',
'            })',
'    }catch(e){',
'        console.error(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'   $(''#BTN_SNCION'').click();',
'} );'))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241116072410'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62651688643955601)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
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
 p_id=>wwv_flow_api.id(62661212347010001)
,p_plug_name=>unistr('Proceso de Fiscalizaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.CANDIDATO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'F_ID_INSTNCIA_FLJO'
,p_attribute_02=>'F_ID_FLJO_TREA'
,p_attribute_03=>'P34_ID_SJTO_IMPSTO'
,p_attribute_04=>'F_ID_FNCNRIO'
,p_attribute_05=>'P34_ID_FSCLZCION_EXPDNTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63296029503975795)
,p_plug_name=>'Declaraciones'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto,',
'        a.nmbre_impsto_sbmpsto,',
'        b.vgncia,',
'        c.prdo,',
'        f.dscrpcion,',
'        b.id_dclrcion_vgncia_frmlrio,',
'        b.id_cnddto_vgncia,',
'        g.id_dclrcion,',
'        case when g.id_dclrcion is null /*or (select m.id_acto_tpo ',
'                                             from fi_g_fiscalizacion_expdnte     i',
'                                             join fi_g_fsclzcion_expdnte_acto    m   on  i.id_fsclzcion_expdnte  =   m.id_fsclzcion_expdnte',
'                                             where i.id_fsclzcion_expdnte = :P34_ID_FSCLZCION_EXPDNTE ',
'                                             and m.id_acto_tpo = (select a.id_acto_tpo',
'                                                                  from gn_d_actos_tipo_tarea a',
'                                                                  where id_fljo_trea = :F_ID_FLJO_TREA',
'                                                                  and a.indcdor_oblgtrio = ''S'')',
'                                             and not m.id_acto is null) is null*/ then',
'            ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">',
'                    Generar <span class="fa fa-cog"></span>',
'                </button>',
'            </center>''',
'        else',
'            ''<a href="#"><span class="fa fa-check"></span></a>''',
'        end btn,',
'        case when g.id_dclrcion is not null then',
'            ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">',
'                    Ver <span class="fa fa-eye"></span>',
'                </button>',
'            </center>''',
'        else',
'            ''<a href="#"><span class="fa fa-eye-slash"></span></a>''',
'        end Ver',
'from v_fi_g_candidatos              a',
'join fi_g_candidatos_vigencia       b   on  a.id_cnddto                     =   b.id_cnddto',
'join fi_g_fsclzc_expdn_cndd_vgnc    h   on  b.id_cnddto_vgncia              =   h.id_cnddto_vgncia',
'join df_i_periodos                  c   on  b.id_prdo                       =   c.id_prdo',
'join gi_d_dclrcnes_vgncias_frmlr    d   on  b.id_dclrcion_vgncia_frmlrio    =   d.id_dclrcion_vgncia_frmlrio',
'join gi_d_dclrcnes_tpos_vgncias     e   on  d.id_dclrcion_tpo_vgncia        =   e.id_dclrcion_tpo_vgncia',
'join gi_d_declaraciones_tipo        f   on  e.id_dclrcn_tpo                 =   f.id_dclrcn_tpo',
'left join gi_g_declaraciones        g   on  b.id_cnddto_vgncia              =   g.id_cnddto_vgncia',
'where a.id_cnddto = :P34_ID_CNDDTO',
';'))
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
 p_id=>wwv_flow_api.id(63297192981975807)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'BVILLEGAS'
,p_internal_uid=>63297192981975807
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31669131525048737)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31669500414048742)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Subtributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31669943628048743)
,p_db_column_name=>'VGNCIA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31670347967048744)
,p_db_column_name=>'PRDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31670748949048744)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Tipo Declaraci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31671175214048744)
,p_db_column_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Dclrcion Vgncia Frmlrio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31671552058048745)
,p_db_column_name=>'ID_CNDDTO_VGNCIA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Id Cnddto Vgncia'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31671981657048745)
,p_db_column_name=>'ID_DCLRCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Id Dclrcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31672343484048746)
,p_db_column_name=>'BTN'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Acci\00F3n')
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID_SJTO_IMPSTO,P36_ID_CNDDTO_VGNCIA,P36_ID_DCLRCION,P36_ID_DCLRCION_VGNCIA_FRMLRIO,P36_ID_INSTNCIA_FLJO,P36_PGNA:&P34_ID_SJTO_IMPSTO.,#ID_CNDDTO_VGNCIA#,#ID_DCLRCION#,#ID_DCLRCION_VGNCIA_FRMLRIO#,&F_ID_INS'
||'TNCIA_FLJO.,&APP_PAGE_ID.'
,p_column_linktext=>'#BTN#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31672707985048746)
,p_db_column_name=>'VER'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Ver'
,p_column_link=>'f?p=140000:34:&SESSION.::&DEBUG.:RP,34:P34_ID_DCLRCION:#ID_DCLRCION#'
,p_column_linktext=>'#VER#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(63305493933012577)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'316731'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:VGNCIA:PRDO:DSCRPCION:ID_DCLRCION_VGNCIA_FRMLRIO:ID_CNDDTO_VGNCIA:ID_DCLRCION:BTN:VER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67013635758657901)
,p_plug_name=>'Declaraciones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto,',
'        a.nmbre_impsto_sbmpsto,',
'        b.vgncia,',
'        c.prdo,',
'        f.dscrpcion,',
'        b.id_dclrcion_vgncia_frmlrio,',
'        b.id_cnddto_vgncia,',
'        g.id_dclrcion,',
'        case when g.id_dclrcion is null or (select m.id_acto_tpo ',
'                                             from fi_g_fiscalizacion_expdnte     i',
'                                             join fi_g_fsclzcion_expdnte_acto    m   on  i.id_fsclzcion_expdnte  =   m.id_fsclzcion_expdnte',
'                                             where i.id_fsclzcion_expdnte = :P34_ID_FSCLZCION_EXPDNTE ',
'                                             and m.id_acto_tpo = (select a.id_acto_tpo',
'                                                                  from gn_d_actos_tipo_tarea a',
'                                                                  where id_fljo_trea = :F_ID_FLJO_TREA',
'                                                                  and a.indcdor_oblgtrio = ''S'')',
'                                             and not m.id_acto is null) is null then',
'            ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                ||''Generar ''',
'                ||''<span class="fa fa-cog fa-spin"></span>',
'                </button>',
'            </center>''',
'        else',
'            /*''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                ||''Modificar ''',
'                ||''<span class="fa fa-edit"></span>',
'                </button>',
'            </center>''*/',
'            ''<a href="#">',
'                <span class="fa fa-check"></span>',
'            </a>''',
'        end btn,',
'        case when g.id_dclrcion is not null then',
'            /*''<a href="#">',
'                <span class="fa fa-eye"></span>',
'            </a>''*/',
'            ''Ver''',
'        else',
'            ''-''',
'        end ver',
'from v_fi_g_candidatos              a',
'join fi_g_candidatos_vigencia       b   on  a.id_cnddto =   b.id_cnddto',
'join fi_g_fsclzc_expdn_cndd_vgnc    h   on  b.id_cnddto_vgncia = h.id_cnddto_vgncia',
'join df_i_periodos                  c   on  b.id_prdo   =   c.id_prdo',
'join gi_d_dclrcnes_vgncias_frmlr    d   on  b.id_dclrcion_vgncia_frmlrio    =   d.id_dclrcion_vgncia_frmlrio',
'join gi_d_dclrcnes_tpos_vgncias     e   on  d.id_dclrcion_tpo_vgncia        =   e.id_dclrcion_tpo_vgncia',
'join gi_d_declaraciones_tipo        f   on  e.id_dclrcn_tpo                 =   f.id_dclrcn_tpo',
'left join gi_g_declaraciones        g   on  b.id_cnddto_vgncia              =   g.id_cnddto_vgncia',
'where a.id_cnddto = :P34_ID_CNDDTO',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67013865831657903)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67013952208657904)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67014015916657905)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67014167342657906)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(67014301782657908)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67291425323535801)
,p_name=>'ID_CNDDTO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(68608944707134404)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Tipo Declaraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(68691462205988101)
,p_name=>'BTN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BTN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>unistr('Acci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP:P36_ID_SJTO_IMPSTO,P36_ID_CNDDTO_VGNCIA,P36_ID_DCLRCION,P36_ID_DCLRCION_VGNCIA_FRMLRIO,P36_ID_INSTNCIA_FLJO,P36_PGNA:&P34_ID_SJTO_IMPSTO.,&ID_CNDDTO_VGNCIA.,&ID_DCLRCION.,&ID_DCLRCION_VGNCIA_FRMLRIO.,&F_ID_INSTNC'
||'IA_FLJO.,&APP_PAGE_ID.'
,p_link_text=>'&BTN.'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(68691578600988102)
,p_name=>'ID_DCLRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(237500252762087102)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=140000:34:&SESSION.::&DEBUG.:34:P34_ID_DCLRCION:&ID_DCLRCION.'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(67013788263657902)
,p_internal_uid=>67013788263657902
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(67020056985663579)
,p_interactive_grid_id=>wwv_flow_api.id(67013788263657902)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(67020108924663586)
,p_report_id=>wwv_flow_api.id(67020056985663579)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67020693863663599)
,p_view_id=>wwv_flow_api.id(67020108924663586)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(67013865831657903)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67021158680663604)
,p_view_id=>wwv_flow_api.id(67020108924663586)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67013952208657904)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67021638592663607)
,p_view_id=>wwv_flow_api.id(67020108924663586)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(67014015916657905)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67022104990663608)
,p_view_id=>wwv_flow_api.id(67020108924663586)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(67014167342657906)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67026640884679346)
,p_view_id=>wwv_flow_api.id(67020108924663586)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(67014301782657908)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(67297443211544828)
,p_view_id=>wwv_flow_api.id(67020108924663586)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(67291425323535801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(68617804331215339)
,p_view_id=>wwv_flow_api.id(67020108924663586)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(68608944707134404)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>683
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(68697271500988728)
,p_view_id=>wwv_flow_api.id(67020108924663586)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(68691462205988101)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(68699274584026517)
,p_view_id=>wwv_flow_api.id(67020108924663586)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(68691578600988102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(237506139113095980)
,p_view_id=>wwv_flow_api.id(67020108924663586)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(237500252762087102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(378025364014549287)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
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
 p_id=>wwv_flow_api.id(395201324060700764)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'',
'<p align="justify">',
unistr('<i>Funcionalidad que permite generar, modificar, visualizar y confirmar los actos parametrizados en la etapa Resoluci\00F3n por no declarar que no requieren confirmaci\00F3n por el supervisor.</i>'),
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62658514163999663)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(378025364014549287)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3337347963678403)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(378025364014549287)
,p_button_name=>'BTN_SNCION'
,p_button_static_id=>'BTN_SNCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>unistr('Generar Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP,31:P31_ID_FSCLZCION_EXPDNTE,P31_CDGO_ACTO_TPO,P31_ID_CNDDTO,P31_PGNA,P31_ID_SJTO_IMPSTO:&P34_ID_FSCLZCION_EXPDNTE.,RXD,&P34_ID_CNDDTO.,&APP_PAGE_ID.,&P34_ID_SJTO_IMPSTO.'
,p_button_condition=>':P34_DFNCION = ''S'' and :P34_SNCION is null and (:P34_COUNT_VGNCIAS_DC = :P34_COUNT_VGNCIAS)'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6760857208805802)
,p_name=>'P34_COUNT_VGNCIAS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(62661212347010001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6760933252805803)
,p_name=>'P34_COUNT_VGNCIAS_DC'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(62661212347010001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62661301274010002)
,p_name=>'P34_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(62661212347010001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62661404159010003)
,p_name=>'P34_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(62661212347010001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62661518338010004)
,p_name=>'P34_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(62661212347010001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62661696504010005)
,p_name=>'P34_ID_CNDDTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(62661212347010001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66769134328029501)
,p_name=>'P34_ID_FSCLZCION_EXPDNTE_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(62661212347010001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71758481260170201)
,p_name=>'P34_PAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(62661212347010001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74196158694042302)
,p_name=>'P34_SNCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(62661212347010001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74196285857042303)
,p_name=>'P34_DFNCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(62661212347010001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74196338829042304)
,p_name=>'Capturar el evento dialogclose'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74196406837042305)
,p_event_id=>wwv_flow_api.id(74196338829042304)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(62661735922010006)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga Informaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select a.id_cnddto,',
'           a.id_impsto,',
'           a.id_sjto_impsto,',
'           c.id_fsclzcion_expdnte',
'    into   :P34_ID_CNDDTO,',
'           :P34_ID_IMPSTO,',
'           :P34_ID_SJTO_IMPSTO,',
'           :P34_ID_FSCLZCION_EXPDNTE',
'    from v_fi_g_candidatos          a',
'    join fi_g_fiscalizacion_expdnte c on a.id_cnddto        = c.id_cnddto',
'    join v_si_i_sujetos_impuesto    d on a.id_sjto_impsto   = d.id_sjto_impsto',
'    where c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'    ',
'',
'exception',
'    when others then',
'        :P34_ID_CNDDTO    := null;',
'        :P34_ID_SJTO_IMPSTO := null;',
'        :P34_ID_FSCLZCION_EXPDNTE := null;',
'        :P34_ID_IMPSTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74196062273042301)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Condici\00F3n de Servidor')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    ---Se valida si ya fue registrado el expediente en la tabla de sanciones',
'    begin',
'        select a.bse',
'          into :P34_SNCION',
'          from fi_g_fiscalizacion_sancion   a',
'         where a.id_fsclzcion_expdnte       = :P34_ID_FSCLZCION_EXPDNTE;',
'    exception',
'        when others then',
'            :P34_SNCION := null;',
'    end;',
'    ',
unistr('    --Se consulta la defici\00F3n de cliente'),
'    begin',
'        select b.vlor',
'        into :P34_DFNCION',
'        from df_c_definiciones_clnte_ctgria a',
'        join df_c_definiciones_cliente      b   on  a.id_dfncion_clnte_ctgria   =   b.id_dfncion_clnte_ctgria',
'        where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and b.cdgo_dfncion_clnte = ''LOA'';',
'    exception',
'        when others then',
'            :P34_DFNCION := null;',
'    end;',
'    ',
'    --Se consulta la vigencias a declarar',
'    begin',
'        select count(b.id_fsclzcion_expdnte)',
'        into :P34_COUNT_VGNCIAS',
'        from fi_g_fiscalizacion_expdnte a',
'        join fi_g_fsclzc_expdn_cndd_vgnc b on b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'        where a.id_fsclzcion_expdnte = :P34_ID_FSCLZCION_EXPDNTE;',
'    exception',
'        when others then',
'            :P34_COUNT_VGNCIAS := 0;',
'    end;',
'    ',
'    --Se consulta la vigencias declaradas',
'    begin',
'        select count(c.id_dclrcion)',
'        into :P34_COUNT_VGNCIAS_DC',
'        from fi_g_fiscalizacion_expdnte a',
'        join fi_g_fsclzc_expdn_cndd_vgnc b on b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'        join gi_g_declaraciones c on c.id_cnddto_vgncia = b.id_cnddto_vgncia',
'        where a.id_fsclzcion_expdnte = :P34_ID_FSCLZCION_EXPDNTE;',
'    exception',
'        when others then',
'            :P34_COUNT_VGNCIAS_DC := 0;',
'    end;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68386788707104705)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'    v_vlor_ttal      number       := 0;',
'    ',
'begin',
'    ',
'    if :P34_DFNCION = ''S'' then',
'    ',
'        pkg_fi_fiscalizacion.prc_rg_liquidacion(p_cdgo_clnte             =>  :F_CDGO_CLNTE,',
'                                                p_id_usrio               =>  :F_ID_USRIO, ',
'                                                p_id_fsclzcion_expdnte   =>  :P34_ID_FSCLZCION_EXPDNTE,      ',
'                                                p_id_fsclzcion_expdnte_acto => :P34_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                o_vlor_ttal                  =>    v_vlor_ttal, ',
'                                                o_cdgo_rspsta            =>  v_cdgo_rspsta,',
'                                                o_mnsje_rspsta           =>  v_mnsje_rspsta);',
'    end if;',
'    ',
'',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20002, v_mnsje_rspsta);',
'    end if;',
'',
'    pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                     p_id_usrio                    => :F_ID_USRIO,  ',
'                                     p_id_fsclzcion_expdnte_acto   => :P34_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                     p_id_cnddto                   => :P34_ID_CNDDTO,',
'                                     p_acto_vlor_ttal              => v_vlor_ttal,',
'                                     o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                     o_mnsje_rspsta                => v_mnsje_rspsta);',
'                                                      ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GENERAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30994706805393083)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'generarActo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number         := 0;',
'    v_mnsje_rspsta   varchar2(4000) := ''OK'';',
'    v_id_expdnte_acto number        := apex_application.g_x01;',
'    v_vlor_ttal        number       := 0;',
'',
'begin',
'    :P34_ID_FSCLZCION_EXPDNTE_ACTO := v_id_expdnte_acto;',
'    ',
'    if :P34_COUNT_VGNCIAS_DC = :P34_COUNT_VGNCIAS then',
'    ',
'        if :P34_DFNCION = ''S'' then',
'            begin',
'                pkg_fi_fiscalizacion.prc_rg_liquidacion( p_cdgo_clnte		          =>    :F_CDGO_CLNTE,',
'                                                         p_id_usrio                   =>    :F_ID_USRIO,',
'                                                         p_id_fsclzcion_expdnte       =>    :P34_ID_FSCLZCION_EXPDNTE,',
'                                                         p_id_fsclzcion_expdnte_acto  =>    :P34_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                         o_vlor_ttal                  =>    v_vlor_ttal, ',
'                                                         o_cdgo_rspsta		          =>    v_cdgo_rspsta,',
'                                                         o_mnsje_rspsta	              =>    v_mnsje_rspsta);',
'            end;',
'        end if;',
'        if v_cdgo_rspsta = 0 then',
'            begin',
'                pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                                 p_id_usrio                    => :F_ID_USRIO,  ',
'                                                 p_id_fsclzcion_expdnte_acto   => :P34_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                 p_id_cnddto                   => :P34_ID_CNDDTO,',
'                                                 p_acto_vlor_ttal              => v_vlor_ttal,',
'                                                 o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta                => v_mnsje_rspsta);',
'            end;',
'        else',
'            rollback;',
'            return;',
'        end if;',
'    else',
'        v_cdgo_rspsta    :=    1;',
unistr('        v_mnsje_rspsta   :=    ''Se\00F1or(a) usuario, por favor realice las liquidaciones de aforo pendientes.'';'),
'    end if;',
'    apex_json.open_object;',
'    apex_json.write(''cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'        rollback;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
