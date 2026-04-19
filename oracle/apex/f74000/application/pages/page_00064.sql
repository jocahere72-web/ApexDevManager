prompt --application/pages/page_00064
begin
wwv_flow_api.create_page(
 p_id=>64
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Constructor'
,p_page_mode=>'MODAL'
,p_step_title=>'Constructor'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apex.item("P64_FILE_BLOB_TEMP").hide();',
'//apex.item("P64_FILE_BLOB").hide();',
'',
'',
'',
''))
,p_javascript_code_onload=>'apex.item("P64_FILE_BLOB_TEMP").setValue();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P64_OBSRVCION{',
'  resize:none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20211124105956'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(189049675313732838)
,p_plug_name=>'Consulta General'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(282382099170740857)
,p_plug_name=>'Cargue de archivo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(282384536203740882)
,p_plug_name=>'Tipo de proceso'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141589377376223271)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(282382099170740857)
,p_button_name=>'BTN_PRCSAR_ARCHVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar archivo'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141585912679223239)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(189049675313732838)
,p_button_name=>'BTN_NVA_RGLA'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Nueva Regla'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=50000:907:&SESSION.::&DEBUG.:RP,907:P907_APP_ID,P907_PAGE_ID,P907_COD_PROCESO:&P64_APP_ID.,&P64_APP_PAGE_ID.,FISCA'
,p_icon_css_classes=>'fa-file-sql'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141588994453223267)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(282382099170740857)
,p_button_name=>'BTN_NVO_CRGUE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Nuevo cargue'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP,63:P63_ID_FSCLZCION_LTE:&P64_ID_CNDDTO_LTE.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-arrow-up'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141585119292223237)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(189049675313732838)
,p_button_name=>'BTN_PRCSAR_SQL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Regla'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141586388329223240)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(189049675313732838)
,p_button_name=>'BTN_PRCSAR_SQL_DES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Regla desconocido'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141585575919223239)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(189049675313732838)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(141597221551223287)
,p_branch_name=>'Ir a la pagina 64'
,p_branch_action=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141586750964223240)
,p_name=>'P64_ID_CNSLTA_MSTRO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(189049675313732838)
,p_prompt=>unistr('Regla de selecci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.nmbre_cnslta,',
'            a.id_cnslta_mstro',
'from        cs_g_consultas_maestro  a',
'inner join  cs_d_procesos_sql       b on b.id_prcso_sql   =   a.id_prcso_sql',
'where       b.cdgo_clnte            =   :F_CDGO_CLNTE',
'and         b.cdgo_prcso_sql        =   ''FISCA''',
'and         a.tpo_cndcion           is  null',
'and         a.id_cnslta_mstro_gnral is not  null'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141587002923223266)
,p_name=>'P64_ID_CNDDTO_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(189049675313732838)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141587436567223266)
,p_name=>'P64_APP_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(189049675313732838)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141587866678223266)
,p_name=>'P64_APP_PAGE_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(189049675313732838)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141588247411223267)
,p_name=>'P64_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(189049675313732838)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141590451602223279)
,p_name=>'P64_SLCCION_TIPO_PRCSO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(282384536203740882)
,p_prompt=>'Seleccionar tipo de proceso'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Consulta;1,Cargue de archivo;2'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141871440182297505)
,p_name=>'P64_ID_ARCHVO_CNDDTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_ARCHVO_CNDDTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141871598010297506)
,p_name=>'P64_FILE_NAME'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141871630641297507)
,p_name=>'P64_FILE_MIMETYPE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141872146040297512)
,p_name=>'P64_ID_FSCLZCION_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_FSCLZCION_LTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141872255364297513)
,p_name=>'P64_CDGO_CLNTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141872498803297515)
,p_name=>'P64_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT a.nmbre_impsto_sbmpsto,',
'       a.id_impsto_sbmpsto',
'FROM df_i_impuestos_subimpuesto a',
'where   a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_impsto = :P64_ID_IMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P64_ID_IMPSTO'
,p_ajax_items_to_submit=>'P64_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141872565475297516)
,p_name=>'P64_ID_PRGRMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Programa'
,p_source=>'ID_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.nmbre_prgrma as d,',
'        p.id_prgrma as r',
'from fi_d_programas p ',
'where p.cdgo_prgrma =''OD'';'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141872678832297517)
,p_name=>'P64_ID_SBPRGRMA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub programas'
,p_source=>'ID_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_sbprgrma as d,',
'       id_sbprgrma    as r',
'from fi_d_subprogramas ',
'where id_prgrma = :P64_ID_PRGRMA',
'and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P64_ID_PRGRMA'
,p_ajax_items_to_submit=>'P64_ID_SBPRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>10
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141872724635297518)
,p_name=>'P64_ID_FNTES_EXTRNA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fuente externa'
,p_source=>'ID_FNTES_EXTRNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  a.dscpcion_fntes_extrna,    ',
'        a.id_fntes_extrna',
'FROM fi_d_fuentes_externa a',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141872849670297519)
,p_name=>'P64_ID_FISCA_ARCHVO_TPO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de archivo'
,p_source=>'ID_FISCA_ARCHVO_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre || '' : '' || dscrpcion d, id_fisca_archvo_tpo r',
'  from fi_d_fisca_archivo_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141872927560297520)
,p_name=>'P64_ID_CRGA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proceso de carga ETL'
,p_source=>'ID_CRGA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT a.dscpcion_crga, a.id_crga',
'FROM v_fi_d_fuentes_externa_carga a ',
'where a.id_fntes_extrna = :P64_ID_FNTES_EXTRNA ;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P64_ID_FNTES_EXTRNA'
,p_ajax_items_to_submit=>'P64_ID_CRGA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141873423307297525)
,p_name=>'P64_USER_DGTA'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141873678613297527)
,p_name=>'P64_INDCDOR_PRCSDO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_source=>'INDCDOR_PRCSDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141874381082297534)
,p_name=>'P64_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
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
,p_begin_on_new_line=>'N'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141875286648297543)
,p_name=>'P64_FCHA_DGTA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141875411296297545)
,p_name=>'P64_OBSERVCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSERVCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>150
,p_cMaxlength=>300
,p_cHeight=>5
,p_colspan=>12
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142931475639718907)
,p_name=>'P64_ID_CNSLTA_ARCHIVO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(189049675313732838)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_archvo_cnddto',
'from fi_g_archivos_candidato a where a.id_fsclzcion_lte = :P64_ID_CNDDTO_LTE;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142932408162718917)
,p_name=>'P64_FILE_BLOB_TEMP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_use_cache_before_default=>'NO'
,p_prompt=>'archivo:'
,p_source=>'P64_FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>10
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'text/*,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(144632045973964901)
,p_name=>'P64_ID_MDIO_NTFCCION'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(282382099170740857)
,p_prompt=>unistr('Tipo Notificaci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Correo certificado;1,Correo electronico;2'
,p_field_template=>wwv_flow_api.id(36555007171968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141593301236223282)
,p_name=>'Al cambiar tipo de proceso'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64_SLCCION_TIPO_PRCSO'
,p_condition_element=>'P64_SLCCION_TIPO_PRCSO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141593895766223284)
,p_event_id=>wwv_flow_api.id(141593301236223282)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(189049675313732838)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141594856812223284)
,p_event_id=>wwv_flow_api.id(141593301236223282)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(282382099170740857)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141594319322223284)
,p_event_id=>wwv_flow_api.id(141593301236223282)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(282382099170740857)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141595313136223285)
,p_event_id=>wwv_flow_api.id(141593301236223282)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(189049675313732838)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141595705801223285)
,p_name=>'ocultar regiones cuando esta nulo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64_SLCCION_TIPO_PRCSO'
,p_condition_element=>'P64_SLCCION_TIPO_PRCSO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141596278041223286)
,p_event_id=>wwv_flow_api.id(141595705801223285)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(282382099170740857)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141596765095223287)
,p_event_id=>wwv_flow_api.id(141595705801223285)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(189049675313732838)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141873185935297522)
,p_name=>'Al cambiar Archivo'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64__FILE_BLOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141873216349297523)
,p_event_id=>wwv_flow_api.id(141873185935297522)
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141875650107297547)
,p_name=>'Al cambiar Archivo.'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64_FILE_BLOB_TEMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141875702701297548)
,p_event_id=>wwv_flow_api.id(141875650107297547)
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(142932990664718922)
,p_name=>'Al cambiar archivo'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64_FILE_BLOB_TEMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(142933091136718923)
,p_event_id=>wwv_flow_api.id(142932990664718922)
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
'            apex.item(''P64_FILE_BLOB'').setValue("");',
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
 p_id=>wwv_flow_api.id(142932054931718913)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Fetch Row from fi_g_archivos_candidato'
