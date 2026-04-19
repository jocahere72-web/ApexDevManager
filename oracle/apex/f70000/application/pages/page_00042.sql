prompt --application/pages/page_00042
begin
wwv_flow_api.create_page(
 p_id=>42
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Condiciones'
,p_page_mode=>'MODAL'
,p_step_title=>'Condiciones'
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
'function render_function(P42_funcion, P42_vlor){',
'    let v_fncion = $(''#'' + P42_funcion).val();',
'    $(''#'' + P42_vlor).val(v_fncion);',
'}',
'',
'/*=======Funcion que valida calculo=======*/',
'function fnc_vldarClclo(P42_tpo_cndcion, P42_vlor_condcion){',
'    if ($v(P42_tpo_cndcion) == ''C''){',
'        if(!fnc_vldarExprsion($v(P42_vlor_condcion))){',
'            apex.message.clearErrors();',
'            apex.message.showErrors ([',
'                {',
'                    type:       "error",',
'                    location:   "inline",',
'                    pageItem:   P42_vlor_condcion,',
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
'function fnc_oprcionAgrpda(P42_tpo_vlor, P42_vlor, P42_operacion){',
'    var v_vlor = document.getElementById(P42_vlor);',
'    var v_vlor_incio = v_vlor.value.substring(0, v_vlor.selectionStart);',
'    var v_vlor_fin = v_vlor.value.substring(v_vlor.selectionEnd);',
'	var v_oprcion = document.getElementById(P42_operacion);',
'    v_vlor.value = v_vlor_incio + v_oprcion.value + v_vlor_fin;',
'	v_oprcion.value = "";',
'    fnc_vldarClclo(P42_tpo_vlor, P42_vlor);',
'}',
'',
'/*=============Funcion que valida calculo antes de hacer request===================*/',
'function fnc_request(p_request){',
'	var v_P42_vlor1 = true;',
'	var v_P42_vlor2 = true;',
'	var v_P42_vlor3 = true;',
'	var v_msje = [];',
'',
'	if(document.getElementById("P42_TPO_VLOR1").value == "C"){',
'		v_P42_vlor1 = fnc_vldarExprsion(document.getElementById("P42_VLOR1").value);',
'	};',
'	if(document.getElementById("P42_TPO_VLOR2").value == "C"){',
'		v_P42_vlor2 = fnc_vldarExprsion(document.getElementById("P42_VLOR2").value);',
'	};',
'	if(document.getElementById("P42_TPO_VLOR3").value == "C"){',
'		v_P42_vlor3 = fnc_vldarExprsion(document.getElementById("P42_VLOR3").value);',
'	};',
'',
'	if (v_P42_vlor1 && v_P42_vlor2 && v_P42_vlor3){',
'		apex.submit(p_request);',
'	}else{',
'		if(!v_P42_vlor1){',
'			v_msje.push({',
'				   type:       "error",',
'				   location:   [ "inline" ],',
'				   pageItem:   "P42_VLOR1",',
'				   message:    "Valor requerido",',
'				   unsafe:     false',
'			   });',
'		};',
'		',
'		if(!v_P42_vlor2){',
'			v_msje.push({',
'				   type:       "error",',
'				   location:   [ "inline" ],',
'				   pageItem:   "P42_VLOR2",',
'				   message:    "Valor requerido",',
'				   unsafe:     false',
'			   });',
'		};',
'		',
'		if(!v_P42_vlor3){',
'			v_msje.push({',
'				   type:       "error",',
'				   location:   [ "inline" ],',
'				   pageItem:   "P42_VLOR3",',
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
'let b = document.getElementById("P42_VLOR1");',
'b.setAttribute("oninput", "fnc_vldarClclo(''P42_TPO_VLOR1'', ''P42_VLOR1'')");',
'b = document.getElementById("P42_VLOR2");',
'b.setAttribute("oninput", "fnc_vldarClclo(''P42_TPO_VLOR2'', ''P42_VLOR2'')");',
'b = document.getElementById("P42_VLOR3");',
'b.setAttribute("oninput", "fnc_vldarClclo(''P42_TPO_VLOR3'', ''P42_VLOR3'')");',
'',
'/*==========Drag and Drop================*/',
'let cols = document.getElementsByClassName("column h-card");',
'[].forEach.call(cols, function(col) {',
'    col.addEventListener(''dragstart'', handleDragStart, false);',
'    col.addEventListener(''dragend'', handleDragEnd, false);',
'});',
'',
'document.getElementById("P42_TPO_VLOR1").value == "E" ? fnc_agrgarAtributos(''P42_VLOR1'') : null;',
'document.getElementById("P42_TPO_VLOR2").value == "E" ? fnc_agrgarAtributos(''P42_VLOR2'') : null;',
'document.getElementById("P42_TPO_VLOR3").value == "E" ? fnc_agrgarAtributos(''P42_VLOR3'') : null;'))
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
 p_id=>wwv_flow_api.id(26524770325657744)
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
 p_id=>wwv_flow_api.id(25548045056774458)
