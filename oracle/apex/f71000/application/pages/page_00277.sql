prompt --application/pages/page_00277
begin
wwv_flow_api.create_page(
 p_id=>277
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Prescripciones  por Parrafo'
,p_page_mode=>'MODAL'
,p_step_title=>'Prescripciones  por Parrafo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function drag(ev) {',
'   ev.dataTransfer.setData("text", $(ev.target).data(''valor''));',
'}',
'',
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'))
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
'}, function () {$(this).tooltipster(''close'');});',
'',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-light.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-punk.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-noir.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
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
'}'))
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'65%'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8141320121502626)
,p_plug_name=>'Pantalla basada en GF_D_PRESCRIPCIONES_PARRAFO'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177322596503050602)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8143012109502643)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16913152732803318)
,p_plug_name=>'Consulta'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-lg'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   c_clmnas         integer;',
'   v_dscrpcion_tbla dbms_sql.desc_tab2;',
'   v_nmro_clmna     integer;  ',
'   v_sql            clob;',
'   v_rt_ma_g_envios_prgrmdo_cnslta    ma_g_envios_prgrmdo_cnslta%rowtype;',
'   ',
'begin',
'    c_clmnas := dbms_sql.open_cursor;',
'    htp.p(''<div class="columns"> <ul id="columnslist">'');',
'    ',
'    --Consultamos la consulta ',
'    begin',
'        select cnslta_1',
'          into v_sql',
'          from gf_d_prescripciones_parrafo',
'         where id_prscrpcion_prrfo = :P277_ID_PRSCRPCION_PRRFO ;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    if v_sql is not null then',
'        --Obtenemos la consulta',
'        begin',
'',
'            dbms_sql.parse( c_clmnas, v_sql , dbms_sql.native );',
'            dbms_sql.describe_columns2( c_clmnas, v_nmro_clmna, v_dscrpcion_tbla );',
'            htp.p(''<div class="accordion">''|| ''Columnas'' || ''</div>'');',
'            htp.p(''<div class="panel">'');',
'            for c_columnas in 1 .. v_nmro_clmna loop',
'                htp.p( ''<li><div ondragstart=" drag(event)" class="column h-card" data-tooltip="''||  v_dscrpcion_tbla( c_columnas ).col_name ||''" data-valor="#''||v_dscrpcion_tbla( c_columnas ).col_name ||''#"   draggable="true" >'' || v_dscrpcion_tbla('
||' c_columnas ).col_name || ''</div></li>'') ;',
'            end loop;',
'            htp.p( ''<li><div ondragstart=" drag(event)" class="column h-card" data-tooltip="VGNCIAS" data-valor="#VGNCIAS#"   draggable="true" >VGNCIAS</div></li>'') ;',
'        exception',
'            when others then',
'                null;',
'        end;',
'',
'',
'        htp.p(''</div>'');',
'        htp.p( ''</ul></div>'');',
'    else ',
'        htp.p(''<div class="accordion">''|| ''Columnas'' || ''</div>'');',
'        htp.p(''<div class="panel">'');',
'        htp.p( ''<li><div ondragstart=" drag(event)" class="column h-card" data-tooltip="VGNCIAS" data-valor="#VGNCIAS#"   draggable="true" >VGNCIAS</div></li>'') ;',
'        htp.p(''</div>'');',
'        htp.p( ''</ul></div>'');',
'    end if;        ',
'    ',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8143185189502644)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(8143012109502643)
,p_button_name=>'Btn_cancelar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8142932136502642)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(8143012109502643)
,p_button_name=>'Btn_guardar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambio'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P277_ID_PRSCRPCION_PRRFO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8487735234208802)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(8143012109502643)
,p_button_name=>'Btn_crear'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P277_ID_PRSCRPCION_PRRFO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8143476275502647)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(8143012109502643)
,p_button_name=>'Btn_delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea eliminar el registro?'',''Btn_delete'');'
,p_button_condition=>'P277_ID_PRSCRPCION_PRRFO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(8445916754724507)
,p_branch_name=>'Go To Page 275'
,p_branch_action=>'f?p=&APP_ID.:275:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8141462547502627)
,p_name=>'P277_ID_PRSCRPCION_PRRFO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8141320121502626)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRSCRPCION_PRRFO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8141524632502628)
,p_name=>'P277_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8141320121502626)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DSCRPCION_PRRFO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8141606189502629)
,p_name=>'P277_ID_RGLA_NGCIO_CLNTE_FNCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8141320121502626)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Regla Negocio'
,p_source=>'ID_RGLA_NGCIO_CLNTE_FNCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.cdgo_impsto||'' - ''||d.dscrpcion ',
'     , a.id_rgla_ngcio_clnte_fncion',
'  from gn_d_rglas_ngcio_clnte_fnc  a',
'  join gn_d_reglas_negocio_cliente b on a.id_rgla_ngcio_clnte = b.id_rgla_ngcio_clnte',
'  join gn_d_reglas_negocio         c on b.id_rgla_ngcio       = c.id_rgla_ngcio ',
'  join gn_d_funciones              d on a.id_fncion           = d.id_fncion',
'  join df_c_impuestos              e on b.id_impsto           = e.id_impsto  ',
' where c.id_prcso = 12'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8141776992502630)
,p_name=>'P277_INDCDR_CMPLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(8141320121502626)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Indicador Cumple <br> Regla Negocio '
,p_source=>'INDCDR_CMPLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8141894335502631)
,p_name=>'P277_TXTO_PRRFO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(8141320121502626)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('P\00E1rrafo ')
,p_source=>'TXTO_PRRFO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>50
,p_cMaxlength=>32767
,p_cHeight=>5
,p_tag_attributes=>'contenteditable="true"'
,p_field_template=>wwv_flow_api.id(177355630355050629)
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
'                    //var element = CKEDITOR.dom.element.createFromHtml(column);',
'                    console.log(column);',
'                    CKEDITOR.instances.P277_TXTO_PRRFO.insertText( column );                   ',
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
'                       ',
'		} );',
'    ',
'    options.uiColor = ''#f1f1f1'';',
'    options.skin = ''office2013,skins/office2013/'';',
'    options.height = 500;',
'    options.extraPlugins = ''hcard'';',
'    options.enterMode = 2;	options.removePlugins = ''contextmenu,liststyle,tabletools'';	return  options;',
'}'))
,p_attribute_03=>'N'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8141950512502632)
,p_name=>'P277_CNSLTA_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(8141320121502626)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Consulta'
,p_source=>'CNSLTA_1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>32767
,p_cHeight=>15
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8142014989502633)
,p_name=>'P277_ACTVO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(8141320121502626)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Actvo'
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8488186207208806)
,p_name=>'P277_CDGO_CLNTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(8141320121502626)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8488319766208808)
,p_name=>'P277_CDGO_PRRFO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(8141320121502626)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('C\00F3digo P\00E1rrafo')
,p_source=>'CDGO_PRRFO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>3
,p_display_when=>'P277_ID_PRSCRPCION_PRRFO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8142492566502637)
,p_validation_name=>unistr('validar que las columnas est\00E9n determinadas ')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    return not regexp_like(:P277_CNSLTA_1, ''select(\s)+\*'');',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Debe especificar las Columnas de la consulta'
,p_associated_item=>wwv_flow_api.id(8141950512502632)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8142548971502638)
,p_validation_name=>'validar sintaxis de la consulta'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'    v_return clob;',
'begin',
'',
'    if :P277_CNSLTA_1 = ''S'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P277_CNSLTA_1;',
'        execute immediate v_sql ;',
'    elsif  :P277_CNSLTA_1 = ''P'' then  ',
'        execute immediate :P277_CNSLTA_1 using out v_return ;',
'    end if;',
'    ',
'exception when others then',
'   return ''Consulta/Procedimiento no Valido''; -- regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(8141950512502632)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8142664127502639)
,p_validation_name=>'validar insert en consulta'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    existe_insert number(2):= 0;',
'begin',
'',
'    select instr(upper(:P277_CNSLTA_1),upper(''insert'')) ',
'    into existe_insert',
'    from dual;',
'',
'    if existe_insert > 0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('No puede haber una instrucci\00F3n Insert en la consulta.')
,p_associated_item=>wwv_flow_api.id(8141950512502632)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8142789332502640)
,p_validation_name=>'validar update en consulta'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    existe_insert number(2):= 0;',
'begin',
'',
'    select instr(upper(:P277_CNSLTA_1),upper(''update'')) ',
'    into existe_insert',
'    from dual;',
'',
'    if existe_insert > 0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('No puede haber una instrucci\00F3n Update en la consulta.')
,p_associated_item=>wwv_flow_api.id(8141950512502632)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8142865881502641)
,p_validation_name=>'validar delete en consulta'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    existe_insert number(2):= 0;',
'begin',
'',
'    select instr(upper(:P277_CNSLTA_1),upper(''delete'')) ',
'    into existe_insert',
'    from dual;',
'',
'    if existe_insert > 0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('No puede haber una instrucci\00F3n Delete en la consulta.')
,p_associated_item=>wwv_flow_api.id(8141950512502632)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8143281701502645)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8143185189502644)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8143320134502646)
,p_event_id=>wwv_flow_api.id(8143281701502645)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8142371516502636)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from GF_D_PRESCRIPCIONES_PARRAFO'
,p_attribute_02=>'GF_D_PRESCRIPCIONES_PARRAFO'
,p_attribute_03=>'P277_ID_PRSCRPCION_PRRFO'
,p_attribute_04=>'ID_PRSCRPCION_PRRFO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8142287060502635)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar llave primaria'
,p_process_sql_clob=>':P277_ID_PRSCRPCION_PRRFO := sq_gf_d_prescripciones_parrafo.nextval;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8487735234208802)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8142196415502634)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of GF_D_PRESCRIPCIONES_PARRAFO'
,p_attribute_02=>'GF_D_PRESCRIPCIONES_PARRAFO'
,p_attribute_03=>'P277_ID_PRSCRPCION_PRRFO'
,p_attribute_04=>'ID_PRSCRPCION_PRRFO'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8143547426502648)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8143476275502647)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8143684329502649)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8143185189502644)
);
end;
/
