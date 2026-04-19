prompt --application/pages/page_00202
begin
wwv_flow_api.create_page(
 p_id=>202
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Paso a Movimientos Financieros - Arrendamientos'
,p_step_title=>'Paso a Movimientos Financieros'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210401102447'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139943030368270737)
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
 p_id=>wwv_flow_api.id(107511048097209601)
,p_plug_name=>'<b>Total Paso a Cartera</b>'
,p_parent_plug_id=>wwv_flow_api.id(139943030368270737)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>5
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Total liquidaciones que pasaron a Mov. Financieros'' as label ',
'      ,  to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value ',
'   from gf_g_movimientos_financiero',
' where cdgo_clnte            = :F_CDGO_CLNTE',
'    and id_impsto            = :P203_IMPUESTO ',
'    and id_impsto_sbmpsto    = :P203_IMPUESTO_SUBIMPUESTO',
'    and id_prdo              = :P203_PERIODO ;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(427997003624511191)
,p_plug_name=>'<b>Arrendamientos Liquidado</b>'
,p_parent_plug_id=>wwv_flow_api.id(139943030368270737)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>5
,p_plug_grid_column_css_classes=>'badgeListColor5'
,p_plug_display_column=>5
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Arrendamientos Liquidados'' as label ',
'       , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value ',
'from  gi_g_liquidaciones a ',
'where cdgo_clnte            = :F_CDGO_CLNTE',
'	and id_impsto = :P203_IMPUESTO',
'    and id_impsto_sbmpsto = :P203_IMPUESTO_SUBIMPUESTO ',
'    and id_prdo = :P203_PERIODO;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(454213427438121193)
,p_plug_name=>unistr('Duraci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(139943030368270737)
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
' where id_instncia_trnscion = :P202_ID_INSTNCIA_TRNSCION'))
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
 p_id=>wwv_flow_api.id(612613770859578777)
,p_plug_name=>'<b>Total Paso a Cartera</b>'
,p_parent_plug_id=>wwv_flow_api.id(139943030368270737)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>5
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select    ''Total Mov. Financieros '' as label ',
'        , to_char(nvl(sum(vlor_dbe - vlor_hber),0) , ''FM999G999G999G999G999G999G990'')   as value',
'from gf_g_movimientos_financiero a join gf_g_movimientos_detalle b on a.id_mvmnto_fncro =   b.id_mvmnto_fncro',
'where a.cdgo_clnte            = :F_CDGO_CLNTE',
'    and a.id_impsto            = :P203_IMPUESTO ',
'    and a.id_impsto_sbmpsto    = :P203_IMPUESTO_SUBIMPUESTO',
'    and a.id_prdo              = :P203_PERIODO ;',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(239356961167445543)
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
'    ',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(241200554681042221)
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
,p_attribute_04=>'&P202_BTN_OCLTO.'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(286428056256862698)
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
 p_id=>wwv_flow_api.id(107492911085924784)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(286428056256862698)
