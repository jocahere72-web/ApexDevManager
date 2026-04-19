prompt --application/pages/page_00063
begin
wwv_flow_api.create_page(
 p_id=>63
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Impresion de Actos de Medidas Cautelares'
,p_step_title=>'Impresion de Actos de Medidas Cautelares'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function ocultar_mostrar_btn_generar_excel(){',
'    var valor_item = apex.item("P63_TPO_DCMNTO").getValue();',
'    //console.log(valor_item);',
'    if (valor_item == "O"){',
'        apex.item("generar_excel").show();',
'    } else{',
'        apex.item("generar_excel").hide();',
'    }',
'}',
'',
'function json_oficios_emb() {',
'',
'    var region = apex.region("oficios_embargo");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        //REALIZAMOS UN FILTRO DE TODOS LOS DATOS SELECCIONADOS DEL INTERACTIVE GRID QUE NO ESTEN PROCESADOS',
'       /* records = records.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_PRCSDO").v === ''N''',
'        });*/',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "NMRO_ACTO_OFCIO": model.getValue(record, "NMRO_ACTO_OFCIO").trim(),',
'                     "FCHA_OFCIO": model.getValue(record, "FCHA_OFCIO").trim(),',
'                     "NMRO_RSLCION": model.getValue(record, "NMRO_RSLCION_EMB").trim(),',
'                     "IDNTFCCION": model.getValue(record, "IDNTFCCION").trim(), ',
'                     "RSPNSBLE": model.getValue(record, "RSPNSBLE").trim(),',
'                     "DRCCION_NTFCCION": model.getValue(record, "DRCCION_NTFCCION").trim(),',
'                     "VLOR_MDDA_CTLAR": model.getValue(record, "VLOR_MDDA_CTLAR").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P63_JSON'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'       /* if (json.length === 1 ){',
'            apex.item("generar_excel").show();',
'            //$s(''P34_EMBRGOS_SMU_SJTO'',  json[0]["ID_EMBRGOS_SMU_SJTO"] );//SETEAMOS EL VALOR DEL SIMU SUJETO SI SOLO HAY UNO SELECIONADO ',
'        }else {',
'            apex.item("generar_excel").hide();',
'            //$s(''P34_EMBRGOS_SMU_SJTO'',  '''');',
'        }',
'        ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("generar_excel").show();',
'           //apex.item("BTN_ELMNAR_SJTO").show();',
'        }else {',
'            apex.item("generar_excel").hide();',
'           // apex.item("BTN_ELMNAR_SJTO").hide();',
'        }*/',
'        ',
'        //SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID ',
'        //apex.region("oficios").widget().interactiveGrid("setSelectedRecords", records);',
'        return;',
'    }',
'    apex.item("generar_excel").hide();',
'    //apex.item("BTN_INCIAR_PRCSO").hide();',
'    //apex.item("BTN_ELMNAR_SJTO").hide();',
'    ',
'',
'}',
'',
'function json_oficios_desem() {',
'',
'    var region = apex.region("oficios_desembargo");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        //REALIZAMOS UN FILTRO DE TODOS LOS DATOS SELECCIONADOS DEL INTERACTIVE GRID QUE NO ESTEN PROCESADOS',
'       /* records = records.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_PRCSDO").v === ''N''',
'        });*/',
'              ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "NMRO_ACTO_OFCIO": model.getValue(record, "NMRO_ACTO").trim(),',
'                     "FCHA_OFCIO": model.getValue(record, "FCHA_ACTO").trim(),',
'                     "NMRO_RSLCION": model.getValue(record, "RSLCION_DSMBRGO").trim(),',
'                     "IDNTFCCION": model.getValue(record, "IDNTFCCION").trim(), ',
'                     "RSPNSBLE": model.getValue(record, "RSPNSBLE").trim(),',
'                     "DRCCION_NTFCCION": model.getValue(record, "DRCCION_NTFCCION").trim(),',
'                     "VLOR_MDDA_CTLAR": model.getValue(record, "VLOR_MDDA_CTLAR").trim()',
'                   };',
'        });',
'               ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM ',
'        $s(''P63_JSON'', json.length > 0 ? JSON.stringify(json) : '''');',
'        ',
'        //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        /*if (json.length === 1 ){',
'            apex.item("generar_excel").show();',
'            //$s(''P34_EMBRGOS_SMU_SJTO'',  json[0]["ID_EMBRGOS_SMU_SJTO"] );//SETEAMOS EL VALOR DEL SIMU SUJETO SI SOLO HAY UNO SELECIONADO ',
'        }else {',
'            apex.item("generar_excel").hide();',
'            //$s(''P34_EMBRGOS_SMU_SJTO'',  '''');',
'        }',
'        ',
'        //SOLO SE PUEDE INICIAR EL PROCESO SI HAY POR LO MENOS UN REGISTRO SELECCIONADO',
'        if (records.length > 0 ) {',
'            apex.item("generar_excel").show();',
'           //apex.item("BTN_ELMNAR_SJTO").show();',
'        }else {',
'            apex.item("generar_excel").hide();',
'           // apex.item("BTN_ELMNAR_SJTO").hide();',
'        }',
'        */',
'        //SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID ',
'        //apex.region("oficios").widget().interactiveGrid("setSelectedRecords", records);',
'        return;',
'    }',
'    apex.item("generar_excel").hide();',
'    //apex.item("BTN_INCIAR_PRCSO").hide();',
'    //apex.item("BTN_ELMNAR_SJTO").hide();',
'    ',
'',
'}',
'',
'function Seleccion_resolucion_emb() {',
'        ',
'    //debugger;',
'    var region = apex.region("resolucion_embargo");',
'    if (region) {',
'',
'        var view = apex.region("resolucion_embargo").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");   ',
'        ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM',
'        var xml = records.map(function (record) {',
'            return { "ID_EMBRGOS_RSLCION"    : model.getValue(record, "ID_EMBRGOS_RSLCION").trim(), ',
'                     "ID_EMBRGOS_CRTRA"      : model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "NMBRE_RPRTE"           :''RESEMB_'' + model.getValue(record, "NMRO_ACTO").trim()/*, ',
unistr('                     "FNCION"                : model.getValue(record, "ID_ACTO").trim() ? ''pkg_cb_proceso_juridico.prc_ac_acto(p_file_blob => \00A1file_blob ! p_id_acto => '' + model.getValue(record, "ID_ACTO").trim()+ '')'' '),
'                                                                                                : undefined*/',
'                   };',
'        });',
'          ',
'        $s(''P63_MSVO'', xml.length === 1 ? '''' : ''masivoZip'')',
'        $s(''P63_XML'', objectToXml(xml));',
'        $s(''P63_ID_REPORTE'', 207);',
'                ',
'        var imprimir = records.filter((f) => {',
'                       return model.getValue(f, "ID_ACTO")',
'                       });',
'        imprimir.length > 0 && imprimir.length === records.length ? apex.item("BTN_IMPRIMIR").show() ',
'                                                                  : apex.item("BTN_IMPRIMIR").hide();',
'        return;',
'    }',
'    ',
'    apex.item("BTN_IMPRIMIR").hide();',
'    ',
'}',
'',
'function Seleccion_oficio_emb() {',
'',
'    var region = apex.region("oficios_embargo");',
'    if (region) {',
'',
'        var view = apex.region("oficios_embargo").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");   ',
'        ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM',
'        var xml = records.map(function (record) {',
'            return { "ID_SLCTD_OFCIO"    : model.getValue(record, "ID_SLCTD_OFCIO").trim(), ',
'                     "ID_EMBRGOS_CRTRA"      : model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "NMBRE_RPRTE"           :''OFIEMB_'' + model.getValue(record, "NMRO_ACTO_OFCIO").trim()/*, ',
unistr('                     "FNCION"                : model.getValue(record, "ID_ACTO").trim() ? ''pkg_cb_proceso_juridico.prc_ac_acto(p_file_blob => \00A1file_blob ! p_id_acto => '' + model.getValue(record, "ID_ACTO").trim()+ '')'' '),
'                                                                                                : undefined*/',
'                   };',
'        });',
'          ',
'        $s(''P63_MSVO'', xml.length === 1 ? '''' : ''masivoZip'')',
'        $s(''P63_XML'', objectToXml(xml));',
'        $s(''P63_ID_REPORTE'', 208);',
'        ',
'        var imprimir = records.filter((f) => {',
'                       return model.getValue(f, "ID_ACTO")',
'                       });',
'        imprimir.length > 0 && imprimir.length === records.length ? apex.item("BTN_IMPRIMIR").show() ',
'                                                                  : apex.item("BTN_IMPRIMIR").hide();',
'        return;',
'    }',
'    ',
'    apex.item("BTN_IMPRIMIR").hide();',
'    ',
'}',
'',
'function Seleccion_resolucion_desmb() {',
'',
'    var region = apex.region("Resolucion_desembargo");',
'    if (region) {',
'',
'        var view = apex.region("Resolucion_desembargo").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");   ',
'        ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM',
'        var xml = records.map(function (record) {',
'            return { "ID_DSMBRGOS_RSLCION"    : model.getValue(record, "ID_DSMBRGOS_RSLCION").trim(), ',
'                     //"ID_EMBRGOS_CRTRA"      : model.getValue(record, "ID_EMBRGOS_CRTRA").trim(),',
'                     "NMBRE_RPRTE"           :''RESDESEMB_'' + model.getValue(record, "NMRO_ACTO").trim()/*, ',
unistr('                     "FNCION"                : model.getValue(record, "ID_ACTO").trim() ? ''pkg_cb_proceso_juridico.prc_ac_acto(p_file_blob => \00A1file_blob ! p_id_acto => '' + model.getValue(record, "ID_ACTO").trim()+ '')'' '),
'                                                                                                : undefined*/',
'                   };',
'        });',
'          ',
'        $s(''P63_MSVO'', xml.length === 1 ? '''' : ''masivoZip'')',
'        $s(''P63_XML'', objectToXml(xml));',
'        $s(''P63_ID_REPORTE'', 552);',
'        ',
'        var imprimir = records.filter((f) => {',
'                       return model.getValue(f, "ID_ACTO")',
'                       });',
'        imprimir.length > 0 && imprimir.length === records.length ? apex.item("BTN_IMPRIMIR").show() ',
'                                                                  : apex.item("BTN_IMPRIMIR").hide();',
'        return;',
'    }',
'    ',
'    apex.item("BTN_IMPRIMIR").hide();',
'    ',
'}',
'',
'function Seleccion_oficio_desmb() {',
'',
'    var region = apex.region("oficios_desembargo");',
'    if (region) {',
'',
'        var view = apex.region("oficios_desembargo").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");   ',
'        ',
'        //SETEAMOS EL VALOR DEL JSON EN FORMA DE CADENA AL ITEM',
'        var xml = records.map(function (record) {',
'            return { "ID_DSMBRGO_OFCIO"      : model.getValue(record, "ID_DSMBRGO_OFCIO").trim(), ',
'                     "ID_DSMBRGOS_RSLCION"   : model.getValue(record, "ID_DSMBRGOS_RSLCION").trim(),',
'                     "NMBRE_RPRTE"           :''OFIDESMB_'' + model.getValue(record, "NMRO_ACTO").trim()/*, ',
unistr('                     "FNCION"                : model.getValue(record, "ID_ACTO").trim() ? ''pkg_cb_proceso_juridico.prc_ac_acto(p_file_blob => \00A1file_blob ! p_id_acto => '' + model.getValue(record, "ID_ACTO").trim()+ '')'' '),
'                                                                                                : undefined*/',
'                   };',
'        });',
'          ',
'        $s(''P63_MSVO'', xml.length === 1 ? '''' : ''masivoZip'')',
'        $s(''P63_XML'', objectToXml(xml));',
'        $s(''P63_ID_REPORTE'', 208);',
'        ',
'        var imprimir = records.filter((f) => {',
'                       return model.getValue(f, "ID_ACTO")',
'                       });',
'        imprimir.length > 0 && imprimir.length === records.length ? apex.item("BTN_IMPRIMIR").show() ',
'                                                                  : apex.item("BTN_IMPRIMIR").hide();',
'        return;',
'    }',
'    ',
'    apex.item("BTN_IMPRIMIR").hide();',
'    ',
'}',
'',
'function objectToXml(xmls) {',
'    var xml = '''';  ',
'    xmls.forEach( function(obj){        ',
'        xml += ''<data>'';        ',
'        for (let prop in obj) {',
'            let p = prop.toLowerCase();',
'            if (!obj.hasOwnProperty(prop)) {',
'                continue;',
'            }',
'            if (obj[prop] == undefined){',
'                continue;   ',
'            }',
'            xml += "<" + p + ">";',
'            if (typeof obj[prop] == "object"){',
'                xml += objectToXml(new Object(obj[prop]));',
'            } else {',
'                xml += obj[prop];',
'            }',
'            xml += "</" + p + ">";',
'        }',
'        xml += ''</data>'';        ',
'    });',
'    ',
'    return xml;',
'}',
'',
'',
''))
,p_javascript_code_onload=>'ocultar_mostrar_btn_generar_excel();'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'MRODRIGUEZ'
,p_last_upd_yyyymmddhh24miss=>'20220118145406'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(102324132986080601)
,p_plug_name=>'Oficios de Embargo'
,p_region_name=>'oficios_embargo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgos_crtra,',
'       a.id_slctd_ofcio,',
'       a.nmro_acto_ofcio,',
'       to_char(a.fcha_ofcio,''dd/mm/yyyy'') as fcha_ofcio,',
'       a.nmro_rslcion_emb,',
'       a.idntfccion,',
'       a.rspnsble,',
'       a.drccion_ntfccion,',
'       a.dscrpcion,',
'       a.ACTO_OFCIO as id_acto,',
'       b.vlor_mdda_ctlar',
'from v_mc_g_solicitudes_y_oficios a',
'join mc_g_embargos_cartera b on b.id_embrgos_crtra = a.id_embrgos_crtra',
'where a.id_embrgos_rslcion is not null',
'and a.ACTO_OFCIO is not null',
'and b.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_tpos_mdda_ctlar = :P63_ID_TPO_MDDA_CTLAR',
'and (:P63_NMRO_ACTO_D is null or a.nmro_acto_ofcio >= :P63_NMRO_ACTO_D)',
'AND (:P63_NMRO_ACTO_H is null or a.nmro_acto_ofcio <= :P63_NMRO_ACTO_H)',
'and (:P63_FCHA_ACTO_D is null or trunc(a.fcha_ofcio) >= trunc(to_date(:P63_FCHA_ACTO_D,''DD/MM/YYYY'')))',
'and (:P63_FCHA_ACTO_H is null or trunc(a.fcha_ofcio) <= trunc(to_date(:P63_FCHA_ACTO_H,''DD/MM/YYYY'')))',
'and (:P63_ENTIDADES IS NULL OR a.ID_ENTDDES = :P63_ENTIDADES)',
'and exists (select 1',
'                from mc_g_embargos_resolucion c',
'                where c.id_embrgos_rslcion = a.id_embrgos_rslcion',
'                and (:P63_ID_LTE_MDDA_CTLA IS NULL OR c.id_lte_mdda_ctlar = :P63_ID_LTE_MDDA_CTLAR));'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P63_TPO_DCMNTO = ''O'' AND :P63_TIPO_PROCESO = ''E'' THEN',
'        RETURN TRUE;',
'    ELSE',
'        RETURN FALSE;',
'    END IF;',
'end;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102324359144080603)
,p_name=>'ID_SLCTD_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_OFCIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102324465246080604)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102324885725080608)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102324997844080609)
,p_name=>'RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102325052876080610)
,p_name=>'DRCCION_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION_NTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102325889440080618)
,p_name=>'NMRO_ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Oficio ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102325958300080619)
,p_name=>'FCHA_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'dd/mm/yyyy'
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102326821001080628)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102326933078080629)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(102327110284080631)
,p_name=>'NMRO_RSLCION_EMB'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RSLCION_EMB'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109748040274024118)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Entidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109750862375024146)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110594392774996618)
,p_name=>'VLOR_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_MDDA_CTLAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(102324205924080602)
,p_internal_uid=>102324205924080602
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(102329748475083045)
,p_interactive_grid_id=>wwv_flow_api.id(102324205924080602)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(102329853506083046)
,p_report_id=>wwv_flow_api.id(102329748475083045)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102330370030083050)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(102324359144080603)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102330802630083055)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(102324465246080604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102332892864083061)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(102324885725080608)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102333394516083062)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(102324997844080609)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>266
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102333828178083064)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(102325052876080610)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>237
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102337879432083074)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(102325889440080618)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102338307581083075)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(102325958300080619)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102346595444155356)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(102326821001080628)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(102347473930155359)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(102327110284080631)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109805999817648494)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(109748040274024118)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>215
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110558615473531706)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(109750862375024146)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111239836528716270)
,p_view_id=>wwv_flow_api.id(102329853506083046)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(110594392774996618)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(102327529949080635)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108556786000903345)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108557217000903350)
,p_plug_name=>'Resoluciones de Embargo'
,p_region_name=>'resolucion_embargo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgos_rslcion,',
'       a.id_embrgos_crtra,',
'       a.id_acto,',
'       a.nmro_acto,',
'       to_char(a.fcha_acto,''dd/mm/yyyy'') as fcha_acto,       ',
'       a.dscrpcion_tipo_embargo,',
'       a.idntfccion,',
'       a.vgncias',
'from v_mc_g_embargos_resolucion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_tpos_embrgo = :P63_ID_TPO_MDDA_CTLAR',
'and (:P63_ID_LTE_MDDA_CTLA IS NULL OR a.id_lte_mdda_ctlar = :P63_ID_LTE_MDDA_CTLAR)',
'and (:P63_NMRO_ACTO_D is null or a.nmro_acto >= :P63_NMRO_ACTO_D)',
'AND (:P63_NMRO_ACTO_H is null or a.nmro_acto <= :P63_NMRO_ACTO_H)',
'and (:P63_FCHA_ACTO_D is null or trunc(a.fcha_acto) >= trunc(to_date(:P63_FCHA_ACTO_D,''DD/MM/YYYY'')))',
'and (:P63_FCHA_ACTO_H is null or trunc(a.fcha_acto) <= trunc(to_date(:P63_FCHA_ACTO_H,''DD/MM/YYYY'')))',
'and a.id_acto is not null',
'',
'--and a.idntfccion = nvl(:P42_SUJETO,a.idntfccion)'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P63_TPO_DCMNTO = ''R'' AND :P63_TIPO_PROCESO = ''E'' THEN',
'        RETURN TRUE;',
'    ELSE',
'        RETURN FALSE;',
'    END IF;',
'end;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109746400434024102)
,p_name=>'ID_EMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109746579317024103)
,p_name=>'ID_EMBRGOS_CRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_CRTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109746644118024104)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109746733379024105)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109746877061024106)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'dd/mm/yyyy'
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109746915835024107)
,p_name=>'DSCRPCION_TIPO_EMBARGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TIPO_EMBARGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109747009216024108)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>25
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109747147416024109)
,p_name=>'VGNCIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109747754345024115)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109747887516024116)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(109746313699024101)
,p_internal_uid=>109746313699024101
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(109754786327070108)
,p_interactive_grid_id=>wwv_flow_api.id(109746313699024101)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(109754849982070109)
,p_report_id=>wwv_flow_api.id(109754786327070108)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109755310722070112)
,p_view_id=>wwv_flow_api.id(109754849982070109)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(109746400434024102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109755841774070115)
,p_view_id=>wwv_flow_api.id(109754849982070109)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(109746579317024103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109756366083070117)
,p_view_id=>wwv_flow_api.id(109754849982070109)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(109746644118024104)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109756831504070118)
,p_view_id=>wwv_flow_api.id(109754849982070109)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(109746733379024105)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>199
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109757336100070119)
,p_view_id=>wwv_flow_api.id(109754849982070109)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(109746877061024106)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>226
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109757859550070121)
,p_view_id=>wwv_flow_api.id(109754849982070109)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(109746915835024107)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>216
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109758356473070122)
,p_view_id=>wwv_flow_api.id(109754849982070109)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(109747009216024108)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>288
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109758887715070123)
,p_view_id=>wwv_flow_api.id(109754849982070109)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(109747147416024109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109799201183625011)
,p_view_id=>wwv_flow_api.id(109754849982070109)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(109747754345024115)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109747292707024110)
,p_plug_name=>'Resoluciones de Desembargo'
,p_region_name=>'Resolucion_desembargo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dsmbrgos_rslcion,',
'       a.id_acto,',
'       a.nmro_acto,',
'       to_char(a.fcha_acto,''dd/mm/yyyy'') as fcha_acto,',
'       a.dscrpcion_tpo_mdda_ctlar as dscrpcion,',
'       a.dscrpcion_csal',
'from v_mc_g_desembargos_resolucion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_acto is not null',
'and a.id_tpos_mdda_ctlar = :P63_ID_TPO_MDDA_CTLAR',
'and (:P63_ID_LTE_MDDA_CTLA IS NULL OR a.id_lte_mdda_ctlar = :P63_ID_LTE_MDDA_CTLAR)',
'and (:P63_NMRO_ACTO_D is null or a.nmro_acto >= :P63_NMRO_ACTO_D)',
'AND (:P63_NMRO_ACTO_H is null or a.nmro_acto <= :P63_NMRO_ACTO_H)',
'and (:P63_FCHA_ACTO_D is null or trunc(a.fcha_acto) >= trunc(to_date(:P63_FCHA_ACTO_D,''DD/MM/YYYY'')))',
'and (:P63_FCHA_ACTO_H is null or trunc(a.fcha_acto) <= trunc(to_date(:P63_FCHA_ACTO_H,''DD/MM/YYYY'')))'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P63_TPO_DCMNTO = ''R'' AND :P63_TIPO_PROCESO = ''D'' THEN',
'        RETURN TRUE;',
'    ELSE',
'        RETURN FALSE;',
'    END IF;',
'end;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109748272567024120)
,p_name=>'ID_DSMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109748399695024121)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109748460458024122)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109748597196024123)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109748642649024124)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Desembargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109748737562024125)
,p_name=>'DSCRPCION_CSAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CSAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Causal de Desembargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109748823299024126)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109748924483024127)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(109748103313024119)
,p_internal_uid=>109748103313024119
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(109849490087004334)
,p_interactive_grid_id=>wwv_flow_api.id(109748103313024119)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(109849542512004334)
,p_report_id=>wwv_flow_api.id(109849490087004334)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109850074221004338)
,p_view_id=>wwv_flow_api.id(109849542512004334)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(109748272567024120)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109850527319004341)
,p_view_id=>wwv_flow_api.id(109849542512004334)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(109748399695024121)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109851082151004342)
,p_view_id=>wwv_flow_api.id(109849542512004334)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(109748460458024122)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109851505758004343)
,p_view_id=>wwv_flow_api.id(109849542512004334)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(109748597196024123)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109852090641004345)
,p_view_id=>wwv_flow_api.id(109849542512004334)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(109748642649024124)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109852508787004352)
,p_view_id=>wwv_flow_api.id(109849542512004334)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(109748737562024125)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109853623642006934)
,p_view_id=>wwv_flow_api.id(109849542512004334)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(109748823299024126)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109747323063024111)
,p_plug_name=>'Oficios de Desembargo'
,p_region_name=>'oficios_desembargo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.ID_DSMBRGO_OFCIO,',
'        A.ID_DSMBRGOS_RSLCION,',
'        A.ID_ACTO,',
'        A.NMRO_ACTO,--',
'        to_char(A.FCHA_ACTO,''dd/mm/yyyy'') as FCHA_ACTO,--',
'        B.NMRO_ACTO as rslcion_dsmbrgo,--',
'        C.DSCRPCION,',
'        C.IDNTFCCION,--',
'        C.RSPNSBLE,--',
'        C.DRCCION_NTFCCION,--',
'        D.VLOR_MDDA_CTLAR --   ',
'   from MC_G_DESEMBARGOS_OFICIO a',
'   join MC_G_DESEMBARGOS_RESOLUCION b on A.ID_DSMBRGOS_RSLCION = B.ID_DSMBRGOS_RSLCION',
'   join v_MC_G_SOLICITUDES_Y_OFICIOS c on C.ID_SLCTD_OFCIO = A.ID_SLCTD_OFCIO',
'   join mc_g_embargos_cartera d on d.id_embrgos_crtra = c.id_embrgos_crtra',
'  where b.id_tpos_mdda_ctlar = :P63_ID_TPO_MDDA_CTLAR',
'    and A.ID_ACTO is not null',
'    and (:P63_ID_LTE_MDDA_CTLA IS NULL OR b.id_lte_mdda_ctlar = :P63_ID_LTE_MDDA_CTLAR)',
'    and (:P63_ENTIDADES IS NULL OR c.ID_ENTDDES = :P63_ENTIDADES)',
'    and (:P63_NMRO_ACTO_D is null or a.nmro_acto >= :P63_NMRO_ACTO_D)',
'    AND (:P63_NMRO_ACTO_H is null or a.nmro_acto <= :P63_NMRO_ACTO_H)',
'    and (:P63_FCHA_ACTO_D is null or trunc(a.fcha_acto) >= trunc(to_date(:P63_FCHA_ACTO_D,''DD/MM/YYYY'')))',
'    and (:P63_FCHA_ACTO_H is null or trunc(a.fcha_acto) <= trunc(to_date(:P63_FCHA_ACTO_H,''DD/MM/YYYY'')))'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P63_TPO_DCMNTO = ''O'' AND :P63_TIPO_PROCESO = ''D'' THEN',
'        RETURN TRUE;',
'    ELSE',
'        RETURN FALSE;',
'    END IF;',
'end;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109749522630024133)
,p_name=>'ID_DSMBRGO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGO_OFCIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109749674018024134)
,p_name=>'ID_DSMBRGOS_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGOS_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109749704598024135)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Oficio ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109749836109024136)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109749907025024137)
,p_name=>'RSLCION_DSMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSLCION_DSMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n de Desembargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109750095884024138)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Entidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109750120225024139)
,p_name=>'RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSPNSBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Responsable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>403
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109750241405024140)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109750316857024141)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(109750726996024145)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110594426119996619)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110594580770996620)
,p_name=>'DRCCION_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCCION_NTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(110594618900996621)
,p_name=>'VLOR_MDDA_CTLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_MDDA_CTLAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(109749421270024132)
,p_internal_uid=>109749421270024132
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(110262039263646785)
,p_interactive_grid_id=>wwv_flow_api.id(109749421270024132)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(110262165475646785)
,p_report_id=>wwv_flow_api.id(110262039263646785)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110262643756646788)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(109749522630024133)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110263104350646791)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(109749674018024134)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110263680118646792)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(109749704598024135)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110264130530646794)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(109749836109024136)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110264660623646795)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(109749907025024137)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110265158741646796)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(109750095884024138)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110265689519646797)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(109750120225024139)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110491070318482637)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(109750241405024140)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(110558192473531704)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(109750726996024145)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111285350576906285)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(110594426119996619)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111285833346906288)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(110594580770996620)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(111286346221906290)
,p_view_id=>wwv_flow_api.id(110262165475646785)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(110594618900996621)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116930073308382707)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'<p>Funcionalidad que permite descargar o imprimir los actos generados en cada uno de los procesos de las medidas cautelares.</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(102328453556080644)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(102327529949080635)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_static_id=>'BTN_IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109747442486024112)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(108556786000903345)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(102327636316080636)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(102327529949080635)
,p_button_name=>'Generar_excel'
,p_button_static_id=>'generar_excel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Generar Gu\00EDa')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(110593149416996606)
,p_branch_name=>unistr('Ir a P\00E1gina 2')
,p_branch_action=>'f?p=66000:2:&SESSION.:&P63_MSVO.:&DEBUG.:RP:P2_ID_RPRTE,P2_XML,P2_NMBRE_ZIP:&P63_ID_REPORTE.,&P63_XML.,lotezip&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(102328453556080644)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(111073447712528602)
,p_branch_action=>'f?p=&APP_ID.:63:&SESSION.:Generar_excel:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(102327636316080636)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102327750543080637)
,p_name=>'P63_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108556880555903346)
,p_name=>'P63_ID_TPO_MDDA_CTLAR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_prompt=>'Tipo de Medida Cautelar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,id_tpos_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Ingrese el tipo de medida cautelar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108556916224903347)
,p_name=>'P63_TPO_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_prompt=>'Tipo de documento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Resoluci\00F3n;R,Oficio;O')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Escoja el tipo de Documento, oficio o resoluci\00F3n.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108557049940903348)
,p_name=>'P63_ID_LTE_MDDA_CTLAR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_prompt=>'Lote de Procesamiento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_cnsctvo||''-''||to_char(fcha_lte,''DD/MM/YYYY'') ||'' - ''||nmbre_trcro as lot,id_lte_mdda_ctlar',
'from v_mc_g_lotes_mdda_ctlar ',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and tpo_lte = :P63_TIPO_PROCESO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P63_TIPO_PROCESO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Escoja el lote de impresi\00F3n de medida cautelar par consultar por este par\00E1metro.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108557122535903349)
,p_name=>'P63_TIPO_PROCESO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_prompt=>'Tipo de Proceso'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Embargo;E,Desembargo;D,Investigacion;I'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Escoja el tipo de proceso para consultar por este par\00E1metro.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109747595315024113)
,p_name=>'P63_NMRO_ACTO_D'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_prompt=>unistr('N\00FAmero Resoluci\00F3n/Oficio - Desde')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese el numero de acto inicial ya sea de resoluci\00F3n u oficio de acuerdo al tipo de proceso.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109749114627024129)
,p_name=>'P63_FCHA_ACTO_D'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_prompt=>unistr('Fecha Resoluci\00F3n/Oficio Desde')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la fecha de acto inicial ya sea de resoluci\00F3n u oficio de acuerdo al tipo de proceso.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109749248206024130)
,p_name=>'P63_FCHA_ACTO_H'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_prompt=>unistr('Fecha Resoluci\00F3n/Oficio Hasta')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la fecha de acto final ya sea de resoluci\00F3n u oficio de acuerdo al tipo de proceso.')
,p_attribute_02=>'&P63_FCHA_ACTO_D.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109749355231024131)
,p_name=>'P63_NMRO_ACTO_H'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_prompt=>unistr('N\00FAmero Resoluci\00F3n/Oficio - Hasta')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese el numero de acto final ya sea de resoluci\00F3n u oficio de acuerdo al tipo de proceso.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109750536672024143)
,p_name=>'P63_XML'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109751160514024149)
,p_name=>'P63_MSVO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110593084074996605)
,p_name=>'P63_ID_REPORTE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110595217954996627)
,p_name=>'P63_ENTIDADES'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(108556786000903345)
,p_prompt=>'Entidades'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION,ID_ENTDDES',
'from v_mc_d_entidades',
'where ID_TPOS_MDDA_CTLAR = :P63_ID_TPO_MDDA_CTLAR',
'and CDGO_CLNTE = :F_CDGO_CLNTE',
'and ACTVO = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P63_ID_TPO_MDDA_CTLAR'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P63_TPO_DCMNTO'
,p_display_when2=>'O'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Escoja la entidad asociada al oficio para consultar por este par\00E1metro.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(102327833279080638)
,p_name=>'Al seleccionar oficios de embargo'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(102324132986080601)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(102327916386080639)
,p_event_id=>wwv_flow_api.id(102327833279080638)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s(''P63_JSON'','''');',
'Seleccion_oficio_emb();',
'json_oficios_emb();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109750973192024147)
,p_name=>'Al seleccionar resoluciones de embargo'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(108557217000903350)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109751008186024148)
,p_event_id=>wwv_flow_api.id(109750973192024147)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s(''P63_JSON'','''');',
'Seleccion_resolucion_emb();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109751290119024150)
,p_name=>'Al seleccionar resoluciones de desembargo'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(109747292707024110)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110592673584996601)
,p_event_id=>wwv_flow_api.id(109751290119024150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s(''P63_JSON'','''');',
'Seleccion_resolucion_desmb()'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110592708257996602)
,p_name=>'Al seleccionar oficios de desembargo'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(109747323063024111)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110592874072996603)
,p_event_id=>wwv_flow_api.id(110592708257996602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s(''P63_JSON'','''');',
'Seleccion_oficio_desmb();',
'json_oficios_desem();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57853328378104947)
,p_name=>'Al cambiar fecha de acto'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P63_FCHA_ACTO_D'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57853400727104948)
,p_event_id=>wwv_flow_api.id(57853328378104947)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P63_FCHA_ACTO_H").datepicker( ''option'' , ''minDate'' , $("#P63_FCHA_ACTO_D").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109747936414024117)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(108557217000903350)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Resoluciones de Embargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109749058771024128)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(109747292707024110)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Resoluciones de Desembargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(109750471330024142)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(109747323063024111)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Oficios de Desembargo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(102328051700080640)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Proceso Excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_sql           clob;',
'   v_file_blob     blob;',
'   v_msg_error     varchar2(3200);',
'begin',
'  ',
'  v_sql := '' select FCHA_OFCIO,',
'        NMRO_RSLCION,',
'        NMRO_OFCIO,',
'        IDNTFCCION,',
'        RSPNSBLE,',
'        DRCCION_NTFCCION,',
'        VLOR_MDDA_CTLAR as VLOR_EMBRGO,',
'        pkg_gn_generalidades.fnc_number_to_text(VLOR_MDDA_CTLAR,''||chr(39)||''d''||chr(39)||'') as VLOR_LTRAS_EMBRGO',
'    from json_table( ''||chr(39)||:P63_JSON||chr(39)||'' ,''||chr(39)||''$[*]''||chr(39)||''',
'                    columns ( NMRO_OFCIO         number    path ''||chr(39)||''$.NMRO_ACTO_OFCIO''||chr(39)||'',',
'                              FCHA_OFCIO         varchar2  path ''||chr(39)||''$.FCHA_OFCIO''||chr(39)||'',  ',
'                              NMRO_RSLCION       number    path ''||chr(39)||''$.NMRO_RSLCION'' ||chr(39)||'', ',
'                              IDNTFCCION         varchar2  path ''||chr(39)||''$.IDNTFCCION''||chr(39)||'',',
'                              RSPNSBLE           varchar2  path ''||chr(39)||''$.RSPNSBLE''||chr(39)||'',',
'                              DRCCION_NTFCCION   varchar2  path ''||chr(39)||''$.DRCCION_NTFCCION''||chr(39)||'',',
'                              VLOR_MDDA_CTLAR    number    path ''||chr(39)||''$.VLOR_MDDA_CTLAR''||chr(39)||''',
'                            )  ',
'                  )'';',
'   ',
'   pkg_gn_generalidades.prc_ge_excel_sql(',
'       p_sql       => v_sql,',
'       o_file_blob => v_file_blob,',
'       o_msgerror  => v_msg_error',
'   );',
'   ',
'   if(v_msg_error is not null)then',
'       raise_application_error(-20000, v_msg_error);',
'   end if;',
'   ',
'   owa_util.mime_header(  ',
'       ''application/ms-excel'',  ',
'       false  ',
'   );',
'   ',
'   htp.p(''Content-length: '' ||sys.dbms_lob.getlength(v_file_blob) );  ',
'   htp.p(''Content-Disposition: attachment; filename="Guia_Notificacion_oficios_embargo.xlsx"'');  ',
'   htp.p(''Cache-Control: max-age=0'');',
'   owa_util.http_header_close;  ',
'   wpg_docload.download_file(v_file_blob);  ',
'   apex_application.stop_apex_engine;',
'   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(102327636316080636)
,p_process_when=>'Generar_excel'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(102327011862080630)
,p_process_sequence=>40
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_region_id=>wwv_flow_api.id(102324132986080601)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Nuevo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
);
end;
/
