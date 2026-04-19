prompt --application/pages/page_00023
begin
wwv_flow_api.create_page(
 p_id=>23
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Gesti\00F3n de Obra')
,p_step_title=>unistr('Gesti\00F3n de Obra')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro que desea eliminar la obra?'';')
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TabsRegion-items{',
'    min-height: 382px !important;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191203080530'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75550957352325816)
,p_plug_name=>'Tab Obra'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75552688127325833)
,p_plug_name=>unistr('<b>Georreferenciaci\00F3n de Obra</b>')
,p_parent_plug_id=>wwv_flow_api.id(75550957352325816)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select b.lttud lat',
'      , b.lngtud lng',
'      , 1 mag',
'  from gi_g_obras_sujeto_impuesto a',
'  join si_i_predios b',
'    on a.id_sjto_impsto = b.id_sjto_impsto ',
'   and ( b.lttud is not null',
'    or b.lngtud is not null )',
' where a.id_obra = :P23_ID_OBRA'))
,p_plug_source_type=>'PLUGIN_COM.JK64.HEATMAP'
,p_plug_query_num_rows=>500000
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from gi_g_obras_sujeto_impuesto ',
' where id_obra = :P23_ID_OBRA'))
,p_attribute_01=>'400'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'0.5'
,p_attribute_05=>'5'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76575572799148033)
,p_plug_name=>unistr('<b>Gesti\00F3n de Obra</b>')
,p_parent_plug_id=>wwv_flow_api.id(75550957352325816)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76872802757101010)
,p_plug_name=>'<b>Predios</b>'
,p_parent_plug_id=>wwv_flow_api.id(75550957352325816)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select a.id_prdio ',
'         , b.idntfccion_sjto',
'         , b.drccion',
'         , a.cdgo_prdio_clsfccion',
'         , a.dscrpcion_prdo_dstno',
'         , a.dscrpcion_uso_suelo',
'         , a.area_grvble',
'         , a.bse_grvble',
'         , a.dstncia',
'         , a.lttud',
'         , a.lngtud',
'      from v_si_i_predios a',
'      join v_si_i_sujetos_impuesto b',
'        on a.id_sjto_impsto = b.id_sjto_impsto',
'      join gi_g_obras_sujeto_impuesto c',
'        on b.id_sjto_impsto = c.id_sjto_impsto',
'     where c.id_obra = :P23_ID_OBRA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from gi_g_obras_sujeto_impuesto ',
' where id_obra = :P23_ID_OBRA'))
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
 p_id=>wwv_flow_api.id(77160833007554201)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encuentran predios asignados a la obra.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14:P14_ID_PRDIO:#ID_PRDIO#'
