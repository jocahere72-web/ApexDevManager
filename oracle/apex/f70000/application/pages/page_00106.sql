prompt --application/pages/page_00106
begin
wwv_flow_api.create_page(
 p_id=>106
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Plantilla Acto Determinaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Generaci\00F3n de Actos / Documentos del Lote de Determinaci\00F3n No. &P63_ID_DTRMNCION_LTE. - Actos >> Plantilla de Acto')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20250804174842'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37413332163005908)
,p_plug_name=>'Widzar'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37412707991005902)
,p_plug_name=>'Plantilla'
,p_parent_plug_id=>wwv_flow_api.id(37413332163005908)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35823716837304526)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(37412707991005902)
,p_button_name=>'BTN_GENERAR_ACTOS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Generar Actos'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Se generaran TODOS o SOLO los actos que no se han procesados(dependiendo de la opciÃ³n seleccionada). Esto se realizarÃ¡ en segundo plano. En cuanto termine el procesamiento el sistema le notificarÃ¡ de manera automÃ¡tica que este ha terminado. '',''BTN_GENERAR_ACTOS'');'
,p_button_condition=>'P106_ID_PLNTLLA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37415201850005927)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(37412707991005902)
,p_button_name=>'BTN_IMPRIMIR_ACTOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir Actos'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37415350598005928)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(37412707991005902)
,p_button_name=>'BTN_IMPRIMIR_RANGO_ACTOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Imprimir Rangos de Actos'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select dcmnto',
'   from gi_g_determinaciones',
'  where id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE',
'    and id_plntlla = :P106_ID_PLNTLLA'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-files-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37415528171005930)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(37412707991005902)
,p_button_name=>'BTN_GENERAR_ZIP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Generar ZIP'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-archive-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(161126347018342302)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(37412707991005902)
,p_button_name=>'BTN_DTLLE_LTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ver Detalle Lote'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-file-text-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37413696693005911)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(37413332163005908)
,p_button_name=>'BTN_CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37413423686005909)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(37413332163005908)
,p_button_name=>'BTN_ANTERIOR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(37415880389005933)
,p_branch_name=>unistr('Imprimir Acto Determinaci\00F3n')
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:515,<P_ID_DTRMNCION_LTE>&P63_ID_DTRMNCION_LTE.</P_ID_DTRMNCION_LTE>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(37415201850005927)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35822903317304518)
,p_branch_name=>'Imprimir Actos-Zip'
,p_branch_action=>'f?p=66000:2:&SESSION.:masivoZip:&DEBUG.:RP:P2_ID_RPRTE_PRMTRO,P2_ID_RPRTE,P2_NMBRE_ZIP:&P106_ID_RPRTE_PRMTRO.,645,Lote Determinacion &P63_ID_DTRMNCION_LTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(37415528171005930)
,p_branch_sequence=>40
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(35823087326304519)
,p_branch_name=>'Imprimir Rangos'
,p_branch_action=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP,29:P29_ID_DTRMNCION_LTE,P29_BRANCH:&P63_ID_DTRMNCION_LTE.,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(37415350598005928)
,p_branch_sequence=>50
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(161126211284342301)
,p_branch_name=>'Mostrar Detalle Lote'
,p_branch_action=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:RP,62:P62_ID_DTRMNCION_LTE:&P63_ID_DTRMNCION_LTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(161126347018342302)
,p_branch_sequence=>60
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35822813926304517)
,p_name=>'P106_ID_RPRTE_PRMTRO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(37412707991005902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35824216795304531)
,p_name=>'P106_ACTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(37412707991005902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37412803744005903)
,p_name=>'P106_ID_PLNTLLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(37412707991005902)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.dscrpcion,',
'        a.id_plntlla',
'   from gn_d_plantillas a',
'   join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and b.cdgo_acto_tpo in (''DTM'', ''DFT'')',
'order by a.dscrpcion'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione un Plantilla -- '
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37412916228005904)
,p_name=>'P106_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(37412707991005902)
,p_prompt=>unistr('Pre-Visualizaci\00F3n de la Plantilla')
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>95
,p_cHeight=>20
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (options){',
'',
'    CKEDITOR.plugins.add( ''hcard'', {',
'			requires: ''widget'',',
'			init: function( editor ) {',
'				editor.widgets.add( ''hcard'', {',
'					allowedContent: ''span(!h-card); a[href](!u-email,!p-name); span(!p-tel)'',',
'					requiredContent: ''span(h-card)'',',
'					pathName: ''hcard'',',
'					upcast: function( el ) {',
'						return el.name == ''span'' && el.hasClass( ''h-card'' );',
'					}',
'				} );',
'',
'				editor.addFeature( editor.widgets.registered.hcard );',
'',
'				editor.on( ''paste'', function( evt ) {',
'					var column = evt.data.dataTransfer.getData( ''column'' );',
'					if ( !column ) {',
'						return;',
'					}',
'                    ',
'                    var element = CKEDITOR.dom.element.createFromHtml(column);',
'                    CKEDITOR.instances.P110_PRRFO.insertElement( element );                   ',
'                    return;',
'				});',
'			}',
'		});',
'',
'		CKEDITOR.on( ''instanceReady'', function() {            ',
'            var columnslist = CKEDITOR.document.getById( ''columnslist'' );',
'            if (columnslist) {',
'			    columnslist.on( ''dragstart'', function( evt ) {                   ',
'                    CKEDITOR.plugins.clipboard.initDragDataTransfer( evt );',
'                    var dataTransfer = evt.data.dataTransfer; ',
'                    dataTransfer.setData( ''column'', $(evt.data.$.target).data(''valor'') );',
'                    dataTransfer.setData( ''text/html'', ''<hidden><hidden>'' );',
'			    });                ',
'            }',
'		} );',
'    ',
'    options.uiColor = ''#f1f1f1'';',
'    options.skin = ''office2013,skins/office2013/'';',
'    options.height = 200;',
'    options.resize_enabled = false',
'    options.extraPlugins = ''hcard'';',
'    options.readOnly = true;',
'    options.enterMode = 2;	options.removePlugins = ''contextmenu,liststyle,tabletools'';	return  options;',
'}'))
,p_attribute_03=>'N'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37415682649005931)
,p_name=>'P106_TIPO_IMPRESION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(37412707991005902)
,p_item_default=>unistr('Tipo de Impresi\00F3n')
,p_prompt=>unistr('Tipo de Impresi\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_display_when=>'P106_ID_PLNTLLA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161127222198342311)
,p_name=>'P106_GNRA_ACTO_TPO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(37412707991005902)
,p_item_default=>'T'
,p_prompt=>unistr('Tipo Generaci\00F3n Actos')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indica si se generaran los actos para todo el lote o solo para aquellos que no se han generado.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'T'
,p_attribute_03=>'Todos'
,p_attribute_04=>'E'
,p_attribute_05=>'No generados'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161127589975342314)
,p_name=>'P106_ACTOS_GNRDOS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(37412707991005902)
,p_prompt=>'Determinaciones con Documento(Blob)'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161127798475342316)
,p_name=>'P106_TTAL_DTRMNCIONES'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(37412707991005902)
,p_prompt=>'Total Determinaciones'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161128033614342319)
,p_name=>'P106_ACTOS_NO_GNRDOS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(37412707991005902)
,p_prompt=>'Determinaciones sin Documento(Blob)'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(37413201727005907)
,p_computation_sequence=>10
,p_computation_item=>'P106_DCMNTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation=>'pkg_gn_generalidades.fnc_ge_dcmnto(''{"ID_DTRMNCION":}'', :P106_ID_PLNTLLA)'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(35824134582304530)
,p_computation_sequence=>20
,p_computation_item=>'P106_ACTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select count(*)',
'   from gi_g_determinaciones',
'  where id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE',
'    and id_plntlla = :P106_ID_PLNTLLA'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(161127819461342317)
,p_computation_sequence=>30
,p_computation_item=>'P106_TTAL_DTRMNCIONES'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select to_char(count(1),''999G999G999G999G999'')',
'   from gi_g_determinaciones',
'  where id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(161128130926342320)
,p_computation_sequence=>40
,p_computation_item=>'P106_ACTOS_GNRDOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 	to_char(count(1),''999G999G999G999G999'')',
'from 	gi_g_determinaciones  a ',
'join 	v_gn_g_actos 			  d on a.id_acto = d.id_acto',
'where 	id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE ',
'and		d.file_blob IS NOT NULL'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(161128259735342321)
,p_computation_sequence=>50
,p_computation_item=>'P106_ACTOS_NO_GNRDOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 	to_char(count(1),''999G999G999G999G999'')',
'from 	gi_g_determinaciones  a ',
'join 	v_gn_g_actos 			  d on a.id_acto = d.id_acto',
'where 	id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE ',
'and		d.file_blob IS NULL'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(35822605560304515)
,p_validation_name=>'Plantilla no nula'
,p_validation_sequence=>10
,p_validation=>'P106_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar una Plantilla.'
,p_validation_condition=>'BTN_IMPRIMIR_ACTOS,BTN_IMPRIMIR_RANGO_ACTOS,BTN_GENERAR_ZIP'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(37412803744005903)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(37413027649005905)
,p_name=>'refrescar documento'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P106_ID_PLNTLLA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37413151043005906)
,p_event_id=>wwv_flow_api.id(37413027649005905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(37413808003005913)
,p_name=>'Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37413696693005911)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37413917133005914)
,p_event_id=>wwv_flow_api.id(37413808003005913)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(161127357689342312)
,p_name=>'Al cambiar'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P106_GNRA_ACTO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(161127471712342313)
,p_event_id=>wwv_flow_api.id(161127357689342312)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P106_GNRA_ACTO_TPO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(161128514242342324)
,p_name=>'Genera_archivo'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(37415528171005930)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(161128694853342325)
,p_event_id=>wwv_flow_api.id(161128514242342324)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Generar_Archivo() {',
' ',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
' ',
'    var rs = await apex.server.process(''Descargar_Archivo'',{',
'				     pageItems: "P63_ID_DTRMNCION_LTE"',
'			      }); ',
'    //var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:PRINT_REPORT=re_c_recibo_pago_rentas:NO:RP:::`;',
'    var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=Descargar_Documento:NO:RP:::`;       ',
'    if (rs.type == ''OK'') {',
'        ',
'        console.log("PUNTO1");',
'        ',
'        let $waitPopup = apex.widget.waitPopup(); ',
'        //apex.message.showPageSuccess(rs.msg);',
'        ',
'        let a = document.createElement("a");',
'        document.body.appendChild(a);',
'        ',
'        console.log("PUNTO3");',
'        ',
'        let v_blob = await fecth_async(url);',
'',
'        console.log("PUNTO6");',
'        ',
'        let v_url = window.URL.createObjectURL(v_blob);',
'        a.download = rs.nmbre_rprte + ".zip";',
'        a.href = v_url;',
'        a.click();',
'        document.body.removeChild(a);',
'        window.URL.revokeObjectURL(v_url);  ',
'        //window.location.href = `f?p=${v_app_id}:${106}:${v_session}::NO::::`;    ',
'        $waitPopup.remove();',
'',
'    }',
'    else {',
'        // First clear the errors',
'        apex.message.clearErrors();',
'',
'        // Now show new errors',
'        apex.message.showErrors([',
'            {',
'                type:       "error",',
'                location:   [ "page"],',
'                message:    rs.msg,',
'                unsafe:     false',
'            }',
'        ]);',
'    }  ',
'}',
' ',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de generar el archivo .Zip?", function( okPressed ) {'),
'    if( okPressed ) {',
'       apex.item(''BTN_GENERAR_ZIP'').disable();',
'       Generar_Archivo(); ',
'    }',
'});',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35822735391304516)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar XML - Generar ZIP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dta            clob;',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(100);',
'begin',
'    v_mnsje_rspsta := ''Tipo de Lote Determinaciones - Multiples Fechas -- Entrando a Generar el XML-Actos'';',
'    pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); 	',
'    ',
'    :P106_ID_RPRTE_PRMTRO  := pkg_gn_generalidades.fnc_ge_id_rprte_prmtro();',
'    ',
'    v_mnsje_rspsta := ''P106_ID_RPRTE_PRMTRO: '' || :P106_ID_RPRTE_PRMTRO;',
'    --pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); ',
'    ',
'        ',
'    for c_determinacion in ( select a.id_dtrmncion,',
'                                    b.nmro_acto_dsplay ',
'                               from gi_g_determinaciones a',
'                               join gn_g_actos    b on a.id_acto = b.id_acto',
'                              where a.id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE) loop',
'    ',
'        v_dta  := ''<P_ID_DTRMNCION_LTE>'' || :P63_ID_DTRMNCION_LTE        || ''</P_ID_DTRMNCION_LTE>''|| ',
'                  ''<P_ID_DTRMNCION>''     || c_determinacion.id_dtrmncion || ''</P_ID_DTRMNCION>''    || ',
'                  ''<nmbre_rprte> ''       || c_determinacion.nmro_acto_dsplay  || ''</nmbre_rprte>'';',
'             ',
'    --pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, :P106_ID_RPRTE_PRMTRO, 6); ',
'    pkg_gn_generalidades.prc_rg_t_reportes_parametro( :P106_ID_RPRTE_PRMTRO, v_dta, v_cdgo_rspsta, v_mnsje_rspsta );',
'    --pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_dta, 6); ',
'    --pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_cdgo_rspsta, 6); ',
'    --pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); ',
'    ',
'                                                      ',
'    end loop;',
'    ',
'    v_mnsje_rspsta := ''v_cdgo_rspsta: '' || v_cdgo_rspsta || '' v_mnsje_rspsta: '' || v_mnsje_rspsta;',
'    pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_re_documentos.prc_rg_lote_documentos'',  6, v_mnsje_rspsta, 6); ',
'    ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(37415528171005930)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10712649063414906)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtiene JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_json            json_object_t := json_object_t();',
' v_json_envia      clob;',
' v_id_rprte        number;',
'begin',
'   ',
'   select  id_rprte',
'   into    v_id_rprte',
'   from    gn_d_reportes',
'   where   id_rprte = ( select  id_rprte',
'                        from    gn_d_plantillas',
'                        where   id_plntlla = :P106_ID_PLNTLLA ) ;',
'   ',
'   v_json.put(''id_dtrmncion_lte'',:P63_ID_DTRMNCION_LTE); ',
'   --v_json.put(''id_plntlla'',:P106_ID_PLNTLLA); ',
'   ',
'   apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );',
'   apex_util.set_session_state(''P37_JSON'', v_json.to_clob());',
'   apex_util.set_session_state(''P37_ID_RPRTE'', v_id_rprte);',
'   ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(37415201850005927)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161129319822342332)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Generar blob de Determinaci\00F3n job')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_error varchar2(1000);',
'begin',
'    insert into gti_aux (col1, col2) values (''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'    insert into gti_aux (col1, col2) values (''F_ID_USRIO'', :F_ID_USRIO);',
'    insert into gti_aux (col1, col2) values (''P63_ID_DTRMNCION_LTE'', :P63_ID_DTRMNCION_LTE); ',
'    insert into gti_aux (col1, col2) values (''P106_ID_PLNTLLA'', :P106_ID_PLNTLLA);',
'    insert into gti_aux (col1, col2) values (''P106_GNRA_ACTO_TPO'', :P106_GNRA_ACTO_TPO);',
'    commit;',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_RG_BLOBS_DETERMINACIONES"'', attribute => ''job_action'', value => ''PKG_GI_DETERMINACION.PRC_GN_ACTO_BLOB_DETERMINACION'');',
'',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_RG_BLOBS_DETERMINACIONES"'', attribute => ''number_of_arguments'', value => ''5'');',
'',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_BLOBS_DETERMINACIONES'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_BLOBS_DETERMINACIONES'', argument_position => 2, argument_value => :F_ID_USRIO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_BLOBS_DETERMINACIONES'', argument_position => 3, argument_value => :P63_ID_DTRMNCION_LTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_BLOBS_DETERMINACIONES'', argument_position => 4, argument_value => :P106_ID_PLNTLLA);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_BLOBS_DETERMINACIONES'', argument_position => 5, argument_value => :P106_GNRA_ACTO_TPO); ',
'',
'    END; ',
'',
'    ',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_RG_BLOBS_DETERMINACIONES"'');',
'    END; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35823716837304526)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10712872529414908)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Genera ZIP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_app_id         number                     := v(''APP_ID'');',
'    v_app_page_id    number                     := v(''APP_PAGE_ID'');',
'    v_cdgo_clnte     df_s_clientes.cdgo_clnte%type := :F_CDGO_CLNTE;',
'    v_gn_d_reportes  gn_d_reportes%rowtype;',
'    v_app_id_dstno   number := 66000;',
'    v_zip_file       blob;',
'    v_blob           blob;',
'    v_cntdad_actos   number := 0;',
'begin   ',
'   ',
'    insert into muerto (n_001, v_001, t_001) values (1, ''Inicia ZIP Lote:''||:P63_ID_DTRMNCION_LTE, systimestamp );commit;  ',
'        ',
'    --Busca los Datos del Reporte',
'    begin',
'        select /*+ RESULT_CACHE */ a.*',
'        into v_gn_d_reportes',
'        from gn_d_reportes a',
'        where   id_rprte = ( select  id_rprte',
'                             from    gn_d_plantillas',
'                             where   id_plntlla = :P106_ID_PLNTLLA ) ;',
'                        ',
'    exception',
'        when no_data_found then',
'             return;',
'    end;',
'    ',
'    apex_session.attach( p_app_id     => v_app_id_dstno',
'                       , p_page_id    => 37',
'                       , p_session_id => v(''APP_SESSION''));',
'    ',
'    apex_util.set_session_state( ''F_CDGO_CLNTE'' , v_cdgo_clnte );',
'                           ',
'    for c_dcmntos_lte in (  select d.file_blob, d.nmro_acto, a.id_dtrmncion_lte, a.id_dtrmncion',
'                            from   gi_g_determinaciones  a',
'                            join   v_gn_g_actos          d on a.id_acto = d.id_acto',
'                            where  a.id_dtrmncion_lte    =  :P63_ID_DTRMNCION_LTE',
'                            and    d.id_dcmnto is not null',
'                         ) ',
'    loop   ',
'        v_blob := c_dcmntos_lte.file_blob;',
'        /***',
'        apex_util.set_session_state(''P37_JSON'', ''{"id_dtrmncion_lte":''||c_dcmntos_lte.id_dtrmncion_lte||'', "id_dtrmncion":''||c_dcmntos_lte.id_dtrmncion||''}''); ',
'        --insert into muerto (v_001) values (''"id_dtrmncion_lte":''||c_dcmntos_lte.id_dtrmncion_lte||'', "id_dtrmncion":''||c_dcmntos_lte.id_dtrmncion );commit;            ',
'        v_blob := apex_util.get_print_document( p_application_id     => v_app_id_dstno',
'                                              , p_report_query_name  => v_gn_d_reportes.nmbre_cnslta',
'                                              , p_report_layout_name => v_gn_d_reportes.nmbre_plntlla',
'                                              , p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla',
'                                              , p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'        ***/        ',
'        if  dbms_lob.getlength(v_blob) > 500 then ',
'            v_cntdad_actos := v_cntdad_actos + 1 ;',
'            apex_zip.add_file ( p_zipped_blob => v_zip_file',
'                              , p_file_name   => c_dcmntos_lte.nmro_acto || ''.'' || lower( v_gn_d_reportes.cdgo_frmto_tpo ) ',
'                              , p_content     => v_blob );',
'        end if;',
'    end loop;',
'    insert into muerto (n_001, v_001, t_001) values (1, ''ZIP v_cntdad_actos:''||v_cntdad_actos, systimestamp );commit; ',
'    ',
'    if v_cntdad_actos > 0 then',
'        apex_zip.finish( p_zipped_blob => v_zip_file );',
'',
'        owa_util.mime_header(''application/zip'', false); ',
'        htp.p(''Content-length: ''|| dbms_lob.getlength(v_zip_file));',
unistr('        htp.p(''Content-Disposition: attachment; filename="'' || ''Lote N\00B0'' || :P63_ID_DTRMNCION_LTE || ''.zip"'');'),
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_zip_file);',
'    end if;',
'    ',
'    insert into muerto (n_001, v_001, t_001) values (1, ''Termina ZIP Lote:''||:P63_ID_DTRMNCION_LTE, systimestamp );commit; ',
'    ',
'    apex_session.attach( p_app_id     => v_app_id',
'                       , p_page_id    => v_app_page_id',
'                       , p_session_id => v(''APP_SESSION''));',
'                           ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Imprimir_Zip2'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(37415748669005932)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar HTML de documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_html             clob;',
'    v_mnsje_rspsta     varchar2(1000);',
'    v_cdgo_rspsta      number;',
'    v_cntdad_acto      number := 0;',
'    v_cntdad_sin_acto  number := 0;',
'begin',
'    ',
'    v_cdgo_rspsta := 0;',
'    ',
'    pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_gi_determinacion.prc_ac_acto_determinacion'',  6, ''INICIA GENERANDO ACTOS(pagina) Lote:''||:P63_ID_DTRMNCION_LTE, 1); ',
'    --pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_gi_determinacion.prc_ac_acto_determinacion'',  6, ''TIPO GENERANDO ACTOS(pagina):''||:P106_GNRA_ACTO_TPO, 1); ',
'   ',
'    for c_dtrmncion in ( select a.id_dtrmncion , a.id_sjto_impsto , a.id_acto , d.id_dcmnto',
'                         from   gi_g_determinaciones  a',
'						 join 	v_gn_g_actos 		  d on a.id_acto = d.id_acto ',
'                         where  id_dtrmncion_lte = :P63_ID_DTRMNCION_LTE ',
'                         --and    id_dtrmncion in ( 1165386 , 1165387 , 1165388 , 1167020 )                        ',
'                         and    (case ',
'                                    when :P106_GNRA_ACTO_TPO = ''T'' then',
'                                        --nvl(length(d.file_blob),-1)',
'                                        1',
'                                    when :P106_GNRA_ACTO_TPO = ''E'' and ( d.file_blob is null or length(d.file_blob) < 500 ) then',
'                                        1',
'                                    else 0',
'                                end) =  1 --nvl(length(d.file_blob),-1)  ',
'                      )  ',
'    loop',
'        v_html := pkg_gn_generalidades.fnc_ge_dcmnto(''{"ID_DTRMNCION":'' ||c_dtrmncion.id_dtrmncion ||''}'', :P106_ID_PLNTLLA);',
'        begin',
'			update 	gi_g_determinaciones',
'			set 	dcmnto 		 = v_html,',
'					id_plntlla   = :P106_ID_PLNTLLA',
'			where 	id_dtrmncion = c_dtrmncion.id_dtrmncion;',
'        exception',
'            when others then ',
'                rollback;                    ',
'                v_cntdad_sin_acto := v_cntdad_sin_acto + 1;',
'             ',
'				-- TRAZA',
'				--v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''Error al actualizar dcmnto determinaci\00F3n Id: '' || c_dtrmncion.id_dtrmncion || sqlerrm;'),
'				v_mnsje_rspsta := pkg_gi_determinacion.fnc_rg_determinacion_error(p_cdgo_clnte               => :F_CDGO_CLNTE,',
'																				  p_id_dtrmncion_lte         => :P63_ID_DTRMNCION_LTE,',
'																				  p_id_dtrmncion             => c_dtrmncion.id_dtrmncion,',
'																				  p_id_sjto_impsto           => c_dtrmncion.id_sjto_impsto,',
'																				  p_vgncia                   => null,',
'																				  p_prdo                     => null,',
'																				  p_cdgo_dtrmncion_error_tip => ''ACT'',',
'																				  p_mnsje_error              => v_mnsje_rspsta);',
'			',
'				pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null,  ''pkg_gi_determinacion.prc_ac_acto_determinacion'', 6, v_mnsje_rspsta, 6);	',
'				continue; -- que siga con el siguiente',
'                /*v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''Error al actualizar el acto de la determinaci\00F3n n\00B0'' || c_dtrmncion.id_dtrmncion;'),
'                apex_error.add_error ( p_message => v_mnsje_rspsta, p_display_location => apex_error.c_inline_in_notification );',
'				raise_application_error( -20001 , v_mnsje_rspsta );*/',
'        end;',
'        ',
'        -- UP ',
'        begin',
'            if c_dtrmncion.id_dcmnto is not null then',
'                update gn_g_actos set id_dcmnto = null where id_acto = c_dtrmncion.id_acto ;',
'            end if;',
'        ',
'            pkg_gi_determinacion.prc_ac_acto_determinacion (  p_id_dtrmncion   => c_dtrmncion.id_dtrmncion',
'                                                             , o_cdgo_rspsta   => v_cdgo_rspsta',
'                                                             , o_mnsje_rspsta  => v_mnsje_rspsta );',
'             ',
'            if v_cdgo_rspsta = 0 then',
'                v_cntdad_acto := v_cntdad_acto + 1;',
'            else',
'                rollback;',
'                v_cntdad_sin_acto := v_cntdad_sin_acto + 1;',
'                continue;',
'            end if;',
'            ',
'        exception',
'            when others then ',
'                rollback;',
'                v_cntdad_sin_acto := v_cntdad_sin_acto + 1;',
'                continue;/*',
'                v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''Error al actualizar el blob del acto de la determinaci\00F3n n\00B0'' || c_dtrmncion.id_dtrmncion;'),
'                apex_error.add_error ( p_message => v_mnsje_rspsta, p_display_location => apex_error.c_inline_in_notification );',
'				raise_application_error( -20001 , v_mnsje_rspsta );*/',
'        end;        ',
'        ',
'        commit; -- Asegurar el acto generado',
'    end loop;',
'    pkg_sg_log.prc_rg_log( :F_CDGO_CLNTE, null, ''pkg_gi_determinacion.prc_ac_acto_determinacion'',  6, ''TERMINA GENERANDO ACTOS(pagina) Lote:''||:P63_ID_DTRMNCION_LTE, 1); ',
'    ',
'    ',
'    --v_cntdad_acto := 6456;',
'    --v_cntdad_sin_acto := 5756;',
'    ',
'    ---',
'    apex_json.open_object;',
'    --if v_cdgo_rspsta = 0 then  ',
unistr('        v_mnsje_rspsta := ''Generaci\00F3n de actos terminado. Se generaron '' || trim(to_char(v_cntdad_acto,''999G999G999G999G999'')) || '' Actos'';'),
'        if v_cntdad_sin_acto > 0 then',
'            v_mnsje_rspsta := v_mnsje_rspsta || '' y quedaron ''||trim(to_char(v_cntdad_sin_acto,''999G999G999G999G999''))||'' actos sin generar. Ver Detalle Lote.'';',
'        end if;',
'        ',
'        apex_json.write(''type'', ''OK'');',
'        apex_json.write(''msg'', v_mnsje_rspsta); ',
unistr('        --apex_json.write(''msg'', ''Generaci\00F3n de actos Terminado. Se generaron '' || v_cntdad_acto || ''. ''); '),
'    /*else        ',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.write(''msg'', ''Error al generar los Actos. ''|| v_mnsje_rspsta  ); ',
'    end if;*/',
'    apex_json.close_object;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161128363289342322)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar_Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_app_id         number                     := v(''APP_ID'');',
'    v_app_page_id    number                     := v(''APP_PAGE_ID'');',
'    v_cdgo_clnte     df_s_clientes.cdgo_clnte%type := :F_CDGO_CLNTE;',
'    v_gn_d_reportes  gn_d_reportes%rowtype;',
'    v_app_id_dstno   number := 66000;',
'    v_zip_file       blob;',
'    v_blob           blob;',
'    v_cntdad_actos   number := 0;',
'begin   ',
'   ',
'    insert into muerto (n_001, v_001, t_001) values (1, ''Inicia ZIP Lote:''||:P63_ID_DTRMNCION_LTE, systimestamp );commit;  ',
'        ',
'    --Busca los Datos del Reporte',
'    begin',
'        select /*+ RESULT_CACHE */ a.*',
'        into v_gn_d_reportes',
'        from gn_d_reportes a',
'        where   id_rprte = ( select  id_rprte',
'                             from    gn_d_plantillas',
'                             where   id_plntlla = :P106_ID_PLNTLLA ) ;',
'                        ',
'    exception',
'        when no_data_found then',
'             return;',
'    end;',
'    ',
'    apex_session.attach( p_app_id     => v_app_id_dstno',
'                       , p_page_id    => 37',
'                       , p_session_id => v(''APP_SESSION''));',
'    ',
'    apex_util.set_session_state( ''F_CDGO_CLNTE'' , v_cdgo_clnte );',
'                           ',
'    for c_dcmntos_lte in (  select d.file_blob, d.nmro_acto, a.id_dtrmncion_lte, a.id_dtrmncion',
'                            from   gi_g_determinaciones  a',
'                            join   v_gn_g_actos          d on a.id_acto = d.id_acto',
'                            where  a.id_dtrmncion_lte    =  :P63_ID_DTRMNCION_LTE',
'                            and    d.file_blob is not null',
'                            --and rownum < 10000',
'                         ) ',
'    loop   ',
'        v_blob := c_dcmntos_lte.file_blob;',
'        /***',
'        apex_util.set_session_state(''P37_JSON'', ''{"id_dtrmncion_lte":''||c_dcmntos_lte.id_dtrmncion_lte||'', "id_dtrmncion":''||c_dcmntos_lte.id_dtrmncion||''}''); ',
'        --insert into muerto (v_001) values (''"id_dtrmncion_lte":''||c_dcmntos_lte.id_dtrmncion_lte||'', "id_dtrmncion":''||c_dcmntos_lte.id_dtrmncion );commit;            ',
'        v_blob := apex_util.get_print_document( p_application_id     => v_app_id_dstno',
'                                              , p_report_query_name  => v_gn_d_reportes.nmbre_cnslta',
'                                              , p_report_layout_name => v_gn_d_reportes.nmbre_plntlla',
'                                              , p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla',
'                                              , p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'        ***/        ',
'        if  dbms_lob.getlength(v_blob) > 500 then ',
'            v_cntdad_actos := v_cntdad_actos + 1 ;',
'            apex_zip.add_file ( p_zipped_blob => v_zip_file',
'                              , p_file_name   => c_dcmntos_lte.nmro_acto || ''.'' || lower( v_gn_d_reportes.cdgo_frmto_tpo ) ',
'                              , p_content     => v_blob );',
'        end if;',
'    end loop;',
'    insert into muerto (n_001, v_001, t_001) values (1, ''ZIP v_cntdad_actos:''||v_cntdad_actos, systimestamp );commit; ',
'    ',
'    if v_cntdad_actos > 0 then',
'        apex_zip.finish( p_zipped_blob => v_zip_file );',
'',
'        owa_util.mime_header(''application/zip'', false); ',
'        htp.p(''Content-length: ''|| dbms_lob.getlength(v_zip_file));',
unistr('        htp.p(''Content-Disposition: attachment; filename="'' || ''Lote N\00B0'' || :P63_ID_DTRMNCION_LTE || ''.zip"'');'),
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_zip_file);',
'        apex_application.stop_apex_engine;',
'    end if;',
'    ',
'    insert into muerto (n_001, v_001, t_001) values (1, ''Termina ZIP Lote:''||:P63_ID_DTRMNCION_LTE, systimestamp );commit; ',
'    ',
'    --apex_session.attach( p_app_id     => v_app_id , p_page_id    => v_app_page_id , p_session_id => v(''APP_SESSION''));',
'                           ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161128448703342323)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar_Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'begin',
'',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');    ',
'    apex_json.write(''msg'', ''OK'');    ',
'    apex_json.write(''nmbre_rprte'', ''LOTE_ACTOS'');    ',
'    ',
'    apex_json.close_object;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