,p_attribute_02=>'FI_G_ARCHIVOS_CANDIDATO'
,p_attribute_03=>'P64_ID_ARCHVO_CNDDTO'
,p_attribute_04=>'ID_ARCHVO_CNDDTO'
,p_attribute_11=>'I'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141589377376223271)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(144632548092964906)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_NL.AMIS.SCHEFFER.PROCESS.EXCEL2COLLECTION'
,p_process_name=>'Crear coleccion ETLEXC'
,p_attribute_01=>'P64_FILE_BLOB_TEMP'
,p_attribute_02=>'ETLEXC'
,p_attribute_04=>';'
,p_attribute_05=>'"'
,p_attribute_07=>'N'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141589377376223271)
,p_process_when=>'P64_FILE_BLOB_TEMP'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'ok'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142934074903718933)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar proceso de cargue'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_temp_files               fi_g_archivos_candidato%rowtype;',
'    v_temp_files_blob          apex_application_temp_files%rowtype;',
'    v_cdgo_rspsta              number;',
'    v_id_carga                 number;',
'    v_mnsje_rspsta             varchar2(500);',
'    v_id_archvo_cnddto         number ;',
'    v_count                    number;',
'    filecounts                 exception;',
'begin',
'        ',
'     select * ',
'      into v_temp_files_blob',
'      from apex_application_temp_files',
'     where name = :P64_FILE_BLOB_TEMP;',
'    ',
'    select count(*)',
'       into v_count',
'       from fi_g_archivos_candidato',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'        and file_name  = v_temp_files_blob.filename;',
'        insert into muerto(v_001, v_002, t_001, n_001) values(''Apex Procesar archivo 1'', ''nombre del archivo -> ''||v_temp_files_blob.filename, systimestamp, :F_CDGO_CLNTE); commit;',
'',
'        ',
'        if ( v_count > 0 ) then',
'           raise filecounts;',
'      end if; ',
'      ',
'   ',
'     insert into  fi_g_archivos_candidato(cdgo_clnte,             id_prgrma ,          id_sbprgrma,            id_impsto ,   ',
'                                          id_impsto_sbmpsto,      id_fntes_extrna ,    id_fsclzcion_lte,       id_fisca_archvo_tpo,',
'                                          file_blob,file_name,    file_mimetype,       user_dgta,              fcha_dgta,    ',
'                                          indcdor_prcsdo,         observcion,          id_crga,                id_mdio_ntfccion)',
'                                 values (:F_CDGO_CLNTE,           :P64_ID_PRGRMA,      :P64_ID_SBPRGRMA,       :P64_ID_IMPSTO,',
'                                         :P64_ID_IMPSTO_SBMPSTO,  :P64_ID_FNTES_EXTRNA,:P64_ID_FSCLZCION_LTE,  :P64_ID_FISCA_ARCHVO_TPO,',
'                                         v_temp_files_blob.blob_content, v_temp_files_blob.filename, v_temp_files_blob.mime_type,:ID_USRIO,',
'                                systimestamp,''N'',:P64_OBSERVCION,:P64_ID_CRGA, :P64_ID_MDIO_NTFCCION) returning id_archvo_cnddto into :P64_ID_ARCHVO_CNDDTO;',
'',
'    ',
'exception ',
'     when filecounts then',
'          raise_application_error(-20003 , ''El archivo '' ||  v_temp_files_blob.filename || '' ya se encuentra procesado.'');',
'     when others then ',
'          raise_application_error(-20002 , ''No fue posible cargar el archivo.'' );                                   ',
'    ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141589377376223271)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141592002577223281)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar proceso de carga EX'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_temp_files               fi_g_archivos_candidato%rowtype;',
'    v_cdgo_rspsta              number;',
'    v_id_carga                 number;',
'    v_mnsje_rspsta             varchar2(500);',
'    v_id_archvo_cnddto         number ;',
'    v_count                    number;',
'    v_id_prcso_crga            number;',
'    filecounts                 exception;',
'begin',
'        ',
'    ',
' ',
'    select *',
'    into v_temp_files',
'    from fi_g_archivos_candidato a ',
'    where a.id_archvo_cnddto = :P64_ID_ARCHVO_CNDDTO ;',
'    ',
'    select count(*)',
'       into v_count',
'       from et_g_procesos_carga',
'      where cdgo_clnte = :F_CDGO_CLNTE',
'        and file_name  = v_temp_files.file_name;',
'      ',
'      if ( v_count > 0 ) then',
'           raise filecounts;',
'      end if;',
'    ',
'    insert into et_g_procesos_carga ( id_crga , cdgo_clnte , id_impsto , vgncia , file_blob , file_name  , file_mimetype ',
'                                     , cdgo_prcso_estdo , id_adtria , lneas_encbzdo , id_impsto_sbmpsto , id_prdo , id_usrio ) ',
'                             values (  11, :F_CDGO_CLNTE , v_temp_files.id_impsto , 2021 , v_temp_files.file_blob , v_temp_files.file_name ,',
'                                     v_temp_files.file_mimetype, ''SE'' , null , 1 , v_temp_files.id_impsto_sbmpsto , null , :F_ID_USRIO )  ;',
'                                      ',
'    ',
'exception ',
'     when filecounts then',
'          raise_application_error(-20003 , ''El archivo '' ||  v_temp_files.file_name || '' ya se encuentra procesado.'');',
'     when others then ',
'          raise_application_error(-20002 , ''No fue posible cargar el archivo.'' );                                   ',
'    ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141589377376223271)
,p_process_success_message=>'&P64_RSPSTA.'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141833045532591704)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_temp_files               fi_g_archivos_candidato%rowtype;',
'    v_cdgo_rspsta              number;',
'    v_id_carga                 number;',
'    v_mnsje_rspsta             varchar2(4000);',
'    v_id_archvo_cnddto         number ;',
'begin',
'    insert into muerto(v_001, v_002, t_001, n_001) values(''Apex Procesar archivo 1'', '':P64_ID_CNDDTO_LTE ->''||:P64_ID_CNDDTO_LTE,systimestamp, :F_CDGO_CLNTE); commit;',
'    begin  ',
'        SELECT  a.id_crga,',
'                a.id_archvo_cnddto',
'        into    v_id_carga,',
'                v_id_archvo_cnddto',
'        FROM fi_g_archivos_candidato a ',
'        where a.id_archvo_cnddto = :P64_ID_ARCHVO_CNDDTO;',
'    exception ',
'    when others then',
'         raise_application_error(-20001, ''1. Error: '' || ''No se setearon variables'');',
'    end;',
'    ',
'  ',
'    pkg_fi_fiscalizacion.prc_rg_infrmcion_fntes_extrna_sjto( p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                                    p_id_archvo_cnddto        => v_id_archvo_cnddto,',
'                                                    p_id_usrio                => :F_ID_USRIO,',
'                                                    p_id_carga                => v_id_carga,',
'                                                    p_id_fsclzcion_lte        => :P64_ID_CNDDTO_LTE,',
'                                                    o_cdgo_rspsta             => v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta            => v_mnsje_rspsta);                                                        ',
'                                                          ',
'       if(v_cdgo_rspsta <> 0) then',
'                 raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta ||''- codigo respuesta ''||v_cdgo_rspsta);',
'       else',
'         :P64_RSPSTA := v_mnsje_rspsta;',
'       end if;',
'    ',
'       ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141589377376223271)
,p_process_when=>'P64_SLCCION_TIPO_PRCSO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'2'
,p_process_success_message=>'Procesar archivo'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142931973993718912)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Guardar archivo'
,p_attribute_02=>'FI_G_ARCHIVOS_CANDIDATO'
,p_attribute_03=>'P64_ID_ARCHVO_CNDDTO'
,p_attribute_04=>'ID_ARCHVO_CNDDTO'
,p_attribute_11=>'I'
,p_attribute_12=>'Y'
,p_process_error_message=>'no se ejecuto'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141589377376223271)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Archivo guardado.'
,p_process_is_stateful_y_n=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142931104426718904)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(282382099170740857)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Crear cargue de archivo'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141589377376223271)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141590883254223279)
,p_process_sequence=>70
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
'                                                       p_id_cnslta_mstro  =>  :P64_ID_CNSLTA_MSTRO,',
'                                                       p_id_fsclzcion_lte =>  :P64_ID_CNDDTO_LTE,',
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
 p_id=>wwv_flow_api.id(141591614704223280)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Obtener Poblaci\00F3n_Des')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar(1000); ',
