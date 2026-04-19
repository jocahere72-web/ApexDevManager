prompt --application/pages/page_00072
begin
wwv_flow_api.create_page(
 p_id=>72
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Reportes Declaraciones'
,p_step_title=>'Reportes Declaraciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20230528181346'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168670442016090592)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<br>',
'Funcionalidad que permite generar un reporte de Cartera de un predio.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168671354166122685)
,p_plug_name=>unistr('Par\00E1metros ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(129216211366957517)
,p_plug_name=>'Sujetos declaraciones'
,p_parent_plug_id=>wwv_flow_api.id(168671354166122685)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gn_d_reportes',
' where id_rprte        = :P72_ID_RPRTE',
'   and cdgo_rprte_grpo = ''RP1'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(129218143626957536)
,p_plug_name=>'Sujetos declaraciones sin pago'
,p_parent_plug_id=>wwv_flow_api.id(168671354166122685)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gn_d_reportes',
' where id_rprte        = :P72_ID_RPRTE',
'   and cdgo_rprte_grpo = ''SSP'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(129214813664957503)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(168671354166122685)
,p_button_name=>'btn_imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(129215345122957508)
,p_branch_name=>'Imprimir Reporte'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P72_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(129214813664957503)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129214732075957502)
,p_name=>'P72_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(168671354166122685)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte ',
'     , id_rprte',
'  from gn_d_reportes',
' where cdgo_rprte_grpo in (''RP1'', ''SSP'')'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129215425157957509)
,p_name=>'P72_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(168671354166122685)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto     as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto  = :P72_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gn_d_reportes',
' where id_rprte        = :P72_ID_RPRTE',
'   and cdgo_rprte_grpo in (''RP1'', ''SSP'')'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129215570850957510)
,p_name=>'P72_ID_PRDO_PRSNTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(129216211366957517)
,p_prompt=>'Periodo presentado'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d ',
'     , id_prdo   as r',
'  from df_i_periodos',
' where id_impsto         = :P72_ID_IMPSTO',
'   and ID_IMPSTO_SBMPSTO = :P72_ID_IMPSTO_SBMPSTO',
'   and vgncia            = :P72_VGNCIA_PRSNTDA;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P72_ID_IMPSTO,P72_ID_IMPSTO_SBMPSTO,P72_VGNCIA_PRSNTDA'
,p_ajax_items_to_submit=>'P72_ID_IMPSTO,P72_ID_IMPSTO_SBMPSTO,P72_VGNCIA_PRSNTDA'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'25%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129215629137957511)
,p_name=>'P72_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(168671354166122685)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129215823148957513)
,p_name=>'P72_VGNCIA_PRSNTDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(129216211366957517)
,p_prompt=>'Vigencia Presentada'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia as d',
'     , vgncia as r',
'  from df_s_vigencias;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'25%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129215921829957514)
,p_name=>'P72_VGNCIA_NO_PRSNTDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(129216211366957517)
,p_prompt=>'Vigencia  no Presentada'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia as d',
'     , vgncia as r',
'  from df_s_vigencias;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'25%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129216054462957515)
,p_name=>'P72_ID_PRDO_NO_PRSNTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(129216211366957517)
,p_prompt=>'Periodo no presentado'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d ',
'     , id_prdo   as r',
'  from df_i_periodos',
' where id_impsto         = :P72_ID_IMPSTO',
'   and ID_IMPSTO_SBMPSTO = :P72_ID_IMPSTO_SBMPSTO',
'   and vgncia            = :P72_VGNCIA_NO_PRSNTDA;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P72_ID_IMPSTO,P72_ID_IMPSTO_SBMPSTO,P72_VGNCIA_NO_PRSNTDA'
,p_ajax_items_to_submit=>'P72_ID_IMPSTO,P72_ID_IMPSTO_SBMPSTO,P72_VGNCIA_NO_PRSNTDA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'25%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129218374585957538)
,p_name=>'P72_VGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(129218143626957536)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia as d',
'     , vgncia as r',
'  from df_s_vigencias;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129218681237957541)
,p_name=>'P72_ID_PRDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(129218143626957536)
,p_prompt=>'Periodo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d ',
'     , id_prdo   as r',
'  from df_i_periodos',
' where id_impsto         = :P72_ID_IMPSTO',
'   and ID_IMPSTO_SBMPSTO = :P72_ID_IMPSTO_SBMPSTO',
'   and vgncia            = :P72_VGNCIA;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P72_ID_IMPSTO,P72_ID_IMPSTO_SBMPSTO,P72_VGNCIA'
,p_ajax_items_to_submit=>'P72_ID_IMPSTO,P72_ID_IMPSTO_SBMPSTO,P72_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'40%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129219312527957548)
,p_name=>'P72_CDGO_MVNT_FNCRO_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(129218143626957536)
,p_prompt=>'Cartera con convenio ?'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>unistr('STATIC:S\00ED;CN,No;NO')
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(129215701709957512)
,p_computation_sequence=>10
,p_computation_item=>'P72_ID_IMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_impsto',
'   from df_c_impuestos',
'  where cdgo_impsto = ''ICA'''))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(129217479279957529)
,p_validation_name=>'Validar periodo no presentado si el reporte es sujetos declaraciones'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe number;',
'    l_item_name varchar2(100);',
'begin',
'    -- verifica que el reporte a imprimir es sujetos declaraciones',
'    select count(*)',
'      into v_existe',
'      from gn_d_reportes',
'     where id_rprte        = :P72_ID_RPRTE',
'       and cdgo_rprte_grpo = ''RP1'';',
'    ',
'    -- si existe debe solicitarlo requerido',
'    if v_existe > 0 and :P72_ID_PRDO_NO_PRSNTDO is null then',
'        return false;',
'    end if;',
'    ',
'    return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor')
,p_when_button_pressed=>wwv_flow_api.id(129214813664957503)
,p_associated_item=>wwv_flow_api.id(129216054462957515)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(129217527064957530)
,p_validation_name=>'Validar periodo presentado si el reporte es sujetos declaraciones'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe number;',
'    l_item_name varchar2(100);',
'begin',
'    -- verifica que el reporte a imprimir es sujetos declaraciones',
'    select count(*)',
'      into v_existe',
'      from gn_d_reportes',
'     where id_rprte        = :P72_ID_RPRTE',
'       and cdgo_rprte_grpo = ''RP1'';',
'    ',
'    -- si existe debe solicitarlo requerido',
'    if v_existe > 0 and :P72_ID_PRDO_PRSNTDO is null then',
'        return false;',
'    end if;',
'    ',
'    return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor')
,p_when_button_pressed=>wwv_flow_api.id(129214813664957503)
,p_associated_item=>wwv_flow_api.id(129215570850957510)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(129217614653957531)
,p_validation_name=>'Validar vigencia no presentada si el reporte es sujetos declaraciones'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe number;',
'    l_item_name varchar2(100);',
'begin',
'    -- verifica que el reporte a imprimir es sujetos declaraciones',
'    select count(*)',
'      into v_existe',
'      from gn_d_reportes',
'     where id_rprte        = :P72_ID_RPRTE',
'       and cdgo_rprte_grpo = ''RP1'';',
'    ',
'    -- si existe debe solicitarlo requerido',
'    if v_existe > 0 and :P72_VGNCIA_NO_PRSNTDA is null then',
'        return false;',
'    end if;',
'    ',
'    return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor')
,p_when_button_pressed=>wwv_flow_api.id(129214813664957503)
,p_associated_item=>wwv_flow_api.id(129215921829957514)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(129217701984957532)
,p_validation_name=>'Validar vigencia presentada si el reporte es sujetos declaraciones'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe number;',
'    l_item_name varchar2(100);',
'begin',
'    -- verifica que el reporte a imprimir es sujetos declaraciones',
'    select count(*)',
'      into v_existe',
'      from gn_d_reportes',
'     where id_rprte        = :P72_ID_RPRTE',
'       and cdgo_rprte_grpo = ''RP1'';',
'    ',
'    -- si existe debe solicitarlo requerido',
'    if v_existe > 0 and :P72_VGNCIA_PRSNTDA is null then',
'        return false;',
'    end if;',
'    ',
'    return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor')
,p_when_button_pressed=>wwv_flow_api.id(129214813664957503)
,p_associated_item=>wwv_flow_api.id(129215823148957513)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(129219128109957546)
,p_validation_name=>'Validar vigencia si el reporte es sujetos declaraciones sin pago'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe number;',
'    l_item_name varchar2(100);',
'begin',
'    -- verifica que el reporte a imprimir es sujetos declaraciones',
'    select count(*)',
'      into v_existe',
'      from gn_d_reportes',
'     where id_rprte        = :P72_ID_RPRTE',
'       and cdgo_rprte_grpo = ''SSP'';',
'    ',
'    -- si existe debe solicitarlo requerido',
'    if v_existe > 0 and :P72_VGNCIA is null then',
'        return false;',
'    end if;',
'    ',
'    return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor')
,p_when_button_pressed=>wwv_flow_api.id(129214813664957503)
,p_associated_item=>wwv_flow_api.id(129218374585957538)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(129219250174957547)
,p_validation_name=>'Validar periodo si el reporte es sujetos declaraciones sin pago'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe number;',
'    l_item_name varchar2(100);',
'begin',
'    -- verifica que el reporte a imprimir es sujetos declaraciones',
'    select count(*)',
'      into v_existe',
'      from gn_d_reportes',
'     where id_rprte        = :P72_ID_RPRTE',
'       and cdgo_rprte_grpo = ''SSP'';',
'    ',
'    -- si existe debe solicitarlo requerido',
'    if v_existe > 0 and :P72_ID_PRDO is null then',
'        return false;',
'    end if;',
'    ',
'    return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor')
,p_when_button_pressed=>wwv_flow_api.id(129214813664957503)
,p_associated_item=>wwv_flow_api.id(129218681237957541)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(129219489091957549)
,p_validation_name=>'Validar estado movimiento si el reporte es sujetos declaraciones sin pago'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe number;',
'    l_item_name varchar2(100);',
'begin',
'    -- verifica que el reporte a imprimir es sujetos declaraciones',
'    select count(*)',
'      into v_existe',
'      from gn_d_reportes',
'     where id_rprte        = :P72_ID_RPRTE',
'       and cdgo_rprte_grpo = ''SSP'';',
'    ',
'    -- si existe debe solicitarlo requerido',
'    if v_existe > 0 and :P72_CDGO_MVNT_FNCRO_ESTDO is null then',
'        return false;',
'    end if;',
'    ',
'    return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor')
,p_when_button_pressed=>wwv_flow_api.id(129214813664957503)
,p_associated_item=>wwv_flow_api.id(129219312527957548)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(129214946146957504)
,p_name=>'onSelectReport'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P72_ID_RPRTE'
,p_condition_element=>'P72_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(129215013003957505)
,p_event_id=>wwv_flow_api.id(129214946146957504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(129214813664957503)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(129215144515957506)
,p_event_id=>wwv_flow_api.id(129214946146957504)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(129214813664957503)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(129217223907957527)
,p_name=>'onChangeReport'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P72_ID_RPRTE'
,p_condition_element=>'P72_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(129219551195957550)
,p_event_id=>wwv_flow_api.id(129217223907957527)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P72_VGNCIA_PRSNTDA,P72_VGNCIA,P72_VGNCIA_NO_PRSNTDA,P72_ID_PRDO,P72_ID_PRDO_PRSNTDO,P72_CDGO_MVNT_FNCRO_ESTDO,P72_ID_PRDO_NO_PRSNTDO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(129217310230957528)
,p_event_id=>wwv_flow_api.id(129217223907957527)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(129215254707957507)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte             gn_d_reportes.nmbre_rprte%type;',
'     v_object                  json_object_t := json_object_t();      ',
'     v_json                    clob;',
'     v_dscrpcion_prdo          df_i_periodos.dscrpcion%type;  ',
'     ',
'     -- cursor para recuperar el nombre del periodo dado el id del periodo',
'     cursor c_prdo(p_id_prdo in number) is ',
'         select dscrpcion ',
'           from df_i_periodos',
'          where id_prdo =  p_id_prdo;',
'begin          ',
'    --Busca el Nombre del Reporte',
'     select nmbre_rprte',
'       into v_nmbre_rprte',
'       from gn_d_reportes ',
'      where id_rprte = :P72_ID_RPRTE;',
'      ',
'    -- Consulta descripcion del periodo',
'    begin',
'        case',
'            -- periodo para reporte sujetos sin pago',
'            when :P72_ID_PRDO is not null then',
'                open c_prdo(:P72_ID_PRDO);',
'                fetch c_prdo into v_dscrpcion_prdo;',
'                close c_prdo;',
'                ',
'                v_object.put(''prdo'', v_dscrpcion_prdo);',
'                v_dscrpcion_prdo := '''';',
'            when :P72_ID_PRDO_PRSNTDO is not null and :P72_ID_PRDO_NO_PRSNTDO is not null then',
'                open c_prdo(:P72_ID_PRDO_PRSNTDO);',
'                fetch c_prdo into v_dscrpcion_prdo;',
'                close c_prdo;            ',
'                ',
'                v_object.put(''dscrpcion_prdo_prsntdo'', v_dscrpcion_prdo);',
'                v_dscrpcion_prdo := '''';',
'                ',
'                open c_prdo(:P72_ID_PRDO_NO_PRSNTDO);',
'                fetch c_prdo into v_dscrpcion_prdo;',
'                close c_prdo;            ',
'                ',
'                v_object.put(''dscrpcion_prdo_no_prsntdo'', v_dscrpcion_prdo);',
'                v_dscrpcion_prdo := '''';                ',
'            else',
'                v_dscrpcion_prdo := '''';',
'                v_object.put(''prdo'', v_dscrpcion_prdo);',
'        end case;',
'    end;',
'    ',
'    -- parametros generales',
'    v_object.put(''nmbre_rprte'', v_nmbre_rprte);',
'    v_object.put(''id_impsto'', :P72_ID_IMPSTO);   ',
'    v_object.put(''id_impsto_sbmpsto'', :P72_ID_IMPSTO_SBMPSTO);',
'    ',
'',
'    -- parametros reporte Sujetos Declaraciones    ',
'    v_object.put(''vgncia_prsntda'', :P72_VGNCIA_PRSNTDA);',
'    v_object.put(''vgncia_no_prsntda'', :P72_VGNCIA_NO_PRSNTDA);',
'    v_object.put(''prdo_prsntdo'', :P72_ID_PRDO_PRSNTDO);',
'    v_object.put(''prdo_no_prsntdo'', :P72_ID_PRDO_NO_PRSNTDO);',
'',
'    -- parametros reporte Sujetos Declaraciones sin pago con convenio',
'    v_object.put(''vgncia'', :P72_VGNCIA);',
'    v_object.put(''id_prdo'', :P72_ID_PRDO);',
'    v_object.put(''cdgo_mvnt_fncro_estdo'', :P72_CDGO_MVNT_FNCRO_ESTDO);',
'    ',
'    v_json   := v_object.to_clob();        ',
'    ',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);',
'           ',
'exception',
'     when no_data_found then',
'          null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(129214813664957503)
);
end;
/
