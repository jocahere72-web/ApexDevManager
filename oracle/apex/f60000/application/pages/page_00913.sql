prompt --application/pages/page_00913
begin
wwv_flow_api.create_page(
 p_id=>913
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>'Perfiles de Usuarios'
,p_step_title=>'Perfiles de Usuarios'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'$(''#''+id).click();',
'}',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-titulo {',
'    color: #0572ce;',
'    font-weight: 800;',
'    font-size: large;',
'}'))
,p_step_template=>wwv_flow_api.id(29911946739317080)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20240904093348'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86944519525673601)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(144518552402197915)
,p_plug_name=>'TAB_CONTAINER'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(409906915807083150)
,p_plug_name=>unistr('Asociaci\00F3n de Usuarios al Perfil')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(409908349578083164)
,p_plug_name=>unistr('<b>Men\00FAs otorgados al Perfil</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  case ',
'          when connect_by_isleaf = 1 then 0 ',
'          when level = 1 then 1 ',
'          else -1 ',
'        end as status,',
'        level,',
'        title,',
'         case',
'           when level = 1 then ''fa-bars''',
'           when (level > 1 and connect_by_isleaf = 0) then ''fa-folder-o'' ',
'           when ( level > 1 and connect_by_isleaf = 1) then ''fa-leaf''',
'           else ''fa-leaf''',
'        end as icon,',
'        id_mnu as value,',
'        title as tooltip, ',
'        null as link',
'from ',
'(select a.id_aplccion + 1000000 id_mnu, a.nmbre_aplccion title, null id_mnu_pdre, a.nmbre_aplccion tooltip, 1 orden, a.nmro_aplccion, pgna_incio nmro_pgna, null prmtro_cmpo, null prmtro_vlor',
'   from sg_g_aplicaciones a, v_sg_g_menu_x_perfil b',
'  where a.id_aplccion = b.id_aplccion',
'    and b.id_prfil = :P913_ID_PRFIL ',
'    and a.actvo = ''S''',
' union',
' select a.id_mnu, a.nmbre_mnu title, a.id_aplccion + 1000000 id_mnu_pdre, a.nmbre_mnu tooltip, a.orden, a.nmro_aplccion, a.nmro_pgna, a.prmtro_cmpo, a.prmtro_vlor',
' from v_sg_g_menu a, v_sg_g_menu_x_perfil b',
' where a.id_mnu_pdre is null',
'   and a.id_mnu = b.id_mnu ',
'   and a.actvo = ''S''',
'   and a.indcdor_vsble = 1',
'   and b.id_prfil = :P913_ID_PRFIL ',
' union',
' select a.id_mnu, a.nmbre_mnu title, a.id_mnu_pdre, a.nmbre_mnu tooltip, a.orden, a.nmro_aplccion, a.nmro_pgna, a.prmtro_cmpo, a.prmtro_vlor',
' from v_sg_g_menu a, v_sg_g_menu_x_perfil b',
' where a.id_mnu_pdre is not null',
'   and a.id_mnu = b.id_mnu ',
'   and a.actvo = ''S''',
'   and a.indcdor_vsble = 1',
'   and b.id_prfil = :P913_ID_PRFIL )',
'start with id_mnu_pdre is null',
'connect by prior id_mnu = id_mnu_pdre',
'order siblings by orden;'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'S'
,p_attribute_04=>'DB'
,p_attribute_07=>'APEX_TREE'
,p_attribute_08=>'fa'
,p_attribute_10=>'"3"'
,p_attribute_11=>'"2"'
,p_attribute_12=>'"4"'
,p_attribute_15=>'"1"'
,p_attribute_20=>'"5"'
,p_attribute_22=>'"6"'
,p_attribute_23=>'LEVEL'
,p_attribute_24=>'"7"'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(409909040252083171)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda ',
'                <i class="fa fa-question-circle" aria-hidden="true"></i>',
'             </center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'    Esta funcionalidad permite:',
'    <br>',
'    <br>',
'    <b>1.</b> Crear y Editar Perfil o Grupo de usuario',
'    <br>',
'    <br>',
'    <b>2.</b> Asociar Usuarios al Perfil o Grupo de Usuario <br>',
'    Los Usuarios asociados a un Perfil, heredan los privilegios del Perfil',
'    <br>',
'    <br>',
unistr('    <b>3.</b> Visualizar las opciones de Men\00FA que el Perfil tiene asociadas. <br>'),
'<br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario. </i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(86944602036673602)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(86944519525673601)
,p_button_name=>'BTN_NUEVO_PERFIL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Perfil'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:914:&SESSION.::&DEBUG.:RP,914::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103341034859277020)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(409906915807083150)
,p_button_name=>'BTN_GUARDAR_USUARIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103343611664277033)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(409908349578083164)
,p_button_name=>'COLLAPSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(29996886610317117)
,p_button_image_alt=>'Collapse'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103344060145277033)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(409908349578083164)
,p_button_name=>'EXPAND'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(29996886610317117)
,p_button_image_alt=>'Expander'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103340680343277017)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(144518552402197915)
,p_button_name=>'BTN_EDITAR_PERFIL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(29996765200317116)
,p_button_image_alt=>'Editar Perfil'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:914:&SESSION.::&DEBUG.:RP:P914_ID_PRFIL:&P913_ID_PRFIL.'
,p_icon_css_classes=>'fa-pencil'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103341474312277023)
,p_name=>'P913_ID_PRFIL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(144518552402197915)
,p_prompt=>'Perfil'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_prfil d,',
'        id_prfil r',
'   from sg_g_perfiles',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and indcdor_prfil_admnstdor = ''N''',
'union',
' select nmbre_prfil d,',
'        id_prfil r',
'   from sg_g_perfiles',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and exists (select id_usrio ',
'                  from v_sg_g_perfiles_usuario ',
'                 where id_usrio = :F_ID_USRIO',
'                   and id_prfil in (select id_prfil from sg_g_perfiles where indcdor_prfil_admnstdor = ''S''))',
'order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103342275088277030)
,p_name=>'P913_USUARIOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(409906915807083150)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Usuarios'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_usrio',
'from v_sg_g_perfiles_usuario',
'where id_prfil = :P913_ID_PRFIL'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro usuario,',
'       id_usrio',
'from v_sg_g_usuarios p',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and p.id_fncnrio is not null',
'ORDER BY 1 ASC'))
,p_cHeight=>10
,p_grid_column=>1
,p_grid_label_column_span=>0
,p_display_when=>'P913_ID_PRFIL'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(29996055472317115)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103346053752277044)
,p_name=>'AD_CERRA_DIALOGO_REGION_USUARIOS'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(409906915807083150)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103346511464277044)
,p_event_id=>wwv_flow_api.id(103346053752277044)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103346954962277045)
,p_name=>'COLLAPSE TREE'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103343611664277033)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103347471088277045)
,p_event_id=>wwv_flow_api.id(103346954962277045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(409908349578083164)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103347870970277046)
,p_name=>'EXPAND'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103344060145277033)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103348377319277047)
,p_event_id=>wwv_flow_api.id(103347870970277046)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(409908349578083164)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27072398530229908)
,p_name=>'Actualizar al cambiar de perfil'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P913_ID_PRFIL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27072427255229909)
,p_event_id=>wwv_flow_api.id(27072398530229908)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27072919739229914)
,p_name=>unistr('Actualizar Pag\00EDna')
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(144518552402197915)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27073777564229922)
,p_event_id=>wwv_flow_api.id(27072919739229914)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P913_ID_PRFIL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27073015406229915)
,p_event_id=>wwv_flow_api.id(27072919739229914)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27073592152229920)
,p_name=>unistr('Actualizar Pag\00EDna_1')
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(86944519525673601)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27073633124229921)
,p_event_id=>wwv_flow_api.id(27073592152229920)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103344766500277042)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GUARDAR USUARIOS POR PERFIL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_respuesta varchar2(200);',
'',
'begin',
'    v_respuesta := pkg_sg_autorizacion.fnc_asigna_usuario_perfil (:F_CDGO_CLNTE, :P913_ID_PRFIL, :P913_USUARIOS, :APP_USER, SYSTIMESTAMP);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103341034859277020)
);
end;
/
