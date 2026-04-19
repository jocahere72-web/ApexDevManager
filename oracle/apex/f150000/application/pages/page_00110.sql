prompt --application/pages/page_00110
begin
wwv_flow_api.create_page(
 p_id=>110
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Informe de Proyecciones'
,p_step_title=>'Informe de Proyecciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function descargar_plan_pago(id_rpte, nmbre_rprte, id_pryccion) {',
'    var popup = apex.widget.waitPopup();',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
'    try {',
'        ',
'        $s(''P110_ID_RPRTE'', id_rpte);',
'        $s(''P110_NMBRE_RPRTE'', nmbre_rprte);',
'        $s(''P110_ID_PRYCCION'', id_pryccion);',
'        await apex.server.process(''set_session'', {pageItems: ''#P110_ID_RPRTE,#P110_NMBRE_RPRTE,#P110_ID_PRYCCION''});',
'        ',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=DOWNLOADFILE:NO:RP:::`;',
'        ',
'        console.log(''Paso ---'');',
'        await fetch(url, {',
'            method: ''GET'',',
'            cache: ''default''',
'        }).then(resp => {',
'            return resp.blob()',
'        }).then(resp => {',
'            let a = document.createElement("a");',
'            document.body.appendChild(a);',
'            let v_url = window.URL.createObjectURL(resp);',
'            a.download = nmbre_rprte + ".pdf";',
'            a.href = v_url;',
'            a.click();',
'            document.body.removeChild(a);',
'            window.URL.revokeObjectURL(v_url);',
'        });',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        popup.remove();',
'    }',
'}'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200612114903'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196869643892871671)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196915984608205863)
,p_plug_name=>'Proyecciones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_pryccion,',
'        nmbre_impsto,',
'        id_sjto_impsto,',
'        idntfccion_sjto_frmtda idntfccion_sjto,',
'        id_cnvnio_tpo,',
'        nmro_pryccion,',
'        trunc(fcha_pryccion) fcha_pryccion,',
'        fcha_prmra_cta,',
'        202 id_rprte,',
'        nmbre_impsto_sbmpsto,',
'        ''PROYECCION_''|| nmro_pryccion nmbre_rprte,',
'        ''<P_ID_IMPSTO>'' ||id_impsto || ''</P_ID_IMPSTO><P_ID_PRYCCION>'' || id_pryccion|| ''</P_ID_PRYCCION><P_ID_RPRTE>202</P_ID_RPRTE>'' prmtros_rprte,',
'        1 plan_pago',
'  from v_gf_g_proyecciones        a',
' where cdgo_clnte                 = :F_CDGO_CLNTE',
'   and id_usrio                 = :F_ID_USRIO',
'   and (id_impsto                 = :P110_ID_IMPSTO            or :P110_ID_IMPSTO is null)',
'   and (id_impsto_sbmpsto         = :P110_ID_IMPSTO_SBMPSTO    or :P110_ID_IMPSTO_SBMPSTO    is null)',
'   and (idntfccion_sjto           = :P110_IDNTFCCION_SJTO      or :P110_IDNTFCCION_SJTO      is null)    ',
'   and (id_cnvnio_tpo             = :P110_ID_CNVNIO_TPO        or :P110_ID_CNVNIO_TPO        is null)',
'   and (id_impsto                 = :P110_ID_IMPSTO            or :P110_ID_IMPSTO            is null)',
'   and (nmro_pryccion             = :P110_NMRO_PRYCCION        or :P110_NMRO_PRYCCION        is null)',
'   and ((trunc(fcha_pryccion)     between :P110_FCHA_INCIO     and :P110_FCHA_FNAL)',
'       or (trunc(fcha_pryccion)   >= :P110_FCHA_INCIO          and :P110_FCHA_FNAL           is null) ',
'       or (trunc(fcha_pryccion)   <= :P110_FCHA_FNAL           and :P110_FCHA_INCIO          is null)',
'       or(:P110_FCHA_INCIO         is null                     and :P110_FCHA_FNAL           is null)) ',
'order by nmro_pryccion desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(196916067122205863)
,p_name=>'Solicitudes de Convenio'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:RP,111,112,113,114,115:P111_ID_PRYCCION:#ID_PRYCCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>196916067122205863
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72825622961179754)
,p_db_column_name=>'ID_PRYCCION'
,p_display_order=>10
,p_column_identifier=>'M'
,p_column_label=>'Id Pryccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72826046693179760)
,p_db_column_name=>'NMRO_PRYCCION'
,p_display_order=>20
,p_column_identifier=>'P'
,p_column_label=>unistr('N\00B0 Proyecci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72827283849179762)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Sujeto Impuesto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72826860926179762)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>40
,p_column_identifier=>'R'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72827654262179762)
,p_db_column_name=>'ID_CNVNIO_TPO'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Tipo de Acuerdo de Pago'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(72732144303195477)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72828470948179766)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>unistr('Identificaci\00F3n <br> Sujeto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72826485922179761)
,p_db_column_name=>'FCHA_PRYCCION'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>unistr('Fecha Proyecci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72828097451179765)
,p_db_column_name=>'FCHA_PRMRA_CTA'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Fecha <br>Primera Cuota'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72828855532179766)
,p_db_column_name=>'PLAN_PAGO'
,p_display_order=>90
,p_column_identifier=>'S'
,p_column_label=>'Plan Pago'
,p_column_link=>'javascript:descargar_plan_pago(#ID_RPRTE#,"#NMBRE_RPRTE#",#ID_PRYCCION#);'
,p_column_linktext=>'<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72829285608179766)
,p_db_column_name=>'ID_RPRTE'
,p_display_order=>100
,p_column_identifier=>'T'
,p_column_label=>'Id Rprte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72829612151179767)
,p_db_column_name=>'PRMTROS_RPRTE'
,p_display_order=>120
,p_column_identifier=>'U'
,p_column_label=>'Prmtros Rprte'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72830095723179767)
,p_db_column_name=>'NMBRE_RPRTE'
,p_display_order=>130
,p_column_identifier=>'V'
,p_column_label=>'Nmbre Rprte'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72830402563179767)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>140
,p_column_identifier=>'W'
,p_column_label=>'Sub - Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(196937003746251622)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'728308'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_PRYCCION:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO:ID_CNVNIO_TPO:FCHA_PRYCCION:FCHA_PRMRA_CTA:PLAN_PAGO:'
,p_sort_column_1=>'0'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'DESC'
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
 p_id=>wwv_flow_api.id(240907236419635231)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
 p_id=>wwv_flow_api.id(286981111534343667)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite<br><br>',
'    <b>1.</b> Consultar las proyecciones de acuerdos de pago realizadas.<br><br>',
unistr('    <b>2.</b> Crear una nueva proyecci\00F3n de acuerdo de pago.<br><br>'),
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73193706819844421)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(240907236419635231)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,110,111,112,113,114,115::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72831583162179783)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(240907236419635231)
,p_button_name=>'BTN_NUEVA_PROYECCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Proyecci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:RP,111,112,113,114,115:P111_ID_IMPSTO,P111_ID_IMPSTO_SBMPSTO:&P110_ID_IMPSTO.,&P110_ID_IMPSTO_SBMPSTO.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72818256549179700)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(196869643892871671)
,p_button_name=>'BTN_BUSCAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72818640539179704)
,p_name=>'P110_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(196869643892871671)
,p_prompt=>'Tributo'
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
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tributo asociado a la proyecci\00F3n de acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72819545162179741)
,p_name=>'P110_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(196869643892871671)
,p_prompt=>'Sub Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d ',
'       ,id_impsto_sbmpsto r       ',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto = :P110_ID_IMPSTO',
'    and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P110_ID_IMPSTO'
,p_ajax_items_to_submit=>'P110_ID_IMPSTO_SBMPSTO,P110_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el sub tributo con el que elabor\00F3 la proyecci\00F3n.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72820432370179742)
,p_name=>'P110_ID_CNVNIO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(196869643892871671)
,p_prompt=>'Tipo de Acuerdo de Pago'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de acuerdo de pago con el que proyect\00F3 el acuerdo.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72822286607179748)
,p_name=>'P110_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(196869643892871671)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realiz\00F3 la proyecci\00F3n de acuerdos de pago.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72823183383179749)
,p_name=>'P110_NMRO_PRYCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(196869643892871671)
,p_prompt=>unistr('N\00B0 Proyecci\00F3n')
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_pryccion',
'  from v_gf_g_proyecciones        a',
' where cdgo_clnte                 = :F_CDGO_CLNTE',
'   --and id_usrio                 = :F_ID_USRIO',
'order by nmro_pryccion desc'))
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72823519487179750)
,p_name=>'P110_FCHA_INCIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(196869643892871671)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select to_date (''01/'' || extract(MONTH from sysdate) || ''/'' || extract(year from sysdate)) fcha_incio',
'    from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Inicial'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente  al registro de la proyecci\00F3n de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72824448617179751)
,p_name=>'P110_FCHA_FNAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(196869643892871671)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select LAST_DAY(SYSDATE)',
'   from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Final'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente  al registro de la proyecci\00F3n de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73192472401844408)
,p_name=>'P110_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(196915984608205863)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73192580393844409)
,p_name=>'P110_NMBRE_RPRTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(196915984608205863)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73192664672844410)
,p_name=>'P110_ID_PRYCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(196915984608205863)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73192758758844411)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOADFILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_blob          blob;',
'    v_gn_d_reportes gn_d_reportes%rowtype;    ',
'begin',
'    begin',
'        apex_session.attach( p_app_id     => 66000',
'                           , p_page_id    => 2',
'                           , p_session_id => v(''APP_SESSION'') );',
'',
'        --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'        select /*+ RESULT_CACHE */',
'               r.*',
'          into v_gn_d_reportes ',
'          from gn_d_reportes r',
'         where r.id_rprte = :P110_ID_RPRTE;',
'',
'',
'        --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO                    ',
'        apex_util.set_session_state(''P2_XML'', ''<P_ID_IMPSTO>'' ||:P110_ID_IMPSTO || ''</P_ID_IMPSTO><P_ID_PRYCCION>'' || :P110_ID_PRYCCION || ''</P_ID_PRYCCION><P_ID_RPRTE>''|| :P110_ID_RPRTE || ''</P_ID_RPRTE>'');',
'        apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'--''<P_ID_IMPSTO>'' ||id_impsto || ''</P_ID_IMPSTO><P_ID_PRYCCION>'' || id_pryccion|| ''</P_ID_PRYCCION><P_ID_RPRTE>202</P_ID_RPRTE>'' ',
'        v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                                p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                                p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                                p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                                p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'        htp.init;',
'        owa_util.mime_header(''application/pdf'', FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' || :P110_NMBRE_RPRTE || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_blob);',
'        apex_application.stop_apex_engine;',
'        ',
'       ',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73192882093844412)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object;',
'apex_json.write(''type'', ''OK'');',
'apex_json.close_object;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
