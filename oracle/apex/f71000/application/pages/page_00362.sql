prompt --application/pages/page_00362
begin
wwv_flow_api.create_page(
 p_id=>362
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Detalle T\00EDtulo Judicial')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Detalle T\00EDtulo Judicial')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20231031153957'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153327387046851602)
,p_plug_name=>'General'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153327545488851604)
,p_plug_name=>unistr('Informaci\00F3n General<style> 	#info_gen .t-Region-headerItems--title  	{background-color: #99CBF5;color:black; 	} 	#info_gen:hover{box-shadow: 0px 0px 13px -3px rgba(0,0,0,0.6);transition: box-shadow 0.5s; 	} 	#info_gen{border-color:#D9D6D0;}	 </style>')
,p_region_name=>'info_gen'
,p_parent_plug_id=>wwv_flow_api.id(153327387046851602)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153327930363851608)
,p_plug_name=>unistr('Informaci\00F3n Demandado<style> 	#info_ddo .t-Region-headerItems--title  	{background-color: #99CBF5;color:black; 	} 	#info_ddo:hover{box-shadow: 0px 0px 13px -3px rgba(0,0,0,0.6);transition: box-shadow 0.5s; 	} 	#info_ddo{border-color:#D9D6D0;}	 </styl')
||'e>'
,p_region_name=>'info_ddo'
,p_parent_plug_id=>wwv_flow_api.id(153327387046851602)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153328232674851611)
,p_plug_name=>unistr('Informaci\00F3n Demandante<style> 	#info_dte .t-Region-headerItems--title  	{background-color: #99CBF5;color:black; 	} 	#info_dte:hover{box-shadow: 0px 0px 13px -3px rgba(0,0,0,0.6);transition: box-shadow 0.5s; 	} 	#info_dte{border-color:#D9D6D0;}	 </sty')
||'le>'
,p_region_name=>'info_dte'
,p_parent_plug_id=>wwv_flow_api.id(153327387046851602)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153327411175851603)
,p_name=>'P362_ID_TTLO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(153327545488851604)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153327613291851605)
,p_name=>'P362_NMRO_TITULO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(153327545488851604)
,p_prompt=>unistr('Numero T\00EDtulo')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153327749579851606)
,p_name=>'P362_FCHA_CNSTTCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(153327545488851604)
,p_prompt=>unistr('Fecha Constituci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153327896155851607)
,p_name=>'P362_VLOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(153327545488851604)
,p_prompt=>unistr('Valor T\00EDtulo')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153328035263851609)
,p_name=>'P362_ID_DMNDDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(153327930363851608)
,p_prompt=>unistr('Identificaci\00F3n Demandado')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153328114014851610)
,p_name=>'P362_NMBRE_DMNDDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(153327930363851608)
,p_prompt=>'Nombre Demandado'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153328359149851612)
,p_name=>'P362_ID_DMNDNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(153328232674851611)
,p_prompt=>unistr('Identificaci\00F3n Demandante')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153328493832851613)
,p_name=>'P362_NMBRE_DMNDNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(153328232674851611)
,p_prompt=>'Nombre Demandante'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153328587807851614)
,p_name=>'P362_BNCO_CNSGNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(153327545488851604)
,p_prompt=>'Banco Consignante'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153328699457851615)
,p_name=>'P362_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(153327545488851604)
,p_prompt=>unistr('Estado T\00EDtulo')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153328712874851616)
,p_name=>'P362_ID_EMBRGO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(153327545488851604)
,p_prompt=>unistr('N\00FAmero Embargo')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(153328850031851617)
,p_name=>'P362_AREA_DMNDNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(153328232674851611)
,p_prompt=>unistr('\00C1rea Demandante')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153328974380851618)
,p_computation_sequence=>10
,p_computation_item=>'P362_NMRO_TITULO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_ttlo_jdcial          ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153329085622851619)
,p_computation_sequence=>20
,p_computation_item=>'P362_ESTDO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.DSCRPCION_TTLO_ESTDO  ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153329188824851620)
,p_computation_sequence=>30
,p_computation_item=>'P362_FCHA_CNSTTCION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.FCHA_CNSTTCION          ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153329271182851621)
,p_computation_sequence=>40
,p_computation_item=>'P362_BNCO_CNSGNTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_bnco_cnsgnnte          ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153329321437851622)
,p_computation_sequence=>50
,p_computation_item=>'P362_VLOR'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.vlor          ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153329453438851623)
,p_computation_sequence=>60
,p_computation_item=>'P362_ID_EMBRGO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgo_rslcion          ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153329506459851624)
,p_computation_sequence=>70
,p_computation_item=>'P362_ID_DMNDDO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_dmnddo          ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153329668681851625)
,p_computation_sequence=>80
,p_computation_item=>'P362_NMBRE_DMNDDO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_dmnddo          ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153329712732851626)
,p_computation_sequence=>90
,p_computation_item=>'P362_AREA_DMNDNTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_area          ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153329867446851627)
,p_computation_sequence=>100
,p_computation_item=>'P362_ID_DMNDNTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.idntfccion_dmndnte          ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(153329942811851628)
,p_computation_sequence=>110
,p_computation_item=>'P362_NMBRE_DMNDNTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_dmndnte          ',
'   from v_gf_g_titulos_judicial a',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_ttlo_jdcial=:P362_ID_TTLO',
'    and a.id_slctud is null',
'    and a.cdgo_ttlo_jdcial_estdo not in (''APL'', ''FSN'')',
'   '))
,p_compute_when_type=>'NEVER'
);
end;
/
