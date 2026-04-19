prompt --application/pages/page_00057
begin
wwv_flow_api.create_page(
 p_id=>57
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Ingresar Resolucion Manual Igac'
,p_step_title=>'Ingresar Resolucion Manual Igac'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function MensajeRespuesta(){',
'await apex.server.process("Validar_Resolucion", {',
'                pageItems: "#P57_RSLCION_IGAC,#P57_RDCCION_IGAC"',
'            },{',
'                success: function(data){',
'                    console.log(data);',
'                    if (data.o_cdgo_rspsta === 0){',
'                        /*Swal.fire(',
unistr('                                  ''<h2><b>\00A1Puede seguir el proceso!</b></h2>'','),
'                                  ''<h3>'' + data.o_mnsje_rspsta + ''</h3>'',',
'                                  ''success''',
'                                ).then((result) => {',
'                                    apex.navigation.dialog.close(true);',
'                                });*/',
'                        ',
'                        apex.item( "P57_TPO_TRMTE" ).show();',
'                        apex.item( "P57_CLSE_MTCION" ).show();',
'                        apex.item( "Datos_Predio" ).show();',
'                        apex.item( "Datos_Decretos" ).show();',
'                        apex.item( "BTN_GUARDAR" ).show();',
'                        apex.item( "BTN_GUARDAR" ).show();',
'                        apex.item( "Detalles_Decretos" ).show();',
'                        ',
'                        ',
'                    }else{',
'                        Swal.fire(',
unistr('                                  ''<h2><b>\00A1No puede seguir el proceso!</b></h2>'','),
'                                  ''<h3>'' + data.o_mnsje_rspsta+ ''</h3>'',',
'                                  ''error''',
'                                ).then((result) => {',
'                                    apex.navigation.dialog.close(true);',
'                                });',
'                        apex.item( "P57_TPO_TRMTE" ).hide();',
'                        apex.item( "P57_CLSE_MTCION" ).hide();',
'                        apex.item( "Datos_Predio" ).hide();',
'                        apex.item( "Datos_Decretos" ).hide();',
'                        apex.item( "BTN_GUARDAR" ).hide();',
'                        apex.item( "Detalles_Decretos" ).hide();',
'                   }',
'             }',
'      })',
'}',
'',
'',
'function DatosPredio(p_this){',
' ',
'    var item_vlor = p_this.triggeringElement.value;',
'    ',
unistr('    //Obtenemos el modelo de la regi\00F3n del InteractiveGrid de Liquidaci\00F3n'),
'    var datos_predio = apex.region("Datos_Predio").widget().interactiveGrid("getViews", "grid").model;',
'    ',
'    //Recorrido del InteractiveGrid',
'    if (item_vlor === ''C''){',
'    datos_predio.forEach(function(dato) {     ',
'            try{',
'                    apex.server.process(',
'                        ''Traer_Datos'',',
'                        {',
'                            x01: dato[datos_predio.getFieldKey("IDNTFCCION_SJTO")],',
'                            //x02: dato[datos_predio.getFieldKey("CNCLA_INSCRBE")].v',
'',
'                        }).then((resp) => {   ',
'                                console.log(''Respuesta:  '',resp);',
'                                datos_predio.setValue(dato,"CDGO_IDNTFCCION_TPO",resp.v_dscrpcion_idntfccion_tpo);',
'                                datos_predio.setValue(dato,"IDNTFCCION_RSPNSBLE",resp.v_idntfccion_rspnsble);',
'                                datos_predio.setValue(dato,"PRMER_NMBRE",resp.v_prmer_nmbre);',
'                                datos_predio.setValue(dato,"DRCCION",resp.v_drccion);',
'                                datos_predio.setValue(dato,"MTRCLA_INMBLRIA",resp.v_mtrcla_inmblria);',
'                                datos_predio.setValue(dato,"CDGO_DSTNO_IGAC",resp.v_cdgo_dstno_igac);',
'                                datos_predio.setValue(dato,"AREA_TRRNO",resp.v_area_trrno);',
'                                datos_predio.setValue(dato,"AREA_CNSTRDA",resp.v_area_cnstrda);',
'                                datos_predio.setValue(dato,"AVLUO_CTSTRAL",resp.v_avluo_ctstral);',
'                        });       ',
'',
'            } catch (e) {',
'                console.log(e);',
'            };',
'          });',
'    }',
'',
'}',
'',
''))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20210728080932'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138689948031627512)
,p_plug_name=>unistr('Datos Resoluci\00F3n Igac')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138752855888260412)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(138753004413260414)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
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
unistr('    <b>1.</b> Validar si existe la Resoluci\00F3n Igac. <br><br>'),
'    <b>2.</b> Primero debe ingresar todas las cancelaciones y despues las incripciones respectivamente. <br><br>',
'    <b>3.</b> Si los datos no existen en el sistema permite el registros de estos. <br><br>',
'    <b>4.</b> Descarga un archivo en formato txt para despues ser cargado y procesado.',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(140118730465844311)
,p_plug_name=>'Datos Detalles - Decretos'
,p_region_name=>'Detalles_Decretos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P57_ID_RSLCION_IGAC_MNUAL'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138691224479627525)
,p_plug_name=>'Datos Predio'
,p_region_name=>'Datos_Predio'
,p_parent_plug_id=>wwv_flow_api.id(140118730465844311)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    id_rslcion_igac_mnual_dtlle,',
'    idntfccion_sjto,',
'    cdgo_idntfccion_tpo,',
'    idntfccion_rspnsble,',
'    prmer_nmbre,',
'    drccion,',
'    mtrcla_inmblria,',
'    cdgo_dstno_igac,',
'    cncla_inscrbe,',
'    fcha_ingrso,',
'    avluo_ctstral,',
'    area_trrno,',
'    area_cnstrda,',
'    id_rslcion_igac_mnual',
'from si_g_rslcion_igac_mnual_dtlle ',
'where id_rslcion_igac_mnual=:P57_ID_RSLCION_IGAC_MNUAL;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P57_ID_RSLCION_IGAC_MNUAL'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138691423255627527)
,p_name=>'ID_RSLCION_IGAC_MNUAL_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RSLCION_IGAC_MNUAL_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138691552975627528)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Referencia Catastral'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(138691609809627529)
,p_name=>'CDGO_IDNTFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Codigo Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_idntfccion_tpo as d,',
'       cdgo_idntfccion_tpo as r',
'       from df_s_identificaciones_tipo',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138691741316627530)
,p_name=>'IDNTFCCION_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(138691846587627531)
,p_name=>'PRMER_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRMER_NMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nombres y Apellidos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(138691906264627532)
,p_name=>'DRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(138692073051627533)
,p_name=>'MTRCLA_INMBLRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MTRCLA_INMBLRIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Matricula Inmobiliaria'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(138692149449627534)
,p_name=>'CDGO_DSTNO_IGAC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_DSTNO_IGAC'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Destino'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_dstno_igac as d, ',
'       cdgo_dstno_igac as r',
'       from df_s_destinos_igac'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138692692902627539)
,p_name=>'CNCLA_INSCRBE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNCLA_INSCRBE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Cancela o Inscribe'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Cancela'' as d,',
'       ''C'' as r',
'       from dual',
'union',
'select ''Inscribe'' as d,',
'       ''I'' as r',
'       from dual'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138692751969627540)
,p_name=>'ID_RSLCION_IGAC_MNUAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RSLCION_IGAC_MNUAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P57_ID_RSLCION_IGAC_MNUAL'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138692816208627541)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138692999098627542)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138936851612605512)
,p_name=>'FCHA_INGRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INGRSO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Vigencia Fiscal'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
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
 p_id=>wwv_flow_api.id(138939537549605539)
