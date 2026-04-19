prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Informaci\00F3n de pago en l\00EDnea')
,p_step_title=>unistr('Informaci\00F3n de pago en l\00EDnea')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Portal/js/consumirServiciosRest.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'var refresh = async function(){',
'    await apex.server.process("RefrescarInformacionTransaccion", {',
'        x01: $v(''P30_ID_ORGEN''),',
'        pageItems:''#P30_ID_PGDOR_DCMNTO,#P30_NMRO_DCMNTO,#P30_FCHA_VNCMNTO,#P30_VLOR_TTAL_DCMNTO,#P30_IDNTFCCION_SJTO_FRMTDA,#P30_NMBRE_IMPSTO_SBMPSTO,#P30_NMBRE_PGDOR,#P30_INDCDOR_ESTDO_TRNSCCION,#P30_DSCRPCION_ESTDO_TRNSCCION''',
'    }).then((resp) => {',
'',
'        if (resp.o_cdgo_rspsta === 0) {',
'',
'            $s(''P30_ID_PGDOR_DCMNTO'', resp.id_pgdor_dcmnto);',
'            $s(''P30_NMRO_DCMNTO'', resp.nmro_dcmnto); ',
'            $s(''P30_FCHA_VNCMNTO'', resp.fcha_vncmnto); ',
'            $s(''P30_VLOR_TTAL_DCMNTO'', resp.vlor_ttal_dcmnto); ',
'            $s(''P30_IDNTFCCION_SJTO_FRMTDA'', resp.idntfccion_sjto_frmtda); ',
'            $s(''P30_NMBRE_IMPSTO_SBMPSTO'', resp.nmbre_impsto_sbmpsto); ',
'            $s(''P30_FCHA_TRNSCCION'', resp.fcha_rgstro); ',
'            $s(''P30_NMBRE_PGDOR'', resp.nmbre_pgdor); ',
'            $s(''P30_INDCDOR_ESTDO_TRNSCCION'', resp.indcdor_estdo_trnsccion); ',
'            //$s(''P30_DSCRPCION_ESTDO_TRNSCCION'', resp.dscrpcion_estdo_trnsccion);',
unistr('            $s(''P30_DSCRPCION_ESTDO_TRNSCCION'', ''Su transacci\00F3n est\00E1 en proceso, por favor espere!'');'),
'',
unistr('            //Definimos el estilo seg\00FAn el estado.'),
'            if ($v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''AP'') {',
'',
unistr('                $s(''P30_DSCRPCION_ESTDO_TRNSCCION'', ''Bien hecho, su transacci\00F3n ha sido APROBADA! <span class="apex-item-icon fa fa-check-circle" aria-hidden="true"></span>'');'),
'                //$(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').removeClass();',
'                //$(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').addClass(''alert alert-success'');            ',
'                $(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').addClass(''transaction_success'');',
'                $(''#P30_DSCRPCION_ESTDO_TRNSCCION_LABEL, #P30_DSCRPCION_ESTDO_TRNSCCION_DISPLAY'').addClass(''text_transaction_success'');',
'',
'            }else if($v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''FA''){',
unistr('                $s(''P30_DSCRPCION_ESTDO_TRNSCCION'', ''Lo sentimos, ha ocurrido un fallo en su transacci\00F3n! <span class="apex-item-icon fa fa-times-circle" aria-hidden="true"></span>'');'),
'                $(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').addClass(''transaction_failed'');',
'                $(''#P30_DSCRPCION_ESTDO_TRNSCCION_LABEL, #P30_DSCRPCION_ESTDO_TRNSCCION_DISPLAY'').addClass(''text_transaction_failed'');',
'            }else if($v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''RE''){',
unistr('                $s(''P30_DSCRPCION_ESTDO_TRNSCCION'', ''Lo sentimos, su transacci\00F3n ha sido RECHAZADA! <span class="apex-item-icon fa fa-times-circle" aria-hidden="true"></span>'');'),
'                $(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').addClass(''transaction_failed'');',
'                $(''#P30_DSCRPCION_ESTDO_TRNSCCION_LABEL, #P30_DSCRPCION_ESTDO_TRNSCCION_DISPLAY'').addClass(''text_transaction_failed'');',
'',
'                   }else if($v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''RE_CU''){',
unistr('                $s(''P30_DSCRPCION_ESTDO_TRNSCCION'', ''Lo sentimos, la transacci\00F3n ha sido cancelada por el usuario.  <span class="apex-item-icon fa fa-times-circle" aria-hidden="true"></span>'');'),
'                $(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').addClass(''transaction_failed'');',
'                $(''#P30_DSCRPCION_ESTDO_TRNSCCION_LABEL, #P30_DSCRPCION_ESTDO_TRNSCCION_DISPLAY'').addClass(''text_transaction_failed'');',
'             }else if($v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''RE_EX''){',
unistr('                $s(''P30_DSCRPCION_ESTDO_TRNSCCION'', ''Lo sentimos, La petici\00F3n ha expirado  <span class="apex-item-icon fa fa-times-circle" aria-hidden="true"></span>'');'),
'                $(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').addClass(''transaction_failed'');',
'                $(''#P30_DSCRPCION_ESTDO_TRNSCCION_LABEL, #P30_DSCRPCION_ESTDO_TRNSCCION_DISPLAY'').addClass(''text_transaction_failed'');',
'     ',
'                 ',
'                 ',
'       }else if($v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''PE''){',
unistr('                $s(''P30_DSCRPCION_ESTDO_TRNSCCION'', ''su transacci\00F3n se encuentra en estado PENDIENTE!'');'),
'                //$(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').addClass(''transaction_failed'');',
'                //$(''#P30_DSCRPCION_ESTDO_TRNSCCION_LABEL, #P30_DSCRPCION_ESTDO_TRNSCCION_DISPLAY'').addClass(''text_transaction_failed'');',
'            }',
'',
'',
'          }else{',
'',
'                apex.message.clearErrors();',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: [',
'                            "page"',
'                        ],',
'                        message: resp.o_mnsje_rspsta,',
'                        unsafe: false',
'                    }',
'                ]);',
'          }',
'',
'    });',
'}',
'',
'var consultarEstado = async function(){',
'    ',
'    let $waitPopup = apex.widget.waitPopup();',
'    ',
'     await apex.server.process("ConsultarEstadoTransaccion", {',
'        pageItems: "#P30_ID_ORGEN,#P30_ID_PRVDOR"',
'    }).then((resp) => {',
'        $waitPopup.remove();',
'        if (resp.o_cdgo_rspsta > 0) {',
'            console.log(resp);',
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
'',
'        }else{',
'            refresh();',
'        }',
'',
'    });',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('//Definimos el estilo seg\00FAn el estado.'),
'/*if ($v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''AP'') {',
'',
unistr('    $s(''P30_DSCRPCION_ESTDO_TRNSCCION'', ''Bien hecho, su transacci\00F3n ha sido APROBADA! <span class="apex-item-icon fa fa-check-circle" aria-hidden="true"></span>'');'),
'    $(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').addClass(''transaction_success'');',
'    $(''#P30_DSCRPCION_ESTDO_TRNSCCION_LABEL, #P30_DSCRPCION_ESTDO_TRNSCCION_DISPLAY'').addClass(''text_transaction_success'');',
'',
'}else if($v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''FA''){',
unistr('    $s(''P30_DSCRPCION_ESTDO_TRNSCCION'', ''Lo sentimos, ha ocurrido un fallo en su transacci\00F3n! <span class="apex-item-icon fa fa-times-circle" aria-hidden="true"></span>'');'),
'    $(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').addClass(''transaction_failed'');',
'    $(''#P30_DSCRPCION_ESTDO_TRNSCCION_LABEL, #P30_DSCRPCION_ESTDO_TRNSCCION_DISPLAY'').addClass(''text_transaction_failed'');',
'}else if($v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''RE''){',
unistr('    $s(''P30_DSCRPCION_ESTDO_TRNSCCION'', ''Lo sentimos, su transacci\00F3n ha sido RECHAZADA! <span class="apex-item-icon fa fa-times-circle" aria-hidden="true"></span>'');'),
'    $(''#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER'').addClass(''transaction_failed'');',
'    $(''#P30_DSCRPCION_ESTDO_TRNSCCION_LABEL, #P30_DSCRPCION_ESTDO_TRNSCCION_DISPLAY'').addClass(''text_transaction_failed'');',
'}*/',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#DETALLE_control_panel{',
'    display: none;',
'}',
'',
'.t-Region--accent2 > .t-Region-header {',
'    background-color: #0466b8;',
'    color: #f0faf6;',
'}',
'',
'#P30_VLOR_TTAL_DCMNTO_CONTAINER{',
'    background-color: #e8e8e8;',
'}',
'',
'#P30_VLOR_TTAL_DCMNTO_LABEL, #P30_VLOR_TTAL_DCMNTO_DISPLAY{    ',
'    font-size: 1.7rem;',
'}',
'',
'#P30_DSCRPCION_ESTDO_TRNSCCION_CONTAINER{',
'    margin-top: 10px !important;',
'}',
'',
'.transaction_success{',
'    background-color: #dff0d8;    ',
'    border: 1px solid #babfbb;',
'}',
'',
'.text_transaction_success{',
'    color: #23912d;',
'}',
'',
'.transaction_failed{',
'    background-color: #ffd4db;    ',
'    border: 1px solid #d91a29;',
'}',
'',
'.text_transaction_failed{',
'    color: #d91a29;',
'}',
'',
'//bootstrap alerts',
'',
'.alert {',
'    padding: .95rem 1.45rem;',
'    margin-bottom: 1rem;',
'    border: 1px solid transparent;',
'    border-top-color: transparent;',
'    border-right-color: transparent;',
'    border-bottom-color: transparent;',
'    border-left-color: transparent;',
'    border-radius: .35rem;',
'}',
'',
'.alert-success {',
'    background-color: #40C057 !important;',
'    color: #FFF !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20250307085605'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81204753816952527)
,p_plug_name=>unistr('Informaci\00F3n de pago en l\00EDnea')
,p_region_name=>'INFORMACION_TRANSACCION'
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88663866022348121)
,p_plug_name=>'<b>Detalle del Documento</b>'
,p_region_name=>'DETALLE'
,p_parent_plug_id=>wwv_flow_api.id(81204753816952527)
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_mvmnto_dtlle',
'           , b.dscrpcion || '' '' || c.vgncia || ''-'' || c.prdo as dscrpcion',
'           , (a.vlor_dbe - a.vlor_hber) as vlor',
'        from re_g_documentos_detalle a',
'        join df_i_conceptos b',
'          on a.id_cncpto = b.id_cncpto',
'        join v_gf_g_movimientos_detalle c',
'          on a.id_mvmnto_dtlle = c.id_mvmnto_dtlle',
'       where a.id_dcmnto = :P30_ID_ORGEN',
'    order by a.id_dcmnto_dtlle'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P30_CDGO_ORGN_TPO'
,p_plug_display_when_cond2=>'DC'
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
 p_id=>wwv_flow_api.id(88666375552348146)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JAGUAS'
