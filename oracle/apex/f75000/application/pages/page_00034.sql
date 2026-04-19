prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>'Formulario Declaracion'
,p_step_title=>'Formulario Declaracion'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(237212187010524183)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20201014204355'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94536434360858426)
,p_plug_name=>'Formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.FORMULARIO_DECLARACION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P34_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_02=>'P34_ID_DCLRCION'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_07=>'Y'
,p_attribute_08=>'P34_ID_SJTO_IMPSTO'
,p_attribute_09=>'P34_IDNTFCCION'
,p_attribute_10=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP::'
,p_attribute_11=>'declaraciones/gestion'
,p_attribute_13=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94537117456858433)
,p_plug_name=>'Encabezado_Formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(374245579180869369)
,p_plug_name=>'Opciones'
,p_region_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>' <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(374294310479924036)
,p_plug_name=>'Ayuda'
,p_region_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>50
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
unistr('        Funcionalidad que permite registrar la declarac\00EDon puntualmente de un nuevo veh\00EDculo.'),
'        <br>	',
'        <br>',
unistr('	    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dirijase al Manual de Usuario.'),
'    </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94726351793812944)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(374245579180869369)
,p_button_name=>'Btn_Regresar'
,p_button_static_id=>'Btn_Registrar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP,28::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94536575627858427)
,p_name=>'P34_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(94537117456858433)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94536628703858428)
,p_name=>'P34_ID_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(94537117456858433)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94536723591858429)
,p_name=>'P34_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(94537117456858433)
,p_prompt=>unistr('Tipo Declaraci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion,',
'a.id_dclrcion_vgncia_frmlrio',
'from gi_d_dclrcnes_vgncias_frmlr a',
'inner join gi_d_dclrcnes_tpos_vgncias b on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia',
'inner join gi_d_declaraciones_tipo c on c.id_dclrcn_tpo = b.id_dclrcn_tpo',
'where a.id_dclrcion_vgncia_frmlrio = :P34_ID_DCLRCION_VGNCIA_FRMLRIO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94536965400858431)
,p_name=>'P34_IDNTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(94537117456858433)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94537353925858435)
,p_name=>'P34_ID_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(94537117456858433)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94537439085858436)
,p_name=>'P34_VGNCIA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(94537117456858433)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.vgncia text,',
'c.vgncia value',
'from gi_d_dclrcnes_vgncias_frmlr a',
'inner join gi_d_dclrcnes_tpos_vgncias b on b.id_dclrcion_tpo_vgncia = b.id_dclrcion_tpo_vgncia',
'inner join df_i_periodos c on c.id_prdo = b.id_prdo;',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P34_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P34_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94537571354858437)
,p_name=>'P34_ID_PRDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(94537117456858433)
,p_prompt=>'Periodo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.prdo || '' - '' || c.dscrpcion,',
'c.id_prdo',
'from gi_d_dclrcnes_vgncias_frmlr a',
'inner join gi_d_dclrcnes_tpos_vgncias b on b.id_dclrcion_tpo_vgncia = b.id_dclrcion_tpo_vgncia',
'inner join df_i_periodos c on c.id_prdo = b.id_prdo;',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P34_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P34_ID_PRDO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237296017260524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94536831190858430)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calc_Identificacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select a.idntfccion_sjto',
'into :P34_IDNTFCCION',
'from v_si_i_sujetos_impuesto a',
'where a.id_sjto_impsto = :P34_ID_SJTO_IMPSTO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P34_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94537646791858438)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calc_Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select d.id_impsto,',
'c.vgncia,',
'c.id_prdo',
'into :P34_ID_IMPSTO,',
':P34_VGNCIA,',
':P34_ID_PRDO',
'from gi_d_dclrcnes_vgncias_frmlr a',
'inner join gi_d_dclrcnes_tpos_vgncias b on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia',
'inner join df_i_periodos c on c.id_prdo = b.id_prdo',
'inner join gi_d_declaraciones_tipo d on d.id_dclrcn_tpo = b.id_dclrcn_tpo',
'where a.id_dclrcion_vgncia_frmlrio = :P34_ID_DCLRCION_VGNCIA_FRMLRIO;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P34_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
