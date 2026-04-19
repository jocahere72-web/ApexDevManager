prompt --application/pages/page_00049
begin
wwv_flow_api.create_page(
 p_id=>49
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Lista de Valores'
,p_page_mode=>'MODAL'
,p_step_title=>'Declaraciones Lista de Valores'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/funciones.js?version=3'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*==========Drag and Drop================*/',
'function allowDrop(ev) {',
'    ev.preventDefault();',
'}',
'',
'function drag(ev) {',
'    ev.dataTransfer.setData("text", ":" + ev.target.attributes.dataValor.textContent);',
'}',
'',
'function drop(ev) {',
'    ev.preventDefault();',
'}',
'',
'function handleDragStart(e) {',
'    this.style.opacity = ''0.4'';  // this / e.target is the source node.',
'}',
'',
'function handleDragEnd(e) {',
'    this.style.opacity = ''1'';  // this / e.target is the source node.',
'}',
'',
'function fnc_agrgarAtributos(){',
'    let b = document.getElementById("P32_ORGEN");',
'    b.setAttribute("ondrop", "drop(event)");',
'    b.setAttribute("ondragover", "allowDrop(event)");',
'};',
'',
'function fnc_quitarAtributos(){',
'    let b = document.getElementById("P32_ORGEN");',
'    b.removeAttribute("ondrop");',
'    b.removeAttribute("ondragover");',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var acc = document.getElementsByClassName("accordion");',
'',
'for (let item of acc) {',
'    item.addEventListener("click", function() {',
'        this.classList.toggle("active");',
'        var panel = this.nextElementSibling;',
'        if (panel.style.maxHeight) {',
'            panel.style.maxHeight = null;',
'        } else {',
'            let b = this.parentElement.parentElement.parentElement;',
'            if (b.className == "panel") {',
'                let v_height = this.parentElement.parentElement.parentElement.clientHeight;',
'                this.parentElement.parentElement.parentElement.style.maxHeight = v_height + panel.scrollHeight + "px";',
'            }',
'            panel.style.maxHeight = panel.scrollHeight + "px";',
'        }',
'    });',
'};',
'',
'$(''.column'').hover(function() {',
'    var content = `<div>${$(this).data(''tooltip'')} </div>`;',
'    $(this).tooltipster({',
'        contentAsHTML: true,',
'        interactive: true,',
'        theme: ''tooltipster-shadow'', //''tooltipster-light'',',
'        animation: ''fade'',',
'        delay: [100, 1000]',
'    }).tooltipster(''content'', content).tooltipster(''open'');',
'}, function() {',
'    $(this).tooltipster(''close'');',
'});',
'',
'/*==========Drag and Drop================*/',
'let cols = document.getElementsByClassName("column h-card");',
'[].forEach.call(cols, function(col) {',
'    col.addEventListener(''dragstart'', handleDragStart, false);',
'    col.addEventListener(''dragend'', handleDragEnd, false);',
'});'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-light.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-punk.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-noir.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#rgnesList{',
'    cursor: pointer;',
'}',
'',
'.accordion {',
'    background-color: #eee;',
'    color: #444;',
'    padding: 5px;',
'    width: 100%;',
'    border: 1px solid #eee;',
'    text-align: left;',
'    border-radius: 5px;',
'    outline: none;',
'    font-size: 12px;',
'    transition: 0.3s;',
'    margin-bottom: 4px;',
'}',
'',
'.active, .accordion:hover {',
'    background-color: #ccc;',
'}',
'',
'/*.accordion:after {',
'    content: ''\002B'';',
'    color: #777;',
'    font-weight: bold;',
'    float: right;',
'    margin-right: 4px;',
'}*/',
'',
'/*.active:after {',
'    content: "\2212";',
'}*/',
'',
'.panel {',
'    padding: 0 8px;',
'    background-color: white;',
'    max-height: 0;',
'    overflow: hidden;',
'    transition: max-height 0.6s ease-out;',
'}',
'',
'#atrbtosList, #vlresList {',
'    list-style-type: none;',
'    margin: 0 !important;',
'    padding: 0;',
'}',
'',
'#vlresList li {',
'    background: #c4ced724;',
'    border: 1px solid #c4ced724;',
'    border-radius: 5px;',
'    margin-bottom: 5px;',
'    height: 25px;',
'    line-height: 25px;',
'}',
'',
'#vlresList li:nth-child(2n) {',
'    background: #c4ced7c9;',
'    border: 1px solid #c4ced7c9;',
'}',
'',
'#vlresList li {',
'    cursor: move !important;',
'}',
'',
'#vlresList li:hover {',
'    background: #FFFDE3;',
'    border-left: 5px solid #DCDAC1;',
'    margin-left: -5px; ',
'}',
'',
'.column {',
'    padding: 0 20px;',
'    white-space: nowrap;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}',
'',
'.column.over {',
'  border: 2px dashed #000;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20191218162523'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20026773076366685)
,p_plug_name=>'Origen'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20027197987366689)
,p_plug_name=>'Texto Origen'
,p_parent_plug_id=>wwv_flow_api.id(20026773076366685)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20027302150366690)
,p_plug_name=>'Columnas Origen'
,p_parent_plug_id=>wwv_flow_api.id(20026773076366685)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    htp.p(''<div class="columns"> <ul>'');',
'    --Generales',
'    htp.p(',
'        ''<div class = "accordion">'' || ',
'            ''<div id="rgnesList">GENERALES</div>'' ||',
'        ''</div>''',
'    );',
'                        ',
'    htp.p(',
'        ''<div class="panel">'' ||',
'        ''<ul id="vlresList">''',
'    );',
'                                    ',
'    --ID_DCLRCION_VGNCIA_FRMLRIO',
'    htp.p(',
'        ''<li>'' || ',
'            ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="ID_DCLRCION_VGNCIA_FRMLRIO" dataValor="ID_DCLRCION_VGNCIA_FRMLRIO">ID_DCLRCION_VGNCIA_FRMLRIO</div>'' ||',
'        ''</li>''',
'    );',
'    --F_CDGO_CLNTE',
'    htp.p(',
'        ''<li>'' || ',
'            ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="F_CDGO_CLNTE" dataValor="F_CDGO_CLNTE">F_CDGO_CLNTE</div>'' ||',
'        ''</li>''',
'    );',
'    --IDNTFCCION',
'    htp.p(',
'        ''<li>'' || ',
'            ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="IDNTFCCION" dataValor="IDNTFCCION">IDNTFCCION</div>'' ||',
'        ''</li>''',
'    );',
'    --ID_SJTO_IMPSTO',
'    htp.p(',
'        ''<li>'' || ',
'            ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="ID_SJTO_IMPSTO" dataValor="ID_SJTO_IMPSTO">ID_SJTO_IMPSTO</div>'' ||',
'        ''</li>''||',
'        ''</ul></div>''',
'    );',
'    ',
'    for c_rgnes in (select  a.id_frmlrio_rgion,',
'                            a.dscrpcion',
'                    from    gi_d_formularios_region a',
'                    where   a.id_frmlrio    =   :P49_ID_FRMLRIO',
'                    and     a.actvo         =   ''S''',
'                    order by    a.orden)',
'    loop',
'        --Regiones',
'        htp.p(',
'            ''<div class = "accordion">'' || ',
'                ''<div id="rgnesList">'' || ',
'                    c_rgnes.dscrpcion ||',
'                ''</div>'' ||',
'            ''</div>''||',
'            ''<div class="panel"><ul id="atrbtosList">''',
'       );',
'        ',
'        for c_atrbtos in (select  a.id_frmlrio_rgion_atrbto,',
'                                  a.nmbre_dsplay',
'                          from    gi_d_frmlrios_rgion_atrbto  a',
'                          where   a.id_frmlrio_rgion        =   c_rgnes.id_frmlrio_rgion',
'                          and     a.actvo                   =   ''S''',
'                          and     a.id_frmlrio_rgion_atrbto <>  nvl(:P49_ID_FRMLRIO_RGION_ATRBTO, 0)',
'                          order by    a.orden)',
'        loop',
'            ',
'            --Atributos',
'            htp.p(',
'                ''<li>'' ||',
'                ''<div class = "accordion">'' || ',
'                    ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''" dataValor="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_at'
||'rbtos.id_frmlrio_rgion_atrbto || ''">'' || c_atrbtos.nmbre_dsplay || ''</div>'' ||',
'                ''</div>'' ||',
'                ''<div class="panel"><ul id="vlresList">''',
'            );',
'            for c_vlres in (select  a.id_frmlrios_rgn_atrbt_vlr,',
'                                    a.fla',
'                            from    gi_d_frmlrios_rgn_atrbt_vlr a',
'                            where   a.id_frmlrio_rgion_atrbto   =   c_atrbtos.id_frmlrio_rgion_atrbto',
'                            and     a.id_frmlrios_rgn_atrbt_vlr <>  nvl(:P49_ID_FRMLRIOS_RGN_ATRBT_VLR, 0)',
'                            order by    a.fla)',
'            loop',
'                --Valores',
'                htp.p(',
'                    ''<li>'' || ',
'                        ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''FLA'' || c_vlres.fla || ''" dataValor="RGN'' || c_rgnes.id_fr'
||'mlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''FLA'' || c_vlres.fla || ''">Fila '' || c_vlres.fla || ''</div>'' ||',
'                    ''</li>''',
'                );',
'            end loop;',
'            htp.p(',
'                ''<li>'' || ',
'                    ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''FLAX" dataValor="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || '
||'c_atrbtos.id_frmlrio_rgion_atrbto || ''FLAX">Fila X</div>'' ||',
'                ''</li>''||',
'                ''</ul></div>'' ||',
'                ''</li>''',
'            );',
'        end loop;',
'        ',
'        htp.p(''</ul></div>'');',
'        ',
'    end loop;',
'    ',
'    htp.p(''</ul></div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13977028982157385)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(20026773076366685)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13976670277157384)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(20026773076366685)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13977429650157387)
,p_name=>'P49_ID_FRMLRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20026773076366685)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13977811626157394)
,p_name=>'P49_ID_FRMLRIO_RGION_ATRBTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20026773076366685)
,p_prompt=>'Atributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dsplay,',
'        a.id_frmlrio_rgion_atrbto',
'from    gi_d_frmlrios_rgion_atrbto  a',
'where   a.id_frmlrio_rgion_atrbto   =   :P49_ID_FRMLRIO_RGION_ATRBTO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P49_ID_FRMLRIO_RGION_ATRBTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13978203612157395)
,p_name=>'P49_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20026773076366685)
,p_prompt=>'Valor'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.nmbre_dsplay,',
'            a.id_frmlrios_rgn_atrbt_vlr',
'from        gi_d_frmlrios_rgn_atrbt_vlr a',
'inner join  gi_d_frmlrios_rgion_atrbto  b   on  b.id_frmlrio_rgion_atrbto   =   a.id_frmlrio_rgion_atrbto',
'where       a.id_frmlrios_rgn_atrbt_vlr =   :P49_ID_FRMLRIOS_RGN_ATRBT_VLR;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P49_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13980199689157398)
,p_name=>'P49_LSTA_VLRES_SQL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20027197987366689)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Lista de Valores SQL'
,p_source=>'LSTA_VLRES_SQL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>50
,p_cMaxlength=>32767
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13980924018157408)
,p_validation_name=>'validar_SQLfuncion'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P49_LSTA_VLRES_SQL;',
'    execute immediate v_sql ;',
'exception when others then',
'    return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;',
'',
'-->Validamos que la consulta no exceda el numero de columnas permitido ''(2)''',
'',
'declare',
'    v_c_columnas                number;',
'    v_dscrpcion_tbla            dbms_sql.desc_tab2;',
'    v_nmro_clmna                integer;',
'    v_c_columnas_encontradas    number := 0;',
'begin',
'    v_c_columnas := dbms_sql.open_cursor;',
'    dbms_sql.parse( v_c_columnas, :P49_LSTA_VLRES_SQL , dbms_sql.native );',
'    dbms_sql.describe_columns2( v_c_columnas, v_nmro_clmna, v_dscrpcion_tbla );',
'    if(v_nmro_clmna > 2)then',
'        return ''La consulta excede el numero de columnas permitidas, por favor verifique.'';',
'    end if;',
'    ',
'    for c_columnas in 1 .. 2 loop',
'        if(v_dscrpcion_tbla( c_columnas ).col_name in (''VALUE'',''TEXT''))then',
'            v_c_columnas_encontradas := v_c_columnas_encontradas + 1;',
'        end if;',
'    end loop;',
'    ',
'    if(v_c_columnas_encontradas != 2)then',
'        return ''La consulta debe tener definido los alias ("VALUE" Y "TEXT"), por favor verifique'';',
'    end if;',
'    ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13987843653157415)
,p_name=>'Al seleccionar C'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_TPO_ORGN'
,p_condition_element=>'P49_TPO_ORGN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13989322193157416)
,p_event_id=>wwv_flow_api.id(13987843653157415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13990312210157416)
,p_event_id=>wwv_flow_api.id(13987843653157415)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_agrgarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13988852866157415)
,p_event_id=>wwv_flow_api.id(13987843653157415)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_OPERACION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13990841018157416)
,p_event_id=>wwv_flow_api.id(13987843653157415)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13988320196157415)
,p_event_id=>wwv_flow_api.id(13987843653157415)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_OPERACION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13989881069157416)
,p_event_id=>wwv_flow_api.id(13987843653157415)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_quitarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13991284401157416)
,p_name=>'Al seleccionar E'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_TPO_ORGN'
,p_condition_element=>'P49_TPO_ORGN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13991773080157417)
,p_event_id=>wwv_flow_api.id(13991284401157416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13992740097157417)
,p_event_id=>wwv_flow_api.id(13991284401157416)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13992216730157417)
,p_event_id=>wwv_flow_api.id(13991284401157416)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_agrgarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13993159829157422)
,p_name=>'Cancelar Pagina'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(13976670277157384)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13993659273157429)
,p_event_id=>wwv_flow_api.id(13993159829157422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13994010516157429)
,p_name=>'Al seleccionar F'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_TPO_ORGN'
,p_condition_element=>'P49_TPO_ORGN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13994562941157430)
,p_event_id=>wwv_flow_api.id(13994010516157429)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_FUNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13995554813157430)
,p_event_id=>wwv_flow_api.id(13994010516157429)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13996541502157433)
,p_event_id=>wwv_flow_api.id(13994010516157429)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_ORGEN,P49_FUNCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13995019382157430)
,p_event_id=>wwv_flow_api.id(13994010516157429)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_FUNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13996027195157433)
,p_event_id=>wwv_flow_api.id(13994010516157429)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_quitarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13982836758157409)
,p_name=>'P49_FUNCION Seleccionar'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_FUNCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13983343989157410)
,p_event_id=>wwv_flow_api.id(13982836758157409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13983781323157413)
,p_name=>'Al seleccionar S'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_TPO_ORGN'
,p_condition_element=>'P49_TPO_ORGN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13984205463157413)
,p_event_id=>wwv_flow_api.id(13983781323157413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13985210605157414)
,p_event_id=>wwv_flow_api.id(13983781323157413)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13984762933157414)
,p_event_id=>wwv_flow_api.id(13983781323157413)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_quitarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13985514014157414)
,p_name=>'Al no seleccionar'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_TPO_ORGN'
,p_condition_element=>'P49_TPO_ORGN'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13986566577157414)
,p_event_id=>wwv_flow_api.id(13985514014157414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13986059084157414)
,p_event_id=>wwv_flow_api.id(13985514014157414)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P49_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13996973093157433)
,p_name=>'Al hacer clic en SAVE'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(13977028982157385)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13997453351157434)
,p_event_id=>wwv_flow_api.id(13996973093157433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let v_tpo_orgn = true;',
'if ($v(''P49_TPO_ORGN'') == ''C''){',
'    v_tpo_orgn = fnc_vldarExprsion($v(''P49_ORGEN''));',
'    if(!v_tpo_orgn){',
'        apex.message.clearErrors();',
'        apex.message.showErrors ([',
'            {',
'                type:       "error",',
'                location:   "page",',
unistr('                message:    ''Se encontr\00F3 un error en la formula especificada.'','),
'                unsafe:     false',
'            }',
'        ]);',
'    }',
'}',
'if(v_tpo_orgn){',
'    apex.submit( ''SAVE'' );',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13986944162157414)
,p_name=>'P49_OPERACION seleccionar'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_OPERACION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13987416039157415)
,p_event_id=>wwv_flow_api.id(13986944162157414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let v_areaText1 = document.getElementById("P49_ORGEN");',
'let v_start1 = v_areaText1.value.substring(0, v_areaText1.selectionStart);',
'var v_end1 = v_areaText1.value.substring(v_areaText1.selectionEnd);',
'v_areaText1.value = v_start1 + document.getElementById("P49_OPERACION").value + v_end1;',
'fnc_vldarClclo();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13981281633157408)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'atributo_crgarOrgen'
,p_attribute_02=>'GI_D_FRMLRIOS_RGION_ATRBTO'
,p_attribute_03=>'P49_ID_FRMLRIO_RGION_ATRBTO'
,p_attribute_04=>'ID_FRMLRIO_RGION_ATRBTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P49_ID_FRMLRIO_RGION_ATRBTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13982094387157409)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'valor_crgarOrgen'
,p_attribute_02=>'GI_D_FRMLRIOS_RGN_ATRBT_VLR'
,p_attribute_03=>'P49_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_attribute_04=>'ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P49_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13981619118157409)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'atributo_actlzarOrgen'
,p_attribute_02=>'GI_D_FRMLRIOS_RGION_ATRBTO'
,p_attribute_03=>'P49_ID_FRMLRIO_RGION_ATRBTO'
,p_attribute_04=>'ID_FRMLRIO_RGION_ATRBTO'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(13977028982157385)
,p_process_when=>'P49_ID_FRMLRIO_RGION_ATRBTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('Origen actualizado con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13982428505157409)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'valor_actlzarOrgen'
,p_attribute_02=>'GI_D_FRMLRIOS_RGN_ATRBT_VLR'
,p_attribute_03=>'P49_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_attribute_04=>'ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P49_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('Origen actualizado con \00E9xito.')
);
end;
/
