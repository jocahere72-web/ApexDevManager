prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>unistr('Gesti\00F3n Flujos Usuarios Sujeto Impuesto')
,p_step_title=>unistr('Gesti\00F3n Usuarios Sujeto Impuesto')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iniciar_flujo(id_instancia,id_fljo_trea){',
'    apex.server.process("ajax_iniciarFlujo", {',
'        f01: id_instancia,',
'        f02: id_fljo_trea',
'    }, {',
'        success: function (data) { ',
'                if (data.type === ''OK'') {',
'                    window.localStorage.clear();',
'                    window.location.href = data.url;',
'                    //window.open(data.url);',
'                }else{',
'                    apex.message.showErrors({',
'                        type: apex.message.TYPE.ERROR,',
'                        location: ["page"],',
'                        message: data.msg,',
'                        unsafe: false',
'                    });',
'                }',
'            },',
'            error: function () {',
'                console.log(arguments);',
'            }',
'        }); ',
'}',
'',
'function obtenerSeleccion(){',
'   var region = apex.region("P14_GRID_FLUJOS");',
'   var v_seleccionados  = [];',
'   if (region) {',
'       var view = region.widget().interactiveGrid("getViews", "grid");',
'       var model = view.model;  ',
'       var records = view.view$.grid("getSelectedRecords");',
'       if($.isEmptyObject(records) == false){',
'           for(let i=0; i<records.length; i++){',
'			   v_seleccionados.push(model.getValue(records[i], "ID_INSTNCIA_FLJO").trim());',
'           }',
'		   $s("P14_SELECCION",v_seleccionados);',
'       }',
'       else{',
'          $s("P14_SELECCION",null);  ',
'       }',
'   } ',
'}'))
,p_step_template=>wwv_flow_api.id(29911946739317080)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200804185800'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80774938792050801)
,p_plug_name=>unistr('Gesti\00F3n Usuarios Sujeto Impuesto')
,p_region_name=>'P14_GRID_FLUJOS'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29943643729317093)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.id_instncia_fljo,',
'            g.id_usrio_slctud,',
'            e.nmbre_trea,',
'            a.id_fljo_trea,',
'            c.fcha_incio,',
'            k.nmro_rdcdo_dsplay,',
'            k.fcha_rdcdo',
'from        v_sg_g_usrios_sjto_impto_trea   a',
'inner join  wf_g_instancias_transicion      b   on  b.id_fljo_trea_orgen    =   a.id_fljo_trea',
'inner join  wf_g_instancias_flujo           c   on  c.id_instncia_fljo      =   b.id_instncia_fljo',
'inner join  wf_d_flujos_tarea               d   on  d.id_fljo_trea          =   a.id_fljo_trea',
'inner join  wf_d_tareas                     e   on  e.id_trea               =   d.id_trea',
'inner join  wf_d_flujos                     f   on  f.id_fljo               =   c.id_fljo',
'left  join  sg_g_usrios_slctud              g   on  g.id_instncia_fljo      =   c.id_instncia_fljo',
'left  join  sg_g_usrios_sjto_impsto         h   on  h.id_usrio_slctud       =   g.id_usrio_slctud',
'left  join  si_i_sujetos_impuesto           i   on  i.id_sjto_impsto        =   h.id_sjto_impsto',
'left  join  si_c_sujetos                    j   on  j.id_sjto               =   i.id_sjto',
'left  join  pq_g_solicitudes                k   on  k.id_slctud             =   g.id_slctud',
'where       f.cdgo_clnte                    =   :F_CDGO_CLNTE',
'and         a.id_usrio                      =   :F_ID_USRIO',
'and         nvl(h.id_impsto, 0)             =   nvl(:P14_ID_IMPSTO, nvl(h.id_impsto, 0))',
'and         nvl(j.idntfccion, 0)            =   nvl(:P14_IDNTFCCION, nvl(j.idntfccion, 0))',
'--and         f.id_fljo                       =   nvl(:P110_ID_FLJO, f.id_fljo)',
'and         e.id_trea                       =   nvl(:P14_ID_TREA, e.id_trea)',
'and         b.id_instncia_trnscion          =   (select      max(l.id_instncia_trnscion)',
'                                                 from        wf_g_instancias_transicion  l',
'                                                 where       l.id_instncia_fljo  =   c.id_instncia_fljo',
'                                                )',
'and         trunc(c.fcha_incio) between :P14_FECHA and :P14_FECHA_HASTA',
'group by    b.id_instncia_fljo,',
'            g.id_usrio_slctud,',
'            e.nmbre_trea,',
'            a.id_fljo_trea,',
'            c.fcha_incio,',
'            k.nmro_rdcdo_dsplay,',
'            k.fcha_rdcdo;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(80775165213050803)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(80775265436050804)
,p_name=>'ID_USRIO_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(80775306362050805)
,p_name=>'NMBRE_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
 p_id=>wwv_flow_api.id(80775452457050806)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(80775528936050807)
