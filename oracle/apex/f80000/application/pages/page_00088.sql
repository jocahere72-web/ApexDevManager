prompt --application/pages/page_00088
begin
wwv_flow_api.create_page(
 p_id=>88
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Gesti\00F3n de Medidas de Secuestre')
,p_step_title=>unistr('Gesti\00F3n de Medidas de Secuestre')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validar_sel(this_) {',
'    apex.item("btn_flujo_secuestre").hide();',
'    apex.item("btn_Cambiar_secuestre").hide();',
'    apex.item("btn_Asgnar_Fcha_Dlgncia").hide();',
'    apex.item("btn_dlgncia_scstro").hide();',
'    apex.item("btn_evidencia_diligencia_secuestre").hide();',
'    apex.item("btn_informes_secuestre").hide();',
'    apex.item("btn_evidencia_Secuestre").hide();',
'    apex.item("btn_finalizar_secuestre").hide();',
'    ',
'    var model = this_.data.model;',
'    var records = this_.data.selectedRecords;',
'  ',
'    if (records.length > 0 ){',
'        ',
'        var json = records.map(function (record) { ',
'            return { "ID_SG":  model.getValue(record, "ID_SCSTRE_GSTION").trim(),',
'                     "FCH_DL": model.getValue(record, "FCHA_DLGNCIA").trim(),',
'                     "ID_IF":  model.getValue(record, "ID_INSTNCIA_FLJO").trim(),',
'                     "DLG":    model.getValue(record, "DILIGENCIA").v,',
'                     "FNL":    model.getValue(record, "FINALIZACION").v,',
'                     "ACT":    model.getValue(record, "ACTVO").v,',
'                     "DOC":    model.getValue(record, "DOCUMENTOS").v',
'                   };',
'        });',
'        ',
'        if (json[0]["ACT"] == ''S'') {       ',
'            ',
'            $s(''P88_ID_SCSTRE_GSTION'',  json[0]["ID_SG"] );      ',
'            $s(''P88_FCHA_DLGNCIA'',  json[0]["FCH_DL"] );',
'            $s(''P88_INSTNCIA_FLJO'',  json[0]["ID_IF"] );',
'',
'            if (json[0]["FCH_DL"] == '''') {',
'                apex.item("btn_Asgnar_Fcha_Dlgncia").show();',
'                apex.item("btn_Cambiar_secuestre").show();',
'            }else{',
'                ',
'                apex.item("btn_flujo_secuestre").show();',
'                ',
'                if (json[0]["DOC"] == ''N''){',
'                    apex.item("btn_Cambiar_secuestre").show();',
'                }',
'                ',
'                if (json[0]["DOC"] == ''S'' & json[0]["DLG"] == ''N''){',
'                    apex.item("btn_dlgncia_scstro").show();',
'                }',
'                ',
'                if (json[0]["DOC"] == ''S'' &  json[0]["DLG"] == ''S''){',
'                    apex.item("btn_evidencia_diligencia_secuestre").show();',
'                    apex.item("btn_informes_secuestre").show();',
'                    apex.item("btn_evidencia_Secuestre").show();',
'                    apex.item("btn_finalizar_secuestre").show();',
'                }',
'                ',
'            }',
'            ',
'        }else{',
'            $s(''P88_ID_SCSTRE_GSTION'',  '''');',
'            $s(''P88_FCHA_DLGNCIA'',  '''');',
'            $s(''P88_INSTNCIA_FLJO'', '''' );',
'        }',
'',
'        ',
'    }',
'',
'}',
'',
'function Seleccionar_Informe() {',
'',
'    var region = apex.region("informe_secuestre");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'                             ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_IN": model.getValue(record, "ID_SCSTRE_INFRME").trim()',
'                   };',
'        });',
'         ',
'        //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        if (json.length === 1 ){            ',
'            /*if (json[0]["ID_IN"] == '''') {',
'                apex.item("btn_evidencia_Secuestre").show();',
'            }else{',
'                apex.item("btn_evidencia_Secuestre").hide();',
'            }  */          ',
'            apex.item("btn_evidencia_Secuestre").show();',
'            $s(''P88_ID_SCSTRE_INFRME'',  json[0]["ID_IN"] );//SETEAMOS EL VALOR DEL SIMU SUJETO SI SOLO HAY UNO SELECIONADO ',
'        }else {',
'            apex.item("btn_evidencia_Secuestre").hide();',
'            $s(''P88_ID_SCSTRE_INFRME'',  '''');',
'        }',
'        ',
'        return;',
'    }',
'    apex.item("btn_evidencia_Secuestre").hide();',
'',
'}',
'',
'function Seleccionar_Diligencia() {',
'',
'    var region = apex.region("Diligencia");',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'                             ',
'        //OBTENEMOS UN JSON CON LOS DATOS SELECCIONADOS QUE NO HAN SIDO PROCESADOS',
'        var json = records.map(function (record) {',
'            return { "ID_SD": model.getValue(record, "ID_SCSTRE_DLGNCIA").trim()',
'                   };',
'        });',
'         ',
'        //HABILITAMOS O DESHABILITAMOS EL BOTOM DEPENDIENDO SI HAY MAS DE UN REGISTRO SELECCIONADO',
'        if (json.length === 1 ){            ',
'            /*if (json[0]["ID_IN"] == '''') {',
'                apex.item("btn_evidencia_Secuestre").show();',
'            }else{',
'                apex.item("btn_evidencia_Secuestre").hide();',
'            }  */          ',
'            apex.item("btn_evidencia_diligencia_secuestre").show();',
'            $s(''P88_ID_SCSTRE_DLGNCIA'',  json[0]["ID_SD"] );//SETEAMOS EL VALOR DEL SIMU SUJETO SI SOLO HAY UNO SELECIONADO ',
'        }else {',
'            apex.item("btn_evidencia_diligencia_secuestre").hide();',
'            $s(''P88_ID_SCSTRE_DLGNCIA'',  '''');',
'        }',
'        ',
'        return;',
'    }',
'    apex.item("btn_evidencia_diligencia_secuestre").hide();',
'',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//validar_sel();',
'//Seleccionar_Informe();',
'//Seleccionar_Diligencia();'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17445683081942948)
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210811094449'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113041258560147721)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17345839561919369)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113041382150147722)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
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
unistr('Funcionalidad que permite gestionar los causales de finalizaci\00F3n o anulaci\00F3n de una medida de secuestre.<br><br>'),
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113043248514147741)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(114029675028954321)
,p_plug_name=>'Tab_secuestre'
,p_region_name=>'tab_secuestre'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113041445801147723)
,p_plug_name=>'Medidas de Secuestre'
,p_region_name=>'medida_secuestre'
,p_parent_plug_id=>wwv_flow_api.id(114029675028954321)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.cdgo_clnte,',
'        a.id_scstre_gstion,',
'        a.id_scstre,',
'        a.id_scstrs_auxlr,',
'        a.id_slctd_ofcio,',
'        a.id_instncia_fljo,',
'        to_char(a.fcha_scstre,''dd/mm/yyyy'') as fcha_scstre,',
'        a.nmro_acto_ofcio,',
'        a.nmro_rslcion_emb,',
'        to_char(a.fcha_dlgncia,''dd/mm/yyyy'') as fcha_dlgncia,',
'        a.nombre_secuestre,',
'        a.nombre_aux_secuestre,',
'        a.actvo,',
'        (select case when count(d.id_scstre_dcmnto) > 0 then ''S'' else ''N'' end as documentos',
'           from mc_g_secuestre_documentos d',
'          where d.id_scstre_gstion = a.id_scstre_gstion',
'            and d.id_acto is not null) as documentos,',
'        (select case when count(b.id_scstre_dlgncia) > 0 then ''S'' else ''N'' end as diligencia',
'           from mc_g_secuestre_diligencia b',
'          where b.id_scstre_gstion = a.id_scstre_gstion) as diligencia,',
'        (select case when count(c.id_scstre_fnlzcion) > 0 then ''S'' else ''N'' end as finalizacion',
'           from mc_g_secuestre_finalizacion c',
'          where c.id_scstre_gstion = a.id_scstre_gstion) as finalizacion',
' from v_mc_g_secuestre_gestion a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and (:P88_NMRO_ACTO_OFCIO is null or a.nmro_acto_ofcio = :P88_NMRO_ACTO_OFCIO)',
'  and (:P88_NMRO_RSLCION_EMB is null or a.nmro_rslcion_emb =  :P88_NMRO_RSLCION_EMB)',
'  and (:P88_FCHA_SCSTRE is null or TRUNC(a.fcha_scstre) = TRUNC(TO_DATE(:P88_FCHA_SCSTRE,''DD/MM/YYYY'')))',
'  and (:P88_ACTIVO is null or a.actvo = :P88_ACTIVO)',
'  /*and a.actvo = ''S''*/;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(59067961643143201)
,p_name=>'DOCUMENTOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENTOS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFDocumentos?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(113041614712147725)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(113041742441147726)
,p_name=>'ID_SCSTRE_GSTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRE_GSTION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113041826128147727)
,p_name=>'ID_SCSTRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRE'
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
 p_id=>wwv_flow_api.id(113041937408147728)
