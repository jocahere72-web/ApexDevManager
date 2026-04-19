prompt --application/pages/page_00119
begin
wwv_flow_api.create_page(
 p_id=>119
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Panel de Control Rentas Varias'
,p_step_title=>'Panel de Control Rentas Varias'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191226175637'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49860565831389003)
,p_plug_name=>'Panel Control'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49860665593389004)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_parent_plug_id=>wwv_flow_api.id(49860565831389003)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49861053185389008)
,p_plug_name=>'Total Cartera Renta'
,p_parent_plug_id=>wwv_flow_api.id(49860565831389003)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  to_char(sum(vlor_sldo_cptal)+ sum (vlor_intres), :F_FRMTO_MNDA) ttal, 1 , 2 ',
'  from  v_gf_g_cartera_x_vigencia ',
' where  cdgo_clnte = 6 ',
'   and  id_impsto = 18',
'   and  cdgo_mvnt_fncro_estdo = ''NO'' ',
'   and  cdgo_clnte = :F_CDGO_CLNTE',
'   /*and ((trunc(a.fcha_aplccion) between :P119_FECHA_INICIAL and :P119_FECHA_FINAL)',
'        or ((trunc(a.fcha_aplccion) >= :P119_FECHA_INICIAL and :P119_FECHA_FINAL is null))',
'        or (trunc(a.fcha_aplccion) <= :P119_FECHA_FINAL and :P119_FECHA_INICIAL  is null)',
'        or (:P119_FECHA_INICIAL is null and :P119_FECHA_FINAL is null ));*/'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'TTAL'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49861177614389009)
,p_plug_name=>'Porcentaje Sobre Cartera'
,p_parent_plug_id=>wwv_flow_api.id(49860565831389003)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49861232879389010)
,p_plug_name=>unistr('N\00B0 Rentas Liquidadas')
,p_parent_plug_id=>wwv_flow_api.id(49860565831389003)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49860776595389005)
,p_name=>'P119_FCHA_INCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(49860665593389004)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del registro de las rentas liquidadas, para mostrar las estad\00EDsticas que as\00ED lo requieran.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49860881647389006)
,p_name=>'P119_FCHA_FNAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(49860665593389004)
,p_prompt=>'<b>Fecha Final</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del registro de las rentas liquidadas, para mostrar las estad\00EDsticas que as\00ED lo requieran.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
end;
/
