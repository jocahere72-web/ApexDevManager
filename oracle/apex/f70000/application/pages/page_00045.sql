prompt --application/pages/page_00045
begin
wwv_flow_api.create_page(
 p_id=>45
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Paso Movimientos Financieros'
,p_step_title=>'Paso Movimientos Financieros'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20191115091506'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32456037483346001)
,p_plug_name=>'Paso a Cartera'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179222958035544966)
,p_plug_name=>'<b>Total Paso a Cartera Reversados</b>'
,p_parent_plug_id=>wwv_flow_api.id(32456037483346001)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Mov. Financieros Reversados'' as label ',
'      , to_char(nvl(sum(nmro_mvmnto_rvsdos),0) , ''FM999G999G999G999G999G999G990'')   as value',
'   from gf_g_movimientos_maestro',
' where cdgo_clnte            = :F_CDGO_CLNTE',
'    and id_impsto            = :P45_IMPUESTO',
'    and id_impsto_sbmpsto    = :P45_IMPUESTO_SUBIMPUESTO',
'    and vgncia               = :P45_VIGENCIA',
'    and id_prdo              = :P45_PERIODO',
'    and id_prcso_crga        = :P45_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(320510010739586455)
,p_plug_name=>'<b>Predios Liquidado</b>'
,p_parent_plug_id=>wwv_flow_api.id(32456037483346001)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_grid_column_css_classes=>'badgeListColor5'
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Predios Liquidados'' as label ',
'       , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where nmro_orden_igac = ''001''',
'    and id_prcso_crga   = :P45_ARCHIVO',
'    and estdo_rgstro    = ''L'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(346726434553196457)
,p_plug_name=>unistr('Duraci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(32456037483346001)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''HH:MI:SS'' as label',
'     , regexp_substr((fcha_incio - fcha_fnal), ''[[0-9]{2}:[[0-9]{2}:[[0-9]{2}.[[0-9]{2}'', 1 ,  1 ) as value',
unistr('     , ''Duraci\00F3n del proceso'' as value2'),
'  from wf_g_instncs_trnscn_estdtca',
' where id_instncia_trnscion = :P45_ID_INSTNCIA_TRNSCION'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'VALUE2'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(505125891758647173)
,p_plug_name=>'<b>No. Paso a Cartera Exitosos</b>'
,p_parent_plug_id=>wwv_flow_api.id(32456037483346001)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_grid_column_css_classes=>'badgeListColor4'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Mov. Financieros Exitosos'' as label ',
'      , to_char(nvl(sum(nmro_mvmnto_extsa),0) , ''FM999G999G999G999G999G999G990'') as value',
'   from gf_g_movimientos_maestro',
' where cdgo_clnte           = :F_CDGO_CLNTE',
'    and id_impsto            = :P45_IMPUESTO',
'    and id_impsto_sbmpsto    = :P45_IMPUESTO_SUBIMPUESTO',
'    and vgncia               = :P45_VIGENCIA',
'    and id_prdo              = :P45_PERIODO',
'    and id_prcso_crga        = :P45_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(505126113569653072)
,p_plug_name=>'<b>No. Registros con inconsistencias</b>'
,p_parent_plug_id=>wwv_flow_api.id(32456037483346001)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros con Inconsistencias'' as label ',
'      , to_char(nvl(sum(nmro_mvmnto_error),0) , ''FM999G999G999G999G999G999G990'') as value',
'   from gf_g_movimientos_maestro',
'  where cdgo_clnte           = :F_CDGO_CLNTE',
'    and id_impsto            = :P45_IMPUESTO',
'    and id_impsto_sbmpsto    = :P45_IMPUESTO_SUBIMPUESTO',
'    and vgncia               = :P45_VIGENCIA',
'    and id_prdo              = :P45_PERIODO',
'    and id_prcso_crga        = :P45_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(505126777974654041)
,p_plug_name=>'<b>Total Paso a Cartera</b>'
,p_parent_plug_id=>wwv_flow_api.id(32456037483346001)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Mov. Financieros Total'' as label ',
'      , to_char(nvl(sum(nmro_mvmnto_ttal),0) , ''FM999G999G999G999G999G999G990'')   as value',
'   from gf_g_movimientos_maestro',
' where cdgo_clnte            = :F_CDGO_CLNTE',
'    and id_impsto            = :P45_IMPUESTO',
'    and id_impsto_sbmpsto    = :P45_IMPUESTO_SUBIMPUESTO',
'    and vgncia               = :P45_VIGENCIA',
'    and id_prdo              = :P45_PERIODO',
'    and id_prcso_crga        = :P45_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(131869968282520807)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
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
'    Funcionalidad que permite: <br/><br/>',
'    <b>1.</b> Generar el paso a movimientos financieros.<br/><br/>',
unistr('    <b>2.</b> Visualizar la informaci\00F3n de las cr\00EDticas de paso a movimientos financieros.<br/><br/>'),
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(133713561796117485)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'F_ID_INSTNCIA_FLJO'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'&P45_BTN_OCLTO.'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178941063371937962)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 ',
'   from wf_g_instancias_transicion',
'  where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'    and id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'    and id_estdo_trnscion  in ( 1 , 2 )'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(178941190369937963)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(178941063371937962)
,p_button_name=>'Btn_Paso_Movimientos_Financieros'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Paso a <br> Movimientos Financieros'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from gf_g_movimientos_maestro ',
'where cdgo_clnte           = :F_CDGO_CLNTE',
'  and id_impsto            = :P45_IMPUESTO',
'  and id_impsto_sbmpsto    = :P45_IMPUESTO_SUBIMPUESTO',
'  and vgncia               = :P45_VIGENCIA',
'  and id_prdo              = :P45_PERIODO',
'  and id_prcso_crga        = :P45_ARCHIVO',
'  and estdo = ''Iniciada'';'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(178941261363937964)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(178941063371937962)
,p_button_name=>'Btn_Reversa_Paso_Movimientos_Financieros'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reversar de Paso a <br> Movimientos Financieros'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from gf_g_movimientos_maestro ',
'where cdgo_clnte           = :F_CDGO_CLNTE',
'  and id_impsto            = :P45_IMPUESTO',
'  and id_impsto_sbmpsto    = :P45_IMPUESTO_SUBIMPUESTO',
'  and vgncia               = :P45_VIGENCIA',
'  and id_prdo              = :P45_PERIODO',
'  and id_prcso_crga        = :P45_ARCHIVO  ',
'  and estdo                != ''Reversada''',
'  and (select estdo_instncia ',
'         from wf_g_instancias_flujo ',
'        where id_instncia_fljo = :F_ID_INSTNCIA_FLJO ) != ''FINALIZADA'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106192239275276501)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(178941063371937962)
,p_button_name=>'Btn_Revertir_Tarea'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Revertir Tarea'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35845504584501101)
,p_name=>'P45_BTN_OCLTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(32456037483346001)
,p_item_default=>'false'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52196772691668201)
,p_name=>'P45_ARCHIVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(32456037483346001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64799168706172501)
,p_name=>'P45_VIGENCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(32456037483346001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64799255830172502)
,p_name=>'P45_PERIODO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(32456037483346001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64799336143172503)
,p_name=>'P45_IMPUESTO_SUBIMPUESTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(32456037483346001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64799434589172504)
,p_name=>'P45_IMPUESTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(32456037483346001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115597137184507201)
,p_name=>'P45_ID_INSTNCIA_TRNSCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(32456037483346001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(115593817271498264)
,p_computation_sequence=>30
,p_computation_item=>'P45_ID_INSTNCIA_TRNSCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_instncia_trnscion ',
'  from wf_g_instancias_transicion ',
' where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'   and id_fljo_trea_orgen = :F_ID_FLJO_TREA'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(37312900251877601)
,p_computation_sequence=>40
,p_computation_item=>'P45_BTN_OCLTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'true'
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gf_g_movimientos_financiero a',
' where id_prcso_crga = :P45_ARCHIVO'))
,p_compute_when_type=>'EXISTS'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(37327686331086901)
,p_computation_sequence=>50
,p_computation_item=>'P45_BTN_OCLTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'false'
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gf_g_movimientos_financiero a',
' where id_prcso_crga = :P45_ARCHIVO'))
,p_compute_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106192320540276502)
,p_name=>'Al Dar Click'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(106192239275276501)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106192450372276503)
,p_event_id=>wwv_flow_api.id(106192320540276502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'revertirTarea();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(171613183678482668)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Paso_Movimientos_Financieros'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_msj varchar2(5000);',
'    v_intres_mora number;',
'begin',
'',
' --Inicia la Estadistica',
'    insert into wf_g_instncs_trnscn_estdtca ( id_instncia_trnscion , obsrvcion )',
'         values ( :P45_ID_INSTNCIA_TRNSCION , ''Proceso de Paso Movimientos Financieros'');',
'				',
'    v_msj := pkg_gf_movimientos_financiero.fnc_gn_ps_lqdcion_mvmnto_msvo (p_cdgo_clnte 			=> :F_CDGO_CLNTE, ',
'																	      p_id_impsto 			=> :P45_IMPUESTO, ',
'																	      p_id_impsto_sbmpsto 	=> :P45_IMPUESTO_SUBIMPUESTO, ',
'																	      p_vgncia 				=> :P45_VIGENCIA, ',
'																	      p_id_prdo 			=> :P45_PERIODO ,',
'																	      p_id_prcso_crga       => :P45_ARCHIVO );  ',
'                                                                          ',
'    --Finaliza la Estadistica',
'     update wf_g_instncs_trnscn_estdtca',
'        set fcha_fnal            = systimestamp',
'      where id_instncia_trnscion = :P45_ID_INSTNCIA_TRNSCION;                                                                      ',
'end;'))
,p_process_error_message=>'Proceso terminado con errores'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(178941190369937963)
,p_process_success_message=>'Proceso terminado exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(178941337593937965)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reversa_Paso_Movimientos_Financieros'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_msj varchar2(5000);',
'',
'begin',
'',
'v_msj := pkg_gf_movimientos_financiero.fnc_rv_ps_lqdcion_mvmnto_msvo (p_cdgo_clnte 			=> :F_CDGO_CLNTE, ',
'																	  p_id_impsto 			=> :P45_IMPUESTO, ',
'																	  p_id_impsto_sbmpsto 	=> :P45_IMPUESTO_SUBIMPUESTO, ',
'																	  p_vgncia 				=> :P45_VIGENCIA, ',
'																	  p_id_prdo 			=> :P45_PERIODO ,',
'																	  p_id_prcso_crga       => :P45_ARCHIVO );                                                                    ',
'',
'--Elimina la Estadistica',
'   delete wf_g_instncs_trnscn_estdtca',
'    where id_instncia_trnscion = :P45_ID_INSTNCIA_TRNSCION;',
'             ',
'end;'))
,p_process_error_message=>'Proceso terminado con errores.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(178941261363937964)
,p_process_success_message=>'Proceso terminado exitosamente.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(37903699068448601)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Al Finalizar Flujo LQ'
,p_process_sql_clob=>'null;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'FINISH_WORKFLOW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'okajja'
);
end;
/