,p_internal_uid=>88666375552348146
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89705767259384502)
,p_db_column_name=>'ID_MVMNTO_DTLLE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Mvmnto Dtlle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89706609904384511)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89735174129824230)
,p_db_column_name=>'VLOR'
,p_display_order=>160
,p_column_identifier=>'W'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(89724568593384936)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'897246'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'DSCRPCION:VLOR:'
,p_sum_columns_on_break=>'VLOR'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(90253355729185311)
,p_report_id=>wwv_flow_api.id(89724568593384936)
,p_name=>'Valor negativo'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'VLOR'
,p_operator=>'<'
,p_expr=>'0'
,p_condition_sql=>' (case when ("VLOR" < to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# < #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_font_color=>'#DE0408'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96232560850973206)
,p_plug_name=>unistr('<b>Detalle del Declaraci\00F3n</b>')
,p_region_name=>'DETALLE'
,p_parent_plug_id=>wwv_flow_api.id(81204753816952527)
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_mvmnto_dtlle',
'       , b.dscrpcion',
'       , (a.vlor_dbe - a.vlor_hber) as vlor',
'    from gi_g_dclrcnes_mvmnto_fnncro a',
'    join df_i_conceptos b',
'      on a.id_cncpto = b.id_cncpto',
'    where a.id_dclrcion = :P30_ID_ORGEN;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P30_CDGO_ORGN_TPO'
,p_plug_display_when_cond2=>'DL'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(96232628280973207)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'LTORRES'
,p_internal_uid=>96232628280973207
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96232764747973208)
,p_db_column_name=>'ID_MVMNTO_DTLLE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Mvmnto Dtlle'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96232864216973209)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96232985051973210)
,p_db_column_name=>'VLOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(96892463445307819)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'968925'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_MVMNTO_DTLLE:DSCRPCION:VLOR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5516791522658726)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(81204753816952527)
,p_button_name=>'BTN_HSTRIAL_PGOS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ver Historial'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,32:P32_ID_PGDOR:&P30_ID_PGDOR.'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99077047495812231)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(81204753816952527)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9710483967905739)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(81204753816952527)
,p_button_name=>'BTN_RGRESAR'
,p_button_static_id=>'BTN_RGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP:F_CDGO_CLNTE:&F_CDGO_CLNTE.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7409487581678917)
,p_name=>'P30_NMBRE_BNCO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_prompt=>'<b>Banco:</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_display_when=>'P30_NMBRE_BNCO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7410591620678928)
,p_name=>'P30_REQUEST_ID'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_prompt=>unistr('<b>Autorizaci\00F3n CUS:</b>')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_display_when=>'P30_REQUEST_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10767744672461701)
,p_name=>'P30_ID_PRVDOR'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81204806568952528)
,p_name=>'P30_CDGO_CLNTE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81204923036952529)
,p_name=>'P30_ID_IMPSTO'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81205030040952530)
,p_name=>'P30_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81205128226952531)
,p_name=>'P30_ID_ORGEN'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81205258511952532)
,p_name=>'P30_NMRO_DCMNTO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_prompt=>'<b>Referencia de Pago:</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81205512961952535)
,p_name=>'P30_NMBRE_PGDOR'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81205638777952536)
,p_name=>'P30_INDCDOR_ESTDO_TRNSCCION'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81205721576952537)
,p_name=>'P30_ID_PGDOR_DCMNTO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88663304368348116)
,p_name=>'P30_DSCRPCION_ESTDO_TRNSCCION'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_prompt=>unistr('<b>Estado de la transacci\00F3n:</b>')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88663400971348117)
,p_name=>'P30_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_prompt=>'<b>Producto a Debitar:</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88663567870348118)
,p_name=>'P30_FCHA_VNCMNTO'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88663637297348119)
,p_name=>'P30_IDNTFCCION_SJTO_FRMTDA'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88663725794348120)
,p_name=>'P30_VLOR_TTAL_DCMNTO'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_prompt=>'<b>Valor a pagar:</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89708006694384525)
,p_name=>'P30_NMBRE_CLNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89708245368384527)
,p_name=>'P30_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89708569846384530)
,p_name=>'P30_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89708661327384531)
,p_name=>'P30_CDGO_SJTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89708748339384532)
,p_name=>'P30_DSCRPCION_SJTO_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89708810924384533)
,p_name=>'P30_IDNTFCCION_SJTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89709070003384535)
,p_name=>'P30_IDNTFCCION_ANTRIOR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89709119053384536)
,p_name=>'P30_IDNTFCCION_ANTRIOR_FRMTDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89709274325384537)
,p_name=>'P30_CDGO_DCMNTO_TPO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89709367012384538)
,p_name=>'P30_DSCRPCION_DCMNTO_TPO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89709809869384543)
,p_name=>'P30_DSCRPCION_IDNTFCCION_TPO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89709905954384544)
,p_name=>'P30_ID_PGDOR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89710098366384545)
,p_name=>'P30_PRMER_NMBRE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89710159524384546)
,p_name=>'P30_SGNDO_NMBRE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89710211881384547)
,p_name=>'P30_PRMER_APLLDO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89710391668384548)
,p_name=>'P30_SGNDO_APLLDO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89732209202824201)
,p_name=>'P30_FCHA_RGSTRO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89732340384824202)
,p_name=>'P30_FCHA_MDFCCION'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89735249246824231)
,p_name=>'P30_FCHA_TRNSCCION'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_prompt=>unistr('<b>Fecha y hora de la transacci\00F3n:</b>')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96232303832973204)
,p_name=>'P30_CDGO_ORGN_TPO'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(81204753816952527)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(81205348729952533)
,p_name=>unistr('Al cargar la p\00E1gina')
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P30_ID_ORGEN'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89734822679824227)
,p_event_id=>wwv_flow_api.id(81205348729952533)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(88663866022348121)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(81205969439952539)
,p_name=>unistr('Al cambiar \00EDtem')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_ID_ORGEN'
,p_condition_element=>'P30_ID_ORGEN'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(81206052323952540)
,p_event_id=>wwv_flow_api.id(81205969439952539)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_ID_ORGEN'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Iniciar el temporizador cada 1 minuto (60.000 milisegundos) para refrescar la consulta',
'/*var timer = setInterval(function(){',
'    console.log(''Sondeando...!'');',
'    refresh();',
'}, 6000);*/',
'                           ',
'',
unistr('//Si se da uno de los 3 estados finales de la trasacci\00F3n, detener el temporizador'),
'/*if ($v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''AP'' || $v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''FA'' || $v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''RE'' || $v(''P30_INDCDOR_ESTDO_TRNSCCION'') === ''PE''){',
'    clearInterval(timer);',
'}*/',
'',
'',
'consultarEstado();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89734549155824224)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'null;',
'/*begin',
'    select  id_pgdor_dcmnto',
'          , nmro_dcmnto',
'          , to_char(fcha_vncmnto, ''dd/mm/yyyy'')',
'          , to_char(vlor_ttal_dcmnto, ''$999,999,999,999'')',
'          , idntfccion_sjto_frmtda',
'          , upper(nmbre_impsto_sbmpsto)',
'          , (prmer_nmbre||'' ''||sgndo_nmbre||'' ''||prmer_aplldo||'' ''||sgndo_aplldo)',
'          , indcdor_estdo_trnsccion',
'          , dscrpcion_estdo_trnsccion',
'      into  :P30_ID_PGDOR_DCMNTO',
'          , :P30_NMRO_DCMNTO',
'          , :P30_FCHA_VNCMNTO',
'          , :P30_VLOR_TTAL_DCMNTO',
'          , :P30_IDNTFCCION_SJTO_FRMTDA',
'          , :P30_NMBRE_IMPSTO_SBMPSTO',
'          , :P30_NMBRE_PGDOR',
'          , :P30_INDCDOR_ESTDO_TRNSCCION',
'          , :P30_DSCRPCION_ESTDO_TRNSCCION',
'    from v_re_g_pagadores_documento',
'    where id_dcmnto = :P30_ID_ORGEN;',
'    ',
'    apex_json.open_object(); ',
'    apex_json.write(''o_cdgo_rspsta'', 0); ',
'    apex_json.write(''o_mnsje_rspsta'', ''OK''); ',
'    apex_json.close_all();',
'',
'exception',
'    when others then',
'        :P30_ID_PGDOR_DCMNTO           := null;',
'        :P30_NMRO_DCMNTO               := null;',
'        :P30_FCHA_VNCMNTO              := null;',
'        :P30_VLOR_TTAL_DCMNTO          := null;',
'        :P30_IDNTFCCION_SJTO_FRMTDA    := null;',
'        :P30_NMBRE_IMPSTO_SBMPSTO      := null;',
'        :P30_NMBRE_PGDOR               := null;',
'        :P30_INDCDOR_ESTDO_TRNSCCION   := null;',
'        :P30_DSCRPCION_ESTDO_TRNSCCION := null;',
'        ',
'        apex_json.open_object(); ',
'        apex_json.write(''o_cdgo_rspsta'', 10); ',
'        apex_json.write(''o_mnsje_rspsta'', ''Error al consultar datos''); ',
'        apex_json.close_all();',
'end;*/'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89707551606384520)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarDatosDeLaTransaccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
unistr('    --Se obtiene la informaci\00F3n en com\00FAn'),
'    begin',
'    ',
'        select  a.id_pgdor_dcmnto,',
'                upper(a.nmbre_impsto_sbmpsto) as nmbre_impsto_sbmpsto,',
'                to_char(fcha_rgstro, ''dd/mm/yyyy hh:mi:ss'') as fcha_rgstro,',
'                dscrpcion_estdo_trnsccion,',
'                id_prvdor,',
'                nmbre_bnco,  --Req0026255',
'                request_id  --Req0026255',
'           into :P30_ID_PGDOR_DCMNTO, ',
'                :P30_NMBRE_IMPSTO_SBMPSTO,',
'                :P30_FCHA_TRNSCCION,',
'                :P30_DSCRPCION_ESTDO_TRNSCCION,',
'                :P30_ID_PRVDOR,',
'                :P30_NMBRE_BNCO,',
'                :P30_REQUEST_ID',
'       from v_re_g_pagadores_documento a',
'       where a.cdgo_clnte             = :F_CDGO_CLNTE ',
'       and a.id_orgen                 = :P30_ID_ORGEN',
'       and a.cdgo_orgn_tpo            = :P30_CDGO_ORGN_TPO ',
'       and a.indcdor_estdo_trnsccion  = ''IN'';',
'    ',
'    exception',
'        when others then',
'            :P30_ID_PGDOR_DCMNTO           := null;',
'            :P30_NMBRE_IMPSTO_SBMPSTO      := null;',
'            :P30_DSCRPCION_ESTDO_TRNSCCION := null;',
'            :P30_FCHA_TRNSCCION            := null;',
'            :P30_NMBRE_BNCO                := null;',
'            :P30_REQUEST_ID                := null;',
'    end;',
'    ',
'    if :P30_CDGO_ORGN_TPO = ''DC'' then',
'        ',
unistr('        --Se obtiene la informaci\00F3n si es un documento'),
'        begin',
'            ',
'            select a.nmro_dcmnto,',
'                   to_char(a.vlor_ttal_dcmnto, ''$999,999,999,999'') as vlor_ttal_dcmnto,',
'                   nmbre_bnco, --Req0026255',
'                   request_id  --Req0026255',
'            into   :P30_NMRO_DCMNTO,',
'                   :P30_VLOR_TTAL_DCMNTO,',
'                   :P30_NMBRE_BNCO,',
'                   :P30_REQUEST_ID',
'            from re_g_documentos a ',
'                join (select p.nmbre_bnco , p.request_id, p.id_orgen',
'                        from v_re_g_pagadores_documento p --join ws_d_provedores_banco t on t.cdgo_bnco = p.cdgo_bnco',
'                        where p.id_orgen = :P30_ID_ORGEN',
'                        order by p.id_pgdor_dcmnto desc  ',
'                        fetch first 1 rows only) b on b.id_orgen = a.id_dcmnto',
'            where a.cdgo_clnte  = :F_CDGO_CLNTE',
'            and a.id_dcmnto     = :P30_ID_ORGEN;',
'        ',
'        exception',
'            when others then',
'                :P30_NMRO_DCMNTO         := null;',
'                :P30_VLOR_TTAL_DCMNTO    := null;',
'                :P30_NMBRE_BNCO          := null;',
'                :P30_REQUEST_ID          := null;',
'        end;',
'        ',
'        ',
'    else',
'        ',
unistr('        --Se obtiene la informaci\00F3n si es una declaraci\00F3n'),
'        begin',
'            ',
'            select a.nmro_cnsctvo,',
'                   to_char(a.vlor_pago, ''$999,999,999,999'') as vlor_pago',
'            into   :P30_NMRO_DCMNTO,',
'                   :P30_VLOR_TTAL_DCMNTO',
'            from gi_g_declaraciones a',
'            where a.cdgo_clnte = :F_CDGO_CLNTE',
'            and a.id_dclrcion = :P30_ID_ORGEN;',
'        ',
'        exception',
'            when others then',
'                :P30_NMRO_DCMNTO := null;',
'                :P30_VLOR_TTAL_DCMNTO := null;',
'        end;',
'    ',
'    end if;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P30_ID_ORGEN'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89707484724384519)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RefrescarInformacionTransaccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_pgdor_dcmnto              v_re_g_pagadores_documento.id_pgdor_dcmnto%type;',
'    v_nmro_dcmnto                  number; --v_re_g_pagadores_documento.nmro_dcmnto%type;',
'    v_fcha_vncmnto                 varchar2(30);',
'    v_vlor_ttal_dcmnto             varchar2(30);',
'    v_idntfccion_sjto_frmtda       varchar2(600); --v_re_g_pagadores_documento.idntfccion_sjto_frmtda%type;',
'    v_nmbre_impsto_sbmpsto         v_re_g_pagadores_documento.nmbre_impsto_sbmpsto%type;',
'    v_nmbre_pgdor                  varchar2(100);',
'    v_indcdor_estdo_trnsccion      v_re_g_pagadores_documento.indcdor_estdo_trnsccion%type;',
'    v_dscrpcion_estdo_trnsccion    v_re_g_pagadores_documento.dscrpcion_estdo_trnsccion%type;',
'    v_fcha_rgstro                  varchar2(100);',
'begin',
'    ',
'    select max(id_pgdor_dcmnto) into v_id_pgdor_dcmnto',
'    from re_g_pagadores_documento',
'    where id_orgen = APEX_APPLICATION.g_x01;',
'    ',
'    if :P30_CDGO_ORGN_TPO = ''DC'' then',
'    ',
'        select  b.nmro_dcmnto',
'              , to_char(b.fcha_vncmnto, ''dd/mm/yyyy'')',
'              , to_char(b.vlor_ttal_dcmnto, ''$999,999,999,999'')',
'              , case',
'                when length(d.idntfccion) = 15 then',
'                    pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => d.idntfccion, p_frmto => ''xx-xx-xxxx-xxxx-xxx'', p_crcter_dlmtdor',
'                    => ''-'')',
'                when length(d.idntfccion) = 25 then',
'                    pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => d.idntfccion, p_frmto => ''xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx''',
'                    , p_crcter_dlmtdor => ''-'')',
'                else',
'                   d.idntfccion',
'            end as idntfccion_sjto_frmtda',
'           -- d.idntfccion_antrior,',
'              , upper(a.nmbre_impsto_sbmpsto)',
'              , (a.prmer_nmbre||'' ''||a.sgndo_nmbre||'' ''||a.prmer_aplldo||'' ''||a.sgndo_aplldo)',
'              , a.indcdor_estdo_trnsccion',
'              , a.dscrpcion_estdo_trnsccion',
'              , to_char(a.fcha_rgstro,''dd/mm/yyyy hh:mi:ss am'')',
'          into  v_nmro_dcmnto',
'              , v_fcha_vncmnto',
'              , v_vlor_ttal_dcmnto',
'              , v_idntfccion_sjto_frmtda',
'              , v_nmbre_impsto_sbmpsto',
'              , v_nmbre_pgdor',
'              , v_indcdor_estdo_trnsccion',
'              , v_dscrpcion_estdo_trnsccion',
'              , v_fcha_rgstro',
'        from v_re_g_pagadores_documento    a',
'        join re_g_documentos               b    on b.id_dcmnto = a.id_orgen',
'        join si_i_sujetos_impuesto         c    on c.id_sjto_impsto = b.id_sjto_impsto',
'        join si_c_sujetos                  d    on d.id_sjto        = c.id_sjto',
'        where a.id_pgdor_dcmnto = v_id_pgdor_dcmnto;--:P28_ID_ORGEN;',
'    ',
'    else ',
'        select  b.nmro_cnsctvo nmro_dcmnto',
'              , to_char(b.fcha_prsntcion_pryctda, ''dd/mm/yyyy'')',
'              , to_char(b.vlor_pago, ''$999,999,999,999'')',
'              , case',
'                when length(d.idntfccion) = 15 then',
'                    pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => d.idntfccion, p_frmto => ''xx-xx-xxxx-xxxx-xxx'', p_crcter_dlmtdor',
'                    => ''-'')',
'                when length(d.idntfccion) = 25 then',
'                    pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => d.idntfccion, p_frmto => ''xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx''',
'                    , p_crcter_dlmtdor => ''-'')',
'                else',
'                   d.idntfccion',
'            end as idntfccion_sjto_frmtda',
'           -- d.idntfccion_antrior,',
'              , upper(a.nmbre_impsto_sbmpsto)',
'              , (a.prmer_nmbre||'' ''||a.sgndo_nmbre||'' ''||a.prmer_aplldo||'' ''||a.sgndo_aplldo)',
'              , a.indcdor_estdo_trnsccion',
'              , a.dscrpcion_estdo_trnsccion',
'              , to_char(a.fcha_rgstro,''dd/mm/yyyy hh:mi:ss am'')',
'          into  v_nmro_dcmnto',
'              , v_fcha_vncmnto',
'              , v_vlor_ttal_dcmnto',
'              , v_idntfccion_sjto_frmtda',
'              , v_nmbre_impsto_sbmpsto',
'              , v_nmbre_pgdor',
'              , v_indcdor_estdo_trnsccion',
'              , v_dscrpcion_estdo_trnsccion',
'              , v_fcha_rgstro',
'        from v_re_g_pagadores_documento a',
'          join gi_g_declaraciones b',
'            on b.id_dclrcion = a.id_orgen',
'          join si_i_sujetos_impuesto c',
'            on c.id_sjto_impsto = b.id_sjto_impsto',
'          join si_c_sujetos d',
'            on d.id_sjto = c.id_sjto',
'         where a.id_pgdor_dcmnto = v_id_pgdor_dcmnto;',
'    end if;',
'    ',
'    apex_json.open_object(); ',
'    apex_json.write(''id_pgdor_dcmnto'', v_id_pgdor_dcmnto); --',
'    apex_json.write(''nmro_dcmnto'', v_nmro_dcmnto); ',
'    apex_json.write(''fcha_vncmnto'', v_fcha_vncmnto); ',
'    apex_json.write(''vlor_ttal_dcmnto'', v_vlor_ttal_dcmnto); ',
'    apex_json.write(''idntfccion_sjto_frmtda'', v_idntfccion_sjto_frmtda); ',
'    apex_json.write(''nmbre_impsto_sbmpsto'', v_nmbre_impsto_sbmpsto); ',
'    apex_json.write(''nmbre_pgdor'', v_nmbre_pgdor); ',
'    apex_json.write(''indcdor_estdo_trnsccion'', v_indcdor_estdo_trnsccion); ',
'    apex_json.write(''dscrpcion_estdo_trnsccion'', v_dscrpcion_estdo_trnsccion); --',
'    apex_json.write(''fcha_rgstro'', v_fcha_rgstro);',
'    apex_json.write(''o_cdgo_rspsta'', 0); ',
'    apex_json.write(''o_mnsje_rspsta'', ''OK''); ',
'    apex_json.close_all();',
'',
'exception',
'    when others then',
'        v_id_pgdor_dcmnto           := null;',
'        v_nmro_dcmnto               := null;',
'        v_fcha_vncmnto              := null;',
'        v_vlor_ttal_dcmnto          := null;',
'        v_idntfccion_sjto_frmtda    := null;',
'        v_nmbre_impsto_sbmpsto      := null;',
'        v_nmbre_pgdor               := null;',
'        v_indcdor_estdo_trnsccion   := null;',
'        v_dscrpcion_estdo_trnsccion := null;',
'        v_fcha_rgstro               := null;',
'        ',
'        apex_json.open_object(); ',
'        apex_json.write(''o_cdgo_rspsta'', 10); ',
'        apex_json.write(''o_mnsje_rspsta'', ''Error al consultar datos''||sqlerrm); ',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5114229638571226)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsultarEstadoTransaccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    o_cdgo_rspsta   number;',
'    o_mnsje_rspsta  varchar2(2000);',
'    ',
'begin',
'        ',
unistr('        -- Consulta y actualizaci\00F3n de estado de transacci\00F3n'),
'        pkg_ws_pagos_placetopay.prc_co_transacciones(p_id_prvdor       =>    :P30_ID_PRVDOR -- PlaceToPay(1)',
'                                                   , p_id_dcmnto       =>    :P30_ID_ORGEN  -- ID_DCMNTO',
'                                                   , o_cdgo_rspsta     =>    o_cdgo_rspsta',
'                                                   , o_mnsje_rspsta    =>    o_mnsje_rspsta);',
'    ',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
