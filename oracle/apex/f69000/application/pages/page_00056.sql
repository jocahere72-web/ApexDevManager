prompt --application/pages/page_00056
begin
wwv_flow_api.create_page(
 p_id=>56
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Registro Manual Resoluciones Igac'
,p_step_title=>'Registro Manual Resoluciones Igac'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function MensajeRespuesta(){',
'await apex.server.process("Validar_Resolucion", {',
'                pageItems: "#P56_RSLCION_IGAC,#P56_RDCCION_IGAC"',
'            },{',
'                success: function(data){',
'                    console.log(data);',
'                    if (data.o_cdgo_rspsta === 0){',
'                        Swal.fire(',
unistr('                                  ''<h2><b>\00A1Puede seguir el proceso!</b></h2>'','),
'                                  ''<h3>'' + data.o_mnsje_rspsta + ''</h3>'',',
'                                  ''success''',
'                                ).then((result) => {',
'                                    apex.navigation.dialog.close(true);',
'                                });',
'                        ',
'                        apex.item( "P56_TPO_TRMTE" ).show();',
'                        apex.item( "P56_CLSE_MTCION" ).show();',
'                        apex.item( "BTN_GUARDAR" ).show();',
'                    }else{',
'                        Swal.fire(',
unistr('                                  ''<h2><b>\00A1No puede seguir el proceso!</b></h2>'','),
'                                  ''<h3>'' + data.o_mnsje_rspsta+ ''</h3>'',',
'                                  ''error''',
'                                ).then((result) => {',
'                                    apex.navigation.dialog.close(true);',
'                                });',
'                        apex.item( "P56_TPO_TRMTE" ).hide();',
'                        apex.item( "P56_CLSE_MTCION" ).hide();',
'                        apex.item( "BTN_GUARDAR" ).hide();',
'                    }',
'',
'',
'                }',
'            })',
'}',
'',
'function DatosPredio2(){',
unistr('    //Obtenemos el modelo de la regi\00F3n del InteractiveGrid de Liquidaci\00F3n'),
'    var datos_predio = apex.region("Datos_Predio").widget().interactiveGrid("getViews", "grid").model;',
'    var item = apex.item( "P56_CNCLA_INSCRBE" ).getValue();',
'    var item2 = apex.item( "P56_ID_FORANEA" ).getValue();',
'',
'    //Recorrido del InteractiveGrid',
'    datos_predio.forEach(function(dato) {',
'        try{',
'                apex.server.process(',
'                    ''Traer_Datos'',',
'                    {',
'                        x01: dato[datos_predio.getFieldKey("IDNTFCCION_SJTO")]',
'                       ',
'                    }).then((resp) => {              ',
'                            console.log(''Respuesta:  '',resp);',
'                            datos_predio.setValue(dato,"CDGO_IDNTFCCION_TPO",resp.v_dscrpcion_idntfccion_tpo);',
'                            datos_predio.setValue(dato,"IDNTFCCION_RSPNSBLE",resp.v_idntfccion_rspnsble);',
'                            datos_predio.setValue(dato,"PRMER_NMBRE",resp.v_prmer_nmbre);',
'                            datos_predio.setValue(dato,"DRCCION",resp.v_drccion);',
'                            datos_predio.setValue(dato,"MTRCLA_INMBLRIA",resp.v_mtrcla_inmblria);',
'                            datos_predio.setValue(dato,"CDGO_DSTNO_IGAC",resp.v_cdgo_dstno_igac);',
'                            datos_predio.setValue(dato,"AREA_TRRNO",resp.v_area_trrno);',
'                            datos_predio.setValue(dato,"AREA_CNSTRDA",resp.v_area_cnstrda);',
'                            datos_predio.setValue(dato,"AVLUO_CTSTRAL",resp.v_avluo_ctstral);',
'                            datos_predio.setValue(dato,"CNCLA_INSCRBE",item);',
'                            datos_predio.setValue(dato,"ID_RSLCION_IGAC_MNUAL",item2);',
'                    });       ',
'',
'        } catch (e) {',
'            console.log(e);',
'        };',
'     ',
'    });',
'}',
'',
'/*function Valor(){',
'    var datos_predio = apex.region("Datos_Predio").widget().interactiveGrid("getViews", "grid").model;',
'    var item = apex.item( "P56_CNCLA_INSCRBE" ).getValue();',
'    var item2 = apex.item( "P56_RSLCION_IGAC" ).getValue();',
'    datos_predio.forEach(function(dato) {',
'        datos_predio.setValue(dato,"CNCLA_INSCRBE",item);',
'        datos_predio.setValue(dato,"ID_RSLCION_IGAC_MNUAL",item2);',
'    });',
'}*/',
''))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20210727082639'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138069061306473037)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138069203051473039)
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
unistr('    <b>1.</b> Muestra todas las resoluciones digitas por el usuario en sesi\00F3n. <br><br>'),
'    <b>2.</b> Permite hacer una busqueda de las resoluciones por fechas. <br><br>',
unistr('    <b>3.</b> Permite ir a realizar una nueva resoluci\00F3n. <br><br>'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138753546057260419)
,p_plug_name=>'Consultar Resoluciones Digitadas'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138754032407260424)
,p_plug_name=>'Resoluciones Igac'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'      a.id_rslcion_igac_mnual',
'    , a.rslcion_igac',
'    , a.rdccion_igac',
'    , a.fcha_rslcion_igac',
'    , a.tpo_trmte',
'    , a.clse_mtcion',
'    , b.nmbre_trcro',
'    , a.fcha_ingrsa_rslcion',
'    from si_g_rslcion_igac_mnual a join v_sg_g_usuarios b on a.id_usrio_dgta=b.id_usrio',
'    where /*a.id_usrio_dgta = :F_ID_USRIO',
'          and*/ ((trunc(a.fcha_ingrsa_rslcion) 			between :P56_FECHA_INICIAL 	and :P56_FECHA_FINAL)',
'           or (trunc(a.fcha_ingrsa_rslcion) 		>= :P56_FECHA_INICIAL 	and :P56_FECHA_FINAL 			is null) ',
'           or (trunc(a.fcha_ingrsa_rslcion) 		<= :P56_FECHA_FINAL 			and :P56_FECHA_INICIAL  		is null)',
'           or (:P56_FECHA_INICIAL 			is null 					and :P56_FECHA_FINAL 			is null))'))
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
 p_id=>wwv_flow_api.id(138755196762260435)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'15'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:57:&SESSION.::&DEBUG.:RP,57:P57_ID_RSLCION_IGAC_MNUAL:#ID_RSLCION_IGAC_MNUAL#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'PSOTTER'
