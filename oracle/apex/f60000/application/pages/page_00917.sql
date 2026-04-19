prompt --application/pages/page_00917
begin
wwv_flow_api.create_page(
 p_id=>917
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>unistr('Men\00FA por Perfil')
,p_step_title=>unistr('Men\00FA por Perfil')
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script>',
'function asignar_pagina_perfil(p_id_mnu) { ',
'     $x(''P917_COD_NODO_SELECCIONADO'').value = p_id_mnu; ',
unistr('     //alert(''C\00F3digo: '' + p_id_mnu);'),
'     apex.submit(''AGREGAR_PAGINA_PERFIL''); ',
'}',
'</script>'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'$(''#''+id).click();',
'}',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_css_file_urls=>'https://swisnl.github.io/jQuery-contextMenu/dist/jquery.contextMenu.css'
,p_step_template=>wwv_flow_api.id(29911946739317080)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101164801'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31770602006501107)
,p_plug_name=>'Display Selector '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31770794368501108)
,p_plug_name=>'Menus'
,p_parent_plug_id=>wwv_flow_api.id(31770602006501107)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(399379557384961205)
,p_plug_name=>unistr('<b>Men\00FAs Disponibles</b>')
,p_region_name=>'A1'
,p_parent_plug_id=>wwv_flow_api.id(31770794368501108)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  case ',
'          when connect_by_isleaf = 1 then 0 ',
'          when level = 1 then 1 ',
'          else -1 ',
'        end as status,',
'        level,',
'        nmbre_mnu,',
'         case',
'           when connect_by_isleaf = 0 then ''fa-folder-o''',
'           when (connect_by_isleaf = 1 and level > 1) then ''fa-leaf''',
'           else ''fa-leaf''',
'        end as icon,',
'        id_mnu as value,',
'        nmbre_mnu as tooltip,        ',
'       ''javascript:asignar_pagina_perfil(''||id_mnu||'');'' as link  ',
'from ',
'(',
'select id_mnu, nmbre_mnu, id_mnu_pdre, orden  ',
'  from v_sg_g_menu ',
' where  id_aplccion = :P917_ID_APLCCION',
'   and (id_mnu not in (select id_mnu from v_sg_g_menu_x_perfil where id_aplccion =  :P917_ID_APLCCION   and id_prfil = :P917_ID_PRFIL) )',
'   and indcdor_vsble = 1   ',
'union    ',
'select id_mnu, nmbre_mnu, id_mnu_pdre, orden ',
'  from v_sg_g_menu ',
'where id_mnu in (select id_mnu_pdre',
'                   from v_sg_g_menu ',
'                  where id_aplccion = :P917_ID_APLCCION  ',
'                    and (id_mnu not in (select id_mnu from v_sg_g_menu_x_perfil where id_aplccion = :P917_ID_APLCCION and id_prfil = :P917_ID_PRFIL) )',
'                    and indcdor_vsble = 1)',
'union ',
'select id_mnu, nmbre_mnu,id_mnu_pdre, orden ',
'  from v_sg_g_menu ',
' where id_mnu in (select id_mnu_pdre ',
'                    from v_sg_g_menu ',
'                   where id_mnu in (select id_mnu_pdre',
'                                      from v_sg_g_menu ',
'                                     where id_aplccion = :P917_id_aplccion  ',
'                                       and (id_mnu not in (select id_mnu from v_sg_g_menu_x_perfil where id_aplccion =  :P917_id_aplccion   and id_prfil = :P917_id_prfil) )',
'                                       and indcdor_vsble = 1))',
')                                          ',
' start with id_mnu_pdre is null',
'connect by prior id_mnu = id_mnu_pdre',
'order siblings by orden;',
''))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(103270260792132846)
,p_attribute_02=>'D'
,p_attribute_03=>'P917_NODO_SELECCIONADO_D'
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
 p_id=>wwv_flow_api.id(399379702915961206)
