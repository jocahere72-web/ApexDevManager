prompt --application/pages/page_00100
begin
wwv_flow_api.create_page(
 p_id=>100
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Declaraciones Registro de declaraci\00F3n')
,p_step_title=>unistr('Registro de declaraci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200105233951'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16414441161495837)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16414592058495838)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>Funcionalidad que permite registrar las declaraciones.',
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20868028669488309)
,p_plug_name=>unistr('Nueva declaraci\00F3n')
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
 p_id=>wwv_flow_api.id(21804275718142406)
,p_plug_name=>unistr('Formulario Declaraci\00F3n')
,p_region_name=>'prueba'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.FORMULARIO_DECLARACION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P100_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_01=>'P100_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_07=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20867280404488301)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(16414441161495837)
,p_button_name=>'BTN_CARGAR_FRMLRIO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cargar Formulario'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=150000:2:&SESSION.::&DEBUG.:RP,2:P2_ID_DCLRCION_VGNCIA_FRMLRIO:&P100_ID_DCLRCION_VGNCIA_FRMLRIO.'
,p_button_condition=>'P100_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20868650554488315)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(16414441161495837)
,p_button_name=>'BTN_REGISTRAR_DECLARACION'
,p_button_static_id=>'BTN_RGSTRA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar Declaraci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P100_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20868570032488314)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(16414441161495837)
,p_button_name=>'BTN_NUEVA_DECLARACION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Nueva Declaraci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''EstÃ¡ seguro de registrar una nueva declaraciÃ³n?'', ''BTN_NUEVA_DECLARACION'');'
,p_button_condition=>'P100_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20868142456488310)
,p_name=>'P100_ID_DCLRCN_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20868028669488309)
,p_prompt=>unistr('Tipo de declaraci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_dclrcn_tpo',
'from    gi_d_declaraciones_tipo a',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'order by a.dscrpcion'))
,p_lov_display_null=>'YES'
,p_display_when=>'P100_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20868238916488311)
,p_name=>'P100_VGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20868028669488309)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia text,',
'        a.vgncia value',
'from    df_s_vigencias  a',
'where   exists(select       1',
'               from         gi_d_declaraciones_tipo     b',
'               inner join   gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcn_tpo =   b.id_dclrcn_tpo',
'               where        b.id_dclrcn_tpo =   :P100_ID_DCLRCN_TPO',
'               and          c.vgncia        =   a.vgncia',
'              )'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P100_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P100_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_display_when=>'P100_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20868310062488312)
,p_name=>'P100_ID_DCLRCION_TPO_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20868028669488309)
,p_prompt=>'Periodo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.prdo || '' '' || b.dscrpcion,',
'            a.id_dclrcion_tpo_vgncia',
'from        gi_d_dclrcnes_tpos_vgncias  a',
'inner join  df_i_periodos               b   on  b.id_prdo   =   a.id_prdo',
'where       a.id_dclrcn_tpo =   :P100_ID_DCLRCN_TPO',
'and         a.vgncia        =   nvl(:P100_VGNCIA, a.vgncia)',
'order by    a.vgncia desc, b.prdo, b.dscrpcion'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P100_ID_DCLRCN_TPO,P100_VGNCIA'
,p_ajax_items_to_submit=>'P100_ID_DCLRCION_TPO_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_display_when=>'P100_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'250'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20868407587488313)
,p_name=>'P100_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20868028669488309)
,p_prompt=>'Formulario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion d,',
'       a.id_dclrcion_vgncia_frmlrio r',
'from gi_d_dclrcnes_vgncias_frmlr a',
'inner join gi_d_formularios b on a.id_frmlrio = b.id_frmlrio',
'where a.id_dclrcion_tpo_vgncia = :P100_ID_DCLRCION_TPO_VGNCIA and',
'      a.actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P100_ID_DCLRCION_TPO_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P100_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(20868880206488317)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Borrar elementos en sesi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(20868570032488314)
);
end;
/