'',
'begin',
'',
'    pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc(p_cdgo_clnte       =>  :F_CDGO_CLNTE,',
'                                                       p_id_usrio         =>  :F_ID_USRIO,',
'                                                       p_id_cnslta_mstro  =>  :P64_ID_CNSLTA_MSTRO,',
'                                                       p_id_fsclzcion_lte =>  :P64_ID_CNDDTO_LTE,',
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
,p_process_when_button_id=>wwv_flow_api.id(141586388329223240)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141873749696297528)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(282382099170740857)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form cargue de archivo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(144632438157964905)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Antes del header eliminar colecci\00F3n ETLEXC')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_existe_collection        boolean;',
'    v_mnsje_rspsta             varchar2(500);',
'    v_count                    number;',
'    filecounts                 exception;',
'begin',
'',
'    v_existe_collection := APEX_COLLECTION.COLLECTION_EXISTS ( p_collection_name => ''ETLEXC'');',
'    ',
'      if(v_existe_collection = true) then',
'      ',
'      APEX_COLLECTION.DELETE_COLLECTION( p_collection_name => ''ETLEXC'');',
'      ',
'      end if;',
'    ',
'    ',
'exception ',
'     when others then ',
'          raise_application_error(-20002 , ''No existe la collection'' );',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P64_FILE_BLOB_TEMP'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
