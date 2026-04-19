prompt --application/pages/page_00084
begin
wwv_flow_api.create_page(
 p_id=>84
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Generar Sanci\00F3n Sancionatorio')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Generar Sanci\00F3n Sancionatorio')
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
'                    "id_tp_bs_sncn_dcl_vgn_frm": model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM")?.v || ',
'                                                 model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_1")?.v || ',
'                                                 model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_2")?.v || ',
'                                                 model.getValue(concepto, "ID_TP_BS_SNCN_DCL_VGN_FRM_3")?.v || ',
'                                                 null,',
'                    "vlor_trfa" : model.getValue(concepto,  "VLOR_TRFA"),',
'                    "dvsor_trfa" : model.getValue(concepto,  "DVSOR_TRFA"),',
'                    "cdgo_indcdor_tpo" : model.getValue(concepto,  "CDGO_INDCDOR_TPO"),',
'                    "vlor_trfa_clcldo" : model.getValue(concepto,  "VLOR_TRFA_CLCLDO"),                    ',
'                    "vlor_cdgo_indcdor_tpo" : model.getValue(concepto,  "VLOR_CDGO_INDCDOT_TPO"),',
'                    "exprsion_rdndeo" : model.getValue(concepto,  "EXPRSION_RDNDEO"),',
'                    "vlor_lqdcion_mnma" : model.getValue(concepto,  "VLOR_LQDCION_MNMA").trim().replace(/\./g, "").replace(/\,/g, "").replace(/\$/g, ""),',
'                    "nmro_mses" : model.getValue(concepto,  "NMRO_MSES")',
'                   };',
'        });',
'        ',
'        var id_concepto = apex.item( "P84_ID_IMPSTO_ACTO" ).getValue();',
'        console.log(id_concepto);',
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
'        $s(''P84_DCLRCION_VGNCIA_FRMLRIO'', model.getValue(records[0], "ID_DCLRCION_VGNCIA_FRMLRIO"));',
'        $s(''P84_ID_PRDO'', model.getValue(records[0], "ID_PRDO"));',
'        ',
'        apex.server.process("IngresosBrutos", {',
'            pageItems: "#P84_DCLRCION_VGNCIA_FRMLRIO, #P84_ID_SJTO_IMPSTO, #P84_ID_TPO_BSE_SNCION, #P84_ID_PRDO"',
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
'        $s(''P84_DCLRCION_VGNCIA_FRMLRIO'', model.getValue(records[0], "ID_DCLRCION_VGNCIA_FRMLRIO"));',
'        $s(''P84_ID_PRDO'', model.getValue(records[0], "ID_PRDO"));',
'        ',
'        apex.server.process("IngresosNetos", {',
'            pageItems: "#P84_DCLRCION_VGNCIA_FRMLRIO, #P84_ID_SJTO_IMPSTO, #P84_ID_TPO_BSE_SNCION, #P84_ID_PRDO"',
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
'        $s(''P84_DCLRCION_VGNCIA_FRMLRIO'', model.getValue(records[0], "ID_DCLRCION_VGNCIA_FRMLRIO"));',
'        $s(''P84_ID_PRDO'', model.getValue(records[0], "ID_PRDO"));',
'        ',
'        apex.server.process("ImpuestoCargo", {',
'            pageItems: "#P84_DCLRCION_VGNCIA_FRMLRIO, #P84_ID_SJTO_IMPSTO, #P84_ID_TPO_BSE_SNCION, #P84_ID_PRDO"',
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
'        $s(''P84_DCLRCION_VGNCIA_FRMLRIO'', model.getValue(records[0], "ID_DCLRCION_VGNCIA_FRMLRIO"));',
'        $s(''P84_ID_PRDO'', model.getValue(records[0], "ID_PRDO"));',
'        ',
'        apex.server.process("CalculoSancion", {',
'            pageItems: "#P84_DCLRCION_VGNCIA_FRMLRIO, #P84_ID_SJTO_IMPSTO, #P84_ID_TPO_BSE_SNCION, #P84_ID_PRDO"',
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
'    var valorItem = apex.item(''P84_CDGO_TPO_BSE_SNCION'').getValue();',
'    ',
'        if (valorItem === ''IBD'' || valorItem === ''INBR'') {',
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
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20250414143102'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114303844089113149)
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
 p_id=>wwv_flow_api.id(114315113344369948)
