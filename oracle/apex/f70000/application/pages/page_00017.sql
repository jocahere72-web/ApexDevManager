prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Informaci\00F3n de Predio')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Informaci\00F3n Predio')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190506143156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68704618850072611)
,p_plug_name=>unistr('Informaci\00F3n de Predio')
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--fillLabels:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68690063513955901)
,p_plug_name=>'<b>Predio Existente</b>'
,p_parent_plug_id=>wwv_flow_api.id(68704618850072611)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P17_ID_SJTO_IMPSTO'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(106021547053793401)
,p_plug_name=>'<b>Archivo</b>'
,p_parent_plug_id=>wwv_flow_api.id(68704618850072611)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68690740274955908)
,p_name=>'P17_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(106021547053793401)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68703741589072602)
,p_name=>'P17_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>unistr('Direcci\00F3n:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68704817418072613)
,p_name=>'P17_ID_PRDIO_DSTNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>'Destino:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68704938018072614)
,p_name=>'P17_CDGO_ESTRTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>'Estrato:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68705042000072615)
,p_name=>'P17_CDGO_DSTNO_IGAC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>'Destino IGAC:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68705190425072616)
,p_name=>'P17_CDGO_PRDIO_CLSFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>unistr('Clasificaci\00F3n:')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68705271612072617)
,p_name=>'P17_ID_PRDIO_USO_SLO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>'Uso del Suelo:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68705798408072622)
,p_name=>'P17_MTRCLA_INMBLRIA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>unistr('Matr\00EDcula Inmobiliaria:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68705931409072624)
,p_name=>'P17_AVLUO_CTSTRAL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>unistr('Aval\00FAo Catastral:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68706044839072625)
,p_name=>'P17_AVLUO_CMRCIAL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>unistr('Aval\00FAo Comercial:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68706156810072626)
,p_name=>'P17_AREA_TRRNO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>unistr('\00C1rea Terreno:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68706208990072627)
,p_name=>'P17_AREA_CNSTRDA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>unistr('\00C1rea Construida:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68706337698072628)
,p_name=>'P17_AREA_GRVBLE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(68690063513955901)
,p_prompt=>unistr('\00C1rea Gravable:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106100160403942001)
,p_name=>'P17_ID_PRCSO_CRGA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(106021547053793401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106100260200942002)
,p_name=>'P17_DSTNO_ECNMCO_IGAC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(106021547053793401)
,p_prompt=>'Destino Igac:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106100316037942003)
,p_name=>'P17_AREA_TRRNO_IGAC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(106021547053793401)
,p_prompt=>unistr('\00C1rea Terreno:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106100402925942004)
,p_name=>'P17_AREA_CNSTRDA_IGAC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(106021547053793401)
,p_prompt=>unistr('\00C1rea  Construida:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106100562739942005)
,p_name=>'P17_AVLUO_IGAC'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(106021547053793401)
,p_prompt=>unistr('Avalu\00F3:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106100644797942006)
,p_name=>'P17_DRCCION_PRDIO_IGAC'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(106021547053793401)
,p_prompt=>unistr('Direcci\00F3n:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106100832095942008)
,p_name=>'P17_IDNTFCCION_VISUAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(106021547053793401)
,p_prompt=>'Referencia:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106100933497942009)
,p_name=>'P17_ID_SJTO_IMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(106021547053793401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68707297240072637)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener Datos Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'        select a.drccion',
'             , b.dscrpcion_prdo_dstno',
'             , b.dscrpcion_estrto',
'             , b.nmbre_dstno_igac',
'             , b.cdgo_prdio_clsfccion',
'             , b.dscrpcion_uso_suelo',
'             , b.mtrcla_inmblria',
'             , to_char(b.avluo_ctstral , ''FM999G999G999G999G999G999G990'' ) ',
'             , to_char(b.avluo_cmrcial , ''FM999G999G999G999G999G999G990'' ) ',
'             , (b.area_trrno|| '' '' || ''mts2'')',
'             , (b.area_cnstrda|| '' '' || ''mts2'')',
'             , (b.area_grvble|| '' '' || ''mts2'')',
'             , a.id_sjto_impsto',
'         into :P17_DRCCION',
'            , :P17_ID_PRDIO_DSTNO',
'            , :P17_CDGO_ESTRTO',
'            , :P17_CDGO_DSTNO_IGAC',
'            , :P17_CDGO_PRDIO_CLSFCCION',
'            , :P17_ID_PRDIO_USO_SLO',
'            , :P17_MTRCLA_INMBLRIA',
'            , :P17_AVLUO_CTSTRAL',
'            , :P17_AVLUO_CMRCIAL',
'            , :P17_AREA_TRRNO',
'            , :P17_AREA_CNSTRDA',
'            , :P17_AREA_GRVBLE',
'            , :P17_ID_SJTO_IMPSTO',
'        from v_si_i_sujetos_impuesto a',
'        join v_si_i_predios b on a.id_sjto_impsto = b.id_sjto_impsto',
'       where a.idntfccion_sjto = :P17_IDNTFCCION;',
'       ',
'exception     ',
'     when no_data_found then ',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106021642055793402)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Datos Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select dstno_ecnmco_igac',
'         , to_char(  area_trrno_igac , ''FM999G999G999G999G999G999G990'' ) || '' mts2''',
'         , to_char(  area_cnstrda_igac , ''FM999G999G999G999G999G999G990'' ) || '' mts2''',
'         , to_char( avluo_igac , ''FM999G999G999G999G999G999G990'' )',
'         , drccion_prdio_igac',
'         , pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => rfrncia_igac, p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' )',
'      into :P17_DSTNO_ECNMCO_IGAC',
'         , :P17_AREA_TRRNO_IGAC',
'         , :P17_AREA_CNSTRDA_IGAC',
'         , :P17_AVLUO_IGAC',
'         , :P17_DRCCION_PRDIO_IGAC',
'         , :P17_IDNTFCCION_VISUAL',
'      from gi_g_cinta_igac ',
'     where id_prcso_crga   = :P17_ID_PRCSO_CRGA',
'       and nmro_orden_igac = ''001''',
'       and rfrncia_igac    = :P17_IDNTFCCION;',
'exception ',
'     when no_data_found then',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
