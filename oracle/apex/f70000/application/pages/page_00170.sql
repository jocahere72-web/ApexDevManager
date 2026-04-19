prompt --application/pages/page_00170
begin
wwv_flow_api.create_page(
 p_id=>170
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Relaci\00F3n de Productos por Resoluci\00F3n ')
,p_step_title=>unistr('Relaci\00F3n de Productos por Resoluci\00F3n ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210616165728'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8104398264863832)
,p_plug_name=>'Sucursales'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P170_ID_SJTO_IMPSTO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8101252872863801)
,p_plug_name=>'Sucursales'
,p_parent_plug_id=>wwv_flow_api.id(8104398264863832)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sjto_scrsal',
'     , a.id_sjto',
'     , a.id_sjto_impsto',
'     , a.cdgo_scrsal',
'     , a.nmbre',
'     , a.drccion',
'     , (',
'         select b.nmbre_dprtmnto',
'           from df_s_departamentos b',
'          where b.id_dprtmnto = a.id_dprtmnto_ntfccion',
'       ) as dprtmento',
'     , (',
'        select c.nmbre_mncpio',
'          from df_s_municipios c',
'         where c.id_mncpio = a.id_mncpio_ntfccion',
'       ) as mncpio',
'  from si_i_sujetos_sucursal a',
' where a.id_sjto_impsto = :P170_ID_SJTO_IMPSTO ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P170_ID_SJTO_IMPSTO'
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
 p_id=>wwv_flow_api.id(8103437880863823)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:213:&SESSION.::&DEBUG.:RP,213:P213_ID_SJTO_IMPSTO,P213_ID_SJTO,P213_ID_SCRSAL:#ID_SJTO_IMPSTO#,#ID_SJTO#,#ID_SJTO_SCRSAL#'
,p_detail_link_text=>'<span class="fa fa-eye" aria-hidden="true"></span>'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>8103437880863823
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8103563861863824)
,p_db_column_name=>'ID_SJTO_SCRSAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Scrsal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8103609888863825)
,p_db_column_name=>'ID_SJTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Sjto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8103780763863826)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8103876210863827)
,p_db_column_name=>'CDGO_SCRSAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('C\00F3digo ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8103912336863828)
,p_db_column_name=>'NMBRE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8104033874863829)
,p_db_column_name=>'DRCCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8104143271863830)
,p_db_column_name=>'DPRTMENTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8104244944863831)
,p_db_column_name=>'MNCPIO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Municipio'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(8147412276977217)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'81475'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_SJTO_SCRSAL:ID_SJTO:ID_SJTO_IMPSTO:CDGO_SCRSAL:NMBRE:DRCCION:DPRTMENTO:MNCPIO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95150454247667101)
,p_plug_name=>'Consultar Sujeto Impuesto '
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
 p_id=>wwv_flow_api.id(95150556162667102)