,p_plug_name=>'Conceptos'
,p_region_name=>'conceptos'
,p_parent_plug_id=>wwv_flow_api.id(114303844089113149)
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
'       (select a.bse',
'  from fi_g_fiscalizacion_sancion a',
' where a.id_fsclzcion_expdnte = :P84_ID_FSCLZCION_EXPDNTE',
' FETCH FIRST 1 ROW ONLY) base,',
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
'where c.id_impsto_acto = :P84_ID_IMPSTO_ACTO',
'and a.id_cnddto = :P84_ID_CNDDTO',
'and b.id_cnddto_vgncia in (select x.id_cnddto_vgncia ',
'                            from fi_g_fsclzc_expdn_cndd_vgnc x)',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26305380188685501)
,p_name=>'NMRO_MSES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_MSES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero Meses Extempor\00E1neo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'RIGHT'
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
,p_include_in_export=>false
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>':P84_CDGO_ACTO_TPO NOT IN (''RSXNI'',''PCN'')'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(26814041497592201)
,p_name=>'ID_TP_BS_SNCN_DCL_VGN_FRM_3'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo Base'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>':P84_CDGO_ACTO_TPO in (''PCM'',''RSELS'')'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30204601418952105)
,p_name=>'VLOR_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_format_mask=>'990.99'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30204782209952106)
,p_name=>'VLOR_TRFA_CLCLDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TRFA_CLCLDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attribute_01=>'Y'
,p_format_mask=>'999,990.999'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30328842745671801)
,p_name=>'VLOR_LQDCION_MNMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDCION_MNMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Valor Liquidaci\00F3n M\00EDnima')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53582168671982863)
,p_name=>'DVSOR_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DVSOR_TRFA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(53582228393982864)
,p_name=>'CDGO_INDCDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_INDCDOR_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(53582348759982865)
,p_name=>'VLOR_CDGO_INDCDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CDGO_INDCDOR_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_format_mask=>'990.99'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(53582495683982867)
,p_name=>'EXPRSION_RDNDEO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPRSION_RDNDEO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(65314334651759948)
,p_name=>'ID_TP_BS_SNCN_DCL_VGN_FRM_2'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo Base'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>':P84_CDGO_ACTO_TPO in (''PCE'',''RSPE'')'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(66962620765443448)
,p_name=>'ID_TP_BS_SNCN_DCL_VGN_FRM_1'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo Base'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>':P84_CDGO_ACTO_TPO in (''PCN'',''RSXNI'')'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(114315282945369950)
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
 p_id=>wwv_flow_api.id(114315427221369951)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
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
 p_id=>wwv_flow_api.id(114315515362369952)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
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
 p_id=>wwv_flow_api.id(114315644565369953)
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
 p_id=>wwv_flow_api.id(114316100903369958)
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
 p_id=>wwv_flow_api.id(114395126063890848)
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
 p_id=>wwv_flow_api.id(114403272731918453)
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
 p_id=>wwv_flow_api.id(114520793743109551)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
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
 p_id=>wwv_flow_api.id(115599374983429050)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115599545339429051)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(115599563449429052)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(115599658895429053)
,p_name=>'ID_CNDDTO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(124573752670158949)
,p_name=>'ORDEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(127498096473119948)
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
,p_display_condition=>'P84_CDGO_ACTO_TPO'
,p_display_condition2=>'RXD'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(127841221404029349)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(127854259617173049)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(114315247117369949)
,p_internal_uid=>114315247117369949
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
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(114320681152372540)
,p_interactive_grid_id=>wwv_flow_api.id(114315247117369949)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(114320830763372542)
,p_report_id=>wwv_flow_api.id(114320681152372540)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26311558433687902)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(26305380188685501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26819968893613103)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(26814041497592201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30215540199962045)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(30204601418952105)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30216107470962047)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(30204782209952106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30334873458672081)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(30328842745671801)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53133529787397870)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(66962620765443448)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53588538916983042)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(53582168671982863)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53589036789983044)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(53582228393982864)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53589507062983045)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(53582348759982865)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53590573636983049)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(53582495683982867)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(65319582618775602)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(65314334651759948)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>600
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114321314505372547)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(114315282945369950)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114321767784372551)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(114315427221369951)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114322269634372554)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(114315515362369952)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114322783381372559)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(114315644565369953)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114327325932453321)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(114316100903369958)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114401312713891627)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(114395126063890848)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114417332356944452)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(114403272731918453)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114536307001371768)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(114520793743109551)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115628241029638887)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(115599374983429050)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115628698298638891)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(115599545339429051)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115629186764638893)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(115599563449429052)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(115629691504638894)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(115599658895429053)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(124583162567483799)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(124573752670158949)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(127503404861125273)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(127498096473119948)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>488
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(127878296053502191)
,p_view_id=>wwv_flow_api.id(114320830763372542)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(127854259617173049)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28013886789910295)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(114303844089113149)
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
 p_id=>wwv_flow_api.id(28014236458910305)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(114303844089113149)
