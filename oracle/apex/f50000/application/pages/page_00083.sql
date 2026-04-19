prompt --application/pages/page_00083
begin
wwv_flow_api.create_page(
 p_id=>83
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Clases de Actividades Econ\00F3micas')
,p_step_title=>unistr('Clases de Actividades Econ\00F3micas')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});'))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191216090942'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2750171168086825)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'Funcionalidad que permite:',
'<br><br>	',
unistr('<b>1.-</b> Ingresar una nueva actividad econ\00F3mica hacer clic en el bot\00F3n Nueva actividad, se mostrar\00E1 una ventana para ingresar los datos correspondientes a la actividad econ\00F3mica y hacer clic en insertar, la ventana se cerrar\00E1 y mostrar\00E1 en la regi\00F3')
||unistr('n central los datos correspondientes a la actividad econ\00F3mica ingresada.<br><br>'),
unistr('<b>2.-</b> Modificar una actividad econ\00F3mica hacer clic en el icono de l\00E1piz, se mostrar\00E1 una ventana con los datos correspondientes a la actividad econ\00F3mica seleccionada, hacer clic en el bot\00F3n Aplicar Cambios la ventana se cerrar\00E1 y mostrar\00E1 en la ')
||unistr('regi\00F3n central los datos de la actividad econ\00F3mica modificados.<br><br>'),
unistr('<b>3.-</b> Eliminar una actividad econ\00F3mica hacer clic en el icono de l\00E1piz,  se mostrar\00E1 una ventana con los datos correspondientes a la actividad econ\00F3mica seleccionada, hacer clic en el bot\00F3n Eliminar, se mostrar\00E1 un mensaje de confirmaci\00F3n y al a')
||unistr('ceptar la ventana se cierra y la actividad econ\00F3mica ser\00E1 eliminada del sistema.<br><br>'),
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
' </i><br><br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2750363660086827)
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
 p_id=>wwv_flow_api.id(99024153419508430)
,p_plug_name=>unistr('Clases de Actividades Econ\00F3micas')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_actvdad_ecnmca_cls,',
'        a.cdgo_actvdad_ecnmca_cls,',
'        a.dscrpcion,',
'        a.trfa,',
'        a.fcha_dsde,',
'        a.fcha_hsta,',
'        b.nmbre_sjto_tpo nmbre_rgmen_tpo,',
'        d.nmbre_indcdor_tpo dscrpcion_indcdor_ecnmco',
'from    df_c_actividades_ecnmca_cls a',
'join    df_i_sujetos_tipo           b on b.id_sjto_tpo      =   a.id_sjto_tpo',
'join    df_s_indicadores_economico  c on c.id_indcdor_ecnmco=   a.id_indcdor_ecnmco',
'right join    df_s_indicadores_tipo       d on d.cdgo_indcdor_tpo =   c.cdgo_indcdor_tpo',
'where   a.cdgo_clnte  =   :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(99024207263508430)
,p_name=>unistr('Clases de actividades econ\00F3micas')
,p_max_row_count=>'1000000'
,p_max_row_count_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('El n\00FAmero m\00E1ximo de filas para este reporte es '),
'#MAX_ROW_COUNT# filas. Por favor comuniquese con el administrador del sistema para corregir la consulta.'))
,p_no_data_found_message=>'No se encontraron registros.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP,84:P84_ID_ACTVDAD_ECNMCA_CLS:#ID_ACTVDAD_ECNMCA_CLS#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AURUETA'
,p_internal_uid=>99024207263508430
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99024531638508443)
,p_db_column_name=>'ID_ACTVDAD_ECNMCA_CLS'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Actvdad Ecnmca Cls'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99025342825508450)
,p_db_column_name=>'CDGO_ACTVDAD_ECNMCA_CLS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99025705083508450)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99026132087508452)
,p_db_column_name=>'TRFA'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Tarifa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'0D000'
,p_help_text=>'vALIDAR ESTE CAMPO EN BD ES NUMBER (4,3).'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99026517684508453)
,p_db_column_name=>'FCHA_DSDE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Fecha Inicial'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99026979596508453)
,p_db_column_name=>'FCHA_HSTA'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Fecha Final'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98743312919493605)
,p_db_column_name=>'NMBRE_RGMEN_TPO'
,p_display_order=>17
,p_column_identifier=>'J'
,p_column_label=>unistr('Tipo R\00E9gimen')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98743442156493606)
,p_db_column_name=>'DSCRPCION_INDCDOR_ECNMCO'
,p_display_order=>27
,p_column_identifier=>'K'
,p_column_label=>unistr('Indicador <br> Econ\00F3mico')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(99040166448593306)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'990402'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_ACTVDAD_ECNMCA_CLS:CDGO_ACTVDAD_ECNMCA_CLS:DSCRPCION:TRFA:FCHA_DSDE:FCHA_HSTA:NMBRE_RGMEN_TPO:DSCRPCION_INDCDOR_ECNMCO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98811567971635822)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2750363660086827)
,p_button_name=>'BTN_NUEVA_CLASE_ACTIVIDAD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Clase'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP,84::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98811610190635823)
,p_name=>'Al cerrar dialogo'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98811722576635824)
,p_event_id=>wwv_flow_api.id(98811610190635823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(99024153419508430)
,p_stop_execution_on_error=>'Y'
);
end;
/
