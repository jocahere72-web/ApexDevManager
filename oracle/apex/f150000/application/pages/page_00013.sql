prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Informaci\00F3n Ex\00E9gena Vr 2')
,p_step_title=>unistr('Informaci\00F3n Ex\00E9gena Vr 2')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
''))
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20200505165108'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(136103719451871553)
,p_plug_name=>'SUJETO DEL TRIBUTO '
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138650749057987254)
,p_plug_name=>unistr('Informaci\00F3n del Sujeto Impuesto')
,p_parent_plug_id=>wwv_flow_api.id(136103719451871553)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select distinct nmbre_rzon_scial',
'        , drccion ',
'     from v_si_i_sujetos_responsable ',
'    where id_sjto_impsto = :P13_ID_SJTO_IMPSTO',
'    ',
'    ;'))
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
 p_id=>wwv_flow_api.id(138651086984987257)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>138651086984987257
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69509853416983676)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Nombre / Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69510217221983690)
,p_db_column_name=>'DRCCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(138662944461209718)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'695106'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_RZON_SCIAL:DRCCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(136104340686871559)
,p_plug_name=>'ARCHIVOS CARGADOS VIGENCIA &P13_VGNCIA.'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.file_name',
'        , a.id_exgna_archvo_tpo',
'        , a.nmbre_exgna_archvo_tpo',
'        , a.dscrpcion_exgna_archvo_tpo',
'        , to_char(dbms_lob.getlength(a.file_blob) / 1024 / 1024 , ''999G999G999G999G990D000'') || '' MB''tmno',
'        , a.id_infrmcion_exgna',
'        , a.fcha_dgta',
'        , a.fcha_mdfca',
'    from v_gi_g_informacion_exogena     a',
'   where a.id_sjto_impsto = :P13_ID_SJTO_IMPSTO ',
'     and a.vgncia in  (select m.vgncia from df_i_calendario_exogena m where m.cdgo_clnte = :F_CDGO_CLNTE and sysdate between m.fcha_dsde and m.fcha_hsta)'))
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
 p_id=>wwv_flow_api.id(136104409526871560)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14:P14_ID_INFRMCION_EXGNA:#ID_INFRMCION_EXGNA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_detail_link_condition_type=>'EXISTS'
