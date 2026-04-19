prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Solicitud'
,p_step_title=>'Solicitud'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function imprimir_(){',
'  /*apex.server.process ("Imprimir_documentos", {  ',
'  pageItems: "#P9_IDNTFCCION_SJTO,#P9_ID_IMPSTO,#P9_ID_MTVO,#P9_ID_IMPSTO_SBMPSTO"',
'  }).then(function(resp){',
'      var waitPopup$ = apex.widget.waitPopup();',
'       var data = resp.data;',
'       var count = 0;',
'       apex.message.clearErrors();',
'       if (resp.type){',
'          var inter = setInterval(function(){',
'          window.open(data[count].url, ''_self'');          ',
'          if ((data.length - 1) === count){',
'              clearInterval(inter);',
'              waitPopup$.remove();',
'          }',
'          count++;    ',
'       }, 800); ',
'       }else {           ',
'           apex.message.showErrors([',
'               {',
'                   type:       "error",',
'                   location:   [ "page","inline" ],',
'                   pageItem:   "P9_ID_MTVO",',
'                   message:    "No se encontraron documentos parametrizados para este motivo",',
'                   unsafe:     false',
'               }',
'           ]);',
'           waitPopup$.remove();',
'       }              ',
'     }',
');*/',
' console.log();   ',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'mostrarAyudaD();',
'',
'//if ($v(''P9_ID_SLCTUD'') > 0 ){',
'//if ($v(''P9_FCHA_RDCDO'') === "" ){ ',
'if ($v(''P9_ID_PRSNTCION_TPO'') == 4 ){   ',
'    apex.item(''P9_FCHA_RDCDO'').show(); ',
'}else{  ',
'    apex.item(''P9_FCHA_RDCDO'').hide();',
'}',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_VLDAR {',
'    padding: 0.3rem !important;',
'}'))
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20250812114304'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72791689084887601)
,p_plug_name=>'Datos del Sujeto Pasivo'
,p_region_name=>'radicador'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72791806484887603)
,p_plug_name=>'Tabulador'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(71822304308951566)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72791954306887604)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P9_ID_SLCTUD'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73236226219960807)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(72791954306887604)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_mtvo_dcmnto',
'        , dscrpcion_dcmnto',
'        , blob001 file_blob',
'        , c002 file_name',
'        , c001 obsrvcion,',
'        case',
'            when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'            else  ''Pendiente''',
'        end Estado,',
'        m.dscrpcion_indcdor_oblgtrio       ',
'     from v_pq_d_motivos_documento m',
'left join apex_collections c',
'       on id_mtvo_dcmnto = n001    ',
'      and collection_name = ''DOCUMENTOS''',
'    where id_mtvo = :P9_ID_MTVO',
'     and m.actvo =''S'''))
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
 p_id=>wwv_flow_api.id(73238084932960825)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>73238084932960825
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73238152823960826)
,p_db_column_name=>'ID_MTVO_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Mtvo Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73238435670960829)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73238538836960830)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Archivo'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73624377573943404)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74697790183281801)
,p_db_column_name=>'ESTADO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76903323966160218)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119565714714447902)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('\00BFObligatorio?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(73341733353253614)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'733418'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:ESTADO::FILE_NAME:DSCRPCION_INDCDOR_OBLGTRIO'
,p_sort_column_1=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(11461024179194567)
,p_report_id=>wwv_flow_api.id(73341733353253614)
,p_name=>'Obligatorio'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_operator=>'='
,p_expr=>'Si'
,p_condition_sql=>' (case when ("DSCRPCION_INDCDOR_OBLGTRIO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Si''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#D0F1CD'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72792183397887606)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72792260011887607)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>30
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
unistr('Funcionalidad que permite ingresar una nueva solicitud, se debe especificar los datos solicitados en las pesta\00F1as: <br><br>'),
'<b>1.</b> Datos solicitud <br>',
'<b>2.</b> Datos del Radicador <br>',
'<b>3.</b> Datos del Solicitante y <br>',
'<b>4.</b> Documentos.<br><br>',
unistr('Una vez ingresados los datos hacer clic en el bot\00F3n Insertar.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.        </i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72793294691887617)
,p_plug_name=>'Datos del Solicitante'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>',
'',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73043808647213106)
,p_plug_name=>'Datos Solicitud'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'        <div  class="col col-12" style="text-align: right !important;">',
'            <font size="1">Los campos marcados con </font><font size="2" color="red">*</font><font size="1"> son obligatorios</font>',
'        </div>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92720067764367319)
,p_plug_name=>'PQR Historicos'
,p_region_name=>'PQR_HISTORICOS'
,p_parent_plug_id=>wwv_flow_api.id(73043808647213106)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select s.cdgo_clnte,',
'       s.id_slctud,     ',
'       s.nmro_rdcdo_dsplay,',
'       initcap(upper(r.prmer_nmbre || '' '' || r.prmer_aplldo)) nmbre_rdcdor,',
'       m.dscrpcion,',
'       e.dscrpcion dscrpcion_estdo,',
'       sms.idntfccion,',
'       i.nmbre_impsto,',
'       i.nmbre_impsto_sbmpsto,',
'       s.fcha_rdcdo,',
'       s.fcha_pryctda,',
'       s.fcha_real,  ',
'       case when s.fcha_real is not null ',
'            then 0',
'            when trunc(sysdate) >= trunc(cast (s.fcha_pryctda as date))',
'            then 0',
'            when trunc(sysdate) < trunc(cast (s.fcha_pryctda as date))',
'            then trunc(abs( cast(s.fcha_pryctda as date) - cast(sysdate as date) )) ',
'      end dias_faltantes,      ',
'       case when s.fcha_real is not null',
'            then 0 ',
'            when trunc(sysdate) > trunc(cast (s.fcha_pryctda as date))',
'            then trunc(abs( cast(s.fcha_pryctda as date) - cast(sysdate as date) ))',
'            else 0',
'       end dias_vencidos,',
'       case when trunc(sysdate) > trunc(cast (s.fcha_pryctda as date)) and  s.fcha_real is null',
'            then 1',
'            else 0',
'       end estdo, ',
'       s.id_instncia_fljo,',
'       rs.dscrpcion dscrpcion_rspsta,',
'       s.obsrvcion_rspsta,',
'       p.dscrpcion tpo_prsntcion',
'     from pq_g_solicitudes              s',
'     join v_sg_g_usuarios               u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                  e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo       sm  on sm.id_slctud = s.id_slctud',
'     join pq_d_motivos                  m   on m.id_mtvo = sm.id_mtvo',
'left join pq_g_slctdes_mtvo_sjt_impst   sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo      p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'left join v_df_i_impuestos_subimpuesto  i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'left join pq_d_respuestas               rs   on rs.cdgo_rspsta = s.cdgo_rspsta',
'   where s.cdgo_clnte = :F_CDGO_CLNTE',
'      and sms.idntfccion = :P9_IDNTFCCION_SJTO)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92720261183367321)
,p_name=>'NMRO_RDCDO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Radicado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(92720345042367322)
,p_name=>'NMBRE_RDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RDCDOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>201
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
 p_id=>wwv_flow_api.id(92720475971367323)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>400
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
 p_id=>wwv_flow_api.id(92720565624367324)