,p_internal_uid=>138755196762260435
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138755266081260436)
,p_db_column_name=>'RSLCION_IGAC'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Resoluci\00F3n Igac')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138755370138260437)
,p_db_column_name=>'RDCCION_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Radicaci\00F3n Igac')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138755460699260438)
,p_db_column_name=>'FCHA_RSLCION_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Fecha Resoluci\00F3n Igac')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138755504581260439)
,p_db_column_name=>'TPO_TRMTE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tipo Tramite'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138755634203260440)
,p_db_column_name=>'CLSE_MTCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Clase Mutaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138755882446260442)
,p_db_column_name=>'FCHA_INGRSA_RSLCION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Fecha de Registro Resoluci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138755924776260443)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Nombre Digitador'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(138756353269260447)
,p_db_column_name=>'ID_RSLCION_IGAC_MNUAL'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Id Rslcion Igac Mnual'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(138854092718698554)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1388541'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RSLCION_IGAC:RDCCION_IGAC:FCHA_RSLCION_IGAC:TPO_TRMTE:CLSE_MTCION:FCHA_INGRSA_RSLCION:NMBRE_TRCRO:ID_RSLCION_IGAC_MNUAL'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138069170690473038)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(138069061306473037)
,p_button_name=>unistr('BTN_INGRESAR_RESOLUCI\00D3N')
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Ingresar Resoluci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:57:&SESSION.::&DEBUG.:RP,57::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138756136425260445)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(138753546057260419)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(88588617354834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(137942984679167761)
,p_branch_action=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138753711677260421)
,p_name=>'P56_FECHA_INICIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(138753546057260419)
,p_prompt=>'Fecha Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138753864032260422)
,p_name=>'P56_FECHA_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(138753546057260419)
,p_prompt=>'Fecha Final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138065409674473001)
,p_name=>'Al cambiar'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P56_CNCLA_INSCRBE'
,p_condition_element=>'P56_CNCLA_INSCRBE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138498098022726210)
,p_name=>'Al_cambiar'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P56_CLSE_MTCION'
,p_condition_element=>'P56_CLSE_MTCION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138689157438627504)
,p_name=>'Al_cambiar2'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P56_CNCLA_INSCRBE'
,p_condition_element=>'P56_CNCLA_INSCRBE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
