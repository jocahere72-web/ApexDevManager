prompt --application/pages/page_00173
begin
wwv_flow_api.create_page(
 p_id=>173
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Consulta Solicitudes de Productos '
,p_step_title=>'Consulta Solicitudes de Productos '
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iniciar_flujo(id_instancia){',
'    apex.server.process("IniciarFlujo", {',
'        f01: id_instancia',
'    }, {',
'        success: function (data) { ',
'            console.log(data);',
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
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'122333'
,p_last_upd_yyyymmddhh24miss=>'20201214102114'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95957018697150826)
,p_plug_name=>'Solicitudes de Productos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_instncia_fljo',
'     , d.idntfccion',
'     , d.nmbre_rzon_scial',
'     , a.nmro_rnta',
'     , a.fcha_rgstro',
'     , c.dscrpcion',
'     , b.nmbre_trcro',
'     , ''<button onclick="iniciar_flujo(''||a.id_instncia_fljo||'')" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir a flujo<span class="fa fa-external-link-square"></span></button>'' as link',
'from gi_g_rentas        a',
'join v_sg_g_usuarios    b  on a.id_usrio        = b.id_usrio',
'join gi_d_rentas_estado c  on a.cdgo_rnta_estdo = c.cdgo_rnta_estdo',
'join (',
'         select a.id_sjto_impsto',
'              , b.idntfccion',
'              , c.nmbre_rzon_scial',
'           from si_i_sujetos_impuesto a',
'          join si_c_sujetos          b on a.id_sjto        = b.id_sjto',
'           join si_i_personas         c on a.id_sjto_impsto = c.id_sjto_impsto',
'          where a.id_impsto  = :P173_ID_IMPSTO',
'            --and b.idntfccion = nvl(:P173_IDNTFCCION, b.idntfccion)    ',
'      )                 d on a.id_sjto_impsto = d.id_sjto_impsto',
'where a.cdgo_clnte              = :F_CDGO_CLNTE',
'  and a.id_impsto               = :P173_ID_IMPSTO',
'  and a.id_impsto_sbmpsto       = :P173_ID_IMPSTO_SUBMPSTO',
'  and a.nmro_rnta               = nvl(:P173_NRO_SLCTUD, a.nmro_rnta)',
'  and a.cdgo_rnta_estdo         = nvl(:P173_ESTDO, a.cdgo_rnta_estdo)',
'  and d.idntfccion              = nvl(:P173_IDNTFCCION, d.idntfccion)',
'  and a.id_usrio                = nvl(:P173_USRIO, a.id_usrio)',
'  and (trunc(a.fcha_rgstro) >= :P173_FCHA_DSDE or  :P173_FCHA_DSDE is null )',
'  and (trunc(a.fcha_rgstro) <= :P173_FCHA_HSTA or  :P173_FCHA_HSTA is null ) '))
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
 p_id=>wwv_flow_api.id(95957108594150827)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_max_rows_per_page=>'15'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AMOLINA'
