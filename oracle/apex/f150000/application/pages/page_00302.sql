prompt --application/pages/page_00302
begin
wwv_flow_api.create_page(
 p_id=>302
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Solicitud'
,p_step_title=>'Solicitud'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function registro() {',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = 301,',
'        v_session = $v(''pInstance'');',
'    if ($v(''P302_ID_SLCTUD'')) {',
'        var rs = await apex.server.process(''URL_WORKFLOW'', { pageItems: ''#P302_ID_SLCTUD'' });',
'        if (rs.url.includes(`f?p=${v_app_id}`)) {',
'            window.location.href = rs.url;',
'        } else {',
unistr('            apex.message.alert(`\00A1Solicitud registrada de forma exitosa!.`, function () {'),
'                window.location.href = `f?p=${v_app_id}:${v_page_id}:${v_session}::NO:RP:::`;',
'            });',
'        }',
'    }',
'}',
'',
'const eliminarRegistroCol = function(pId) {',
'    apex.server.process("Eliminar_Documento", {',
'       x01: pId',
'    }).then((resp) => {',
'        if(resp.o_cdgo_rspsta > 0){',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'                {',
'                    type: "error",',
'                    location: [',
'                        "page"',
'                    ],',
'                    message: resp.o_mnsje_rspsta,',
'                    unsafe: false',
'                }',
'            ]);',
'        }else{',
unistr('            apex.message.alert(`\00A1Documento eliminado de forma exitosa!.`, function () {'),
'                var region = apex.region( "REGION_DOCUMENTOS" );',
'                region.refresh();   ',
'            });                       ',
'        }',
'    })',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'    registro();',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#BTN_VLDAR {',
'    padding: 0.3rem !important;',
'}',
'',
'.apex-item-file-dropzone-label{',
'    border-radius: 4px 0px 0px 4px',
'}',
'',
'.apex-item-file-dropzone-icon{',
'       border-radius:0px 4px 4px 0px ',
'}',
'',
'.a-IRR-reportSummaryContainer {',
' display: none; ',
'}',
'',
'.a-IG-controlsContainer {',
'    display: none;',
'}',
'',
'.mensaje{',
'    /*background: #f0f0f0; */',
'    /*padding: 10px; border: 1px solid #dedede; */',
'    margin: 0 auto; ',
'    border-radius: 4px; ',
'    /*width: 60%; */',
'    color: #0004e3;'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250721213357'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(216256074679881995)
,p_plug_name=>'Registrar PQR'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(216256222501881996)
,p_plug_name=>'Documentos'
,p_region_name=>'REGION_DOCUMENTOS'
,p_parent_plug_id=>wwv_flow_api.id(216256074679881995)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(216508076842207498)
,p_plug_name=>'Datos Solicitud'
,p_region_name=>'DATOS_SOLICITUD'
,p_parent_plug_id=>wwv_flow_api.id(216256074679881995)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(216700494414955199)
,p_plug_name=>'Documentos Sugeridos'
,p_region_name=>'REGION_DOCUMENTOS'
,p_parent_plug_id=>wwv_flow_api.id(216256074679881995)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select seq_id',
'        , id_mtvo_dcmnto',
'        , dscrpcion_dcmnto',
'        , blob001 file_blob',
'        , c002 file_name',
'        , c001 obsrvcion,',
'        case',
'            when dbms_lob.getlength(blob001) > 0 then ''Cargado''',
'            else  ''Pendiente''',
'        end Estado',
'        , m.dscrpcion_indcdor_oblgtrio',
'        , 1 Agregar_Documento',
'        , case when c002 is not null then ',
'            ''<center><span class="fa fa-file-x fa-1x fa-spin" style="color: red;" ></span></center>''',
'          else',
'          null',
'         end as Eliminar_Documento',
'     from v_pq_d_motivos_documento m',
'left join apex_collections c',
'       on id_mtvo_dcmnto = n001    ',
'      and collection_name = ''DOCUMENTOS''',
'    where id_mtvo = :P302_ID_MTVO',
'     and m.actvo =''S'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P302_ID_MTVO'
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
 p_id=>wwv_flow_api.id(216702353127955217)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>216702353127955217
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5238249169988721)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'M'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_static_id=>'ID_COLECCION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71813433383925254)
,p_db_column_name=>'ID_MTVO_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Id Mtvo Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71813886199925257)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71814261570925257)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>40
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
 p_id=>wwv_flow_api.id(71814697640925258)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71815016410925258)
