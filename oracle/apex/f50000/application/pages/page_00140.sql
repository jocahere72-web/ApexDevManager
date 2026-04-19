prompt --application/pages/page_00140
begin
wwv_flow_api.create_page(
 p_id=>140
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Metadatos SubImpuesto'
,p_step_title=>'Metadatos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});'))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191206084343'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18225379948830601)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda ')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18225850976830606)
,p_plug_name=>'Metadatos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_impsto_sbmpsto_mtdta,',
'        a.nmbre,',
'        a.dscrpcion_tpo_dto,',
'        a.dscrpcion_tpo_objto,',
'        a.dscrpcion_tpo_orgen,',
'        a.dscrpcion_indcdor_rqrdo,',
'        a.dscrpcion_actvo,',
'        a.orden,',
'        a.tpo_objto,',
'        a.tpo_orgen,',
'        case when a.tpo_objto = ''S'' and a.tpo_orgen = ''E'' then ''<span class="fa fa-list" style="color:blue;"></span>'' end estatico',
'from v_df_i_impstos_sbmpsto_mtdta a',
'where a.id_impsto = :P140_TRBTO',
'and (a.id_impsto_sbmpsto = :P140_SBTRBTO  or :P140_SBTRBTO is null)',
'and a.cdgo_clnte = :F_CDGO_CLNTE;'))
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
 p_id=>wwv_flow_api.id(18226736989830615)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:143:&SESSION.::&DEBUG.:RP,143:P143_ID_IMPSTO_SBMPSTO_MTDTA,P143_TRBTO,P143_SBTRBTO:#ID_IMPSTO_SBMPSTO_MTDTA#,&P140_TRBTO.,&P140_SBTRBTO.'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></center>'
,p_owner=>'LTORRES'
,p_internal_uid=>18226736989830615
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(45786680636362202)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO_MTDTA'
,p_display_order=>10
,p_column_identifier=>'M'
,p_column_label=>'Id Impsto Sbmpsto Mtdta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18226947374830617)
,p_db_column_name=>'NMBRE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18227032572830618)
,p_db_column_name=>'DSCRPCION_TPO_DTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tipo de dato'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18227109762830619)
,p_db_column_name=>'DSCRPCION_TPO_OBJTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tipo de objeto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18227272156830620)
,p_db_column_name=>'DSCRPCION_TPO_ORGEN'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo de origen'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18227320165830621)
,p_db_column_name=>'DSCRPCION_INDCDOR_RQRDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00BFRequerido?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18227423064830622)
,p_db_column_name=>'DSCRPCION_ACTVO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18227569915830623)
,p_db_column_name=>'ORDEN'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37349706772202822)
,p_db_column_name=>'TPO_OBJTO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Tpo Objto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37349800613202823)
,p_db_column_name=>'TPO_ORGEN'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Tpo Orgen'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37000252264072120)
,p_db_column_name=>'ESTATICO'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>unistr('Est\00E1tico')
,p_column_link=>'f?p=&APP_ID.:147:&SESSION.::&DEBUG.:RP,147:P147_ID_IMPSTO_SBMPSTO_MTDTA:#ID_IMPSTO_SBMPSTO_MTDTA#'
,p_column_linktext=>'#ESTATICO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(18254682314978666)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'182547'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE:DSCRPCION_TPO_DTO:DSCRPCION_ACTVO:ORDEN:DSCRPCION_INDCDOR_RQRDO:DSCRPCION_TPO_OBJTO:DSCRPCION_TPO_ORGEN:ESTATICO::ID_IMPSTO_SBMPSTO_MTDTA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20745084862325468)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(20746287184326451)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'Funcionalidad que permite ingresar, consultar, modificar y eliminar metadatos correspondientes a un tributo y sub tributo.<br><br>	',
unistr('En caso de crear un metadato de tipo lista de selecci\00F3n est\00E1tica es necesario guardarlo y luego agregar los valores correspondientes.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17993990031238635)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(20745084862325468)
,p_button_name=>'Btn_Nuevo_Metadato'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Metadato'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:143:&SESSION.::&DEBUG.:RP,143:P143_TRBTO,P143_SBTRBTO:&P140_TRBTO.,&P140_SBTRBTO.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17994399117238637)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(20745084862325468)
,p_button_name=>'Btn_Sub_Impuesto'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Nuevo Sub Impuesto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10:P10_ID_IMPSTO:&P140_ID_IMPSTO.'
,p_button_condition=>'P140_ID_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18225653616830604)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(18225379948830601)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="margin-top:4px;margin-left: 19px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18225427488830602)
,p_name=>'P140_TRBTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18225379948830601)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto as d,',
'        a.id_impsto as r',
'from df_c_impuestos a ',
'where a.cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Tributo'
,p_colspan=>4
,p_grid_column=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el tributo para consultar el metadato asociado'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18225556444830603)
,p_name=>'P140_SBTRBTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18225379948830601)
,p_prompt=>'SubTributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P140_TRBTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P140_TRBTO'
,p_ajax_items_to_submit=>'P140_SBTRBTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el sub tributo para consultar el metadato asociado'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'95%'
);
end;
/
