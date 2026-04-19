prompt --application/pages/page_00046
begin
wwv_flow_api.create_page(
 p_id=>46
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('C\00E1lculo Uso Predios')
,p_step_title=>unistr('C\00E1lculo Uso Predios')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'	if($(''#''+id).attr(''aria-expanded'') !== ''true''){',
'		$(''#''+id).click();',
'	}',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191211113130'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16586525515969302)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></i> </b></h5>',
'',
'Funcionalidad que permite: <br><br>',
'',
unistr('<b>1.</b> Consultar c\00E1lculos de uso de predio: ingrese los datos solicitados en los Par\00E1metros de B\00FAsqueda que requiera y haga clic en el bot\00F3n consultar. Para limpiar los campos de b\00FAsqueda hacer clic en el bot\00F3n Restablecer. <br>'),
'',
unistr('<b>2.</b> Ingresar un c\00E1lculos de uso de predio: hacer clic en el bot\00F3n Nuevo Uso Predio, se mostrar\00E1 una ventana para diligenciar los datos del destino, ingrese los datos requeridos y hacer clic en el bot\00F3n insertar.<br>'),
'',
unistr('<b>3.</b> Modificar un c\00E1lculos de uso de predio: hacer clic en el \00EDcono de l\00E1piz del uso del predio de su elecci\00F3n, se mostrar\00E1 una ventana con los datos del uso del predio seleccionado, realice las modificaciones y hacer clic en el bot\00F3n Aplicar Ca')
||'mbios.<br>',
'',
unistr('<b>4.</b> Eliminar un c\00E1lculos de uso de predio: hacer clic en el \00EDcono de l\00E1piz del uso del predio de su elecci\00F3n, se mostrar\00E1 una ventana con los datos del uso del predio seleccionado, hacer clic en el bot\00F3n Eliminar.<br><br>	'),
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>',
'        ',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170666741575120116)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(339545405576774393)
,p_plug_name=>unistr('C\00E1lculo Uso Predios')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prdio_clclo_uso,',
'       cdgo_clnte,',
'       id_impsto,',
'       id_impsto_sbmpsto,',
'       to_char(fcha_incial, ''DD/MM/YYYY'') fcha_incial,',
'       to_char(fcha_fnal, ''DD/MM/YYYY'') fcha_fnal,',
'       cdgo_prdio_clsfccion,',
'       cdgo_dstno_igac,',
'       dscrpcion_prdio_uso_slo,',
'       indcdor_clclo_area,',
'       id_prdio_uso_slo,',
'       area_trrno_mnma,',
'       area_trrno_mxma,',
'       area_cnsctrda_mnma,',
'       area_cnsctrda_mxma,',
'       prcntje_mnmo,',
'       prcntje_mxmo',
'  from v_gi_d_predios_calculo_uso',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and ((id_impsto                  = :P46_IMPUESTO) or :P46_IMPUESTO is null)',
'   and  ((id_impsto_sbmpsto         = :P46_SUB_IMPUESTO) or :P46_SUB_IMPUESTO is null)',
'   and ((cdgo_prdio_clsfccion       = :P46_CLASIFICACION_PREDIO) OR :P46_CLASIFICACION_PREDIO is null )',
'   and (TRUNC(fcha_incial)   >= TRUNC(TO_DATE(:P46_FECHA_INICIAL,''DD/MM/YYYY'')) OR :P46_FECHA_INICIAL IS NULL) ',
'   and (TRUNC(fcha_fnal)   <= TRUNC(TO_DATE(:P46_FECHA_FIN,''DD/MM/YYYY'')) OR :P46_FECHA_FIN IS NULL)',
'  /* and ((fcha_incial        between   :P46_FECHA_INICIAL and :P46_FECHA_FIN) or :P46_FECHA_INICIAL is null)',
'   and ((fcha_fnal          between   :P46_FECHA_INICIAL and :P46_FECHA_FIN ) or :P46_FECHA_FIN is null); */'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(339545523952774393)
,p_name=>'Calculo Uso Predios'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No existen datos de Calculo Uso Predio '
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:RP:P47_ID_PRDIO_CLCLO_USO,P47_ID_IMPSTO,P47_ID_IMPSTO_SBMPSTO,P47_CDGO_CLNTE,P47_VIGENCIA:#ID_PRDIO_CLCLO_USO#,#ID_IMPSTO#,#ID_IMPSTO_SBMPSTO#,#CDGO_CLNTE#,&P46_VIGENCIA.'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-page.png" class="apex-edit-page" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>339545523952774393
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170006218287206470)
,p_db_column_name=>'ID_PRDIO_CLCLO_USO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Prdio Clclo Uso'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170006617944206476)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170007001281206478)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170007468682206479)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47176896117893127)
,p_db_column_name=>'DSCRPCION_PRDIO_USO_SLO'
,p_display_order=>14
,p_column_identifier=>'U'
,p_column_label=>'Uso del Suelo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26420954379097232)
,p_db_column_name=>'FCHA_INCIAL'
,p_display_order=>24
,p_column_identifier=>'S'
,p_column_label=>'Fecha Inicial'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26421066927097233)
,p_db_column_name=>'FCHA_FNAL'
,p_display_order=>34
,p_column_identifier=>'T'
,p_column_label=>'Fecha Final'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170008679805206480)
,p_db_column_name=>'CDGO_PRDIO_CLSFCCION'
,p_display_order=>44
,p_column_identifier=>'G'
,p_column_label=>unistr('Predio Clasificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(170000125035201240)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170009005884206481)
,p_db_column_name=>'CDGO_DSTNO_IGAC'
,p_display_order=>54
,p_column_identifier=>'H'
,p_column_label=>'Destino<br> IGAC'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(170018707155206555)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170009497681206481)
,p_db_column_name=>'INDCDOR_CLCLO_AREA'
,p_display_order=>64
,p_column_identifier=>'I'
,p_column_label=>unistr('Indicador C\00E1lculo \00C1rea')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(171492479428238145)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170009889539206481)
,p_db_column_name=>'ID_PRDIO_USO_SLO'
,p_display_order=>74
,p_column_identifier=>'J'
,p_column_label=>'Predio<br> Uso Suelo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170010264327206481)
,p_db_column_name=>'AREA_TRRNO_MNMA'
,p_display_order=>84
,p_column_identifier=>'K'
,p_column_label=>unistr('\00C1rea <br>Terreno M\00CDnima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'9G999G999G999G999G999'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170010618500206482)
,p_db_column_name=>'AREA_TRRNO_MXMA'
,p_display_order=>94
,p_column_identifier=>'L'
,p_column_label=>unistr('\00C1rea<br>Terreno M\00E1xima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'9G999G999G999G999G999'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170011012257206486)
,p_db_column_name=>'AREA_CNSCTRDA_MNMA'
,p_display_order=>104
,p_column_identifier=>'M'
,p_column_label=>unistr('\00C1rea<br> Construida M\00EDnima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'9G999G999G999G999G999'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170011434618206486)
,p_db_column_name=>'AREA_CNSCTRDA_MXMA'
,p_display_order=>114
,p_column_identifier=>'N'
,p_column_label=>unistr('\00C1rea <br>Construida M\00E1xima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'9G999G999G999G999G999'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170011844054206487)
,p_db_column_name=>'PRCNTJE_MNMO'
,p_display_order=>124
,p_column_identifier=>'O'
,p_column_label=>unistr('Porc\00E9ntaje M\00EDnimo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G990D0'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170012275290206487)
,p_db_column_name=>'PRCNTJE_MXMO'
,p_display_order=>134
,p_column_identifier=>'P'
,p_column_label=>unistr('Porc\00E9ntaje M\00E1ximo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G990D0'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(339560512841792553)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1700126'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_PRDIO_USO_SLO:FCHA_INCIAL:FCHA_FNAL:CDGO_PRDIO_CLSFCCION:CDGO_DSTNO_IGAC:INDCDOR_CLCLO_AREA:AREA_TRRNO_MNMA:AREA_TRRNO_MXMA:AREA_CNSCTRDA_MNMA:AREA_CNSCTRDA_MXMA:PRCNTJE_MNMO:PRCNTJE_MXMO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(675413001147340646)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46226882878989431)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(675413001147340646)
,p_button_name=>'BTN_LMPIAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Restablecer'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:RP,46::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170014159367206509)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(170666741575120116)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P46_BRANCH_APP.:&P46_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170013058836206498)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(170666741575120116)
,p_button_name=>'btn_Nuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Uso Predio'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:47::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170013706677206509)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(675413001147340646)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38328810979496706)
,p_name=>'P46_BRANCH_APP'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(675413001147340646)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170014953115206512)
,p_name=>'P46_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(675413001147340646)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
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
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo '
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170015335458206512)
,p_name=>'P46_CLASIFICACION_PREDIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(675413001147340646)
,p_prompt=>unistr('<b>Clasificaci\00F3n Predio</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la clasificaci\00F3n del predio')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170015726765206513)
,p_name=>'P46_SUB_IMPUESTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(675413001147340646)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P46_IMPUESTO',
' order by 1',
'  '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P46_IMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el sub tributo '
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170016143916206516)
,p_name=>'P46_FECHA_INICIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(675413001147340646)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>25
,p_tag_attributes=>'onkeydown="return false" '
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha inicial del c\00E1lculo de uso')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170016515273206517)
,p_name=>'P46_BRANCH_PAGE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(675413001147340646)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170666969342120118)
,p_name=>'P46_FECHA_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(675413001147340646)
,p_prompt=>'<b>Fecha Fin</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>25
,p_tag_attributes=>'onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha final del c\00E1lculo de uso')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47177091242893129)
,p_validation_name=>unistr('Validaci\00F3n fecha mayor')
,p_validation_sequence=>10
,p_validation=>'to_date(:P46_FECHA_INICIAL,''dd/mm/rr'')  < to_date(:P46_FECHA_FIN,''dd/mm/rr'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Fecha Fin debe ser mayor a la fecha inicial'
,p_associated_item=>wwv_flow_api.id(170666969342120118)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170016936589206530)
,p_name=>'Refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(339545405576774393)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170017336548206536)
,p_event_id=>wwv_flow_api.id(170016936589206530)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(339545405576774393)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(162922603520449709)
,p_name=>'Refresh_region_calculo_suo_predio'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(170013058836206498)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(162922713566449710)
,p_event_id=>wwv_flow_api.id(162922603520449709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(339545405576774393)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47177105448893130)
,p_name=>'Al cambiar fecha de inicio'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P46_FECHA_INICIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47177275800893131)
,p_event_id=>wwv_flow_api.id(47177105448893130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P46_FECHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P46_FECHA_INICIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
