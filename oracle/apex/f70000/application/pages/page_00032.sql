prompt --application/pages/page_00032
begin
wwv_flow_api.create_page(
 p_id=>32
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Propiedades Origen'
,p_page_mode=>'MODAL'
,p_step_title=>'Declaraciones Propiedades Origen'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/funciones.js?version=5'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*==========Drag and Drop================*/',
'function allowDrop(ev) {',
'    ev.preventDefault();',
'}',
'',
'function drag(ev) {',
'    console.log(12);',
'    ev.dataTransfer.setData("text", ([''F'',''S''].includes(document.getElementById(''P32_TPO_ORGN'').value) ? '':'' : '''') + ev.target.attributes.dataValor.textContent);',
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
'};',
'',
unistr('/*==========Funci\00F3n================*/'),
'function render_function(){',
'    let v_fncion = $(''#P32_FUNCION'').val();',
'    $(''#P32_ORGEN'').val(v_fncion);',
'}',
'',
'',
'/*=======Funcion que valida calculo=======*/',
'function fnc_vldarClclo(){',
'    if ($v(''P32_TPO_ORGN'') == ''C''){',
'        if(!fnc_vldarExprsion($v(''P32_ORGEN''))){',
'            apex.message.clearErrors();',
'            apex.message.showErrors ([',
'                {',
'                    type:       "error",',
'                    location:   "inline",',
'                    pageItem:   "P32_ORGEN",',
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
'let b = document.getElementById("P32_ORGEN");',
'b.setAttribute("oninput", "fnc_vldarClclo()");',
'',
'/*==========Drag and Drop================*/',
'let cols = document.getElementsByClassName("column h-card");',
'[].forEach.call(cols, function(col) {',
'    col.addEventListener(''dragstart'', handleDragStart, false);',
'    col.addEventListener(''dragend'', handleDragEnd, false);',
'});',
'',
'document.getElementById("P32_TPO_ORGN").value == "E" ? fnc_agrgarAtributos() : null;'))
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
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210327123357'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6050704967209311)
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
 p_id=>wwv_flow_api.id(6051129878209315)
,p_plug_name=>'Texto Origen'
,p_parent_plug_id=>wwv_flow_api.id(6050704967209311)
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
 p_id=>wwv_flow_api.id(6051234041209316)
,p_plug_name=>'Columnas Origen'
,p_parent_plug_id=>wwv_flow_api.id(6050704967209311)
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
'                                        ',
'    for c_rgnes in (select  a.id_frmlrio_rgion,',
'                            a.dscrpcion',
'                    from    gi_d_formularios_region a',
'                    where   a.id_frmlrio    =   :P32_ID_FRMLRIO',
'                    and     a.actvo         =   ''S''',
'                    order by    a.orden)',
'    loop',
'        htp.p(',
'            ''<div class = "accordion">'' || ',
'                ''<div id="rgnesList">'' || ',
'                    c_rgnes.dscrpcion ||''(''||c_rgnes.id_frmlrio_rgion||'')''||',
'                ''</div>'' ||',
'            ''</div>''||',
'            ''<div class="panel"><ul id="atrbtosList">''',
'       );',
'       for c_atrbtos in (select  a.id_frmlrio_rgion_atrbto,',
'                                  a.nmbre_dsplay',
'                          from    gi_d_frmlrios_rgion_atrbto  a',
'                          where   a.id_frmlrio_rgion        =   c_rgnes.id_frmlrio_rgion',
'                          and     a.actvo                   =   ''S''',
'                          and     a.id_frmlrio_rgion_atrbto <>  nvl(:P32_ID_FRMLRIO_RGION_ATRBTO, 0)',
'                          order by    a.orden)',
'        loop',
'            htp.p(',
'                ''<li>'' ||',
'                ''<div class = "accordion">'' || ',
'                    ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''" dataValor="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_at'
||'rbtos.id_frmlrio_rgion_atrbto || ''">'' || c_atrbtos.nmbre_dsplay||''(''||c_atrbtos.id_frmlrio_rgion_atrbto||'')'' || ''</div>'' ||',
'                ''</div>'' ||',
'                ''<div class="panel"><ul id="vlresList">''',
'            );',
'            for c_vlres in (select  a.id_frmlrios_rgn_atrbt_vlr,',
'                                    a.fla',
'                            from    gi_d_frmlrios_rgn_atrbt_vlr a',
'                            where   a.id_frmlrio_rgion_atrbto   =   c_atrbtos.id_frmlrio_rgion_atrbto',
'                            and     a.id_frmlrios_rgn_atrbt_vlr <>  nvl(:P32_ID_FRMLRIOS_RGN_ATRBT_VLR, 0)',
'                            order by    a.fla)',
'            loop',
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
 p_id=>wwv_flow_api.id(6053750993209341)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6050704967209311)
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
 p_id=>wwv_flow_api.id(6053989722209343)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6050704967209311)
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
 p_id=>wwv_flow_api.id(6050837148209312)
