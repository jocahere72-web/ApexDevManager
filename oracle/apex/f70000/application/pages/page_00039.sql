prompt --application/pages/page_00039
begin
wwv_flow_api.create_page(
 p_id=>39
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Validaciones Formulario'
,p_page_mode=>'MODAL'
,p_step_title=>'Validaciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/funciones.js?version=4'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'/*==========Drag and Drop================*/',
'function allowDrop(ev) {',
'    ev.preventDefault();',
'}',
'',
'function drag(ev) {',
'    ev.dataTransfer.setData("text", ev.target.attributes.dataValor.textContent);',
'}',
'',
'function drop(ev) {',
'    ev.preventDefault();   ',
'}',
'',
'function handleDragStart(e) {',
'    this.style.opacity = ''0.4'';  // this / e.target is the source node.',
'}',
'',
'function handleDragEnd(e) {',
'    this.style.opacity  = ''1''; // this / e.target is the source node.',
'}',
'',
'function fnc_agrgarAtributos(p_id){',
'    let b1 = document.getElementById(p_id);',
'    b1.setAttribute("ondrop", "drop(event)");',
'    b1.setAttribute("ondragover", "allowDrop(event)");',
'};',
'',
'function fnc_quitarAtributos(p_id){',
'    let b1 = document.getElementById(p_id);',
'    b1.removeAttribute("ondrop");',
'    b1.removeAttribute("ondragover");',
'};',
'',
unistr('/*==========Funci\00F3n================*/'),
'function render_function(p39_funcion, p39_vlor){',
'    let v_fncion = $(''#'' + p39_funcion).val();',
'    $(''#'' + p39_vlor).val(v_fncion);',
'}',
'',
'/*=======Funcion que valida calculo=======*/',
'function fnc_vldarClclo(p39_tpo_cndcion, p39_vlor_condcion){',
'    if ($v(p39_tpo_cndcion) == ''C''){',
'        if(!fnc_vldarExprsion($v(p39_vlor_condcion))){',
'            apex.message.clearErrors();',
'            apex.message.showErrors ([',
'                {',
'                    type:       "error",',
'                    location:   "inline",',
'                    pageItem:   p39_vlor_condcion,',
unistr('                    message:    ''Se encontr\00F3 un error en la formula especificada.'','),
'                    unsafe:     false',
'                }',
'            ]);',
'        }else{',
'            apex.message.clearErrors();',
'        };',
'    }else{',
'        apex.message.clearErrors();',
'    }',
'};',
'',
'',
'/*====Funcion de operaciones agrupadas de calculo======*/',
'function fnc_oprcionAgrpda(p39_tpo_vlor, p39_vlor, p39_operacion){',
'    var v_vlor = document.getElementById(p39_vlor);',
'    var v_vlor_incio = v_vlor.value.substring(0, v_vlor.selectionStart);',
'    var v_vlor_fin = v_vlor.value.substring(v_vlor.selectionEnd);',
'	var v_oprcion = document.getElementById(p39_operacion);',
'    v_vlor.value = v_vlor_incio + v_oprcion.value + v_vlor_fin;',
'	v_oprcion.value = "";',
'    fnc_vldarClclo(p39_tpo_vlor, p39_vlor);',
'}',
'',
'/*=============Funcion que valida calculo antes de hacer request===================*/',
'function fnc_request(p_request){',
'	var v_p39_vlor1 = true;',
'	var v_p39_vlor2 = true;',
'	var v_p39_vlor3 = true;',
'	var v_msje = [];',
'',
'	if(document.getElementById("P39_TPO_VLOR1").value == "C"){',
'		v_p39_vlor1 = fnc_vldarExprsion(document.getElementById("P39_VLOR1").value);',
'	};',
'	if(document.getElementById("P39_TPO_VLOR2").value == "C"){',
'		v_p39_vlor2 = fnc_vldarExprsion(document.getElementById("P39_VLOR2").value);',
'	};',
'	if(document.getElementById("P39_TPO_VLOR3").value == "C"){',
'		v_p39_vlor3 = fnc_vldarExprsion(document.getElementById("P39_VLOR3").value);',
'	};',
'',
'	if (v_p39_vlor1 && v_p39_vlor2 && v_p39_vlor3){',
'		apex.submit(p_request);',
'	}else{',
'		if(!v_p39_vlor1){',
'			v_msje.push({',
'				   type:       "error",',
'				   location:   [ "inline" ],',
'				   pageItem:   "P39_VLOR1",',
'				   message:    "Valor requerido",',
'				   unsafe:     false',
'			   });',
'		};',
'		',
'		if(!v_p39_vlor2){',
'			v_msje.push({',
'				   type:       "error",',
'				   location:   [ "inline" ],',
'				   pageItem:   "P39_VLOR2",',
'				   message:    "Valor requerido",',
'				   unsafe:     false',
'			   });',
'		};',
'		',
'		if(!v_p39_vlor3){',
'			v_msje.push({',
'				   type:       "error",',
'				   location:   [ "inline" ],',
'				   pageItem:   "P39_VLOR3",',
'				   message:    "Valor requerido",',
'				   unsafe:     false',
'			   });',
'		};',
'	};',
'	apex.message.clearErrors();',
'	apex.message.showErrors(v_msje);',
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
'let b = document.getElementById("P39_VLOR1");',
'b.setAttribute("oninput", "fnc_vldarClclo(''P39_TPO_VLOR1'', ''P39_VLOR1'')");',
'b = document.getElementById("P39_VLOR2");',
'b.setAttribute("oninput", "fnc_vldarClclo(''P39_TPO_VLOR2'', ''P39_VLOR2'')");',
'b = document.getElementById("P39_VLOR3");',
'b.setAttribute("oninput", "fnc_vldarClclo(''P39_TPO_VLOR3'', ''P39_VLOR3'')");',
'',
'/*==========Drag and Drop================*/',
'let cols = document.getElementsByClassName("column h-card");',
'[].forEach.call(cols, function(col) {',
'    col.addEventListener(''dragstart'', handleDragStart, false);',
'    col.addEventListener(''dragend'', handleDragEnd, false);',
'});',
'',
'document.getElementById("P39_TPO_VLOR1").value == "E" ? fnc_agrgarAtributos(''P39_VLOR1'') : null;',
'document.getElementById("P39_TPO_VLOR2").value == "E" ? fnc_agrgarAtributos(''P39_VLOR2'') : null;',
'document.getElementById("P39_TPO_VLOR3").value == "E" ? fnc_agrgarAtributos(''P39_VLOR3'') : null;'))
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
'#atrbtosList li, #vlresList li {',
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
,p_last_upd_yyyymmddhh24miss=>'20200318112408'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12868573402052428)
,p_plug_name=>'Validaciones Formulario'
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
 p_id=>wwv_flow_api.id(11891848133169142)