,p_plug_name=>'Sujeto Tributo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P170_ID_SJTO_IMPSTO'
,p_attribute_01=>'P170_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95151676067667113)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77989661281673844)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(95151676067667113)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	<br>',
'	<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'	<i>',
'	Esta funcionalidad permite gestionar:<br>',
'        1. Consultar un sujeto tributo y cuantas sucursales tienen asociada.<br><br>',
unistr('		<p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'	</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95191600562075717)
,p_plug_name=>'Resoluciones '
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_rslcion',
'     , id_sjto_impsto',
'     , nmro_rslcion',
'     , fcha_rslcion',
'     , fcha_incial',
'     , fcha_fnal',
'     , file_name',
'     , 1 as dscrgar',
'     , case when trunc(sysdate) >= trunc(fcha_incial) and trunc(sysdate) <= trunc(fcha_fnal) then',
'                ''Vigente''',
'            else',
'                ''Vencida''',
'       end as stdo',
'  from si_d_resoluciones',
' where id_sjto_impsto = :P170_ID_SJTO_IMPSTO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_api.id(95191727901075718)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato ')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:RP:P171_ID_RSLCION:#ID_RSLCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AMOLINA'
,p_internal_uid=>95191727901075718
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95191938600075720)
,p_db_column_name=>'ID_RSLCION'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Id Rslcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95192039677075721)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95192102370075722)
,p_db_column_name=>'NMRO_RSLCION'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero de Resoluci\00F3n ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95192298120075723)
,p_db_column_name=>'FCHA_RSLCION'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Fecha de Resolucion '
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95192385212075724)
,p_db_column_name=>'FCHA_INCIAL'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Fecha Inicio Resolucion'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95192426631075725)
,p_db_column_name=>'FCHA_FNAL'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Fecha Final Resolucion'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95192510266075726)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95192712213075728)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Descargar '
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:SI_D_RESOLUCIONES:FILE_BLOB:ID_RSLCION::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-cloud-download" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99473297647313103)
,p_db_column_name=>'STDO'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Estado '
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(95223558690137167)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'952236'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FCHA_INCIAL:FCHA_FNAL:NMRO_RSLCION:FCHA_RSLCION:STDO:DSCRGAR:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95151777961667114)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(95151676067667113)
,p_button_name=>'Btn_agregar_resolucion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Agregar Resoluci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95151101453667108)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(95150454247667101)
,p_button_name=>'Btn_consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95151290935667109)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(95150454247667101)
,p_button_name=>'Btn_consultar_parametro'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Consulta Par\00E1metro')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95151392524667110)
,p_branch_name=>unistr('ir a b\00FAsqueda de sujeto tributo')
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP,3:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P170_ID_SJTO_IMPSTO,&P170_ID_IMPSTO.,&P170_ID_IMPSTO_SBMPSTO.,P170_ID_IMPSTO,P170_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(95151290935667109)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95191336132075714)
,p_branch_name=>unistr('Agregar resoluci\00F3n ')
,p_branch_action=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:RP,171:P171_ID_SJTO_IMPSTO:&P170_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(95151777961667114)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95150632601667103)
,p_name=>'P170_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95150454247667101)
,p_prompt=>'Tributo:'
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
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95150704752667104)
,p_name=>'P170_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95150454247667101)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto as d',
'     , id_impsto_sbmpsto    as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P170_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P170_ID_IMPSTO'
,p_ajax_items_to_submit=>'P170_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95150853339667105)
,p_name=>'P170_ID_SJTO_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(95150454247667101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95150994904667106)
,p_name=>'P170_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95150454247667101)
,p_prompt=>unistr('Identificaci\00F3n: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95151505537667112)
,p_name=>'P170_MSNJE_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(95150454247667101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95191218745075713)
,p_validation_name=>'Sujeto impuesto no null'
,p_validation_sequence=>10
,p_validation=>':P170_ID_SJTO_IMPSTO is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Debe seleccionar un Sujeto Tributo'
,p_when_button_pressed=>wwv_flow_api.id(95151777961667114)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95191481060075715)
,p_validation_name=>'Tributo y subtributo no null'
,p_validation_sequence=>20
,p_validation=>'P170_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'Btn_consultar,Btn_consultar_parametro'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95191515520075716)
,p_validation_name=>'Nuevo'
,p_validation_sequence=>30
,p_validation=>'P170_ID_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition=>'Btn_consultar,Btn_consultar_parametro'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(95150704752667104)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95192823308075729)
,p_name=>'Al cerrar modal '
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95192991683075730)
,p_event_id=>wwv_flow_api.id(95192823308075729)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(95191600562075717)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95151445372667111)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar sujeto por identificaci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select id_sjto_impsto',
'    into :P170_ID_SJTO_IMPSTO',
'    from v_si_i_sujetos_impuesto',
'   where id_impsto       = :P170_ID_IMPSTO      ',
'     and idntfccion_sjto = :P170_IDNTFCCION;',
'     ',
'     :P170_MSNJE_RSPSTA   := ''Sujeto Encontrado'';',
'exception',
'        when no_data_found then',
unistr('                :P170_MSNJE_RSPSTA   := ''No se encontr\00F3 ning\00FAn dato.'';'),
'                :P170_ID_SJTO_IMPSTO := '''';',
'end;      ',
''))
,p_process_error_message=>'&P170_MSNJE_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95151101453667108)
,p_process_success_message=>'&P170_MSNJE_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95151077654667107)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar identificaci\00F3n ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.idntfccion_sjto    idntfccion_sjto        ',
'   into :P170_IDNTFCCION',
'   from v_si_i_sujetos_impuesto a',
'  where a.id_sjto_impsto = :P170_ID_SJTO_IMPSTO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P170_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
