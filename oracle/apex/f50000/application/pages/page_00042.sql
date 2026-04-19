prompt --application/pages/page_00042
begin
wwv_flow_api.create_page(
 p_id=>42
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Esquema Tarifa'
,p_step_title=>'Esquema Tarifa'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});'))
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(99268463186773832)
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222101359'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114205523687039269)
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
 p_id=>wwv_flow_api.id(511325747500958024)
,p_plug_name=>'Esquema Tarifa'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_impsto',
'		, id_impsto_sbmpsto',
'		, fcha_incial',
'		, fcha_fnal',
'		, rdndeo',
'		, bse_incial',
'		, bse_fnal',
'		, vlor_trfa',
'		, lqdcion_mnma',
'		, lqdcion_mxma',
'		, id_indcdor_ecnmco',
'		, indcdr_usa_fcha_lqdcion',
'		, indcdor_usa_bse',
'		, txto_trfa',
'		, id_trfa_esqma',
'		, id_impsto_acto',
'		, nmbre_impsto_acto',
'		, id_impsto_acto_cncpto',
'		, id_cncpto',
'		, dscrpcion_cncpto',
'	 from v_gi_d_tarifas_esquema',
'	where cdgo_clnte					= :F_CDGO_CLNTE',
'	 and ((fcha_incial					between  :P42_FCHA_INCIAL and :P42_FCHA_FNAL) or  :P42_FCHA_INCIAL is null)',
'	 and ((fcha_fnal					between  :P42_FCHA_INCIAL and :P42_FCHA_FNAL) or  :P42_FCHA_FNAL is null)',
'	 and ((id_impsto					= :P42_ID_IMPSTO))',
'	 and ((id_impsto_sbmpsto			= :P42_ID_IMPSTO_SBMPSTO) or :P42_ID_IMPSTO_SBMPSTO is null)',
'	 and ((id_impsto_acto        		= nvl(:P42_ID_IMPSTO_ACTO, id_impsto_acto)) or (:P42_ID_IMPSTO_ACTO is null))',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(511325901145958024)
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
,p_detail_link=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP,43:P43_ID_TRFA_ESQMA:#ID_TRFA_ESQMA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>511325901145958024
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(171632735933980229)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Tributo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(97006044069688544)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(171633186225980231)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Sub-Tributo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(97088332924527483)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(57293736322180019)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>14
,p_column_identifier=>'BD'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(57293235162180014)
,p_db_column_name=>'NMBRE_IMPSTO_ACTO'
,p_display_order=>24
,p_column_identifier=>'AY'
,p_column_label=>'Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(171633597167980231)
,p_db_column_name=>'FCHA_INCIAL'
,p_display_order=>34
,p_column_identifier=>'E'
,p_column_label=>'Fecha Inicial'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(171633918810980232)
,p_db_column_name=>'FCHA_FNAL'
,p_display_order=>44
,p_column_identifier=>'F'
,p_column_label=>'Fecha Final'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170669100273120140)
,p_db_column_name=>'RDNDEO'
,p_display_order=>54
,p_column_identifier=>'T'
,p_column_label=>'Redondeo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170669217252120141)
,p_db_column_name=>'BSE_INCIAL'
,p_display_order=>64
,p_column_identifier=>'U'
,p_column_label=>'Base Inicial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'99G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170669341431120142)
,p_db_column_name=>'BSE_FNAL'
,p_display_order=>74
,p_column_identifier=>'V'
,p_column_label=>'Base Final'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'99G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170669473264120143)
,p_db_column_name=>'VLOR_TRFA'
,p_display_order=>84
,p_column_identifier=>'W'
,p_column_label=>'Valor Tarifa'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170669555680120144)
,p_db_column_name=>'LQDCION_MNMA'
,p_display_order=>94
,p_column_identifier=>'X'
,p_column_label=>unistr('Liquidaci\00F3n M\00EDnima')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170669618685120145)
,p_db_column_name=>'LQDCION_MXMA'
,p_display_order=>104
,p_column_identifier=>'Y'
,p_column_label=>unistr('Liquidaci\00F3n M\00E1xima')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170669724173120146)
,p_db_column_name=>'ID_INDCDOR_ECNMCO'
,p_display_order=>114
,p_column_identifier=>'Z'
,p_column_label=>'Ind Economico'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170669840212120147)
,p_db_column_name=>'INDCDR_USA_FCHA_LQDCION'
,p_display_order=>124
,p_column_identifier=>'AA'
,p_column_label=>unistr('Ind. Usa <br>Fecha Liquidaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170669940181120148)
,p_db_column_name=>'INDCDOR_USA_BSE'
,p_display_order=>134
,p_column_identifier=>'AB'
,p_column_label=>'Ind. Usa Base'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170670022784120149)
,p_db_column_name=>'TXTO_TRFA'
,p_display_order=>144
,p_column_identifier=>'AC'
,p_column_label=>'Tarifa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170670141728120150)
,p_db_column_name=>'ID_TRFA_ESQMA'
,p_display_order=>154
,p_column_identifier=>'AD'
,p_column_label=>'Id trfa esqma'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(57293365897180015)
,p_db_column_name=>'ID_IMPSTO_ACTO'
,p_display_order=>164
,p_column_identifier=>'AZ'
,p_column_label=>'Id Impsto Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(57293599338180017)
,p_db_column_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_display_order=>174
,p_column_identifier=>'BB'
,p_column_label=>'Id Impsto Acto Cncpto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(57293669260180018)
,p_db_column_name=>'ID_CNCPTO'
,p_display_order=>184
,p_column_identifier=>'BC'
,p_column_label=>'Id Cncpto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(511359432613982923)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1716383'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_IMPSTO:ID_IMPSTO_SBMPSTO:NMBRE_IMPSTO_ACTO:DSCRPCION_CNCPTO:FCHA_INCIAL:FCHA_FNAL:BSE_INCIAL:BSE_FNAL:TXTO_TRFA:'
,p_sort_column_1=>'ID_IMPSTO'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'ID_IMPSTO_SBMPSTO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'NMBRE_IMPSTO_ACTO'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'DSCRPCION_CNCPTO'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'FCHA_INCIAL'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(513760150169086006)
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
 p_id=>wwv_flow_api.id(1016740279692095645)
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
 p_id=>wwv_flow_api.id(171631309694980166)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(513760150169086006)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P42_BRANCH_APP.:&P42_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(171630967438980159)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(513760150169086006)
