prompt --application/pages/page_00036
begin
wwv_flow_api.create_page(
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Fiscalizaci\00F3n Gesti\00F3n Declaraci\00F3n')
,p_step_title=>unistr('Fiscalizaci\00F3n Gesti\00F3n Declaraci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20240703175015'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67033858538749802)
,p_plug_name=>'Encabezado Formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67034867688749812)
,p_plug_name=>unistr('Formulario Declaraci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.FORMULARIO_DECLARACION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P36_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_02=>'P36_ID_DCLRCION'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_07=>'Y'
,p_attribute_08=>'P36_ID_SJTO_IMPSTO'
,p_attribute_09=>'P36_IDNTFCCION'
,p_attribute_10=>'f?p=&APP_ID.:&P36_PGNA.:&SESSION.::&DEBUG.:RP::'
,p_attribute_11=>'declaraciones/gestion'
,p_attribute_12=>'P36_ID_CNDDTO_VGNCIA'
,p_attribute_13=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67389422907865002)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(463908469220131081)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'',
'<p align="justify">',
unistr('<i>Funcionalidad que permite al funcionario generar y modificar la declaraci\00F3n no presentada por el contribuyente.</i>'),
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(67389604370865004)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(67389422907865002)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:&P36_PGNA.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67033932399749803)
,p_name=>'P36_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67033858538749802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67034023412749804)
,p_name=>'P36_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(67033858538749802)
,p_prompt=>unistr('Tipo de Declaraci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.dscrpcion,',
'            a.id_dclrcion_vgncia_frmlrio',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'inner join  gi_d_declaraciones_tipo     c   on  c.id_dclrcn_tpo             =   b.id_dclrcn_tpo',
'where       a.id_dclrcion_vgncia_frmlrio    =   :P36_ID_DCLRCION_VGNCIA_FRMLRIO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67034189377749805)
,p_name=>'P36_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(67033858538749802)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.vgncia text,',
'            c.vgncia value',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   b.id_dclrcion_tpo_vgncia',
'inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo;',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P36_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P36_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67034268338749806)
,p_name=>'P36_ID_PRDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(67033858538749802)
,p_prompt=>'Periodo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.prdo || '' - '' || c.dscrpcion,',
'            c.id_prdo',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   b.id_dclrcion_tpo_vgncia',
'inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P36_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P36_ID_PRDO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67034382011749807)
,p_name=>'P36_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(67033858538749802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67034964503749813)
,p_name=>'P36_ID_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67034867688749812)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67035021489749814)
,p_name=>'P36_IDNTFCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(67033858538749802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67285502268516401)
,p_name=>'P36_ID_CNDDTO_VGNCIA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(67033858538749802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67389332191865001)
,p_name=>'P36_ID_INSTNCIA_FLJO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(67033858538749802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71604531495626801)
,p_name=>'P36_PGNA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(67033858538749802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67035199643749815)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select      d.id_impsto,',
'                c.vgncia,',
'                c.id_prdo',
'    into        :P36_ID_IMPSTO,',
'                :P36_VGNCIA,',
'                :P36_ID_PRDO',
'    from        gi_d_dclrcnes_vgncias_frmlr a',
'    inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'    inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo',
'    inner join  gi_d_declaraciones_tipo     d   on  d.id_dclrcn_tpo             =   b.id_dclrcn_tpo',
'    where       a.id_dclrcion_vgncia_frmlrio = :P36_ID_DCLRCION_VGNCIA_FRMLRIO;',
'end;'))
,p_process_error_message=>'Problemas al consultar el impuesto asociado al formulario, #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P36_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67035256988749816)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Calcular Identificaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.idntfccion_sjto',
'    into    :P36_IDNTFCCION',
'    from    v_si_i_sujetos_impuesto a',
'    where   a.id_sjto_impsto    =   :P36_ID_SJTO_IMPSTO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P36_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
