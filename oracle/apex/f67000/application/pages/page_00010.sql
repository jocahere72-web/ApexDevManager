prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>unistr('Lista Env\00EDos Programados')
,p_step_title=>unistr('Lista Env\00EDos Programados')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id){',
'    if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'        $(''#''+id).click();',
'    }',
'}',
'',
'buttonCollapse(''t_Button_rightControlButton'');'))
,p_step_template=>wwv_flow_api.id(71592158849187941)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251018011511'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5014584456193927)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>Funcionalidad que permite gestionar los envios programados.',
'<br/>',
'<br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'',
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5151085462976598)
,p_plug_name=>unistr('Lista Env\00EDos Programados')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71623038711187958)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_envio_prgrmdo, ',
'        cdgo_clnte,',
'        dscrpcion,',
'        case ejccion_tpo',
'            when ''INM'' then ''Inmediato'' ',
'            when ''UNV'' then ''Una vez''',
unistr('            when ''RPT'' then ''Repetici\00F3n'''),
'            when ''EVN'' then ''Evento''',
'        end ejccion_tpo,',
'        fcha_incio,',
'        fcha_fin,',
'        intrvlo_rptcion,',
'        vlor_intrvlo,',
'        fcha_rgstro,',
'        case actvo when ''S'' then ''Si'' when ''N'' then ''No'' end actvo,',
'        idntfcdor',
'from ma_g_envios_programado',
'--where id_usrio = :F_ID_USRIO',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5151478987976598)
,p_name=>unistr('Lista Env\00EDos Programados')
,p_max_row_count=>'1000000'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11:P11_ID_ENVIO_PRGRMDO:#ID_ENVIO_PRGRMDO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JCUAO'
,p_internal_uid=>5151478987976598
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5151592280976603)
,p_db_column_name=>'ID_ENVIO_PRGRMDO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Envio Prgrmdo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5151921850976609)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5152367869976610)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5152740528976610)
,p_db_column_name=>'EJCCION_TPO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('Tipo de Ejecuci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5153167367976610)
,p_db_column_name=>'FCHA_INCIO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Fecha Inicio'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5153507199976611)
,p_db_column_name=>'FCHA_FIN'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Fecha Fin'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5153999684976611)
,p_db_column_name=>'INTRVLO_RPTCION'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Intrvlo Rptcion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5154340703976611)
,p_db_column_name=>'VLOR_INTRVLO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Vlor Intrvlo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5157945561976614)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>unistr('Fecha de Reg\00EDstro')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5158342107976615)
,p_db_column_name=>'ACTVO'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(110891435690514102)
,p_db_column_name=>'IDNTFCDOR'
,p_display_order=>28
,p_column_identifier=>'S'
,p_column_label=>'Identificador'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5169598647977054)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'51696'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ENVIO_PRGRMDO:CDGO_CLNTE:DSCRPCION:EJCCION_TPO:FCHA_INCIO:FCHA_FIN:INTRVLO_RPTCION:VLOR_INTRVLO:FCHA_RGSTRO:ACTVO:IDNTFCDOR'
,p_sort_column_1=>'FCHA_RGSTRO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5158756589976615)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5151085462976598)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo Envi\00F3 Programado')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
end;
/
