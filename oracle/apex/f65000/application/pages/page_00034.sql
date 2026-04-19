prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>unistr('Verificar email y blob del acto para envi\00F3 de notificaci\00F3n por email')
,p_page_mode=>'MODAL'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(30302372436578271)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'550'
,p_dialog_width=>'60%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20221213152205'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25883599092567525)
,p_plug_name=>'Tab Selector'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25882476305567514)
,p_plug_name=>'Blob Nulo'
,p_parent_plug_id=>wwv_flow_api.id(25883599092567525)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.idntfccion, d.nmbre_trcro, d.nmro_acto',
'from nt_g_lote a',
'--join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'--                                and b.cdgo_mdio      = ''CEL''    -- Correo electronico',
'--                                and a.cdgo_estdo_lte = ''EPR''    -- En proceso',
'join  nt_d_lote_detalle         c on c.id_lte = a.id_lte',
'join v_gn_g_actos               d on d.id_acto = c.id_acto',
'                             and (d.file_blob is null and d.file_bfile is null)',
'                             and d.indcdor_ntfcdo = ''N'' ',
'where  a.id_lte         = :P34_ID_LTE;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from nt_g_lote a',
'join v_nt_d_ntfccion_mdio_entdd b on a.id_entdad_clnte_mdio = b.id_entdad_clnte_mdio',
'                                and b.cdgo_mdio      = ''CEL''    -- Correo electronico',
'                                and a.cdgo_estdo_lte = ''EPR''    -- En proceso',
'join  nt_d_lote_detalle         c on c.id_lte = a.id_lte',
'join v_gn_g_actos               d on d.id_acto = c.id_acto',
'                             and (d.file_blob is null and d.file_bfile is null)',
'                             and d.indcdor_ntfcdo = ''N'' ',
'where  a.id_lte         = :P34_ID_LTE;'))
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
 p_id=>wwv_flow_api.id(25882651426567516)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>25882651426567516
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25883062431567520)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'No. Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25883296009567522)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25883301160567523)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25922321714741482)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'259224'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'IDNTFCCION:NMBRE_TRCRO:NMRO_ACTO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(231613258554869321)
,p_plug_name=>'Email Nulo'
,p_parent_plug_id=>wwv_flow_api.id(25883599092567525)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_sjto_impsto',
'    ,c.idntfccion_sjto',
'    ,c.drccion',
'    ,(select nmro_acto from gn_g_actos where id_acto = a.id_acto) nmro_acto',
'    ,c.email',
'from nt_d_lote_detalle a  join gn_g_actos_sujeto_impuesto b on b.id_acto = a.id_acto',
'                          join v_si_i_sujetos_impuesto      c on c.id_sjto_impsto = b.id_sjto_impsto',
'                             --  and c.email is null         ',
'where  id_lte         = :P34_ID_LTE',
'   and regexp_substr(c.email,''[a-zA-Z0-9._%-]+@[a-zA-Z0-9._%-]+\.[a-zA-Z]{2,4}'') is null;',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from nt_d_lote_detalle a  join gn_g_actos_sujeto_impuesto b on b.id_acto = a.id_acto',
'                          join v_si_i_sujetos_impuesto      c on c.id_sjto_impsto = b.id_sjto_impsto',
'                             --  and c.email is null         ',
'where  id_lte         = :P34_ID_LTE',
'   and regexp_substr(c.email,''[a-zA-Z0-9._%-]+@[a-zA-Z0-9._%-]+\.[a-zA-Z]{2,4}'') is null;'))
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
 p_id=>wwv_flow_api.id(25881806695567508)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=70000:56:&SESSION.::&DEBUG.:RP,56:P56_SJTO_IMPSTO,P56_TPO_PRSNA_OCULTO,P56_PGNA,P56_APPLCCION:#ID_SJTO_IMPSTO#,N,&APP_PAGE_ID.,65000'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Editar">'
,p_owner=>'JPRADA'
,p_internal_uid=>25881806695567508
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25881988952567509)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25882077869567510)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25882103714567511)
,p_db_column_name=>'DRCCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25882264336567512)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'No. Acto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25882366486567513)
,p_db_column_name=>'EMAIL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25907183527681535)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'259072'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'IDNTFCCION_SJTO:DRCCION:NMRO_ACTO:EMAIL:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25883622403567526)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(25883599092567525)
,p_button_name=>'Regresar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(25883888447567528)
,p_branch_name=>'Regresar'
,p_branch_action=>'f?p=&APP_ID.:&P34_BRANCH.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(25883622403567526)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25883750609567527)
,p_name=>'P34_BRANCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(231613258554869321)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(194104997887924807)
,p_name=>'P34_ID_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(231613258554869321)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
