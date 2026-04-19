prompt --application/pages/page_00019
begin
wwv_flow_api.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Informe Gesti\00F3n de Obra')
,p_step_title=>unistr('Gesti\00F3n de Obra')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191028173949'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76587298526148078)
,p_plug_name=>unistr('Informe Gesti\00F3n de Obra')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_obra',
'     , cdgo_clnte',
'     , id_impsto',
'     , nmbre_impsto',
'     , id_impsto_sbmpsto',
'     , nmbre_impsto_sbmpsto',
'     , id_prdo ',
'     , vgncia',
'     , dscrpcion_obra',
'     , vlor_ttal',
'     , fcha_rgstro',
'     , id_mtdo_dstrbcion',
'     , nmbre_mtdo_dstrbcion',
'     , dscrpcion_mtdo_dstrbcion',
'  from v_gi_g_obras',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(76587517574148078)
,p_name=>'Report 1'
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encontraron obras por mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23:P23_ID_OBRA:#ID_OBRA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'NARDILA'
,p_internal_uid=>76587517574148078
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76588049863148082)
,p_db_column_name=>'ID_OBRA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00FAmero Obra')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76588476880148082)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76588895477148083)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76589243213148083)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76589682977148083)
,p_db_column_name=>'ID_PRDO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Id Prdo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76590470181148089)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Valor Obra'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76590822786148089)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76591292444148090)
,p_db_column_name=>'ID_MTDO_DSTRBCION'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Id Mtdo Dstrbcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76872036286101002)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76872149430101003)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>40
,p_column_identifier=>'M'
,p_column_label=>'SubImpuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76872264555101004)
,p_db_column_name=>'DSCRPCION_OBRA'
,p_display_order=>50
,p_column_identifier=>'N'
,p_column_label=>unistr('Descripci\00F3n Obra')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76872362202101005)
,p_db_column_name=>'NMBRE_MTDO_DSTRBCION'
,p_display_order=>60
,p_column_identifier=>'O'
,p_column_label=>unistr('M\00E9todo de Distribuci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76872463983101006)
,p_db_column_name=>'DSCRPCION_MTDO_DSTRBCION'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>unistr('Descripci\00F3n M\00E9todo de Distribuci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76872528056101007)
,p_db_column_name=>'VGNCIA'
,p_display_order=>80
,p_column_identifier=>'Q'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(76592306475148629)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'765924'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_OBRA:DSCRPCION_OBRA:VLOR_TTAL:VGNCIA:NMBRE_MTDO_DSTRBCION:DSCRPCION_MTDO_DSTRBCION:'
,p_sort_column_1=>'ID_OBRA'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76872639113101008)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
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
'  <b>1.</b> Gestionar obras.<br/><br/>',
unistr('  <b>2.</b> Visualizar la informaci\00F3n de las obras.<br/><br/>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76872717219101009)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76591685086148092)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(76872717219101009)
,p_button_name=>'Btn_Nueva_Obra'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Obra'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
end;
/