,p_name=>'P32_ID_FRMLRIO_RGION_ATRBTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6050704967209311)
,p_prompt=>'Atributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dsplay,',
'        a.id_frmlrio_rgion_atrbto',
'from    gi_d_frmlrios_rgion_atrbto  a',
'where   a.id_frmlrio_rgion_atrbto   =   :P32_ID_FRMLRIO_RGION_ATRBTO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P32_ID_FRMLRIO_RGION_ATRBTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6051095829209314)
,p_name=>'P32_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6050704967209311)
,p_prompt=>'Valor'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.nmbre_dsplay,',
'            a.id_frmlrios_rgn_atrbt_vlr',
'from        gi_d_frmlrios_rgn_atrbt_vlr a',
'inner join  gi_d_frmlrios_rgion_atrbto  b   on  b.id_frmlrio_rgion_atrbto   =   a.id_frmlrio_rgion_atrbto',
'where       a.id_frmlrios_rgn_atrbt_vlr =   :P32_ID_FRMLRIOS_RGN_ATRBT_VLR;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P32_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6051384833209317)
,p_name=>'P32_ORGEN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6051129878209315)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Origen'
,p_source=>'ORGEN'
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6051521831209319)
,p_name=>'P32_TPO_ORGN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6051129878209315)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Origen'
,p_source=>'TPO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Estatico;E,SQL;S,Calculo;C,Funci\00F3n;F')
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
 p_id=>wwv_flow_api.id(6051675816209320)
,p_name=>'P32_ID_FRMLRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6050704967209311)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9065983674825506)
,p_name=>'P32_FUNCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6051129878209315)
,p_prompt=>unistr('Funci\00F3n')
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
 p_id=>wwv_flow_api.id(9853916453103208)