,p_plug_name=>unistr('<b>Men\00FAs Otorgados</b>')
,p_region_name=>'arbol'
,p_parent_plug_id=>wwv_flow_api.id(31770794368501108)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   case ',
'          when connect_by_isleaf = 1 then 0 ',
'          when level = 1 then 1 ',
'          else -1 ',
'        end as status,',
'        level,',
'        title,',
'        case',
'           when connect_by_isleaf = 0 then ''fa-folder-o''',
'           when (connect_by_isleaf = 1 and level > 1) then ''fa-leaf''',
'           else ''fa-leaf''',
'        end as icon,',
'        id_mnu as value,',
'        title as tooltip,',
'        apex_util.prepare_url( ''f?p='' || :app_id || '':918:'' || :app_session || ''::NO:918:P918_ID_MNU,P918_ID_APLCCION,P918_ID_PRFIL:''||id_mnu || '','' ||:P917_id_aplccion || '','' ||:P917_id_prfil)as link',
'from ',
'(',
' select distinct a.id_mnu, a.nmbre_mnu title, id_mnu_pdre, a.nmbre_mnu tooltip, a.orden, a.nmro_aplccion, a.nmro_pgna, a.prmtro_cmpo, a.prmtro_vlor',
' from v_sg_g_menu a, v_sg_g_menu_x_perfil b',
' where b.id_aplccion = :P917_ID_APLCCION ',
'   and b.id_aplccion = a.id_aplccion',
'   and b.id_prfil = :P917_ID_PRFIL',
'   and a.id_mnu = b.id_mnu',
'   and a.id_mnu_pdre is null',
'   and a.actvo = ''S''',
'   and a.indcdor_vsble = 1',
' union',
' select distinct a.id_mnu, a.nmbre_mnu title, a.id_mnu_pdre, a.nmbre_mnu tooltip, a.orden, a.nmro_aplccion, a.nmro_pgna, a.prmtro_cmpo, a.prmtro_vlor',
' from v_sg_g_menu a, v_sg_g_menu_x_perfil b',
' where  b.id_aplccion = :P917_ID_APLCCION ',
'   and b.id_aplccion = a.id_aplccion',
'   and b.id_prfil = :P917_ID_PRFIL',
'   and a.id_mnu = b.id_mnu',
'   and a.id_mnu_pdre is not null',
'   and a.actvo = ''S''',
'   and a.indcdor_vsble = 1)',
' start with id_mnu_pdre is null',
'connect by prior id_mnu = id_mnu_pdre',
'order siblings by orden;'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(103270260792132846)
,p_attribute_02=>'D'
,p_attribute_03=>'P917_NODO_SELECCIONADO_O'
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
 p_id=>wwv_flow_api.id(31770892048501109)