,p_button_name=>'btn_nuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo<br> Esquema Tarifa'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:43::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47855391217794625)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(1016740279692095645)
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
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(171639082283980270)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(1016740279692095645)
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
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(171643870845980317)
,p_branch_name=>'Regresar'
,p_branch_action=>'P42_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(171631309694980166)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38328307691496701)
,p_name=>'P42_BRANCH_PAGE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1016740279692095645)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38328419530496702)
,p_name=>'P42_BRANCH_APP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1016740279692095645)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58420626712106778)
,p_name=>'P42_FCHA_INCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1016740279692095645)
,p_prompt=>'Fecha Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha inicial.'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58421010179108814)
,p_name=>'P42_FCHA_FNAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1016740279692095645)
,p_prompt=>'Fecha Final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>255
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha final'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171639411120980271)
,p_name=>'P42_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1016740279692095645)
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
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171639897499980285)
,p_name=>'P42_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1016740279692095645)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto_sbmpsto)  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P42_ID_IMPSTO',
' order by 1',
'  '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P42_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el subtributo.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171640210341980285)
,p_name=>'P42_BRANCH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1016740279692095645)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171641412071980286)
,p_name=>'P42_ID_IMPSTO_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1016740279692095645)
,p_prompt=>'Acto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || a.cdgo_impsto_acto || ''] '' || a.nmbre_impsto_acto d',
'        , a.id_impsto_acto',
'     from df_i_impuestos_acto   a',
'    where a.id_impsto           = :P42_ID_IMPSTO',
'      and a.id_impsto_sbmpsto   = :P42_ID_IMPSTO_SBMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P42_ID_IMPSTO,P42_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el acto concepto.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47853790102794609)
,p_name=>'Al cerrar modal'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47853848908794610)
,p_event_id=>wwv_flow_api.id(47853790102794609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(511325747500958024)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48295870050591602)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_FCHA_INCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48295978453591603)
,p_event_id=>wwv_flow_api.id(48295870050591602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P42_FCHA_FNAL").datepicker( ''option'' , ''minDate'' , $("#P42_FCHA_INCIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47856017334794632)
,p_name=>'Limpiar filtros'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(47855391217794625)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47856142322794633)
,p_event_id=>wwv_flow_api.id(47856017334794632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_ID_IMPSTO,P42_ID_IMPSTO_SBMPSTO,P42_ID_IMPSTO_ACTO,P42_FCHA_INCIAL,P42_FCHA_FNAL'
,p_stop_execution_on_error=>'Y'
);
end;
/