,p_name=>'P32_OPERACION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6051129878209315)
,p_prompt=>unistr('Operaci\00F3n Agrupada')
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
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9067820059825525)
,p_validation_name=>'validar_SQLfuncion'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    if :P32_TPO_ORGN = ''S'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P32_ORGEN;',
'        execute immediate v_sql ;',
'    elsif  :P32_TPO_ORGN = ''F'' then  ',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for select '' || :P32_ORGEN || '' from dual'';',
'        execute immediate v_sql ;',
'    end if;',
'exception when others then',
'    return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P32_TPO_ORGN'
,p_validation_condition2=>'S:F'
,p_validation_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_when_button_pressed=>wwv_flow_api.id(6053750993209341)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6052863328209332)
,p_name=>'Al seleccionar C'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_TPO_ORGN'
,p_condition_element=>'P32_TPO_ORGN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6052960066209333)
,p_event_id=>wwv_flow_api.id(6052863328209332)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6053264370209336)
,p_event_id=>wwv_flow_api.id(6052863328209332)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_agrgarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9066873993825515)
,p_event_id=>wwv_flow_api.id(6052863328209332)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9854171685103210)
,p_event_id=>wwv_flow_api.id(6052863328209332)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_OPERACION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9854096344103209)
,p_event_id=>wwv_flow_api.id(6052863328209332)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_OPERACION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6053025888209334)
,p_event_id=>wwv_flow_api.id(6052863328209332)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_quitarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6054369922209347)
,p_name=>'Al seleccionar E'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_TPO_ORGN'
,p_condition_element=>'P32_TPO_ORGN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6054433889209348)
,p_event_id=>wwv_flow_api.id(6054369922209347)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9066979126825516)
,p_event_id=>wwv_flow_api.id(6054369922209347)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9854236351103211)
,p_event_id=>wwv_flow_api.id(6054369922209347)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_agrgarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9065414343825501)
,p_name=>'Cancelar Pagina'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6053989722209343)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9065507964825502)
,p_event_id=>wwv_flow_api.id(9065414343825501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9066000413825507)
,p_name=>'Al seleccionar F'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_TPO_ORGN'
,p_condition_element=>'P32_TPO_ORGN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9066335279825510)
,p_event_id=>wwv_flow_api.id(9066000413825507)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_FUNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9066480248825511)
,p_event_id=>wwv_flow_api.id(9066000413825507)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9067097846825517)
,p_event_id=>wwv_flow_api.id(9066000413825507)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ORGEN,P32_FUNCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9066194130825508)
,p_event_id=>wwv_flow_api.id(9066000413825507)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_FUNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9066567530825512)
,p_event_id=>wwv_flow_api.id(9066000413825507)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_quitarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9066604259825513)
,p_name=>'P32_FUNCION Seleccionar'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_FUNCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9066761761825514)
,p_event_id=>wwv_flow_api.id(9066604259825513)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9067199253825518)
,p_name=>'Al seleccionar S'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_TPO_ORGN'
,p_condition_element=>'P32_TPO_ORGN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9853816958103207)
,p_event_id=>wwv_flow_api.id(9067199253825518)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9067336187825520)
,p_event_id=>wwv_flow_api.id(9067199253825518)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9067214649825519)
,p_event_id=>wwv_flow_api.id(9067199253825518)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_quitarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9067495187825521)
,p_name=>'Al no seleccionar'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_TPO_ORGN'
,p_condition_element=>'P32_TPO_ORGN'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9067691322825523)
,p_event_id=>wwv_flow_api.id(9067495187825521)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ORGEN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9067502777825522)
,p_event_id=>wwv_flow_api.id(9067495187825521)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P32_ORGEN'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9068676536825533)
,p_name=>'Al hacer clic en SAVE'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6053750993209341)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9068789882825534)
,p_event_id=>wwv_flow_api.id(9068676536825533)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let v_tpo_orgn = true;',
'if ($v(''P32_TPO_ORGN'') == ''C''){',
'    v_tpo_orgn = fnc_vldarExprsion($v(''P32_ORGEN''));',
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
 p_id=>wwv_flow_api.id(9854396423103212)
,p_name=>'P32_OPERACION seleccionar'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_OPERACION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9854428436103213)
,p_event_id=>wwv_flow_api.id(9854396423103212)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let v_areaText1 = document.getElementById("P32_ORGEN");',
'let v_start1 = v_areaText1.value.substring(0, v_areaText1.selectionStart);',
'var v_end1 = v_areaText1.value.substring(v_areaText1.selectionEnd);',
'v_areaText1.value = v_start1 + document.getElementById("P32_OPERACION").value + v_end1;',
'fnc_vldarClclo();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6054203834209346)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'atributo_crgarOrgen'
,p_attribute_02=>'GI_D_FRMLRIOS_RGION_ATRBTO'
,p_attribute_03=>'P32_ID_FRMLRIO_RGION_ATRBTO'
,p_attribute_04=>'ID_FRMLRIO_RGION_ATRBTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P32_ID_FRMLRIO_RGION_ATRBTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9067948841825526)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'valor_crgarOrgen'
,p_attribute_02=>'GI_D_FRMLRIOS_RGN_ATRBT_VLR'
,p_attribute_03=>'P32_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_attribute_04=>'ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P32_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9065709043825504)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'atributo_actlzarOrgen'
,p_attribute_02=>'GI_D_FRMLRIOS_RGION_ATRBTO'
,p_attribute_03=>'P32_ID_FRMLRIO_RGION_ATRBTO'
,p_attribute_04=>'ID_FRMLRIO_RGION_ATRBTO'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6053750993209341)
,p_process_when=>'P32_ID_FRMLRIO_RGION_ATRBTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('Origen actualizado con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9068082110825527)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'valor_actlzarOrgen'
,p_attribute_02=>'GI_D_FRMLRIOS_RGN_ATRBT_VLR'
,p_attribute_03=>'P32_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_attribute_04=>'ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P32_ID_FRMLRIOS_RGN_ATRBT_VLR'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('Origen actualizado con \00E9xito.')
);
end;
/