,p_db_column_name=>'ESTADO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71815407388925259)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71815843126925259)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>unistr('\00BFObligatorio?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5084975460407304)
,p_db_column_name=>'AGREGAR_DOCUMENTO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Agregar <br>Documento'
,p_column_link=>'f?p=&APP_ID.:303:&SESSION.::&DEBUG.:RP,303:P303_ID_MTVO_DCMNTO:#ID_MTVO_DCMNTO#'
,p_column_linktext=>'<center><span class="fa fa-file-arrow-up fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5238147588988720)
,p_db_column_name=>'ELIMINAR_DOCUMENTO'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Eliminar <br>Documento'
,p_column_link=>'f?p=&APP_ID.:303:&SESSION.::&DEBUG.:RP:P303_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'#ELIMINAR_DOCUMENTO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(216806001548248006)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'718162'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:ESTADO:FILE_NAME:DSCRPCION_INDCDOR_OBLGTRIO:AGREGAR_DOCUMENTO:ELIMINAR_DOCUMENTO:'
,p_sort_column_1=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(5621052491652268)
,p_report_id=>wwv_flow_api.id(216806001548248006)
,p_name=>'Cargado'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ESTADO'
,p_operator=>'='
,p_expr=>'Cargado'
,p_condition_sql=>' (case when ("ESTADO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Cargado''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#D9FFD9'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(373686736074748591)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(216256074679881995)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>60
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
'    where id_slctud = :P302_ID_SLCTUD ',
'        and md.actvo = ''S'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P302_ID_SLCTUD'
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
 p_id=>wwv_flow_api.id(300924977224868096)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>300924977224868096
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71827489477925294)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71827833422925294)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71828261111925294)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71828641008925295)
,p_db_column_name=>'ID_SLCTUD'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Id Slctud'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71829044255925295)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71827023271925291)
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
 p_id=>wwv_flow_api.id(300938444510874363)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'718294'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_DCMNTO:OBSRVCION:FILE_NAME:ID_DCMNTO::FILE_BLOB'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71808718049925223)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(216256222501881996)
