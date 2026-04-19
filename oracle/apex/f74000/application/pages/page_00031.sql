prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Generar Sanci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Sanci\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonConcepto(){',
'    ',
'    var region = apex.region(''conceptos'');',
'    ',
'    if(region){',
'        ',
'        var view = apex.region("conceptos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;',
'        ',
'        var jsonconceptos = records.map((concepto) => {',
'            return {"cncpto" : model.getValue(concepto, "ID_CNCPTO"),',
'                    "vgncia" : model.getValue(concepto, "VGNCIA"),',
'                    "id_prdo" : model.getValue(concepto, "ID_PRDO"),',
'                    "bse" : model.getValue(concepto,  "BASE"),//.trim().replace(/\./g, ""),',
'                    "prdo" : model.getValue(concepto,  "PRDO"),',
'                    "id_impsto_acto_cncpto" : model.getValue(concepto,  "ID_IMPSTO_ACTO_CNCPTO"),',
'                    "id_impsto" : model.getValue(concepto,  "ID_IMPSTO"),',
'                    "id_impsto_sbmpsto" : model.getValue(concepto,  "ID_IMPSTO_SBMPSTO"),',
'                    "id_sjto_impsto" : model.getValue(concepto,  "ID_SJTO_IMPSTO"),',
'                    "orden" : model.getValue(concepto,  "ORDEN"),',
'                    "id_cnddto_vgncia" : model.getValue(concepto,  "ID_CNDDTO_VGNCIA"),',
'                    //"id_tp_bs_sncn_dcl_vgn_frm" : model.getValue(concepto,  "ID_TP_BS_SNCN_DCL_VGN_FRM") ? model.getValue(concepto,  "ID_TP_BS_SNCN_DCL_VGN_FRM").v : model.getValue(concepto,  "ID_TP_BS_SNCN_DCL_VGN_FRM_1").v,',
'					',
'                    /*"id_tp_bs_sncn_dcl_vgn_frm": (model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM") && model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM").v) ? model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM").v ',
'                                               : ((model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_1") && model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_1").v) ? model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_1").v ',
'                                               : ((model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_2") && model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_2").v) ? model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_2").v',
'                                               : (model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_3") ? model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_3").v : null)),*/',
'                    ',
'                    /*"id_tp_bs_sncn_dcl_vgn_frm" : model.getValue(concepto,  "ID_TP_BS_SNCN_DCL_VGN_FRM_1") ? model.getValue(concepto,  "ID_TP_BS_SNCN_DCL_VGN_FRM_1")',
'                                                                                                           : model.getValue(concepto,  "ID_TP_BS_SNCN_DCL_VGN_FRM_2")',
'                                                                                                           ? model.getValue(concepto,  "ID_TP_BS_SNCN_DCL_VGN_FRM_2") ',
'                                                                                                           : model.getValue(concepto,  "ID_TP_BS_SNCN_DCL_VGN_FRM_3"),*/',
'                    ',
'                    "id_tp_bs_sncn_dcl_vgn_frm": model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM")?.v/* || ',
'                                                 model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_1")?.v || ',
'                                                 model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_2")?.v || ',
'                                                 model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_3")?.v || ',
'                                                 null*/,',
'                    "vlor_trfa" : model.getValue(concepto,  "VLOR_TRFA"),',
'                    "dvsor_trfa" : model.getValue(concepto,  "DVSOR_TRFA"),',
'                    "cdgo_indcdor_tpo" : model.getValue(concepto,  "CDGO_INDCDOR_TPO"),',
'                    "vlor_trfa_clcldo" : model.getValue(concepto,  "VLOR_TRFA_CLCLDO"),                    ',
'                    "vlor_cdgo_indcdor_tpo" : model.getValue(concepto,  "VLOR_CDGO_INDCDOT_TPO"),',
'                    "exprsion_rdndeo" : model.getValue(concepto,  "EXPRSION_RDNDEO"),',
'                    "vlor_lqdcion_mnma" : model.getValue(concepto,  "VLOR_LQDCION_MNMA"),',
'                    "nmro_mses" : model.getValue(concepto,  "NMRO_MSES")',
'                   };',
'        });',
'        ',
'        var id_concepto = apex.item( "P31_ID_IMPSTO_ACTO" ).getValue();',
'         console.log(id_concepto);',
'        window.localStorage.setItem(''jsonconceptos'', JSON.stringify(jsonconceptos));',
'        ',
'        var conceptos = JSON.parse(window.localStorage.jsonconceptos)',
'        ',
'        return conceptos.filter(e => e.id_tp_bs_sncn_dcl_vgn_frm === "" || e.bse == 0).length',
'        ',
'    }',
'    ',
'}',
'',
'function ingresoBrutos() {',
'',
'    var regionCartera = apex.region("conceptos");',
'    ',
'    if (regionCartera) {',
'        ',
'        var view = apex.region("conceptos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'       ',
'        $s(''P31_DCLRCION_VGNCIA_FRMLRIO'', model.getValue(records[0], "ID_DCLRCION_VGNCIA_FRMLRIO"));',
'        $s(''P31_ID_PRDO'', model.getValue(records[0], "ID_PRDO"));',
'        ',
'        apex.server.process("IngresosBrutos", {',
'            pageItems: "#P31_DCLRCION_VGNCIA_FRMLRIO, #P31_ID_SJTO_IMPSTO, #P31_ID_TPO_BSE_SNCION, #P31_ID_PRDO"',
'        },{',
'            success: function(data) {',
'                    console.log(data.ingrso_brto);',
'                if(data.o_cdgo_rspsta > 0) {',
'                    console.log(data.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    data.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
'                    model.setValue(records[0], "BASE", data.ingrso_brto)//formatoNumero(data.ingrso_brto,{decimal:'','',thousand:''.'',precision:0}))',
'                }',
'            }',
'        }',
'        ',
'    )',
'    ',
'    }',
'',
'}',
'',
'function ingresoNetos() {',
'',
'    var regionCartera = apex.region("conceptos");',
'    ',
'    if (regionCartera) {',
'        ',
'        var view = apex.region("conceptos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'       ',
'        $s(''P31_DCLRCION_VGNCIA_FRMLRIO'', model.getValue(records[0], "ID_DCLRCION_VGNCIA_FRMLRIO"));',
'        $s(''P31_ID_PRDO'', model.getValue(records[0], "ID_PRDO"));',
'        ',
'        apex.server.process("IngresosNetos", {',
'            pageItems: "#P31_DCLRCION_VGNCIA_FRMLRIO, #P31_ID_SJTO_IMPSTO, #P31_ID_TPO_BSE_SNCION, #P31_ID_PRDO"',
'        },{',
'            success: function(data) {',
'                if(data.o_cdgo_rspsta > 0) {',
'                    console.log(data.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    data.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
'                    model.setValue(records[0], "BASE", data.ingrso_neto)//formatoNumero(data.ingrso_neto,{decimal:'','',thousand:''.'',precision:0}))',
'                }',
'            }',
'        }',
'    )',
'    }',
'}',
'',
'function impuestoCargo() {',
'',
'    var regionCartera = apex.region("conceptos");',
'    ',
'    if (regionCartera) {',
'        ',
'        var view = apex.region("conceptos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'       ',
'        $s(''P31_DCLRCION_VGNCIA_FRMLRIO'', model.getValue(records[0], "ID_DCLRCION_VGNCIA_FRMLRIO"));',
'        $s(''P31_ID_PRDO'', model.getValue(records[0], "ID_PRDO"));',
'        ',
'        apex.server.process("ImpuestoCargo", {',
'            pageItems: "#P31_DCLRCION_VGNCIA_FRMLRIO, #P31_ID_SJTO_IMPSTO, #P31_ID_TPO_BSE_SNCION, #P31_ID_PRDO"',
'        },{',
'            success: function(data) {',
'                if(data.o_cdgo_rspsta > 0) {',
'                    console.log(data.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    data.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
'                    model.setValue(records[0], "BASE", data.impsto_crgo)//formatoNumero(data.impsto_crgo,{decimal:'','',thousand:''.'',precision:0}))',
'                }',
'            }',
'        }',
'    )',
'    }',
'}',
'',
'function calculoSancion() {',
'',
'    var regionCartera = apex.region("conceptos");',
'    ',
'    if (regionCartera) {',
'        ',
'        var view = apex.region("conceptos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'       ',
'        $s(''P31_DCLRCION_VGNCIA_FRMLRIO'', model.getValue(records[0], "ID_DCLRCION_VGNCIA_FRMLRIO"));',
'        $s(''P31_ID_PRDO'', model.getValue(records[0], "ID_PRDO"));',
'        ',
'        apex.server.process("CalculoSancion", {',
'            pageItems: "#P31_DCLRCION_VGNCIA_FRMLRIO, #P31_ID_SJTO_IMPSTO, #P31_ID_TPO_BSE_SNCION, #P31_ID_PRDO"',
'        },{',
'            success: function(data) {',
'                if(data.o_cdgo_rspsta > 0) {',
'                    console.log(data.o_cdgo_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    data.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
'                    model.setValue(records[0], "BASE", data.clclo_sncion)//formatoNumero(data.clclo_sncion,{decimal:'','',thousand:''.'',precision:0}))',
'                }',
'            }',
'        }',
'    )',
'    }',
'}',
'',
'',
'function calculaBase() {',
'    ',
'    var valorItem = apex.item(''P31_CDGO_TPO_BSE_SNCION'').getValue();',
'    ',
'        if (valorItem === ''IBD'') {',
'            ingresoBrutos();',
'        }else if(valorItem === ''INNE'') {',
'            ingresoNetos();',
'        }else if(valorItem === ''IMCA'') {',
'            impuestoCargo();',
'        }else if(valorItem === ''CSAN'') {',
'            calculoSancion();',
'        }',
'}',
'                            '))
,p_step_template=>wwv_flow_api.id(36468753189968632)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'95%'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241118154632'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61185788474861802)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61197057730118601)
,p_plug_name=>'Conceptos'
,p_region_name=>'conceptos'
,p_parent_plug_id=>wwv_flow_api.id(61185788474861802)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rownum,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.id_sjto_impsto,',
'       b.id_cnddto_vgncia,',
'       b.vgncia,',
'       b.id_dclrcion_vgncia_frmlrio,',
'       d.prdo,',
'       b.id_prdo,',
'       c.id_cncpto,',
'       c.id_impsto_acto_cncpto,',
'       e.dscrpcion,',
'       c.orden, ',
'       0 base,',
'       f.vlor_trfa,',
'       f.dvsor_trfa,',
'       f.cdgo_indcdor_tpo,',
'       nvl(f.vlor_cdgo_indcdor_tpo,0) vlor_cdgo_indcdor_tpo,',
'       f.vlor_trfa_clcldo,',
'       f.exprsion_rdndeo,',
'       f.vlor_lqdcion_mnma,',
'       ceil( months_between(',
'                                    trunc(systimestamp),',
'                                    trunc(',
'                                            pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion (p_id_dclrcion_vgncia_frmlrio=>  b.id_dclrcion_vgncia_frmlrio,',
'                                                                                            p_idntfccion                =>  h.idntfccion_sjto,',
'                                                                                            p_id_sjto_tpo               =>  g.id_sjto_tpo)',
'                                         )',
'                                  )) nmro_mses',
'from fi_g_candidatos                a',
'join fi_g_candidatos_vigencia       b   on  a.id_cnddto =   b.id_cnddto',
'join df_i_impuestos_acto_concepto   c   on  b.vgncia    =   c.vgncia',
'                                        and b.id_prdo   =   c.id_prdo',
'join df_i_periodos                  d   on  b.id_prdo   =   d.id_prdo                                        ',
'join df_i_conceptos                 e   on  c.id_cncpto =   e.id_cncpto',
'/*join v_gi_d_tarifas_esquema         f   on  (f.id_impsto_acto_cncpto = c.id_impsto_acto_cncpto and',
'                                            f.id_tp_bs_sncn_dcl_vgn_frm is null)',
'                                            or (f.id_impsto_acto_cncpto = c.id_impsto_acto_cncpto and',
'                                            f.id_tp_bs_sncn_dcl_vgn_frm = null)*/',
'join v_gi_d_tarifas_esquema         f   on  (f.id_impsto_acto_cncpto = c.id_impsto_acto_cncpto and f.id_tp_bs_sncn_dcl_vgn_frm is null or',
'                                             f.id_impsto_acto_cncpto = c.id_impsto_acto_cncpto and f.id_tp_bs_sncn_dcl_vgn_frm = null)',
'                                        and (f.cdgo_indcdor_tpo is not null and ((f.indcdor_ecnmco_actual = ''N'' and b.vgncia between extract(year from f.fcha_dsde_cdgo_indcdor_tpo) and extract(year from f.fcha_hsta_cdgo_indcdor_tpo))',
'                                                                              or (f.indcdor_ecnmco_actual = ''S'' and extract (year from sysdate) between extract(year from f.fcha_dsde_cdgo_indcdor_tpo) and extract(year from f.fcha_hsta_cdgo_indcdor_tpo'
||') and rownum = 1))',
'                                          or f.cdgo_indcdor_tpo is null)',
'                                              ',
'                                        and (f.cdgo_indcdor_tpo_lqdccion is not null and ((f.indcdor_ecnmco_actual = ''N'' and b.vgncia between extract(year from f.fcha_dsde_cdgo_indcdor_tpo_lqd) and extract(year from f.fcha_hsta_cdgo_indcdor_tpo_lqd))',
'                                                                                       or (f.indcdor_ecnmco_actual = ''S'' and extract (year from sysdate) between extract(year from f.fcha_dsde_cdgo_indcdor_tpo_lqd) and extract(year from f.fcha_hsta_cdg'
||'o_indcdor_tpo_lqd) and rownum = 1))',
'                                          or f.cdgo_indcdor_tpo_lqdccion is null)',
'                                              ',
'                                        and (f.cdgo_indcdor_tpo_bse is not null and ((f.indcdor_ecnmco_actual = ''N'' and b.vgncia between extract(year from f.fcha_dsde_cdgo_indcdor_tpo_bse) and extract(year from f.fcha_hsta_cdgo_indcdor_tpo_bse))',
'                                                                                  or (f.indcdor_ecnmco_actual = ''S'' and extract (year from sysdate) between extract(year from f.fcha_dsde_cdgo_indcdor_tpo_bse) and extract(year from f.fcha_hsta_cdgo_ind'
||'cdor_tpo_bse) and rownum = 1))',
'                                          or f.cdgo_indcdor_tpo_bse is null)',
'join v_si_i_sujetos_impuesto        h   on  a.id_sjto_impsto     =  h.id_sjto_impsto',
'left  join  si_i_personas           g   on  h.id_sjto_impsto     =  g.id_sjto_impsto',
'where c.id_impsto_acto = :P31_ID_IMPSTO_ACTO',
'and a.id_cnddto = :P31_ID_CNDDTO',
'and b.id_cnddto_vgncia in (select x.id_cnddto_vgncia ',
'                            from fi_g_fsclzc_expdn_cndd_vgnc x)',
'; '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30940817745369508)
,p_name=>'NMRO_MSES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_MSES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30972569013621301)
,p_name=>'VLOR_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30972655559621302)
,p_name=>'DVSOR_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DVSOR_TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30972754057621303)
,p_name=>'CDGO_INDCDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_INDCDOR_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30972832367621304)
,p_name=>'VLOR_CDGO_INDCDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CDGO_INDCDOR_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30972915712621305)
,p_name=>'VLOR_TRFA_CLCLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TRFA_CLCLDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30973062559621306)
,p_name=>'EXPRSION_RDNDEO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPRSION_RDNDEO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30973119292621307)
,p_name=>'VLOR_LQDCION_MNMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDCION_MNMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(61197227331118603)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(61197371607118604)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(61197459748118605)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(61197588951118606)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(61198045289118611)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(61277070449639501)
,p_name=>'BASE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BASE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_UNITEDCODES_AUTONUMERIC'
,p_heading=>'Base'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    ',
'    currencySymbol: " $",',
'    currencySymbolPlacement: "p",',
'',
'    allowDecimalPadding: false,',
'    alwaysAllowDecimalCharacter: true,',
'',
'    decimalCharacter: ",",',
'    decimalPlaces: 0,',
'',
'    digitGroupSeparator: ".",',
'    selectOnFocus: false,',
'    showOnlyNumbersOnFocus: false,',
' ',
'    emptyInputBehavior: "zero"',
'',
'',
'}'))
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_is_required=>false
,p_max_length=>12
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(61285217117667106)
,p_name=>'ROWNUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWNUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(61402738128858204)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62481319369177703)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62481489725177704)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62481507835177705)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62481603281177706)
,p_name=>'ID_CNDDTO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71455697055907602)
,p_name=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(74380040858868601)
,p_name=>'ID_TP_BS_SNCN_DCL_VGN_FRM'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo Base'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper( a.dscrpcion ) as d,',
'       b.id_tp_bs_sncn_dcl_vgn_frm as r',
'from fi_d_tipo_base_sancion a',
'join fi_d_tp_bs_sncn_dcl_vgn_frm b on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'join gi_d_dclrcnes_vgncias_frmlr c on b.id_dclrcion_vgncia_frmlrio  =   c.id_dclrcion_vgncia_frmlrio',
'join gi_d_dclrcnes_tpos_vgncias  d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'join gi_d_declaraciones_tipo     e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and d.vgncia = :VGNCIA',
'and d.id_prdo = :ID_PRDO',
'and b.id_dclrcion_vgncia_frmlrio = :ID_DCLRCION_VGNCIA_FRMLRIO',
'--and a.cdgo_tpo_bse_sncion in (''INS'', ''INE'', ''INX'',''INNE'',''CBI'')',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'VGNCIA,ID_PRDO,ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P31_CDGO_ACTO_TPO'
,p_display_condition2=>'RXD'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(74723165789778002)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(74736204002921702)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(61197191503118602)
,p_internal_uid=>61197191503118602
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(61202625538121193)
,p_interactive_grid_id=>wwv_flow_api.id(61197191503118602)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(61202775149121195)
,p_report_id=>wwv_flow_api.id(61202625538121193)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30950570713392633)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(30940817745369508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30978517463621482)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(30972569013621301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30979069855621487)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(30972655559621302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30979595266621489)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(30972754057621303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30980013740621492)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(30972832367621304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30980560173621494)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(30972915712621305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30981096113621501)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(30973062559621306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30981595959621503)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(30973119292621307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61203258891121200)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(61197227331118603)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61203712170121204)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(61197371607118604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61204214020121207)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(61197459748118605)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61204727767121212)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(61197588951118606)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61209270318201974)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(61198045289118611)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61283257099640280)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(61277070449639501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61299276742693105)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(61285217117667106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(61418251387120421)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(61402738128858204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62510185415387540)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(62481319369177703)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62510642684387544)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(62481489725177704)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62511131150387546)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(62481507835177705)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62511635890387547)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(62481603281177706)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71465106953232452)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(71455697055907602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(74385349246873926)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(74380040858868601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>488
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(74760240439250844)
,p_view_id=>wwv_flow_api.id(61202775149121195)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(74736204002921702)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69393160739328801)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(61185788474861802)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61285405016667108)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(61185788474861802)
,p_button_name=>'BTN_RGSTRO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P31_ID_IMPSTO_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(61545393306082302)
,p_branch_name=>'Regresar'
,p_branch_action=>'f?p=&APP_ID.:&P31_PGNA.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'modal'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30941021403369510)
,p_name=>'P31_ID_PRGRMA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30941175659369511)
,p_name=>'P31_ID_SBPRGRMA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30941233820369512)
,p_name=>'P31_CDGO_TPO_BSE_SNCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30941371672369513)
,p_name=>'P31_ID_PRDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61185907567861804)
,p_name=>'P31_ID_IMPSTO_ACTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(61185788474861802)
,p_prompt=>'Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto_acto as d,',
'       b.id_impsto_acto as r',
'from gn_d_actos_tipo        a',
'join df_i_impuestos_acto    b   on  a.cdgo_acto_tpo   =   b.cdgo_impsto_acto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.cdgo_acto_tpo = :P31_CDGO_ACTO_TPO;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61197695252118607)
,p_name=>'P31_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61545213903082301)
,p_name=>'P31_CDGO_ACTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71455546799907601)
,p_name=>'P31_ID_CNDDTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71455734992907603)
,p_name=>'P31_PGNA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74391565105566102)
,p_name=>'P31_ACTO_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74736308672921703)
,p_name=>'P31_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74736426244921704)
,p_name=>'P31_ID_SJTO_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74736688834921706)
,p_name=>'P31_ID_TPO_BSE_SNCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(61197057730118601)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61197818437118609)
,p_name=>'Al seleccionar el impuesto acto'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P31_ID_IMPSTO_ACTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61197937967118610)
,p_event_id=>wwv_flow_api.id(61197818437118609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61402574873858202)
,p_name=>'Liquidar'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(61285405016667108)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61402683034858203)
,p_event_id=>wwv_flow_api.id(61402574873858202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function liquidar() {',
'    ',
'    try{',
'       ',
'        if(buildJsonConcepto() > 0){',
'            ',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'                {',
'                    type:       "alert",',
'                    location:   "page",',
'                    message:    "La base de los concepto debe ser mayor que 0 y seleccione su tipo de base",',
'                    unsafe:     false',
'                }',
'            ]);',
'            ',
'        }else{',
'            ',
'            await apex.server.process("Liquidar", {',
'            f01: window.localStorage.jsonconceptos,',
'            pageItems: "#F_CDGO_CLNTE, #P31_ID_IMPSTO_ACTO, #P31_ID_FSCLZCION_EXPDNTE, #P31_ACTO_TPO"',
'            },{',
'                success: function(data) {',
'                    if(data.o_cdgo_rspsta > 0) {',
'                        console.log(data.o_cdgo_rspsta);',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([',
'                            {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                            }',
'                        ]);',
'                    }else{',
unistr('                        apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                        apex.submit({request : "modal"});',
'                    }',
'                }',
'            })',
'            ',
'        }',
'    }catch(e){',
'        console.log(e);',
'    }',
'}',
'',
'liquidar();',
'',
unistr('/*apex.message.confirm("\00BFEst\00E1 seguro de realizar la liquidaci\00F3n?", function(okPressed) {'),
'   if(okPressed) {',
'       liquidar();',
'   } ',
'});*/',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74714325098637901)
,p_name=>'Al seleccionar'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(61197057730118601)
,p_triggering_element=>'ID_TP_BS_SNCN_DCL_VGN_FRM'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74736589914921705)
,p_event_id=>wwv_flow_api.id(74714325098637901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' $s(''P31_ID_TPO_BSE_SNCION'', this.triggeringElement.value);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30940916483369509)
,p_event_id=>wwv_flow_api.id(74714325098637901)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.cdgo_tpo_bse_sncion',
'into :P31_CDGO_TPO_BSE_SNCION',
'from fi_d_tp_bs_sncn_dcl_vgn_frm a',
'join fi_d_tipo_base_sancion b    on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'where a.id_tp_bs_sncn_dcl_vgn_frm = nvl(:ID_TP_BS_SNCN_DCL_VGN_FRM, :P31_ID_TPO_BSE_SNCION);'))
,p_attribute_02=>'ID_TP_BS_SNCN_DCL_VGN_FRM'
,p_attribute_03=>'P31_CDGO_TPO_BSE_SNCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74714455128637902)
,p_event_id=>wwv_flow_api.id(74714325098637901)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculaBase();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(61402458019858201)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Liquidar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_cncptos         clob;',
'    v_exception       exception;',
'    v_id_fsclzcion_sncion    number := 0;',
'begin',
'',
'    for i in 1..apex_application.g_f01.count loop',
'        v_cncptos := v_cncptos || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    begin',
'        select a.id_acto_tpo',
'        into :P31_ACTO_TPO',
'        from gn_d_actos_tipo a',
'        where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.cdgo_acto_tpo = :P31_CDGO_ACTO_TPO;',
'    exception',
'        when others then',
'            v_cdgo_rspsta := 1;',
'            v_mnsje_rspsta := ''Problemas al consultar el tipo de acto'';',
'            raise v_exception;',
'    end;',
'    ',
'    /*for c_sncion in(',
'        select a.id_fsclzcion_sncion',
'        from fi_g_fiscalizacion_sancion a',
'        where a.id_fsclzcion_expdnte = :P31_ID_FSCLZCION_EXPDNTE',
'    )loop',
'        begin',
'            update fi_g_fiscalizacion_sancion a',
'            set a.actvo = ''N''',
'            where a.id_fsclzcion_sncion = c_sncion.id_fsclzcion_sncion;',
'        exception',
'            when others then',
'                v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''Problemas al actualizar Sanci\00F3n del Pliego de Cargos.'';'),
'                raise v_exception;',
'        end;',
'    end loop;*/',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_fi_g_fsclzcion_sncion(p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                                      p_id_fsclzcion_expdnte => :P31_ID_FSCLZCION_EXPDNTE,',
'                                                      p_id_acto_tpo          => :P31_ACTO_TPO,',
'                                                      p_json                 => v_cncptos,',
'                                                      o_cdgo_rspsta          => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta         => v_mnsje_rspsta);',
'    ',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30971119637614009)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IngresosBrutos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta                number := 0;',
'    v_id_dclrcn_tpo              number;',
'    v_id_dclrcion                number;',
'    v_mnsje_rspsta               varchar2(1000);',
'    v_cdgo_tpo_bse_sncion        varchar2(5);',
'    v_exception                  exception;',
'    json_hmlgcion                json_object_t;',
'    v_ingrso_brto                number    := 0;',
'    ',
'    v_id_dclrcion_omsa           number;',
'    v_ingrso_brto_omsa           number    := 0;',
'    v_ingrso_brto_fnal           number    := 0;',
'    json_hmlgcion_omsa           json_object_t;',
'    ',
'begin',
'',
unistr('    --Se valida el tipo de base sanci\00F3n'),
'     begin',
'        select b.cdgo_tpo_bse_sncion',
'        into v_cdgo_tpo_bse_sncion',
'        from fi_d_tp_bs_sncn_dcl_vgn_frm a',
'        join fi_d_tipo_base_sancion b    on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'        where b.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_tp_bs_sncn_dcl_vgn_frm = :P31_ID_TPO_BSE_SNCION ;',
'    exception',
'        when others then',
'            v_cdgo_tpo_bse_sncion := null;',
'    end;',
unistr('    --Se consulta el id_dclrcion que se est\00E1 fiscalizando'),
'    begin',
'        /*select a.id_dclrcion ',
'          into v_id_dclrcion_omsa',
'          from fi_g_candidatos_vigencia a ',
'         where a.id_cnddto   = :P31_ID_CNDDTO',
'           and a.id_prdo     = :P31_ID_PRDO',
'           and a.id_dclrcion_vgncia_frmlrio = :P31_DCLRCION_VGNCIA_FRMLRIO;*/',
'        select b.id_dclrcion ',
'          into v_id_dclrcion_omsa',
'          from fi_g_candidatos_vigencia a',
'          join gi_g_declaraciones b on b.id_cnddto_vgncia = a.id_cnddto_vgncia',
'         where a.id_cnddto   = :P31_ID_CNDDTO',
'           and a.id_prdo     = :P31_ID_PRDO',
'           and a.id_dclrcion_vgncia_frmlrio = :P31_DCLRCION_VGNCIA_FRMLRIO;',
'    exception',
'        when others then',
'            v_id_dclrcion_omsa := 0;',
'    end;',
'    ',
'    if v_cdgo_tpo_bse_sncion = ''IBD'' then',
'            ',
unistr('        --Se obtiene el tipo de declaraci\00F3n'),
'        begin',
'            select e.id_dclrcn_tpo',
'            into v_id_dclrcn_tpo',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            where c.id_dclrcion_vgncia_frmlrio = :P31_DCLRCION_VGNCIA_FRMLRIO;',
'        exception',
'            when others then',
'                v_id_dclrcn_tpo := null;',
'        end;',
'',
unistr('        --Se obtiene la ultima declaraci\00F3n presentada por el sujeto impuesto'),
'        begin',
'            select max(f.id_dclrcion) as id_dclrcion',
'            into v_id_dclrcion',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            join gi_g_declaraciones f on c.id_dclrcion_vgncia_frmlrio = f.id_dclrcion_vgncia_frmlrio',
'            where f.id_sjto_impsto = :P31_ID_SJTO_IMPSTO',
'            and e.id_dclrcn_tpo = v_id_dclrcn_tpo',
'            --and f.id_dclrcion <> v_id_dclrcion_omsa',
'            and f.cdgo_dclrcion_estdo in (''PRS'', ''APL'');',
'        exception',
'            when others then',
'                v_id_dclrcion := 0;',
'        end;',
'',
unistr('        --Se obtiene el json de homologaci\00F3n'),
'        begin',
'            json_hmlgcion :=  new json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades(''FIS'', v_id_dclrcion));',
'            ',
'            v_ingrso_brto := json_hmlgcion.get_string(''INBR'');',
'        exception',
'            when others then',
'                v_ingrso_brto := 0;',
'        end;',
'',
'    ',
'    ',
unistr('        --Se obtiene el json de homologaci\00F3n omisa'),
'        begin',
'            json_hmlgcion_omsa :=  new json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades(''FIS'', v_id_dclrcion_omsa));',
'            ',
'            v_ingrso_brto_omsa := json_hmlgcion_omsa.get_string(''INBR'');',
'        exception',
'            when others then',
'                v_ingrso_brto_omsa := 0;',
'        end;',
'',
'        ',
'        if v_ingrso_brto_omsa > v_ingrso_brto then',
'            v_ingrso_brto_fnal    :=    v_ingrso_brto_omsa;',
'        else',
'            v_ingrso_brto_fnal    :=    v_ingrso_brto;',
'        end if;',
'        ',
'',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''ingrso_brto'', v_ingrso_brto_fnal);',
'        apex_json.close_object;',
'        return;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.write(''ingrso_brto'', v_ingrso_brto_fnal);',
'    apex_json.close_object;',
'    ',
'     ',
'    ',
'    ',
'exception',
'    when v_exception then',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''ingrso_brto'', v_ingrso_brto_fnal);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30971437744614554)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IngresosNetos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number := 0;',
'    v_id_dclrcn_tpo  number;',
'    v_id_dclrcion    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'    v_cdgo_tpo_bse_sncion varchar2(5);',
'    v_exception      exception;',
'    json_hmlgcion    json_object_t;',
'    v_ingrso_neto    number    :=    0;',
'    ',
'begin',
'',
unistr('    --Se valida el tipo de base sanci\00F3n'),
'     begin',
'        select b.cdgo_tpo_bse_sncion',
'        into v_cdgo_tpo_bse_sncion',
'        from fi_d_tp_bs_sncn_dcl_vgn_frm a',
'        join fi_d_tipo_base_sancion b    on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'        where b.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_tp_bs_sncn_dcl_vgn_frm = :P31_ID_TPO_BSE_SNCION ;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
unistr('    --Se consulta el id_dclrcion que se est\00E1 fiscalizando'),
'    begin',
'        select a.id_dclrcion ',
'          into v_id_dclrcion',
'          from fi_g_candidatos_vigencia a ',
'         where a.id_cnddto   = :P31_ID_CNDDTO',
'           and a.id_prdo     = :P31_ID_PRDO',
'           and a.id_dclrcion_vgncia_frmlrio = :P31_DCLRCION_VGNCIA_FRMLRIO;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'    if v_cdgo_tpo_bse_sncion = ''INNE'' then',
'            ',
unistr('        --Se obtiene el tipo de declaraci\00F3n'),
'        begin',
'            select e.id_dclrcn_tpo',
'            into v_id_dclrcn_tpo',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            where c.id_dclrcion_vgncia_frmlrio = :P31_DCLRCION_VGNCIA_FRMLRIO;',
'        exception',
'            when others then',
'                v_id_dclrcn_tpo := null;',
'        end;',
'',
unistr('        --Se obtiene la ultima declaraci\00F3n presentada por el sujeto impuesto'),
'        begin',
'            select f.id_dclrcion as id_dclrcion',
'            into v_id_dclrcion',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            join gi_g_declaraciones f on c.id_dclrcion_vgncia_frmlrio = f.id_dclrcion_vgncia_frmlrio',
'            where f.id_sjto_impsto = :P31_ID_SJTO_IMPSTO ',
'            and e.id_dclrcn_tpo = v_id_dclrcn_tpo',
'            and f.id_dclrcion = v_id_dclrcion',
'            and cdgo_dclrcion_estdo in (''PRS'', ''APL'');',
'        exception',
'            when others then',
'                v_id_dclrcion := 0;',
'        end;',
'',
unistr('        --Se obtiene el json de homologaci\00F3n'),
'        begin',
'            json_hmlgcion :=  new json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades(''FIS'', v_id_dclrcion));',
'            ',
'            v_ingrso_neto := json_hmlgcion.get_string(''INNE'');',
'        exception',
'            when others then',
'                v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''No se pudo obtener el ingreso neto de la ultima declaraci\00F3n'';'),
'                raise v_exception;',
'        end;',
'',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''ingrso_neto'', v_ingrso_neto);',
'        apex_json.close_object;',
'        return;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.write(''ingrso_neto'', v_ingrso_neto);',
'    apex_json.close_object;',
'    ',
'     ',
'    ',
'    ',
'exception',
'    when v_exception then',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''ingrso_neto'', v_ingrso_neto);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30971735409615057)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ImpuestoCargo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number := 0;',
'    v_id_dclrcn_tpo  number;',
'    v_id_dclrcion    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'    v_cdgo_tpo_bse_sncion varchar2(5);',
'    v_exception      exception;',
'    json_hmlgcion    json_object_t;',
'    v_impsto_crgo    number    :=    0;',
'    ',
'begin',
'    ',
unistr('    --Se valida el tipo de base sanci\00F3n'),
'     begin',
'        select b.cdgo_tpo_bse_sncion',
'        into v_cdgo_tpo_bse_sncion',
'        from fi_d_tp_bs_sncn_dcl_vgn_frm a',
'        join fi_d_tipo_base_sancion b    on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'        where b.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_tp_bs_sncn_dcl_vgn_frm = :P31_ID_TPO_BSE_SNCION ;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'    ',
unistr('    --Se consulta el id_dclrcion que se est\00E1 fiscalizando'),
'    begin',
'        select a.id_dclrcion ',
'          into v_id_dclrcion',
'          from fi_g_candidatos_vigencia a ',
'         where a.id_cnddto   = :P31_ID_CNDDTO',
'           and a.id_prdo     = :P31_ID_PRDO',
'           and a.id_dclrcion_vgncia_frmlrio = :P31_DCLRCION_VGNCIA_FRMLRIO;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'    if v_cdgo_tpo_bse_sncion = ''IMCA'' then',
'            ',
unistr('        --Se obtiene el tipo de declaraci\00F3n'),
'        begin',
'            select e.id_dclrcn_tpo',
'            into v_id_dclrcn_tpo',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            where c.id_dclrcion_vgncia_frmlrio = :P31_DCLRCION_VGNCIA_FRMLRIO;',
'        exception',
'            when others then',
'                v_id_dclrcn_tpo := null;',
'        end;',
'',
unistr('        --Se obtiene la ultima declaraci\00F3n presentada por el sujeto impuesto'),
'        begin',
'            select f.id_dclrcion as id_dclrcion',
'            into v_id_dclrcion',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            join gi_g_declaraciones f on c.id_dclrcion_vgncia_frmlrio = f.id_dclrcion_vgncia_frmlrio',
'            where f.id_sjto_impsto = :P31_ID_SJTO_IMPSTO ',
'            and e.id_dclrcn_tpo = v_id_dclrcn_tpo',
'            and f.id_dclrcion = v_id_dclrcion',
'            and cdgo_dclrcion_estdo in (''PRS'', ''APL'');',
'        exception',
'            when others then',
'                v_id_dclrcion := 0;',
'        end;',
'',
unistr('        --Se obtiene el json de homologaci\00F3n'),
'        begin',
'            json_hmlgcion :=  new json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades(''FIS'', v_id_dclrcion));',
'            ',
'            v_impsto_crgo := json_hmlgcion.get_string(''IMCA'');',
'        exception',
'            when others then',
'                v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''No se pudo obtener el impuesto a cargo de la ultima declaraci\00F3n'';'),
'                raise v_exception;',
'        end;',
'',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''impsto_crgo'', v_impsto_crgo);',
'        apex_json.close_object;',
'        return;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.write(''impsto_crgo'', v_impsto_crgo);',
'    apex_json.close_object;',
'    ',
'     ',
'    ',
'    ',
'exception',
'    when v_exception then',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''impsto_crgo'', v_impsto_crgo);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30972038163615594)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CalculoSancion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number := 0;',
'    v_id_dclrcn_tpo  number;',
'    v_id_dclrcion    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'    v_cdgo_tpo_bse_sncion varchar2(5);',
'    v_exception      exception;',
'    json_hmlgcion    json_object_t;',
'    v_clclo_sncion    number    :=    0;',
'    ',
'begin',
'    ',
unistr('    --Se valida el tipo de base sanci\00F3n'),
'     begin',
'        select b.cdgo_tpo_bse_sncion',
'        into v_cdgo_tpo_bse_sncion',
'        from fi_d_tp_bs_sncn_dcl_vgn_frm a',
'        join fi_d_tipo_base_sancion b    on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'        where b.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_tp_bs_sncn_dcl_vgn_frm = :P31_ID_TPO_BSE_SNCION ;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'    ',
unistr('    --Se consulta el id_dclrcion que se est\00E1 fiscalizando'),
'    begin',
'        select a.id_dclrcion ',
'          into v_id_dclrcion',
'          from fi_g_candidatos_vigencia a ',
'         where a.id_cnddto   = :P31_ID_CNDDTO',
'           and a.id_prdo     = :P31_ID_PRDO',
'           and a.id_dclrcion_vgncia_frmlrio = :P31_DCLRCION_VGNCIA_FRMLRIO;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'    if v_cdgo_tpo_bse_sncion = ''CSAN'' then',
'            ',
unistr('        --Se obtiene el tipo de declaraci\00F3n'),
'        begin',
'            select e.id_dclrcn_tpo',
'            into v_id_dclrcn_tpo',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            where c.id_dclrcion_vgncia_frmlrio = :P31_DCLRCION_VGNCIA_FRMLRIO;',
'        exception',
'            when others then',
'                v_id_dclrcn_tpo := null;',
'        end;',
'',
unistr('        --Se obtiene la ultima declaraci\00F3n presentada por el sujeto impuesto'),
'        begin',
'            select f.id_dclrcion as id_dclrcion',
'            into v_id_dclrcion',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            join gi_g_declaraciones f on c.id_dclrcion_vgncia_frmlrio = f.id_dclrcion_vgncia_frmlrio',
'            where f.id_sjto_impsto = :P31_ID_SJTO_IMPSTO ',
'            and e.id_dclrcn_tpo = v_id_dclrcn_tpo',
'            and f.id_dclrcion = v_id_dclrcion',
'            and cdgo_dclrcion_estdo in (''PRS'', ''APL'');',
'        exception',
'            when others then',
'                v_id_dclrcion := 0;',
'        end;',
'',
unistr('        --Se obtiene el json de homologaci\00F3n'),
'        begin',
'            json_hmlgcion :=  new json_object_t(pkg_gi_declaraciones.fnc_gn_json_propiedades(''FIS'', v_id_dclrcion));',
'            ',
'            v_clclo_sncion := json_hmlgcion.get_string(''CSAN'');',
'        exception',
'            when others then',
'                v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''No se pudo obtener el calculo de la sanci\00F3n de la ultima declaraci\00F3n'';'),
'                raise v_exception;',
'        end;',
'',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''clclo_sncion'', v_clclo_sncion);',
'        apex_json.close_object;',
'        return;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.write(''clclo_sncion'', v_clclo_sncion);',
'    apex_json.close_object;',
'    ',
'     ',
'    ',
'    ',
'exception',
'    when v_exception then',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''clclo_sncion'', v_clclo_sncion);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
null;
end;
/