,p_button_name=>'BTN_RGSTRO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P84_ID_IMPSTO_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(28035398057910521)
,p_branch_name=>'Regresar'
,p_branch_action=>'f?p=&APP_ID.:&P84_PGNA.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'modal'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6693422800212501)
,p_name=>'P84_ID_IMPSTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6693621092212503)
,p_name=>'P84_ID_SBIMPSTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17022449267574501)
,p_name=>'P84_ID_SBPRGRMA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17022531042574502)
,p_name=>'P84_ID_PRGRMA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28014618062910308)
,p_name=>'P84_ID_IMPSTO_ACTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(114303844089113149)
,p_prompt=>'Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto_acto as d,',
'       b.id_impsto_acto as r',
'from gn_d_actos_tipo        a',
'join df_i_impuestos_acto    b   on  a.cdgo_acto_tpo   =   b.cdgo_impsto_acto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_impsto = :P84_ID_IMPSTO',
'and b.id_impsto_sbmpsto = :P84_ID_SBIMPSTO',
'and b.cdgo_impsto_acto = :P84_CDGO_ACTO_TPO',
'and a.cdgo_acto_tpo = :P84_CDGO_ACTO_TPO;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28025491243910475)
,p_name=>'P84_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28025702552910475)
,p_name=>'P84_CDGO_ACTO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28026170856910475)
,p_name=>'P84_ID_CNDDTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28026592554910479)
,p_name=>'P84_PGNA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28026907778910481)
,p_name=>'P84_ACTO_TPO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28027344352910481)
,p_name=>'P84_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28027735941910483)
,p_name=>'P84_ID_SJTO_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28028119357910483)
,p_name=>'P84_ID_TPO_BSE_SNCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30840276650513804)
,p_name=>'P84_ID_PRDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30854980673527602)
,p_name=>'P84_CDGO_TPO_BSE_SNCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(114315113344369948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28029702125910502)
,p_name=>'Al seleccionar el impuesto acto'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_ID_IMPSTO_ACTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28030264526910514)
,p_event_id=>wwv_flow_api.id(28029702125910502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28030635826910516)
,p_name=>'Liquidar'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(28014236458910305)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28031133422910518)
,p_event_id=>wwv_flow_api.id(28030635826910516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function liquidar() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        if(buildJsonConcepto() > 0){',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'                {',
'                    type:       "alert",',
'                    location:   "page",',
'                    message:    "La base de los concepto debe ser mayor que 0 y seleccione su tipo de base",',
'                    unsafe:     false',
'                }',
'            ]);',
'        }else{',
'            await apex.server.process("Liquidar", {',
'            f01: window.localStorage.jsonconceptos,',
'            pageItems: "#F_CDGO_CLNTE, #P84_ID_IMPSTO_ACTO, #P84_ID_FSCLZCION_EXPDNTE, #P84_ACTO_TPO"',
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
'        }',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
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
 p_id=>wwv_flow_api.id(28031503326910519)
,p_name=>'Al seleccionar'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(114315113344369948)
,p_triggering_element=>'ID_TP_BS_SNCN_DCL_VGN_FRM'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28032001437910519)
,p_event_id=>wwv_flow_api.id(28031503326910519)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' $s(''P84_ID_TPO_BSE_SNCION'', this.triggeringElement.value);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30855724522527710)
,p_event_id=>wwv_flow_api.id(28031503326910519)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.cdgo_tpo_bse_sncion',
'into :P84_CDGO_TPO_BSE_SNCION',
'from fi_d_tp_bs_sncn_dcl_vgn_frm a',
'join fi_d_tipo_base_sancion b    on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'where a.id_tp_bs_sncn_dcl_vgn_frm = nvl(:ID_TP_BS_SNCN_DCL_VGN_FRM, :P84_ID_TPO_BSE_SNCION);'))
,p_attribute_02=>'ID_TP_BS_SNCN_DCL_VGN_FRM'
,p_attribute_03=>'P84_CDGO_TPO_BSE_SNCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30772186862223503)
,p_event_id=>wwv_flow_api.id(28031503326910519)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculaBase();',
'//ingresoBrutos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28032958084910519)
,p_name=>'Al Cambiar'
,p_event_sequence=>50
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(114315113344369948)
,p_triggering_element=>'ID_TP_BS_SNCN_DCL_VGN_FRM_1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30855476261527607)
,p_event_id=>wwv_flow_api.id(28032958084910519)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' $s(''P84_ID_TPO_BSE_SNCION'', this.triggeringElement.value);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30855518726527608)
,p_event_id=>wwv_flow_api.id(28032958084910519)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.cdgo_tpo_bse_sncion',
'into :P84_CDGO_TPO_BSE_SNCION',
'from fi_d_tp_bs_sncn_dcl_vgn_frm a',
'join fi_d_tipo_base_sancion b    on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'where a.id_tp_bs_sncn_dcl_vgn_frm = nvl(:ID_TP_BS_SNCN_DCL_VGN_FRM_1, :P84_ID_TPO_BSE_SNCION);'))
,p_attribute_02=>'ID_TP_BS_SNCN_DCL_VGN_FRM_1'
,p_attribute_03=>'P84_CDGO_TPO_BSE_SNCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30855697465527609)
,p_event_id=>wwv_flow_api.id(28032958084910519)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculaBase();',
'//ingresoNetos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28034378980910520)
,p_name=>'Al Cambiar_1'
,p_event_sequence=>60
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(114315113344369948)
,p_triggering_element=>'ID_TP_BS_SNCN_DCL_VGN_FRM_2'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28034882623910520)
,p_event_id=>wwv_flow_api.id(28034378980910520)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' $s(''P84_ID_TPO_BSE_SNCION'', this.triggeringElement.value);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30855808212527711)
,p_event_id=>wwv_flow_api.id(28034378980910520)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.cdgo_tpo_bse_sncion',
'into :P84_CDGO_TPO_BSE_SNCION',
'from fi_d_tp_bs_sncn_dcl_vgn_frm a',
'join fi_d_tipo_base_sancion b    on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'where a.id_tp_bs_sncn_dcl_vgn_frm = nvl(:ID_TP_BS_SNCN_DCL_VGN_FRM_2, :P84_ID_TPO_BSE_SNCION);'))
,p_attribute_02=>'ID_TP_BS_SNCN_DCL_VGN_FRM_2'
,p_attribute_03=>'P84_CDGO_TPO_BSE_SNCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30772090347223502)
,p_event_id=>wwv_flow_api.id(28034378980910520)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculaBase();',
'//impuestoCargo();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26814152712592202)
,p_name=>'Al Cambiar_2'
,p_event_sequence=>70
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(114315113344369948)
,p_triggering_element=>'ID_TP_BS_SNCN_DCL_VGN_FRM_3'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26814208670592203)
,p_event_id=>wwv_flow_api.id(26814152712592202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' $s(''P84_ID_TPO_BSE_SNCION'', this.triggeringElement.value);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30855925966527712)
,p_event_id=>wwv_flow_api.id(26814152712592202)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.cdgo_tpo_bse_sncion',
'into :P84_CDGO_TPO_BSE_SNCION',
'from fi_d_tp_bs_sncn_dcl_vgn_frm a',
'join fi_d_tipo_base_sancion b    on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'where a.id_tp_bs_sncn_dcl_vgn_frm = nvl(:ID_TP_BS_SNCN_DCL_VGN_FRM_3, :P84_ID_TPO_BSE_SNCION);'))
,p_attribute_02=>'ID_TP_BS_SNCN_DCL_VGN_FRM_3'
,p_attribute_03=>'P84_CDGO_TPO_BSE_SNCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30771911511223501)
,p_event_id=>wwv_flow_api.id(26814152712592202)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'calculaBase();',
'//calculoSancion();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(28028560640910493)
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
'        into :P84_ACTO_TPO',
'        from gn_d_actos_tipo a',
'        where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.cdgo_acto_tpo = :P84_CDGO_ACTO_TPO;',
'    exception',
'        when others then',
'            v_cdgo_rspsta := 1;',
'            v_mnsje_rspsta := ''Problemas al consultar el tipo de acto'';',
'            raise v_exception;',
'    end;',
'    ',
'    for c_sncion in(',
'        select a.id_fsclzcion_sncion',
'        from fi_g_fiscalizacion_sancion a',
'        where a.id_fsclzcion_expdnte = :P84_ID_FSCLZCION_EXPDNTE',
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
'    end loop;',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_fi_g_fsclzcion_sncion(p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                                      p_id_fsclzcion_expdnte => :P84_ID_FSCLZCION_EXPDNTE,',
'                                                      p_id_acto_tpo          => :P84_ACTO_TPO,',
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
 p_id=>wwv_flow_api.id(28028966283910500)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IngresosBrutos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number := 0;',
'    v_id_dclrcn_tpo  number;',
'    v_id_dclrcion    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'    v_cdgo_tpo_bse_sncion varchar2(5);',
'    v_exception      exception;',
'    json_hmlgcion    json_object_t;',
'    v_ingrso_brto    number := 0;',
'begin',
'',
unistr('    --Se valida el tipo de base sanci\00F3n'),
'     begin',
'        select b.cdgo_tpo_bse_sncion',
'        into v_cdgo_tpo_bse_sncion',
'        from fi_d_tp_bs_sncn_dcl_vgn_frm a',
'        join fi_d_tipo_base_sancion b    on a.id_tpo_bse_sncion = b.id_tpo_bse_sncion',
'        where b.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_tp_bs_sncn_dcl_vgn_frm = :P84_ID_TPO_BSE_SNCION ;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
unistr('    --Se consulta el id_dclrcion que se est\00E1 fiscalizando'),
'    /*begin',
'        select a.id_dclrcion ',
'          into v_id_dclrcion',
'          from fi_g_candidatos_vigencia a ',
'         where a.id_cnddto   = :P84_ID_CNDDTO',
'           and a.id_prdo     = :P84_ID_PRDO',
'           and a.id_dclrcion_vgncia_frmlrio = :P84_DCLRCION_VGNCIA_FRMLRIO;',
'    exception',
'        when others then',
'            null;',
'    end;*/',
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
'            where c.id_dclrcion_vgncia_frmlrio = :P84_DCLRCION_VGNCIA_FRMLRIO;',
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
'            where f.id_sjto_impsto = :P84_ID_SJTO_IMPSTO ',
'            and e.id_dclrcn_tpo = v_id_dclrcn_tpo',
'            --and f.id_dclrcion = v_id_dclrcion',
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
'            v_ingrso_brto := json_hmlgcion.get_string(''INBR'');',
'        exception',
'            when others then',
'                v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''No se pudo obtener el ingreso bruto de la ultima declaraci\00F3n, verifique la parametrizaci\00F3n del objeto homologado para el formulario y periodo de la declaraci\00F3n que se est\00E1 fiscalizando, en su defecto dig\00EDtalo manual')
||'mente.'';',
'                raise v_exception;',
'        end;',
'',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''ingrso_brto'', v_ingrso_brto);',
'        apex_json.close_object;',
'        return;',
'    elsif v_cdgo_tpo_bse_sncion = ''INBR'' then',
unistr('        --Se consulta el id_dclrcion que se est\00E1 fiscalizando'),
'        begin',
'            select a.id_dclrcion ',
'              into v_id_dclrcion',
'              from fi_g_candidatos_vigencia a ',
'             where a.id_cnddto   = :P84_ID_CNDDTO',
'               and a.id_prdo     = :P84_ID_PRDO',
'               and a.id_dclrcion_vgncia_frmlrio = :P84_DCLRCION_VGNCIA_FRMLRIO;',
'        exception',
'            when others then',
'                null;',
'        end;    ',
'        ',
unistr('        --Se obtiene el tipo de declaraci\00F3n'),
'        begin',
'            select e.id_dclrcn_tpo',
'            into v_id_dclrcn_tpo',
'            from gi_d_dclrcnes_vgncias_frmlr  c',
'            join gi_d_dclrcnes_tpos_vgncias   d on c.id_dclrcion_tpo_vgncia = d.id_dclrcion_tpo_vgncia',
'            join gi_d_declaraciones_tipo      e on d.id_dclrcn_tpo = e.id_dclrcn_tpo',
'            where c.id_dclrcion_vgncia_frmlrio = :P84_DCLRCION_VGNCIA_FRMLRIO;',
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
'            where f.id_sjto_impsto = :P84_ID_SJTO_IMPSTO ',
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
'            v_ingrso_brto := json_hmlgcion.get_string(''INBR'');',
'        exception',
'            when others then',
'                v_cdgo_rspsta := 1;',
unistr('                v_mnsje_rspsta := ''No se pudo obtener el ingreso bruto de la declaraci\00F3n'';'),
'                raise v_exception;',
'        end;',
'',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.write(''ingrso_brto'', v_ingrso_brto);',
'        apex_json.close_object;',
'        return;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.write(''ingrso_brto'', v_ingrso_brto);',
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
'        apex_json.write(''ingrso_brto'', v_ingrso_brto);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(28029332217910500)
,p_process_sequence=>30
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
'        and a.id_tp_bs_sncn_dcl_vgn_frm = :P84_ID_TPO_BSE_SNCION ;',
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
'         where a.id_cnddto   = :P84_ID_CNDDTO',
'           and a.id_prdo     = :P84_ID_PRDO',
'           and a.id_dclrcion_vgncia_frmlrio = :P84_DCLRCION_VGNCIA_FRMLRIO;',
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
'            where c.id_dclrcion_vgncia_frmlrio = :P84_DCLRCION_VGNCIA_FRMLRIO;',
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
'            where f.id_sjto_impsto = :P84_ID_SJTO_IMPSTO ',
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
unistr('                v_mnsje_rspsta := ''No se pudo obtener el ingreso neto de la declaraci\00F3n, verifique la parametrizaci\00F3n del objeto homologado para el formulario y periodo de la declaraci\00F3n que se est\00E1 fiscalizando, en su defecto dig\00EDtalo manualmente.'';'),
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
 p_id=>wwv_flow_api.id(30518846270701801)
