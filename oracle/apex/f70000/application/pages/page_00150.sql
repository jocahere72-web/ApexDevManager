prompt --application/pages/page_00150
begin
wwv_flow_api.create_page(
 p_id=>150
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Generaci\00F3n de Certificados ICA')
,p_step_title=>unistr('Generaci\00F3n de Certificados ICA')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210513110235'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10704203577272188)
,p_plug_name=>'Consultar Sujeto'
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
 p_id=>wwv_flow_api.id(5033425900430215)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda ')
,p_parent_plug_id=>wwv_flow_api.id(10704203577272188)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10704040308272186)
,p_plug_name=>'Datos Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(10704203577272188)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P150_ID_SJTO_IMPSTO'
,p_attribute_01=>'P150_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10705291535272199)
,p_plug_name=>'Generar Certificado '
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11494693937304312)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103506880972375065)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(11494693937304312)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Funcionalidad que permite  consultar los datos de un sujeto tributo especifico Y generar su respectivo certificado<br><br>',
'',
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6330276586865871)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(10705291535272199)
,p_button_name=>'Btn_Gnrar_Ofcio'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Oficio '
,p_button_position=>'BODY'
,p_button_condition=>'P150_IDNTFCCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6330685812865871)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(10705291535272199)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6332121064865883)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(10704203577272188)
,p_button_name=>'Btn_cnsultar_x_idntfccion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6332540978865883)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(10704203577272188)
,p_button_name=>'Btn_cnsultar_x_prmtros'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Consultar por Parametros'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6329346262865836)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(10705291535272199)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6339331800866042)
,p_branch_name=>'Ir a busqueda de Sujeto Impuesto'
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P150_ID_SJTO_IMPSTO,&P150_ID_IMPSTO.,&P150_ID_IMPSTO_SBMPSTO.,P150_ID_IMPSTO,P150_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6332540978865883)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6340154358866052)
,p_branch_name=>'Ir a Imprimir Oficio'
,p_branch_action=>'f?p=66000:37:&SESSION.:generar_oficio:&DEBUG.:RP:P37_ID_RPRTE,P37_NMBRE_RPRTE:&P150_ID_RPRTE.,&P150_NMBRE_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6330276586865871)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5033067741430211)
,p_name=>'P150_ID_RPRTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(10705291535272199)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5033168452430212)
,p_name=>'P150_CNSCUTVO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(10705291535272199)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5033579131430216)
,p_name=>'P150_VGENCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5033425900430215)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'85%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5033604598430217)
,p_name=>'P150_PRDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5033425900430215)
,p_prompt=>'Periodo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct dscrpcion a',
'      ,id_prdo   b',
'from df_i_periodos',
'where cdgo_prdcdad = :P150_PRCDAD',
'and vgncia = :P150_VGENCIA',
'and id_impsto_sbmpsto =:P150_ID_IMPSTO_SBMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_lov_cascade_parent_items=>'P150_VGENCIA,P150_PRCDAD'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'33%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5034410376430225)
,p_name=>'P150_PRCDAD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5033425900430215)
,p_prompt=>'Periodicidad'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion    a',
'       ,cdgo_prdcdad b',
'from DF_S_PERIODICIDAD;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'85%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5034716568430228)
,p_name=>'P150_NMBRE_RPRTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(10705291535272199)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6331082311865871)
,p_name=>'P150_ID_PLNTLLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10705291535272199)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select dscrpcion  as d',
'      , id_plntlla as v',
'  from gn_d_plantillas',
' where id_rprte in (',
'                          select id_rprte',
'                           from gn_d_reportes',
'                          where cdgo_rprte_grpo = ''CIC''',
'                            and actvo           = ''S''',
'                       );'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6331410640865882)
,p_name=>'P150_CDGO_RPRTE_GRPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(10705291535272199)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6332989578865883)
,p_name=>'P150_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10704203577272188)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto a',
'      ,id_impsto    b  ',
'from df_c_impuestos',
'where cdgo_impsto = ''ICA''',
'and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'85%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6333352571865884)
,p_name=>'P150_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10704203577272188)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto as d ',
'     , id_impsto_sbmpsto    as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P150_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P150_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'85%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6333715786865884)
,p_name=>'P150_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(10704203577272188)
,p_prompt=>'Identificacion '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6334116150865884)
,p_name=>'P150_ID_SJTO_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(10704203577272188)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6334540026865884)
,p_name=>'P150_MSNJE_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(10704203577272188)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6334938766865885)
,p_name=>'P150_BRANCH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(10704203577272188)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6561981164273102)
,p_name=>'P150_ID_DCLRCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(10704203577272188)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6336141986865986)
,p_validation_name=>'Sujeto Impuesto no Null'
,p_validation_sequence=>10
,p_validation=>'P150_ID_SJTO_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Se\00F1or Usuario Debe consultar el Sujeto tributo')
,p_when_button_pressed=>wwv_flow_api.id(6330276586865871)
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6336432123865993)
,p_validation_name=>'Identificacion no nula'
,p_validation_sequence=>20
,p_validation=>'P150_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# debe tener un valor.'
,p_when_button_pressed=>wwv_flow_api.id(6332121064865883)
,p_associated_item=>wwv_flow_api.id(6333715786865884)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5035137482430232)
,p_validation_name=>'Identificacion no nula genrar oficio'
,p_validation_sequence=>30
,p_validation=>'P150_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# debe tener un valor.'
,p_when_button_pressed=>wwv_flow_api.id(6330276586865871)
,p_associated_item=>wwv_flow_api.id(6333715786865884)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5034596965430226)
,p_validation_name=>'Consultar vigencia del sujeto'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_vgncia number;',
'    v_prdo   number;',
'    v_dscrpcion varchar2(100);',
'begin',
'     select c.vgncia',
'           ,c.id_prdo',
'           ,d.dscrpcion',
'           ,a.id_dclrcion',
'     into  v_vgncia',
'           ,v_prdo  ',
'           ,v_dscrpcion',
'           ,:P150_ID_DCLRCION',
'    from gi_g_declaraciones            a',
'    join gi_d_dclrcnes_vgncias_frmlr   b on a.id_dclrcion_vgncia_frmlrio = b.id_dclrcion_vgncia_frmlrio',
'    join gi_d_dclrcnes_tpos_vgncias    c on b.id_dclrcion_tpo_vgncia     = c.id_dclrcion_tpo_vgncia   ',
'    join df_i_periodos                 d on c.id_prdo                    = d.id_prdo ',
'    where a.id_sjto_impsto             = :P150_ID_SJTO_IMPSTO',
'    and c.vgncia                       = :P150_VGENCIA',
'    and d.id_prdo                      = :P150_PRDO',
'    and a.cdgo_dclrcion_estdo          = ''APL''',
'    order by a.fcha_rgstro asc',
'    fetch first 1 rows only;  ',
'    ',
'     return null;',
'    exception',
'        when no_data_found then',
unistr('                return ''No tienen declaraci\00F3n en estado Aplicado para la Vigencia y Periodo seleccionado'';'),
'        when too_many_rows then',
unistr('                return ''Se encontr\00F3 mas de una declaraci\00F3n en estado Aplicado para la Vigencia y Periodo seleccionado'';'),
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P150_ID_PLNTLLA'
,p_validation_condition2=>'221'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(6330276586865871)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6337917557866027)
,p_name=>'Al seleccionar reporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P150_ID_PLNTLLA'
,p_condition_element=>'P150_ID_PLNTLLA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6338416197866032)
,p_event_id=>wwv_flow_api.id(6337917557866027)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(6330276586865871)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6338829736866041)
,p_event_id=>wwv_flow_api.id(6337917557866027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(6330276586865871)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6336774507865994)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto x Identificacion '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select id_sjto_impsto',
'    into :P150_ID_SJTO_IMPSTO',
'    from v_si_i_sujetos_impuesto',
'   where id_impsto       = :P150_ID_IMPSTO      ',
'     and idntfccion_sjto = :P150_IDNTFCCION;',
'     ',
'     :P150_MSNJE_RSPSTA   := ''Sujeto Encontrado'';',
'exception',
'        when no_data_found then',
unistr('                :P150_MSNJE_RSPSTA   := ''No se encontr\00F3 ning\00FAn dato.'';'),
'                :P150_ID_SJTO_IMPSTO := '''';',
'end;      ',
''))
,p_process_error_message=>'&P150_MSNJE_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6332121064865883)
,p_process_success_message=>'&P150_MSNJE_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5033361338430214)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_object json_object_t := json_object_t();',
'    v_json                clob;',
'begin',
'    ',
'    select  b.id_rprte,',
'            b.dscrpcion     ',
'      into :P150_ID_RPRTE',
'          ,:P150_NMBRE_RPRTE   ',
'      from gn_d_plantillas b',
'     where b.id_plntlla = :P150_ID_PLNTLLA;',
'',
'    ',
'    :P150_CNSCUTVO := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''NPS'');',
'',
'    v_object.put(''id_impsto'',          :P150_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbimpsto'', :P150_ID_IMPSTO_SBMPSTO);',
'    v_object.put(''cdgo_clnte'',         :F_CDGO_CLNTE);',
'    v_object.put(''usrio'',              :F_NMBRE_USRIO);',
'    v_object.put(''id_sjto_impsto'',     :P150_ID_SJTO_IMPSTO);',
'    -- v_object.put(''nmbre_rprte'',v_nmbre_rprte);',
'    v_object.put(''cnsctvo'',            :P150_CNSCUTVO);',
'    v_object.put(''vgncia'',             :P150_VGENCIA);',
'    v_object.put(''prdo'',               :P150_PRDO);',
'    v_object.put(''id_rprte'',           :P150_ID_PLNTLLA);',
'  ',
'    v_json := v_object.to_clob();   ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'    apex_session.attach ( p_app_id => 70000, p_page_id => 150, p_session_id => :APP_SESSION );    ',
'    ',
'    exception',
'         when no_data_found then',
'              null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6330276586865871)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5033221920430213)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Certificado Declaraci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_cdgo_rspsta  	   number;',
'    v_mnsje_rspsta 	   varchar2(4000);',
'    v_id_dcmnto        number;',
'    ',
'begin',
'     ',
'                                                       ',
'     pkg_gi_declaraciones.prc_rg_certificado_dclaracion ( p_cdgo_clnte	        => :F_CDGO_CLNTE',
'                                                        ,p_id_sjto_impsto	 	=> :P150_ID_SJTO_IMPSTO',
'                                                        ,p_id_plntlla		 	=> :P150_ID_PLNTLLA',
'                                                        ,p_cnsctvo				=> :P150_CNSCUTVO',
'                                                        ,p_id_impsto			=> :P150_ID_IMPSTO',
'                                                        ,p_id_impsto_sbmpsto	=> :P150_ID_IMPSTO_SBMPSTO	',
'                                                        ,p_vgncia				=> :P150_VGENCIA',
'                                                        ,p_id_prdo				=> :P150_PRDO    ',
'                                                        ,p_id_dclrcion			=> :P150_ID_DCLRCION		',
'                                                        ,o_cdgo_rspta		 	=> v_cdgo_rspsta',
'                                                        ,o_msje_rspsta		 	=> v_mnsje_rspsta	',
'                                             );                                                  ',
'',
'    if(v_cdgo_rspsta <> 0 ) then ',
'        raise_application_error( -20001 , v_mnsje_rspsta);',
'    end if;',
'                                   ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6330276586865871)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5035641323430237)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar sujeto impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P150_ID_SJTO_IMPSTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6332121064865883)
,p_process_when=>':P150_ID_SJTO_IMPSTO IS NULL or :P150_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5035766612430238)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'limpiar cache pagina'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'150'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6329346262865836)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6337184646866013)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Identificacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select idntfccion_sjto ',
'  into :P150_IDNTFCCION',
'  from v_si_i_sujetos_impuesto',
' where id_sjto_impsto = :P150_ID_SJTO_IMPSTO;',
'exception',
'    when no_data_found then',
'        null;',
'end; ',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6337505617866013)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Oficio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_object json_object_t := json_object_t();  ',
'     v_json                      clob;   ',
'     v_id_dcmnto_tpo             number;',
'     v_id_dcmnto                 number;',
'     v_cnsctvo                   number;',
'     v_id_ofcio                  number;     ',
'     v_gn_d_reportes             gn_d_reportes%rowtype;',
'     v_blob                      blob;  ',
'     v_id_trd_srie_dcmnto_tpo    number;',
'     v_cnsctvo_dcmnto            number;',
'begin   ',
'    -- CONSULTAMOS LOS DATOS DEL REPORTE    ',
'    begin',
'        begin',
'        select /*+ RESULT_CACHE */',
'                r.*',
'           into v_gn_d_reportes ',
'           from gn_d_reportes r',
'          where r.id_rprte = :P150_ID_RPRTE;         ',
'    exception',
'        when others then',
'                null;',
'    end;  begin',
'        select /*+ RESULT_CACHE */',
'                r.*',
'           into v_gn_d_reportes ',
'           from gn_d_reportes r',
'          where r.id_rprte = :P126_ID_RPRTE;         ',
'    exception',
'        when others then',
'                null;',
'    end; ',
'    exception',
'        when others then',
'                null;',
'    end; ',
'',
'       v_cnsctvo := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''ICA'');',
'       :P150_CNSCUTVO := v_cnsctvo;',
'',
'        -- Consultamos el tipo de documento para la CICA',
'        select a.id_dcmnto_tpo',
'             , b.id_trd_srie_dcmnto_tpo',
'          into v_id_dcmnto_tpo',
'             , v_id_trd_srie_dcmnto_tpo',
'          from gd_d_documentos_tipo a',
'          join gd_d_trd_serie_dcmnto_tpo b on a.id_dcmnto_tpo = b.id_dcmnto_tpo',
'         where a.cdgo_dcmnto_tpo = ''CICA'';',
'        ',
'  ',
'    -- GENERAMOS EL BLOB',
'    v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                            p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                            p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                            p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                            p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );   ',
'    ',
'    -- Insertamos el documento ',
'    begin',
'        --GENERAMOS consecutivo del documento',
'        v_cnsctvo_dcmnto := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''GDC'');',
'        ',
'        insert into gd_g_documentos (id_trd_srie_dcmnto_tpo,   id_dcmnto_tpo,   nmro_dcmnto, file_blob, FILE_NAME,           file_mimetype,      id_usrio)',
'                              values(v_id_trd_srie_dcmnto_tpo, v_id_dcmnto_tpo, v_cnsctvo_dcmnto,   v_blob,    ''-2021-''||v_cnsctvo||''.pdf'', ''application/pdf'', :F_ID_USRIO)',
'                              returning id_dcmnto into v_id_dcmnto;  ',
'                                      ',
'    exception ',
'        when others then ',
'            raise_application_error(-20000, ''Error al insertar el Documento'');',
'    end;    ',
'    ',
'    -- insertamos el oficio en la tabla temporal',
'    begin',
'        insert into gn_g_oficios (CNSCTVO, ID_SJTO_IMPSTO, ID_USRIO, FCHA, ID_DCMNTO) values (v_cnsctvo, :P150_ID_SJTO_IMPSTO, :F_ID_USRIO, sysdate, v_id_dcmnto);',
'        commit;',
'    exception ',
'        when others then ',
'            raise_application_error(-20000, ''Error al insertar el Oficio Confirmacion de Registro'');',
'    end;   ',
'',
'exception',
'     when others then',
'          raise_application_error(-20000, sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