,p_plug_name=>'Validaciones Formulario Elementos'
,p_parent_plug_id=>wwv_flow_api.id(12868573402052428)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(12868691496052429)
,p_plug_name=>'Validaciones Formulario Arbol'
,p_region_name=>'P39_VLDCNES'
,p_parent_plug_id=>wwv_flow_api.id(12868573402052428)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
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
'                    where   a.id_frmlrio    =   :P39_ID_FRMLRIO',
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
'        htp.p(''</ul></div>'');',
'    end loop;',
'    htp.p(''</ul></div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12869981330052442)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(12868573402052428)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P39_ID_FRMLRIO_VLDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12869721827052440)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(12868573402052428)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12869835848052441)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(12868573402052428)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition=>'P39_ID_FRMLRIO_VLDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12870049782052443)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(12868573402052428)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P39_ID_FRMLRIO_VLDCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11891928440169143)
,p_name=>'P39_ID_FRMLRIO_VLDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_FRMLRIO_VLDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11892057308169144)
,p_name=>'P39_ID_FRMLRIO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(12868573402052428)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Formulario'
,p_source=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio',
'from    gi_d_formularios    a',
'where   a.id_frmlrio    =   :P39_ID_FRMLRIO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11892152850169145)
,p_name=>'P39_TPO_VLOR1'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Valor 1'
,p_source=>'TPO_VLOR1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_OPERADORES_ORIGEN'
,p_lov=>'.'||wwv_flow_api.id(12746972750444021)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11892244913169146)
,p_name=>'P39_VLOR1'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor 1'
,p_source=>'VLOR1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11892331370169147)
,p_name=>'P39_ID_OPRDOR_TPO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Operador'
,p_source=>'ID_OPRDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_OPERADORES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DSCRPCION D,',
'       ID_OPRDOR_TPO R',
'FROM DF_S_OPERADORES_TIPO ',
'ORDER BY 2'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11892467293169148)
,p_name=>'P39_TPO_VLOR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Valor 2'
,p_source=>'TPO_VLOR2'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_OPERADORES_ORIGEN'
,p_lov=>'.'||wwv_flow_api.id(12746972750444021)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11892515504169149)
,p_name=>'P39_VLOR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor 2'
,p_source=>'VLOR2'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11892637907169150)
,p_name=>'P39_TPO_VLOR3'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Valor 3'
,p_source=>'TPO_VLOR3'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_OPERADORES_ORIGEN'
,p_lov=>'.'||wwv_flow_api.id(12746972750444021)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12734899440387601)
,p_name=>'P39_VLOR3'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor 3'
,p_source=>'VLOR3'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12734975721387602)
,p_name=>'P39_ITEM_MNSJE_VLDCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Item Mensaje Validaci\00F3n')
,p_source=>'ITEM_MNSJE_VLDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12735049223387603)
,p_name=>'P39_MNSJE_VLDCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Mensaje Validaci\00F3n')
,p_source=>'MNSJE_VLDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12735590988387608)
,p_name=>'P39_FUNCION1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_prompt=>unistr('Funci\00F3n 1')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  object_name || '' version '' || overload d,',
'        ''PKG_GI_DECLARACIONES_FUNCIONES.'' ||object_name || ''('' || listagg(argument_name || '' => $'' || position ,'' ,'') within group (order by position) || '')'' b',
'from    user_arguments',
'where   package_name = ''PKG_GI_DECLARACIONES_FUNCIONES''',
'and     argument_name is not null',
'group by object_name,',
'         overload;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12735621008387609)
,p_name=>'P39_OPERACION1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_prompt=>unistr('Operaci\00F3n Agrupada 1')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_OPERACIONES_AGRUPADAS'
,p_lov=>'.'||wwv_flow_api.id(12777803354581544)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12738888194387641)
,p_name=>'P39_OPERACION2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_prompt=>unistr('Operaci\00F3n Agrupada 2')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_OPERACIONES_AGRUPADAS'
,p_lov=>'.'||wwv_flow_api.id(12777803354581544)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12738936898387642)
,p_name=>'P39_OPERACION3'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_prompt=>unistr('Operaci\00F3n Agrupada 3')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_OPERACIONES_AGRUPADAS'
,p_lov=>'.'||wwv_flow_api.id(12777803354581544)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12865974794052402)
,p_name=>'P39_FUNCION2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_prompt=>unistr('Funci\00F3n 2')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  object_name || '' version '' || overload d,',
'        ''PKG_GI_DECLARACIONES_FUNCIONES.'' ||object_name || ''('' || listagg(argument_name || '' => $'' || position ,'' ,'') within group (order by position) || '')'' b',
'from    user_arguments',
'where   package_name = ''PKG_GI_DECLARACIONES_FUNCIONES''',
'and     argument_name is not null',
'group by object_name,',
'         overload;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12866009618052403)
,p_name=>'P39_FUNCION3'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(11891848133169142)
,p_prompt=>unistr('Funci\00F3n 3')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  object_name || '' version '' || overload d,',
'        ''PKG_GI_DECLARACIONES_FUNCIONES.'' ||object_name || ''('' || listagg(argument_name || '' => $'' || position ,'' ,'') within group (order by position) || '')'' b',
'from    user_arguments',
'where   package_name = ''PKG_GI_DECLARACIONES_FUNCIONES''',
'and     argument_name is not null',
'group by object_name,',
'         overload;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13519046383694001)
,p_name=>'P39_ID_FRMLRIO_RGION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(12868573402052428)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Regi\00F3n')
,p_source=>'ID_FRMLRIO_RGION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion',
'from    gi_d_formularios_region a',
'where   a.id_frmlrio_rgion  =   :P39_ID_FRMLRIO_RGION;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(12870701700052450)
,p_validation_name=>'P39_VLOR1_validacion'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    if :P39_TPO_VLOR1 = ''S'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P39_VLOR1;',
'        execute immediate v_sql ;',
'    elsif  :P39_TPO_VLOR1 = ''F'' then  ',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for select '' || :P39_VLOR1 || '' from dual'';',
'        execute immediate v_sql ;',
'    end if;',
'exception when others then',
'    return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P39_TPO_VLOR1'
,p_validation_condition2=>'S:F'
,p_validation_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13106024583073201)
,p_validation_name=>'P39_VLOR2_validacion'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    if :P39_TPO_VLOR2 = ''S'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P39_VLOR2;',
'        execute immediate v_sql ;',
'    elsif  :P39_TPO_VLOR2 = ''F'' then  ',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for select '' || :P39_VLOR2 || '' from dual'';',
'        execute immediate v_sql ;',
'    end if;',
'exception when others then',
'    return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P39_TPO_VLOR2'
,p_validation_condition2=>'S:F'
,p_validation_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13106111775073202)
,p_validation_name=>'P39_VLOR3_validacion'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    if :P39_TPO_VLOR3 = ''S'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P39_VLOR3;',
'        execute immediate v_sql ;',
'    elsif  :P39_TPO_VLOR3 = ''F'' then  ',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for select '' || :P39_VLOR3 || '' from dual'';',
'        execute immediate v_sql ;',
'    end if;',
'exception when others then',
'    return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P39_VLOR3'
,p_validation_condition2=>'S:F'
,p_validation_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12735106357387604)
,p_name=>'P39_TPO_VLOR1 = C'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR1'
,p_condition_element=>'P39_TPO_VLOR1'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12735215088387605)
,p_event_id=>wwv_flow_api.id(12735106357387604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR1,P39_ID_OPRDOR_TPO,P39_OPERACION1'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12735305402387606)
,p_event_id=>wwv_flow_api.id(12735106357387604)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_OPERACION1'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12735492989387607)
,p_event_id=>wwv_flow_api.id(12735106357387604)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR1,P39_ID_OPRDOR_TPO,P39_OPERACION1'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12735786975387610)
,p_name=>'P39_TPO_VLOR1 = E'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR1'
,p_condition_element=>'P39_TPO_VLOR1'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12735816950387611)
,p_event_id=>wwv_flow_api.id(12735786975387610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR1,P39_ID_OPRDOR_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12735948923387612)
,p_event_id=>wwv_flow_api.id(12735786975387610)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR1,P39_ID_OPRDOR_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12736123552387614)
,p_name=>'P39_TPO_VLOR1 = F'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR1'
,p_condition_element=>'P39_TPO_VLOR1'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12736241933387615)
,p_event_id=>wwv_flow_api.id(12736123552387614)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR1,P39_ID_OPRDOR_TPO,P39_FUNCION1'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12736415087387617)
,p_event_id=>wwv_flow_api.id(12736123552387614)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_FUNCION1'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12736310021387616)
,p_event_id=>wwv_flow_api.id(12736123552387614)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR1,P39_ID_OPRDOR_TPO,P39_FUNCION1'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12736524345387618)
,p_name=>'P39_TPO_VLOR1 = S'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR1'
,p_condition_element=>'P39_TPO_VLOR1'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12736681425387619)
,p_event_id=>wwv_flow_api.id(12736524345387618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR1,P39_ID_OPRDOR_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12736725881387620)
,p_event_id=>wwv_flow_api.id(12736524345387618)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR1,P39_ID_OPRDOR_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12736819988387621)
,p_name=>'P39_TPO_VLOR1 = null'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR1'
,p_condition_element=>'P39_TPO_VLOR1'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12736987208387622)
,p_event_id=>wwv_flow_api.id(12736819988387621)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR1,P39_ID_OPRDOR_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12737078406387623)
,p_event_id=>wwv_flow_api.id(12736819988387621)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR1,P39_ID_OPRDOR_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12737143156387624)
,p_name=>'P39_ID_OPRDOR_TPO != null'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_ID_OPRDOR_TPO'
,p_condition_element=>'P39_ID_OPRDOR_TPO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12737257897387625)
,p_event_id=>wwv_flow_api.id(12737143156387624)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12737351164387626)
,p_event_id=>wwv_flow_api.id(12737143156387624)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR2,P39_TPO_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12737476913387627)
,p_event_id=>wwv_flow_api.id(12737143156387624)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR2,P39_TPO_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12737551329387628)
,p_name=>'P39_ID_OPRDOR_TPO = 9'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_ID_OPRDOR_TPO'
,p_condition_element=>'P39_ID_OPRDOR_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'9'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12737606827387629)
,p_event_id=>wwv_flow_api.id(12737551329387628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR2,P39_TPO_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12737770070387630)
,p_event_id=>wwv_flow_api.id(12737551329387628)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR2,P39_TPO_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12737800866387631)
,p_name=>'P39_ID_OPRDOR_TPO = 10'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_ID_OPRDOR_TPO'
,p_condition_element=>'P39_ID_OPRDOR_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'10'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12737951443387632)
,p_event_id=>wwv_flow_api.id(12737800866387631)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR2,P39_TPO_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12738093406387633)
,p_event_id=>wwv_flow_api.id(12737800866387631)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR2,P39_TPO_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12738113787387634)
,p_name=>'P39_ID_OPRDOR_TPO = 11'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_ID_OPRDOR_TPO'
,p_condition_element=>'P39_ID_OPRDOR_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'11'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12738272041387635)
,p_event_id=>wwv_flow_api.id(12738113787387634)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12738427138387637)
,p_event_id=>wwv_flow_api.id(12738113787387634)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12738596592387638)
,p_event_id=>wwv_flow_api.id(12738113787387634)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12738612501387639)
,p_name=>'P39_TPO_VLOR2 = C'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR2'
,p_condition_element=>'P39_TPO_VLOR2'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12739053042387643)
,p_event_id=>wwv_flow_api.id(12738612501387639)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_OPERACION2,P39_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12739389813387646)
,p_event_id=>wwv_flow_api.id(12738612501387639)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_OPERACION2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12739129865387644)
,p_event_id=>wwv_flow_api.id(12738612501387639)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12739250385387645)
,p_event_id=>wwv_flow_api.id(12738612501387639)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_OPERACION2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12739438770387647)
,p_name=>'P39_TPO_VLOR2 = E'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR2'
,p_condition_element=>'P39_TPO_VLOR2'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12739558946387648)
,p_event_id=>wwv_flow_api.id(12739438770387647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12739696814387649)
,p_event_id=>wwv_flow_api.id(12739438770387647)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12739761973387650)
,p_name=>'P39_TPO_VLOR2 = F'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR2'
,p_condition_element=>'P39_TPO_VLOR2'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12866197844052404)
,p_event_id=>wwv_flow_api.id(12739761973387650)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_FUNCION2,P39_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12866366656052406)
,p_event_id=>wwv_flow_api.id(12739761973387650)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_FUNCION2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12866224943052405)
,p_event_id=>wwv_flow_api.id(12739761973387650)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12866433820052407)
,p_event_id=>wwv_flow_api.id(12739761973387650)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_FUNCION2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13106255573073203)
,p_name=>'P39_TPO_VLOR2 = S'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR2'
,p_condition_element=>'P39_TPO_VLOR2'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13106399351073204)
,p_event_id=>wwv_flow_api.id(13106255573073203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13106427293073205)
,p_event_id=>wwv_flow_api.id(13106255573073203)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12866549359052408)
,p_name=>'P39_TPO_VLOR2 = null'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR2'
,p_condition_element=>'P39_TPO_VLOR2'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12866686596052409)
,p_event_id=>wwv_flow_api.id(12866549359052408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12866700853052410)
,p_event_id=>wwv_flow_api.id(12866549359052408)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12866896264052411)
,p_name=>'P39_TPO_VLOR3 = C'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR3'
,p_condition_element=>'P39_TPO_VLOR3'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12866979328052412)
,p_event_id=>wwv_flow_api.id(12866896264052411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_OPERACION3,P39_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12867127313052414)
,p_event_id=>wwv_flow_api.id(12866896264052411)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_OPERACION3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12867092508052413)
,p_event_id=>wwv_flow_api.id(12866896264052411)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12867291960052415)
,p_event_id=>wwv_flow_api.id(12866896264052411)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR3,P39_OPERACION3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12867389281052416)
,p_name=>'P39_TPO_VLOR3 = E'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR3'
,p_condition_element=>'P39_TPO_VLOR3'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12867465124052417)
,p_event_id=>wwv_flow_api.id(12867389281052416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12867563162052418)
,p_event_id=>wwv_flow_api.id(12867389281052416)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12867677264052419)
,p_name=>'P39_TPO_VLOR3 = F'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR3'
,p_condition_element=>'P39_TPO_VLOR3'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12867748524052420)
,p_event_id=>wwv_flow_api.id(12867677264052419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_FUNCION3,P39_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12867972073052422)
,p_event_id=>wwv_flow_api.id(12867677264052419)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_FUNCION3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12867828008052421)
,p_event_id=>wwv_flow_api.id(12867677264052419)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12868143372052424)
,p_event_id=>wwv_flow_api.id(12867677264052419)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_FUNCION3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12868295711052425)
,p_name=>'P39_TPO_VLOR3 = null'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_TPO_VLOR3'
,p_condition_element=>'P39_TPO_VLOR3'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12868314874052426)
,p_event_id=>wwv_flow_api.id(12868295711052425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12868498610052427)
,p_event_id=>wwv_flow_api.id(12868295711052425)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12869101314052434)
,p_name=>'P39_OPERACION1 cambiar'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_OPERACION1'
,p_condition_element=>'P39_OPERACION1'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12869237822052435)
,p_event_id=>wwv_flow_api.id(12869101314052434)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_oprcionAgrpda(''P39_TPO_VLOR1'', ''P39_VLOR1'', ''P39_OPERACION1'')'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12869383913052436)
,p_name=>'P39_OPERACION2 cambiar'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_OPERACION2'
,p_condition_element=>'P39_OPERACION2'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12869446570052437)
,p_event_id=>wwv_flow_api.id(12869383913052436)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_oprcionAgrpda(''P39_TPO_VLOR2'', ''P39_VLOR2'', ''P39_OPERACION2'')'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12869511116052438)
,p_name=>'P39_OPERACION3 cambiar'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_OPERACION3'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12869651423052439)
,p_event_id=>wwv_flow_api.id(12869511116052438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_oprcionAgrpda(''P39_TPO_VLOR3'', ''P39_VLOR3'', ''P39_OPERACION3'')'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12870198785052444)
,p_name=>'Close Dialog'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(12869721827052440)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12870225025052445)
,p_event_id=>wwv_flow_api.id(12870198785052444)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12870376306052446)
,p_name=>unistr('Al hacer clic en el bot\00F3n CREATE')
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(12870049782052443)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12870402339052447)
,p_event_id=>wwv_flow_api.id(12870376306052446)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_request("CREATE");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13106820148073209)
,p_name=>'P39_FUNCION1 seleccionar'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_FUNCION1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13106941986073210)
,p_event_id=>wwv_flow_api.id(13106820148073209)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function(''P39_FUNCION1'', ''P39_VLOR1'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13107045430073211)
,p_name=>'P39_FUNCION2 seleccionar'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_FUNCION2'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13107126687073212)
,p_event_id=>wwv_flow_api.id(13107045430073211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function(''P39_FUNCION2'', ''P39_VLOR2'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13107316429073214)
,p_name=>'P39_FUNCION3 seleccionar'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_FUNCION3'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13107404730073215)
,p_event_id=>wwv_flow_api.id(13107316429073214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function(''P39_FUNCION3'', ''P39_VLOR3'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13221621558709334)
,p_name=>unistr('Validar Regi\00F3n')
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P39_ID_FRMLRIO_RGION'
,p_condition_element=>'P39_ID_FRMLRIO_RGION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13221765363709335)
,p_event_id=>wwv_flow_api.id(13221621558709334)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(11891848133169142)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13221919464709337)
,p_event_id=>wwv_flow_api.id(13221621558709334)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P39_TPO_VLOR1'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13222040446709338)
,p_event_id=>wwv_flow_api.id(13221621558709334)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(11891848133169142)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13222273975709340)
,p_event_id=>wwv_flow_api.id(13221621558709334)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(12868691496052429)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13222378740709341)
,p_event_id=>wwv_flow_api.id(13221621558709334)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(12868691496052429)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13222458568709342)
,p_event_id=>wwv_flow_api.id(13221621558709334)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(12868691496052429)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13220214362709320)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch gi_d_formularios_validacion'
,p_attribute_02=>'GI_D_FORMULARIOS_VALIDACION'
,p_attribute_03=>'P39_ID_FRMLRIO_VLDCION'
,p_attribute_04=>'ID_FRMLRIO_VLDCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P39_ID_FRMLRIO_VLDCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13106644786073207)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Formularios_gstnarVldcnes'
,p_attribute_02=>'GI_D_FORMULARIOS_VALIDACION'
,p_attribute_03=>'P39_ID_FRMLRIO_VLDCION'
,p_attribute_04=>'ID_FRMLRIO_VLDCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13106766420073208)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar cuadro de dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
