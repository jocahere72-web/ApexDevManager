prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Generaci\00F3n plantilla')
,p_step_title=>unistr('Generaci\00F3n plantilla')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJson(){',
'    ',
'    var region = apex.region("vigencia");',
'',
'    if (region){',
'        ',
'        var view = apex.region("vigencia").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");//todos los seleccionados',
'        ',
'        var jsonvigencia = records.map(function(record){',
'            return {"VGNCIA":',
'                    [',
'                        {',
'                            "VGNCIA":    model.getValue(record, "VGNCIA"),',
'                            "ID_PRDO":      model.getValue(record, "ID_PRDO")',
'                        }',
'                    ]',
'                   }',
'        });',
'        ',
'        //Seteamos el valor del json en forma de cadena al item ',
'        $s(''P17_VGNCIA_JSON'', jsonvigencia.length > 0 ? JSON.stringify(jsonvigencia) : '''');',
'',
'    }',
'}',
'',
'async function fnc_crgrDcmnto() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        CKEDITOR.instances.P17_TXTDCMNTO.setData('''');',
'        if ($v("P17_ID_FSCLZCION_EXPDNTE_ACTO")!== ""){',
'            const resp = await apex.server.process (''CargarDocumento'', {pageItems : "#P17_ID_FSCLZCION_EXPDNTE_ACTO"});',
'            await resolveAfter1Seconds(resp.doc, resp.plntlla);',
'        }',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'}',
'',
'function resolveAfter1Seconds(x, y) {',
'    return new Promise(resolve => {',
'        setTimeout(() => {',
'            apex.item( "P17_ID_PLNTLLA" ).setValue(y);',
'            CKEDITOR.instances.P17_TXTDCMNTO.insertHtml(x);',
'            resolve(x);',
'        }, 1500);',
'    });',
'}',
'',
'function fnc_gnrarDcmnto(){',
'    try {',
'        let $waitPopup = apex.widget.waitPopup();',
'        CKEDITOR.instances.P17_TXTDCMNTO.setData('''');',
'        apex.server.process (''GenerarPlantilla'', {pageItems : "#P17_ID_SJTO_IMPSTO, #P17_IDNTFCCION, #P17_ID_FSCLZCION_EXPDNTE, #P17_ID_CNDDTO, #P17_ID_FNCNRIO, #P17_ID_PLNTLLA"}).then((resp) => {        ',
'            CKEDITOR.instances.P17_TXTDCMNTO.insertHtml(resp.doc);',
'            console.log(resp.doc);',
'            $waitPopup.remove();',
'        });',
'    }catch(e){',
'        console.log(e);',
'        $waitPopup.remove();',
'    }',
'}',
'',
'async function fnc_gstnrDcmnto(p_request){',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'        var v_dcmnto = CKEDITOR.instances.P17_TXTDCMNTO.getData();',
'        await apex.server.process ( "GuardarPlantilla", {',
'            pageItems: "#P17_ID_PLNTLLA, #P17_CDGO_ACTO_TPO, #P17_TXTDCMNTO, #P17_IDNTFCCION, #P17_ID_FNCNRIO, #P17_ID_CNDDTO, #P17_ID_FSCLZCION_EXPDNTE, #P17_VGNCIA_JSON, #P17_ID_FSCLZCION_EXPDNTE_ACTO, #P17_ID_ACTO_TPO",',
'			f01: v_dcmnto,',
'			x01: p_request',
'        }, {',
'            success: function(data){',
'                if (data.o_cdgo_rspsta != 0){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    data.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
'					if (["BTN_INSRTAR","BTN_APLCAR_CMBIO"].includes(p_request)){',
'						apex.item( "P17_ID_FSCLZCION_EXPDNTE_ACTO" ).setValue(data.o_id_fsclzcion_expdnte_acto);',
'					}else if (p_request == "Btn_Eliminar"){',
'						apex.item( "P17_ID_FSCLZCION_EXPDNTE_ACTO" ).setValue();',
'                        apex.item( "P17_ID_PLNTLLA" ).setValue();',
'                        CKEDITOR.instances.P17_TXTDCMNTO.setData('''');',
'					};',
unistr('                    window.sessionStorage.v_mnsje_rspsta = "Acci\00F3n procesada con \00E9xito."'),
'					apex.submit();',
'                }',
'            }',
'        });',
'    }catch(e){',
'        console.log(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};',
'',
'function fnc_elmnarDcmnto(){',
'    ',
'    try{',
'        ',
'        apex.server.process ("EliminarPlantilla", {',
'        pageItems: "#P17_ID_FSCLZCION_EXPDNTE_ACTO"',
'        }, {',
'            success: function(data){',
'                if (data.o_cdgo_rspsta != 0){',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors ([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    data.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                }else{',
'                    apex.item( "P17_ID_FSCLZCION_EXPDNTE_ACTO" ).setValue();',
'                    //apex.item( "P17_ID_PLNTLLA" ).setValue();',
'                    CKEDITOR.instances.P17_TXTDCMNTO.setData('''');',
unistr('				    window.sessionStorage.v_mnsje_rspsta = "Acci\00F3n procesada con \00E9xito."'),
'					apex.submit();',
'                }',
'            }',
'        });',
'     ',
'    }catch(e){',
'        console.log(e);',
'    }',
'    ',
'    ',
'    ',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.region("vigencia").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");',
'',
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'    fnc_crgrDcmnto();',
'});',
'',
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'   $(''#BTN_SNCION'').hide();',
'});',
'',
'apex.jQuery( apex.gPageContext$ ).on( "apexreadyend", function( e ) {',
'    if ($("#P17_CDGO_ACTO_TPO").val() == ''PCN''){',
'        $(''#BTN_SNCION'').show();',
'    }',
'});',
'',
'',
''))
,p_step_template=>wwv_flow_api.id(36459205127968627)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20250326105059'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54679865368671802)
,p_plug_name=>'Plantilla'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54680185660671805)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(62672399972191001)
,p_plug_name=>'Vigencias'
,p_region_name=>'vigencia'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.vgncia,',
'        c.prdo,',
'        b.id_prdo',
'  from fi_g_fsclzc_expdn_cndd_vgnc    a',
'  join fi_g_candidatos_vigencia       b on b.id_cnddto_vgncia = a.id_cnddto_vgncia',
'  join df_i_periodos                  c on c.id_prdo          =   b.id_prdo',
' where b.id_cnddto = :P17_ID_CNDDTO',
'   and (a.estdo = ''F'' or (a.estdo = ''P'' and  :P17_CDGO_ACTO_TPO = ''CEJE''))',
'/*select  a.vgncia,',
'        b.prdo,',
'        b.id_prdo',
'from fi_g_candidatos_vigencia a',
'join fi_g_fsclzc_expdn_cndd_vgnc c on a.id_cnddto_vgncia = c.id_cnddto_vgncia',
'join df_i_periodos            b   on  a.id_prdo   =   b.id_prdo',
'where a.id_cnddto = :P17_ID_CNDDTO',
'and   c.estdo = ''F''--  a.estdo = ''F''; ',
'--or  (:P17_CDGO_ACTO_TPO = ''ADACH'')',
'*/'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(62672599969191003)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(62672632949191004)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Per\00EDodo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(62672818494191006)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(63068136338591901)
,p_name=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(62672427183191002)
,p_internal_uid=>62672427183191002
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(62686370696284820)
,p_interactive_grid_id=>wwv_flow_api.id(62672427183191002)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(62686421772284821)
,p_report_id=>wwv_flow_api.id(62686370696284820)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62686969685284838)
,p_view_id=>wwv_flow_api.id(62686421772284821)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(62672599969191003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(62687435452284839)
,p_view_id=>wwv_flow_api.id(62686421772284821)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(62672632949191004)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(63074174432592637)
,p_view_id=>wwv_flow_api.id(62686421772284821)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(63068136338591901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146773131500606931)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'<i>Funcionalidad que permite generar, modificar y eliminar la plantilla del acto a generar.',
'        ',
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.<i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54709928661798641)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(54680185660671805)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:&P17_PAGE_ID.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63143174840146401)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(54680185660671805)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Generar Plantilla'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P17_ID_FSCLZCION_EXPDNTE_ACTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54719846171878594)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(54680185660671805)
,p_button_name=>'BTN_INSRTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P17_ID_FSCLZCION_EXPDNTE_ACTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58893013018642702)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(54680185660671805)
,p_button_name=>'BTN_CSAL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>'Causales'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP:P21_ID_ACTO_TPO:&P17_ID_ACTO_TPO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct 1',
'from fi_d_causal_acto',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_acto_tpo = :P17_ID_ACTO_TPO;'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54680385229671807)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(54680185660671805)
,p_button_name=>'BTN_APLCAR_CMBIO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P17_ID_FSCLZCION_EXPDNTE_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54829991634144103)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(54680185660671805)
,p_button_name=>'BTN_ELMNAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P17_ID_FSCLZCION_EXPDNTE_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71453991959642167)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(54680185660671805)
,p_button_name=>'BTN_SNCION'
,p_button_static_id=>'BTN_SNCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555595557968673)
,p_button_image_alt=>unistr('Generar Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP,31:P31_ID_FSCLZCION_EXPDNTE,P31_CDGO_ACTO_TPO,P31_ID_CNDDTO,P31_ID_FSCLZCION_EXPDNTE,P31_PGNA:&P16_ID_FSCLZCION_EXPDNTE.,&P17_CDGO_ACTO_TPO.,&P17_ID_CNDDTO.,&P17_ID_FSCLZCION_EXPDNTE.,&APP_PAGE_ID.'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28924060171595302)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(54680185660671805)
,p_button_name=>'BTN_PREVISOR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Pre Visualizar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P17_ID_FSCLZCION_EXPDNTE_ACTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(29221428647099602)
,p_branch_name=>'Visor'
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_VALOR,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_BFILE:gn_t_actos_temp,file_name,file_blob,file_mimetype,&P17_ID_FSCLZCION_EXPDNTE_ACTO.,id_orgen,FILE_BFILE&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(28924060171595302)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13803112035018201)
,p_name=>'P17_ID_FNCNRIO_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_prompt=>'Funcionarios'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.prmer_nmbre ||'' ''|| d.prmer_aplldo as  d,',
'       b.id_fncnrio                         as  r',
'from v_fi_g_candidatos a',
'join fi_g_candidatos_funcionario b on  a.ID_CNDDTO    =   b.ID_CNDDTO',
'join df_c_funcionarios           c on  b.id_fncnrio    =   c.id_fncnrio',
'join si_c_terceros               d on  c.id_trcro      =   d.id_trcro',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_cnddto = :P17_ID_CNDDTO',
'and b.id_fncnrio <> :F_ID_FNCNRIO;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_display_when=>'(:P17_CDGO_ACTO_TPO = ''ACEX'')'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54679931055671803)
,p_name=>'P17_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      distinct a.dscrpcion',
'           ,a.id_plntlla',
'from        gn_d_plantillas        a',
'left join  gn_d_actos_tipo_tarea   b   on  b.id_acto_tpo   =   a.id_acto_tpo',
'where       a.cdgo_clnte      =    :F_CDGO_CLNTE',
'and         a.id_acto_tpo     =    :P17_ID_ACTO_TPO',
'and         b.id_fljo_trea    =    :F_ID_FLJO_TREA',
'and         a.actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54680094786671804)
,p_name=>'P17_TXTDCMNTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_prompt=>'Documento'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_tag_attributes=>'opt'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    CKEDITOR.on( ''instanceReady'', function(ev) {',
'        ev.editor.on(''paste'', function (ev) {            ',
'            var value = window.localStorage[''jsonCausal''];           ',
'            try {',
'                var json = JSON.parse(value);',
'                ',
'                if(json.length > 0) {',
'                    ',
'                    var v_html = ''<ul>'';',
'                    ',
'                    json.forEach(function(element) {',
'                        v_html += ''<li>''+element.causal+''</li>'';                                             ',
'                    });                   ',
'                    v_html += ''</ul>'';                      ',
'                   CKEDITOR.instances.P17_TXTDCMNTO.insertHtml(v_html);                    ',
'                    window.localStorage.clear();',
'                }',
'                ',
'                ev.stop();',
'                return;            ',
'            } catch(error) {',
'                console.log(error);',
'            }',
'        });',
'    });',
'    console.log(''valor final'');',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.height = 400;',
'    opt.enterMode = 2;',
'    opt.resize_enabled = false;  ',
'    return opt;   ',
'     ',
'}',
'',
''))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54829761652144101)
,p_name=>'P17_ID_ACTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54829857639144102)
,p_name=>'P17_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54837533110225802)
,p_name=>'P17_ID_FSCLZCION_EXPDNTE_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55738094027837501)
,p_name=>'P17_ID_SJTO_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55738151998837502)
,p_name=>'P17_ID_INSTNCIA_FLJO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55738278971837503)
,p_name=>'P17_IDNTFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55756257513107401)
,p_name=>'P17_PAGE_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59841694981516101)
,p_name=>'P17_ID_FNCNRIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_prompt=>'Funcionarios'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.prmer_nmbre ||'' ''|| c.prmer_aplldo as  d,',
'       a.id_fncnrio                         as  r',
'from df_c_funcionarios          a',
'join fi_d_programas_funcionario b   on  a.id_fncnrio    =   b.id_fncnrio',
'join si_c_terceros              c   on  a.id_trcro      =   c.id_trcro',
'where c.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_prgrma = (select b.id_prgrma',
'                    from  fi_g_candidatos   b   ',
'                    where b.id_cnddto = :P17_ID_CNDDTO)',
'and a.id_fncnrio <> :F_ID_FNCNRIO                                          ',
'order by c.prmer_nmbre;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_display_when=>'(:P17_CDGO_ACTO_TPO = ''ACI'')'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MULTI'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59914158827317901)
,p_name=>'P17_ID_CNDDTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60041124358759301)
,p_name=>'P17_NUEVO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60047608027905601)
,p_name=>'P17_FNCNRIO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60085721881371803)
,p_name=>'P17_CDGO_ACTO_TPO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62995302273938801)
,p_name=>'P17_VGNCIA_JSON'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(54679865368671802)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(54680481905671808)
,p_name=>'Al cambiar la plantilla'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_ID_PLNTLLA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(54680553979671809)
,p_event_id=>wwv_flow_api.id(54680481905671808)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(59854541514827805)
,p_name=>'Al eliminar'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_ID_FNCNRIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_BE.CTB.SELECT2|ITEM TYPE|slctunselect'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59854639460827806)
,p_event_id=>wwv_flow_api.id(59854541514827805)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function eliminarFuncionario(id_funcionario){',
'        console.log(id_funcionario);',
'     try{',
'         ',
'         $("#P17_FNCNRIO").val(id_funcionario);',
'         ',
'         apex.server.process("EliminarFuncionarios",{',
'                pageItems: "#P17_FNCNRIO"',
'            },{',
'                success: function(data) {',
'                    if(data.o_cdgo_rspsta > 0) {',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors ([',
'                            {',
'                                type:       "error",',
'                                location:   "page",',
'                                message:    data.o_mnsje_rspsta,',
'                                unsafe:     false',
'                            }',
'                        ]);',
'                    }else{',
'                        //apex.message.showPageSuccess("Funcionarios Agregados");',
'                        fnc_gnrarDcmnto();',
'                        //apex.submit();',
'                    }',
'                }',
'            })',
'     ',
'     }catch(e){',
'        console.log(e);',
'     }',
'         ',
'    ',
'    ',
'    ',
'}',
'',
'eliminarFuncionario(this.data.select2.params.data.id)'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(62995471649938802)
,p_name=>'Al seleccionar vigencia'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(62672399972191001)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(62995502552938803)
,p_event_id=>wwv_flow_api.id(62995471649938802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJson();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67121102747334301)
,p_name=>'GenerarPlantilla'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(63143174840146401)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67121249539334302)
,p_event_id=>wwv_flow_api.id(67121102747334301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_gnrarDcmnto();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67121319746334303)
,p_name=>'GuardarPlantilla'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(54719846171878594)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67121421459334304)
,p_event_id=>wwv_flow_api.id(67121319746334303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_gstnrDcmnto("BTN_INSRTAR");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67121507464334305)
,p_name=>'AplicarCambios'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(54680385229671807)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67121666439334306)
,p_event_id=>wwv_flow_api.id(67121507464334305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_gstnrDcmnto("BTN_APLCAR_CMBIO");'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67121741286334307)
,p_name=>'EliminarPlantilla'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(54829991634144103)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67121810303334308)
,p_event_id=>wwv_flow_api.id(67121741286334307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_elmnarDcmnto();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54907240367699701)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar(1000);',
'',
'begin',
'',
'    begin',
'        select listagg(a.id_fncnrio, '':'') within group (order by a.id_fncnrio) as funcionario',
'        into :P17_ID_FNCNRIO',
'        from fi_g_candidatos_funcionario    a',
'        join fi_g_cnddtos_fncnrio_trza      b   on  a.id_cnddto_fncnrio =   b.id_cnddto_fncnrio',
'        where b.id_fljo_trea = :F_ID_FLJO_TREA;',
'    exception',
'        when others then',
'            :P17_ID_FNCNRIO := null;',
'    end;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'(:P17_ID_FSCLZCION_EXPDNTE_ACTO is not null)'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(60085679165371802)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida Tipo de acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select cdgo_acto_tpo ',
'    into :P17_CDGO_ACTO_TPO',
'    from gn_d_actos_tipo',
'    where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_acto_tpo = :P17_ID_ACTO_TPO;',
'exception',
'    when others then',
'        :P17_CDGO_ACTO_TPO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29221303027099601)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Visualizar PDF'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_exception       exception;',
'begin',
'    ',
'    pkg_fi_fiscalizacion.prc_rg_acto_temp(p_cdgo_clnte                   => :F_CDGO_CLNTE,',
'                                          p_id_usrio                     => :F_ID_USRIO,',
'                                          p_id_fsclzcion_expdnte_acto    => :P17_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                          p_id_cnddto                    => :P17_ID_CNDDTO,',
'                                          o_cdgo_rspsta                  => v_cdgo_rspsta,',
'                                          o_mnsje_rspsta                 => v_mnsje_rspsta);',
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
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(28924060171595302)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67105867711244801)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarPlantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dcmnto         clob;',
'begin',
'    ',
'    v_dcmnto := v_dcmnto || pkg_gn_generalidades.fnc_ge_dcmnto(p_xml => ''[{"CDGO_CLNTE":''              || :F_CDGO_CLNTE                ||'',',
'                                                                           "ID_SJTO_IMPSTO":''          || :P17_ID_SJTO_IMPSTO          ||'',',
'                                                                           "ID_INSTNCIA_FLJO":''        || :F_ID_INSTNCIA_FLJO          ||'',',
'                                                                           "IDNTFCCION":''              || :P17_IDNTFCCION              ||'',',
'                                                                           "ID_FSCLZCION_EXPDNTE":''    || :P17_ID_FSCLZCION_EXPDNTE    ||'',',
'                                                                           "ID_CNDDTO":''               || :P17_ID_CNDDTO               ||'',',
'                                                                           "ID_FNCNRIO":"''             || :P17_ID_FNCNRIO              ||''"',
'                                                                         }]'',',
'                                                               p_id_plntlla => :P17_ID_PLNTLLA',
'                                                              );',
'--insert into muerto(c_001,v_001,t_001)values(v_dcmnto,''Id plantilla''||:P17_ID_PLNTLLA, systimestamp )  ;commit;',
'   ',
'   apex_json.open_object;',
'   apex_json.write(''type'', 0);',
unistr('   apex_json.write(''msg'', ''Acci\00F3n procesada con \00E9xito.'');'),
'   apex_json.write(''doc'', v_dcmnto);',
'   apex_json.close_object;  ',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67105927977244802)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GuardarPlantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta                  number;',
'    v_cnddto_x_asgnar              number;',
'    v_id_fsclzcion_expdnte_acto    number;',
'    v_result                       number;',
'    v_request                      varchar2(100) := apex_application.g_x01;',
'    v_mnsje_rspsta                 varchar2(1000);',
'    v_json                         clob := ''{}'';',
'    v_dcmnto                       clob;',
'    v_exception                    exception;',
'begin',
'    ',
'    --Se obtiene el contenido del documetno',
'    for i in 1..apex_application.g_f01.count loop',
'        v_dcmnto := v_dcmnto || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    ',
'    --Se valida que se genere la plantilla',
'    if v_dcmnto is null then',
'        v_cdgo_rspsta := 1;',
'        v_mnsje_rspsta := ''Genere la plantilla.'';',
'        raise v_exception;',
'    end if;',
'     ',
'     /*if :P17_CDGO_ACTO_TPO = ''PCN'' then',
'         begin',
'             select id_fsclzcion_expdnte',
'             into v_result',
'             from fi_g_fiscalizacion_sancion',
'             where id_fsclzcion_expdnte = :P17_ID_FSCLZCION_EXPDNTE',
'             group by id_fsclzcion_expdnte;',
'         exception',
'             when no_data_found then',
'                 v_cdgo_rspsta := 2;',
unistr('                 v_mnsje_rspsta := ''Genere la sanci\00F3n por no enviar informaci\00F3n.'';'),
'                 raise v_exception;',
'             when others then',
'                 v_cdgo_rspsta := 3;',
'                 v_mnsje_rspsta :=  sqlerrm;',
'                 raise v_exception;',
'             ',
'         end;',
'     end if;*/',
'     ',
'    if (:P17_CDGO_ACTO_TPO = ''ACI'') or (:P17_CDGO_ACTO_TPO = ''ACEX'') then',
'    ',
'        v_dcmnto := pkg_gn_generalidades.fnc_ge_dcmnto(p_xml => ''[{"CDGO_CLNTE":''              || :F_CDGO_CLNTE             ||'',',
'                                                                   "ID_SJTO_IMPSTO":''          || :P17_ID_SJTO_IMPSTO       ||'',',
'                                                                   "ID_INSTNCIA_FLJO":''        || :F_ID_INSTNCIA_FLJO       ||'',',
'                                                                   "IDNTFCCION":''              || :P17_IDNTFCCION           ||'',',
'                                                                   "ID_FSCLZCION_EXPDNTE":''    || :P17_ID_FSCLZCION_EXPDNTE ||'',',
'                                                                   "ID_CNDDTO":''               || :P17_ID_CNDDTO            ||'',',
'                                                                   "ID_FNCNRIO":"''             || :P17_ID_FNCNRIO           ||''"',
'                                                                 }]'',',
'                                                       p_id_plntlla => :P17_ID_PLNTLLA',
'                                                      );                                                                 ',
'        begin',
'            ',
'            if v_request <> ''ELMNA_FNCNRIO'' then',
'                if :P17_ID_FNCNRIO is null then',
'                    v_cdgo_rspsta := 2;',
'                    v_mnsje_rspsta := ''Agregue los funcionarios'';',
'                    raise v_exception; ',
'                end if;',
'            end if;',
'            ',
'',
'            pkg_fi_fiscalizacion.prc_rg_cnddto_fncnrio_msvo(p_cdgo_clnte	   => :F_CDGO_CLNTE,',
'                                                            p_id_usrio         => :F_ID_USRIO,',
'                                                            p_funcionario      => :P17_ID_FNCNRIO,',
'                                                            p_candidato		   => ''{"ID_CNDDTO": ''||:P17_ID_CNDDTO||''}'',',
'                                                            p_id_fsclzcion_lte => :P17_ID_FSCLZCION_EXPDNTE,',
'                                                            p_id_fljo_trea     => :F_ID_FLJO_TREA,',
'                                                            o_cnddto_x_asgnar  => v_cnddto_x_asgnar,',
'                                                            o_cdgo_rspsta      => v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta     => v_mnsje_rspsta);',
'',
'            if (v_cdgo_rspsta <> 0) then',
'                raise v_exception; ',
'            end if;',
'        end;',
'    ',
'    end if;',
'',
'    begin',
'    ',
'        if :P17_VGNCIA_JSON is null and :P17_CDGO_ACTO_TPO <> ''ADACH'' then',
'            v_cdgo_rspsta := 3;',
'            v_mnsje_rspsta := ''Seleccione las vigencias'';',
'            raise v_exception;',
'        end if;',
'        ',
'        if :P17_CDGO_ACTO_TPO = ''ADACH'' then',
'            ',
'            select json_object(',
'                                ''VGNCIA'' VALUE (select json_arrayagg(',
'                                                                        json_object(''VGNCIA''    value   a.vgncia,',
'                                                                                    ''ID_PRDO''   value   a.id_prdo)',
'                                                                    ) ',
'                                                from v_fi_g_fiscalizacion_expdnte_dtlle a',
'                                                where a.id_cnddto = :P17_ID_CNDDTO',
'                                       --         and  a.estdo = ''P''',
'                                              )',
'                             )',
'            into :P17_VGNCIA_JSON ',
'            from dual;',
'        ',
'        end if;',
'    ',
'    ',
'        pkg_fi_fiscalizacion.prc_rg_expediente_acto(p_cdgo_clnte	            =>  :F_CDGO_CLNTE,',
'                                                    p_id_usrio                  =>  :F_ID_USRIO,',
'                                                    p_id_fljo_trea				=>  :F_ID_FLJO_TREA,',
'                                                    p_id_plntlla              	=>  :P17_ID_PLNTLLA,',
'                                                    p_id_acto_tpo            	=>  :P17_ID_ACTO_TPO,',
'                                                    p_id_fsclzcion_expdnte		=>  :P17_ID_FSCLZCION_EXPDNTE,',
'                                                    p_dcmnto                  	=>  v_dcmnto,',
'                                                    p_id_fsclzcion_expdnte_acto =>  :P17_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                    p_json                      =>  nvl(:P17_VGNCIA_JSON, v_json),',
'                                                    o_id_fsclzcion_expdnte_acto =>  v_id_fsclzcion_expdnte_acto,',
'                                                    o_cdgo_rspsta    			=>  v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta   			=>  v_mnsje_rspsta);',
'        ',
'        if (v_cdgo_rspsta <> 0) then',
'            raise v_exception; ',
'        end if;',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''type'', 0);',
'        apex_json.write(''doc'', v_dcmnto);',
'        apex_json.write(''o_id_fsclzcion_expdnte_acto'', v_id_fsclzcion_expdnte_acto);',
unistr('        apex_json.write(''msg'', ''Acci\00F3n procesada con \00E9xito.'');'),
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'        ',
'        ',
'    end;',
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
 p_id=>wwv_flow_api.id(67106061811244803)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EliminarPlantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar(1000);',
'    v_exception       exception;',
'',
'begin',
'',
'    pkg_fi_fiscalizacion.prc_el_expediente_acto(p_cdgo_clnte	            => :F_CDGO_CLNTE,',
'                                                p_id_usrio                  => :F_ID_USRIO,',
'                                                p_id_fsclzcion_expdnte_acto => :P17_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                p_id_fljo_trea              => :F_ID_FLJO_TREA,',
'                                                o_cdgo_rspsta    		    => v_cdgo_rspsta,',
'                                                o_mnsje_rspsta   		    => v_mnsje_rspsta);',
'    ',
'                          ',
'   if (v_cdgo_rspsta <> 0) then',
'		raise v_exception;',
'	end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'                                                ',
'                          ',
'exception',
'    when v_exception then',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(60047725562905602)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EliminarFuncionarios'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar(300);',
'',
'begin',
'     ',
'     pkg_fi_fiscalizacion.prc_el_funcionario(p_cdgo_clnte               =>  :F_CDGO_CLNTE,',
'                                             p_id_fncnrio               =>  :P17_FNCNRIO,',
'                                             p_id_fljo_trea             =>  null,',
'                                             o_cdgo_rspsta              => v_cdgo_rspsta,',
'                                             o_mnsje_rspsta             => v_mnsje_rspsta);',
'                                             ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'',  v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;  ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67227530802737101)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarDocumento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar(1000);',
'    v_dcmnto         clob;',
'    v_exception      exception;',
'begin',
'',
'    pkg_fi_fiscalizacion.prc_co_expediente_acto(p_cdgo_clnte	            => :F_CDGO_CLNTE,',
'                                                p_id_usrio                  => :F_ID_USRIO,',
'                                                p_id_fsclzcion_expdnte_acto => :P17_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                o_id_plntlla                => :P17_ID_PLNTLLA,',
'                                                o_dcmnto                    => v_dcmnto,',
'                                                o_cdgo_rspsta    		    => v_cdgo_rspsta,',
'                                                o_mnsje_rspsta   		    => v_mnsje_rspsta) ;',
'                                                ',
'    if (v_cdgo_rspsta <> 0) then',
'		raise v_exception; ',
'	end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''type'', 0);',
unistr('    apex_json.write(''msg'', ''Acci\00F3n procesada con \00E9xito.'');'),
'    apex_json.write(''doc'', v_dcmnto);',
'    apex_json.write(''plntlla'', :P17_ID_PLNTLLA);',
'    apex_json.close_object;  ',
'    ',
'    ',
'',
'exception',
'    when v_exception then',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