,p_name=>'ID_SCSTRS_AUXLR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRS_AUXLR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(113042040334147729)
,p_name=>'ID_SLCTD_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTD_OFCIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(113042154578147730)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(113042219643147731)
,p_name=>'FCHA_SCSTRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_SCSTRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Registro<br> de Medida'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113042391267147732)
,p_name=>'NMRO_ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Oficio de <br>Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113042442504147733)
,p_name=>'NMRO_RSLCION_EMB'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RSLCION_EMB'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Resoluci\00F3n  de<br> Embargo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113042555520147734)
,p_name=>'FCHA_DLGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DLGNCIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de Realizaci\00F3n <br> de Diligencia ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(113042661796147735)
,p_name=>'NOMBRE_SECUESTRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_SECUESTRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Secuestre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113042744948147736)
,p_name=>'NOMBRE_AUX_SECUESTRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_AUX_SECUESTRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Auxiliar de <br>Secuestre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113042835453147737)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114030124070954326)
,p_name=>'DILIGENCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DILIGENCIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFDiligencia?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114030244049954327)
,p_name=>'FINALIZACION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FINALIZACION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFFinalizaci\00F3n?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115465072165781416)
,p_name=>'VER_DILIGENCIA'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'        <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0"> Ver Diligencia <span class="fa fa-eye"></span>',
'        </button>',
'      </center>'))
,p_link_target=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:RP,102:P102_ID_SCSTRE_GSTION:&ID_SCSTRE_GSTION.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115638116679722901)
,p_name=>'VER_INFORME'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'        <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0"> Ver Informes <span class="fa fa-eye"></span>',
'        </button>',
'      </center>'))
,p_link_target=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:RP,103:P103_ID_SCSTRE_GSTION:&ID_SCSTRE_GSTION.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(113041579412147724)
,p_internal_uid=>113041579412147724
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(113178907281282675)
,p_interactive_grid_id=>wwv_flow_api.id(113041579412147724)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(113179029375282675)
,p_report_id=>wwv_flow_api.id(113178907281282675)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(59073952390143397)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(59067961643143201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113179593866282679)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(113041614712147725)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113180076393282682)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(113041742441147726)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113180586519282683)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(113041826128147727)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113181022286282685)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(113041937408147728)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113181548134282686)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(113042040334147729)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113182011063282687)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(113042154578147730)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113182575408282688)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(113042219643147731)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>118
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113183029843282691)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(113042391267147732)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>101
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113183500143282693)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(113042442504147733)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113184003581282695)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(113042555520147734)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>140
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113184507779282696)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(113042661796147735)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113185054879282700)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(113042744948147736)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113185575844282702)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(113042835453147737)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114731319392047048)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(114030124070954326)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114731857255047051)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(114030244049954327)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115488978661884157)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(115465072165781416)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115643412731729852)
,p_view_id=>wwv_flow_api.id(113179029375282675)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(115638116679722901)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113874546005361821)
,p_plug_name=>'Informes de Medida de Secuestre'
,p_region_name=>'informe_secuestre'
,p_parent_plug_id=>wwv_flow_api.id(114029675028954321)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_SCSTRE_INFRME,',
'       ID_SCSTRE_GSTION,',
'       FCHA_RGSTRO,',
'       OBSRVCION,',
'       ID_FNCNRIO',
'  from MC_G_SECUESTRE_INFORME;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(113041445801147723)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113874896494361824)
,p_name=>'ID_SCSTRE_INFRME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRE_INFRME'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113874976711361825)
,p_name=>'ID_SCSTRE_GSTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRE_GSTION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(113041742441147726)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113875040851361826)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113875105684361827)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(113875226995361828)
,p_name=>'ID_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FNCNRIO'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(113874774953361823)
,p_internal_uid=>113874774953361823
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(113925093121926407)
,p_interactive_grid_id=>wwv_flow_api.id(113874774953361823)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(113925117747926407)
,p_report_id=>wwv_flow_api.id(113925093121926407)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113926252790926410)
,p_view_id=>wwv_flow_api.id(113925117747926407)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(113874896494361824)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113926769757926412)
,p_view_id=>wwv_flow_api.id(113925117747926407)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(113874976711361825)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113927250025926413)
,p_view_id=>wwv_flow_api.id(113925117747926407)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(113875040851361826)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113927792669926414)
,p_view_id=>wwv_flow_api.id(113925117747926407)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(113875105684361827)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113928286624926416)
,p_view_id=>wwv_flow_api.id(113925117747926407)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(113875226995361828)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113874645745361822)
,p_plug_name=>'Evidencias de Informe'
,p_region_name=>'evidencias_informe'
,p_parent_plug_id=>wwv_flow_api.id(114029675028954321)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_SCSTR_INFRME_ARCHVS,',
'       ID_SCSTRE_INFRME,',
'       FCHA_INGRSO,',
'       --BLOB_INFRME,',
'       FILENAME_INFRME,',
'       MIME_TYPE_INFRME',
'  from MC_G_SCSTR_INFRME_ARCHVS'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(113874546005361821)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113875478179361830)
,p_name=>'ID_SCSTR_INFRME_ARCHVS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTR_INFRME_ARCHVS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113875573343361831)
,p_name=>'ID_SCSTRE_INFRME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRE_INFRME'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(113874896494361824)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(113875612763361832)
,p_name=>'FCHA_INGRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INGRSO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_api.id(113875782391361833)
,p_name=>'FILENAME_INFRME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILENAME_INFRME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Archivo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(113875810908361834)
,p_name=>'MIME_TYPE_INFRME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MIME_TYPE_INFRME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(115340458034655101)
,p_name=>'visor'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'        <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver Archivo <span class="fa fa-eye"></span>',
'        </button>',
'      </center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:mc_g_scstr_infrme_archvs,blob_infrme,filename_infrme,mime_type_infrme,id_scstr_infrme_archvs,&I'
||'D_SCSTR_INFRME_ARCHVS.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(113875366285361829)
,p_internal_uid=>113875366285361829
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(113925657681926408)
,p_interactive_grid_id=>wwv_flow_api.id(113875366285361829)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(113925750293926408)
,p_report_id=>wwv_flow_api.id(113925657681926408)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113928768883926417)
,p_view_id=>wwv_flow_api.id(113925750293926408)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(113875478179361830)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113929249609926418)
,p_view_id=>wwv_flow_api.id(113925750293926408)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(113875573343361831)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113929757135926421)
,p_view_id=>wwv_flow_api.id(113925750293926408)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(113875612763361832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113930206139926422)
,p_view_id=>wwv_flow_api.id(113925750293926408)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(113875782391361833)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113930710728926425)
,p_view_id=>wwv_flow_api.id(113925750293926408)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(113875810908361834)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115349736809673878)
,p_view_id=>wwv_flow_api.id(113925750293926408)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(115340458034655101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113876980156361845)
,p_plug_name=>'Diligencia de Secuestre'
,p_region_name=>'Diligencia'
,p_parent_plug_id=>wwv_flow_api.id(114029675028954321)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_scstre_dlgncia,',
'        id_scstre_gstion,',
'        fcha_dlgncia,',
'        idntfccion_dpstrio,',
'        nmbre_dpstrio,',
'        obsrvcion,',
'        hnrrios_scstre',
'from mc_g_secuestre_diligencia'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(113041445801147723)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114027721300954302)
,p_name=>'ID_SCSTRE_DLGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRE_DLGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114027854048954303)
,p_name=>'ID_SCSTRE_GSTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRE_GSTION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(113041742441147726)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114028061847954305)
,p_name=>'FCHA_DLGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DLGNCIA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de <br>Diligencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_api.id(114028142905954306)
,p_name=>'IDNTFCCION_DPSTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DPSTRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Identificaci\00F3n de<br> Depositario')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114028271052954307)
,p_name=>'NMBRE_DPSTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DPSTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nombre de<br>Depositario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(114028366175954308)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_api.id(114028470573954309)
,p_name=>'HNRRIOS_SCSTRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HNRRIOS_SCSTRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Honorarios <br>de secuestre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(114027634176954301)
,p_internal_uid=>114027634176954301
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No hay diligencias disponibles'
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
 p_id=>wwv_flow_api.id(114037619984971475)
