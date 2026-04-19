prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Mantenimiento'
,p_step_title=>'Mantenimiento'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20210325134422'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21524821213113402)
,p_plug_name=>'Mantenimiento'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252169105903651390)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>7
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><p><span style="color:#333399"><span style="font-size:20px"><span style="font-family:Trebuchet MS,Helvetica,sans-serif">Estimado Contribuyente, con el prop&oacute;sito de simplificar y agilizar la presentaci&oacute;n de la declaraci&oacute;n '
||'del Impuesto de Industria y Comercio, esta funcionalidad del sistema entrar&aacute; en mantenimiento los d&iacute;as 25 y 26 de marzo de 2021.</span></span></span></p>',
'</center>',
'<br><br><br>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26937640668701326)
,p_plug_name=>'Predial'
,p_region_name=>'Predial'
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/PAGINA_MANTENIMIENTO.jpg" alt="No Imagen"></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27112224925449101)
,p_plug_name=>'Regresar'
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><a href="f?p=&APP_ID.:1:&APP_SESSION.::::P1_ID_MNU:3">',
'<img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON_REGRESAR-02.png" alt="No Imagen"></a></center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
