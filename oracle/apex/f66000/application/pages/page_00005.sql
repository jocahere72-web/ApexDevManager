prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>unistr('Recaudo por Par\00E1metros')
,p_step_title=>'Reportes de Recaudo'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'  font-weight: 700;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250130162645'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97885714842141801)
,p_plug_name=>'Reportes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63575094982963606)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(97885714842141801)
,p_button_name=>'Btn_Imprimir'
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
 p_id=>wwv_flow_api.id(63574773835963603)
,p_branch_name=>'Imprimir_JSON'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE:&P5_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(63575094982963606)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P5_TPO_IMPRSN'
,p_branch_condition_text=>'PDF'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12378863092437101)
,p_name=>'P5_ID_CNTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_prompt=>unistr('N\00FAmero de Cuenta')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_cnta as d,',
'       id_bnco_cnta as r',
'from df_c_bancos_cuenta',
'where id_bnco = :P5_ID_BNCO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P5_ID_BNCO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12379030124437103)
,p_name=>'P5_TPO_IMPRSN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_item_default=>'PDF'
,p_prompt=>'Formato (PDF - EXCEL)'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'STATIC:PDF;PDF,EXCEL;EXL'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'150'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22095231484774706)
,p_name=>'P5_NMBRE_RPRTE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63574891582963604)
,p_name=>'P5_JSON'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63575185361963607)
,p_name=>'P5_ID_RPRTE_PRMTRO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97885870521141802)
,p_name=>'P5_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97885975183141803)
,p_name=>'P5_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Fin'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P5_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97886066146141804)
,p_name=>'P5_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte d ',
'     , id_rprte r   ',
'  from gn_d_reportes',
' where cdgo_rprte_grpo = ''RV1''',
' and actvo=''S'';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Reporte'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97886556729141809)
,p_name=>'P5_ID_BNCO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_prompt=>'Banco'
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
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97924078185365722)
,p_name=>'P5_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_prompt=>'Tributo'
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
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97924332403368196)
,p_name=>'P5_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(97885714842141801)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto_sbmpsto  as d,',
'       b.id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto b',
' where b.cdgo_clnte = :F_CDGO_CLNTE ',
'   and b.id_impsto = :P5_ID_IMPSTO',
'   and (exists (select 1',
'                  from sg_g_usuarios_subimpuesto a',
'                 where a.id_usrio = :F_ID_USRIO',
'                   and a.id_impsto = b.id_impsto',
'                   and a.id_impsto_sbmpsto = b.id_impsto_sbmpsto) or',
'        (select count(*)',
'                  from sg_g_usuarios_subimpuesto a',
'                 where a.id_usrio = :F_ID_USRIO',
'                   and a.id_impsto = b.id_impsto) = 0)',
' order by 1',
' ',
' ',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P5_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97886173746141805)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97886233197141806)
,p_event_id=>wwv_flow_api.id(97886173746141805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P5_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P5_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12491521976976801)
,p_name=>'Al cambiar P5_ID_RPRTE'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_ID_RPRTE'
,p_condition_element=>'P5_ID_RPRTE'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'503,581'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12491676471976802)
,p_event_id=>wwv_flow_api.id(12491521976976801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_TPO_IMPRSN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12491784300976803)
,p_event_id=>wwv_flow_api.id(12491521976976801)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_TPO_IMPRSN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(155907573734400521)
,p_event_id=>wwv_flow_api.id(12491521976976801)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_TPO_IMPRSN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'PDF'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63574958713963605)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_nmbre_rprte             gn_d_reportes.nmbre_rprte%type;',
'     v_object json_object_t := json_object_t(); ',
'     v_json                    clob;',
'     v_cdgo_impsto             varchar2(5);',
'begin          ',
'    --Busca el Nombre del Reporte',
'    select nmbre_rprte',
'    into   v_nmbre_rprte',
'    from   gn_d_reportes',
'    where  id_rprte = :P5_ID_RPRTE;',
'      ',
'    if :P5_ID_IMPSTO is not null then',
'        select cdgo_impsto ',
'        into   v_cdgo_impsto',
'        from   df_c_impuestos',
'        where  id_impsto = :P5_ID_IMPSTO;',
'    end if;',
'      ',
unistr('    --A\00F1adimos datos al JSON '),
'    v_object.put(''fcha_incial'', :P5_FCHA_INCIO);',
'    v_object.put(''fcha_fnal'', :P5_FCHA_FIN);   ',
'    v_object.put(''id_impsto'', :P5_ID_IMPSTO);',
'    v_object.put(''id_impsto_sbmpsto'', :P5_ID_IMPSTO_SBMPSTO);',
'    v_object.put(''id_bnco'', :P5_ID_BNCO);',
'    v_object.put(''id_bnco_cnta'', :P5_ID_CNTA);',
'    v_object.put(''cdgo_impsto'', v_cdgo_impsto);',
'    v_object.put(''nmbre_rprte'', v_nmbre_rprte);',
'    ',
'    v_json := v_object.to_clob();',
'    ',
'    --insert into muerto (n_001, v_001, c_001) values (525252, ''Json reporte'', v_json);commit;',
'    ',
'    --seteamos el JSON en la pagina de impresion',
'    apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );    ',
'    apex_util.set_session_state(''P37_JSON'', v_json);   ',
'         ',
'exception',
'     when no_data_found then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(63575094982963606)
,p_process_when=>'P5_TPO_IMPRSN'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'PDF'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12378941230437102)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir Reportes en Excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  v_num_fla       number := 6;     -- Numero de filas del excel',
'  v_num_col       number := 0;     -- Inicio de columnas',
'  v_bfile         bfile;           -- Apuntador del documento en disco',
'  o_file_blob     blob;            -- Archivo blob de salida',
'  v_directorio    clob;            -- Directorio donde caera el archivo',
'  v_file_name     varchar2(3000);  -- Nombre del rachivo',
'  v_file_blob     blob;            ',
'  v_nmbre_clnte   varchar2(1000); ',
'  v_slgan         varchar2(1000); ',
'  v_nit           varchar2(1000);  ',
'  v_nmbre_dcmnto  varchar2(500);',
'  v_cdgo_impstoo   varchar2(5);',
'  v_nmbre_impstoo  varchar2(100);',
'begin',
'  -- Datos del cliente',
'  begin',
'      select  upper(nmbre_clnte), nmro_idntfccion, upper(slgan)',
'      into  v_nmbre_clnte , v_nit, v_slgan',
'      from df_s_clientes',
'      where cdgo_clnte = :F_CDGO_CLNTE;',
'   exception when no_data_found then',
'      raise_application_error(-20001, ''No fue posible consultar los datos del cliente.'' ); ',
'  end;',
'  ',
'    begin',
'        if :P5_ID_IMPSTO is not null then',
'            select cdgo_impsto, nmbre_impsto ',
'            into   v_cdgo_impstoo, v_nmbre_impstoo',
'            from   df_c_impuestos',
'            where  id_impsto = :P5_ID_IMPSTO;',
'        else',
'            v_cdgo_impstoo  := null;',
'            v_nmbre_impstoo := ''TODOS LOS IMPUESTOS'';',
'        end if;',
'    exception when no_data_found then',
'        raise_application_error(-20001, ''No fue posible consultar los datos del impuesto.'' ); ',
'    end;  ',
'  ',
'    o_file_blob  :=  empty_blob(); -- Inicializacion del blob ',
'    v_directorio := ''COPIAS'';      -- Nombre del directorio donde caera el archivo',
'    v_file_name  := ''Temp_.xlsx'';  -- Nombre del archivo',
'',
'    --se crea un hoja       ',
'    as_xlsx.new_sheet(''Recaudos'');',
'',
'    --combinamos celdas  ',
'    as_xlsx.mergecells( 1, 1, 10, 1 );  --Cliente',
'    as_xlsx.mergecells( 1, 2, 10, 2 );  --Slogan',
'    as_xlsx.mergecells( 1, 3, 10, 3 );  --Nit',
'    as_xlsx.mergecells( 1, 4, 10, 4 );  --fecha',
'    as_xlsx.mergecells( 1, 5, 10, 5 );  --fecha',
'  ',
'    --estilos de encabezado',
'    as_xlsx.cell( 1, 2 , v_slgan, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'',
'    as_xlsx.cell( 1, 1 , v_nmbre_clnte, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));                                    ',
'',
'    as_xlsx.cell( 1, 3 , ''Nit. '' || v_nit, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'',
'    as_xlsx.cell( 1, 4, ''Impuesto: ''||v_nmbre_impstoo, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'',
'    as_xlsx.cell( 1, 5, ''Fecha Inicial: ''||:P5_FCHA_INCIO||'' - ''||''Fecha Final: ''||:P5_FCHA_FIN, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                   , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12)); ',
'',
'    -- Aliniar fila 6 del excel y creamos filtro',
'    as_xlsx.set_row(p_row  => 5',
'                , p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center'')',
'                , p_fontId    => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 11));  ',
'',
'',
'    as_xlsx.set_autofilter( 1, 10, p_row_start => 6, p_row_end => 6 ); --Filtro',
'  ',
'    --Nombre de las columnas',
'    if v_cdgo_impstoo = ''IPU'' then',
'        v_nmbre_dcmnto := ''RECAUDO PREDIAL CONCEPTO ''||:P5_FCHA_INCIO||'' - ''||:P5_FCHA_FIN;',
'        as_xlsx.cell( 1, v_num_fla ,''BANCO'');',
'        as_xlsx.cell( 2, v_num_fla ,''CUENTA'');',
unistr('        as_xlsx.cell( 3, v_num_fla ,''DESCRIPCI\00D3N PREDIO CLASIFICACI\00D3N'');'),
'    elsif v_cdgo_impstoo = ''ICA'' then',
'        v_nmbre_dcmnto := ''RECAUDO ICA CONCEPTO ''||:P5_FCHA_INCIO||'' - ''||:P5_FCHA_FIN;',
'        as_xlsx.cell( 1, v_num_fla ,''BANCO'');',
'        as_xlsx.cell( 2, v_num_fla ,''CUENTA'');',
'        as_xlsx.cell( 3, v_num_fla ,''TIPO ESTABLECIMIENTO''); ',
'    else',
'        v_nmbre_dcmnto := ''RECAUDO DE IMPUESTOS ''||:P5_FCHA_INCIO||'' - ''||:P5_FCHA_FIN;',
'        as_xlsx.cell( 1, v_num_fla ,''BANCO'');',
'        as_xlsx.cell( 2, v_num_fla ,''CUENTA'');',
unistr('        as_xlsx.cell( 3, v_num_fla ,''DESCRIPCI\00D3N DEL SUJETO IMPUESTO''); '),
'    end if;',
'  ',
'    as_xlsx.cell( 4, v_num_fla , ''CODIGO CONCEPTO'');',
'    as_xlsx.cell( 5, v_num_fla , ''DESCRIPCION CONCEPTO'');',
'    as_xlsx.cell( 6, v_num_fla , ''VIGENCIA'');',
'    as_xlsx.cell( 7, v_num_fla , ''CAPITAL'');',
'    as_xlsx.cell( 8, v_num_fla , ''INTERES'');',
'    as_xlsx.cell( 9, v_num_fla , ''SALDO FAVOR'');',
'    as_xlsx.cell( 10, v_num_fla ,''TOTAL'');',
'',
'    --Ancho de las columnas           ',
'    as_xlsx.set_column_width ( p_col => 1, p_width => 28);--NUMERO DE BANCO',
unistr('    as_xlsx.set_column_width ( p_col => 2, p_width => 33);--DESCRIPCI\00D3N PREDIO CLASIFICACI\00D3N'),
unistr('    as_xlsx.set_column_width ( p_col => 3, p_width => 28);--DESCRIPCI\00D3N CONCEPTO'),
'    as_xlsx.set_column_width ( p_col => 4, p_width => 30);--VIGENCIA ANTERIOR CAPITAL',
'    as_xlsx.set_column_width ( p_col => 5, p_width => 30);--VIGENCIA ANTERIOR INTERES',
'    as_xlsx.set_column_width ( p_col => 6, p_width => 30);--VIGENCIA ANTERIOR SALDO FAVOR',
'    as_xlsx.set_column_width ( p_col => 7, p_width => 30);--VIGENCIA ACTUAL CAPITAL',
'    as_xlsx.set_column_width ( p_col => 8, p_width => 30);--VIGENCIA ACTUAL INTERES',
'    as_xlsx.set_column_width ( p_col => 9, p_width => 30);--VIGENCIA ACTUAL SALDO FAVOR',
'    as_xlsx.set_column_width ( p_col => 10, p_width => 30);--VIGENCIA ACTUAL SALDO FAVOR',
'    ',
'    -- Listado de Recaudos por Banco por Impuesto por Concepto',
'    if :P5_ID_RPRTE = 381 then',
'    ',
'        for c_recaudo in ( select x.id_bnco',
'                                , x.cdgo_bnco',
'                                , x.dscrpcion_bnco',
'                                , x.nmbre_bnco',
'                                , x.id_bnco_cnta',
'                                , x.nmro_cnta',
'                                , x.cdgo_cncpto',
'                                , x.dscrpcion_cncpto',
'                                , x.dscripcion_impuesto',
'                                , upper(x.nmbre_impsto) as nmbre_impsto',
'                                , x.id_impsto',
'                                , round(sum( x.vlor_cptal )) as vlor_cptal',
'                                , round(sum( x.vlor_intres )) as vlor_intres',
'                                , round(sum(( x.vlor_cptal + x.vlor_intres ))) as vlor_ttal',
'                                , round(sum(x.vlor_sldo_fvor)) as vlor_sldo_fvor',
'                                , x.tpo',
'                                , round(sum(nvl(x.vlor_vgncia_actual,0))) as vlor_vgncia_actual',
'                                , round(sum(nvl(x.vlor_vgncias_anteriores,0))) as vlor_vgncias_anteriores',
'                                from ( select a.id_bnco',
'                                            , a.cdgo_bnco',
'                                            , a.dscrpcion_bnco',
'                                            , a.nmbre_bnco',
'                                            , a.id_bnco_cnta',
'                                            , a.nmro_cnta',
'                                            , b.cdgo_cncpto',
'                                            , b.dscrpcion_cncpto',
'                                            , (case when v_cdgo_impstoo = ''IPU'' then',
'                                                        upper(c.dscrpcion_prdio_clsfccion)',
'                                                   when v_cdgo_impstoo = ''ICA'' then',
'                                                        upper(nvl(cl.nmbre_dclrcns_esqma_trfa_tpo,''Tipo_Desconocido''))',
'                                                   else',
'                                                   ''''',
'                                              end) as dscripcion_impuesto',
'                                            , a.nmbre_impsto',
'                                            , a.id_impsto',
'                                            , nvl(b.vlor_cptal,0)       as vlor_cptal  ',
'                                            , nvl(b.vlor_intres,0)      as vlor_intres',
'                                            , nvl(b.vlor_sldo_fvor,0)   as vlor_sldo_fvor',
'                                            , ( case when b.vgncia is not null then ',
'                                                    decode( b.vgncia , (select extract (year from to_date(:P5_FCHA_FIN)) from dual)',
'                                                                     , ''ACTUAL: ''||b.vgncia',
'                                                                     , ''ANTERIORES: '' ||(select LISTAGG(b.vgncia, '', '')',
'                                                                                                             WITHIN GROUP (ORDER BY b.vgncia)',
'                                                                                                             --b.vgncia_actual',
'                                                                                                    from',
'                                                                                                    (select DISTINCT(b.vgncia) vgncia',
'                                                                                                         from v_re_g_recaudos_control a',
'                                                                                                         join v_re_g_recaudos_detalle b',
'                                                                                                           on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                                                                                                            left join si_i_predios               p   on p.id_sjto_impsto = b.id_sjto_impsto',
'                                                                                                            left join df_s_predios_clasificacion c  on c.cdgo_prdio_clsfccion = p.cdgo_prdio_clsfccion',
'                                                                                                        where a.cdgo_clnte        = :F_CDGO_CLNTE',
'                                                                                                          and a.id_impsto         = nvl( :P5_ID_IMPSTO , a.id_impsto )',
'                                                                                                          and a.id_impsto_sbmpsto = nvl( :P5_ID_IMPSTO_SBMPSTO , a.id_impsto_sbmpsto )',
'                                                                                                          and to_date(trunc(b.fcha_rcdo)) between to_date(:P5_FCHA_INCIO)',
'                                                                                                                                              and to_date(:P5_FCHA_FIN)',
'                                                                                                          and a.id_bnco = nvl( :P5_ID_BNCO , a.id_bnco )',
'                                                                                                          and a.id_bnco_cnta = nvl(:P5_ID_CNTA, a.id_bnco_cnta )',
'                                                                                                          and b.vgncia is not null',
'                                                                                                          order by b.vgncia) b',
'                                                                                                          --group by b.vgncia_actual',
'                                                                                                          where b.vgncia < (select extract (year from to_date(:P5_FCHA_FIN)) from dual))',
'                                                                                                    )',
'                                                end ) as tpo,',
'                                                (case when b.vgncia = (select extract (year from to_date(:P5_FCHA_FIN)) from dual) then',
'                                                            b.vlor_cptal + b.vlor_intres',
'                                                        end)       as vlor_vgncia_actual',
'                                                , (case when b.vgncia <> (select extract (year from to_date(:P5_FCHA_FIN)) from dual) then',
'                                                            b.vlor_cptal + b.vlor_intres',
'                                                        end)       as vlor_vgncias_anteriores',
'                                         from v_re_g_recaudos_control a',
'                                         join v_re_g_recaudos_detalle b',
'                                           on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                                         left join si_i_predios               p   on p.id_sjto_impsto = b.id_sjto_impsto',
'                                         left join df_s_predios_clasificacion c  on c.cdgo_prdio_clsfccion = p.cdgo_prdio_clsfccion',
'                                         left join si_i_personas                 g   on g.id_sjto_impsto                = b.id_sjto_impsto',
'                                         left join gi_d_dclrcns_esqma_trfa       t   on t.id_dclrcns_esqma_trfa         = g.id_actvdad_ecnmca',
'                                         left join gi_d_dclrcns_esqma_trfa_tpo  cl   on cl.ID_DCLRCNS_ESQMA_TRFA_TPO    = t.ID_DCLRCNS_ESQMA_TRFA_TPO ',
'                                        where a.cdgo_clnte        = :F_CDGO_CLNTE',
'                                          and a.id_impsto         = nvl( :P5_ID_IMPSTO , a.id_impsto )',
'                                          and a.id_impsto_sbmpsto = nvl( :P5_ID_IMPSTO_SBMPSTO , a.id_impsto_sbmpsto )',
'                                          and to_date(trunc(b.fcha_rcdo)) between to_date(:P5_FCHA_INCIO)',
'                                                                              and to_date(:P5_FCHA_FIN)',
'                                          and a.id_bnco = nvl( :P5_ID_BNCO , a.id_bnco )',
'                                          and a.id_bnco_cnta = nvl(:P5_ID_CNTA, a.id_bnco_cnta )         ',
'                             ) x',
'                             group by x.tpo,',
'                                      x.id_bnco,',
'                                      x.cdgo_bnco, ',
'                                      x.dscrpcion_bnco, ',
'                                      x.nmbre_bnco,',
'                                      x.id_bnco_cnta,',
'                                      x.nmro_cnta,',
'                                      x.cdgo_cncpto,',
'                                      x.dscripcion_impuesto,',
'                                      x.dscrpcion_cncpto, ',
'                                      x.nmbre_impsto, ',
'                                      x.id_impsto',
'                          order by x.dscripcion_impuesto asc',
'                        ) loop',
'',
'          -- aqui se debe hacer la consulta y ir llenado las filas',
'          v_num_fla :=  v_num_fla + 1;  ',
'          as_xlsx.cell( 1, v_num_fla , c_recaudo.nmbre_bnco);      ',
'          as_xlsx.cell( 2, v_num_fla , c_recaudo.nmro_cnta);    ',
'          as_xlsx.cell( 3, v_num_fla , c_recaudo.dscripcion_impuesto);    ',
'          as_xlsx.cell( 4, v_num_fla , c_recaudo.cdgo_cncpto);',
'          as_xlsx.cell( 5, v_num_fla , c_recaudo.dscrpcion_cncpto);',
'          as_xlsx.cell( 6, v_num_fla , c_recaudo.tpo);',
'          as_xlsx.cell( 7, v_num_fla , c_recaudo.vlor_cptal); ',
'          as_xlsx.cell( 8, v_num_fla , c_recaudo.vlor_intres);',
'          as_xlsx.cell( 9, v_num_fla , c_recaudo.vlor_sldo_fvor);',
'          as_xlsx.cell( 10, v_num_fla , c_recaudo.vlor_ttal);',
'        end loop;',
'        ',
'    -- Listado de Recaudos por Mes por Concepto',
'    elsif :P5_ID_RPRTE = 581 then',
'        ',
'        --Filtro de las 10 1ras Columnas',
'        as_xlsx.set_autofilter(1, 9, p_row_start => 6, p_row_end => 6); ',
'',
'        --Nombre de las columnas',
'        v_nmbre_dcmnto := ''RECAUDO X MES X CONCEPTO ''||:P5_FCHA_INCIO||'' - ''||:P5_FCHA_FIN;',
'        as_xlsx.cell(1,  v_num_fla, ''IMPUESTO'');',
'        as_xlsx.cell(2,  v_num_fla, ''SUB IMPUESTO'');',
'        as_xlsx.cell(3,  v_num_fla, ''MES'');',
'        as_xlsx.cell(4,  v_num_fla, ''CONCEPTO'');',
'        as_xlsx.cell(5,  v_num_fla, ''VALOR CAPITAL'');',
unistr('        as_xlsx.cell(6,  v_num_fla, ''VALOR INTER\00C9S'');'),
'        as_xlsx.cell(7,  v_num_fla, ''VALOR TOTAL'');',
'        as_xlsx.cell(8,  v_num_fla, ''TOTAL CONCEPTO'');',
'        as_xlsx.cell(9,  v_num_fla, ''TOTAL GENERAL'');',
'',
'      --Ancho de las columnas           ',
'        as_xlsx.set_column_width(p_col => 1,  p_width => 28);--IMPUESTO',
'        as_xlsx.set_column_width(p_col => 2,  p_width => 33);--SUB IMPUESTO',
'        as_xlsx.set_column_width(p_col => 3,  p_width => 28);--MES',
'        as_xlsx.set_column_width(p_col => 4,  p_width => 30);--CONCEPTO',
'        as_xlsx.set_column_width(p_col => 5,  p_width => 30);--VALOR CAPITAL',
unistr('        as_xlsx.set_column_width(p_col => 6,  p_width => 30);--VALOR INTER\00C9S'),
'        as_xlsx.set_column_width(p_col => 7,  p_width => 30);--VALOR TOTAL',
'        as_xlsx.set_column_width(p_col => 8,  p_width => 30);--TOTAL CONCEPTO',
'        as_xlsx.set_column_width(p_col => 9,  p_width => 30);--TOTAL GENERAL',
'',
'        FOR c_recaudo IN (',
'            SELECT',
'                x.*,',
'                SUM(x.vlor_ttal)',
'                OVER(PARTITION BY x.cncpto) AS ttal_cncpto,',
'                SUM(x.vlor_ttal) OVER() AS ttal_gnral',
'            FROM',
'                (',
'                    SELECT',
'                        --a.id_impsto,',
'                        upper(a.nmbre_impsto)            AS nmbre_impsto,',
'                        upper(a.nmbre_impsto_sbmpsto)    AS nmbre_impsto_sbmpsto,',
'                        EXTRACT(MONTH FROM b.fcha_rcdo)',
'                        || '' - ''',
'                        || to_char(b.fcha_rcdo, ''Month'') AS mes,',
'                        b.cdgo_cncpto',
'                        || '' - ''',
'                        || upper(b.dscrpcion_cncpto)     AS cncpto,',
'                        round(SUM(b.vlor_cptal))         AS vlor_cptal,',
'                        round(SUM(b.vlor_intres))        AS vlor_intres,',
'                        round(SUM(b.vlor_ttal))          AS vlor_ttal',
'                    FROM',
'                             v_re_g_recaudos_control a',
'                        JOIN v_re_g_recaudos_detalle b ON a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                    WHERE',
'                            a.cdgo_clnte = :F_CDGO_CLNTE',
'                        AND a.id_impsto           = nvl( :P5_ID_IMPSTO , a.id_impsto )',
'                        AND a.id_impsto_sbmpsto   = nvl( :P5_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'                        AND trunc(b.fcha_rcdo)    BETWEEN :P5_FCHA_INCIO AND :P5_FCHA_FIN',
'                        AND a.id_bnco             = nvl(:P5_ID_CNTA, a.id_bnco)',
'                    GROUP BY',
'                        a.id_impsto,',
'                        upper(a.nmbre_impsto),',
'                        upper(a.nmbre_impsto_sbmpsto),',
'                        b.cdgo_cncpto',
'                        || '' - ''',
'                        || upper(b.dscrpcion_cncpto),',
'                        EXTRACT(MONTH FROM b.fcha_rcdo)',
'                        || '' - ''',
'                        || to_char(b.fcha_rcdo, ''Month'')',
'                ) x',
'            ORDER BY',
'                1, 4, 3',
'        ) LOOP',
'',
'          -- aqui se debe hacer la consulta y ir llenado las filas',
'            v_num_fla := v_num_fla + 1;',
'            as_xlsx.cell(1, v_num_fla, c_recaudo.nmbre_impsto);',
'            as_xlsx.cell(2, v_num_fla, c_recaudo.nmbre_impsto_sbmpsto);',
'            as_xlsx.cell(3, v_num_fla, c_recaudo.mes);',
'            as_xlsx.cell(4, v_num_fla, c_recaudo.cncpto);',
'            as_xlsx.cell(5, v_num_fla, c_recaudo.vlor_cptal);',
'            as_xlsx.cell(6, v_num_fla, c_recaudo.vlor_intres);',
'            as_xlsx.cell(7, v_num_fla, c_recaudo.vlor_ttal);',
'            as_xlsx.cell(8, v_num_fla, c_recaudo.ttal_cncpto);',
'            as_xlsx.cell(9, v_num_fla, c_recaudo.ttal_gnral);',
'        END LOOP;',
'    ',
'    end if;',
'  ',
'  -- Guardar Excel',
'  as_xlsx.save( v_directorio, v_file_name );',
'  v_bfile := bfilename( v_directorio, v_file_name);',
'  ------------------------------------------------------------------------------',
'  dbms_lob.open(v_bfile, dbms_lob.lob_readonly);',
'  dbms_lob.createtemporary(',
'      lob_loc => o_file_blob, ',
'      cache   => true, ',
'      dur     => dbms_lob.session',
'  );',
'  -- Open temporary lob',
'  dbms_lob.open(o_file_blob, dbms_lob.lob_readwrite);',
'',
'  -- Load binary file into temporary LOB',
'  dbms_lob.loadfromfile(',
'      dest_lob => o_file_blob,',
'      src_lob  => v_bfile,',
'      amount   => dbms_lob.getlength(v_bfile)',
'  );',
'',
'  -- Close lob objects',
'  dbms_lob.close(o_file_blob);',
'  dbms_lob.close(v_bfile);',
'',
'  utl_file.fremove(v_directorio,v_file_name);',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'  ',
'  htp.p(''Content-length: '' ||sys.dbms_lob.getlength(o_file_blob) );  ',
'  htp.p(''Content-Disposition: attachment; filename="''|| v_nmbre_dcmnto ||''.xlsx"'');  ',
'  htp.p(''Cache-Control: max-age=0'');',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(o_file_blob);  ',
'  apex_application.stop_apex_engine;',
'  ',
'  exception',
'    when others then',
'      raise_application_error(-20000,''Problemas al generar excel, ''||sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(63575094982963606)
,p_process_when=>'P5_TPO_IMPRSN'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'EXL'
);
end;
/
