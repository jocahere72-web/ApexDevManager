prompt --application/pages/page_00999
begin
wwv_flow_api.create_page(
 p_id=>999
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Pagina en Construcci\00F3n ')
,p_step_title=>unistr('Pagina en Construcci\00F3n ')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20181226194246'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52180173406614010)
,p_plug_name=>unistr('En construcci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="text-align:center;">',
unistr('    <img style="display:block; margin:auto;" src="#IMAGE_PREFIX#images/construccion.jpg" alt="Construcci\00F3n" />'),
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