,p_name=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Inicio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(80775667709050808)
,p_name=>'NMRO_RDCDO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(80775738836050809)
,p_name=>'FCHA_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RDCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(80776682624050818)
,p_name=>'Opciones'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.,&ID_FLJO_TREA.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir a flujo',
'    <span class="fa fa-external-link-square"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(80775093372050802)
,p_internal_uid=>80775093372050802
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(80780732259060172)
,p_interactive_grid_id=>wwv_flow_api.id(80775093372050802)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(80780883907060172)
,p_report_id=>wwv_flow_api.id(80780732259060172)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80781203533060177)
,p_view_id=>wwv_flow_api.id(80780883907060172)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(80775165213050803)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80781720886060181)
,p_view_id=>wwv_flow_api.id(80780883907060172)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(80775265436050804)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80782208380060183)
,p_view_id=>wwv_flow_api.id(80780883907060172)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(80775306362050805)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80782787089060190)
,p_view_id=>wwv_flow_api.id(80780883907060172)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(80775452457050806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80783221788060192)
,p_view_id=>wwv_flow_api.id(80780883907060172)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(80775528936050807)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80783745181060193)
,p_view_id=>wwv_flow_api.id(80780883907060172)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(80775667709050808)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80784216164060195)
,p_view_id=>wwv_flow_api.id(80780883907060172)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(80775738836050809)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(80799909309290346)
,p_view_id=>wwv_flow_api.id(80780883907060172)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(80776682624050818)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80775868761050810)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29933691268317090)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80776504897050817)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
unistr('<i>Funcionalidad que permite gestionar las solicitudes de relaci\00F3n de usuarios con Sujeto-Tributo.</i><br><br>'),
'<center><i><b>En el uso:</b></i><br><br></center>',
'<i>1. Seleccionar el flujo de proceso y la tarea correspondiente.</i><br><br>',
unistr('<i>2. Como par\00E1metros opcionales se encuentran el Tributo y Subtributo, adem\00E1s de identificar un flujo de proceso para un Sujeto-Tributo especifico.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80776475495050816)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(80775868761050810)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80775920198050811)
,p_name=>'P14_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(80775868761050810)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80776091299050812)
,p_name=>'P14_FECHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80775868761050810)
,p_item_default=>'add_months(systimestamp, -1)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Desde</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80776122623050813)
,p_name=>'P14_FECHA_HASTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(80775868761050810)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Hasta</b>'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P110_FECHA.'
,p_attribute_03=>'+1d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80776265075050814)
,p_name=>'P14_ID_TREA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(80775868761050810)
,p_prompt=>'<b>Tarea</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      distinct c.nmbre_trea,',
'            c.id_trea',
'from        v_sg_g_usrios_sjto_impto_trea    a',
'inner join  wf_d_flujos_tarea               b   on  b.id_fljo_trea  =   a.id_fljo_trea',
'inner join  wf_d_tareas                     c   on  c.id_trea       =   b.id_trea',
'inner join  wf_d_flujos                     d   on  d.id_fljo       =   b.id_fljo',
'where       d.cdgo_clnte    =   :F_CDGO_CLNTE',
'and         a.id_usrio      =   :F_ID_USRIO',
'and         b.actvo         =   ''S''',
'--and         b.id_fljo       =   :P110_ID_FLJO',
'order by    c.nmbre_trea;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80776380012050815)
,p_name=>'P14_IDNTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(80775868761050810)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29996260025317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80776743791050819)
,p_name=>'P14_SELECCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(80775868761050810)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(80776863391050820)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_iniciarFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number := apex_application.g_f02(1);',
'    v_url varchar2(4000);',
'    ',
'begin',
'     apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'     apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
'      v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                    p_id_fljo_trea     => v_id_fljo_trea,',
'                                                    p_clear_session    => ''S'');',
'        ',
'     apex_json.open_object;',
'     apex_json.write(''type'', ''OK'');',
'     apex_json.write(''msg'', ''Url generada exitosamente'');',
'     apex_json.write(''url'', v_url);',
'     apex_json.close_all();',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