,p_plug_name=>'Usuarios'
,p_parent_plug_id=>wwv_flow_api.id(31770602006501107)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P917_ID_PRFIL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(398993508397285117)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></i> </b></h5>',
'<i>',
'<p align="justify">',
unistr('Esta funcionalidad le permite Otorgar o Revocar privilegios sobre los men\00FAs a los diferentes perfiles.'),
'<br><br>',
'',
unistr('<b>1.</b> En la regi\00F3n de par\00E1metros de "Par\00E1metros de Consulta",  Usted debe escoger el Pefil al cual le desea otrogar o revocar privilegios.'),
'<br><br>',
'',
unistr('<b>2.</b> Seleccione la aplicaci\00F3n sobre la cual desea otorgar o revocar privilegios'),
'<br><br>',
'',
unistr('<b>3.</b> Observar\00E1 que se actualizan los \00E1rboles de "Men\00FAs Disponibles" para poder otrogar, y se actualiza el \00E1rbol de "Men\00FAs Otorgados", los cuales puede Revocar.'),
'<br><br>',
unistr('De igual forma se muestran en la pesta\00F1a de "Usuario" los usuarios que tienen otorgado el perfil seleccionado.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario. '),
'</i>',
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(103270260792132846)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(399379063716961200)
,p_plug_name=>unistr('Par\00E1metros de Consulta')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(29933691268317090)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(103270260792132846)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31771064554501111)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(31770892048501109)
,p_button_name=>'BTN_GUARDAR_USUARIOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar Usuarios'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27072883601229913)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(399379063716961200)
,p_button_name=>'BTN_CONSULTA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31770994396501110)
,p_name=>'P917_USUARIOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(31770892048501109)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Usuarios'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_usrio',
'from v_sg_g_perfiles_usuario',
' where id_prfil = :P917_ID_PRFIL'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro usuario,',
'       id_usrio',
'from v_sg_g_usuarios p',
'where cdgo_clnte = :F_CDGO_CLNTE'))
,p_cHeight=>5
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29996055472317115)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103432976425320925)
,p_name=>'P917_NODO_SELECCIONADO_D'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(399379557384961205)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103433383954320929)
,p_name=>'P917_COD_NODO_SELECCIONADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(399379557384961205)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103434024362320931)
,p_name=>'P917_NODO_SELECCIONADO_O'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(399379702915961206)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103435088243320932)
,p_name=>'P917_ID_PRFIL'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(399379063716961200)
,p_prompt=>'Perfil'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_prfil, ',
'       id_prfil ',
'  from sg_g_perfiles',
' where cdgo_clnte = :F_CDGO_CLNTE',
'order by nmbre_prfil'))
,p_lov_display_null=>'YES'
,p_colspan=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103435486092320932)
,p_name=>'P917_ID_APLCCION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(399379063716961200)
,p_prompt=>unistr('Aplicaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_aplccion || '' - '' || nmbre_aplccion nmbre_aplccion , ',
'       id_aplccion ',
'  from v_sg_g_aplicaciones_cliente ',
'where cdgo_clnte = :F_CDGO_CLNTE ',
'  and actvo = ''S''',
'  and actvo_app = ''S''',
'  and id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103435875883320933)
,p_name=>'P917_RESPUESTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(399379063716961200)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103436679002320947)
,p_name=>'PRUEBA'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103437135926320948)
,p_event_id=>wwv_flow_api.id(103436679002320947)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''a[role="treeitem"]'').each(function(){',
'		',
'    var cadena = $(this).text(); // Cadena',
'    var long_cad = cadena.length; //Longitud de toda la cadena',
'',
'    var lim = cadena.indexOf("-");',
'',
'    var sub_str_cod = cadena.substring(0,lim);',
'    var sub_str_lab = cadena.substring(lim+1,long_cad);',
'',
'    //console.log("Code: "+ sub_str_cod);',
'    //console.log("Label: "+ sub_str_lab);',
'',
'    $(this).html(sub_str_lab);',
'',
'   /* $(this).click(function(){',
'        alert(sub_str_cod);',
'    });*/',
'',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103439382976320949)
,p_name=>'AL_CERRAR_DIALOGO'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(399379702915961206)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103439839766320949)
,p_event_id=>wwv_flow_api.id(103439382976320949)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103436230748320946)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AGREGAR_PAGINA_PERFIL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_msj varchar2(200);',
'v_nodo_seleccionado_disponible number;',
'',
'begin',
'',
'    v_msj := pkg_sg_autorizacion.fnc_asigna_pagina_perfil (:F_CDGO_CLNTE, :F_ID_APLCCION_GRPO, :P917_ID_PRFIL, :P917_COD_NODO_SELECCIONADO, :APP_USER, SYSTIMESTAMP );',
'',
'    -- Buscando Menu padre, del menu que fue asignado',
'    begin',
'        select id_mnu_pdre ',
'          into v_nodo_seleccionado_disponible  ',
'          from v_sg_g_menu ',
'         where id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'           and cdgo_clnte = :F_CDGO_CLNTE',
'           and id_mnu = :P917_COD_NODO_SELECCIONADO;',
'',
'        :P917_NODO_SELECCIONADO_O := :P917_COD_NODO_SELECCIONADO; ',
'        :P917_NODO_SELECCIONADO_D := v_nodo_seleccionado_disponible;',
'    exception',
'        when others then ',
'            :P917_NODO_SELECCIONADO_O := null; ',
'            :P917_NODO_SELECCIONADO_D := null;',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'AGREGAR_PAGINA_PERFIL'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31771124475501112)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GUARDAR USUARIOS POR PERFIL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_respuesta varchar2(200);',
'',
'begin',
'    v_respuesta := pkg_sg_autorizacion.fnc_asigna_usuario_perfil (:F_CDGO_CLNTE, :P917_ID_PRFIL, :P917_USUARIOS, :APP_USER, SYSTIMESTAMP);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(31771064554501111)
);
end;
/
