prompt --application/pages/page_00151
begin
wwv_flow_api.create_page(
 p_id=>151
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Esquema Tarifa V2'
,p_step_title=>'Esquema Tarifa V2'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});'))
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'1111111112'
,p_last_upd_yyyymmddhh24miss=>'20250107170742'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116843979116166276)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-lg'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'<br>',
'Funcionalidad que permite:<br><br>',
unistr('<b>1.</b> Consultar Esquemas de Tarifa: En la regi\00F3n de Esquemas de tarifa se muestran los esquemas de tarifa parametrizados, para filtrar seleccione en la regi\00F3n de par\00E1metros de b\00FAsqueda los datos de su elecci\00F3n, hacer clic en el bot\00F3n Consultar se')
||unistr(' mostrar\00E1 seguidamente los datos correspondientes a los esquemas de tarifa de su selecci\00F3n.<br><br>'),
unistr('<b>2.</b>Ingresar Esquema Tarifa: hacer clic en el bot\00F3n Nuevo Esquema Tarifa, se abrir\00E1 una p\00E1gina modal donde se permite diligenciar los datos del nuevo esquema tarifa.<br><br>'),
unistr('<b>3.</b> Modificar y Eliminar Esquema Tarifa: hacer clic en el \00EDcono de l\00E1piz que desea modificar o eliminar,  abrir\00E1 una p\00E1gina modal donde se podr\00E1 modificar, eliminar y consultar los datos del esquema seleccionado.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(513964202930085031)
,p_plug_name=>'Esquema Tarifa'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select distinct a.id_trfa_esqma',
'        , a.nmbre_impsto',
'        , a.nmbre_impsto_sbmpsto',
'        , a.nmbre_impsto_acto',
'        , a.dscrpcion_cncpto',
'        , a.fcha_incial',
'        , a.fcha_fnal',
'        , a.txto_bse_incial',
'        , a.txto_bse_fnal',
'        , a.txto_trfa',
'        , dscrpcion_rdndeo',
'        , PRCNTJE_BSE_LQDCION || ''%'' PRCNTJE_BSE_LQDCION',
' from v_gi_d_tarifas_esquema     a',
'where cdgo_clnte                 =  :F_CDGO_CLNTE',
'  and id_impsto                  = :P151_ID_IMPSTO',
'  and (id_impsto_sbmpsto         = :P151_ID_IMPSTO_SBMPSTO      or :P151_ID_IMPSTO_SBMPSTO is null)',
'  and (id_impsto_acto            = :P151_ID_IMPSTO_ACTO         or :P151_ID_IMPSTO_ACTO is null)',
'  and (id_cncpto                 = :P151_ID_CNCPTO              or :P151_ID_CNCPTO is null)',
'  and ((fcha_incial              between :P151_FCHA_INCIAL and :P151_FCHA_FNAL) ',
'    or :P151_FCHA_INCIAL          is null',
'      )',
'  and ((fcha_fnal                between :P151_FCHA_INCIAL and :P151_FCHA_FNAL) ',
'   or :P151_FCHA_FNAL             is null)',
'  ',
'  ',
'  ',
'  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(513964356575085031)
,p_name=>'Calculo Destinos'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No existe datos para Esquema Tarifa'
,p_max_rows_per_page=>'50'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:153:&SESSION.::&DEBUG.:RP,43:P153_ID_TRFA_ESQMA:#ID_TRFA_ESQMA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>513964356575085031
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2642598177127034)
,p_db_column_name=>'ID_TRFA_ESQMA'
,p_display_order=>10
,p_column_identifier=>'AD'
,p_column_label=>'Id trfa esqma'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2639343165127032)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'BE'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2639700590127033)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>30
,p_column_identifier=>'BF'
,p_column_label=>'Sub-Tributo'
,p_column_type=>'STRING'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P151_ID_IMPSTO_SBMPSTO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2641316414127033)
,p_db_column_name=>'NMBRE_IMPSTO_ACTO'
,p_display_order=>40
,p_column_identifier=>'AY'
,p_column_label=>'Acto'
,p_column_type=>'STRING'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P151_ID_IMPSTO_ACTO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2641707387127034)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>50
,p_column_identifier=>'BD'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P151_ID_CNCPTO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2642908665127034)
,p_db_column_name=>'FCHA_INCIAL'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Fecha Inicial'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2643356240127035)
,p_db_column_name=>'FCHA_FNAL'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Fecha Final'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2642102048127034)
,p_db_column_name=>'TXTO_TRFA'
,p_display_order=>100
,p_column_identifier=>'AC'
,p_column_label=>'Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(35038611341491102)
,p_db_column_name=>'PRCNTJE_BSE_LQDCION'
,p_display_order=>110
,p_column_identifier=>'BK'
,p_column_label=>'% Base Liq.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2640164380127033)
,p_db_column_name=>'TXTO_BSE_INCIAL'
,p_display_order=>120
,p_column_identifier=>'BG'
,p_column_label=>'Base Inicial'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2640513771127033)
,p_db_column_name=>'TXTO_BSE_FNAL'
,p_display_order=>130
,p_column_identifier=>'BH'
,p_column_label=>'Base Final'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2640954077127033)
,p_db_column_name=>'DSCRPCION_RDNDEO'
,p_display_order=>140
,p_column_identifier=>'BI'
,p_column_label=>'Redondeo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(513997888043109930)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'26437'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO_ACTO:DSCRPCION_CNCPTO:TXTO_TRFA:PRCNTJE_BSE_LQDCION:FCHA_INCIAL:FCHA_FNAL:TXTO_BSE_INCIAL:TXTO_BSE_FNAL:DSCRPCION_RDNDEO:'
,p_sort_column_1=>'NMBRE_IMPSTO_SBMPSTO'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'NMBRE_IMPSTO_ACTO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'DSCRPCION_CNCPTO'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'FCHA_INCIAL'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'TXTO_TRFA'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516398605598213013)
,p_plug_name=>'<b>Opciones</b>'
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
 p_id=>wwv_flow_api.id(1019378735121222652)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2644489240127038)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(516398605598213013)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P151_BRANCH_APP.:&P151_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2644869274127039)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(516398605598213013)
