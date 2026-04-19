prompt --application/pages/page_00023
begin
wwv_flow_api.create_page(
 p_id=>23
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Registro de Veh\00EDculo')
,p_step_title=>unistr('Registro de Veh\00EDculo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validarPlaca(){',
'    ',
'',
'        apex.server.process(',
'            "ValidarPlaca",',
'            {',
'                x01: $v(''P23_VHCLO_PLCA''),',
'                x02: $v(''P23_CDGO_CLNTE''),',
'                x03: $v(''P23_ID_IMPSTO''),',
'',
'',
'            },',
'            {',
'                success: function(pData){',
'                    var data = pData;',
'                    if (data.o_cdgo_rspsta != ''0''){',
'                            Swal.fire({ // icon: ''error'',',
unistr('                                    title: ''<H2 >Validaci\00F3n</H2>'','),
'                                     html: `<h4>${data.o_mnsje_rspsta}</h4>`',
'                                   ',
'                                }).then((result) => {',
'                                        console.log(''Ok'');',
'                            ',
'                                       ',
'                            ',
'                                  });',
'                         apex.item( "P23_VHCLO_CTGTRIA").setValue();',
'                     /*   apex.item("P23_VHCLO_CLSE").setValue();',
'                        apex.item("P23_VHCLO_MRCA").setValue();',
'                        apex.item("P23_MDLO").setValue();',
'                        apex.item("P23_CLNDRJE").setValue();*/',
'                        apex.item("P23_FCHA_CMPRA").setValue();',
'                        apex.item("P23_FCHA_MTRCLA").setValue();',
'                        apex.item("P23_FCHA_IMPRTCION").setValue();',
'                        apex.item("P23_BLNDDO").setValue();',
'                        apex.item("P23_VHCLO_CRRCRIA").setValue();',
'                        apex.item("P23_VHCLO_SRVCIO").setValue();',
'                        apex.item("P23_VHCLO_OPRCION").setValue();',
'                        apex.item("P23_CPCDAD_CRGA").setValue();',
'                        apex.item("P23_CPCDAD_PSJRO").setValue();',
'                        apex.item("P23_VGNCIA_INCIO_LQDCION").setValue();',
'                        apex.item("P23_NMRO_MTOR").setValue();',
'                        apex.item("P23_NMRO_CHSIS").setValue();',
'                        apex.item("P23_DCLRCION_IMPRTCION").setValue();',
'                        apex.item("P23_NMRO_MTRCLA").setValue();',
'                        apex.item("P23_VLOR_FACTURA_OCULTO").setValue();',
'                        apex.item("P23_VLOR_CMRCIAL_OCLTO").setValue();',
'                        apex.item("P23_ORGNSMO_TRNSTO").setValue();',
'                        apex.item("P23_VHCLO_CMBSTBLE").setValue();',
'                        apex.item("P23_VHCLO_TRNSMSION").setValue();',
'                       /* apex.item("P23_CLSCO_S_N").setValue();',
'                        apex.item("P23_INTRNDO_S_N").setValue();*/',
'                        apex.item("P23_ASGRDRA").setValue();',
'                        apex.item("P23_NMRO_SOAT").setValue();',
'                        apex.item("P23_FCHA_VNCMNTO_SOAT").setValue();',
'                         apex.item( "vehiculo" ).hide();',
'                         apex.item( "opciones" ).hide();',
'                         apex.item( "responsable" ).hide();',
'                         apex.item( "archivos" ).hide();',
'                     ',
'          }else{ ',
'                        apex.item( "vehiculo" ).show();',
'                        apex.item( "opciones" ).show();',
'                        apex.item( "responsable" ).show();',
'                        apex.item( "archivos" ).show();',
'                    }',
'                }',
'            }',
'        );',
'}',
'',
'function validarMotor(){',
'    apex.server.process(',
'        "validarMotor",',
'        {',
'            x01: $v(''P23_NMRO_MTOR''),',
'            x02: $v(''P23_CDGO_CLNTE''),',
'            x03: $v(''P23_ID_IMPSTO''),',
'        },',
'        {',
'            success: function(pData){',
'                var data = pData;',
'                if (data.o_cdgo_rspsta != ''0''){',
'                    apex.item(''P23_NMRO_MTOR'').setFocus();',
'                    apex.item(''P23_NMRO_MTOR'').setValue();',
'                    Swal.fire({ // icon: ''error'',',
unistr('                                title: ''<H2 >Validaci\00F3n</H2>'','),
'                                 html: `<h4>${data.o_mnsje_rspsta}</h4>`',
'                            }).then((result) => {',
'                                    console.log(''Ok'');',
'                                    });                                                  ',
'                ',
'                }',
'            }',
'        }',
'    );',
'}',
'',
'function ValidaCilindrajepuntual(){',
'  console.log(''entrando'');',
'  console.log($v(''P23_VHCLO_LNEA''));',
'  console.log($v(''P23_VHCLO_MRCA''));',
'   ',
'    try{',
'                apex.server.process(',
'                    ''ValidarCilindraje'',',
'                    {',
'                        x01: 2020, //ojo//',
'                        x02: $v(''P23_VHCLO_LNEA''),',
'                        x03: $v(''P23_VHCLO_MRCA''),',
'                    }).then((resp) => {',
'                            console.log(''Respuesta:  '',resp);',
'                             apex.item(''P23_CLNDRJE'').setValue(resp.v_clndrje);',
'                           ',
'                    });       ',
'',
'        } catch (e) {',
'            console.log(e);',
'        };',
'}',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById(''P23_VHCLO_PLCA'').style.fontWeight = "900";',
'document.getElementById(''P23_VHCLO_PLCA'').style.fontSize = "29px"',
'document.getElementById(''P23_VHCLO_PLCA'').style.fontFamily = "Lucida Console";',
'document.getElementById(''P23_VHCLO_PLCA'').style.textAlign = "center";',
'apex.item(''P23_VHCLO_PLCA'').setFocus();',
'if ($(''#P23_FCHA_MTRCLA'').val() == "" ){',
'    apex.item(''P23_VGNCIA_INCIO_LQDCION'').hide();',
'}'))
,p_step_template=>wwv_flow_api.id(237212187010524183)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220215204717'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94537944745858441)
,p_plug_name=>'Contenedor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87092878566714613)
,p_plug_name=>unistr('Veh\00EDculo ')
,p_region_name=>'vehiculo'
,p_parent_plug_id=>wwv_flow_api.id(94537944745858441)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(237251008003524203)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85478581306506146)
,p_plug_name=>unistr('Datos de Liquidaci\00F3n Veh\00EDculo ')
,p_parent_plug_id=>wwv_flow_api.id(87092878566714613)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87095027879714635)
,p_plug_name=>unistr('Inicio Liquidaci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(85478581306506146)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87092553205714610)
,p_plug_name=>unistr('Informaci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(87092878566714613)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87093413489714619)
,p_plug_name=>'SOAT'
,p_parent_plug_id=>wwv_flow_api.id(87092878566714613)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87095407980714639)
,p_plug_name=>'Datos Principales'
,p_parent_plug_id=>wwv_flow_api.id(94537944745858441)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87587226994478225)
,p_plug_name=>'Datos Principales'
,p_parent_plug_id=>wwv_flow_api.id(87095407980714639)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>3
,p_plug_display_column=>5
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87983338653116206)
,p_plug_name=>'Responsables '
,p_region_name=>'responsable'
,p_parent_plug_id=>wwv_flow_api.id(94537944745858441)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(237251008003524203)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87587487939478227)
,p_plug_name=>'Responsables'
,p_parent_plug_id=>wwv_flow_api.id(87983338653116206)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(237243066872524200)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  SEQ_ID,',
unistr('        decode(c001, ''S'', ''S\00ED'', ''No'')  as prncpal,     '),
'        c004 as idntfccion_r,',
'        c005||''''||c006||''''||c007||''''||c008  as Nombre,',
'         c013 as drccion_r,',
'         c014 as tlfno_r,',
'         c015 as email_r,',
'        c010 as v_dscrpcion_dprtmnto,',
'        c012 as v_dscrpcion_mncpio,',
'        c016 as tpo_rspnsble,',
'        c017 as indcdor,',
'        c018 as id_sjto_rspnsble,',
'        ''<center>',
'            <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Eliminar  ',
'                <span class="fa fa-trash-o" aria-hidden="true"></span>',
'            </button>',
'        </center>'' as btn_eliminar       ',
'from APEX_collections    a    ',
'where collection_name = ''RESPONSABLES_V'''))
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
 p_id=>wwv_flow_api.id(87587580600478228)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encontraron datos.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,21:P21_SEQ_ID:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AMOLINA'