,p_button_name=>'BTN_MVMTO_FNNCRO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Paso a <br> Movimientos Financieros'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea generar el paso a movimiento financiero?'', ''BTN_MVMTO_FNNCRO'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from gi_g_liquidaciones a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_impsto = :P202_IMPUESTO',
'    and a.id_impsto_sbmpsto = :P202_IMPUESTO_SUBIMPUESTO ',
'    and a.id_prdo = :P202_PERIODO ',
'    and not exists (select 1 ',
'                    from gf_g_movimientos_financiero b ',
'                    where a.cdgo_clnte = :F_CDGO_CLNTE',
'                        and a.id_lqdcion = b.id_orgen);'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108195513086406701)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(286428056256862698)
,p_button_name=>'BTN_RV_MVMTO_FNNCRO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Reversi\00F3n<br> Movimientos Financieros')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea revertir el paso a movimiento financiero?'', ''BTN_RV_MVMTO_FNNCRO'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from gi_g_liquidaciones a',
'where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_impsto = :P203_IMPUESTO',
'    and a.id_impsto_sbmpsto = :P203_IMPUESTO_SUBIMPUESTO ',
'    and a.id_prdo = :P203_PERIODO ',
'    and exists (select 1 ',
'                    from gf_g_movimientos_financiero b ',
'                    where  cdgo_clnte = :F_CDGO_CLNTE',
'                        and a.id_lqdcion = b.id_orgen);'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107493786810924785)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(286428056256862698)
,p_button_name=>'Btn_Revertir_Tarea'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Revertir Tarea'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107487529294924748)
,p_name=>'P202_ARCHIVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139943030368270737)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107487907793924751)
,p_name=>'P202_VIGENCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(139943030368270737)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107488218486924751)
,p_name=>'P202_PERIODO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(139943030368270737)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107488600647924752)
,p_name=>'P202_IMPUESTO_SUBIMPUESTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(139943030368270737)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107489044576924752)
,p_name=>'P202_IMPUESTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(139943030368270737)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107489465524924752)
,p_name=>'P202_ID_INSTNCIA_TRNSCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(139943030368270737)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107489809709924753)
,p_name=>'P202_BTN_OCLTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(139943030368270737)
,p_item_default=>'false'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108146230160933302)
,p_name=>'P202_MNSJE_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(139943030368270737)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(107495085075924789)
,p_computation_sequence=>30
,p_computation_item=>'P202_ID_INSTNCIA_TRNSCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_instncia_trnscion ',
'  from wf_g_instancias_transicion ',
' where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'   and id_fljo_trea_orgen = :F_ID_FLJO_TREA'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(107494223553924789)
,p_computation_sequence=>40
,p_computation_item=>'P202_BTN_OCLTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'true'
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select 1',
'  from gf_g_movimientos_financiero a',
' where id_prcso_crga = :P202_ARCHIVO*/',
' ',
' ',
' ',
' select 1 ',
'from gi_g_liquidaciones a',
'where cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_impsto = :P203_IMPUESTO',
'    and a.id_impsto_sbmpsto = :P203_IMPUESTO_SUBIMPUESTO ',
'    and a.id_prdo = :P203_PERIODO ',
'    and exists (select 1 ',
'                    from gf_g_movimientos_financiero b ',
'                    where b.cdgo_clnte = :F_CDGO_CLNTE',
'                        and a.id_lqdcion = b.id_orgen);'))
,p_compute_when_type=>'EXISTS'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(107494646008924789)
,p_computation_sequence=>50
,p_computation_item=>'P202_BTN_OCLTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'false'
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select 1',
'  from gf_g_movimientos_financiero a',
' where id_prcso_crga = :P202_ARCHIVO*/',
' ',
' ',
' ',
' select 1 ',
'from gi_g_liquidaciones a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_impsto = :P202_IMPUESTO',
'    and a.id_impsto_sbmpsto = :P202_IMPUESTO_SUBIMPUESTO ',
'    and a.id_prdo = :P202_PERIODO ',
'    and   exists (select 1 ',
'                    from gf_g_movimientos_financiero b ',
'                    where b.cdgo_clnte = :F_CDGO_CLNTE',
'                        and a.id_lqdcion = b.id_orgen);'))
,p_compute_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(107496500076924791)
,p_name=>'Al Dar Click'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(107493786810924785)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(107497062677924791)
,p_event_id=>wwv_flow_api.id(107496500076924791)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'revertirTarea();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107495764688924790)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Paso_Movimientos_Financieros'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'	v_cdgo_rspsta		         number;',
'	v_mnsje_rspsta		         varchar2(2000)	:= ''Inicio'';',
'',
'Begin',
'',
'       begin ',
'    ',
'           pkg_gi_arrendamiento.prc_rg_movimientos_financiero (   p_cdgo_clnte            =>  :F_CDGO_CLNTE ',
'                                                                , p_id_impsto       	  =>  :P202_IMPUESTO ',
'                                                                , p_id_impsto_sbmpsto	  =>  :P202_IMPUESTO_SUBIMPUESTO ',
'                                                                , p_id_prdo               =>  :P202_PERIODO ',
'                                                                , p_id_usrio              =>  :F_ID_USRIO ',
'                                                                , o_cdgo_rspsta           =>   v_cdgo_rspsta ',
'                                                                , o_mnsje_rspsta          =>  v_mnsje_rspsta);',
'       ',
'        :P202_MNSJE_RSPSTA := v_mnsje_rspsta ;',
'       ',
'         if(v_cdgo_rspsta <> 0) then',
'                 raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
'            end if;',
'            ',
'         exception',
'            when others then ',
'                rollback;',
'		        raise_application_error(-20001, ''2. '' ||v_mnsje_rspsta);',
'        end; ',
'',
'',
'End;'))
,p_process_error_message=>'Proceso terminado con errores'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(107492911085924784)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107496188818924790)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reversa_Paso_Movimientos_Financieros'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'',
'	v_cdgo_rspsta		         number;',
'	v_mnsje_rspsta		         varchar2(2000)	:= ''Inicio'';',
'',
'Begin',
'',
'       begin ',
'    ',
'           pkg_gi_arrendamiento.prc_rv_mvmnto_fnncro (   p_cdgo_clnte            =>  :F_CDGO_CLNTE ',
'                                                        , p_id_impsto       	  =>  :P202_IMPUESTO ',
'                                                        , p_id_impsto_sbmpsto	  =>  :P202_IMPUESTO_SUBIMPUESTO ',
'                                                        , p_vgncia	              =>  :P202_VIGENCIA',
'                                                        , p_id_prdo               =>  :P202_PERIODO ',
'                                                         , o_cdgo_rspsta           =>   v_cdgo_rspsta ',
'                                                        , o_mnsje_rspsta          =>  v_mnsje_rspsta);',
'       ',
'        :P202_MNSJE_RSPSTA := v_mnsje_rspsta ;',
'       ',
'         if(v_cdgo_rspsta <> 0) then',
'                 raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
'            end if;',
'            ',
'         exception',
'            when others then ',
'                rollback;',
'		        raise_application_error(-20001, ''2. '' ||v_mnsje_rspsta);',
'        end; ',
'',
'',
'End;',
'',
'',
' '))
,p_process_error_message=>'Proceso terminado con errores.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(108195513086406701)
,p_process_success_message=>'Proceso terminado exitosamente.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107495352474924790)
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