,p_internal_uid=>95957108594150827
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95957211212150828)
,p_db_column_name=>'ID_INSTNCIA_FLJO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Instancia del Flujo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95957475621150830)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Nombre o Raz\00F3n Social ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95957534799150831)
,p_db_column_name=>'NMRO_RNTA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero de Solicitud')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95957623167150832)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha de Solicitud'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95957998394150835)
,p_db_column_name=>'LINK'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Ir a Flujo'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96577594052729312)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Usuario de Solicitud'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97201086031487901)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>unistr('Identificaci\00F3n del Sujeto')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97201199608487902)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Estado de la Solicitud'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(96003158995506653)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'960032'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'LINK:ID_INSTNCIA_FLJO:NMRO_RNTA:FCHA_RGSTRO:IDNTFCCION:NMBRE_RZON_SCIAL:NMBRE_TRCRO:DSCRPCION:'
,p_sort_column_1=>'FCHA_RGSTRO'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96560030649505009)
,p_plug_name=>unistr('Par\00E1metros de b\00FAsquedas')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96577673966729313)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
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
'	Funcionalidad que permite consultar y gestionar las solicitudes de productos.',
'<br><br>	',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96576841819729305)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(96560030649505009)
,p_button_name=>'Btn_consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96560191028505010)
,p_name=>'P173_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(96560030649505009)
,p_prompt=>unistr('Identificaci\00F3n del Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>36
,p_cMaxlength=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96576582844729302)
,p_name=>'P173_ESTDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(96560030649505009)
,p_prompt=>'Estado Solicitud'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion,',
'        cdgo_rnta_estdo ',
'from    gi_d_rentas_estado',
'where   cdgo_rnta_estdo in (''RGS'',''APB'',''RCH'');'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Seleccione'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96576620036729303)
,p_name=>'P173_FCHA_DSDE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(96560030649505009)
,p_prompt=>'Fecha Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false" ondblclick="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96576744714729304)
,p_name=>'P173_FCHA_HSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(96560030649505009)
,p_prompt=>'Fecha Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false" ondblclick="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96576995832729306)
,p_name=>'P173_NRO_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96560030649505009)
,p_prompt=>unistr('N\00FAmero de Solicitud')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96577012203729307)
,p_name=>'P173_USRIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(96560030649505009)
,p_prompt=>'Usuario Solicitud'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct b.nmbre_trcro,',
'                a.id_usrio',
'from    v_gi_g_rentas   a',
'join    v_sg_g_usuarios b  on a.id_usrio = b.id_usrio ',
'where   a.id_impsto         = :P173_ID_IMPSTO',
'    and a.id_impsto_sbmpsto = :P173_ID_IMPSTO_SUBMPSTO',
';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Seleccione'
,p_lov_cascade_parent_items=>'P173_ID_IMPSTO,P173_ID_IMPSTO_SUBMPSTO'
,p_ajax_items_to_submit=>'P173_USRIO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96577791480729314)
,p_name=>'P173_ID_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(96560030649505009)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96577841789729315)
,p_name=>'P173_ID_IMPSTO_SUBMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(96560030649505009)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(96577938887729316)
,p_computation_sequence=>10
,p_computation_item=>'P173_ID_IMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_impsto',
'from    df_c_impuestos  ',
'where   cdgo_clnte = :F_CDGO_CLNTE',
'  and   cdgo_impsto = ''REN''',
'; ',
' '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(96578033774729317)
,p_computation_sequence=>20
,p_computation_item=>'P173_ID_IMPSTO_SUBMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_sbmpsto',
'from   df_i_impuestos_subimpuesto',
'where   cdgo_clnte         = :F_CDGO_CLNTE',
'  and   id_impsto          =  :P173_ID_IMPSTO',
'  and   cdgo_impsto_sbmpsto = ''MCE''',
';'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96577392143729310)
,p_name=>'Al cambiar Fecha Desde'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P173_FCHA_DSDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96577427099729311)
,p_event_id=>wwv_flow_api.id(96577392143729310)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P173_FCHA_HSTA").datepicker( ''option'' , ''minDate'' , $("#P173_FCHA_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95958067998150836)
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
'    ',
'    apex_util.set_session_state(''F_BRANCH_PAGE'', :APP_PAGE_ID );',
'    apex_util.set_session_state(''F_BRANCH_APP'', :APP_ID );',
'    begin',
'        apex_json.initialize_output( p_http_cache => false );',
'        owa_util.mime_header(''application/json'', false);',
'        htp.p(''cache-control: no-cache'');',
'        htp.p(''pragma: no-cache'');',
'        owa_util.http_header_close;',
'        ',
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
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea ); ',
'            ',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'            apex_json.open_object();      ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'            apex_json.close_object();',
'        ',
'        else',
'            apex_json.open_object();      ',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'            apex_json.close_object();    ',
'        end if;',
'        ',
'    ',
'    exception when others then ',
'          apex_json.open_object();',
'          apex_json.write(''type'', ''OK'');',
'          apex_json.write(''msg'',sqlerrm);',
'          apex_json.close_object();',
'  end;',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
