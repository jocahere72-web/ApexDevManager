prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>unistr('Gesti\00F3n de Recursos')
,p_step_title=>unistr('Gesti\00F3n de Recursos')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iniciar_flujo(id_instancia){',
'    apex.server.process("IniciarFlujo", {',
'        f01: id_instancia',
'    }, {',
'        success: function (data) { ',
'                if (data.type === ''OK'') {',
'                    window.localStorage.clear();',
'                    window.location.href = data.url;',
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
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'    if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'        $(''#''+id).click();',
'    }',
'}',
'',
'buttonCollapse(''t_Button_rightControlButton'');'))
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(73037951423586621)
,p_last_updated_by=>'122333'
,p_last_upd_yyyymmddhh24miss=>'20220124154301'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119079256543332508)
,p_plug_name=>'Recursos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72924185829094489)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select a.id_instncia_fljo,',
'       b.dscrpcion_fljo,',
'       d.nmro_rdcdo_dsplay,',
'       d.fcha_rdcdo,',
'       d.fcha_pryctda,',
'       d.nmbre_impsto,',
'       d.nmbre_impsto_sbmpsto,',
'       h.dscrpcion_rcrso_tpo,',
'       g.id_fljo_trea,',
'       g.nmbre_trea,',
'       a.estdo_instncia',
'from wf_g_instancias_flujo a',
'inner join wf_d_flujos b on a.id_fljo = b.id_fljo',
'left join wf_g_instancias_flujo_gnrdo c on a.id_instncia_fljo = c.id_instncia_fljo_gnrdo_hjo',
'left join v_pq_g_solicitudes d on b.cdgo_clnte = d.cdgo_clnte and',
'                                  c.id_instncia_fljo = d.id_instncia_fljo',
'inner join wf_g_instancias_transicion f on a.id_instncia_fljo     = f.id_instncia_fljo and',
'                                           f.id_instncia_trnscion = (select max(id_instncia_trnscion)',
'                                                                     from wf_g_instancias_transicion',
'                                                                     where id_instncia_fljo = a.id_instncia_fljo) and',
'                                           f.id_usrio   = :F_ID_USRIO ',
'left join v_wf_d_flujos_tarea g on f.id_fljo_trea_orgen = g.id_fljo_trea',
'left join v_gj_g_recursos h on a.id_instncia_fljo = h.id_instncia_fljo_hjo',
'where   b.cdgo_clnte                    = :F_CDGO_CLNTE and',
'        b.id_prcso                      = 14 and',
'        nvl(d.id_impsto, 0)             = nvl(:P4_ID_IMPSTO, nvl(d.id_impsto, 0)) and',
'        nvl(d.id_impsto_sbmpsto, 0)     = nvl(:P4_ID_IMPSTO_SBMPSTO, nvl(d.id_impsto_sbmpsto, 0)) and',
'        b.id_fljo                       = nvl(:P4_ID_FLJO, b.id_fljo) and',
'        g.id_fljo_trea                  = nvl(:P4_ID_TREA, g.id_fljo_trea)',
'order by d.fcha_rdcdo desc',
'',
'*/',
'',
'/*',
'select      b.id_instncia_fljo,',
'            d.dscrpcion_fljo,',
'            k.nmro_rdcdo_dsplay,',
'            k.fcha_rdcdo,',
'            k.fcha_pryctda,',
'            k.idntfccion,',
'            k.nmbre_impsto,',
'            k.nmbre_impsto_sbmpsto,',
'            g.dscrpcion_rcrso_tpo,',
'            d.id_fljo_trea,',
'            d.nmbre_trea,',
'            b.estdo_instncia   ',
'  from wf_g_instancias_flujo b',
'  join wf_g_instancias_transicion c   on c.id_instncia_fljo      =   b.id_instncia_fljo',
'  join v_wf_d_flujos_tarea          d   on  d.id_fljo_trea          =   c.id_fljo_trea_orgen',
'  join  (select dscrpcion_rcrso_tpo,id_instncia_fljo_hjo, id_slctud ',
'           from v_gj_g_recursos',
'          union all ',
'          select null,id_instncia_fljo_indc, null from  gj_g_recursos_accion a',
'           where id_instncia_fljo_indc is not null ) g   on  g.id_instncia_fljo_hjo  =   c.id_instncia_fljo',
'  left  join  v_pq_g_solicitudes              k   on  k.id_slctud             =   g.id_slctud',
'  ',
'  where       d.cdgo_clnte                    =   :F_CDGO_CLNTE',
'and         nvl(k.id_impsto, 0)             =   nvl(:P4_ID_IMPSTO, nvl(k.id_impsto, 0))',
'and         nvl(k.id_impsto_sbmpsto, 0)     =   nvl(:P4_ID_IMPSTO_SBMPSTO, nvl(k.id_impsto_sbmpsto, 0))',
'and         b.id_fljo                       =   nvl(:P4_ID_FLJO, b.id_fljo)',
'and         d.id_trea                       =   nvl(:P4_ID_TREA, d.id_trea)',
'and         c.id_instncia_trnscion          =   (select      max(l.id_instncia_trnscion)',
'                                                 from        wf_g_instancias_transicion  l',
'                                                 where       l.id_instncia_fljo  =   c.id_instncia_fljo',
'                                                );*/',
'select      b.id_instncia_fljo,',
'            d.dscrpcion_fljo,',
'            k.nmro_rdcdo_dsplay,',
'            k.fcha_rdcdo,',
'            k.fcha_pryctda,',
'            k.idntfccion,',
'            k.nmbre_impsto,',
'            k.nmbre_impsto_sbmpsto,',
'            g.dscrpcion_rcrso_tpo,',
'            d.id_fljo_trea,',
'            d.nmbre_trea,',
'            b.estdo_instncia   ',
'  from wf_g_instancias_flujo      b',
'  join wf_g_instancias_transicion c   on  c.id_instncia_fljo      =   b.id_instncia_fljo',
'  join v_wf_d_flujos_tarea        d   on  d.id_fljo_trea          =   c.id_fljo_trea_orgen',
'  join  ( ',
'        select dscrpcion_rcrso_tpo,id_instncia_fljo_hjo, id_slctud ',
'        from v_gj_g_recursos',
'        union all ',
'        select b.dscrpcion_rcrso_tpo, id_instncia_fljo_indc,b.id_slctud ',
'        from  gj_g_recursos_accion a',
'        join v_gj_g_recursos       b    on a.id_rcrso = b.id_rcrso',
'        where a.id_instncia_fljo_indc is not null',
'        ) g   on  g.id_instncia_fljo_hjo  =   c.id_instncia_fljo',
'  left  join  v_pq_g_solicitudes              k   on  k.id_slctud             =   g.id_slctud',
'  ',
'  where       d.cdgo_clnte                    =  :F_CDGO_CLNTE',
'and         nvl(k.id_impsto, 0)             =   nvl(:P4_ID_IMPSTO, nvl(k.id_impsto, 0))',
'and         nvl(k.id_impsto_sbmpsto, 0)     =   nvl(:P4_ID_IMPSTO_SBMPSTO, nvl(k.id_impsto_sbmpsto, 0))',
'and         b.id_fljo                       =   nvl(:P4_ID_FLJO, b.id_fljo)',
'and         d.id_trea                       =   nvl(:P4_ID_TREA, d.id_trea)',
'and         c.id_instncia_trnscion          =   (select      max(l.id_instncia_trnscion)',
'                                                 from        wf_g_instancias_transicion  l',
'                                                 where       l.id_instncia_fljo  =   c.id_instncia_fljo',
'                                                );',
'                                                '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(119080582893332521)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay recursos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'javascript:iniciar_flujo(#ID_INSTNCIA_FLJO#);'
,p_detail_link_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir a flujo &ID_INSTNCIA_FLJO.',
'    <span class="fa fa-external-link-square"></span>',
'</button>'))
,p_owner=>'JCUAO'
,p_internal_uid=>119080582893332521
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119080653636332522)
,p_db_column_name=>'ID_INSTNCIA_FLJO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Instancia del Flujo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119080766314332523)
,p_db_column_name=>'DSCRPCION_FLJO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Flujo de Proceso'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119080843346332524)
,p_db_column_name=>'NMRO_RDCDO_DSPLAY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. Radicado PQR'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119080964408332525)
,p_db_column_name=>'FCHA_RDCDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Fecha de Radicaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119081050432332526)
,p_db_column_name=>'FCHA_PRYCTDA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha Proyectada'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119081137938332527)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119081281680332528)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Sub-Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119081356781332529)
,p_db_column_name=>'DSCRPCION_RCRSO_TPO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Tipo de Recurso'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119081456241332530)
,p_db_column_name=>'ID_FLJO_TREA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Id Fljo Trea'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119081585408332531)
,p_db_column_name=>'NMBRE_TREA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Tarea Actual'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119081691701332532)
,p_db_column_name=>'ESTDO_INSTNCIA'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Estado del Flujo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71970696603089601)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(119103058091336294)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1191031'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_INSTNCIA_FLJO:DSCRPCION_FLJO:NMRO_RDCDO_DSPLAY:FCHA_RDCDO:FCHA_PRYCTDA:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:DSCRPCION_RCRSO_TPO:ID_FLJO_TREA:NMBRE_TREA:ESTDO_INSTNCIA:IDNTFCCION'
,p_sort_column_1=>'ID_INSTNCIA_FLJO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(322500972765190330)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72914184168094485)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(486153235244189474)
,p_plug_name=>'Ayuda'
,p_region_name=>'P110_GRID_FLUJOS'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
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
'<i>Funcionalidad que permite gestionar los recursos en el sistema.</i><br><br>',
'<center><i><b>En el uso:</b></i><br><br></center>',
'<i>1. Seleccionar el flujo de proceso y la tarea correspondiente correspondiente</i><br><br>',
unistr('<i>2. Como par\00E1metros opcionales se encuentran el Tributo y Subtributo.</i><br><br>'),
'<i>',
'    <br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(118958401125016607)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(322500972765190330)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118958889721016609)
,p_name=>'P4_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(322500972765190330)
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
,p_cHeight=>1
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118959272073016614)
,p_name=>'P4_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(322500972765190330)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto_sbmpsto,',
'       a.id_impsto_sbmpsto ',
'from df_i_impuestos_subimpuesto a',
'where a.id_impsto = :P4_ID_IMPSTO'))
,p_lov_cascade_parent_items=>'P4_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118959604256016614)
,p_name=>'P4_ID_FLJO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(322500972765190330)
,p_prompt=>'<b>Flujo de Proceso</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_fljo,',
'        a.id_fljo',
'from    wf_d_flujos a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_prcso      =   14',
'and     a.actvo         =   ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(118960094838016615)
,p_name=>'P4_ID_TREA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(322500972765190330)
,p_prompt=>'<b>Tarea</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      distinct c.nmbre_trea,',
'            c.id_trea',
'from        v_gf_g_gstion_jrdca_tareas      a',
'inner join  wf_d_flujos_tarea               b   on  b.id_fljo_trea  =   a.id_fljo_trea',
'inner join  wf_d_tareas                     c   on  c.id_trea       =   b.id_trea',
'inner join  wf_d_flujos                     d   on  d.id_fljo       =   b.id_fljo',
'where       d.cdgo_clnte    =   :F_CDGO_CLNTE',
'and         a.id_usrio      =   :F_ID_USRIO',
'and         b.actvo         =   ''S''',
'and         b.id_fljo       =   :P4_ID_FLJO',
'order by    c.nmbre_trea;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P4_ID_FLJO'
,p_ajax_items_to_submit=>'P4_ID_TREA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(72976716404094542)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(118966055953021686)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number;',
'    v_url varchar2(4000);',
'    ',
'begin',
'    begin',
'        apex_json.initialize_output( p_http_cache => false );',
'        owa_util.mime_header(''application/json'', false);',
'        htp.p(''cache-control: no-cache'');',
'        htp.p(''pragma: no-cache'');',
'        owa_util.http_header_close;',
'        apex_json.open_object();  ',
'    ',
'    begin',
'    ',
'        select a.id_fljo_trea_orgen ',
'          into v_id_fljo_trea',
'          from wf_g_instancias_transicion a',
'         where a.id_instncia_fljo = v_id_instncia_fljo',
'           and a.id_estdo_trnscion in (1,2);',
'           ',
'    exception when no_data_found then',
'              ',
'              begin                   ',
'                  select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                    into v_id_fljo_trea',
'                    from wf_g_instancias_transicion ',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception when no_data_found  then',
'                        v_id_fljo_trea := null;',
'              end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'        ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'        ',
'        else',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'        ',
'        end if;',
'        apex_json.close_object();',
'    ',
'    exception when others then ',
'      apex_json.open_object();',
'      apex_json.write(''type'', ''OK'');',
'      apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'      apex_json.close_object();',
'  end;',
'  ',
'  apex_json.close_all();',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