,p_name=>'AVLUO_CTSTRAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AVLUO_CTSTRAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Aval\00FAo Catastral')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(138939622867605540)
,p_name=>'AREA_TRRNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_TRRNO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00C1rea Terreno')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(138939708044605541)
,p_name=>'AREA_CNSTRDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_CNSTRDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00C1rea Construida')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(138691337827627526)
,p_internal_uid=>138691337827627526
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'ACTIONS_MENU:SAVE'
,p_enable_save_public_report=>true
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
 p_id=>wwv_flow_api.id(138735858134719935)
,p_interactive_grid_id=>wwv_flow_api.id(138691337827627526)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(138735987137719935)
,p_report_id=>wwv_flow_api.id(138735858134719935)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138736471957719951)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(138691423255627527)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138736950653719962)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(138691552975627528)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138737497278719964)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(138691609809627529)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138737970976719966)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(138691741316627530)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138738331191719982)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(138691846587627531)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138738811750719984)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(138691906264627532)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138739398274719986)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(138692073051627533)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138739829324719988)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(138692149449627534)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138742345156719996)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(138692692902627539)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138742873752719997)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(138692751969627540)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138744093169723910)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(138692816208627541)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139084569366274066)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(138936851612605512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139464332590400861)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(138939537549605539)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139464803868400863)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(138939622867605540)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139465392172400865)
,p_view_id=>wwv_flow_api.id(138735987137719935)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(138939708044605541)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138693247888627545)
,p_plug_name=>'Datos Decretos'
,p_region_name=>'Datos_Decretos'
,p_parent_plug_id=>wwv_flow_api.id(140118730465844311)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    id_rslcion_igac_mnual_dcrts,',
'    dcrto,',
'    avluo_ctstral,',
'    fecha_vgncia_fscal,',
'    id_rslcion_igac_mnual_dtlle',
'from si_g_rslcion_igac_mnual_dcrts'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(138691224479627525)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P57_ID_RSLCION_IGAC_MNUAL'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138693415942627547)
,p_name=>'ID_RSLCION_IGAC_MNUAL_DCRTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RSLCION_IGAC_MNUAL_DCRTS'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138751786363260401)
,p_name=>'AVLUO_CTSTRAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AVLUO_CTSTRAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Avalu\00F3 Catastral')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990D00'
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
 p_id=>wwv_flow_api.id(138751912193260403)