,p_plug_name=>'Validaciones Formulario Elementos'
,p_parent_plug_id=>wwv_flow_api.id(26524770325657744)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26524888419657745)
,p_plug_name=>'Validaciones Formulario Arbol'
,p_region_name=>'P42_VLDCNES'
,p_parent_plug_id=>wwv_flow_api.id(26524770325657744)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
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
'                    where   a.id_frmlrio    =   :P42_ID_FRMLRIO',
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
'                --Valores                                                            ',
'                htp.p(',
'                    ''<li>'' || ',
'                        ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="Fila '' || c_vlres.fla || ''" dataValor="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''FLA'' || c_vlres.fla'
||' || ''">Fila '' || c_vlres.fla || ''</div>'' ||',
'                    ''</li>''',
'                );                    ',
'            end loop;',
'            --Valor X    ',
'            htp.p(',
'                ''<li>'' || ',
'                    ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="Fila X" dataValor="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''FLAX">Fila X</div>'' ||',
'                ''</li>''||',
'                ''</ul></div>'' ||',
'                ''</li>''',
'            );',
'        end loop;        ',
'        htp.p(''</ul></div>'');',
'        ',
'    end loop;',
'    htp.p(''</ul></div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13657431169605344)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(26524770325657744)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P42_ID_FRMLRIO_CNDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13656682836605342)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(26524770325657744)
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
 p_id=>wwv_flow_api.id(13657083374605344)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(26524770325657744)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition=>'P42_ID_FRMLRIO_CNDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13657829629605345)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26524770325657744)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P42_ID_FRMLRIO_CNDCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13658226063605346)
,p_name=>'P42_ID_FRMLRIO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26524770325657744)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Formulario'
,p_source=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio',
'from    gi_d_formularios    a',
'where   a.id_frmlrio    =   :P42_ID_FRMLRIO;'))
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
 p_id=>wwv_flow_api.id(13658680419605363)
,p_name=>'P42_ID_FRMLRIO_RGION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26524770325657744)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Regi\00F3n')
,p_source=>'ID_FRMLRIO_RGION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion',
'from    gi_d_formularios_region a',
'where   a.id_frmlrio_rgion  =   :P42_ID_FRMLRIO_RGION;'))
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13659383113605365)
,p_name=>'P42_ID_FRMLRIO_CNDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_FRMLRIO_CNDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13659730733605365)
,p_name=>'P42_TPO_VLOR1'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13660127211605366)
,p_name=>'P42_OPERACION1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13660564022605366)
,p_name=>'P42_FUNCION1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13660984059605366)
,p_name=>'P42_VLOR1'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13661372115605366)
,p_name=>'P42_ID_OPRDOR_TPO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13661773858605366)
,p_name=>'P42_TPO_VLOR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13662108369605367)
,p_name=>'P42_OPERACION2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13662526235605367)
,p_name=>'P42_FUNCION2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13662916857605367)
,p_name=>'P42_VLOR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13663353670605367)
,p_name=>'P42_TPO_VLOR3'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13663712307605367)
,p_name=>'P42_OPERACION3'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13664152659605368)
,p_name=>'P42_FUNCION3'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(13664577238605368)
,p_name=>'P42_VLOR3'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
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
 p_id=>wwv_flow_api.id(62750304026588002)
