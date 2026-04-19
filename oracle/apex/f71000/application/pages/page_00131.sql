prompt --application/pages/page_00131
begin
wwv_flow_api.create_page(
 p_id=>131
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro de Recaudo Manual - Recaudo Control'
,p_step_title=>'Registro de Recaudo Manual - Recaudo Control'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.col-3>.rel-col .col-1{',
'  padding: 0;',
'}',
'',
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.t-Wizard{',
'  max-width: none;',
'}',
'',
'.t-Form-inputContainer span.display_only {',
'    font-weight: 400;',
'    font-style: oblique;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20260206094503'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45075702687594156)
,p_plug_name=>'Wizard Recaudo Manual - Recaudo Control'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(45075175915594155)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94410507408113008)
,p_plug_name=>'<b>Registro de Recaudo Manual - Recaudo Control</b>'
,p_parent_plug_id=>wwv_flow_api.id(45075702687594156)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from re_g_recaudos',
' where id_rcdo_cntrol = :P131_ID_RCDO_CNTROL'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94956358886374240)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(94957778912377085)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'  Funcionalidad que permite almacenar y consultar los datos de control de los recaudos.',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45098107666699339)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(94956358886374240)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:&P131_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10817361281184611)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(94956358886374240)
,p_button_name=>'Btn_Eliminar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de eliminar el recaudo control?'',''Btn_Eliminar'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from re_g_recaudos',
' where id_rcdo_cntrol = :P131_ID_RCDO_CNTROL',
' union ',
'select 1',
'  from dual where :P131_ID_RCDO_CNTROL is null'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45077548651594157)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(45075702687594156)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45077858345594157)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(45075702687594156)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(45078629355594157)
,p_branch_name=>'Go To Page 132'
,p_branch_action=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.:RP,132:P132_ID_RCDO_CNTROL,P132_ID_IMPSTO,P132_ID_IMPSTO_SBMPSTO,P132_ID_BNCO,P132_ID_BNCO_CNTA,P132_FCHA_CNTROL,P132_OBSRVCION_CNTROL,P132_CDGO_FRMA_PGO:&P131_ID_RCDO_CNTROL.,&P131_ID_IMPSTO.,&P131_ID_IMPSTO_SBMPSTO.,&P131_ID_BNCO.,&P131_ID_BNCO_CNTA.,&P131_FCHA_CNTROL.,&P131_OBSRVCION.,&P131_CDGO_FRMA_PGO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(45077858345594157)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10817570666184613)
,p_branch_name=>'Go To Page 125'
,p_branch_action=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.:RP,125:P125_ID_IMPSTO,P125_ID_IMPSTO_SBMPSTO:&P131_ID_IMPSTO.,&P131_ID_IMPSTO_SBMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(10817361281184611)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16932455914508504)
,p_name=>'P131_CDGO_FRMA_PGO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(94410507408113008)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Forma de Pago'
,p_source=>'CDGO_FRMA_PGO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_frma_pgo d, cdgo_frma_pgo r',
'from re_d_recaudos_forma_pago',
'where actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Forma de Pago'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la Forma de Pago. '
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45083137433603065)
,p_name=>'P131_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(94410507408113008)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo:'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Tributo'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el Tributo.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'320'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45083504725603067)
,p_name=>'P131_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(94410507408113008)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo:'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'     , id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P131_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Sub-Tributo'
,p_lov_cascade_parent_items=>'P131_ID_IMPSTO'
,p_ajax_items_to_submit=>'P131_ID_IMPSTO,P131_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el Sub-Tributo. '
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'320'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45083991093603067)
,p_name=>'P131_ID_BNCO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(94410507408113008)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Banco:'
,p_source=>'ID_BNCO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_BANCOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and rcddor = ''S''',
'  order by cdgo_bnco'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Banco'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'320'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45084397415603067)
,p_name=>'P131_ID_BNCO_CNTA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(94410507408113008)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cuenta de Banco:'
,p_source=>'ID_BNCO_CNTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmro_cnta as d',
'       , id_bnco_cnta as r',
'    from df_c_bancos_cuenta',
'   where id_bnco    = :P131_ID_BNCO',
'order by nmro_cnta'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Cuenta'
,p_lov_cascade_parent_items=>'P131_ID_BNCO'
,p_ajax_items_to_submit=>'P131_ID_BNCO,P131_ID_BNCO_CNTA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45084762409603068)
,p_name=>'P131_FCHA_CNTROL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(94410507408113008)
,p_use_cache_before_default=>'NO'
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha de Recaudo:'
,p_source=>'FCHA_CNTROL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha de recaudo del lote'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-07:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45085120836603068)
,p_name=>'P131_ID_RCDO_CNTROL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(94410507408113008)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45085517696603069)
,p_name=>'P131_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(94410507408113008)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n:')
,p_source=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>110
,p_cMaxlength=>1000
,p_cHeight=>1
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('<i>Observaci\00F3n acerca del lote</i>')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45086488763603070)
,p_name=>'P131_BRANCH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(94410507408113008)
,p_item_default=>'125'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45203629892978301)
,p_name=>'P131_MNSJE_RSPSTA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(94410507408113008)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117429688311299034)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Recaudo Control'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    ',
'    pkg_re_recaudos.prc_ac_recaudo_control( p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                          , p_id_usrio          => :F_ID_USRIO',
'                                          , p_id_rcdo_cntrol    => :P131_ID_RCDO_CNTROL',
'                                          , p_id_impsto         => :P131_ID_IMPSTO',
'                                          , p_id_impsto_sbmpsto => :P131_ID_IMPSTO_SBMPSTO',
'                                          , p_id_bnco           => :P131_ID_BNCO',
'                                          , p_id_bnco_cnta      => :P131_ID_BNCO_CNTA',
'                                          , p_fcha_cntrol       => :P131_FCHA_CNTROL',
'                                          , p_obsrvcion         => :P131_OBSRVCION',
'                                          , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                          , o_mnsje_rspsta      => :P131_MNSJE_RSPSTA );',
'    ',
'    --Verifica si Hubo Error',
'    if( v_cdgo_rspsta <> 0 ) then ',
'        raise_application_error( -20001 , :P131_MNSJE_RSPSTA );',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(45077858345594157)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from re_g_recaudos',
' where id_rcdo_cntrol = :P131_ID_RCDO_CNTROL;'))
,p_process_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10817454968184612)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Recaudo Control'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    ',
'    pkg_re_recaudos.prc_el_recaudo_control( p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                          , p_id_usrio          => :F_ID_USRIO',
'                                          , p_id_rcdo_cntrol    => :P131_ID_RCDO_CNTROL',
'                                          , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                          , o_mnsje_rspsta      => :P131_MNSJE_RSPSTA );',
'    ',
'    --Verifica si Hubo Error',
'    if( v_cdgo_rspsta <> 0 ) then ',
'        raise_application_error( -20001 , :P131_MNSJE_RSPSTA );',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(10817361281184611)
,p_process_success_message=>'&P131_MNSJE_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45127193344821648)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Consultar Recaudo Control'
,p_attribute_02=>'RE_G_RECAUDOS_CONTROL'
,p_attribute_03=>'P131_ID_RCDO_CNTROL'
,p_attribute_04=>'ID_RCDO_CNTROL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P131_ID_RCDO_CNTROL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
