prompt --application/pages/page_00055
begin
wwv_flow_api.create_page(
 p_id=>55
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>unistr('Bolet\00EDn de Deudores Morosos ')
,p_step_title=>unistr('Bolet\00EDn de Deudores Morosos ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20240702121746'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75425085631794645)
,p_plug_name=>unistr('Par\00E1metros ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(225404434423454158)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<br>',
'Funcionalidad que permite generar un Informe en Excel de deudores Morosos por Tributo a una fecha de corte.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75425542408794650)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(75425085631794645)
,p_button_name=>'Btn_imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(75831861920842505)
,p_branch_action=>'f?p=&APP_ID.:55:&SESSION.:imprimir:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(75425542408794650)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75425185700794646)
,p_name=>'P55_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(75425085631794645)
,p_prompt=>'Tributo'
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
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75425296896794647)
,p_name=>'P55_FECHA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(75425085631794645)
,p_prompt=>'Fecha Corte'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'ondblclick="this.value=''''"  onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75425355540794648)
,p_name=>'P55_ID_RPRTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(75425085631794645)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rprte as d',
'     , id_rprte    as r',
'  from gn_d_reportes',
' where cdgo_rprte_grpo = ''BME'' '))
,p_lov_display_null=>'YES'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(75831481254842501)
,p_name=>'Al seleccionar reporte'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_ID_RPRTE'
,p_condition_element=>'P55_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75831530027842502)
,p_event_id=>wwv_flow_api.id(75831481254842501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(75425542408794650)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(75831678589842503)
,p_event_id=>wwv_flow_api.id(75831481254842501)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(75425542408794650)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75837321904849104)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'    v_object json_object_t := json_object_t();  ',
'    v_json                 clob;  ',
'begin    ',
'    select nmbre_rprte',
'      into v_nmbre_rprte',
'      from gn_d_reportes',
'     where id_rprte = :P55_ID_RPRTE;',
'     ',
'',
'   v_object.put(''nmbre_rprte'', v_nmbre_rprte); ',
'   v_object.put(''fcha'', :P55_FECHA);',
'   v_object.put(''id_impsto'', :P55_ID_IMPSTO);',
'   ',
'   v_json := v_object.to_clob();  ',
'   apex_session.attach ( p_app_id => 66000, p_page_id => 37, p_session_id => :APP_SESSION );  ',
'   apex_util.set_session_state(''P37_JSON'', v_json);      ',
'   apex_util.set_session_state(''P37_ID_RPRTE'', :P55_ID_RPRTE);      ',
' ',
'exception',
'    when no_data_found then',
'         null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(75831756350842504)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Informe'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_num_fla number := 9;',
'    v_num_col number := 1;',
'    v_bfile         bfile;',
'    o_file_blob     blob;',
'    v_directorio    clob;',
'    v_file_name     varchar2(3000);',
'    v_file_blob     blob;',
'    v_nmbre_clnte   varchar2(1000); ',
'    v_slgan         varchar2(1000); ',
'    v_nit           varchar2(1000);  ',
'    v_var           number;',
'    --Parametros',
'    --p_cdgo_clnte      number := 6;',
'    --p_fcha            date   := ''01/07/2017'';',
'    --p_id_impsto       number := 16;',
'    ',
'begin ',
'    as_xlsx.clear_workbook;',
'    --Datos del Cliente',
'    select upper(nmbre_clnte)',
'          , nmro_idntfccion',
'          , upper(slgan)          ',
'       into v_nmbre_clnte  ',
'          , v_nit',
'          , v_slgan',
'       from df_s_clientes',
'      where cdgo_clnte = :F_CDGO_CLNTE;',
'      ',
'    o_file_blob     :=  empty_blob();',
'    v_directorio    := ''COPIAS'';',
'    v_file_name     := ''AAInforme_Morosos.xlsx'';',
'    ',
'   ',
'    v_num_fla := 13;',
'    --INICIO HOJA DATOS FISCALIZACION',
'    --se crea una hoja       ',
'    as_xlsx.new_sheet(''BDME'');',
'',
'    --combinamos celdas',
'    --datos basicos del cliente',
'    --as_xlsx.set_autofilter( 1,16, p_row_start => 6, p_row_end => 6 ); --Filtro',
'    as_xlsx.mergecells( 1, 1, 8, 1 );--Cliente',
'    as_xlsx.mergecells( 1, 2, 8, 2 );--Slogan',
'    as_xlsx.mergecells( 1, 3, 8, 3 );--Nit',
'    as_xlsx.mergecells( 1, 4, 8, 4 );--Nombre reporte',
'    as_xlsx.mergecells( 1, 5, 8, 5 );--Fecha Corte',
'    --Datos extra',
'    as_xlsx.mergecells( 1, 8, 3, 8 );--Codigo Entidad Publica',
'    as_xlsx.mergecells( 1, 9, 3, 9 );--Periodo Reporte',
unistr('    as_xlsx.mergecells( 1, 10, 3, 10 );--A\00F1o'),
'    as_xlsx.mergecells(6, 7, 6, 11 );--Nota',
'',
'    -- estilos encabezado tabla',
'    as_xlsx.set_row( p_row       => v_num_fla,',
'                     p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center''),',
'                     p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => true, p_fontsize => 9,p_rgb => ''FFFFFFFF''),',
'                     p_fillId    => as_xlsx.get_fill( ''solid'', ''3638BF'' ),',
'                     p_borderId  => as_xlsx.get_border()',
'                    );',
'    --Bordes                    ',
'    as_xlsx.cell( 2, 8, '''', p_borderId => as_xlsx.get_border());                    ',
'    as_xlsx.cell( 3, 8, '''', p_borderId => as_xlsx.get_border());     ',
'    as_xlsx.cell( 4, 8, '''', p_borderId => as_xlsx.get_border());',
'    as_xlsx.cell( 2, 9, '''', p_borderId => as_xlsx.get_border());                    ',
'    as_xlsx.cell( 3, 9, '''', p_borderId => as_xlsx.get_border()); ',
'    as_xlsx.cell( 4, 9, '''', p_borderId => as_xlsx.get_border()); ',
'    as_xlsx.cell( 2, 10,'''', p_borderId => as_xlsx.get_border());                    ',
'    as_xlsx.cell( 3, 10,'''', p_borderId => as_xlsx.get_border()); ',
'    as_xlsx.cell( 4, 10,'''', p_borderId => as_xlsx.get_border()); ',
'    as_xlsx.cell( 6, 8,'''', p_borderId => as_xlsx.get_border()); ',
'    as_xlsx.cell( 6, 9,'''', p_borderId => as_xlsx.get_border()); ',
'    as_xlsx.cell( 6, 10,'''', p_borderId => as_xlsx.get_border()); ',
'    as_xlsx.cell( 6, 11,'''', p_borderId => as_xlsx.get_border()); ',
'   ',
'    --datos cliente',
'    as_xlsx.cell( 1, 1 , v_nmbre_clnte, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center''),',
'                                        p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => true, p_fontsize => 12));',
'                                        ',
'    as_xlsx.cell( 1, 2 , v_slgan, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center''),',
'                                  p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => false, p_fontsize => 10));',
'                                  ',
'    as_xlsx.cell( 1, 3 , ''Nit. ''||v_nit, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center''),',
'                                         p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => false, p_fontsize => 10));',
'                                         ',
unistr('    as_xlsx.cell( 1, 4 , ''BOLET\00CDN DE DEUDORES MOROSOS DEL ESTADO - BDME'', p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center''),'),
'                                                                          p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => true, p_fontsize => 10));',
'                                                                          ',
'    as_xlsx.cell( 1, 5 , ''Fecha de Corte: ''||:P55_FECHA, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center''),',
'                                                     p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => true, p_fontsize => 10));',
'    --Datos Extra',
'    as_xlsx.cell( 1, 8 , ''CODIGO CGN ENTIDAD PUBLICA'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center''),',
'                                                      p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => true, p_fontsize => 9,p_rgb => ''000000''),',
'                                                      p_fillId    => as_xlsx.get_fill( ''solid'', ''E9EC00'' ),',
'                                                      p_borderId  => as_xlsx.get_border());',
'                                                      ',
'    as_xlsx.cell( 1, 9 , ''PERIODO DE REPORTE'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center''),',
'                                              p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => true, p_fontsize => 9,p_rgb => ''000000''),',
'                                              p_fillId    => as_xlsx.get_fill( ''solid'', ''E9EC00'' ),',
'                                              p_borderId  => as_xlsx.get_border());',
'                                              ',
unistr('    as_xlsx.cell( 1, 10 , ''A\00D1O'',p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center''),'),
'                                p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => true, p_fontsize => 9,p_rgb => ''000000''),',
'                                p_fillId    => as_xlsx.get_fill( ''solid'', ''E9EC00'' ),',
'                                p_borderId  => as_xlsx.get_border());',
'                                ',
'    as_xlsx.cell( 6, 7 , ''En caso de dudas en el diligenciamiento de esta Herramienta de captura, POR FAVOR mirar el instructivo respectivo en la pagina www.chip.gov.co'',',
'                p_alignment => as_xlsx.get_alignment(p_horizontal => ''center'', p_vertical => ''center'',p_wrapText => true),',
'                p_borderId  => as_xlsx.get_border(),',
'                p_fillId    => as_xlsx.get_fill( ''solid'', ''82D2E9'' ),',
'                p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => true, p_fontsize => 9,p_rgb => ''000000'')      ',
'                );',
'                ',
'    as_xlsx.cell( 7, 12 , ''Cifras en pesos'',p_fontId    => as_xlsx.get_font( ''Arial'', p_bold => true, p_fontsize =>10 ));',
'    --Encabezado Tabla',
'    as_xlsx.cell( 1, v_num_fla , ''CONCEPTO'',  p_borderId => as_xlsx.get_border());    ',
'    as_xlsx.cell( 2, v_num_fla , ''TIPO DE DEUDOR'',  p_borderId => as_xlsx.get_border());',
unistr('    as_xlsx.cell( 3, v_num_fla , ''N\00DAMERO DE OBLIGACI\00D3N'',  p_borderId => as_xlsx.get_border());'),
unistr('    as_xlsx.cell( 4, v_num_fla , ''N\00DAMERO DE IDENTIFICACI\00D3N'',  p_borderId => as_xlsx.get_border());'),
unistr('    as_xlsx.cell( 5, v_num_fla , ''TIPO DE IDENTIFICACI\00D3N'',  p_borderId => as_xlsx.get_border());'),
unistr('    as_xlsx.cell( 6, v_num_fla , ''NOMBRE Y APELLIDO O RAZ\00D3N SOCIAL'',  p_borderId => as_xlsx.get_border());'),
unistr('    as_xlsx.cell( 7, v_num_fla , ''VALOR DE LA OBLIGACI\00D3N'',  p_borderId => as_xlsx.get_border());'),
'    --as_xlsx.cell( 8, v_num_fla , ''EMAIL'',  p_borderId => as_xlsx.get_border());',
'    as_xlsx.cell( 9, v_num_fla , ''ESTADO DE LA DEUDA'',  p_borderId => as_xlsx.get_border());',
'',
'    --Ancho columnas',
'    as_xlsx.set_column_width ( p_col => 1, p_width => 18);--CONCEPTO',
'    as_xlsx.set_column_width ( p_col => 2, p_width => 18);--TIPO DE DEUDOR',
unistr('    as_xlsx.set_column_width ( p_col => 3, p_width => 26);--N\00DAMERO DE OBLIGACI\00D3N'),
unistr('    as_xlsx.set_column_width ( p_col => 4, p_width => 24);--N\00DAMERO DE IDENTIFICACI\00D3N'),
unistr('    as_xlsx.set_column_width ( p_col => 5, p_width => 38);--TIPO DE IDENTIFICACI\00D3N'),
unistr('    as_xlsx.set_column_width ( p_col => 6, p_width => 100);--NOMBRE Y APELLIDO O RAZ\00D3N SOCIAL'),
unistr('    as_xlsx.set_column_width ( p_col => 7, p_width => 23);--VALOR DE LA OBLIGACI\00D3N'),
'    --as_xlsx.set_column_width ( p_col => 8, p_width => 50);--EMAIL',
'    as_xlsx.set_column_width ( p_col => 9, p_width => 20);--ESTADO DE LA DEUDA',
'    ',
'--condicional para generar predial o ica y que traiga la razon social en el ultimo caso',
'if (:P55_ID_IMPSTO = ''230011'') then',
'for c_dtos in (',
'                    select a.id_sjto_impsto',
'                            , ''DEUDOR PRINCIPAL'' cncpto',
'                            , case when b.cdgo_idntfccion_tpo = ''N'' then',
'                                ''PERSONA NATURAL''',
'                                else',
'                                ''PERSONA JURIDICA''',
'                            end as tpo_ddor',
'                            , b.idntfccion_sjto',
'                            , b.idntfccion_rspnsble',
'                            , b.dscrpcion_idntfccion_tpo',
'                            , b.nmbre_rzon_scial razon',
'                            , sum(a.vlor_sldo_cptal + a.vlor_intres) vlor_ttal',
'                            --, b.email',
'                            , ''SIN LEYENDA'' lynda',
'                         from (',
'                                       select a.id_sjto_impsto',
'                                            , a.vlor_sldo_cptal',
'                                            , a.vlor_intres',
'                                         from v_gf_g_cartera_x_concepto a',
'                                        where cdgo_clnte                = :F_CDGO_CLNTE',
'                                          and id_impsto                 = nvl(:P55_ID_IMPSTO,id_impsto)',
'                                          and trunc(a.fcha_vncmnto)    <= nvl(:P55_FECHA, trunc(a.fcha_vncmnto))',
'                                          and a.CDGO_MVNT_FNCRO_ESTDO   != ''AN''                                 ',
'                             having ((a.vlor_sldo_cptal + a.vlor_intres)) > 0 --- Valor de 5 SMMLV',
'        group by  a.id_sjto_impsto, a.vlor_sldo_cptal, a.vlor_intres',
'                                ) a',
'                        join v_si_i_sujetos_responsable     b on a.id_sjto_impsto = b.id_sjto_impsto',
'                         and b.prncpal_s_n                  = ''S''',
'    ---Cambia Carlos, agregando condicion para que NO tenga convenio APL',
'    and not exists (select 1 ',
'                    from genesys.gf_g_convenios f ',
'                    where f.id_sjto_impsto = a.id_sjto_impsto',
'                    and f.CDGO_CNVNIO_ESTDO = ''APL''',
'                    )',
'                            ---and b.cdgo_tpo_rspnsble = ''L''',
'                     group by a.id_sjto_impsto',
'                            , b.cdgo_idntfccion_tpo',
'                            , b.idntfccion_sjto',
'                            , b.idntfccion_rspnsble',
'                            , b.dscrpcion_idntfccion_tpo',
'                            , b.nmbre_rzon_scial',
'                            --, b.email',
'                     order by a.id_sjto_impsto',
'               )',
'               loop ',
'        v_num_fla := v_num_fla + 1;',
'        as_xlsx.cell( 1, v_num_fla , c_dtos.cncpto, p_borderId => as_xlsx.get_border());    ',
'        as_xlsx.cell( 2, v_num_fla , c_dtos.tpo_ddor, p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 3, v_num_fla , c_dtos.idntfccion_sjto, p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 4, v_num_fla , c_dtos.idntfccion_rspnsble,  p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 5, v_num_fla , c_dtos.dscrpcion_idntfccion_tpo,  p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 6, v_num_fla , c_dtos.razon,  p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 7, v_num_fla , c_dtos.vlor_ttal,  p_borderId => as_xlsx.get_border());',
'        --as_xlsx.cell( 8, v_num_fla , c_dtos.email,  p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 9, v_num_fla , c_dtos.lynda,  p_borderId => as_xlsx.get_border());',
'    end loop;',
'else ',
'for c_dtos in (',
'                   select a.id_sjto_impsto,',
'       ''DEUDOR PRINCIPAL'' cncpto,',
'       case',
'         when b.cdgo_idntfccion_tpo = ''N'' then',
'          ''PERSONA JURIDICA''',
'         else',
'          ''PERSONA NATURAL''',
'       end as tpo_ddor,',
'       b.idntfccion_sjto,',
'       b.idntfccion_rspnsble,',
'      -- r.dscrpcion_idntfccion_tpo,',
'       (select x.DSCRPCION_IDNTFCCION_TPO from v_si_i_sujetos_responsable x where x.id_sjto_impsto = a.id_sjto_impsto and x.prncpal_s_n = ''S'' and rownum =1) as dscrpcion_idntfccion_tpo,',
'       --r.nmbre_trcro razon,',
'    --   (select x.NMBRE_RZON_SCIAL from v_si_i_sujetos_responsable x where x.id_sjto_impsto = a.id_sjto_impsto and x.prncpal_s_n = ''S'' and rownum =1) razon,',
'    ---Carlos cambio razon de responsable a razon de persona',
'      (select x.NMBRE_RZON_SCIAL from v_si_i_sujetos_responsable x where x.id_sjto_impsto = a.id_sjto_impsto AND x.prncpal_s_n = ''S'' and rownum =1) razon,',
'       sum(a.vlor_sldo_cptal + a.vlor_intres) vlor_ttal,',
'       --b.email,',
'       ''SIN LEYENDA'' lynda',
'  from (select a.id_sjto_impsto, a.vlor_sldo_cptal, a.vlor_intres',
'            from v_gf_g_cartera_x_concepto a',
'                                        where cdgo_clnte                = :F_CDGO_CLNTE',
'                                          and id_impsto                 = nvl(:P55_ID_IMPSTO,id_impsto)',
'                                          and trunc(a.fcha_vncmnto)    <= nvl(:P55_FECHA, trunc(a.fcha_vncmnto))',
'      and   (a.vlor_sldo_cptal + a.vlor_intres) > 0 --- Valor de 5 SMMLV',
'        group by  a.id_sjto_impsto, a.vlor_sldo_cptal, a.vlor_intres',
'                                ) a',
'  left join v_si_i_sujetos_responsable b',
'    on a.id_sjto_impsto = b.id_sjto_impsto',
'  join v_SI_I_SUJETOS_IMPUESTO s',
'    on s.id_sjto_impsto = b.id_sjto_impsto',
'  /*join v_si_c_terceros r',
'    on r.idntfccion = s.idntfccion_sjto */',
'  join GENESYS.si_i_sujetos_responsable z ',
'    on z.id_sjto_rspnsble = b.id_sjto_rspnsble',
'   -- and r.id_trcro = (select x.id_trcro from GENESYS.si_i_sujetos_responsable x where x.ID_TRCRO = z.id_trcro and rownum =1)',
'    --and b.cdgo_tpo_rspnsble = ''L''',
'    and b.prncpal_s_n = ''S''',
'    ',
'    --PARTE NUEVA--27/07/2023',
'    ',
'    where ',
'      ',
'    --   r.id_trcro in (select x.id_trcro from GENESYS.si_c_terceros x where x.idntfccion = r.idntfccion and rownum = 1',
'      -- and x.id_trcro in (select max(y.id_trcro)from GENESYS.si_c_terceros y where y.idntfccion = x.idntfccion and rownum  = 1))',
'        -- s.idntfccion_sjto != ''0'' and',
'      ',
'   -----Cambio de Carlos, agrga condicion de que No tenga convenio APL ',
'     not exists (select 1 ',
'                    from genesys.gf_g_convenios f ',
'                    where f.id_sjto_impsto = a.id_sjto_impsto',
'                    and f.CDGO_CNVNIO_ESTDO = ''APL''',
'                    )',
'    ',
'    ',
'    --PARTE NUEVA--27/07/2023',
'    ',
'    ',
'    ',
'    ',
'    ',
'',
' group by a.id_sjto_impsto,',
'          b.cdgo_idntfccion_tpo,',
'          b.idntfccion_sjto,',
'          b.idntfccion_rspnsble,',
'          b.dscrpcion_idntfccion_tpo,',
'          b.nmbre_rzon_scial',
'         -- r.nmbre_trcro,',
'          --b.email',
' order by a.id_sjto_impsto',
'               )',
'',
'    loop ',
'        v_num_fla := v_num_fla + 1;',
'        as_xlsx.cell( 1, v_num_fla , c_dtos.cncpto, p_borderId => as_xlsx.get_border());    ',
'        as_xlsx.cell( 2, v_num_fla , c_dtos.tpo_ddor, p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 3, v_num_fla , c_dtos.idntfccion_sjto, p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 4, v_num_fla , c_dtos.idntfccion_sjto,  p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 5, v_num_fla , c_dtos.dscrpcion_idntfccion_tpo,  p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 6, v_num_fla , c_dtos.razon,  p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 7, v_num_fla , c_dtos.vlor_ttal,  p_borderId => as_xlsx.get_border());',
'        --as_xlsx.cell( 8, v_num_fla , c_dtos.email,  p_borderId => as_xlsx.get_border());',
'        as_xlsx.cell( 9, v_num_fla , c_dtos.lynda,  p_borderId => as_xlsx.get_border());',
'    end loop;',
'end if;',
'    --------------------------------------------------------------------------------------   ',
'    --GENERACION DEL EXCEL ',
'    as_xlsx.save( v_directorio, v_file_name );     ',
'',
'    v_bfile := bfilename( v_directorio, v_file_name);',
'',
'    dbms_lob.open(v_bfile, dbms_lob.lob_readonly);',
'    dbms_lob.createtemporary(',
'        lob_loc => o_file_blob, ',
'        cache   => true, ',
'        dur     => dbms_lob.session',
'    );',
'    -- Open temporary lob',
'    dbms_lob.open(o_file_blob, dbms_lob.lob_readwrite);',
'',
'    -- Load binary file into temporary LOB',
'    dbms_lob.loadfromfile(',
'    dest_lob => o_file_blob,',
'    src_lob  => v_bfile,',
'    amount   => dbms_lob.getlength(v_bfile)',
'    );',
'',
'    -- Close lob objects',
'    dbms_lob.close(o_file_blob);',
'    dbms_lob.close(v_bfile);  ',
'    utl_file.fremove(v_directorio,v_file_name);',
'        ',
'        owa_util.mime_header(  ',
'            ''application/ms-excel'',  ',
'            false  ',
'         );',
'    ',
'    htp.p(''Content-length: '' ||sys.dbms_lob.getlength(o_file_blob) );  ',
unistr('    htp.p(''Content-Disposition: attachment; filename="BOLET\00CDN DE DEUDORES MOROSOS.xlsx"'');  '),
'    htp.p(''Cache-Control: max-age=0'');',
'    owa_util.http_header_close;  ',
'    wpg_docload.download_file(o_file_blob);  ',
'    apex_application.stop_apex_engine;',
'    ',
'    exception',
'        when others then',
'        RAISE_APPLICATION_ERROR(-20000,''Error al generar el informe. ''||sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'imprimir'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
