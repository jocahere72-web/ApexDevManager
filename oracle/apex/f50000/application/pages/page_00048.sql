prompt --application/pages/page_00048
begin
wwv_flow_api.create_page(
 p_id=>48
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Calculo Destinos'
,p_step_title=>'Calculo Destinos'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});',
'',
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250115084653'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16586457375969301)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'Funcionalidad que permite: <br><br>',
'',
unistr('<b>1.</b> Consultar: ingrese los datos solicitados en los Par\00E1metros de B\00FAsqueda que requiera y haga clic en el bot\00F3n consultar. Para limpiar los campos de b\00FAsqueda hacer clic en el bot\00F3n Restablecer. <br>'),
'',
unistr('<b>2.</b> Ingresar un c\00E1lculo destino: hacer clic en el bot\00F3n Nuevo C\00E1lculo Destino, se mostrar\00E1 una ventana para diligenciar los datos del destino, ingrese los datos requeridos y hacer clic en el bot\00F3n insertar.<br>'),
'',
unistr('<b>3.</b> Modificar un c\00E1lculo destino: hacer clic en el \00EDcono de l\00E1piz del destino de su elecci\00F3n, se mostrar\00E1 una ventana con los datos del destino seleccionado, realice las modificaciones y hacer clic en el bot\00F3n Aplicar Cambios.<br>'),
'',
unistr('<b>4.</b> Eliminar un c\00E1lculo destino: hacer clic en el \00EDcono de l\00E1piz del destino de su elecci\00F3n, se mostrar\00E1 una ventana con los datos del destino seleccionado, hacer clic en el bot\00F3n Eliminar.<br><br>	'),
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(339695376107978000)
,p_plug_name=>unistr('C\00E1lculo Destinos')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prdio_clclo_dstno,',
'       cdgo_clnte,',
'       id_impsto,',
'       id_impsto_sbmpsto,',
'       fcha_incial,',
'       fcha_fnal,',
'       cdgo_prdio_clsfccion,',
'       ''[''||cdgo_dstno_igac||''] ''|| nmbre_dstno_igac nmbre_dstno_igac,',
'       dscrpcion_prdio_clsfccion,',
'       indcdor_clclo_area,',
'       ''[''||cdgo_prdio_dstno||''] ''||dscrpcion_prdio_dstno dscrpcion_prdio_dstno,',
'       area_trrno_mnma,',
'       area_trrno_mxma,',
'       area_cnsctrda_mnma,',
'       area_cnsctrda_mxma,',
'       prcntje_mnmo,',
'       prcntje_mxmo',
'  from v_gi_d_predios_calculo_destino',
' where cdgo_clnte                  = :F_CDGO_CLNTE',
'   and (id_impsto                  = :P48_IMPUESTO or (:P48_IMPUESTO  is null))',
'   and (id_impsto_sbmpsto          = :P48_SUB_IMPUESTO or (:P48_SUB_IMPUESTO is null))',
'   and (cdgo_prdio_clsfccion       = :P48_CLASIFICACION_PREDIO or (:P48_CLASIFICACION_PREDIO is null))',
'   and (TRUNC(fcha_incial)   >= TRUNC(TO_DATE(:P48_FECHA_INICIAL,''DD/MM/YYYY'')) OR :P48_FECHA_INICIAL IS NULL) ',
'   and (TRUNC(fcha_fnal)   <= TRUNC(TO_DATE(:P48_FECHA_FIN,''DD/MM/YYYY'')) OR :P48_FECHA_FIN IS NULL) ',
'  /* and ((fcha_incial        between  :P48_FECHA_INICIAL and :P48_FECHA_FIN) or :P48_FECHA_INICIAL is null)',
'   and ((fcha_fnal          between  :P48_FECHA_INICIAL and :P48_FECHA_FIN ) or :P48_FECHA_FIN is null) */'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(339695529752978000)
,p_name=>'Calculo Destinos'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No existe datos de Calculo Destino'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP:P49_ID_PRDIO_CLCLO_DSTNO,P49_CDGO_CLNTE,P49_ID_IMPSTO,P49_CDGO_PRDIO_CLSFCCION:#ID_PRDIO_CLCLO_DSTNO#,#CDGO_CLNTE#,#ID_IMPSTO_SBMPSTO#,#CDGO_PRDIO_CLSFCCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>339695529752978000
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170046326661214305)
,p_db_column_name=>'ID_PRDIO_CLCLO_DSTNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Prdio Clclo Dstno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170046707931214310)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170047172432214310)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170047572718214311)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46361397033318845)
,p_db_column_name=>'NMBRE_DSTNO_IGAC'
,p_display_order=>14
,p_column_identifier=>'Q'
,p_column_label=>'Destino IGAC'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170047999906214311)
,p_db_column_name=>'FCHA_INCIAL'
,p_display_order=>24
,p_column_identifier=>'E'
,p_column_label=>'Fecha Inicial'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170048305733214311)
,p_db_column_name=>'FCHA_FNAL'
,p_display_order=>34
,p_column_identifier=>'F'
,p_column_label=>'Fecha Final'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46361420269318846)
,p_db_column_name=>'DSCRPCION_PRDIO_DSTNO'
,p_display_order=>44
,p_column_identifier=>'R'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(47175608278893115)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>54
,p_column_identifier=>'S'
,p_column_label=>unistr('Clasificaci\00F3n Predio')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170048701594214312)
,p_db_column_name=>'CDGO_PRDIO_CLSFCCION'
,p_display_order=>64
,p_column_identifier=>'G'
,p_column_label=>unistr('Predio Clasificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170049505305214312)
,p_db_column_name=>'INDCDOR_CLCLO_AREA'
,p_display_order=>74
,p_column_identifier=>'I'
,p_column_label=>unistr('Indicador C\00E1lculo \00C1rea')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(171492479428238145)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170050360344214313)
,p_db_column_name=>'AREA_TRRNO_MNMA'
,p_display_order=>84
,p_column_identifier=>'K'
,p_column_label=>unistr('\00C1rea de Terreno <br> M\00EDnima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170050773330214313)
,p_db_column_name=>'AREA_TRRNO_MXMA'
,p_display_order=>94
,p_column_identifier=>'L'
,p_column_label=>unistr('\00C1rea de Terreno <br>M\00E1xima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170051153421214313)
,p_db_column_name=>'AREA_CNSCTRDA_MNMA'
,p_display_order=>104
,p_column_identifier=>'M'
,p_column_label=>unistr('\00C1rea<br> Construida M\00EDnima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170051518858214314)
,p_db_column_name=>'AREA_CNSCTRDA_MXMA'
,p_display_order=>114
,p_column_identifier=>'N'
,p_column_label=>unistr('\00C1rea<br> Construida M\00E1xima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170051966926214314)
,p_db_column_name=>'PRCNTJE_MNMO'
,p_display_order=>124
,p_column_identifier=>'O'
,p_column_label=>unistr('Porcentaje M\00EDnimo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G990D0'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170052301401214314)
,p_db_column_name=>'PRCNTJE_MXMO'
,p_display_order=>134
,p_column_identifier=>'P'
,p_column_label=>unistr('Porcentaje M\00E1ximo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G990D0'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(339729061221002899)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1700527'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_DSTNO_IGAC:DSCRPCION_PRDIO_CLSFCCION:FCHA_INCIAL:FCHA_FNAL:DSCRPCION_PRDIO_DSTNO:INDCDOR_CLCLO_AREA:AREA_TRRNO_MNMA:AREA_TRRNO_MXMA:AREA_CNSCTRDA_MNMA:AREA_CNSCTRDA_MXMA:PRCNTJE_MNMO:PRCNTJE_MXMO:'
,p_sort_column_1=>'FCHA_INCIAL'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'FCHA_FNAL'
,p_sort_direction_2=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(342129778776105982)
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
 p_id=>wwv_flow_api.id(845109908299115621)
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
 p_id=>wwv_flow_api.id(170054119488214322)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(342129778776105982)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P48_BRANCH_APP.:&P48_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170053184316214319)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(342129778776105982)
,p_button_name=>'btn_nuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo<br> C\00E1lculo Destino')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:49::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46226516271987789)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(845109908299115621)
,p_button_name=>'BTN_LMPIAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Restablecer'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:RP,48::'
,p_icon_css_classes=>'fa-undo-alt'
,p_button_cattributes=>'style="margin: 9px;"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170053893174214321)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(845109908299115621)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38328645686496704)
,p_name=>'P48_BRANCH_PAGE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(845109908299115621)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38328783579496705)
,p_name=>'P48_BRANCH_APP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(845109908299115621)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170055378712214325)
,p_name=>'P48_IMPUESTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(845109908299115621)
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
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170055744220214326)
,p_name=>'P48_CLASIFICACION_PREDIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(845109908299115621)
,p_prompt=>unistr('<b>Clasificaci\00F3n Predio</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la clasificaci\00F3n del predio.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170056177419214326)
,p_name=>'P48_SUB_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(845109908299115621)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P48_IMPUESTO',
' order by 1',
'  '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P48_IMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el subtributo'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171455617660948366)
,p_name=>'P48_FECHA_INICIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(845109908299115621)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha inicial para el c\00E1lculo del destino.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171455988673952955)
,p_name=>'P48_FECHA_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(845109908299115621)
,p_prompt=>'<b>Fecha Fin</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha final para el c\00E1lculo del destino.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47176945052893128)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>'to_date(:P48_FECHA_INICIAL,''dd/mm/rr'')  < to_date(:P48_FECHA_FIN,''dd/mm/rr'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La fecha fin debe ser mayor a la fecha inicial'
,p_when_button_pressed=>wwv_flow_api.id(170053893174214321)
,p_associated_item=>wwv_flow_api.id(171455988673952955)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170056912488214328)
,p_name=>'Refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(339695376107978000)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170057431922214329)
,p_event_id=>wwv_flow_api.id(170056912488214328)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(339695376107978000)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(162923019341449713)
,p_name=>'Refresh_region_calculo_destino'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(170053184316214319)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(162923156113449714)
,p_event_id=>wwv_flow_api.id(162923019341449713)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(339695376107978000)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47572496799843866)
,p_name=>'Al cambiar fecha de inicio'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P48_FECHA_INICIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47572892174843880)
,p_event_id=>wwv_flow_api.id(47572496799843866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P48_FECHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P48_FECHA_INICIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