,p_name=>'P42_OBSRVCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25548045056774458)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSRVCION'
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
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13666196300605372)
,p_validation_name=>'P42_VLOR1_validacion'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    if :P42_TPO_VLOR1 = ''S'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P42_VLOR1;',
'        execute immediate v_sql ;',
'    elsif  :P42_TPO_VLOR1 = ''F'' then  ',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for select '' || :P42_VLOR1 || '' from dual'';',
'        execute immediate v_sql ;',
'    end if;',
'exception when others then',
'    return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P42_TPO_VLOR1'
,p_validation_condition2=>'S:F'
,p_validation_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13666535914605375)
,p_validation_name=>'P42_VLOR2_validacion'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    if :P42_TPO_VLOR2 = ''S'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P42_VLOR2;',
'        execute immediate v_sql ;',
'    elsif  :P42_TPO_VLOR2 = ''F'' then  ',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for select '' || :P42_VLOR2 || '' from dual'';',
'        execute immediate v_sql ;',
'    end if;',
'exception when others then',
'    return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P42_TPO_VLOR2'
,p_validation_condition2=>'S:F'
,p_validation_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13666952148605376)
,p_validation_name=>'P42_VLOR3_validacion'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    if :P42_TPO_VLOR3 = ''S'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P42_VLOR3;',
'        execute immediate v_sql ;',
'    elsif  :P42_TPO_VLOR3 = ''F'' then  ',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for select '' || :P42_VLOR3 || '' from dual'';',
'        execute immediate v_sql ;',
'    end if;',
'exception when others then',
'    return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P42_VLOR3'
,p_validation_condition2=>'S:F'
,p_validation_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13669839562605379)
,p_name=>'P42_TPO_VLOR1 = C'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR1'
,p_condition_element=>'P42_TPO_VLOR1'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13670362267605380)
,p_event_id=>wwv_flow_api.id(13669839562605379)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_OPERACION1'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13670868183605380)
,p_event_id=>wwv_flow_api.id(13669839562605379)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR1,P42_ID_OPRDOR_TPO,P42_OPERACION1'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13671314226605380)
,p_event_id=>wwv_flow_api.id(13669839562605379)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR1,P42_ID_OPRDOR_TPO,P42_OPERACION1'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13668458541605378)
,p_name=>'P42_TPO_VLOR1 = E'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR1'
,p_condition_element=>'P42_TPO_VLOR1'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13668933888605379)
,p_event_id=>wwv_flow_api.id(13668458541605378)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR1,P42_ID_OPRDOR_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13669490636605379)
,p_event_id=>wwv_flow_api.id(13668458541605378)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR1,P42_ID_OPRDOR_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13671739953605380)
,p_name=>'P42_TPO_VLOR1 = F'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR1'
,p_condition_element=>'P42_TPO_VLOR1'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13672745524605381)
,p_event_id=>wwv_flow_api.id(13671739953605380)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR1,P42_ID_OPRDOR_TPO,P42_FUNCION1'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13673297556605381)
,p_event_id=>wwv_flow_api.id(13671739953605380)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FUNCION1'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13672293450605380)
,p_event_id=>wwv_flow_api.id(13671739953605380)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR1,P42_ID_OPRDOR_TPO,P42_FUNCION1'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13673623221605381)
,p_name=>'P42_TPO_VLOR1 = S'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR1'
,p_condition_element=>'P42_TPO_VLOR1'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13674181850605384)
,p_event_id=>wwv_flow_api.id(13673623221605381)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR1,P42_ID_OPRDOR_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13674664057605384)
,p_event_id=>wwv_flow_api.id(13673623221605381)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR1,P42_ID_OPRDOR_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13675072031605384)
,p_name=>'P42_TPO_VLOR1 = null'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR1'
,p_condition_element=>'P42_TPO_VLOR1'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13675570727605384)
,p_event_id=>wwv_flow_api.id(13675072031605384)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR1,P42_ID_OPRDOR_TPO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13676060058605387)
,p_event_id=>wwv_flow_api.id(13675072031605384)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR1,P42_ID_OPRDOR_TPO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13699079152605416)
,p_name=>'P42_ID_OPRDOR_TPO != null'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_ID_OPRDOR_TPO'
,p_condition_element=>'P42_ID_OPRDOR_TPO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13699559660605416)
,p_event_id=>wwv_flow_api.id(13699079152605416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13700576056605417)
,p_event_id=>wwv_flow_api.id(13699079152605416)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR2,P42_TPO_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13700081604605417)
,p_event_id=>wwv_flow_api.id(13699079152605416)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR2,P42_TPO_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13676402216605387)
,p_name=>'P42_ID_OPRDOR_TPO = 9'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_ID_OPRDOR_TPO'
,p_condition_element=>'P42_ID_OPRDOR_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'9'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13676972930605388)
,p_event_id=>wwv_flow_api.id(13676402216605387)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR2,P42_TPO_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13677453639605388)
,p_event_id=>wwv_flow_api.id(13676402216605387)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR2,P42_TPO_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13677853897605388)
,p_name=>'P42_ID_OPRDOR_TPO = 10'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_ID_OPRDOR_TPO'
,p_condition_element=>'P42_ID_OPRDOR_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'10'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13678371006605388)
,p_event_id=>wwv_flow_api.id(13677853897605388)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR2,P42_TPO_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13678861464605389)
,p_event_id=>wwv_flow_api.id(13677853897605388)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR2,P42_TPO_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13679286845605393)
,p_name=>'P42_ID_OPRDOR_TPO = 11'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_ID_OPRDOR_TPO'
,p_condition_element=>'P42_ID_OPRDOR_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'11'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13679765710605393)
,p_event_id=>wwv_flow_api.id(13679286845605393)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13680230330605394)
,p_event_id=>wwv_flow_api.id(13679286845605393)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13680795988605395)
,p_event_id=>wwv_flow_api.id(13679286845605393)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13682583153605396)
,p_name=>'P42_TPO_VLOR2 = C'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR2'
,p_condition_element=>'P42_TPO_VLOR2'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13683526153605396)
,p_event_id=>wwv_flow_api.id(13682583153605396)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_OPERACION2,P42_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13684559580605397)
,p_event_id=>wwv_flow_api.id(13682583153605396)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_OPERACION2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13683065039605396)
,p_event_id=>wwv_flow_api.id(13682583153605396)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13684093325605397)
,p_event_id=>wwv_flow_api.id(13682583153605396)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_OPERACION2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13681190881605395)
,p_name=>'P42_TPO_VLOR2 = E'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR2'
,p_condition_element=>'P42_TPO_VLOR2'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13682163447605396)
,p_event_id=>wwv_flow_api.id(13681190881605395)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13681648657605396)
,p_event_id=>wwv_flow_api.id(13681190881605395)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13684962615605397)
,p_name=>'P42_TPO_VLOR2 = F'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR2'
,p_condition_element=>'P42_TPO_VLOR2'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13685474743605397)
,p_event_id=>wwv_flow_api.id(13684962615605397)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FUNCION2,P42_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13686428925605398)
,p_event_id=>wwv_flow_api.id(13684962615605397)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FUNCION2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13685942403605397)
,p_event_id=>wwv_flow_api.id(13684962615605397)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13686901987605398)
,p_event_id=>wwv_flow_api.id(13684962615605397)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FUNCION2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13708734439605428)
,p_name=>'P42_TPO_VLOR2 = S'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR2'
,p_condition_element=>'P42_TPO_VLOR2'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13709267228605428)
,p_event_id=>wwv_flow_api.id(13708734439605428)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13709793162605428)
,p_event_id=>wwv_flow_api.id(13708734439605428)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13687314555605398)
,p_name=>'P42_TPO_VLOR2 = null'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR2'
,p_condition_element=>'P42_TPO_VLOR2'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13687899538605398)
,p_event_id=>wwv_flow_api.id(13687314555605398)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13688375939605398)
,p_event_id=>wwv_flow_api.id(13687314555605398)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13688731495605398)
,p_name=>'P42_TPO_VLOR3 = C'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR3'
,p_condition_element=>'P42_TPO_VLOR3'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13689791767605399)
,p_event_id=>wwv_flow_api.id(13688731495605398)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_OPERACION3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13690721482605400)
,p_event_id=>wwv_flow_api.id(13688731495605398)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_OPERACION3,P42_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13689256978605399)
,p_event_id=>wwv_flow_api.id(13688731495605398)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13690218222605399)
,p_event_id=>wwv_flow_api.id(13688731495605398)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR3,P42_OPERACION3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13691176830605401)
,p_name=>'P42_TPO_VLOR3 = E'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR3'
,p_condition_element=>'P42_TPO_VLOR3'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13691628047605402)
,p_event_id=>wwv_flow_api.id(13691176830605401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13692166280605403)
,p_event_id=>wwv_flow_api.id(13691176830605401)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13692575758605403)
,p_name=>'P42_TPO_VLOR3 = F'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR3'
,p_condition_element=>'P42_TPO_VLOR3'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13693053276605403)
,p_event_id=>wwv_flow_api.id(13692575758605403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FUNCION3,P42_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13694074866605403)
,p_event_id=>wwv_flow_api.id(13692575758605403)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FUNCION3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13693566579605403)
,p_event_id=>wwv_flow_api.id(13692575758605403)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13694550715605407)
,p_event_id=>wwv_flow_api.id(13692575758605403)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_FUNCION3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13694986908605407)
,p_name=>'P42_TPO_VLOR3 = null'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_TPO_VLOR3'
,p_condition_element=>'P42_TPO_VLOR3'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13695474984605408)
,p_event_id=>wwv_flow_api.id(13694986908605407)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR3'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13695972590605408)
,p_event_id=>wwv_flow_api.id(13694986908605407)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_VLOR3'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13704371967605422)
,p_name=>'P42_OPERACION1 cambiar'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_OPERACION1'
,p_condition_element=>'P42_OPERACION1'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13704869449605422)
,p_event_id=>wwv_flow_api.id(13704371967605422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_oprcionAgrpda(''P42_TPO_VLOR1'', ''P42_VLOR1'', ''P42_OPERACION1'')'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13705268440605422)
,p_name=>'P42_OPERACION2 cambiar'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_OPERACION2'
,p_condition_element=>'P42_OPERACION2'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13705744171605423)
,p_event_id=>wwv_flow_api.id(13705268440605422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_oprcionAgrpda(''P42_TPO_VLOR2'', ''P42_VLOR2'', ''P42_OPERACION2'')'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13706117022605423)
,p_name=>'P42_OPERACION3 cambiar'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_OPERACION3'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13706643330605423)
,p_event_id=>wwv_flow_api.id(13706117022605423)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_oprcionAgrpda(''P42_TPO_VLOR3'', ''P42_VLOR3'', ''P42_OPERACION3'')'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13707067784605423)
,p_name=>'Close Dialog'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(13656682836605342)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13707506904605427)
,p_event_id=>wwv_flow_api.id(13707067784605423)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13707835224605427)
,p_name=>unistr('Al hacer clic en el bot\00F3n CREATE')
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(13657829629605345)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13708317449605428)
,p_event_id=>wwv_flow_api.id(13707835224605427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_request("CREATE");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13696334408605408)
,p_name=>'P42_FUNCION1 seleccionar'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_FUNCION1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13696806986605408)
,p_event_id=>wwv_flow_api.id(13696334408605408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function(''P42_FUNCION1'', ''P42_VLOR1'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13697226325605408)
,p_name=>'P42_FUNCION2 seleccionar'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_FUNCION2'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13697774158605409)
,p_event_id=>wwv_flow_api.id(13697226325605408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function(''P42_FUNCION2'', ''P42_VLOR2'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13698131982605409)
,p_name=>'P42_FUNCION3 seleccionar'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_FUNCION3'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13698653324605416)
,p_event_id=>wwv_flow_api.id(13698131982605409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function(''P42_FUNCION3'', ''P42_VLOR3'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13700909000605417)
,p_name=>unistr('Validar Regi\00F3n')
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_ID_FRMLRIO_RGION'
,p_condition_element=>'P42_ID_FRMLRIO_RGION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13701921781605421)
,p_event_id=>wwv_flow_api.id(13700909000605417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(25548045056774458)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13702474867605421)
,p_event_id=>wwv_flow_api.id(13700909000605417)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_TPO_VLOR1'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13701413282605417)
,p_event_id=>wwv_flow_api.id(13700909000605417)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(25548045056774458)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13702907582605421)
,p_event_id=>wwv_flow_api.id(13700909000605417)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26524888419657745)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13703418982605422)
,p_event_id=>wwv_flow_api.id(13700909000605417)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26524888419657745)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13703961884605422)
,p_event_id=>wwv_flow_api.id(13700909000605417)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26524888419657745)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13668068318605378)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch gi_d_formularios_condicion'
,p_attribute_02=>'GI_D_FORMULARIOS_CONDICION'
,p_attribute_03=>'P42_ID_FRMLRIO_CNDCION'
,p_attribute_04=>'ID_FRMLRIO_CNDCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P42_ID_FRMLRIO_CNDCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13667210790605376)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Formularios_gstnarVldcnes'
,p_attribute_02=>'GI_D_FORMULARIOS_CONDICION'
,p_attribute_03=>'P42_ID_FRMLRIO_CNDCION'
,p_attribute_04=>'ID_FRMLRIO_CNDCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13667631621605378)
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
