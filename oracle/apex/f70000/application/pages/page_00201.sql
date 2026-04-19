prompt --application/pages/page_00201
begin
wwv_flow_api.create_page(
 p_id=>201
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Proceso de Liquidaci\00F3n - Arrendamientos')
,p_step_title=>unistr('Proceso de Liquidaci\00F3n - Arrendamientos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function revertirFlujo(){',
' var event = new Event(''eventRevertir'');',
' window.dispatchEvent(event);',
'}',
'',
'function procesoPreliquidacion(accion) {',
'  var $waitPopup;',
'  apex.message.clearErrors();',
'    ',
'  apex.server.process(',
'    "Ajax_Preliquidacion",',
'    {',
'      f01: accion',
'    },',
'    {',
'      beforeSend: function() {',
'        /*Inicio el bloqueo de pantalla*/ ',
'        $waitPopup = apex.widget.waitPopup();',
'      },',
'      success: function(s) {',
'                ',
'        /*Finaliza el bloqueo de pantalla*/ ',
'        $waitPopup.remove();',
'          ',
'        if (s.err) {',
'            /*Mensaje de Error de la UP*/',
'            apex.message.showErrors({',
'                                        type: apex.message.TYPE.ERROR,',
'                                        location: ["page"],',
'                                        message: s.msg.split(":")[1].trim(),',
'                                        unsafe: false ',
'                                    });',
'        } else {',
'            /*Mensaje de Exito de la UP*/ ',
'            apex.message.showPageSuccess(s.msg);',
'            ',
'            setTimeout(function(){ ',
'                                    accion === "R" ? revertirFlujo() : apex.submit()',
'                                 } , 2000 );',
'        }',
'      },',
'      error: function(e) {',
'          /*Finaliza el bloqueo de pantalla*/ ',
'          $waitPopup.remove();',
'          /*Mensaje de Error del servidor*/',
'          apex.message.showErrors({',
'                                      type: apex.message.TYPE.ERROR,',
'                                      location: ["page"],',
'                                      message: e.responseText,',
'                                      unsafe: false',
'                                  });',
'',
'          console.log("error", e);          ',
'      }',
'    }',
'  );',
'}',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210401110602'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107465942633427307)
,p_plug_name=>unistr('Liquidaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_lqdcion   ',
'       ,idntfccion_antrior   ',
'       ,b.prmer_nmbre  ',
'       ,to_char(bse_grvble,''999G999G999G999G990'') bse_grvble',
'       ,to_char(vlor_ttal,''999G999G999G999G990'') vlor_ttal  ',
'from v_gi_g_liquidaciones a',
'     left join si_i_sujetos_responsable    b  on a.id_sjto_impsto =  b.id_sjto_impsto',
'                                            and b.prncpal_s_n = ''S''',
'where id_impsto = :P203_IMPUESTO',
'    and id_impsto_sbmpsto = :P203_IMPUESTO_SUBIMPUESTO',
'    and id_prdo = :P203_PERIODO;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108219901350137601)
,p_name=>'ID_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(108220028515137602)
,p_name=>'IDNTFCCION_ANTRIOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_ANTRIOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(108220159563137603)
,p_name=>'PRMER_NMBRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRMER_NMBRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108220261446137604)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(108220316878137605)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_api.id(107466100857427309)
,p_internal_uid=>107466100857427309
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
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
 p_id=>wwv_flow_api.id(107482235683583178)
,p_interactive_grid_id=>wwv_flow_api.id(107466100857427309)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(107482327943583179)
,p_report_id=>wwv_flow_api.id(107482235683583178)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108225847222141271)
,p_view_id=>wwv_flow_api.id(107482327943583179)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(108219901350137601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108226228079142693)
,p_view_id=>wwv_flow_api.id(107482327943583179)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(108220028515137602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108226795350142696)
,p_view_id=>wwv_flow_api.id(107482327943583179)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(108220159563137603)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108227280332142698)
,p_view_id=>wwv_flow_api.id(107482327943583179)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(108220261446137604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108227733851142700)
,p_view_id=>wwv_flow_api.id(107482327943583179)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(108220316878137605)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(176276521681287810)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'F_ID_INSTNCIA_FLJO'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(206166162334931367)
,p_plug_name=>'Ayuda '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'    Funcionalidad que permite: <br/><br/>',
unistr('    <b>1.</b> Generar la Liquidaci\00F3n.<br/><br/>'),
unistr('    <b>2.</b> Revertir la Liquidaci\00F3n.<br/><br/>  '),
'    ',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(274320808975328722)
,p_plug_name=>'Opciones '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 ',
'   from wf_g_instancias_transicion',
'  where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'    and id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'    and id_estdo_trnscion  in ( 1 , 2 )'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(323063416441395707)
,p_plug_name=>unistr('Proceso Liquidaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107502606962103201)
,p_plug_name=>'<b>Arrendamientos Liquidados</b>'
,p_parent_plug_id=>wwv_flow_api.id(323063416441395707)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>110
,p_plug_grid_column_span=>6
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Arrendamientos Liquidados'' as label ',
'       , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value ',
'from  gi_g_liquidaciones a ',
'where id_impsto = :P203_IMPUESTO',
'    and id_impsto_sbmpsto = :P203_IMPUESTO_SUBIMPUESTO ',
'    and id_prdo = :P203_PERIODO;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107447804231269357)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(323063416441395707)
,p_button_name=>'BTN_LIQUIDAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Generar Liquidaci\00F3n')
,p_button_position=>'TOP'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea generar la liquidaciÃ³n?'', ''BTN_LIQUIDAR'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gi_g_liquidaciones ',
'where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto  = :P203_IMPUESTO',
'    and id_impsto_sbmpsto = :P203_IMPUESTO_SUBIMPUESTO',
'    and vgncia         = :P203_VIGENCIA',
'    and id_prdo        = :P203_PERIODO;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108125460117300802)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(323063416441395707)
,p_button_name=>'BTN_RV_LIQUIDACION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Reversar Liquidaci\00F3n')
,p_button_position=>'TOP'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea REVERSAR la liquidaciÃ³n?'', ''BTN_RV_LIQUIDACION'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
' v_cntidad           number;',
' ',
'begin',
'',
'    select count(1) ',
'        into v_cntidad',
'    from gi_g_liquidaciones a',
'    where cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_impsto = :P203_IMPUESTO',
'        and a.id_impsto_sbmpsto = :P203_IMPUESTO_SUBIMPUESTO ',
'        and a.id_prdo = :P203_PERIODO  ;',
'   ',
'   if v_cntidad > 0  and :P201_ID_ESTDO_TRNSCION != 3 then ',
'         return true;',
'   else',
'       return false;',
'   end if;',
'',
'',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107449768076269404)
,p_name=>'P201_IMPUESTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(323063416441395707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107450561984269406)
,p_name=>'P201_PERIODO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(323063416441395707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107450966896269406)
,p_name=>'P201_IMPUESTO_SUBIMPUESTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(323063416441395707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107451362594269407)
,p_name=>'P201_ID_INSTNCIA_TRNSCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(323063416441395707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108125389964300801)
,p_name=>'P201_MNSJE_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(323063416441395707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108163187085834601)
,p_name=>'P201_VIGENCIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(323063416441395707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108320384618819102)
,p_name=>'P201_ESTDO_INSTNCIA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(323063416441395707)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108327791550966802)
,p_name=>'P201_ID_ESTDO_TRNSCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(323063416441395707)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(107453965174269413)
,p_computation_sequence=>10
,p_computation_item=>'P201_ID_INSTNCIA_TRNSCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_instncia_trnscion ',
'  from wf_g_instancias_transicion ',
' where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'   and id_fljo_trea_orgen = :F_ID_FLJO_TREA'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(108327682176966801)
,p_computation_sequence=>20
,p_computation_item=>'P201_ID_ESTDO_TRNSCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_estdo_trnscion ',
'  from wf_g_instancias_transicion ',
' where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'   and id_fljo_trea_orgen = :F_ID_FLJO_TREA'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(108320250958819101)
,p_computation_sequence=>30
,p_computation_item=>'P201_ESTDO_INSTNCIA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select estdo_instncia',
'  from wf_g_instancias_flujo ',
' where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO;'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107431848012188711)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Liquidar Arrendamiento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'	v_cdgo_rspsta		         number;',
'	v_mnsje_rspsta		         varchar2(2000)	:= ''Inicio'';',
'',
'Begin',
'',
'       begin ',
'    ',
'           pkg_gi_arrendamiento.prc_rg_liquidacion_masiva (   p_cdgo_clnte    =>  :F_CDGO_CLNTE,',
'                                                              p_id_prdo       =>  :P201_PERIODO,',
'                                                              p_id_usrio      =>  :F_ID_USRIO,',
'                                                              o_cdgo_rspsta   =>  v_cdgo_rspsta,',
'                                                              o_mnsje_rspsta  =>  v_mnsje_rspsta );',
'       ',
'         :P201_MNSJE_RSPSTA :=  v_mnsje_rspsta;',
'         ',
'         if (v_cdgo_rspsta <> 0) then',
'                 raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
'            end if;',
'            ',
'         exception',
'            when others then ',
'                rollback;',
'		        raise_application_error(-20001, ''2. '' ||v_mnsje_rspsta);',
'        end; ',
'',
'',
'End;'))
,p_process_error_message=>'&P201_MNSJE_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(107447804231269357)
,p_process_success_message=>'&P201_MNSJE_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108125551889300803)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reversar liquidacion Arrendamiento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'	v_cdgo_rspsta		         number;',
'	v_mnsje_rspsta		         varchar2(2000)	:= ''Inicio'';',
'',
'Begin',
'',
'       begin ',
'    ',
'           pkg_gi_arrendamiento.prc_rv_liquidacion (  p_cdgo_clnte              =>  :F_CDGO_CLNTE',
'                                                    , p_id_impsto       	    =>  :P201_IMPUESTO',
'                                                    , p_id_impsto_sbmpsto		=>  :P201_IMPUESTO_SUBIMPUESTO',
'                                                    , p_vgncia                  =>  :P201_VIGENCIA',
'                                                    , p_id_prdo                 =>  :P201_PERIODO',
'                                                    , o_cdgo_rspsta             =>  v_cdgo_rspsta',
'                                                    , o_mnsje_rspsta            =>  v_mnsje_rspsta);',
'       ',
'         :P201_MNSJE_RSPSTA :=  v_mnsje_rspsta;',
'         ',
'         if (v_cdgo_rspsta <> 0) then',
'                 raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
'            end if;',
'            ',
'         exception',
'            when others then ',
'                rollback;',
'		        raise_application_error(-20001, ''2. '' ||v_mnsje_rspsta);',
'        end; ',
'',
'',
'End;'))
,p_process_error_message=>'&P201_MNSJE_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(108125460117300802)
,p_process_success_message=>'&P201_MNSJE_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107465398422427301)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Impuesto-SubImpuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_impsto , id_impsto_sbmpsto ',
' into :P201_IMPUESTO , :P201_IMPUESTO_SUBIMPUESTO ',
'from v_df_i_impuestos_subimpuesto',
'where cdgo_clnte = :F_CDGO_CLNTE',
'    and cdgo_impsto =''ARD'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