,p_detail_link_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from df_i_calendario_exogena ',
'    where cdgo_clnte = :F_CDGO_CLNTE ',
'      and sysdate <= fcha_hsta',
'      and ultmo_dgto_nit = substr(:P11_IDNTFCCION, -1, 1)'))
,p_owner=>'SROMERO'
,p_internal_uid=>136104409526871560
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69511736002983706)
,p_db_column_name=>'ID_INFRMCION_EXGNA'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Id Infrmcion Exgna'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69513350423983708)
,p_db_column_name=>'ID_EXGNA_ARCHVO_TPO'
,p_display_order=>20
,p_column_identifier=>'G'
,p_column_label=>'Id Exgna Archvo Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69513748292983708)
,p_db_column_name=>'NMBRE_EXGNA_ARCHVO_TPO'
,p_display_order=>30
,p_column_identifier=>'H'
,p_column_label=>'Tipo Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69514187276983708)
,p_db_column_name=>'DSCRPCION_EXGNA_ARCHVO_TPO'
,p_display_order=>40
,p_column_identifier=>'I'
,p_column_label=>unistr('Descripci\00F3n Tipo Archivo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69511393494983706)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'A'
,p_column_label=>'Nombre de Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69512984235983708)
,p_db_column_name=>'TMNO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Tama\00F1o')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69512165623983707)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69512545413983707)
,p_db_column_name=>'FCHA_MDFCA'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>unistr('Fecha de Actualizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(138610609241321999)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'695145'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_EXGNA_ARCHVO_TPO:DSCRPCION_EXGNA_ARCHVO_TPO:FILE_NAME:FCHA_DGTA:FCHA_MDFCA:'
,p_sort_column_1=>'NMBRE_EXGNA_ARCHVO_TPO'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138651307575987260)
,p_plug_name=>'Cabezera'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>unistr('<h2 ><center><b>INFORMACI\00D3N EX\00D3GENA VIGENCIA &P13_VGNCIA. </b></center></h2>')
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69505939996983653)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(136103719451871553)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69514951040983709)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(136104340686871559)
,p_button_name=>'BTN_NUEVO_ARCHIVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Archivo'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP:P14_ID_SJTO_IMPSTO,P14_ID_IMPSTO:&P13_ID_SJTO_IMPSTO.,&P13_ID_IMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_ind_prsntar    number := 0;',
'    v_rspsta         boolean;',
'    v_rspsta_mnsje   varchar2(1000);',
'    ',
unistr('    -- Determina si a La Fecha A\00FAn puede presentar la Inf. Ex\00F3gena'),
'    cursor c_df_i_calendario_exogena is',
'    select 1',
'     from df_i_calendario_exogena ',
'    where cdgo_clnte = :F_CDGO_CLNTE ',
'      and sysdate <= fcha_hsta',
'      and ultmo_dgto_nit = substr(:P13_IDNTFCCION, -1, 1);',
'    ',
unistr('    -- Determina si Ya se presentaron todos los tipos de archivos de informacion ex\00F3gena   '),
'    cursor c_gi_g_informacion_exogena is',
'    select 1',
'    from ',
'    (',
'        select count(distinct id_exgna_archvo_tpo) as cant_tipos_archivos',
'        from v_gi_g_informacion_exogena ',
'       where id_sjto_impsto = :P13_ID_SJTO_IMPSTO ',
'         and vgncia in (select vgncia from df_i_calendario_exogena where cdgo_clnte = :F_CDGO_CLNTE and sysdate between fcha_dsde and fcha_hsta)',
'    ) Archivos',
'    where cant_tipos_archivos >= 4;',
'    ',
'',
'begin',
unistr('    -- Chequeamos si a La Fecha A\00FAn puede presentar la Inf. Ex\00F3gena'),
'    open    c_df_i_calendario_exogena;',
'    fetch   c_df_i_calendario_exogena into v_ind_prsntar;',
'',
'    if c_df_i_calendario_exogena%found then',
unistr('        -- A\00FAn puede presentar la Ex\00F3gena'),
'    ',
unistr('        -- Determinamos si falta por presentar alg\00FAn tipo de archivo (x implementar) '),
'        open c_gi_g_informacion_exogena;',
'        fetch c_gi_g_informacion_exogena into v_ind_prsntar;',
'        if c_gi_g_informacion_exogena%found then',
'            -- Si Ya se presento Archvio --> No se muestra boton',
'            v_rspsta := false;',
'        else',
'            -- Si NO se ha presentado Archvio --> Si se muestra boton',
'            v_rspsta := true;',
'        end if;',
'        close c_gi_g_informacion_exogena;',
'',
'    else',
unistr('        -- Ya NO puede presentar la Ex\00F3gena -Venci\00F3 el Tiempo'),
'        v_rspsta := false;',
unistr('        v_rspsta_mnsje := ''Fecha l\00EDmite de presentaci\00F3n ya expir\00F3'';'),
'    end if;',
'    ',
'    close c_df_i_calendario_exogena;',
'    ',
'    return v_rspsta;',
'exception ',
'        when others then ',
'            if c_df_i_calendario_exogena%isopen then',
'                close c_df_i_calendario_exogena;',
'            end if;',
'            if c_gi_g_informacion_exogena%isopen then',
'                close c_gi_g_informacion_exogena;',
'            end if;',
'            return false;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69505571791983652)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(136103719451871553)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,11::'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(69520380582983740)
,p_branch_action=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69506324036983653)
,p_name=>'P13_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(136103719451871553)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69506765117983655)
,p_name=>'P13_VGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(136103719451871553)
,p_use_cache_before_default=>'NO'
,p_source=>'select distinct vgncia from df_i_calendario_exogena where cdgo_clnte = :F_CDGO_CLNTE and sysdate between fcha_dsde and fcha_hsta'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69507102365983656)
,p_name=>'P13_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(136103719451871553)
,p_prompt=>'NIT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69507585882983656)
,p_name=>'P13_ID_SJTO_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(136103719451871553)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69507942317983656)
,p_name=>'P13_ID_INFRMCION_EXGNA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(136103719451871553)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69508392139983656)
,p_name=>'P13_INDCDOR_EXSTNCIA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(136103719451871553)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69508759513983657)
,p_name=>'P13_INDCDOR_PRSNTCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(136103719451871553)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69509164613983657)
,p_name=>'P13_MNSJE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(136103719451871553)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(69515415192983710)
,p_validation_name=>'Validar si existe el sujeto impuesto'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte        = :F_CDGO_CLNTE',
'       and id_impsto         = :P13_ID_IMPSTO ',
'       and idntfccion_sjto   = :P13_IDNTFCCION'))
,p_validation_type=>'EXISTS'
,p_error_message=>'El NIT ingresado no existe.'
,p_when_button_pressed=>wwv_flow_api.id(69505939996983653)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(69515834265983722)
,p_validation_name=>unistr('Validar Fecha M\00E1xima de Presentaci\00F3n')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from df_i_calendario_exogena ',
'    where cdgo_clnte = :F_CDGO_CLNTE ',
'      and sysdate <= fcha_hsta',
'      and ultmo_dgto_nit = substr(:P13_IDNTFCCION, -1, 1)'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Su fecha m\00E1xima de presentaci\00F3n ya ha vencido')
,p_when_button_pressed=>wwv_flow_api.id(69505939996983653)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69516577723983722)
,p_name=>unistr('Al cerrar la modal Informaci\00F3n Exogena ')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(136104340686871559)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69517016102983731)
,p_event_id=>wwv_flow_api.id(69516577723983722)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69518864798983732)
,p_name=>unistr('Al Cerrar la moda Informaci\00F3n Exogena Refrescar al hacer clic en el botnon nuevo')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(69514951040983709)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69519839536983736)
,p_event_id=>wwv_flow_api.id(69518864798983732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(136103719451871553)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69519363499983733)
,p_event_id=>wwv_flow_api.id(69518864798983732)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(136104340686871559)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(69517444372983731)
,p_name=>unistr('Click Bot\00F3n Consultar')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(69505939996983653)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69518420269983732)
,p_event_id=>wwv_flow_api.id(69517444372983731)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    cursor c_v_si_i_sujetos_impuesto is     ',
'    select id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte        = :F_CDGO_CLNTE',
'       and id_impsto         = :P13_ID_IMPSTO ',
'       and idntfccion_sjto   = :P13_IDNTFCCION;',
'    ',
unistr('    -- Determinamos si la Ex\00F3gena A\00FAn se puede presentar'),
'    cursor c_df_i_calendario_exogena is',
'    select fcha_hsta',
'      from df_i_calendario_exogena ',
'    where cdgo_clnte = :F_CDGO_CLNTE ',
'      and trunc(sysdate) <= fcha_hsta',
'      and ultmo_dgto_nit = substr(:P13_IDNTFCCION, -1, 1);',
'      ',
'     v_id_sjto_impsto        number;',
'     v_indcdor_prsntcion     number;',
'     v_rspsta                varchar2(100);',
'     v_fcha_hsta             date;',
'begin',
'    :P13_INDCDOR_EXSTNCIA    := ''0'';',
'    apex_util.set_session_state(''P13_INDCDOR_EXSTNCIA'', ''0'');',
'    :P13_INDCDOR_PRSNTCION := 0;',
'    apex_util.set_session_state(''P13_INDCDOR_PRSNTCION'', ''0'');',
'    v_indcdor_prsntcion := 0;',
'    ',
'    open c_v_si_i_sujetos_impuesto;',
'    ',
'    fetch c_v_si_i_sujetos_impuesto into v_id_sjto_impsto;',
'    ',
'    if c_v_si_i_sujetos_impuesto%found then ',
'    ',
'        -- Se setea el id_sjto_impsto',
'        :P13_ID_SJTO_IMPSTO    := v_id_sjto_impsto;',
'        :P13_INDCDOR_EXSTNCIA  := ''1'';',
'        apex_util.set_session_state(''P13_INDCDOR_EXSTNCIA'', ''1'');',
unistr('        :P13_MNSJE             := ''<H4>Identificaci\00F3n Existe</H4>'';'),
unistr('        apex_util.set_session_state(''P13_MNSJE'', ''<H4>Identificaci\00F3n Existe</H4>'');'),
'        ',
'        open c_df_i_calendario_exogena;',
'        fetch c_df_i_calendario_exogena into v_fcha_hsta;',
'        if c_df_i_calendario_exogena%found then',
'            :P13_INDCDOR_PRSNTCION := 1;',
unistr('            :P13_MNSJE             := ''<H4>Fecha de presentaci\00F3n esta Vigente</H4>'';'),
'            apex_util.set_session_state(''P13_INDCDOR_PRSNTCION'', ''1'');',
unistr('            apex_util.set_session_state(''P13_MNSJE'', ''<H4>Fecha de presentaci\00F3n esta Vigente</H4>'');'),
'        else',
'            :P13_INDCDOR_PRSNTCION := 0;',
'            apex_util.set_session_state(''P13_INDCDOR_PRSNTCION'', ''0'');',
'            ',
unistr('            :P13_MNSJE             := ''<H4>Fecha de presentaci\00F3n de Informaci\00F3n Ex\00F3gena no esta vigente. </H4>'';'),
unistr('            apex_util.set_session_state(''P13_MNSJE'', ''<H4>Fecha de presentaci\00F3n de Informaci\00F3n Ex\00F3gena no esta vigente</H4>'');'),
'',
'        end if;',
'        close c_df_i_calendario_exogena;',
'        ',
'    else',
'        :P13_ID_SJTO_IMPSTO    := null;',
'        :P13_INDCDOR_EXSTNCIA  := ''0'';',
'        apex_util.set_session_state(''P13_INDCDOR_EXSTNCIA'', ''0'');',
unistr('        :P13_MNSJE             := ''<H4>Identificaci\00F3n no existe</H4>'';'),
unistr('        apex_util.set_session_state(''P13_MNSJE'', ''<H4>Identificaci\00F3n no existe</H4>'');'),
'    end if;',
'    close c_v_si_i_sujetos_impuesto;   ',
'     ',
'exception',
'    when others then ',
'        :P13_ID_SJTO_IMPSTO    := null;',
'        :P13_INDCDOR_PRSNTCION := 0;',
'',
'        apex_util.set_session_state(''P13_INDCDOR_EXSTNCIA'', ''0'');',
'        apex_util.set_session_state(''P13_INDCDOR_PRSNTCION'', ''0'');',
'        ',
'        if c_v_si_i_sujetos_impuesto%isopen then',
'            close c_v_si_i_sujetos_impuesto;',
'        end if;',
'        if c_df_i_calendario_exogena%isopen then',
'            close c_df_i_calendario_exogena;',
'        end if;',
'end;       '))
,p_attribute_02=>'P13_IDNTFCCION'
,p_attribute_03=>'P13_ID_SJTO_IMPSTO,P13_INDCDOR_EXSTNCIA,P13_INDCDOR_PRSNTCION,P13_MNSJE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(69517949004983732)
,p_event_id=>wwv_flow_api.id(69517444372983731)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P13_INDCDOR_EXSTNCIA'') == ''1'' ){',
'    // Si la IDENTIFICACION existe --> Enviamos el SUBMIT',
'    ',
'    if($v(''P13_INDCDOR_PRSNTCION'') == ''1'' ){ ',
'        apex.submit();',
'    }',
'    else {',
'        ',
'        // Si la FECHA LIMITE presentacion ya VENCIO',
'        Swal.fire({',
'            icon: ''error'',',
'            title:  ''<H2 >Industria y Comercio</H2>'',',
'            html: $v(''P13_MNSJE'')',
'        });',
'    }    ',
'}',
'else {',
'    ',
'    // Si la IDENTIFICACION existe --> Enviamos el SUBMIT',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >Industria y Comercio</H2>'',',
unistr('        html: ''<H4>La Identificaci\00F3n Ingresada no existe.</H4>'''),
'    });',
'    ',
'};',
'    ',
unistr('//''<H4>La Fecha de Presentaci\00F3n de Informaci\00F3n Ex\00F3gena ya caduc\00F3.</H4>''')))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69516195658983722)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta del Id sujeto impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_sjto_impsto',
'          into :P13_ID_SJTO_IMPSTO',
'          from v_si_i_sujetos_impuesto',
'         where cdgo_clnte        = :F_CDGO_CLNTE',
'           and id_impsto         = :P13_ID_IMPSTO ',
'           and idntfccion_sjto   = :P13_IDNTFCCION;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