,p_internal_uid=>87587580600478228
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87587616412478229)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87587745786478230)
,p_db_column_name=>'PRNCPAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87588057574478233)
,p_db_column_name=>'IDNTFCCION_R'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87588623377478239)
,p_db_column_name=>'V_DSCRPCION_DPRTMNTO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Departamento '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87588826447478241)
,p_db_column_name=>'V_DSCRPCION_MNCPIO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Municipio '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87588920065478242)
,p_db_column_name=>'DRCCION_R'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Direcci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87589027118478243)
,p_db_column_name=>'TLFNO_R'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('Tel\00E9fono ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87589120503478244)
,p_db_column_name=>'EMAIL_R'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Correo  '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87589219423478245)
,p_db_column_name=>'TPO_RSPNSBLE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Tpo Rspnsble'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87589318704478246)
,p_db_column_name=>'INDCDOR'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Indcdor'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87589484816478247)
,p_db_column_name=>'ID_SJTO_RSPNSBLE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Id Sjto Rspnsble'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87589555020478248)
,p_db_column_name=>'BTN_ELIMINAR'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>unistr('Acci\00F3n ')
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:DELETE:&DEBUG.:RP:P23_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'#BTN_ELIMINAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4058355525879108)
,p_db_column_name=>'NOMBRE'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(87955798961869527)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'879558'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IDNTFCCION_R:PRNCPAL:DRCCION_R:TLFNO_R:EMAIL_R:V_DSCRPCION_DPRTMNTO:V_DSCRPCION_MNCPIO:BTN_ELIMINAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187893837102730883)
,p_plug_name=>'Archivos Adjuntos '
,p_region_name=>'archivos'
,p_parent_plug_id=>wwv_flow_api.id(87983338653116206)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(237243066872524200)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id, a.application_id, a.name,a.filename,a.mime_type,a.created_on,a.blob_content,',
' ''<center>',
'            <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Eliminar  ',
'                <span class="fa fa-trash-o" aria-hidden="true"></span>',
'            </button>',
'        </center>'' as btn_eliminar_arc',
'                 from apex_application_temp_files a',
'                         where a.application_id = :APP_ID;',
''))
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
 p_id=>wwv_flow_api.id(94034116686393316)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>94034116686393316
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103466207846461701)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'P'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103466375593461702)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>20
,p_column_identifier=>'Q'
,p_column_label=>'Application Id'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103466479730461703)
,p_db_column_name=>'NAME'
,p_display_order=>30
,p_column_identifier=>'R'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103466544247461704)
,p_db_column_name=>'FILENAME'
,p_display_order=>40
,p_column_identifier=>'S'
,p_column_label=>'Nombre de Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103466638940461705)
,p_db_column_name=>'MIME_TYPE'
,p_display_order=>50
,p_column_identifier=>'T'
,p_column_label=>'Mime Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103466703098461706)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>60
,p_column_identifier=>'U'
,p_column_label=>'Fecha de Archivo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103466834188461707)
,p_db_column_name=>'BLOB_CONTENT'
,p_display_order=>70
,p_column_identifier=>'V'
,p_column_label=>'Blob Content'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103466979088461708)
,p_db_column_name=>'BTN_ELIMINAR_ARC'
,p_display_order=>80
,p_column_identifier=>'W'
,p_column_label=>'Eliminar'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.:ELIMINAR:&DEBUG.::P23_SEQ_ID_ARC:#ID#'
,p_column_linktext=>'#BTN_ELIMINAR_ARC#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(94066648209918231)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'940667'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILENAME:CREATED_ON:BTN_ELIMINAR_ARC:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(279519957542056431)
,p_plug_name=>'Opciones'
,p_region_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>' <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(279520967023058054)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'                <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'	<i>',
unistr('        Funcionalidad que permite registrar puntualmente un nuevo veh\00EDculo y los responsables asociados.'),
'        <br>	',
'        <br>',
unistr('	    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dirijase al Manual de Usuario.'),
'    </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(87094656722714631)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(279519957542056431)
,p_button_name=>'Btn_Registrar'
,p_button_static_id=>'Btn_Registrar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Veh\00EDculo ')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95090633325200031)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(279519957542056431)
,p_button_name=>'Btn_Registra_masivo'
,p_button_static_id=>'Btn_Registrar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Veh\00EDculo Masivos')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:RP,35::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(87587316627478226)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(279519957542056431)
,p_button_name=>'Btn_registrar_responsable'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(237296259540524233)
,p_button_image_alt=>'Agregar Responsable'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,21::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94033357604393308)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(279519957542056431)
,p_button_name=>'Btn_adjuntar_archivo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(237296259540524233)
,p_button_image_alt=>'Agregar Archivo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:RP,27::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''1''',
'from APEX_collections p',
' where p.collection_name = ''RESPONSABLES_V'';'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(87985458725116227)
,p_branch_name=>unistr('ir a liquidaci\00F3n ')
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::P24_VGNCIA_INCIO_LQDCION,P24_ID_SJTO_IMPSTO,P24_VHCLO_MRCA,P24_VHCLO_CLSE,P24_MDLO,P24_VHCLO_CRRCRIA,P24_VHCLO_OPRCION,P24_VHCLO_SRVCIO,P24_VHCLO_CTGRIA:&P23_VGNCIA_INCIO_LQDCION.,&P23_ID_SJTO_IMPSTO.,&P23_VHCLO_MRCA.,&P23_VHCLO_CLSE.,&P23_MDLO.,&P23_VHCLO_CRRCRIA.,&P23_VHCLO_OPRCION.,&P23_VHCLO_SRVCIO.,&P23_VHCLO_CTGTRIA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(87094656722714631)
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P23_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4058104329879106)
,p_name=>'P23_VLOR_CMRCIAL_OCLTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4058221975879107)
,p_name=>'P23_VLOR_FACTURA_OCULTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85478619793506147)
,p_name=>'P23_NMRO_MTRCLA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>'No. Matricula:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85478779030506148)
,p_name=>'P23_VHCLO_MRCA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>'Marca:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select j.dscrpcion_vhclo_mrca as d,',
'   j.cdgo_vhclo_mrca as r from df_s_vehiculos_marca j ',
'where j.mnstrio = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P23_VHCLO_CTGTRIA,P23_VHCLO_CLSE'
,p_ajax_items_to_submit=>'P23_VHCLO_MRCA,P23_VHCLO_CLSE'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85478836885506149)
,p_name=>'P23_VHCLO_CLSE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>'Clase:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct b.dscrpcion_vhclo_clse as d',
'     , c.cdgo_vhclo_clse  as r',
'  from df_s_vehiculos_clase_ctgria c',
'  join df_s_vehiculos_clase        b on b.cdgo_vhclo_clse = c.cdgo_vhclo_clse',
' where c.cdgo_vhclo_ctgtria = :P23_VHCLO_CTGTRIA',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P23_VHCLO_CTGTRIA'
,p_ajax_items_to_submit=>'P23_VHCLO_CLSE,P23_VHCLO_CTGTRIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85478978383506150)
,p_name=>'P23_VHCLO_LNEA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>'Linea:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l.dscrpcion_vhclo_lnea||'' - [''||d.clndrje_dsde||'']'' as d',
'     , d.id_vhclo_grpo                                     as r',
'  from df_s_vehiculos_grupo d',
'  join df_s_vehiculos_linea l on d.id_vhclo_lnea = l.id_vhclo_lnea',
'  join  df_s_vehiculos_clase_ctgria h  on h.id_vhclo_clse_ctgria = d.id_vhclo_clse_ctgria and h.vgncia =  d.vgncia',
'  and d.cdgo_vhclo_mrca = l.cdgo_vhclo_mrca',
'  where d.vgncia   =  extract (year from sysdate)',
'   and h.cdgo_vhclo_clse      =  :P23_VHCLO_CLSE',
'   and h.cdgo_vhclo_ctgtria   =  :P23_VHCLO_CTGTRIA',
'   and d.cdgo_vhclo_mrca      =  :P23_VHCLO_MRCA',
'   and l.mnstrio              = ''S''',
'',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P23_VHCLO_MRCA'
,p_ajax_items_to_submit=>'P23_VHCLO_LNEA,P23_CLNDRJE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87091627984714601)
,p_name=>'P23_CLNDRJE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>'Cilindraje: '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87091780577714602)
,p_name=>'P23_MDLO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>unistr('A\00F1o Modelo:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P23_VHCLO_LNEA'
,p_ajax_optimize_refresh=>'Y'
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87091842697714603)
,p_name=>'P23_VHCLO_CRRCRIA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>unistr('Carrocer\00EDa: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CARROCERIA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CRROCRIA as d,',
'       CDGO_VHCLO_CRRCRIA as r',
'  from DF_S_VEHICULOS_CARROCERIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87091956084714604)
,p_name=>'P23_CPCDAD_CRGA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>'Capacidad de Carga:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87092094940714605)
,p_name=>'P23_CPCDAD_PSJRO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>'Capacidad de Pasajeros:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87092108570714606)
,p_name=>'P23_BLNDDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>'Blindaje:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_blndje as d',
'     , cdgo_vhclo_blndje      as r',
'  from df_s_vehiculos_blindaje',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P23_FCHA_MTRCLA'
,p_ajax_items_to_submit=>'P23_FCHA_MTRCLA,P23_BLNDDO,P23_MDLO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87092256870714607)
,p_name=>'P23_FCHA_MTRCLA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>'Fecha de Matricula:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cattributes_element=>' onkeydown="return false" '
,p_tag_attributes=>'ondblclick="this.value=''''" onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87092348498714608)
,p_name=>'P23_FCHA_CMPRA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>'Fecha de Factura:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cattributes_element=>' onkeydown="return false" '
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87092493849714609)
,p_name=>'P23_FCHA_IMPRTCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>unistr('Fecha de Importaci\00F3n: ')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>16
,p_tag_attributes=>'ondblclick="this.value=''''" onkeydown="return false" onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87092937908714614)
,p_name=>'P23_VHCLO_CTGTRIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>unistr('Categor\00EDa: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CTGTRIA as d,',
'       CDGO_VHCLO_CTGTRIA as r',
'  from DF_S_VEHICULOS_CATEGORIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87093023037714615)
,p_name=>'P23_VLOR_CMRCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>'Valor Comercial:'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_cMaxlength=>16
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'P23_VLOR_CMRCIAL_OCLTO'
,p_attribute_02=>'10000000000000'
,p_attribute_03=>'1'
,p_attribute_05=>'$'
,p_attribute_06=>'p'
,p_attribute_08=>','
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>','
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87093194757714616)
,p_name=>'P23_AVLUO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>'Valor Factura:'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_cMaxlength=>16
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'P23_VLOR_FACTURA_OCULTO'
,p_attribute_02=>'10000000000000'
,p_attribute_03=>'1'
,p_attribute_05=>'$'
,p_attribute_06=>'p'
,p_attribute_08=>','
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>','
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87093238373714617)
,p_name=>'P23_VHCLO_SRVCIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>'Servicio: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_SERVICIO_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_SRVCIO  as d,',
'       CDGO_VHCLO_SRVCIO as r',
'  from DF_S_VEHICULOS_SERVICIO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87093351927714618)
,p_name=>'P23_VHCLO_OPRCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_prompt=>unistr('Operaci\00F3n: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_OPERACION_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_OPRCION as d,',
'       CDGO_VHCLO_OPRCION as r',
'  from DF_S_VEHICULOS_OPERACION',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'40%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87093568759714620)
,p_name=>'P23_ASGRDRA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(87093413489714619)
,p_prompt=>'Aseguradora:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_asgrdra as d',
'     , id_asgrdra    as r',
'  from df_s_aseguradoras;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87093602813714621)
,p_name=>'P23_NMRO_SOAT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(87093413489714619)
,p_prompt=>unistr('N\00FAmero P\00F3liza:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87093729866714622)
,p_name=>'P23_FCHA_VNCMNTO_SOAT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(87093413489714619)
,p_prompt=>'Fecha Vencimiento:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87093885827714623)
,p_name=>'P23_NMRO_MTOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>unistr('N\00FAmero de Motor:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letraNumero'')"'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87093934004714624)
,p_name=>'P23_NMRO_CHSIS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>unistr('N\00FAmero de Chasis: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letraNumero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87094038376714625)
,p_name=>'P23_VHCLO_CMBSTBLE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>'Combustible: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_COMBUSTIBLE_VEHICULO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhculo_cmbstble as d',
'     , cdgo_vhclo_cmbstble       as r',
'  from df_s_vehiculos_combustible',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87094170344714626)
,p_name=>'P23_ORGNSMO_TRNSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>'Organismo de Transito: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_orgnsmo_trnsto as d',
'     , id_orgnsmo_trnsto    as r',
'  from df_s_organismos_transito'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87094286186714627)
,p_name=>'P23_VHCLO_TRNSMSION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>unistr('Transmisi\00F3n: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TRANSMISION_VEHICULO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_trnsmsion as d',
'     , cdgo_vhclo_trnsmsion      as r',
'  from df_s_vehiculos_transmision',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87094372258714628)
,p_name=>'P23_CLSCO_S_N'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>unistr('Cl\00E1sico:')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87094458979714629)
,p_name=>'P23_INTRNDO_S_N'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>'Internado:'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87094537146714630)
,p_name=>'P23_DCLRCION_IMPRTCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>unistr('N\00FAmero de Importaci\00F3n: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87095152683714636)
,p_name=>'P23_VGNCIA_INCIO_LQDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(87095027879714635)
,p_prompt=>unistr('Vigencia Inicio de Liquidaci\00F3n:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select vgncia as d',
'        , vgncia as r',
'     from df_s_vigencias',
'    where vgncia >= extract (year from(to_date(:P23_FCHA_MTRCLA)))',
'      and vgncia <> (extract (year from(sysdate)))'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P23_FCHA_MTRCLA'
,p_ajax_items_to_submit=>'P23_VGNCIA_INCIO_LQDCION'
,p_ajax_optimize_refresh=>'Y'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select vgncia as d',
'        , vgncia as r',
'     from df_s_vigencias',
'    where vgncia >= extract (year from(to_date(:P23_FCHA_MTRCLA)))',
'      and vgncia <> (extract (year from(sysdate)))'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'25%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87095563061714640)
,p_name=>'P23_VHCLO_PLCA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(87587226994478225)
,p_prompt=>'<b>No. Placa:</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>7
,p_cMaxlength=>6
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letraNumero'')"'
,p_field_template=>wwv_flow_api.id(237296049031524231)
,p_item_template_options=>'#DEFAULT#:margin-bottom-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87983116861116204)
,p_name=>'P23_SEQ_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87983918752116212)
,p_name=>'P23_JSON'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87984622582116219)
,p_name=>'P23_INDCDOR'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87984802309116221)
,p_name=>'P23_DPRTMNTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>'Departamento: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmbre_dprtmnto as d',
'       , id_dprtmnto    as r ',
'   from df_s_departamentos;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87984929155116222)
,p_name=>'P23_MNCPIO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(87092553205714610)
,p_prompt=>'Municipio: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmbre_mncpio as d',
'       , id_mncpio    as r ',
'   from df_s_municipios',
'  where id_dprtmnto = :P23_DPRTMNTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P23_DPRTMNTO'
,p_ajax_items_to_submit=>'P23_DPRTMNTO,P23_MNCPIO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87985148053116224)
,p_name=>'P23_ID_IMPSTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_impsto',
'      from df_c_impuestos',
'     where cdgo_clnte  = :F_CDGO_CLNTE',
'       and cdgo_impsto = ''IVA'';'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87985398084116226)
,p_name=>'P23_ID_SJTO_IMPSTO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87986585010116238)
,p_name=>'P23_CDGO_CLNTE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93239512648357004)
,p_name=>'P23_ID_IMPSTO_SBIMPSTO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93914046620274838)
,p_name=>'P23_NMBRE_ARCHVO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(85478581306506146)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103399762012959208)
,p_name=>'P23_SEQ_ID_ARC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(187893837102730883)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(87985281193116225)
,p_computation_sequence=>10
,p_computation_item=>'P23_ID_IMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_impsto',
'      from df_c_impuestos',
'     where cdgo_clnte  = :F_CDGO_CLNTE',
'       and cdgo_impsto = ''VHL'';'))
,p_computation_error_message=>unistr('No Existe el Impuesto de Veh\00EDculo parametrizado!')
,p_compute_when=>'P23_ID_IMPSTO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(87986690352116239)
,p_computation_sequence=>20
,p_computation_item=>'P23_CDGO_CLNTE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_CDGO_CLNTE'
,p_compute_when=>'P23_CDGO_CLNTE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(93287247113872508)
,p_computation_sequence=>60
,p_computation_item=>'P23_ID_IMPSTO_SBIMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P23_ID_IMPSTO'))
,p_compute_when=>'P23_ID_IMPSTO_SBIMPSTO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87984159474116214)
,p_validation_name=>'Responsable no null'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_count number;',
'begin',
'   select count(*)',
'     into v_count',
'     from APEX_collections ',
'    where collection_name = ''RESPONSABLES_V'';',
'    ',
'    if v_count = 0 then',
'            return false;',
'    else ',
'            return true;',
'    end if;        ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Debe registrar al menos un responsable.'
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(87984273324116215)
,p_validation_name=>'responsable principal no null'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_count number;',
'begin',
'   select count(*)',
'     into v_count',
'     from APEX_collections ',
'    where collection_name = ''RESPONSABLES_V''',
'      and c001 = ''S'';',
'    ',
'    if v_count = 0 then',
'            return false;',
'    else ',
'            return true;',
'    end if;        ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Debe registrar al menos un responsabe principal'
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103467432834461713)
,p_validation_name=>'Valida linea'
,p_validation_sequence=>30
,p_validation=>'P23_VHCLO_LNEA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'El campo linea es reequerido'
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_associated_item=>wwv_flow_api.id(85478978383506150)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103467959924461718)
,p_validation_name=>'valida clase'
,p_validation_sequence=>50
,p_validation=>'P23_VHCLO_CLSE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar clase de veh\00EDculo.')
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_associated_item=>wwv_flow_api.id(85478836885506149)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103468020864461719)
,p_validation_name=>'valida marca'
,p_validation_sequence=>60
,p_validation=>'P23_VHCLO_MRCA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar marca veh\00EDculo.')
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_associated_item=>wwv_flow_api.id(85478779030506148)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103468340039461722)
,p_validation_name=>'valida cilindraje'
,p_validation_sequence=>70
,p_validation=>'P23_CLNDRJE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar cilindraje veh\00EDculo.')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_associated_item=>wwv_flow_api.id(87091627984714601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103468866735461727)
,p_validation_name=>'validar modelo'
,p_validation_sequence=>80
,p_validation=>'P23_MDLO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar modelo veh\00EDculo.')
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_associated_item=>wwv_flow_api.id(87091780577714602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103469106215461730)
,p_validation_name=>'valida fecha_compra'
,p_validation_sequence=>90
,p_validation=>'P23_FCHA_CMPRA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar fecha de compra.'
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_associated_item=>wwv_flow_api.id(87092348498714608)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103469503619461734)
,p_validation_name=>'valida fecha_matricula'
,p_validation_sequence=>100
,p_validation=>'P23_FCHA_MTRCLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar fecha matricula.'
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_associated_item=>wwv_flow_api.id(87092256870714607)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103470159613461740)
,p_validation_name=>'validar_blindaje'
,p_validation_sequence=>110
,p_validation=>'P23_BLNDDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar veh\00EDculo blindaje.')
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_associated_item=>wwv_flow_api.id(87092108570714606)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103938555986553601)
,p_validation_name=>unistr('Vigencia Inicio Liquidaci\00F3n')
,p_validation_sequence=>230
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'cont number:= 0; ',
' begin ',
' ',
'   select count(1) into cont  ',
'     from df_s_vigencias',
'    where vgncia >= extract (year from(to_date(:P23_FCHA_MTRCLA)))',
'      and vgncia <> (extract (year from(sysdate))); ',
'  ',
'  if cont  > 0  and :P23_VGNCIA_INCIO_LQDCION is null then ',
'  insert into muerto(v_001) values(''entrado ela valiadcion mayo a 0''||:P23_FCHA_MTRCLA);commit; ',
'    return false;',
'  else ',
'    insert into muerto(v_001) values(''entrado ela valiadcion igual a 0''||:P23_FCHA_MTRCLA);commit;',
'   return true; ',
'  end if; ',
' ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_associated_item=>wwv_flow_api.id(87095152683714636)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7205569467667401)
,p_validation_name=>'Validar Valor factura'
,p_validation_sequence=>240
,p_validation=>'P23_AVLUO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar valor factura.'
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7205665723667402)
,p_validation_name=>'Validar Departamento'
,p_validation_sequence=>250
,p_validation=>'P23_DPRTMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresa el departamento'
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7205787528667403)
,p_validation_name=>'validar municipio'
,p_validation_sequence=>260
,p_validation=>'P23_MNCPIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar el municipio'
,p_when_button_pressed=>wwv_flow_api.id(87094656722714631)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(87585049670478203)
,p_name=>'Al cambiar Categoria'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_VHCLO_CTGTRIA'
,p_condition_element=>'P23_VHCLO_CTGTRIA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87585163926478204)
,p_event_id=>wwv_flow_api.id(87585049670478203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23_CPCDAD_CRGA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87585280761478205)
,p_event_id=>wwv_flow_api.id(87585049670478203)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23_CPCDAD_CRGA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89151010678061404)
,p_event_id=>wwv_flow_api.id(87585049670478203)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23_CPCDAD_CRGA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(87585736001478210)
,p_name=>'Al cambiar fecha matricula'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_FCHA_MTRCLA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87585810954478211)
,p_event_id=>wwv_flow_api.id(87585736001478210)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var today = new Date();',
'var year = today.getFullYear();',
'if ($(''#P23_FCHA_MTRCLA'').val().substring(6, 10) == year || $(''#P23_FCHA_MTRCLA'').val() == "" ){',
'     apex.item(''P23_VGNCIA_INCIO_LQDCION'').hide();',
'        apex.item("P23_VGNCIA_INCIO_LQDCION").setValue();',
'}else{',
'    apex.item(''P23_VGNCIA_INCIO_LQDCION'').show();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(87586103301478214)
,p_name=>'Al dar doble Click'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_FCHA_MTRCLA'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87586277908478215)
,p_event_id=>wwv_flow_api.id(87586103301478214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var today = new Date();',
'var year = today.getFullYear();',
'if ($(''#P23_FCHA_MTRCLA'').val().substring(6, 10) == year || $(''#P23_FCHA_MTRCLA'').val() == "" ){',
'     apex.item(''P23_VGNCIA_INCIO_LQDCION'').hide();',
'      apex.item("P23_VGNCIA_INCIO_LQDCION").setValue();',
'}else{',
'    apex.item(''P23_VGNCIA_INCIO_LQDCION'').show();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(87586551435478218)
,p_name=>'Al cambiar placa'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_VHCLO_PLCA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87586855322478221)
,p_event_id=>wwv_flow_api.id(87586551435478218)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarPlaca();'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(87982961088116202)
,p_name=>'Al Capturar evento de cerrar modal'
,p_event_sequence=>80
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87983005782116203)
,p_event_id=>wwv_flow_api.id(87982961088116202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(87587487939478227)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94034950220393324)
,p_event_id=>wwv_flow_api.id(87982961088116202)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(187893837102730883)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89152874743061422)
,p_name=>'Al cambiar el numero del motor'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_NMRO_MTOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89152950517061423)
,p_event_id=>wwv_flow_api.id(89152874743061422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarMotor();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91642318277800201)
,p_name=>'Al cambiar calcula cilindraje'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_VHCLO_LNEA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91642459280800202)
,p_event_id=>wwv_flow_api.id(91642318277800201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'ValidaCilindrajepuntual();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103761283655217739)
,p_name=>'New'
,p_event_sequence=>350
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(87587316627478226)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103761313000217740)
,p_event_id=>wwv_flow_api.id(103761283655217739)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7208853523667434)
,p_name=>'New_1'
,p_event_sequence=>360
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7208910859667435)
,p_event_id=>wwv_flow_api.id(7208853523667434)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(279519957542056431)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9402675571206912)
,p_name=>'Recarga_page'
,p_event_sequence=>370
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_FCHA_MTRCLA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9402727235206913)
,p_event_id=>wwv_flow_api.id(9402675571206912)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94001549265655976)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar_archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'begin',
unistr('    --Elimina el registro de la colleci\00F3n'),
'    begin',
'        APEX_COLLECTION.DELETE_MEMBER( p_collection_name => ''ARCHIVOS_VEHICULO'',',
'                                       p_seq => :P23_SEQ_ID',
'        );',
'    end;',
'    ',
'    --elimina registro de la temporal',
'     delete',
'       from apex_application_temp_files',
'      where application_id = :APP_ID',
'        and id             = substr(:P23_NMBRE_ARCHVO,1,instr(:P23_NMBRE_ARCHVO,''/'')-1);',
'        ',
'        commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'eliminarArchivo'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87589697751478249)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crear Colecci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'   APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''RESPONSABLES_V'');',
'',
'',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from APEX_collections ',
' where collection_name = ''RESPONSABLES_V'';',
''))
,p_process_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87983267654116205)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar responsable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
unistr('    --Elimina el registro de la colleci\00F3n'),
'    begin',
'        APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''RESPONSABLES_V'',',
'        p_seq => :P23_SEQ_ID);',
'    end;',
'    ',
'    --elimina el sujeto responsable',
'    /*begin',
'        delete from si_i_sujetos_responsable',
'        where id_sjto_rspnsble = :P56_SJTO_RSPNSBLE;',
'    end;',
'    */',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87983714465116210)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Vaciar Colecci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    APEX_COLLECTION.TRUNCATE_COLLECTION(',
'        p_collection_name => ''RESPONSABLES_V'');',
'',
'      ',
'end;',
'    delete from  apex_application_temp_files ;',
'    commit;    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P23_VHCLO_PLCA'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103399586254959206)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar_Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
unistr('    --Elimina el registro de la colleci\00F3n'),
'    /*begin',
'        APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''ARCHIVOS_VEHICULO_REG'',',
'        p_seq => :P23_SEQ_ID_ARC);',
'    end;*/',
'    ',
'     delete from apex_application_temp_files a',
'     where a.id = :P23_SEQ_ID_ARC; ',
'commit; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ELIMINAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6739758490205303)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'limpiar_session'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P23_VHCLO_PLCA'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87094891068714633)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar_Vehiculo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rpsta   number;',
'    v_sjto_impsto  number;',
'    v_mnsje_rspsta varchar2(5000);',
'    v_json         clob;',
'    v_id_prdo      number;',
'    v_error        exception;',
'    v_o_id_lqdcion number;',
'    v_id_vhclo_lnea_lq  number; ',
'begin',
unistr('    -- JSON para registro de veh\00EDculo  '),
'   begin ',
'    select d.id_vhclo_lnea into  v_id_vhclo_lnea_lq',
'      from df_s_vehiculos_grupo d',
'    where d.id_vhclo_grpo = :P23_VHCLO_LNEA;',
'    exception ',
'      when others then ',
'      v_cdgo_rpsta:= 1;  ',
' end;',
'    ',
'    select json_object(''cdgo_clnte''     	        value :F_CDGO_CLNTE,        ',
'                       ''idntfccion''                 value :P23_VHCLO_PLCA,      ',
'                       ''id_dprtmnto''                value :P23_DPRTMNTO,        ',
'                       ''id_mncpio''                  value :P23_MNCPIO,          ',
'                       ''drccion''                    value (select p.c013',
'                                                             from APEX_collections p',
'                                                            where p.collection_name = ''RESPONSABLES_V''',
'                                                              and c001 = ''S''),',
'                       ''id_dprtmnto_ntfccion''	    value :P23_DPRTMNTO,',
'                       ''id_mncpio_ntfccion''	        value :P23_MNCPIO,',
'                       ''drccion_ntfccion''	        value (select p.c013',
'                                                             from APEX_collections p',
'                                                            where p.collection_name = ''RESPONSABLES_V''',
'                                                              and c001 = ''S''),',
'                       ''id_impsto''                  value :P23_ID_IMPSTO,   ',
'                       ''id_usrio''		            value :F_ID_USRIO,',
'                       ''cdgo_vhclo_ctgtria''         value :P23_VHCLO_CTGTRIA,',
'                       ''cdgo_vhclo_clse''            value :P23_VHCLO_CLSE,',
'                       ''cdgo_vhclo_mrca''            value :P23_VHCLO_MRCA,',
'                       ''id_vhclo_lnea''              value v_id_vhclo_lnea_lq,',
'                       ''mdlo''                       value :P23_MDLO,',
'                       ''clndrje''                    value :P23_CLNDRJE,',
'                       ''fcha_cmpra''                 value :P23_FCHA_CMPRA,',
'                       ''fcha_mtrcla''                value :P23_FCHA_MTRCLA,',
'                       ''fcha_imprtcion''             value :P23_FCHA_IMPRTCION,',
'                       ''cdgo_vhclo_blndje''          value :P23_BLNDDO,',
'                       ''cdgo_vhclo_crrcria''         value :P23_VHCLO_CRRCRIA,',
'                       ''cdgo_vhclo_srvcio''          value :P23_VHCLO_SRVCIO,',
'                       ''cdgo_vhclo_oprcion''         value :P23_VHCLO_OPRCION,',
'                       ''cpcdad_crga''                value :P23_CPCDAD_CRGA,',
'                       ''cpcdad_psjro''               value :P23_CPCDAD_PSJRO,',
'                       ''vgncia_incio_lqdcoin''       value :P23_VGNCIA_INCIO_LQDCION,',
'                       ''nmro_mtor''                  value :P23_NMRO_MTOR,',
'                       ''nmro_chsis''                 value :P23_NMRO_CHSIS,',
'                       ''nmro_dclrcion_imprtcion''    value :P23_DCLRCION_IMPRTCION,',
'                       ''nmro_mtrcla''                value :P23_NMRO_MTRCLA,',
'                       ''avluo''                      value :P23_VLOR_FACTURA_OCULTO,',
'                       ''vlor_cmrcial''               value :P23_VLOR_CMRCIAL_OCLTO,',
'                       ''id_orgnsmo_trnsto''          value :P23_ORGNSMO_TRNSTO,',
'                       ''cdgo_vhclo_cmbstble''        value :P23_VHCLO_CMBSTBLE,',
'                       ''cdgo_vhclo_trnsmsion''       value :P23_VHCLO_TRNSMSION,',
'                       ''clsco_s_n''                  value :P23_CLSCO_S_N,',
'                       ''intrndo_s_n''                value :P23_INTRNDO_S_N,',
'                       ''id_asgrdra''                 value :P23_ASGRDRA,',
'                       ''nmro_soat''                  value :P23_NMRO_SOAT,',
'                       ''fcha_vncmnto_soat''          value :P23_FCHA_VNCMNTO_SOAT,',
'                       ''blnddo_s_n''                 value null,',
'                       ''drccion_ntfccion''            value (select p.c013',
'                                                             from APEX_collections p',
'                                                            where p.collection_name = ''RESPONSABLES_V''',
'                                                              and c001 = ''S''),',
'                        ''tlfno''	    value (select p.c014',
'                                                             from APEX_collections p',
'                                                            where p.collection_name = ''RESPONSABLES_V''',
'                                                              and c001 = ''S''),',
'                        ''email''	    value (select p.c015',
'                                                             from APEX_collections p',
'                                                            where p.collection_name = ''RESPONSABLES_V''',
'                                                              and c001 = ''S''),',
'                       ''rspnsble''                   value (select json_arrayagg( json_object(    ''cdgo_clnte''     	 value   :F_CDGO_CLNTE,',
'                                                                                                 ''cdgo_idntfccion_tpo''   value   p.c002,',
'                                                                                                 ''idntfccion''            value   p.c004,',
'                                                                                                 ''prmer_nmbre''           value   p.c005,',
'                                                                                                 ''sgndo_nmbre''           value   p.c006,',
'                                                                                                 ''prmer_aplldo''          value   p.c007,',
'                                                                                                 ''sgndo_aplldo''          value   p.c008,',
'                                                                                                 ''prncpal''      	     value   p.c001,',
'                                                                                                 ''cdgo_tpo_rspnsble''     value   p.c016,',
'                                                                                                 ''id_dprtmnto_ntfccion''  value   p.c009,',
'                                                                                                 ''id_dprtmnto''           value   p.c009,  ',
'                                                                                                 ''id_mncpio_ntfccion''    value   p.c011,',
'                                                                                                 ''drccion_ntfccion''      value   p.c013,',
'                                                                                                 ''drccion''               value   p.c013,',
'                                                                                                 ''email''           	     value   p.c015,',
'                                                                                                 ''tlfno''          	     value   p.c014,',
'                                                                                                 ''cllar''         	     value   null,',
'                                                                                                 ''actvo''                 value   p.c019,',
'                                                                                                 ''id_sjto_rspnsble''      value   p.c018 returning clob)returning clob)',
'                                                             from APEX_collections p',
'                                                            where p.collection_name = ''RESPONSABLES_V'') ',
'           ',
'                                                                                    ',
'           )',
'      into v_json                    ',
'      from dual;       ',
'   ',
'  /*     insert into muerto (c_001) values(''json_reg ''||v_json) ; ',
'    commit; ',
'*/',
'    ',
'    -- Registramos el vehiculo  ',
'    pkg_gi_vehiculos.prc_rg_sujeto_impuesto_vehiculos(p_json_v          => v_json,',
'                                                      o_sjto_impsto     => :P23_ID_SJTO_IMPSTO,',
'                                                      o_cdgo_rspsta     => v_cdgo_rpsta,',
'                                                      o_mnsje_rspsta    => v_mnsje_rspsta); ',
'                                                      v_cdgo_rpsta:= 0; ',
'    if(v_cdgo_rpsta != 0) then            ',
'            raise v_error;',
'    end if;      ',
'    ',
'    -- liquidamos Vigencia Actual',
'     -- Consultamos el ID periodo para la vigencia actual',
'    begin',
'        select id_prdo',
'          into v_id_prdo',
'          from df_i_periodos',
'         where cdgo_clnte        = :F_CDGO_CLNTE',
'           and id_impsto         = :P23_ID_IMPSTO',
'           and id_impsto_sbmpsto = :P23_ID_IMPSTO_SBIMPSTO',
'           and vgncia            = extract (year from sysdate);',
'    exception',
'           when no_data_found then',
'                   v_cdgo_rpsta   := 001;',
unistr('                   v_mnsje_rspsta := ''No se encontro el periodo para la liquidaci\00F3n actual.'';'),
'                   raise v_error;',
'    end;',
'    ',
'    ',
'     for c_archivo in ( select *',
'                          from apex_application_temp_files',
'                         where application_id = :APP_ID',
'                     ) ',
'    loop',
'    ',
'     pkg_gi_vehiculos.prc_a_adjunto_doc(p_id_sjto_impsto  =>:P23_ID_SJTO_IMPSTO,',
'                                           p_file_blob      => c_archivo.blob_content,',
'                                           p_file_name      => c_archivo.filename,',
'                                           p_file_mimetype  => c_archivo.mime_type,',
'                                           p_estdo          => ''S'', ',
'                                           p_orgn           => ''REG'',',
'                                           o_cdgo_rspsta    => v_cdgo_rpsta,',
'                                           o_mnsje_rspsta   => v_mnsje_rspsta);',
'    ',
'    ',
'    end loop; ',
'    ',
'    /*',
'      insert into muerto (c_001) values(''DATOS_LQUIDACION ''||v_json) ; ',
'    commit; */',
'   pkg_gi_vehiculos.prc_rg_liquidacion_vehiculo_general( p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                          p_id_impsto         => :P23_ID_IMPSTO,',
'                                                          p_id_impsto_sbmpsto => :P23_ID_IMPSTO_SBIMPSTO,',
'                                                          p_id_sjto_impsto    => :P23_ID_SJTO_IMPSTO,',
'                                                          p_vgncia            => extract (year from sysdate),',
'                                                          p_id_vhclo_lnea     => v_id_vhclo_lnea_lq,',
'                                                          p_clndrje           => :P23_CLNDRJE,',
'                                                          p_cdgo_vhclo_blndje => :P23_BLNDDO,',
'                                                          p_id_prdo           => v_id_prdo,',
'                                                          p_cdgo_lqdcion_tpo  => ''LB'',',
'                                                          p_id_usrio          => :F_ID_USRIO,',
'                                                          p_cdgo_prdcdad      => ''ANU'',',
'                                                          p_clse_ctgria        => :P23_VHCLO_CLSE,',
'                                                          p_cdgo_vhclo_mrca    => :P23_VHCLO_MRCA, ',
'                                                          p_cdgo_vhclo_srvcio  => :P23_VHCLO_SRVCIO,',
'                                                          p_cdgo_vhclo_oprcion => :P23_VHCLO_OPRCION,',
'                                                          p_cdgo_vhclo_crrcria => :P23_VHCLO_CRRCRIA,',
'                                                          p_mdlo               => :P23_MDLO, ',
'                                                          p_avluo             => :P23_VLOR_FACTURA_OCULTO, ',
'                                                          o_id_lqdcion        => v_o_id_lqdcion,',
'                                                          o_cdgo_rspsta       => v_cdgo_rpsta,',
'                                                          o_mnsje_rspsta      => v_mnsje_rspsta);',
'                                                          ',
'                                                          ',
'             delete from  apex_application_temp_files ;                                          ',
'                  v_cdgo_rpsta:= 0;                                       ',
'   if v_cdgo_rpsta <> 0 then',
'        raise v_error;',
'   end if;    ',
'/*commit;*/ ',
'exception ',
'        when v_error then',
'                rollback;  ',
'                raise_application_error(-20000 ,v_mnsje_rspsta);',
'end; ',
'',
'',
'',
''))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(87094656722714631)
,p_process_success_message=>unistr('se registr\00F3 y  liquid\00F3 vigencia actual con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87987173652116244)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Vaciar Colecci\00F3n al registrar')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe_coleccion boolean:= false;',
'     v_existe_coleccion2 boolean:= false;',
'begin   ',
'    v_existe_coleccion := apex_collection.collection_exists(p_collection_name => ''RESPONSABLES_V'');',
'    if(v_existe_coleccion)then',
'        apex_collection.truncate_collection( p_collection_name => ''RESPONSABLES_V'');',
'    end if;',
'    ',
'     v_existe_coleccion2 := apex_collection.collection_exists(p_collection_name => ''ARCHIVOS_VEHICULO_REG'');',
'     if(v_existe_coleccion2)then',
'        apex_collection.truncate_collection( p_collection_name => ''ARCHIVOS_VEHICULO_REG'');',
'    end if;',
'      delete from  apex_application_temp_files ;         ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(87094656722714631)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90990814089206514)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar datos'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(87094656722714631)
,p_process_when=>':P23_VGNCIA_INCIO_LQDCION is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(90991182812206517)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar datos al liquidar'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(87586998033478222)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidarPlaca'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_plca             varchar2(4000) := APEX_APPLICATION.g_x01;',
'    v_clnte            number         := APEX_APPLICATION.g_x02;',
'    v_id_impsto        number         := APEX_APPLICATION.g_x03;',
'    v_existe           char;     ',
'    o_cdgo_rspsta      number         := 0;',
'    o_mnsje_rspsta     varchar2(4000);',
'begin',
'    v_existe := pkg_gi_vehiculos.fnc_co_vehiculo_placa (p_cdgo_clnte => v_clnte,',
'                                                        p_id_impsto  => v_id_impsto,',
'                                                        p_plca       => v_plca);    ',
'        ',
'    if v_existe = 1  then        ',
'        o_cdgo_rspsta  := 1;',
'        o_mnsje_rspsta := ''El vehiculo con placa: ''||v_plca||'', ya se encuentra registrado en el sistema.'';',
'    end if;        ',
'    ',
'    if v_plca is null then ',
'        o_cdgo_rspsta  := 1;',
unistr('        o_mnsje_rspsta := ''Debe ingresar una placa de veh\00EDculo en el sistema.'';'),
'    end if;        ',
'    ',
'    -- Abrimos objeto json',
'    apex_json.open_object;',
'    -- Adicionamos datos al json',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    -- Cerramos objeto json',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89152739569061421)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validarMotor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_mtor        varchar2(4000) := APEX_APPLICATION.g_x01;',
'    v_clnte            number         := APEX_APPLICATION.g_x02;',
'    v_id_impsto        number         := APEX_APPLICATION.g_x03;',
'    o_cdgo_rspsta      number         := 0;',
'    o_mnsje_rspsta     varchar2(4000);',
'begin',
'    o_mnsje_rspsta := pkg_gi_vehiculos.fnc_co_vehiculo_nmro_mtor (p_cdgo_clnte => v_clnte,',
'                                                                  p_id_impsto  => v_id_impsto,',
'                                                                  p_nmro_mtor  => v_nmro_mtor);    ',
'        ',
'    if o_mnsje_rspsta is not null  then        ',
'        o_cdgo_rspsta  := 1;        ',
'    end if;        ',
'    ',
'    -- Abrimos objeto json',
'    apex_json.open_object;',
'    -- Adicionamos datos al json',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    -- Cerramos objeto json',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91642564497800203)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidarCilindraje'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        ',
'  cursor c1 (R_id_vhclo_grpo in number)is         ',
'       select d.clndrje_dsde',
'      from df_s_vehiculos_grupo d',
'       where d.id_vhclo_grpo = R_id_vhclo_grpo; ',
'      ',
'        v_clndrje         number;',
'        v_cdgo_vhclo_mrca varchar2(10);',
'        v_id_vhclo_lnea  number;',
'        v_vgncia         number;',
'        ',
'        ',
'begin',
unistr('   --recibiendo los par\00E1metros de ajax'),
'   ',
'  -- v_vgncia            := apex_application.g_x01;',
'   v_id_vhclo_lnea     := apex_application.g_x02;',
'  ---- v_cdgo_vhclo_mrca   := apex_application.g_x03;',
'',
'    for r1 in c1(v_id_vhclo_lnea) loop ',
'            v_clndrje := r1.clndrje_dsde;',
'    end loop; ',
'',
'                                             ',
'',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'' , 0);',
'    apex_json.write(''o_mnsje_rspsta'',''OK'');',
'    apex_json.write(''v_clndrje''     , v_clndrje);',
'    apex_json.close_object();',
'    ',
'exception when no_data_found then',
'',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'' , 1);',
'        apex_json.write(''o_mnsje_rspsta'',''No se encontro Cilindraje'');        ',
'        apex_json.write(''v_id_vhclo_lnea'' , v_id_vhclo_lnea);',
'        apex_json.write(''v_vgncia'' , v_vgncia);',
'        apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