,p_name=>'DSCRPCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92720657894367325)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_api.id(92720771972367326)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nmbre Impsto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(92720864471367327)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(92720998273367328)
,p_name=>'FCHA_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RDCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Radicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(92721077065367329)
,p_name=>'FCHA_PRYCTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRYCTDA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Pryctda'
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92721151163367330)
,p_name=>'FCHA_REAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_REAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Real'
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92721206023367331)
,p_name=>'DIAS_FALTANTES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_FALTANTES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Dias Faltantes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(92721377121367332)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Estdo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(92721405902367333)
,p_name=>'DSCRPCION_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(92721643393367335)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Slctud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(92721785648367336)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cdgo Clnte'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(92721847249367337)
,p_name=>'DIAS_VENCIDOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_VENCIDOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Dias Vencidos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(92721918218367338)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Instncia Fljo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(92722011826367339)
,p_name=>'OBSRVCION_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_api.id(92722687746367345)
,p_name=>'TPO_PRSNTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TPO_PRSNTCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Presentaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>20
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(92720147047367320)
,p_internal_uid=>92720147047367320
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(92746933769491967)
,p_interactive_grid_id=>wwv_flow_api.id(92720147047367320)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(92747096404491967)
,p_report_id=>wwv_flow_api.id(92746933769491967)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3541953030070)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(92722687746367345)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92747500304491969)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(92720261183367321)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92748028823491971)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(92720345042367322)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92748505720491973)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(92720475971367323)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>368
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92749036290491975)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(92720565624367324)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92749519388491977)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(92720657894367325)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>194
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92750027880491979)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(92720771972367326)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>233
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92750549763491981)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(92720864471367327)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92751097374491983)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(92720998273367328)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92751532123491985)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(92721077065367329)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92752022932491987)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(92721151163367330)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92752513013491989)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(92721206023367331)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92753012869491991)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(92721377121367332)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92753553777491993)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(92721405902367333)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92754086563491995)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(92721643393367335)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92754504664491996)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(92721785648367336)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92755023469491999)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(92721847249367337)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92755586355492001)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(92721918218367338)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92756023878492003)
,p_view_id=>wwv_flow_api.id(92747096404491967)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(92722011826367339)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73423276994963201)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(230222467879754199)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto',
'     , d.id_slctud',
'     , d.file_name ',
'     , d.obsrvcion     ',
'     , d.file_blob',
'     , md.dscrpcion_dcmnto  ',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P9_ID_SLCTUD ',
'        and md.actvo = ''S'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P9_ID_SLCTUD'
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
 p_id=>wwv_flow_api.id(157460709029873704)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>157460709029873704
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82695640250089514)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82696064009089517)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82696437853089519)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82696888916089519)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82697295669089519)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55438915392007001)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'File Blob'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(157474176315879971)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'826976'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FILE_NAME:ID_DCMNTO::FILE_BLOB'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74203170231940602)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(72792183397887606)
,p_button_name=>'BTN_INSERTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.id_slctud ',
'  from pq_g_solicitudes s',
' where s.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75304008788808401)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(72793294691887617)
,p_button_name=>'BTN_COPIAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Copiar Datos del Sujeto Pasivo'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-copy'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76901872700160203)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(72791954306887604)
,p_button_name=>'BTN_SCANNER'
,p_button_static_id=>'BTN_SCANNER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Escaner'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(119794586212745402)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(73043808647213106)
,p_button_name=>'BTN_CNSLTA_PRMTROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73239353736960838)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(72791954306887604)
,p_button_name=>'BTN_AGRGAR'
,p_button_static_id=>'BTN_AGRGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Cargar este Archivo?'',''BTN_AGRGAR'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73044598396213113)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(73043808647213106)
,p_button_name=>'BTN_VLDAR'
,p_button_static_id=>'BTN_VLDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>wwv_flow_api.id(71867586854951593)
,p_button_image_alt=>'Validar Sujeto'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_grid_column_attributes=>'style="margin-top:10px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73237445575960819)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(73043808647213106)
,p_button_name=>'BTN_DSCRGAR'
,p_button_static_id=>'BTN_DSCRGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-arrow-down'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76901952037160204)
,p_branch_name=>'Go To Page 906'
,p_branch_action=>'f?p=50000:906:&SESSION.::&DEBUG.:RP:P906_APP_PAGE_ID,P906_APP_ID:&APP_PAGE_ID.,&APP_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76901872700160203)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(87331692433882603)
,p_branch_name=>'Go To Page javascript:imprimirRprtesMltples(&P9_XML.);'
,p_branch_action=>'javascript:imprimirRprtesMltples(''&P9_XML.'');'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73237445575960819)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26318095118366205)
,p_branch_name=>'Go To Page 909'
,p_branch_action=>'f?p=50000:909:&SESSION.::&DEBUG.:RP,909:P909_APP_ID,P909_APP_PAGE_ID:&APP_ID.,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76901872700160203)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(119794731340745404)
,p_branch_name=>'Go To Page 3'
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP,3:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_VLDAR_CRTRA,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P9_ID_SJTO_IMPSTO,&P9_ID_IMPSTO.,N,&P9_ID_IMPSTO_SBMPSTO.,P9_ID_IMPSTO,P9_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(119794586212745402)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2672403724762602)
,p_name=>'P9_EXPDNTE_FSCLZCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_prompt=>unistr('Expediente de Fiscalizaci\00F3n')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select --a.nmro_expdnte ||'' - ''|| to_char(a.fcha_aprtra, ''DD/MM/YYYY'') as d,',
'       a.nmro_expdnte||'' - ''||f.dscrpcion||'' - ''||e.nmro_acto_dsplay as d,',
'       --a.nmro_expdnte as r ',
'       d.id_fsclzcion_expdnte_acto as r',
'from fi_g_fiscalizacion_expdnte a',
'join fi_g_candidatos b on b.id_cnddto = a.id_cnddto',
'join v_si_i_sujetos_impuesto c on c.id_sjto_impsto = b.id_sjto_impsto',
'join fi_g_fsclzcion_expdnte_acto d on d.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'join gn_g_actos e on e.id_acto = d.id_acto',
'join gn_d_actos_tipo f on f.id_acto_tpo = e.id_acto_tpo',
'where c.idntfccion_sjto = :P9_IDNTFCCION_SJTO',
'  and a.cdgo_expdnte_estdo = ''ABT''',
'  and f.cdgo_acto_tpo in (''ROO'', ''RE'')',
';'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Indica si el motivo requiere asociar un expediente de Fiscalizaci\00F3n.')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2690733013229201)
,p_name=>'P9_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3926137742848201)
,p_name=>'P9_NTFCA_EMIL'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>unistr('\00BFAutoriza notificaci\00F3n v\00EDa correo electr\00F3nico?')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:SI;S,NO;N'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>8
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_output=>'N'
,p_help_text=>unistr('Marcar si, si autoriza el ser notificado v\00EDa correo electr\00F3nico.')
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70351203693370703)
,p_name=>'P9_OBSRVCION_S'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_prompt=>unistr('Observaci\00F3n de la solicitud')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_colspan=>10
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70351474908370705)
,p_name=>'P9_VLDAR_TRBTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72791789534887602)
,p_name=>'P9_CDGO_RSPNSBLE_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>'Tipo Solicitante'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_rspnsble_tpo',
'     , cdgo_rspnsble_tpo ',
'  from df_s_responsables_tipo',
'  where cdgo_rspnsble_tpo not in (''R'',''CO'',''RF'',''RS'')'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione la relaci\00F3n del solicitante con el sujeto del tributo.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72792323982887608)
,p_name=>'P9_CDGO_IDNTFCCION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(72791689084887601)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de identificaci\00F3n presentada por el gestor de la solicitud.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72792400015887609)
,p_name=>'P9_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(72791689084887601)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Escriba el n\00FAmero de identificaci\00F3n de la persona que gestiona la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72792518842887610)
,p_name=>'P9_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(72791689084887601)
,p_prompt=>unistr('Primer Nombre o Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el primer nombre del gestor de la solicitud.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72792681649887611)
,p_name=>'P9_SGNDO_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(72791689084887601)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el segundo nombre del gestor de la solicitud.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72792886777887613)
,p_name=>'P9_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(72791689084887601)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el Primer Apellido del gestor de la solicitud.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72792932706887614)
,p_name=>'P9_SGNDO_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(72791689084887601)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el segundo apellido del gestor de la solicitud.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72793460472887619)
,p_name=>'P9_CDGO_IDNTFCCION_TPO_S'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>unistr('Tipo Identificaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de identificaci\00F3n presentada por el gestor de la solicitud.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72793571084887620)
,p_name=>'P9_IDNTFCCION_S'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>19
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n del solicitante.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72793669290887621)
,p_name=>'P9_PRMER_NMBRE_S'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_colspan=>5
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el primer nombre del solicitante.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72793776714887622)
,p_name=>'P9_SGNDO_NMBRE_S'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el segundo nombre del solicitante.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72793892781887623)
,p_name=>'P9_PRMER_APLLDO_S'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el primer apellido del solicitante.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72793909843887624)
,p_name=>'P9_SGNDO_APLLDO_S'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letra'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el segundo apellido del solicitante.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72794021695887625)
,p_name=>'P9_ID_PAIS_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>unistr('Pa\00EDs')
,p_source=>'&F_ID_PAIS_CLNTE.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el pa\00EDs de notificaci\00F3n donde se encuentra el solicitante')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72794198118887626)
,p_name=>'P9_ID_DPRTMNTO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dprtmnto',
'     , id_dprtmnto ',
'  from df_s_departamentos ',
' where id_pais = :P9_ID_PAIS_NTFCCION_S;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P9_ID_PAIS_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el departamento de notificaci\00F3n donde se encuentra el solicitante')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72794215553887627)
,p_name=>'P9_ID_MNCPIO_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio',
'     , id_mncpio ',
'  from df_s_municipios ',
' where id_dprtmnto = :P9_ID_DPRTMNTO_NTFCCION_S'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P9_ID_DPRTMNTO_NTFCCION_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el municipio de notificaci\00F3n donde se encuentra el solicitante.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72794334963887628)
,p_name=>'P9_DRCCION_NTFCCION_S'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la direcci\00F3n de notificaci\00F3n del solicitante')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72794475759887629)
,p_name=>'P9_EMAIL_S'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el correo electr\00F3nico del solicitante')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72794526333887630)
,p_name=>'P9_TLFNO_S'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>7
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de tel\00E9fono local del solicitante ')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72794601236887631)
,p_name=>'P9_CLLAR_S'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(72793294691887617)
,p_prompt=>'Celular'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>10
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de celular del solicitante')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73044096196213108)
,p_name=>'P9_ID_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_prompt=>'Tipo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tipo de PQR que corresponda.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73044188900213109)
,p_name=>'P9_ID_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
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
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo por el que se hace la solicitud.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73044271540213110)
,p_name=>'P9_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P9_ID_IMPSTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P9_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el Sub-tributo por el que se hace la solicitud.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73044330448213111)
,p_name=>'P9_IDNTFCCION_SJTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')"onkeyup="campoMayuscula(this)" '
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n del sujeto tributo y haga clic en el bot\00F3n validar sujeto.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73044486981213112)
,p_name=>'P9_ID_MTVO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_prompt=>'Motivo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and actvo      = ''S''',
'   and id_tpo    = :P9_ID_TPO ',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P9_ID_TPO'
,p_ajax_items_to_submit=>'P9_ID_TPO,P9_ID_MTVO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el motivo y valide en el bot\00F3n de descarga si el motivo tiene documentos requeridos.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73238667009960831)
,p_name=>'P9_ID_MTVO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(72791954306887604)
,p_prompt=>'Documentos'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_dcmnto',
'     , id_mtvo_dcmnto',
'  from v_pq_d_motivos_documento',
' where id_mtvo = :P9_ID_MTVO',
'       and actvo = ''S''',
'  ',
' '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P9_ID_MTVO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de documento que se requiere adjuntar para la solicitud.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73238999213960834)
,p_name=>'P9_FILE_BLOB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(72791954306887604)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Habilita ventana de b\00FAsqueda para ingresar el documento adjunto correspondiente.')
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73239132317960836)
,p_name=>'P9_OBSRVCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(72791954306887604)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>99
,p_cHeight=>2
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la observaci\00F3n correspondiente a la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73471441610618901)
,p_name=>'P9_ID_RDCDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(72791689084887601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74810974791107403)
,p_name=>'P9_ID_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76901612407160201)
,p_name=>'P9_OPCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(72791954306887604)
,p_item_default=>'F'
,p_prompt=>unistr('Opci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Explorador de Archivos;F,Escaner;E'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione una de las opciones para adjuntar el documento a la solicitud.'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82480431456989601)
,p_name=>'P9_JSON'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82480520154989602)
,p_name=>'P9_ID_PRSNTCION_TPO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_prompt=>unistr('Tipo de Presentaci\00F3n ')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,',
'       a.id_prsntcion_tpo ',
'  from pq_d_presentaciones_tipo a',
'  join pq_d_tipos_presentacion b',
'    on b.id_prsntcion_tpo = a.id_prsntcion_tpo',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.actvo = ''S''',
'   and b.id_tpo = :P9_ID_TPO',
'  order by a.id_prsntcion_tpo '))
,p_lov_cascade_parent_items=>'P9_ID_TPO'
,p_ajax_items_to_submit=>'P9_ID_PRSNTCION_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione la forma de presentaci\00F3n de la solicitud.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82480914331989606)
,p_name=>'P9_NMRO_FLIO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(72791954306887604)
,p_item_default=>'1'
,p_prompt=>unistr('N\00FAmero de Folios')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>10
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de documentos f\00EDsicos recibidos en la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87331559812882602)
,p_name=>'P9_XML'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119794446662745401)
,p_name=>'P9_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133081759522630801)
,p_name=>'P9_FCHA_RDCDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(73043808647213106)
,p_prompt=>'Fecha Radicado'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3308863789362502)
,p_computation_sequence=>10
,p_computation_item=>'P9_EXPDNTE_FSCLZCION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_expdnte||'' - ''||f.dscrpcion||'' - ''||e.nmro_acto_dsplay ',
'from fi_g_fiscalizacion_expdnte a',
'join fi_g_candidatos b on b.id_cnddto = a.id_cnddto',
'join v_si_i_sujetos_impuesto c on c.id_sjto_impsto = b.id_sjto_impsto',
'join fi_g_fsclzcion_expdnte_acto d on d.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte',
'join gn_g_actos e on e.id_acto = d.id_acto',
'join gn_d_actos_tipo f on f.id_acto_tpo = e.id_acto_tpo',
'where d.id_slctud_rqrmnto = :P9_ID_SLCTUD',
';',
'',
'        '))
,p_compute_when=>'P9_ID_SLCTUD'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70352067179370711)
,p_validation_name=>'validar impuesto'
,p_validation_sequence=>10
,p_validation=>'P9_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Tributo debe tener alg\00FAn valor.')
,p_validation_condition=>'P9_VLDAR_TRBTO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(73044188900213109)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70352329608370714)
,p_validation_name=>unistr('validar identificaci\00F3n')
,p_validation_sequence=>20
,p_validation=>'P9_IDNTFCCION_SJTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Identificaci\00F3n Sujeto debe tener alg\00FAn valor.')
,p_validation_condition=>'P9_VLDAR_TRBTO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(73044330448213111)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74397252427776101)
,p_validation_name=>'validar que el archivo no este vacio'
,p_validation_sequence=>30
,p_validation=>'P9_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un archivo'
,p_when_button_pressed=>wwv_flow_api.id(73239353736960838)
,p_associated_item=>wwv_flow_api.id(73238999213960834)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74646354697926201)
,p_validation_name=>'Documento no sea nulo'
,p_validation_sequence=>40
,p_validation=>'P9_ID_MTVO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un Documento'
,p_when_button_pressed=>wwv_flow_api.id(73239353736960838)
,p_associated_item=>wwv_flow_api.id(73238667009960831)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76902894989160213)
,p_validation_name=>'Documento no sea nulo escaner'
,p_validation_sequence=>50
,p_validation=>'P9_ID_MTVO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un Documento'
,p_when_button_pressed=>wwv_flow_api.id(76901872700160203)
,p_associated_item=>wwv_flow_api.id(73238667009960831)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(75066219187033501)
,p_validation_name=>'Validar Documentos Obligatorios'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select m.indcdor_oblgtrio     ',
'     from v_pq_d_motivos_documento m ',
'left join apex_collections c',
'       on id_mtvo_dcmnto = n001    ',
'      and collection_name = ''DOCUMENTOS''',
'    where id_mtvo = :P9_ID_MTVO',
'      and m.indcdor_oblgtrio = ''S''',
'      and m.actvo = ''S''',
'      and c.n001 is null;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Debe subir todos los documentos obligatorios'
,p_when_button_pressed=>wwv_flow_api.id(74203170231940602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(119565689819447901)
,p_validation_name=>unistr('validar direcci\00F3n de correo')
,p_validation_sequence=>70
,p_validation=>'regexp_like (:P9_EMAIL_S, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Direcci\00F3n de correo no valida')
,p_validation_condition=>'P9_EMAIL_S'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(72794475759887629)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(28807411833619201)
,p_validation_name=>'Validar Celular'
,p_validation_sequence=>80
,p_validation=>'return REGEXP_LIKE( :P9_CLLAR_S, ''^[3][0-9]{9}$'');'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Ingrese un n\00FAmero de celular v\00E1lido.')
,p_when_button_pressed=>wwv_flow_api.id(74203170231940602)
,p_associated_item=>wwv_flow_api.id(72794601236887631)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(28807506436619202)
,p_validation_name=>unistr('Validar Tel\00E9fono')
,p_validation_sequence=>90
,p_validation=>'return REGEXP_LIKE(:P9_TLFNO_S , ''^[1-9][0-9]{6}$'');'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Ingrese un n\00FAmero de tel\00E9fono v\00E1lido.')
,p_when_button_pressed=>wwv_flow_api.id(74203170231940602)
,p_associated_item=>wwv_flow_api.id(72794526333887630)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(70352241520370713)
,p_validation_name=>'validar sub tributos'
,p_validation_sequence=>100
,p_validation=>'P9_ID_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Sub-Tributo debe tener alg\00FAn valor.')
,p_validation_condition=>'P9_VLDAR_TRBTO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(73044271540213110)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73235868467960803)
,p_validation_name=>'validar_sujeto'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_sjto',
'   from v_si_i_sujetos_impuesto',
'  where cdgo_clnte      = :F_CDGO_CLNTE',
'    and idntfccion_sjto = :P9_IDNTFCCION_SJTO',
'    and id_impsto       = :P9_ID_IMPSTO'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('No existe sujeto con esta identificaci\00F3n')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vldar_sjto_impsto',
'  from pq_d_motivos',
' where id_mtvo = :P9_ID_MTVO',
'   and vldar_sjto_impsto = ''S'''))
,p_validation_condition_type=>'EXISTS'
,p_associated_item=>wwv_flow_api.id(73044330448213111)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73044622398213114)
,p_name=>'al cambiar el motivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_ID_MTVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73044728535213115)
,p_event_id=>wwv_flow_api.id(73044622398213114)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function validarMotivos() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("validar_motivo", {',
'            pageItems: "#P9_ID_MTVO"',
'        }).then(function (resp) {',
'            resp.valid ? apex.item(''BTN_VLDAR'').show() : apex.item(''BTN_VLDAR'').hide();',
'            resp.doc   ? apex.item(''BTN_DSCRGAR'').show() : apex.item(''BTN_DSCRGAR'').hide();',
'            resp.exp   ? apex.item(''P9_EXPDNTE_FSCLZCION'').show() : apex.item(''P9_EXPDNTE_FSCLZCION'').hide();',
'            //console.log(resp);',
'        });',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}',
'',
'validarMotivos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73239013967960835)
,p_event_id=>wwv_flow_api.id(73044622398213114)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(73236226219960807)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73235990490960804)
,p_name=>'validar_sujeto'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(73044598396213113)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73236014819960805)
,p_event_id=>wwv_flow_api.id(73235990490960804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process ("Validar_sujeto", {  ',
'  pageItems: "#P9_IDNTFCCION_SJTO,#P9_ID_IMPSTO"',
'  }).then(function(resp){',
'        apex.message.clearErrors();',
'        if (!resp.exists){',
'            var region = apex.region( "PQR_HISTORICOS" );',
'            region.refresh();',
'            apex.message.showErrors([',
'                { type:"error",',
'                  location:   [ "page", "inline" ],',
'                  pageItem:   "P9_IDNTFCCION_SJTO",',
unistr('                  message:    "No existe sujeto con esta identificaci\00F3n"'),
'                }]);',
'        }else{            ',
'            var region = apex.region( "PQR_HISTORICOS" );',
'            region.refresh();',
unistr('            apex.message.showPageSuccess(''\00A1Sujeto encontrado!'');'),
'        }        ',
'     }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73471555960618902)
,p_name=>'al cambiar la identificacion'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_IDNTFCCION,P9_CDGO_IDNTFCCION_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73471623538618903)
,p_event_id=>wwv_flow_api.id(73471555960618902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function BuscarRadicador() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("BuscarRadicador", {',
'            pageItems: "#P9_CDGO_IDNTFCCION_TPO,#P9_IDNTFCCION"',
'        }).then(function (resp) {',
'            Object.keys(resp).forEach((f) => {',
'                apex.item(''P9_'' + f).setValue(('''' + resp[f]).trim());',
'            });',
'        }',
'        );',
'',
'',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'BuscarRadicador();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73624125126943402)
,p_name=>unistr('al cambiar la identificaci\00F3n del solicitante')
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_IDNTFCCION_S,P9_CDGO_IDNTFCCION_TPO_S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73624289656943403)
,p_event_id=>wwv_flow_api.id(73624125126943402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function buscarSolicitante() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("BuscarSolicitante", {',
'            pageItems: "#P9_CDGO_IDNTFCCION_TPO_S,#P9_IDNTFCCION_S"',
'        }).then(function (resp) {',
'            console.log(resp);',
'            Object.keys(resp).forEach((f) => {',
'                apex.item(''P9_'' + f).setValue(('''' + resp[f]).trim());',
'            });',
'        });',
'',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'buscarSolicitante();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74541349733637206)
,p_name=>'Descargar documentos'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(73237445575960819)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74541476153637207)
,p_event_id=>wwv_flow_api.id(74541349733637206)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'imprimir();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(75304145244808402)
,p_name=>'al dar click en el boton copiar'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(75304008788808401)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75304217066808403)
,p_event_id=>wwv_flow_api.id(75304145244808402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var radicador = $(''#radicador :input'');',
'$.each(radicador, function(i,it){',
'    $(''#'' + $(it).attr(''id'') + ''_S'').val($(it).val());',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76902051739160205)
,p_name=>'Al cambiar la opcion de archivo'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_OPCION'
,p_condition_element=>'P9_OPCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76902157170160206)
,p_event_id=>wwv_flow_api.id(76902051739160205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76902300735160208)
,p_event_id=>wwv_flow_api.id(76902051739160205)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76902253620160207)
,p_event_id=>wwv_flow_api.id(76902051739160205)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(73239353736960838)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76902411803160209)
,p_event_id=>wwv_flow_api.id(76902051739160205)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(73239353736960838)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76902559583160210)
,p_event_id=>wwv_flow_api.id(76902051739160205)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(76901872700160203)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76902681015160211)
,p_event_id=>wwv_flow_api.id(76902051739160205)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(76901872700160203)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76985797013106601)
,p_name=>'al cerrar la ventana modal'
,p_event_sequence=>100
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76903101081160216)
,p_event_id=>wwv_flow_api.id(76985797013106601)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob         blob;',
'     v_seq          varchar2(4000);',
'     v_filename     varchar2(4000);',
'     v_mime_type    varchar2(4000);     ',
'     ',
'     ',
'begin',
'     delete muerto;commit;',
'    begin',
'        select blob001,',
'               c001,',
'               c002',
'          into v_blob,',
'               v_filename,',
'               v_mime_type',
'          from apex_collections',
'         where collection_name = ''SCANNER'';',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'   ',
'    insert into muerto (v_001, v_002) values (v_filename, v_mime_type);',
'    commit;',
'    ',
'    if v_blob is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') ) then',
'            apex_collection.create_collection( p_collection_name => ''DOCUMENTOS'');',
'        end if;',
'',
'        begin',
'            select seq_id',
'              into v_seq',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS''',
'               and n001 = :P9_ID_MTVO_DCMNTO;',
'            ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 => :P9_OBSRVCION',
'                                          , p_c002 => v_filename',
'                                          , p_c003 => v_mime_type',
'                                          , p_n001 => :P9_ID_MTVO_DCMNTO',
'                                          , p_blob001 => v_blob );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_c001 => :P9_OBSRVCION',
'                                          , p_c002 => v_filename',
'                                          , p_c003 => v_mime_type',
'                                          , p_n001 => :P9_ID_MTVO_DCMNTO',
'                                          , p_blob001 => v_blob );        ',
'        end;       ',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76985844002106602)
,p_event_id=>wwv_flow_api.id(76985797013106601)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(73236226219960807)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(82480698700989603)
,p_name=>unistr('al hacer clic en el bot\00F3n insertar ')
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74203170231940602)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82480750877989604)
,p_event_id=>wwv_flow_api.id(82480698700989603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = [];',
'json.push({''motivos'': $v(''P9_ID_MTVO''), ''sjtos'':[{''id_impsto'':$v(''P9_ID_IMPSTO''),''id_impsto_sbmpsto'':$v(''P9_ID_IMPSTO_SBMPSTO''), ''idntfccion'': $v(''P9_IDNTFCCION_SJTO'')}]});',
'',
'$s(''P9_JSON'', JSON.stringify(json));'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82480892026989605)
,p_event_id=>wwv_flow_api.id(82480698700989603)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'BTN_INSERTAR'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111542561371097601)
,p_name=>'cambioLabelIdentificacion'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111542638603097602)
,p_event_id=>wwv_flow_api.id(111542561371097601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process(',
'    "CB_AJAX",',
'    {',
'        pageItems: ''#P9_ID_IMPSTO''',
'    },',
'    {',
'        dataType:"text",',
'        async:true,',
'        success:function(pdata){',
'            console.log(pdata);',
'             $("#P9_IDNTFCCION_SJTO_LABEL").html(pdata); ',
'        }',
'    }',
');',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70351558652370706)
,p_name=>'al cambiar el tipo'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_ID_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70351692445370707)
,p_event_id=>wwv_flow_api.id(70351558652370706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select vldar_trbto',
'      into :P9_VLDAR_TRBTO',
'      from pq_d_tipos ',
'     where id_tpo = :P9_ID_TPO; ',
'exception',
'    when others then',
'        :P9_VLDAR_TRBTO := null;',
'end;'))
,p_attribute_02=>'P9_ID_TPO'
,p_attribute_03=>'P9_VLDAR_TRBTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70351774990370708)
,p_name=>'al cambiar validar tributo'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_VLDAR_TRBTO'
,p_condition_element=>'P9_VLDAR_TRBTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70351880699370709)
,p_event_id=>wwv_flow_api.id(70351774990370708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_ID_IMPSTO,P9_ID_IMPSTO_SBMPSTO,P9_IDNTFCCION_SJTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70351954779370710)
,p_event_id=>wwv_flow_api.id(70351774990370708)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_ID_IMPSTO,P9_ID_IMPSTO_SBMPSTO,P9_IDNTFCCION_SJTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(133081941888630803)
,p_name=>'al cambiar presentacion'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_ID_PRSNTCION_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133082013714630804)
,p_event_id=>wwv_flow_api.id(133081941888630803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function validarPresentacion() {',
'    console.log(''INICIA PRESESNTACION'');',
'    let $waitPopup = apex.widget.waitPopup();',
'    ',
'    console.log(''TIPO PRESESNTACION_A:''+ $v(''P9_ID_PRSNTCION_TPO'') );',
'    console.log(''TIPO PRESESNTACION_B:''+ apex.item("P9_ID_PRSNTCION_TPO").getValue() ); ',
'	',
'	if ($v(''P9_ID_PRSNTCION_TPO'') == 4 ){',
'		apex.item(''P9_FCHA_RDCDO'').show();     ',
'	}else{',
'		apex.item(''P9_FCHA_RDCDO'').hide();',
'	}',
'    $waitPopup.remove();',
'}',
'',
'validarPresentacion();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133082138023630805)
,p_event_id=>wwv_flow_api.id(133081941888630803)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(73236226219960807)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75361776497030901)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar Datos de la coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'if apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') then ',
'    apex_collection.delete_collection( p_collection_name => ''DOCUMENTOS'');            ',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'PAGELOAD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73239426291960839)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Agregar_archivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_blob blob;',
'     v_seq  varchar2(4000);',
'     r_temp_files apex_application_temp_files%rowtype;',
'begin',
'    begin',
'        select *',
'          into r_temp_files',
'          from apex_application_temp_files',
'         where name = :P9_FILE_BLOB;',
'    exception ',
'        when no_data_found then',
'            v_blob := null;  ',
'    end;',
'    ',
'    if r_temp_files.filename is not null then',
'    ',
'        if (not apex_collection.collection_exists(p_collection_name => ''DOCUMENTOS'') ) then',
'            apex_collection.create_collection( p_collection_name => ''DOCUMENTOS'');',
'        end if;',
'',
'        begin',
'            select seq_id',
'              into v_seq',
'              from apex_collections',
'             where collection_name = ''DOCUMENTOS''',
'               and n001 = :P9_ID_MTVO_DCMNTO;',
'            ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 => :P9_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P9_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_c001 => :P9_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P9_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        end;       ',
'    end if;',
'end;'))
,p_process_error_message=>'No se encontro archivo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(73239353736960838)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74203052673940601)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrar_solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    pkg_pq_pqr.prc_rg_solicitud_pqr(  p_id_tpo      			  => :P9_ID_TPO 				',
'                                    , p_id_usrio                  => :F_ID_USRIO',
'                                    , p_id_prsntcion_tpo          => :P9_ID_PRSNTCION_TPO',
'                                    , p_cdgo_clnte                => :F_CDGO_CLNTE',
'                                    , p_id_instncia_fljo          => :F_ID_INSTNCIA_FLJO    ',
'                                    , p_nmro_flio                 => :P9_NMRO_FLIO',
'                                    , p_id_rdcdor                 => :P9_ID_RDCDOR               ',
'                                    , p_cdgo_rspnsble_tpo         => :P9_CDGO_RSPNSBLE_TPO       ',
'                                    , p_cdgo_idntfccion_tpo       => :P9_CDGO_IDNTFCCION_TPO     ',
'                                    , p_idntfccion                => :P9_IDNTFCCION              ',
'                                    , p_prmer_nmbre               => :P9_PRMER_NMBRE             ',
'                                    , p_sgndo_nmbre               => :P9_SGNDO_NMBRE             ',
'                                    , p_prmer_aplldo              => :P9_PRMER_APLLDO            ',
'                                    , p_sgndo_aplldo              => :P9_SGNDO_APLLDO            ',
'                                    , p_cdgo_idntfccion_tpo_s     => :P9_CDGO_IDNTFCCION_TPO_S   ',
'                                    , p_idntfccion_s              => :P9_IDNTFCCION_S            ',
'                                    , p_prmer_nmbre_s             => :P9_PRMER_NMBRE_S           ',
'                                    , p_sgndo_nmbre_s             => :P9_SGNDO_NMBRE_S           ',
'                                    , p_prmer_aplldo_s            => :P9_PRMER_APLLDO_S          ',
'                                    , p_sgndo_aplldo_s            => :P9_SGNDO_APLLDO_S          ',
'                                    , p_id_pais_ntfccion          => :P9_ID_PAIS_NTFCCION_S       ',
'                                    , p_id_dprtmnto_ntfccion      => :P9_ID_DPRTMNTO_NTFCCION_S    ',
'                                    , p_id_mncpio_ntfccion        => :P9_ID_MNCPIO_NTFCCION_S',
'                                    , p_drccion_ntfccion          => :P9_DRCCION_NTFCCION_S',
'                                    , p_email                     => :P9_EMAIL_S',
'                                    , p_tlfno                     => :P9_TLFNO_S',
'                                    , p_cllar                     => :P9_CLLAR_S                               ',
'                                    , p_id_motivo                 => :P9_ID_MTVO',
'                                    , p_idntfccion_sjto           => :P9_IDNTFCCION_SJTO  ',
'                                    , p_id_impsto                 => :P9_ID_IMPSTO ',
'                                    , p_id_impsto_sbmpsto         => :P9_ID_IMPSTO_SBMPSTO',
'                                    , p_obsrvcion                 => :P9_OBSRVCION_S',
'                                    , p_fcha_rdcdo                => :P9_FCHA_RDCDO -- req. 0023223',
'                                    , p_ntfca_emil                => :P9_NTFCA_EMIL',
'                                    , o_cdgo_rspsta               => v_cdgo_rspsta',
'                                    , o_mnsje_rspsta              => v_mnsje_rspsta);',
'',
'    if(v_cdgo_rspsta != 0) then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(74203170231940602)
,p_process_success_message=>unistr('\00A1Solicitud Registrada de Forma Exitosa!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87331476796882601)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Construccion_xml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P9_XML := '''';',
'    for c_xml in (select id_rprte',
'                    from v_pq_d_motivos_documento',
'                   where id_mtvo = :P9_ID_MTVO',
'                     and id_rprte is not null ',
'                 )',
'    loop',
'        :P9_XML := :P9_XML || ''<data><id_rprte>''|| c_xml.id_rprte || ''</id_rprte><xml><id_impsto>''|| :P9_ID_IMPSTO || ''</id_impsto><id_impsto_sbmpsto>'' || :P9_ID_IMPSTO_SBMPSTO || ''</id_impsto_sbmpsto></xml></data>'';',
'    end loop;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(73237445575960819)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74810836004107402)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_tpo',
'         , id_mtvo',
'         , id_impsto',
'         , id_impsto_sbmpsto',
'         , idntfccion',
'         , id_rdcdor',
'         , id_slctud',
'         , id_prsntcion_tpo',
'         , fcha_rdcdo',
'         , nmro_rdcdo_dsplay',
'      into :P9_ID_TPO',
'         , :P9_ID_MTVO',
'         , :P9_ID_IMPSTO',
'         , :P9_ID_IMPSTO_SBMPSTO',
'         , :P9_IDNTFCCION_SJTO',
'         , :P9_ID_RDCDOR',
'         , :P9_ID_SLCTUD',
'         , :P9_ID_PRSNTCION_TPO',
'         , :P9_FCHA_RDCDO',
'         , :P9_NMRO_RDCDO_DSPLAY',
'      from v_pq_g_solicitudes',
'      where id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'exception',
'    when others then',
'        null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_tpo ',
'  from v_pq_g_solicitudes',
'  where id_instncia_fljo = :F_ID_INSTNCIA_FLJO'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74811014594107404)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Radicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select cdgo_idntfccion_tpo',
'         , idntfccion ',
'         , prmer_nmbre ',
'         , sgndo_nmbre ',
'         , prmer_aplldo ',
'         , sgndo_aplldo',
'      into :P9_CDGO_IDNTFCCION_TPO',
'         , :P9_IDNTFCCION',
'         , :P9_PRMER_NMBRE',
'         , :P9_SGNDO_NMBRE',
'         , :P9_PRMER_APLLDO',
'         , :P9_SGNDO_APLLDO',
'      from pq_g_radicador',
'     where id_rdcdor = :P9_ID_RDCDOR;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_rdcdor ',
'  from pq_g_radicador',
' where id_rdcdor = :P9_ID_RDCDOR'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74811191534107405)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Solicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select cdgo_rspnsble_tpo',
'         , cdgo_idntfccion_tpo ',
'         , idntfccion ',
'         , prmer_nmbre ',
'         , sgndo_nmbre ',
'         , prmer_aplldo ',
'         , sgndo_aplldo ',
'         , id_pais_ntfccion ',
'         , id_dprtmnto_ntfccion ',
'         , id_mncpio_ntfccion ',
'         , drccion_ntfccion ',
'         , email ',
'         , tlfno ',
'         , cllar',
'         , ntfca_emil',
'      into :P9_CDGO_RSPNSBLE_TPO ',
'         , :P9_CDGO_IDNTFCCION_TPO_S ',
'         , :P9_IDNTFCCION_S',
'         , :P9_PRMER_NMBRE_S',
'         , :P9_SGNDO_NMBRE_S ',
'         , :P9_PRMER_APLLDO_S',
'         , :P9_SGNDO_APLLDO_S',
'         , :P9_ID_PAIS_NTFCCION_S',
'         , :P9_ID_DPRTMNTO_NTFCCION_S',
'         , :P9_ID_MNCPIO_NTFCCION_S',
'         , :P9_DRCCION_NTFCCION_S',
'         , :P9_EMAIL_S',
'         , :P9_TLFNO_S',
'         , :P9_CLLAR_S',
'         , :P9_NTFCA_EMIL',
'      from pq_g_solicitantes',
'     where id_slctud = :P9_ID_SLCTUD;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select cdgo_idntfccion_tpo ',
'  from pq_g_solicitantes',
' where id_slctud = :P9_ID_SLCTUD'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(119794602603745403)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select idntfccion_sjto',
'          , id_impsto',
'       into :P9_IDNTFCCION_SJTO ',
'          , :P9_ID_IMPSTO',
'       from v_si_i_sujetos_impuesto',
'      where cdgo_clnte      = :F_CDGO_CLNTE',
'        and id_sjto_impsto  = :P9_ID_SJTO_IMPSTO;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P9_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70374806088158501)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('cargar observaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select obsrvcion ',
'      into :P9_OBSRVCION_S ',
'      from pq_g_solicitudes_obsrvcion ',
'     where id_slctud = :P9_ID_SLCTUD',
'     order by id_slctd_obsrvcion ',
'     fetch first 1 rows only;',
'exception',
'    when others then ',
'        :P9_OBSRVCION_S := null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select obsrvcion  ',
'  from pq_g_solicitudes_obsrvcion ',
' where id_slctud = :P9_ID_SLCTUD'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2684510907006801)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Asociar PQR al expediente de Fiscalizaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_mnsje_rspsta    varchar2(100);',
'begin',
'    begin',
'        update fi_g_fsclzcion_expdnte_acto a',
'        set a.id_slctud_rqrmnto = :P9_ID_SLCTUD',
'          , a.nmro_rdcdo_dsplay_rq = :P9_NMRO_RDCDO_DSPLAY',
'        where a.id_fsclzcion_expdnte_acto = :P9_EXPDNTE_FSCLZCION;',
'    exception',
'        when others then',
'            v_mnsje_rspsta := ''Error al asociar solicitud al acto del requerimiento.'';',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'(:P9_EXPDNTE_FSCLZCION is not null and :P9_ID_SLCTUD is not null)'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73044840876213116)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validar_motivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_vldar_sjto_impsto pq_d_motivos.vldar_sjto_impsto%type;',
'    v_count number;',
'    v_exp_fisca         varchar2(1);',
'begin ',
'    begin       ',
'        select vldar_sjto_impsto',
'          into v_vldar_sjto_impsto',
'          from pq_d_motivos',
'         where id_mtvo = :P9_ID_MTVO',
'           and vldar_sjto_impsto = ''S'';',
'    exception ',
'        when others then',
'            v_vldar_sjto_impsto := null;',
'    end;         ',
'    ',
'    begin                ',
'        select count(1)',
'          into v_count',
'          from pq_d_motivos_documento ',
'         where id_mtvo = :P9_ID_MTVO',
'           and id_rprte is not null;',
'    exception',
'        when others then',
'            v_count := 0;',
'    end;',
'    ',
'    begin       ',
'        select vldar_expdnt_fsca',
'          into v_exp_fisca',
'          from pq_d_motivos',
'         where id_mtvo = :P9_ID_MTVO',
'           and vldar_expdnt_fsca = ''S'';',
'    exception ',
'        when others then',
'            v_exp_fisca := null;',
'    end;  ',
'          apex_json.open_object;',
'          apex_json.write(''valid'', v_vldar_sjto_impsto is not null);',
'          apex_json.write(''doc''  , v_count > 0);',
'          apex_json.write(''exp'', v_exp_fisca is not null);',
'          apex_json.close_object;',
'',
'exception',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''ERROR'', true);',
'        apex_json.write(''MSG''  , apex_escape.html(sqlerrm));',
'        apex_json.write(''valid'', false); ',
'        apex_json.write(''doc''  , false);',
'        apex_json.write(''exp''  , false); ',
'        apex_json.close_object;   ',
'end;',
'   ',
'    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73235685341960801)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar_sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_sjto_impsto v_si_i_sujetos_impuesto.id_sjto_impsto%type;',
'begin ',
'   ',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte      = :F_CDGO_CLNTE',
'       and idntfccion_sjto = :P9_IDNTFCCION_SJTO',
'       and id_impsto       = :P9_ID_IMPSTO;',
'   ',
'          apex_json.open_object;',
'          apex_json.write(''exists'', true); ',
'          apex_json.write(''id_sjto_impsto'', v_id_sjto_impsto); ',
'          ',
'          apex_json.close_object;',
'    exception ',
'        when too_many_rows then',
'            apex_json.open_object;',
'            apex_json.write(''exists'', true); ',
'            apex_json.close_object;',
'        when others then ',
'            apex_json.open_object;',
'            apex_json.write(''ERROR'', true);',
'            apex_json.write(''MSG''  , apex_escape.html(sqlerrm));',
'            apex_json.write(''exists'', false); ',
'            apex_json.close_object;',
'end;',
'   '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73471784733618904)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BuscarRadicador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_prmer_nmbre   pq_g_radicador.prmer_nmbre%type;',
'    v_sgndo_nmbre   pq_g_radicador.sgndo_nmbre%type;',
'    v_prmer_aplldo  pq_g_radicador.prmer_aplldo%type;',
'    v_sgndo_aplldo  pq_g_radicador.sgndo_aplldo%type; ',
'    v_id_rdcdor     pq_g_radicador.id_rdcdor%type;',
'begin',
'    select id_rdcdor,',
'           prmer_nmbre,',
'           sgndo_nmbre,',
'           prmer_aplldo,',
'           sgndo_aplldo',
'      into v_id_rdcdor,',
'           v_prmer_nmbre,',
'           v_sgndo_nmbre,',
'           v_prmer_aplldo,',
'           v_sgndo_aplldo',
'      from pq_g_radicador ',
'     where idntfccion          = :P9_IDNTFCCION ',
'       and cdgo_idntfccion_tpo = :P9_CDGO_IDNTFCCION_TPO;',
'   ',
'        apex_json.open_object; ',
'        apex_json.write(''ID_RDCDOR'', v_id_rdcdor);',
'        apex_json.write(''PRMER_NMBRE'', v_prmer_nmbre);',
'        apex_json.write(''SGNDO_NMBRE'', v_sgndo_nmbre);',
'        apex_json.write(''PRMER_APLLDO'', v_prmer_aplldo);',
'        apex_json.write(''SGNDO_APLLDO'', v_sgndo_aplldo);',
'        apex_json.close_all;',
'       ',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''PRMER_NMBRE'', '' '');',
'        apex_json.write(''SGNDO_NMBRE'', '' '');',
'        apex_json.write(''PRMER_APLLDO'', '' '');',
'        apex_json.write(''SGNDO_APLLDO'', '' '');',
'        apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73624015058943401)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BuscarSolicitante'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'   ',
'    declare',
'    v_prmer_nmbre   si_c_terceros.prmer_nmbre%type;',
'    v_sgndo_nmbre   si_c_terceros.sgndo_nmbre%type;',
'    v_prmer_aplldo  si_c_terceros.prmer_aplldo%type;',
'    v_sgndo_aplldo  si_c_terceros.sgndo_aplldo%type;',
'    v_id_pais       si_c_terceros.id_pais%type;',
'    v_id_dprtmnto   si_c_terceros.id_dprtmnto%type;',
'    v_id_mncpio     si_c_terceros.id_mncpio%type;',
'    v_drccion       si_c_terceros.drccion%type;',
'    v_email         si_c_terceros.email%type;',
'    v_tlfno         si_c_terceros.tlfno%type;',
'',
'begin',
'    select prmer_nmbre,',
'           sgndo_nmbre,',
'           prmer_aplldo,',
'           sgndo_aplldo,',
'           id_pais,',
'           id_dprtmnto,',
'           id_mncpio,',
'           drccion,',
'           email,',
'           tlfno',
'      into v_prmer_nmbre,',
'           v_sgndo_nmbre,',
'           v_prmer_aplldo,',
'           v_sgndo_aplldo,',
'           v_id_pais,',
'           v_id_dprtmnto,',
'           v_id_mncpio,',
'           v_drccion,',
'           v_email,',
'           v_tlfno',
'      from si_c_terceros ',
'     where idntfccion          = :P9_IDNTFCCION_S',
'       and cdgo_idntfccion_tpo = :P9_CDGO_IDNTFCCION_TPO_S',
'       and cdgo_clnte = :F_CDGO_CLNTE;',
'        ',
'        apex_json.open_object; ',
'        apex_json.write(''PRMER_NMBRE_S'', v_prmer_nmbre);',
'        apex_json.write(''SGNDO_NMBRE_S'', v_sgndo_nmbre);',
'        apex_json.write(''PRMER_APLLDO_S'', v_prmer_aplldo);',
'        apex_json.write(''SGNDO_APLLDO_S'', v_sgndo_aplldo);',
'        apex_json.write(''ID_PAIS_NTFCCION_S'', v_id_pais);',
'        apex_json.write(''ID_DPRTMNTO_NTFCCION_S'', v_id_dprtmnto);',
'        apex_json.write(''ID_MNCPIO_NTFCCION_S'', v_id_mncpio);',
'        apex_json.write(''DRCCION_NTFCCION_S'', v_drccion);',
'        apex_json.write(''EMAIL_S'', v_email);',
'        apex_json.write(''TLFNO_S'', v_tlfno);',
'        apex_json.close_all;',
'       ',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''PRMER_NMBRE_S'', '' '');',
'        apex_json.write(''SGNDO_NMBRE_S'', '' '');',
'        apex_json.write(''PRMER_APLLDO_S'', '' '');',
'        apex_json.write(''SGNDO_APLLDO_S'', '' '');',
'        apex_json.write(''ID_PAIS_NTFCCION_S'', '' '');',
'        apex_json.write(''ID_DPRTMNTO_NTFCCION_S'', '' '');',
'        apex_json.write(''ID_MNCPIO_NTFCCION_S'', '' '');',
'        apex_json.write(''DRCCION_NTFCCION_S'', '' '');',
'        apex_json.write(''EMAIL_S'', '' '');',
'        apex_json.write(''TLFNO_S'', '' '');',
'        apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111542724537097603)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CB_AJAX'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    texto_return varchar2(100);',
'begin',
'    select b.txto_idntfccion',
'    into texto_return',
'    from v_DF_C_IMPUESTOS a',
'    join DF_S_SUJETOS_TIPO b',
'    on a.cdgo_sjto_tpo = b.cdgo_sjto_tpo where a.id_impsto = :P9_ID_IMPSTO;',
'    ',
'    htp.prn(texto_return);',
'exception when no_data_found then',
'    htp.prn(''Identificacion'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
