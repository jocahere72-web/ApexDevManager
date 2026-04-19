prompt --application/pages/page_00063
begin
wwv_flow_api.create_page(
 p_id=>63
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Cargue de archivo fuentes externas'
,p_page_mode=>'MODAL'
,p_step_title=>'Cargue de archivo fuentes externas'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P9_OBSRVCION{',
'  resize:none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20211022113105'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(281782268400348032)
,p_plug_name=>'Cargue de archivo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select	id_archvo_cnddto,',
'		cdgo_clnte,',
'		id_prgrma,',
'		id_sbprgrma,',
'		id_impsto,',
'		id_impsto_sbmpsto,',
'		id_fntes_extrna,',
'		id_fsclzcion_lte,',
'		id_fisca_archvo_tpo,',
'		file_blob,',
'		file_name,',
'		file_mimetype,',
'		user_dgta,',
'		fcha_dgta,',
'		indcdor_prcsdo,',
'		observcion,',
'        id_crga',
'from fi_g_archivos_candidato'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141025916940374211)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(281782268400348032)
,p_button_name=>'BTN_REGISTRAR_ARCHIVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Archivo'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P63_ID_ARCHVO_CNDDTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141026061572374212)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(281782268400348032)
,p_button_name=>'BTN_CANELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(140999460354830480)
,p_branch_name=>'Ir a la pagina 8'
,p_branch_action=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140988495767830447)
,p_name=>'P63_ID_ARCHVO_CNDDTO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_source=>'ID_ARCHVO_CNDDTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140988815326830447)
,p_name=>'P63_ID_PRGRMA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_prompt=>'Programa'
,p_source=>'ID_PRGRMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PROGRAMAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.nmbre_prgrma as d,',
'        p.id_prgrma as r',
'from fi_d_programas p;'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140989224184830448)
,p_name=>'P63_ID_SBPRGRMA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_prompt=>'Sub programas'
,p_source=>'ID_SBPRGRMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_SUBPROGRAMA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  s.nmbre_sbprgrma as d,',
'        s.id_sbprgrma as r',
'from fi_d_subprogramas s where id_prgrma = :P64_ID_PRGMRA;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140989673452830448)
,p_name=>'P63_ID_IMPSTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS_X_MENU_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto || '' ['' || a.cdgo_impsto || '']''display,',
'       a.id_impsto value',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO',
'   and a.actvo            = ''S''',
'   and b.actvo            = ''S''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140990098056830449)
,p_name=>'P63_ID_FSCLZCION_LTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_source=>'ID_FSCLZCION_LTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140990413082830449)
,p_name=>'P63_ID_FISCA_ARCHVO_TPO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_prompt=>'Tipo de archivo'
,p_source=>'ID_FISCA_ARCHVO_TPO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre || '' : '' || dscrpcion d, id_fisca_archvo_tpo r',
'  from fi_d_fisca_archivo_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140990864230830449)
,p_name=>'P63_CDGO_CLNTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140991201276830450)
,p_name=>'P63_FILE_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_prompt=>'Cargar archivo'
,p_source=>'FILE_BLOB'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FILE_MIMETYPE'
,p_attribute_03=>'FILE_NAME'
,p_attribute_06=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140991684650830450)
,p_name=>'P63_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_source=>'FILE_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140992027178830451)
,p_name=>'P63_FILE_MIMETYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_source=>'FILE_MIMETYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140992429792830452)
,p_name=>'P63_USER_DGTA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_source=>'USER_DGTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140992829006830452)
,p_name=>'P63_FCHA_DGTA'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_source=>'FCHA_DGTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140993216120830453)
,p_name=>'P63_INDCDOR_PRCSDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_default=>'N'
,p_source=>'INDCDOR_PRCSDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141000828495076704)
,p_name=>'P63_ID_IMPSTO_SBMPSTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_prompt=>'Sub tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT a.nmbre_impsto_sbmpsto,',
'       a.id_impsto_sbmpsto',
'FROM df_i_impuestos_subimpuesto a',
'where   a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_impsto = :P63_ID_IMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P63_ID_IMPSTO'
,p_ajax_items_to_submit=>'P63_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141000988406076705)
,p_name=>'P63_ID_FNTES_EXTRNA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_prompt=>'Fuente externa'
,p_source=>'ID_FNTES_EXTRNA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  a.dscpcion_fntes_extrna,    ',
'        a.id_fntes_extrna',
'FROM fi_d_fuentes_externa a',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141025618721374208)
,p_name=>'P63_OBSERVCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>100
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141026460453374216)
,p_name=>'P63_ID_CRGA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(281782268400348032)
,p_item_source_plug_id=>wwv_flow_api.id(281782268400348032)
,p_prompt=>'Proceso de carga ETL'
,p_source=>'ID_CRGA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT a.dscpcion_crga, a.id_crga',
'FROM v_fi_d_fuentes_externa_carga a ',
'where a.id_fntes_extrna = :P63_ID_FNTES_EXTRNA ;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P63_ID_FNTES_EXTRNA'
,p_ajax_items_to_submit=>'P63_ID_CRGA'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(140998478851830478)
,p_name=>'Al cambiar Archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P63_FILE_BLOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(140998996231830479)
,p_event_id=>wwv_flow_api.id(140998478851830478)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function Restringir_Archivo_Tipo($this) {',
'',
'    var file = $this.triggeringElement.files[0];',
'    ',
'    if (file !== undefined ) {',
'        vTipo = new String( file.type );',
'',
'        //alert(vTipo);',
'',
'        if( vTipo != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" ) {',
'      //  if( vTipo != "text/plain") { //vTipo != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" && ',
'            //alert(''Diferente'');',
'',
unistr('            // Si la extensi\00F3n no es de archivo de Excel o txt --> Presentar mensaje de Error'),
'            Swal.fire({',
'                icon: ''error'',',
'                title:  ''<H2 >Carga de Archivo</H2>'',',
'                html: ''El archivo debe ser de tipo Excel.''// Excel o',
'            });',
'',
'            apex.item(''P14_FILE_BLOB'').setValue("");',
'',
'        }',
'    }',
'}',
'',
'',
'Restringir_Archivo_Tipo(this);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(140998048412830477)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Obtener Poblaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar(1000); ',
'',
'begin',
'',
'    pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva(p_cdgo_clnte       =>  :F_CDGO_CLNTE,',
'                                                       p_id_usrio         =>  :F_ID_USRIO,',
'                                                       p_id_cnslta_mstro  =>  :P63_ID_CNSLTA_MSTRO,',
'                                                       p_id_fsclzcion_lte =>  :P63_ID_CNDDTO_LTE,',
'                                                       o_cdgo_rspsta      =>  v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta     =>  v_mnsje_rspsta);',
'                                                       ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20000, v_cdgo_rspsta || '' - '' || v_mnsje_rspsta);',
'    end if;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(140994051673830468)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(281782268400348032)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Crear cargue de archivo'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141025916940374211)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141026171972374213)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141026061572374212)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(140993679443830464)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(281782268400348032)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form cargue de archivo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