,p_button_name=>'btn_nuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo<br> Esquema Tarifa'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:153:&SESSION.::&DEBUG.:153::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2645525101127039)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_button_name=>'Restablecer'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Restablecer'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2645930260127040)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_button_name=>'Btn_Buscar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2655226286127060)
,p_branch_name=>'Regresar'
,p_branch_action=>'P151_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(171631309694980166)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2646375394127040)
,p_name=>'P151_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2647264901127042)
,p_name=>'P151_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select upper(nmbre_impsto_sbmpsto) d',
'        , id_impsto_sbmpsto           r',
'     from df_i_impuestos_subimpuesto',
'    where id_impsto                    = :P151_ID_IMPSTO',
' order by 1',
'  '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P151_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el subtributo.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2648158174127042)
,p_name=>'P151_ID_IMPSTO_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_prompt=>'Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || a.cdgo_impsto_acto || ''] '' || a.nmbre_impsto_acto d',
'        , a.id_impsto_acto',
'     from v_df_i_impuestos_acto a',
'    where cdgo_clnte            = :F_CDGO_CLNTE',
'      and id_impsto             = :P151_ID_IMPSTO',
'      and (id_impsto_sbmpsto    = :P151_ID_IMPSTO_SBMPSTO or :P151_ID_IMPSTO_SBMPSTO is null)',
'      /*and id_impsto_acto        in (select distinct id_impsto_acto ',
'                                      from gi_d_tarifas_esquema ',
'                                     where cdgo_clnte            = :F_CDGO_CLNTE',
'                                       and id_impsto             = :P151_ID_IMPSTO',
'                                       and id_impsto_sbmpsto     = :P151_ID_IMPSTO_SBMPSTO)*/',
' order by a.cdgo_impsto_acto',
'        , a.nmbre_impsto_acto',
'        ',
'        '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P151_ID_IMPSTO,P151_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el acto concepto.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2649076239127043)
,p_name=>'P151_ID_CNCPTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_prompt=>'Concepto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select distinct dscrpcion_cncpto d',
'        , id_cncpto r',
'     from v_gi_d_tarifas_esquema',
'    where cdgo_clnte            = :F_CDGO_CLNTE',
'      and id_impsto             = :P151_ID_IMPSTO',
'      and (id_impsto_sbmpsto    = :P151_ID_IMPSTO_SBMPSTO or :P151_ID_IMPSTO_SBMPSTO is null)',
'      and (id_impsto_acto       = :P151_ID_IMPSTO_ACTO or :P151_ID_IMPSTO_ACTO is null)',
' order by dscrpcion_cncpto'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P151_ID_IMPSTO,P151_ID_IMPSTO_SBMPSTO,P151_ID_IMPSTO_ACTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2649456629127043)
,p_name=>'P151_FCHA_INCIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_prompt=>'Fecha Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha inicial.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2650399431127044)
,p_name=>'P151_FCHA_FNAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_prompt=>'Fecha Final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha final'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2651241678127045)
,p_name=>'P151_BRANCH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2651630732127045)
,p_name=>'P151_BRANCH_PAGE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2652096954127045)
,p_name=>'P151_BRANCH_APP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1019378735121222652)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2652459626127056)
,p_name=>'Al cerrar modal'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2652958548127058)
,p_event_id=>wwv_flow_api.id(2652459626127056)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(513964202930085031)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2653369780127058)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P151_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2653822814127058)
,p_event_id=>wwv_flow_api.id(2653369780127058)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P151_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P151_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2654201924127059)
,p_name=>'Limpiar filtros'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2645525101127039)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2654717091127059)
,p_event_id=>wwv_flow_api.id(2654201924127059)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P151_ID_IMPSTO,P151_ID_IMPSTO_SBMPSTO,P151_ID_IMPSTO_ACTO,P151_FCHA_INCIAL,P151_FCHA_FNAL'
,p_stop_execution_on_error=>'Y'
);
end;
/