,p_process_sequence=>40
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
'        and a.id_tp_bs_sncn_dcl_vgn_frm = :P84_ID_TPO_BSE_SNCION ;',
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
'         where a.id_cnddto   = :P84_ID_CNDDTO',
'           and a.id_prdo     = :P84_ID_PRDO',
'           and a.id_dclrcion_vgncia_frmlrio = :P84_DCLRCION_VGNCIA_FRMLRIO;',
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
'            where c.id_dclrcion_vgncia_frmlrio = :P84_DCLRCION_VGNCIA_FRMLRIO;',
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
'            where f.id_sjto_impsto = :P84_ID_SJTO_IMPSTO ',
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
unistr('                v_mnsje_rspsta := ''No se pudo obtener el impuesto a cargo de la declaraci\00F3n, verifique la parametrizaci\00F3n del objeto homologado para el formulario y periodo de la declaraci\00F3n que se est\00E1 fiscalizando, en su defecto dig\00EDtalo manualment')
||'e.'';',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30518938844701802)
,p_process_sequence=>50
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
'        and a.id_tp_bs_sncn_dcl_vgn_frm = :P84_ID_TPO_BSE_SNCION ;',
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
'         where a.id_cnddto   = :P84_ID_CNDDTO',
'           and a.id_prdo     = :P84_ID_PRDO',
'           and a.id_dclrcion_vgncia_frmlrio = :P84_DCLRCION_VGNCIA_FRMLRIO;',
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
'            where c.id_dclrcion_vgncia_frmlrio = :P84_DCLRCION_VGNCIA_FRMLRIO;',
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
'            where f.id_sjto_impsto = :P84_ID_SJTO_IMPSTO ',
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
unistr('                v_mnsje_rspsta := ''No se pudo obtener el calculo de la sanci\00F3n de la declaraci\00F3n, verifique la parametrizaci\00F3n del objeto homologado para el formulario y periodo de la declaraci\00F3n que se est\00E1 fiscalizando, en su defecto dig\00EDtalo manua')
||'lmente.'';',
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
end;
/