,p_name=>'FECHA_VGNCIA_FSCAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_VGNCIA_FSCAL'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Vigencia Fiscal'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
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
 p_id=>wwv_flow_api.id(138752013856260404)
,p_name=>'ID_RSLCION_IGAC_MNUAL_DTLLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RSLCION_IGAC_MNUAL_DTLLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(138691423255627527)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138752158126260405)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138752202889260406)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(138753470565260418)
,p_name=>'DCRTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DCRTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Decreto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(138693334069627546)
,p_internal_uid=>138693334069627546
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'ACTIONS_MENU:SAVE'
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
 p_id=>wwv_flow_api.id(138757381183270142)
,p_interactive_grid_id=>wwv_flow_api.id(138693334069627546)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(138757414412270142)
,p_report_id=>wwv_flow_api.id(138757381183270142)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138757987609270143)
,p_view_id=>wwv_flow_api.id(138757414412270142)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(138693415942627547)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138759949701270158)
,p_view_id=>wwv_flow_api.id(138757414412270142)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(138751786363260401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138760989022270161)
,p_view_id=>wwv_flow_api.id(138757414412270142)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(138751912193260403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138761482553270169)
,p_view_id=>wwv_flow_api.id(138757414412270142)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(138752013856260404)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138762675742273494)
,p_view_id=>wwv_flow_api.id(138757414412270142)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(138752158126260405)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(138809244317183211)
,p_view_id=>wwv_flow_api.id(138757414412270142)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(138753470565260418)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138690938262627522)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(138689948031627512)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(88588617354834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P57_ID_RSLCION_IGAC_MNUAL'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138752909642260413)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(138752855888260412)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138756448570260448)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(138752855888260412)
,p_button_name=>'BTN_PROCESAR_ARCHIVO_PLANO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Archivo Plano'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Confirmar AcciÃ³n?'',''BTN_PROCESAR_ARCHIVO_PLANO'');'
,p_button_condition=>'P57_ID_RSLCION_IGAC_MNUAL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-code-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138937497255605518)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(138689948031627512)
,p_button_name=>'BTN_ACTUALIZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(88588617354834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P57_ID_RSLCION_IGAC_MNUAL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(138937644294605520)
,p_branch_name=>'Go To Page 57'
,p_branch_action=>'f?p=&APP_ID.:57:&SESSION.:BTN_PROCESAR_ARCHIVO_PLANO:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'BRANCH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138690004974627513)
,p_name=>'P57_ID_RSLCION_IGAC_MNUAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(138689948031627512)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138690160894627514)
,p_name=>'P57_RSLCION_IGAC'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(138689948031627512)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Resoluci\00F3n Igac')
,p_source=>'RSLCION_IGAC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138690251781627515)
,p_name=>'P57_RDCCION_IGAC'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(138689948031627512)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Radicaci\00F3n Igac')
,p_source=>'RDCCION_IGAC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138690398107627516)
,p_name=>'P57_FCHA_RSLCION_IGAC'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(138689948031627512)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha Resoluci\00F3n')
,p_source=>'FCHA_RSLCION_IGAC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138690461446627517)
,p_name=>'P57_TPO_TRMTE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(138689948031627512)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Tramite'
,p_source=>'TPO_TRMTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_trmte_tpo ||'' - ''|| dscrpcion as d,',
'        cdgo_trmte_tpo as r',
'    from df_s_tramites_tipo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138690518358627518)
,p_name=>'P57_CLSE_MTCION'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(138689948031627512)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Clase Mutaci\00F3n')
,p_source=>'CLSE_MTCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_mtcion_clse ||'' - ''|| dscrpcion as d,',
'       cdgo_mtcion_clse as r',
' from df_s_mutaciones_clase'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138753175003260415)
,p_name=>'P57_F_ID_USRIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(138689948031627512)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_ID_USRIO'
,p_item_default_type=>'ITEM'
,p_source=>'ID_USRIO_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138752446182260408)
,p_name=>'Al_cambiar_resolucion_o_radicacion'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P57_RSLCION_IGAC,P57_RDCCION_IGAC'
,p_condition_element=>'P57_RSLCION_IGAC'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138752539182260409)
,p_event_id=>wwv_flow_api.id(138752446182260408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'MensajeRespuesta();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(140117892384844302)
,p_event_id=>wwv_flow_api.id(138752446182260408)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(138690938262627522)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(140117731211844301)
,p_event_id=>wwv_flow_api.id(138752446182260408)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(138690938262627522)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138753256207260416)
,p_name=>'Al cambiar'
,p_event_sequence=>20
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(138691224479627525)
,p_triggering_element=>'CNCLA_INSCRBE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138753381000260417)
,p_event_id=>wwv_flow_api.id(138753256207260416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'DatosPredio(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138937202220605516)
,p_name=>'Al_Hacer_Clic'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(138756448570260448)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138937926586605523)
,p_event_id=>wwv_flow_api.id(138937202220605516)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_dcmnto_lte      number;',
'    v_id_prcso_crga      number;',
'',
'begin',
'    pkg_si_resolucion_predio.prc_gn_archvo_dscrga_rslcion ( p_cdgo_clnte                => :F_CDGO_CLNTE,',
'                                                            p_id_rslcion_igac_mnual     => :P57_ID_RSLCION_IGAC_MNUAL,',
'                                                            p_id_dprtmnto_clnte         => :F_CDGO_DPRTMNTO_CLNTE,',
'                                                            p_id_mncpio_clnte           => :F_CDGO_MNCPIO_CLNTE,',
'                                                            o_id_prcso_crga             => v_id_prcso_crga,',
'                                                            o_cdgo_rspsta                => v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta               => v_mnsje_rspsta);',
'',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(140118876504844312)
,p_name=>'Al Guardar'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(138691224479627525)
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'FCHA_INGRSO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(140118929759844313)
,p_event_id=>wwv_flow_api.id(140118876504844312)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item( "Datos_Decretos" ).show();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(140119018364844314)
,p_event_id=>wwv_flow_api.id(140118876504844312)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item( "Datos_Decretos" ).hide();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138690785500627520)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Guardar_Datos_SI_G_RSLCION_IGAC_MNUAL'
,p_attribute_02=>'SI_G_RSLCION_IGAC_MNUAL'
,p_attribute_03=>'P57_ID_RSLCION_IGAC_MNUAL'
,p_attribute_04=>'ID_RSLCION_IGAC_MNUAL'
,p_attribute_09=>'P57_ID_RSLCION_IGAC_MNUAL'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Proceso ejecutado con exito.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138693051310627543)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(138691224479627525)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Datos Predio - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138752369721260407)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(138693247888627545)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Datos Decretos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138691167847627524)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Recuperar_Datos_SI_G_RSLCION_IGAC_MNUAL'
,p_attribute_02=>'SI_G_RSLCION_IGAC_MNUAL'
,p_attribute_03=>'P57_ID_RSLCION_IGAC_MNUAL'
,p_attribute_04=>'ID_RSLCION_IGAC_MNUAL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P57_ID_RSLCION_IGAC_MNUAL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138937596349605519)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_dcmnto_lte      number;',
'    v_id_prcso_crga      number;',
'',
'begin',
'    pkg_si_resolucion_predio.prc_gn_archvo_dscrga_rslcion ( p_cdgo_clnte                => :F_CDGO_CLNTE,',
'                                                            p_id_rslcion_igac_mnual     => :P57_ID_RSLCION_IGAC_MNUAL,',
'                                                            p_id_dprtmnto_clnte         => :F_ID_DPRTMNTO_CLNTE,',
'                                                            p_id_mncpio_clnte           => :F_ID_MNCPIO_CLNTE,',
'                                                            o_id_prcso_crga             => v_id_prcso_crga,',
'                                                            o_cdgo_rspsta                => v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta               => v_mnsje_rspsta);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(138756448570260448)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138691098120627523)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Traer_Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        v_dscrpcion_idntfccion_tpo     df_s_identificaciones_tipo.cdgo_idntfccion_tpo%type;',
'        v_idntfccion_rspnsble          v_si_i_sujetos_responsable.idntfccion_rspnsble%type;',
'        v_prmer_nmbre1                  v_si_i_sujetos_responsable.prmer_nmbre%type;',
'        v_sgndo_nmbre                   v_si_i_sujetos_responsable.sgndo_nmbre%type;',
'        v_prmer_aplldo                  v_si_i_sujetos_responsable.prmer_aplldo%type;',
'        v_sgndo_aplldo                  v_si_i_sujetos_responsable.sgndo_aplldo%type;',
'        v_prmer_nmbre                  varchar2(300);',
'        v_drccion                      v_si_i_sujetos_responsable.drccion%type;',
'        v_mtrcla_inmblria              v_si_i_predios.mtrcla_inmblria%type;',
'        v_cdgo_dstno_igac              v_si_i_predios.cdgo_dstno_igac%type;',
'        v_area_trrno                   varchar2(50);',
'        v_area_cnstrda                 varchar2(50);',
'        v_avluo_ctstral                varchar2(50);',
'        v_idntfccion_sjto              varchar2(50) := apex_application.g_x01;',
'        ',
'begin',
unistr('   --recibiendo los par\00E1metros de ajax'),
'   ',
'   ',
'   for c_datos in (   ',
'                       select',
'                            c.cdgo_idntfccion_tpo,',
'                            a.idntfccion_rspnsble,',
'                            a.prmer_nmbre,',
'                            a.sgndo_nmbre,',
'                            a.prmer_aplldo,',
'                            a.sgndo_aplldo,',
'                            a.drccion,',
'                            b.mtrcla_inmblria,',
'                            b.cdgo_dstno_igac,',
'                            b.area_trrno,',
'                            b.area_cnstrda,',
'                            b.avluo_ctstral',
'                        from v_si_i_sujetos_responsable a join v_si_i_predios b on a.id_sjto_impsto=b.id_sjto_impsto ',
'                                                          join df_s_identificaciones_tipo c on a.dscrpcion_idntfccion_tpo = c.dscrpcion_idntfccion_tpo',
'                        where a.idntfccion_sjto = v_idntfccion_sjto',
'                        fetch first 1 rows only',
'                    ) ',
'    loop',
'            v_dscrpcion_idntfccion_tpo := c_datos.cdgo_idntfccion_tpo;',
'            v_idntfccion_rspnsble      := c_datos.idntfccion_rspnsble;',
'            v_prmer_nmbre1             := c_datos.prmer_nmbre;',
'            v_sgndo_nmbre              := c_datos.sgndo_nmbre;',
'            v_prmer_aplldo              := c_datos.prmer_aplldo;',
'            v_sgndo_aplldo              := c_datos.sgndo_aplldo;',
'            v_drccion                  := c_datos.drccion;',
'            v_mtrcla_inmblria          := c_datos.mtrcla_inmblria;',
'            v_cdgo_dstno_igac          := c_datos.cdgo_dstno_igac;',
'            v_area_trrno               := c_datos.area_trrno;',
'            v_area_cnstrda             := c_datos.area_cnstrda;',
'            v_avluo_ctstral            := c_datos.avluo_ctstral;',
'            v_prmer_nmbre              := v_prmer_nmbre1||'' ''||v_sgndo_nmbre||'' ''||v_prmer_aplldo||'' ''||v_sgndo_aplldo;',
'    end loop;',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'' , 0);',
'    apex_json.write(''o_mnsje_rspsta'',''OK'');',
'    apex_json.write(''v_dscrpcion_idntfccion_tpo'', v_dscrpcion_idntfccion_tpo);',
'    apex_json.write(''v_idntfccion_rspnsble''     , v_idntfccion_rspnsble);',
'    apex_json.write(''v_prmer_nmbre''             , v_prmer_nmbre);',
'    apex_json.write(''v_drccion''                 , v_drccion);',
'    apex_json.write(''v_mtrcla_inmblria''         , v_mtrcla_inmblria);',
'    apex_json.write(''v_cdgo_dstno_igac''         , v_cdgo_dstno_igac);',
'    apex_json.write(''v_area_trrno''              , v_area_trrno);',
'    apex_json.write(''v_area_cnstrda''            , v_area_cnstrda);',
'    apex_json.write(''v_avluo_ctstral''           , v_avluo_ctstral);',
'    apex_json.close_object();',
'    ',
'exception when others then',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'' , 1);',
'    apex_json.write(''o_mnsje_rspsta'',''No se encontro el Registro Predial'' || sqlerrm);        ',
'    apex_json.write(''v_vgncia'' , v_idntfccion_sjto);',
'    apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138693109886627544)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar_Resolucion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(4000);',
'    v_resolucion number;',
'    v_radicacion number;',
'begin',
'    for c_rslcion in (select rslcion, rdccion        ',
'                        from si_g_resolucion_igac_t1',
'                        where rslcion = :P57_RSLCION_IGAC',
'                        and rdccion   = :P57_RDCCION_IGAC',
'                        union',
'                        select RSLCION_IGAC,RDCCION_IGAC',
'                        from si_g_rslcion_igac_mnual',
'                        where RSLCION_IGAC = :P57_RSLCION_IGAC',
'                        and RDCCION_IGAC   = :P57_RDCCION_IGAC',
'                        fetch first 1 rows only',
'                        )',
'    loop',
'        v_resolucion := c_rslcion.rslcion;',
'        v_radicacion := c_rslcion.rdccion;',
'    end loop;',
'    if(v_resolucion is not null and v_radicacion is not null) then',
'        v_cdgo_rspsta := 1;',
unistr('        v_mnsje_rspsta := ''La resoluci\00F3n ya esta en base de datos.'';'),
'    end if;',
'    if(v_resolucion is null and v_radicacion is null) then',
'        v_cdgo_rspsta := 0;',
unistr('        v_mnsje_rspsta := ''La resoluci\00F3n no esta en base de datos.'';'),
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'' , v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