,p_button_name=>'BTN_AGRGAR'
,p_button_static_id=>'BTN_AGRGAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Agregar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Cargar este Archivo?'',''BTN_AGRGAR'')'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
,p_grid_column_attributes=>'style="margin-top:3rem;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71818296571925265)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(216508076842207498)
,p_button_name=>'BTN_VLDAR'
,p_button_static_id=>'BTN_VLDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Validar Sujeto'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_grid_column_attributes=>'style="margin-top:4rem"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5113255287571216)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(216508076842207498)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>unistr('Consulta x Par\00E1metros ')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:304:&SESSION.::&DEBUG.:RP,304:P304_ID_IMPSTO,P304_ID_IMPSTO_SBMPSTO:&P302_ID_IMPSTO.,&P302_ID_IMPSTO_SBMPSTO.'
,p_icon_css_classes=>'fa-server-search'
,p_grid_column_attributes=>'style="margin-top:4rem"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71809114673925225)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(216256074679881995)
,p_button_name=>'BTN_INSERTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Registrar Solicitud'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.id_slctud ',
'  from pq_g_solicitudes s',
' where s.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71818651297925266)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(216508076842207498)
,p_button_name=>'BTN_DSCRGAR'
,p_button_static_id=>'BTN_DSCRGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-arrow-down'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5111744696571201)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(216508076842207498)
,p_button_name=>'BTN_SGNTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72096545990408737)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(216508076842207498)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP,301::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5088756337407342)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(216700494414955199)
,p_button_name=>'BTN_REGRESAR_DOCUMENTOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(71854030993925411)
,p_branch_name=>'Go To Page 906'
,p_branch_action=>'f?p=50000:906:&SESSION.::&DEBUG.:RP:P906_APP_PAGE_ID,P906_APP_ID:&APP_PAGE_ID.,&APP_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76901872700160203)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(71854416721925418)
,p_branch_name=>'Go To Page javascript:imprimirRprtesMltples(&P9_XML.);'
,p_branch_action=>'javascript:imprimirRprtesMltples(''&P9_XML.'');'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(71818651297925266)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5113899365571222)
,p_name=>'P302_MENSAJE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_item_default=>unistr('Se\00F1or contribuyente, si desea realizar una consulta por diferentes par\00E1metros, puede hacerlo dirigi\00E9ndose al bot\00F3n "Consultar x par\00E1metros" y dar Click sobre el.')
,p_prompt=>'<b></b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_css_classes=>'mensaje'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71809534499925225)
,p_name=>'P302_ID_MTVO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(216256222501881996)
,p_prompt=>'Documentos'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_dcmnto',
'     , id_mtvo_dcmnto',
'  from v_pq_d_motivos_documento',
' where id_mtvo = :P302_ID_MTVO',
'       and actvo = ''S''',
'  ',
' '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P302_ID_MTVO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tipo de documento que se requiere adjuntar para la solicitud.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71810499809925227)
,p_name=>'P302_FILE_BLOB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(216256222501881996)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_help_text=>unistr('Habilita ventana de b\00FAsqueda para ingresar el documento adjunto correspondiente.')
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71811343919925232)
,p_name=>'P302_OBSRVCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(216256222501881996)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>99
,p_cHeight=>2
,p_colspan=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_help_text=>unistr('Ingrese la observaci\00F3n correspondiente a la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71812257199925244)
,p_name=>'P302_NMRO_FLIO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(216256222501881996)
,p_item_default=>'1'
,p_prompt=>unistr('N\00FAmero de Folios')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>10
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_help_text=>unistr('Ingrese el n\00FAmero de documentos f\00EDsicos recibidos en la solicitud.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71819051119925274)
,p_name=>'P302_ID_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71819453976925275)
,p_name=>'P302_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71819799268925283)
,p_name=>'P302_ID_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Seleccione el tipo de PQR que corresponda.'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71820643255925283)
,p_name=>'P302_ID_PRSNTCION_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Seleccione la forma de presentaci\00F3n de la solicitud.')
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71821596889925284)
,p_name=>'P302_ID_MTVO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_prompt=>'Motivo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_mtvo ',
'  from pq_d_motivos',
' where cdgo_clnte    = :F_CDGO_CLNTE',
'   and actvo         = ''S''',
'   --and id_tpo        = :P302_ID_TPO',
'   and indcdor_prtal = ''S''',
'   order by dscrpcion'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione el motivo y valide en el bot\00F3n de descarga si el motivo tiene documentos requeridos.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71822455898925286)
,p_name=>'P302_ID_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
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
,p_colspan=>3
,p_grid_column=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo por el que se hace la solicitud.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71824266330925289)
,p_name=>'P302_IDNTFCCION_SJTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_help_text=>unistr('Ingrese el n\00FAmero de identificaci\00F3n del sujeto tributo y haga clic en el bot\00F3n validar sujeto.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71825187073925290)
,p_name=>'P302_JSON'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71825596683925290)
,p_name=>'P302_XML'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71825975571925291)
,p_name=>'P302_OBSRVCION_S'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_prompt=>unistr('Descripci\00F3n de la solicitud')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_colspan=>9
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71826317044925291)
,p_name=>'P302_VLDAR_TRBTO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74241324593899601)
,p_name=>'P302_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(216508076842207498)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(a.nmbre_impsto_sbmpsto)  as d,',
'       a.id_impsto_sbmpsto as r,',
'       b.nmbre_impsto',
'  from df_i_impuestos_subimpuesto    a',
'  join df_c_impuestos                b on a.id_impsto = b.id_impsto',
'   and a.actvo                       = ''S''',
' where a.cdgo_clnte                  = :F_CDGO_CLNTE ',
'   and b.actvo                       = ''S''',
' order by b.nmbre_impsto, a.nmbre_impsto_sbmpsto'))
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione el Sub-tributo por el que se hace la solicitud.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(71829940498925300)
,p_validation_name=>'validar impuesto'
,p_validation_sequence=>10
,p_validation=>'P302_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Tributo debe tener alg\00FAn valor.')
,p_validation_condition=>'P302_VLDAR_TRBTO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(71822455898925286)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(71830710096925303)
,p_validation_name=>unistr('validar identificaci\00F3n')
,p_validation_sequence=>20
,p_validation=>'P302_IDNTFCCION_SJTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Identificaci\00F3n Sujeto debe tener alg\00FAn valor.')
,p_validation_condition=>'P302_VLDAR_TRBTO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(71824266330925289)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(71831574251925304)
,p_validation_name=>'validar que el archivo no este vacio'
,p_validation_sequence=>30
,p_validation=>'P302_FILE_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un archivo'
,p_when_button_pressed=>wwv_flow_api.id(71808718049925223)
,p_associated_item=>wwv_flow_api.id(71810499809925227)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(71831933893925304)
,p_validation_name=>'Documento no sea nulo'
,p_validation_sequence=>40
,p_validation=>'P302_ID_MTVO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un Documento'
,p_when_button_pressed=>wwv_flow_api.id(71808718049925223)
,p_associated_item=>wwv_flow_api.id(71809534499925225)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(71832769989925304)
,p_validation_name=>'Documento no sea nulo escaner'
,p_validation_sequence=>50
,p_validation=>'P302_ID_MTVO_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar un Documento'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(71808718049925223)
,p_associated_item=>wwv_flow_api.id(71809534499925225)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(71832340937925304)
,p_validation_name=>'Validar Documentos Obligatorios'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select m.indcdor_oblgtrio     ',
'     from v_pq_d_motivos_documento m ',
'left join apex_collections c',
'       on id_mtvo_dcmnto = n001    ',
'      and collection_name = ''DOCUMENTOS''',
'    where id_mtvo = :P302_ID_MTVO',
'      and m.indcdor_oblgtrio = ''S''',
'      and m.actvo = ''S''',
'      and c.n001 is null;'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Debe subir todos los documentos obligatorios'
,p_when_button_pressed=>wwv_flow_api.id(71809114673925225)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(71831187889925303)
,p_validation_name=>'validar_sujeto'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_sjto',
'   from v_si_i_sujetos_impuesto',
'  where cdgo_clnte      = :F_CDGO_CLNTE',
'    and idntfccion_sjto = :P302_IDNTFCCION_SJTO',
'    and id_impsto       = :P302_ID_IMPSTO'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('No existe sujeto con esta identificaci\00F3n')
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vldar_sjto_impsto',
'  from pq_d_motivos',
' where id_mtvo = :P302_ID_MTVO',
'   and vldar_sjto_impsto = ''S'''))
,p_validation_condition_type=>'EXISTS'
,p_associated_item=>wwv_flow_api.id(71824266330925289)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74241573372899603)
,p_validation_name=>'validar subtributos'
,p_validation_sequence=>120
,p_validation=>'P302_ID_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Sub-Tributo debe tener alg\00FAn valor.')
,p_validation_condition=>'P302_VLDAR_TRBTO'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(74241324593899601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71840010410925353)
,p_name=>'al cambiar el motivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_ID_MTVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71840588790925353)
,p_event_id=>wwv_flow_api.id(71840010410925353)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function validarMotivos() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("validar_motivo", {',
'            pageItems: "#P302_ID_MTVO"',
'        }).then(function (resp) {',
'            resp.valid ? apex.item(''BTN_VLDAR'').show() : apex.item(''BTN_VLDAR'').hide();',
'            resp.doc   ? apex.item(''BTN_DSCRGAR'').show() : apex.item(''BTN_DSCRGAR'').hide();',
'            ',
'            $s(''P302_ID_TPO'', resp.id_tpo);',
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
 p_id=>wwv_flow_api.id(71841064679925354)
,p_event_id=>wwv_flow_api.id(71840010410925353)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(216700494414955199)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71841486889925355)
,p_name=>'validar_sujeto'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(71818296571925265)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71841901733925356)
,p_event_id=>wwv_flow_api.id(71841486889925355)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process ("Validar_sujeto", {  ',
'  pageItems: "#P302_IDNTFCCION_SJTO,#P302_ID_IMPSTO"',
'  }).then(function(resp){',
'        apex.message.clearErrors();',
'        if (!resp.exists){',
'            apex.message.showErrors([',
'                { type:"error",',
'                  location:   [ "page", "inline" ],',
'                  pageItem:   "P302_IDNTFCCION_SJTO",',
unistr('                  message:    "No existe sujeto con esta identificaci\00F3n"'),
'                }]);',
'        }else{',
unistr('            apex.message.showPageSuccess(''\00A1Sujeto encontrado!'');'),
'        }',
'     }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71842315929925356)
,p_name=>'al cambiar la identificacion'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_IDNTFCCION,P302_CDGO_IDNTFCCION_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71842869834925357)
,p_event_id=>wwv_flow_api.id(71842315929925356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function BuscarRadicador() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("BuscarRadicador", {',
'            pageItems: "#P302_CDGO_IDNTFCCION_TPO,#P302_IDNTFCCION"',
'        }).then(function (resp) {',
'            Object.keys(resp).forEach((f) => {',
'                apex.item(''P302_'' + f).setValue(('''' + resp[f]).trim());',
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
 p_id=>wwv_flow_api.id(71843243558925357)
,p_name=>unistr('al cambiar la identificaci\00F3n del solicitante')
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_IDNTFCCION_S,P302_CDGO_IDNTFCCION_TPO_S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71843740075925357)
,p_event_id=>wwv_flow_api.id(71843243558925357)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function buscarSolicitante() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("BuscarSolicitante", {',
'            pageItems: "#P302_CDGO_IDNTFCCION_TPO_S,#P302_IDNTFCCION_S"',
'        }).then(function (resp) {',
'            console.log(resp);',
'            Object.keys(resp).forEach((f) => {',
'                apex.item(''P302_'' + f).setValue(('''' + resp[f]).trim());',
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
 p_id=>wwv_flow_api.id(71844189744925357)
,p_name=>'Descargar documentos'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(71818651297925266)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71844686551925358)
,p_event_id=>wwv_flow_api.id(71844189744925357)
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
 p_id=>wwv_flow_api.id(71845099172925358)
,p_name=>'al dar click en el boton copiar'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(75304008788808401)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71845527209925358)
,p_event_id=>wwv_flow_api.id(71845099172925358)
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
 p_id=>wwv_flow_api.id(71845998442925358)
,p_name=>'Al cambiar la opcion de archivo'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_OPCION'
,p_condition_element=>'P302_OPCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71846487615925380)
,p_event_id=>wwv_flow_api.id(71845998442925358)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71846976827925380)
,p_event_id=>wwv_flow_api.id(71845998442925358)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_FILE_BLOB'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71847481278925381)
,p_event_id=>wwv_flow_api.id(71845998442925358)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71847940872925388)
,p_event_id=>wwv_flow_api.id(71845998442925358)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71848438783925388)
,p_event_id=>wwv_flow_api.id(71845998442925358)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71848928055925388)
,p_event_id=>wwv_flow_api.id(71845998442925358)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71849391875925389)
,p_name=>'al cerrar la ventana modal'
,p_event_sequence=>100
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71849828187925389)
,p_event_id=>wwv_flow_api.id(71849391875925389)
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
'               and n001 = :P302_ID_MTVO_DCMNTO;',
'            ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 => :P302_OBSRVCION',
'                                          , p_c002 => v_filename',
'                                          , p_c003 => v_mime_type',
'                                          , p_n001 => :P302_ID_MTVO_DCMNTO',
'                                          , p_blob001 => v_blob );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_c001 => :P302_OBSRVCION',
'                                          , p_c002 => v_filename',
'                                          , p_c003 => v_mime_type',
'                                          , p_n001 => :P302_ID_MTVO_DCMNTO',
'                                          , p_blob001 => v_blob );        ',
'        end;       ',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71850349803925389)
,p_event_id=>wwv_flow_api.id(71849391875925389)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(216700494414955199)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71850784309925409)
,p_name=>unistr('al hacer clic en el bot\00F3n insertar ')
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74203170231940602)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71851233045925410)
,p_event_id=>wwv_flow_api.id(71850784309925409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = [];',
'json.push({''motivos'': $v(''P302_ID_MTVO''), ''sjtos'':[{''id_impsto'':$v(''P302_ID_IMPSTO''),''id_impsto_sbmpsto'':$v(''P302_ID_IMPSTO_SBMPSTO''), ''idntfccion'': $v(''P302_IDNTFCCION_SJTO'')}]});',
'',
'$s(''P302_JSON'', JSON.stringify(json));'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71851742258925410)
,p_event_id=>wwv_flow_api.id(71850784309925409)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'BTN_INSERTAR'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71852156765925410)
,p_name=>'cambioLabelIdentificacion'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71852617390925411)
,p_event_id=>wwv_flow_api.id(71852156765925410)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process(',
'    "CB_AJAX",',
'    {',
'        pageItems: ''#P302_ID_IMPSTO''',
'    },',
'    {',
'        dataType:"text",',
'        async:true,',
'        success:function(pdata){',
'            console.log(pdata);',
'             $("#P302_IDNTFCCION_SJTO_LABEL").html(pdata); ',
'        }',
'    }',
');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71853092995925411)
,p_name=>'al cambiar el tipo'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_ID_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71853523320925411)
,p_event_id=>wwv_flow_api.id(71853092995925411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select vldar_trbto',
'      into :P302_VLDAR_TRBTO',
'      from pq_d_tipos ',
'     where id_tpo = :P302_ID_TPO; ',
'exception',
'    when others then',
'        :P302_VLDAR_TRBTO := null;',
'end;'))
,p_attribute_02=>'P302_ID_TPO'
,p_attribute_03=>'P302_VLDAR_TRBTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71838608655925351)
,p_name=>'al cambiar validar tributo'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_VLDAR_TRBTO'
,p_condition_element=>'P302_VLDAR_TRBTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71839182170925353)
,p_event_id=>wwv_flow_api.id(71838608655925351)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ID_IMPSTO,P302_IDNTFCCION_SJTO,P302_MENSAJE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71839631145925353)
,p_event_id=>wwv_flow_api.id(71838608655925351)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ID_IMPSTO,P302_IDNTFCCION_SJTO,P302_MENSAJE'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5113306418571217)
,p_event_id=>wwv_flow_api.id(71838608655925351)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(5113255287571216)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5113438615571218)
,p_event_id=>wwv_flow_api.id(71838608655925351)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(5113255287571216)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5111852001571202)
,p_name=>'Al dar click en BTN_SGNTE'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5111744696571201)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5111973802571203)
,p_event_id=>wwv_flow_api.id(5111852001571202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href=#REGION_DOCUMENTOS]'').click();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5113505387571219)
,p_name=>'Al dar Click en BTN_REGRESAR_DOCUMENTOS'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5088756337407342)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5113621299571220)
,p_event_id=>wwv_flow_api.id(5113505387571219)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''a[href=#DATOS_SOLICITUD]'').click();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5240098985988739)
,p_name=>'Calcular el impuesto'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5240125760988740)
,p_event_id=>wwv_flow_api.id(5240098985988739)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto',
'  into :P302_ID_IMPSTO',
'  from df_i_impuestos_subimpuesto',
'where id_impsto_sbmpsto = :P302_ID_IMPSTO_SBMPSTO;'))
,p_attribute_02=>'P302_ID_IMPSTO_SBMPSTO'
,p_attribute_03=>'P302_ID_IMPSTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74241709370899605)
,p_name=>'Calcular el Impuesto'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74241884710899606)
,p_event_id=>wwv_flow_api.id(74241709370899605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto',
'  into :P302_ID_IMPSTO',
'  from df_i_impuestos_subimpuesto',
'where id_impsto_sbmpsto = :P302_ID_IMPSTO_SBMPSTO;'))
,p_attribute_02=>'P302_ID_IMPSTO_SBMPSTO'
,p_attribute_03=>'P302_ID_IMPSTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71834286095925306)
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
'         where name = :P302_FILE_BLOB;',
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
'               and n001 = :P302_ID_MTVO_DCMNTO;',
'            ',
'            apex_collection.update_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_seq  => v_seq  ',
'                                          , p_c001 => :P302_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P302_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        exception ',
'            when others then',
'                apex_collection.add_member( p_collection_name => ''DOCUMENTOS''',
'                                          , p_c001 => :P302_OBSRVCION',
'                                          , p_c002 => r_temp_files.filename',
'                                          , p_c003 => r_temp_files.mime_type',
'                                          , p_n001 => :P302_ID_MTVO_DCMNTO',
'                                          , p_blob001 => r_temp_files.blob_content );        ',
'        end;       ',
'    end if;',
'end;'))
,p_process_error_message=>'No se encontro archivo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(71808718049925223)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71835404243925311)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrar_solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    if :P302_ID_TPO is null then',
'        select id_tpo',
'          into :P302_ID_TPO',
'          from pq_d_motivos',
'         where id_mtvo    = :P302_ID_MTVO;',
'    end if;',
'    pkg_pq_pqr.prc_rg_solicitud_portal( p_id_tpo      	    => :P302_ID_TPO 				',
'                                      , p_id_usrio          => :F_ID_USRIO',
'                                      , p_id_prsntcion_tpo  => :P302_ID_PRSNTCION_TPO',
'                                      , p_cdgo_clnte        => :F_CDGO_CLNTE ',
'                                      , p_nmro_flio         => 1 --:P302_NMRO_FLIO                             ',
'                                      , p_id_motivo         => :P302_ID_MTVO',
'                                      , p_idntfccion_sjto   => :P302_IDNTFCCION_SJTO  ',
'                                      , p_id_impsto         => :P302_ID_IMPSTO ',
'                                      , p_id_impsto_sbmpsto => :P302_ID_IMPSTO_SBMPSTO',
'                                      , p_obsrvcion         => :P302_OBSRVCION_S',
'                                      , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                      , o_mnsje_rspsta      => v_mnsje_rspsta',
'                                      , o_id_slctud         => :P302_ID_SLCTUD);',
'',
'    if(v_cdgo_rspsta != 0) then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(71809114673925225)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71837480996925314)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Construccion_xml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P302_XML := '''';',
'    for c_xml in (select id_rprte',
'                    from v_pq_d_motivos_documento',
'                   where id_mtvo = :P302_ID_MTVO',
'                     and id_rprte is not null ',
'                 )',
'    loop',
'        :P302_XML := :P302_XML || ''<data><id_rprte>''|| c_xml.id_rprte || ''</id_rprte><xml><id_impsto>''|| :P302_ID_IMPSTO || ''</id_impsto><id_impsto_sbmpsto>'' || :P302_ID_IMPSTO_SBMPSTO || ''</id_impsto_sbmpsto></xml></data>'';',
'    end loop;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(71818651297925266)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(88212117170468046)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar collections ESTABLECIMIENTOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ( apex_collection.collection_exists(p_collection_name => ''ESTABLECIMIENTOS'') ) then',
'     apex_collection.delete_collection( p_collection_name => ''ESTABLECIMIENTOS'');',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71833487927925305)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validar_motivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_vldar_sjto_impsto     pq_d_motivos.vldar_sjto_impsto%type;',
'    v_count                 number;',
'    v_id_tpo                pq_d_motivos.id_tpo%type;',
'begin ',
'    begin       ',
'        select vldar_sjto_impsto, id_tpo',
'          into v_vldar_sjto_impsto, v_id_tpo',
'          from pq_d_motivos',
'         where id_mtvo = :P302_ID_MTVO',
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
'         where id_mtvo = :P302_ID_MTVO',
'           and id_rprte is not null;',
'    exception',
'        when others then',
'            v_count := 0;',
'    end;',
'          apex_json.open_object;',
'          apex_json.write(''valid'',  v_vldar_sjto_impsto is not null);',
'          apex_json.write(''id_tpo'', v_id_tpo);',
'          apex_json.write(''doc''  ,  v_count > 0);',
'          apex_json.close_object;',
'',
'exception',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''ERROR'', true);',
'        apex_json.write(''MSG''  , apex_escape.html(sqlerrm));',
'        apex_json.write(''valid'', false); ',
'         apex_json.write(''doc''  , false);',
'        apex_json.close_object;   ',
'end;',
'   ',
'    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71833879864925305)
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
'       and idntfccion_sjto = :P302_IDNTFCCION_SJTO',
'       and id_impsto       = :P302_ID_IMPSTO;',
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
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71834688253925306)
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
'     where idntfccion          = :P302_IDNTFCCION ',
'       and cdgo_idntfccion_tpo = :P302_CDGO_IDNTFCCION_TPO;',
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
 p_id=>wwv_flow_api.id(71835065700925310)
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
'     where idntfccion          = :P302_IDNTFCCION_S',
'       and cdgo_idntfccion_tpo = :P302_CDGO_IDNTFCCION_TPO_S',
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
 p_id=>wwv_flow_api.id(71837841458925314)
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
'    on a.cdgo_sjto_tpo = b.cdgo_sjto_tpo where a.id_impsto = :P302_ID_IMPSTO;',
'    ',
'    htp.prn(texto_return);',
'exception when no_data_found then',
'    htp.prn(''Identificacion'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72095870011408730)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'URL_WORKFLOW'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_instncia_fljo  number;',
'    v_id_fljo_trea      number;',
'    v_url               varchar2(4000);',
'begin',
'    select c.id_instncia_fljo',
'         , c.id_fljo_trea_orgen',
'      into v_id_instncia_fljo',
'         , v_id_fljo_trea',
'      from pq_g_solicitudes a',
'      join wf_g_instancias_flujo_gnrdo b',
'        on b.id_instncia_fljo = a.id_instncia_fljo',
'      join wf_g_instancias_transicion c',
'        on c.id_instncia_fljo = b.id_instncia_fljo_gnrdo_hjo',
'     where a.id_slctud = :P302_ID_SLCTUD;',
'',
'    v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url( p_id_instncia_fljo => v_id_instncia_fljo',
'                                                 , p_id_fljo_trea     => v_id_fljo_trea);',
'',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''url'' , v_url);',
'    apex_json.close_object;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5113996473571223)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar_Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(2000);',
'begin',
'    ',
'    o_cdgo_rspsta := 0;',
'    o_mnsje_rspsta := ''OK'';',
'    ',
'    APEX_COLLECTION.DELETE_MEMBER (p_collection_name => ''DOCUMENTOS'',',
'                                   p_seq             => APEX_APPLICATION.g_x01);',
'                                   ',
'                                   ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_all();',
'                                   ',
'exception',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 90);',
'        apex_json.write(''o_mnsje_rspsta'', sqlerrm); --''Error al intentar eliminar el documento.'');',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