,p_interactive_grid_id=>wwv_flow_api.id(114027634176954301)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(114037734987971475)
,p_report_id=>wwv_flow_api.id(114037619984971475)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114038260318971477)
,p_view_id=>wwv_flow_api.id(114037734987971475)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(114027721300954302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114038729559971483)
,p_view_id=>wwv_flow_api.id(114037734987971475)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(114027854048954303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114039770232971486)
,p_view_id=>wwv_flow_api.id(114037734987971475)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(114028061847954305)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114040251783971488)
,p_view_id=>wwv_flow_api.id(114037734987971475)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(114028142905954306)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114040759438971489)
,p_view_id=>wwv_flow_api.id(114037734987971475)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(114028271052954307)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>157
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114041233491971490)
,p_view_id=>wwv_flow_api.id(114037734987971475)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(114028366175954308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114041769669971491)
,p_view_id=>wwv_flow_api.id(114037734987971475)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(114028470573954309)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113877064955361846)
,p_plug_name=>'Evidencias de Diligencia'
,p_region_name=>'evidencias_diligencia'
,p_parent_plug_id=>wwv_flow_api.id(114029675028954321)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_scstr_dlgncia_archvs,',
'        id_scstre_dlgncia,',
'        fcha_ingrso,',
'        filename_dlgncia',
'from mc_g_scstr_dlgncia_archvs'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(113876980156361845)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114028629739954311)
,p_name=>'ID_SCSTR_DLGNCIA_ARCHVS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTR_DLGNCIA_ARCHVS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114028796390954312)
,p_name=>'ID_SCSTRE_DLGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRE_DLGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(114027721300954302)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114028840426954313)
,p_name=>'FCHA_INGRSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INGRSO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_api.id(114028952330954314)
,p_name=>'FILENAME_DLGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILENAME_DLGNCIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Archivo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(115340538108655102)
,p_name=>'visor'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'        <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver Archivo <span class="fa fa-eye"></span>',
'        </button>',
'      </center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:mc_g_scstr_dlgncia_archvs,blob_dlgncia,filename_dlgncia,mime_type_dlgncia,id_scstr_dlgncia_arch'
||'vs,&ID_SCSTR_DLGNCIA_ARCHVS.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(114028521163954310)
,p_internal_uid=>114028521163954310
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(114044730427991218)
,p_interactive_grid_id=>wwv_flow_api.id(114028521163954310)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(114044831760991218)
,p_report_id=>wwv_flow_api.id(114044730427991218)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114045384128991219)
,p_view_id=>wwv_flow_api.id(114044831760991218)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(114028629739954311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114045865015991220)
,p_view_id=>wwv_flow_api.id(114044831760991218)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(114028796390954312)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114046316206991222)
,p_view_id=>wwv_flow_api.id(114044831760991218)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(114028840426954313)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>172
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114046879498991226)
,p_view_id=>wwv_flow_api.id(114044831760991218)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(114028952330954314)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115351818598697635)
,p_view_id=>wwv_flow_api.id(114044831760991218)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(115340538108655102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115265028499940301)
,p_plug_name=>'Actos de Medida de Secuestre'
,p_region_name=>'actos_secuestre'
,p_parent_plug_id=>wwv_flow_api.id(114029675028954321)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_scstre_dcmnto,a.id_scstre_gstion,a.id_acto,a.nmro_acto,a.fcha_acto,b.dscrpcion as tipo_de_acto',
'from mc_g_secuestre_documentos a',
'inner join gn_d_actos_tipo b on b.id_acto_tpo = a.id_acto_tpo'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(113041445801147723)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115265266508940303)
,p_name=>'ID_SCSTRE_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRE_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115265349103940304)
,p_name=>'ID_SCSTRE_GSTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SCSTRE_GSTION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(113041742441147726)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115265497765940305)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(115265561143940306)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero de Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(115265623958940307)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_api.id(115265735842940308)
,p_name=>'TIPO_DE_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_DE_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo De Acto'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(115295875486233602)
,p_name=>'pdf'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'        <button style="color:blue;" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver PDF <span class="fa fa-eye"></span>',
'        </button>',
'      </center>'))
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:gn_g_actos,file_blob,file_name,file_mimetype,id_acto,&ID_ACTO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(115265108060940302)
,p_internal_uid=>115265108060940302
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
end;
/
begin
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(115286248392140572)
,p_interactive_grid_id=>wwv_flow_api.id(115265108060940302)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(115286396841140573)
,p_report_id=>wwv_flow_api.id(115286248392140572)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115286804765140577)
,p_view_id=>wwv_flow_api.id(115286396841140573)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(115265266508940303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115287355112140580)
,p_view_id=>wwv_flow_api.id(115286396841140573)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(115265349103940304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115287875573140582)
,p_view_id=>wwv_flow_api.id(115286396841140573)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(115265497765940305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115288363481140583)
,p_view_id=>wwv_flow_api.id(115286396841140573)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(115265561143940306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115288840090140584)
,p_view_id=>wwv_flow_api.id(115286396841140573)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(115265623958940307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115289322073140585)
,p_view_id=>wwv_flow_api.id(115286396841140573)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(115265735842940308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115304785853249525)
,p_view_id=>wwv_flow_api.id(115286396841140573)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(115295875486233602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113538332463471716)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(113041258560147721)
,p_button_name=>'btn_consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113364522623389901)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(113043248514147741)
,p_button_name=>'btn_flujo_secuestre'
,p_button_static_id=>'btn_flujo_secuestre'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Generaci\00F3n de Actos<br> de Secuestre')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-box-arrow-in-ne'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113043668214147745)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(113043248514147741)
,p_button_name=>'btn_Asgnar_Fcha_Dlgncia'
,p_button_static_id=>'btn_Asgnar_Fcha_Dlgncia'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Asignar Fecha para <br>Diligencia de Secuestre'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-calendar-edit'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113872945158361805)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(113043248514147741)
,p_button_name=>'btn_Cambiar_secuestre'
,p_button_static_id=>'btn_Cambiar_secuestre'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Cambiar Secuestre y/o <br>auxiliar de secuestre'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-dynamic-content'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113043322167147742)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(113043248514147741)
,p_button_name=>'btn_dlgncia_scstro'
,p_button_static_id=>'btn_dlgncia_scstro'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Registrar Diligencia <br> de Secuestro'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(114029033704954315)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(113043248514147741)
,p_button_name=>'btn_evidencia_diligencia_secuestre'
,p_button_static_id=>'btn_evidencia_diligencia_secuestre'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Evidencia de Diligencia<br> de Secuestre'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-dynamic-content'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113873934490361815)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(113043248514147741)
,p_button_name=>'btn_informes_secuestre'
,p_button_static_id=>'btn_informes_secuestre'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Informes Secuestre'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-clipboard-list'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113876123838361837)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(113043248514147741)
,p_button_name=>'btn_evidencia_Secuestre'
,p_button_static_id=>'btn_evidencia_Secuestre'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Evidencia de Informe <br>de Secuestre'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-dynamic-content'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(114029880825954323)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(113043248514147741)
,p_button_name=>'btn_finalizar_secuestre'
,p_button_static_id=>'btn_finalizar_secuestre'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Finalizar Medida <br>de Secuestre'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113043402382147743)
,p_branch_name=>unistr('Ir a P\00E1gina 90')
,p_branch_action=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:RP,90:P90_ID_SCSTRE_GSTION:&P88_ID_SCSTRE_GSTION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113043322167147742)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113250710541065812)
,p_branch_action=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.:RP,92:P92_ID_SCSTRE_GSTION:&P88_ID_SCSTRE_GSTION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113043668214147745)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113364966398389905)
,p_branch_name=>unistr('Ir a P\00E1gina 89')
,p_branch_action=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP,89:P89_ID_INSTNCIA_FLJO,P89_ID_SCSTRE_GSTION:&P88_INSTNCIA_FLJO.,&P88_ID_SCSTRE_GSTION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113364522623389901)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113873792092361813)
,p_branch_name=>unistr('Ir a P\00E1gina 86')
,p_branch_action=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP,86:P86_ID_SCSTRE_GSTION:&P88_ID_SCSTRE_GSTION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113872945158361805)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113874088548361816)
,p_branch_name=>unistr('Ir a P\00E1gina 95')
,p_branch_action=>'f?p=&APP_ID.:96:&SESSION.::&DEBUG.:RP,96:P96_ID_SCSTRE_GSTION:&P88_ID_SCSTRE_GSTION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113873934490361815)
,p_branch_sequence=>50
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113876296348361838)
,p_branch_name=>unistr('Ir a P\00E1gina 97')
,p_branch_action=>'f?p=&APP_ID.:97:&SESSION.::&DEBUG.:RP,97:P97_ID_SCSTRE_GSTION:&P88_ID_SCSTRE_GSTION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113876123838361837)
,p_branch_sequence=>60
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(114029205830954317)
,p_branch_name=>unistr('Ir a P\00E1gina 98')
,p_branch_action=>'f?p=&APP_ID.:98:&SESSION.::&DEBUG.:RP,98:P98_ID_SCSTRE_GSTION:&P88_ID_SCSTRE_GSTION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(114029033704954315)
,p_branch_sequence=>70
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(114029974943954324)
,p_branch_name=>unistr('Ir a P\00E1gina 99')
,p_branch_action=>'f?p=&APP_ID.:99:&SESSION.::&DEBUG.:RP,99:P99_ID_SCSTRE_GSTION:&P88_ID_SCSTRE_GSTION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(114029880825954323)
,p_branch_sequence=>80
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(114030792476954332)
,p_branch_name=>'ir a flujo'
,p_branch_action=>' declare '||wwv_flow.LF||
' v_id_fljo_trea number;'||wwv_flow.LF||
' v_id_instncia_fljo number := :P88_INSTNCIA_FLJO;'||wwv_flow.LF||
' v_url varchar2(4000);'||wwv_flow.LF||
' begin                   '||wwv_flow.LF||
'      select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) '||wwv_flow.LF||
'        into v_id_fljo_trea'||wwv_flow.LF||
'        from wf_g_instancias_transicion '||wwv_flow.LF||
'       where id_instncia_fljo = v_id_instncia_fljo;'||wwv_flow.LF||
'       '||wwv_flow.LF||
'       apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );'||wwv_flow.LF||
'       apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	'||wwv_flow.LF||
'       v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,'||wwv_flow.LF||
'                                                     p_id_fljo_trea     => v_id_fljo_trea,'||wwv_flow.LF||
'                                                     p_clear_session    => ''S'');'||wwv_flow.LF||
'        return  v_url;                                            '||wwv_flow.LF||
''||wwv_flow.LF||
'  exception '||wwv_flow.LF||
'      when others  then'||wwv_flow.LF||
'        return ''#'';   '||wwv_flow.LF||
'  end;'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_when_button_id=>wwv_flow_api.id(113364522623389901)
,p_branch_sequence=>90
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113042986784147738)
,p_name=>'P88_ID_SCSTRE_GSTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(113041258560147721)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113251076650065815)
,p_name=>'P88_FCHA_DLGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(113041258560147721)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113251455600065819)
,p_name=>'P88_NMRO_ACTO_OFCIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(113041258560147721)
,p_prompt=>'Oficio de Embargo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el numero del oficio de embargo.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113251562856065820)
,p_name=>'P88_NMRO_RSLCION_EMB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(113041258560147721)
,p_prompt=>unistr('Resoluci\00F3n de Embargo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el numero de la resoluci\00F3n de embargo para consultar por este par\00E1metro.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113251664725065821)
,p_name=>'P88_FCHA_SCSTRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(113041258560147721)
,p_prompt=>'Fecha de Registro de Secuestre'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la fecha en que fue registrada la medida de  secuestre.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113364873238389904)
,p_name=>'P88_INSTNCIA_FLJO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(113041258560147721)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113876399711361839)
,p_name=>'P88_ID_SCSTRE_INFRME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(113041258560147721)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114029375990954318)
,p_name=>'P88_ID_SCSTRE_DLGNCIA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(113041258560147721)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115340738292655104)
,p_name=>'P88_ACTIVO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(113041258560147721)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'indique si la medida de secuestre se encuentra activa.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113043084890147739)
,p_name=>'Al seleccionar un registro'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(113041445801147723)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113043173293147740)
,p_event_id=>wwv_flow_api.id(113043084890147739)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validar_sel(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113876485983361840)
,p_name=>'Al seleccionar un registro de informe'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(113874546005361821)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113876521882361841)
,p_event_id=>wwv_flow_api.id(113876485983361840)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Seleccionar_Informe();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(114029419004954319)
,p_name=>'Al seleccionar registro de diligencia'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(113876980156361845)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(114029575556954320)
,p_event_id=>wwv_flow_api.id(114029419004954319)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Seleccionar_Diligencia();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(115244370207791701)
,p_name=>'Nuevo'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(113364522623389901)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(115244447808791702)
,p_event_id=>wwv_flow_api.id(115244370207791701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.localStorage.clear();',
'apex.submit({request:''btn_flujo_secuestre''});'))
,p_stop_execution_on_error=>'Y'
);
end;
/