,p_detail_link_text=>'ver<span class="fa fa-eye" aria-hidden="true"></span>'
,p_owner=>'NARDILA'
,p_internal_uid=>77160833007554201
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77160934850554202)
,p_db_column_name=>'ID_PRDIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Prdio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77161080607554203)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77161116545554204)
,p_db_column_name=>'DRCCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77161291362554205)
,p_db_column_name=>'CDGO_PRDIO_CLSFCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77161389375554206)
,p_db_column_name=>'DSCRPCION_PRDO_DSTNO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77161465052554207)
,p_db_column_name=>'DSCRPCION_USO_SUELO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Uso'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77161587838554208)
,p_db_column_name=>'AREA_GRVBLE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\00C1rea Gravable ')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77161671287554209)
,p_db_column_name=>'BSE_GRVBLE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Base Gravable (AVi)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77161782200554210)
,p_db_column_name=>'DSTNCIA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Distancia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75551859279325825)
,p_db_column_name=>'LTTUD'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Latitud'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(75551925467325826)
,p_db_column_name=>'LNGTUD'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Longitud'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77179151603567792)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'771792'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'ID_PRDIO:IDNTFCCION_SJTO:DRCCION:CDGO_PRDIO_CLSFCCION:DSCRPCION_PRDO_DSTNO:DSCRPCION_USO_SUELO:AREA_GRVBLE:BSE_GRVBLE:DSTNCIA:LTTUD:LNGTUD'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153834423172899877)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
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
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(153835993467903384)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
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
'  Funcionalidad que permite:<br/><br/>',
unistr('  <b>1.</b> Carcaterizar los atributos de una obra, cuyo valor ser\00E1 distribuido a los sujetos de impuestos de acuerdo al beneficio recibido.<br/><br/>'),
unistr('  <b>2.</b> Visualizar la relaci\00F3n de Perdios objetos del beneficio.<br/><br/>'),
unistr('  <b>3.</b> Georreferenciar el \00E1rea de influencia de la obra y sus respectivos predios.<br/><br/>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76872972700101011)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(153834423172899877)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76576033504148034)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(76575572799148033)
,p_button_name=>'Btn_Aplicar_Cambios'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P23_ID_OBRA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76575961187148034)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(76575572799148033)
,p_button_name=>'Btn_Insertar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P23_ID_OBRA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76576184526148034)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(76575572799148033)
,p_button_name=>'Btn_Eliminar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P23_ID_OBRA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76577853642148036)
,p_branch_action=>'f?p=&APP_ID.:19:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76578254647148037)
,p_name=>'P23_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76575572799148033)
,p_use_cache_before_default=>'NO'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76578682493148052)
,p_name=>'P23_ID_OBRA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(76575572799148033)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_OBRA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76579047428148054)
,p_name=>'P23_CDGO_CLNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76575572799148033)
,p_use_cache_before_default=>'NO'
,p_item_default=>':F_CDGO_CLNTE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76579496832148054)
,p_name=>'P23_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(76575572799148033)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo:'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
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
,p_lov_null_text=>'Seleccione Impuesto'
,p_read_only_when=>'P23_ID_OBRA'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista presentada el tributo a procesar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76579839147148054)
,p_name=>'P23_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(76575572799148033)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo:'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'     , id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P23_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Sub-Impuesto'
,p_lov_cascade_parent_items=>'P23_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P23_ID_OBRA'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista presentada el sub-tributo a procesar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76580284468148055)
,p_name=>'P23_ID_PRDO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(76575572799148033)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodo:'
,p_source=>'ID_PRDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select vgncia || ''-'' || prdo d',
'         , id_prdo r ',
'      from df_i_periodos ',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and id_impsto  = :P23_ID_IMPSTO',
'       and id_impsto_sbmpsto = :P23_ID_IMPSTO_SBMPSTO',
'  order by d desc'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Periodo'
,p_lov_cascade_parent_items=>'P23_ID_IMPSTO,P23_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_read_only_when=>'P23_ID_OBRA'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista presentada el periodo a procesar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76580668646148055)
,p_name=>'P23_DSCRPCION'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(76575572799148033)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Descripci\00F3n Obra:')
,p_source=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>125
,p_cMaxlength=>200
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la descripci\00F3n de la obra a procesar.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76581053810148055)
,p_name=>'P23_VLOR_TTAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(76575572799148033)
,p_use_cache_before_default=>'NO'
,p_source=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76582250938148061)
,p_name=>'P23_ID_MTDO_DSTRBCION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(76575572799148033)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('M\00E9todo Distribuci\00F3n:')
,p_source=>'ID_MTDO_DSTRBCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_METODOS_DISTRIBUCION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre as l',
'     , id_mtdo_dstrbcion as v',
'  from df_s_metodos_distribucion',
' where actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>unistr('Seleccione M\00E9todo de Distribuci\00F3n ')
,p_read_only_when=>'P23_ID_OBRA'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista presentada el m\00E9todo de distribuci\00F3n a procesar.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'auto'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81234999250308106)
,p_name=>'P23_VLOR_TTAL_VSUAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(76575572799148033)
,p_prompt=>'Valor Obra:'
,p_source_post_computation=>':P23_VLOR_TTAL'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el valor todal de la obra '
,p_attribute_01=>'P23_VLOR_TTAL'
,p_attribute_02=>'10000000000000'
,p_attribute_03=>'-10000000000000'
,p_attribute_05=>'$ '
,p_attribute_06=>'p'
,p_attribute_07=>','
,p_attribute_09=>'0'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>'.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76585743589148065)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Carga Datos Obra'
,p_attribute_02=>'GI_G_OBRAS'
,p_attribute_03=>'P23_ID_OBRA'
,p_attribute_04=>'ID_OBRA'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76586191881148065)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Crud de Obra'
,p_attribute_02=>'GI_G_OBRAS'
,p_attribute_03=>'P23_ID_OBRA'
,p_attribute_04=>'ID_OBRA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76586548582148065)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Reset Pagina'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(76576184526148034)
);
end;
/
