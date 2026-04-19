prompt --application/pages/page_00110
begin
wwv_flow_api.create_page(
 p_id=>110
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Parrafos de plantilla'
,p_page_mode=>'MODAL'
,p_step_title=>'Parrafos de plantilla'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var acc = document.getElementsByClassName("accordion");',
'var i; ',
'for (i = 0; i < acc.length; i++) {',
'  acc[i].addEventListener("click", function() {',
'    this.classList.toggle("active");',
'    var panel = this.nextElementSibling;    ',
'    if (panel.style.maxHeight){',
'      panel.style.maxHeight = null;',
'    } else {',
'      panel.style.maxHeight = panel.scrollHeight + "px";',
'    } ',
'  });',
'}',
'',
'$(''.column'').hover(function(){',
'    var  content = `<div>${$(this).data(''tooltip'')} </div>`;',
'    $(this).tooltipster({',
'        contentAsHTML: true,',
'        interactive: true,',
'        theme: ''tooltipster-shadow'',//''tooltipster-light'',',
'        animation: ''fade'',',
'        delay: [100, 1000]',
'        }).tooltipster(''content'', content).tooltipster(''open'');',
'}, function () {$(this).tooltipster(''close'');});'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-light.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-punk.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-noir.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.accordion {',
'    background-color: #eee;',
'    color: #444;',
'    cursor: pointer;',
'    padding: 5px;',
'    width: 100%;',
'    border: 1px solid #eee;',
'    text-align: left;',
'    border-radius: 5px;',
'    outline: none;',
'    font-size: 12px;',
'    transition: 0.4s;',
'    margin-bottom: 4px;',
'}',
'',
'.active, .accordion:hover {',
'    background-color: #ccc;',
'}',
'',
'.accordion:after {',
'    content: ''\002B'';',
'    color: #777;',
'    font-weight: bold;',
'    float: right;',
'    margin-right: 4px;',
'}',
'',
'.active:after {',
'    content: "\2212";',
'}',
'',
'.panel {',
'    padding: 0 8px;',
'    background-color: white;',
'    max-height: 0;',
'    overflow: hidden;',
'    transition: max-height 0.6s ease-out;',
'}',
'',
'#varlist, #columnslist {',
'    list-style-type: none;',
'    margin: 0 !important;',
'    padding: 0;',
'}',
'#varlist li, #columnslist li {',
'    background: #c4ced724;',
'    border: 1px solid #c4ced724;',
'    border-radius: 5px;',
'    margin-bottom: 5px;',
'    height: 25px;',
'    line-height: 25px;',
'    cursor: move;',
'}',
'#varlist li:nth-child(2n), #columnslist li:nth-child(2n) {',
'    background: #c4ced7c9;',
'    border: 1px solid #c4ced7c9;',
'}',
'#varlist li:hover, #columnslist li:hover {',
'    background: #FFFDE3;',
'    border-left: 5px solid #DCDAC1;',
'    margin-left: -5px; ',
'}',
'.column {',
'    padding: 0 20px;',
'    white-space: nowrap;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'} '))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20240508104323'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40570904521056743)
,p_plug_name=>'Parrafos de plantilla'
,p_region_name=>'region_parrafo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29530253509068499)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40571679437056744)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29532093730068500)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41208809848338017)
,p_plug_name=>unistr('P\00E1rrafo')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101361150465311809)
,p_plug_name=>'Datos Parrafo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41208778831338016)
,p_plug_name=>'Columnas'
,p_parent_plug_id=>wwv_flow_api.id(101361150465311809)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   c_clmnas         integer;',
'   v_dscrpcion_tbla dbms_sql.desc_tab2;',
'   v_nmro_clmna     integer;  ',
'   v_sql            clob;',
'begin',
'    c_clmnas := dbms_sql.open_cursor;',
'    htp.p(''<div class="columns"> <ul id="columnslist">'');',
'    ',
'    for c_plntllas in (select a.cnslta,',
'                              a.id_plntlla_cnslta,',
'                              a.id_plntlla,',
'                              a.dscrpcion,',
'                              a.dscrpcion_crta,',
'                              a.tpo_cnslta',
'                         from gn_d_plantillas_consulta a',
'                        where a.id_plntlla = :P110_ID_PLNTLLA)',
'    loop',
'        v_sql := c_plntllas.cnslta;',
'        ',
'        if c_plntllas.tpo_cnslta = ''P'' then',
'            execute immediate c_plntllas.cnslta using out v_sql  ;',
'        end if ;',
'        ',
'        dbms_sql.parse( c_clmnas, v_sql , dbms_sql.native );',
'        dbms_sql.describe_columns2( c_clmnas, v_nmro_clmna, v_dscrpcion_tbla );',
'        htp.p(''<div class="accordion">''|| c_plntllas.dscrpcion_crta || ''</div>'');',
'        htp.p(''<div class="panel">'');',
'        for c_columnas in 1 .. v_nmro_clmna',
'        loop',
'            htp.p( ''<li><div class="column h-card" data-tooltip="''||  v_dscrpcion_tbla( c_columnas ).col_name ||''" data-valor="<a href=''''''|| c_plntllas.id_plntlla_cnslta|| ''''''>!'' || v_dscrpcion_tbla( c_columnas ).col_name ||''!</a>"   draggable="true"'
||' >'' || v_dscrpcion_tbla( c_columnas ).col_name || ''</div></li>'') ;',
'        end loop;',
'         htp.p(''</div>'');',
'    end loop;',
'    htp.p( ''</ul></div>'') ;',
'        ',
'    dbms_sql.close_cursor( c_clmnas );',
'    ',
'    exception when others then',
'     if dbms_sql.is_open( c_clmnas ) then',
'        dbms_sql.close_cursor( c_clmnas );',
'     end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101361062736311808)
,p_plug_name=>'Variables'
,p_parent_plug_id=>wwv_flow_api.id(101361150465311809)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    htp.p(''<div class="columns"> <ul id="varlist">'');',
'    htp.p(''<div class="accordion">Variables</div>'');',
'    htp.p(''<div class="panel">'');',
'    ',
'    for c_vrbles in (select nmbre',
'                          , dscrpcion ',
'                       from gn_d_plantillas_variable)',
'    loop',
'        htp.p( ''<li><div class="column h-card" data-tooltip="''|| c_vrbles.dscrpcion ||''" data-valor="<a href=''''''|| c_vrbles.nmbre|| ''''''>!'' || c_vrbles.nmbre ||''!</a>"   draggable="true" >'' || c_vrbles.nmbre || ''</div></li>'') ;',
'    end loop;',
'    ',
'    htp.p(''</div>'');',
'    htp.p( ''</ul></div>'') ;',
'    exception ',
'        when others then',
'            null;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40572076979056745)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(40571679437056744)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40571574273056744)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(40571679437056744)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de eliminar el PÃ¡rrafo?'',''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P110_ID_PLNTLLA_PRRFO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40571494476056744)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(40571679437056744)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P110_ID_PLNTLLA_PRRFO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40571344491056744)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(40571679437056744)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P110_ID_PLNTLLA_PRRFO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40574458590056748)
,p_name=>'P110_ID_PLNTLLA_PRRFO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40570904521056743)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PLNTLLA_PRRFO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40574899170056763)
,p_name=>'P110_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(40570904521056743)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Plantilla'
,p_source=>'ID_PLNTLLA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.DSCRPCION,t.ID_PLNTLLA',
'from gn_d_plantillas t',
'where t.CDGO_CLNTE = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40575135127056765)
,p_name=>'P110_PRRFO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(41208809848338017)
,p_use_cache_before_default=>'NO'
,p_source=>'PRRFO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cMaxlength=>40000
,p_tag_attributes=>'contenteditable="true"'
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
'    ',
'		CKEDITOR.on( ''instanceReady'', function(ev) {            ',
'            var columnslist = CKEDITOR.document.getById( ''columnslist'' );',
'            if (columnslist) {',
'			    columnslist.on( ''dragstart'', function( evt ) {                   ',
'                    CKEDITOR.plugins.clipboard.initDragDataTransfer( evt );',
'                    var dataTransfer = evt.data.dataTransfer; ',
'                    dataTransfer.setData( ''column'', $(evt.data.$.target).data(''valor'') );',
'                    dataTransfer.setData( ''text/html'', ''<hidden><hidden>'' );',
'			    });                ',
'            }',
'            ',
'            var varlist = CKEDITOR.document.getById( ''varlist'' );',
'            if (varlist) {',
'			    varlist.on( ''dragstart'', function( evt ) {                   ',
'                    CKEDITOR.plugins.clipboard.initDragDataTransfer( evt );',
'                    var dataTransfer = evt.data.dataTransfer; ',
'                    dataTransfer.setData( ''column'', $(evt.data.$.target).data(''valor'') );',
'                    dataTransfer.setData( ''text/html'', ''<hidden><hidden>'' );',
'			    });                ',
'            }            ',
'		} );',
'    ',
'    options.uiColor = ''#f1f1f1'';',
'    options.skin = ''office2013,skins/office2013/'';',
'    options.height = 500;',
'    options.resize_enabled = false',
'    options.extraPlugins = ''hcard'';',
'    options.enterMode = 2;',
'//options.removePlugins = ''contextmenu,liststyle,tabletools'';',
'	return  options;',
'}'))
,p_attribute_03=>'Y'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40575516249056765)
,p_name=>'P110_ORDEN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(40570904521056743)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Orden'
,p_source=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40719934153565563)
,p_name=>'P110_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(40570904521056743)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>500
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40572187897056745)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(40572076979056745)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40572915910056746)
,p_event_id=>wwv_flow_api.id(40572187897056745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40576336088056767)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GN_D_PLANTILLAS_PARRAFO'
,p_attribute_02=>'GN_D_PLANTILLAS_PARRAFO'
,p_attribute_03=>'P110_ID_PLNTLLA_PRRFO'
,p_attribute_04=>'ID_PLNTLLA_PRRFO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40576746376056767)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GN_D_PLANTILLAS_PARRAFO'
,p_attribute_02=>'GN_D_PLANTILLAS_PARRAFO'
,p_attribute_03=>'P110_ID_PLNTLLA_PRRFO'
,p_attribute_04=>'ID_PLNTLLA_PRRFO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40577107653056767)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(40571574273056744)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40577552749056767)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
