prompt --application/pages/page_00035
begin
wwv_flow_api.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Informe de Recados Asobancaria'
,p_step_title=>'Informe de Recados Asobancaria'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>' ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210531161735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68546511917156222)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87477568285970968)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'Funcionalidad que permite Generar un informe de recaudos por mes.',
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'</i>',
'',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68546476052156221)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(68546511917156222)
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
 p_id=>wwv_flow_api.id(22417416031380308)
,p_branch_action=>'f?p=&APP_ID.:35:&SESSION.:imprimir:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(68546476052156221)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22417308761380307)
,p_name=>'P35_MES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(68546511917156222)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22417615971380310)
,p_name=>'P35_VGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(68546511917156222)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22417770272380311)
,p_name=>'P35_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(68546511917156222)
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
,p_field_template=>wwv_flow_api.id(35793844568290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25773720291569201)
,p_name=>'P35_FCHA_IN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(68546511917156222)
,p_item_default=>'01/01/2020'
,p_prompt=>'Fecha Desde'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25773890769569202)
,p_name=>'P35_FCHA_FIN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(68546511917156222)
,p_prompt=>'Fecha Hasta'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794115166290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P35_FCHA_IN.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25773900017569203)
,p_name=>'Al cambiar fecha Inicial'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_FCHA_IN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25774008878569204)
,p_event_id=>wwv_flow_api.id(25773900017569203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P35_FCHA_FIN'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P35_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P35_FCHA_IN").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22417590465380309)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_num_fla number := 6;',
'    v_num_col number := 0;',
'    v_bfile         bfile;',
'    o_file_blob     blob;',
'    v_directorio    clob;',
'    v_file_name     varchar2(3000);',
'    v_file_blob     blob;',
'    v_nmbre_clnte   varchar2(1000); ',
'    v_slgan         varchar2(1000); ',
'    v_nit           varchar2(1000);     ',
'begin',
'     select upper(nmbre_clnte)',
'          , nmro_idntfccion',
'          , upper(slgan)          ',
'       into v_nmbre_clnte ',
'          , v_nit',
'          , v_slgan',
'       from df_s_clientes',
'      where cdgo_clnte = :F_CDGO_CLNTE;',
'     ',
'     o_file_blob     :=  empty_blob();',
'     v_directorio := ''COPIAS'';',
'     v_file_name := ''Temp_.xlsx'';',
'     ',
'       --se crea un hoja       ',
'       as_xlsx.new_sheet(''Recaudos'');',
'       --combinamos celdas',
'       as_xlsx.set_autofilter( 1,16, p_row_start => 6, p_row_end => 6 ); --Filtro',
'       as_xlsx.mergecells( 2, 1, 6, 1 );--Cliente',
'       as_xlsx.mergecells( 2, 2, 6, 2 );--Slogan',
'       as_xlsx.mergecells( 2, 4, 4, 4 );--fecha in',
'       as_xlsx.mergecells( 5, 4, 6, 4 );--fecha fin',
'       as_xlsx.mergecells( 2, 3, 6, 3 );--Nit',
'       --estilos de encabezado',
'       as_xlsx.cell( 2, 4 , ''Fecha Desde: ''||:P35_FCHA_IN, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                         , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'       as_xlsx.cell( 5, 4 , ''Fecha Hasta: ''||:P35_FCHA_FIN, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                        , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));                                          ',
'       ',
'       as_xlsx.cell( 2, 1 , v_nmbre_clnte, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                         , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'       ',
'       as_xlsx.cell( 2, 2 , v_slgan, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                         , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'       ',
'       as_xlsx.cell( 2, 3 , ''Nit. ''||v_nit, p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'' )',
'                                         , p_fontId => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 12));',
'       ',
'       ',
'        as_xlsx.set_row( p_row       => 6,',
'                         p_alignment => as_xlsx.get_alignment( p_horizontal => ''center'', p_vertical => ''center''),',
'                         p_fontId    => as_xlsx.get_font( ''Calibri'', p_bold => true, p_fontsize => 11)',
'                        );    ',
'        --Nombre de las columnas',
'        as_xlsx.cell( 1, v_num_fla , ''NUMERO DE DOCUMENTO'');',
'        as_xlsx.cell( 2, v_num_fla , ''FECHA DE RECAUDO'');',
'        as_xlsx.cell( 3, v_num_fla , ''MES'');',
'        as_xlsx.cell( 4, v_num_fla , ''VALOR RECAUDO'');',
'        as_xlsx.cell( 5, v_num_fla , ''ESTADO DEL RECAUDO'');',
'        as_xlsx.cell( 6, v_num_fla , ''IMPUESTO'');',
unistr('        as_xlsx.cell( 7, v_num_fla , ''IDENTIFICACI\00D3N'');'),
'        as_xlsx.cell( 8, v_num_fla , ''BANCO'');',
'        as_xlsx.cell( 9, v_num_fla , ''CUENTA'');',
unistr('        as_xlsx.cell( 10, v_num_fla , ''OBSERVACI\00D3N'');'),
'        as_xlsx.cell( 11, v_num_fla , ''NOMBRE DE ARCHIVO'');',
'        as_xlsx.cell( 12, v_num_fla , ''NUMERO DE CONTROL'');        ',
'        as_xlsx.cell( 13, v_num_fla , ''NUMERO DE RECAUDO'');',
'        as_xlsx.cell( 14, v_num_fla , ''NUMERO DE ARCHIVO'');',
'        as_xlsx.cell( 15, v_num_fla , ''TIPO DE RECAUDO'');',
'        as_xlsx.cell( 16, v_num_fla , ''ORIGEN DEL DOCUMENTO'');',
'        --Ancho de las columnas           ',
'        as_xlsx.set_column_width ( p_col => 1, p_width => 25);--NUMERO DE DOCUMENTO',
'        as_xlsx.set_column_width ( p_col => 2, p_width => 18);--FECHA DE RECAUDO',
'        as_xlsx.set_column_width ( p_col => 3, p_width => 5);--MES',
'        as_xlsx.set_column_width ( p_col => 4, p_width => 16);--VALOR RECAUDO',
'        as_xlsx.set_column_width ( p_col => 5, p_width => 21);--ESTADO DEL RECAUDO',
'        as_xlsx.set_column_width ( p_col => 6, p_width => 35);--IMPUESTO',
unistr('        as_xlsx.set_column_width ( p_col => 7, p_width => 26);--IDENTIFICACI\00D3N'),
'        as_xlsx.set_column_width ( p_col => 8, p_width => 27);--BANCO',
'        as_xlsx.set_column_width ( p_col => 9, p_width => 17);--CUENTA',
unistr('        as_xlsx.set_column_width ( p_col => 10, p_width => 90);--OBSERVACI\00D3'),
'        as_xlsx.set_column_width ( p_col => 11, p_width => 54);--NOMBRE DE ARCHIVO',
'        as_xlsx.set_column_width ( p_col => 12, p_width => 20);--NUMERO DE CONTROL',
'        as_xlsx.set_column_width ( p_col => 13, p_width => 20);--NUMERO DE RECAUDO',
'        as_xlsx.set_column_width ( p_col => 14, p_width => 20);--NUMERO DE ARCHIVO',
'        as_xlsx.set_column_width ( p_col => 15, p_width =>32);--TIPO DE RECAUDO',
'        as_xlsx.set_column_width ( p_col => 16, p_width => 24);--ORIGEN DEL DOCUMENTO',
'    --Cursor ',
'    for c_rcdos in (select to_char(a.NumerodeDocumumento) as NumerodeDocumumento',
'                             , a.FechadeRecaudo      --as "Fecha de Recaudo"',
'                             , a.Mes',
'                             , a.ValorRecaudo        --as "Valor Recaudo"',
'                             , a.EstadodelRecaudo    --as "Estado del Recaudo"',
'                             , a.Impuesto ',
'                             , a.Identificacion',
'                             , a.Banco',
'                             , a.Cuenta',
'                             , a.Observacion',
'                             , a.NombredeArchivo     --as "Nombre de Archivo"',
'                             , a.NumerodeControl     --as "Numero de Control"',
'                             , a.NumerodeRecaudo     --as "Numero de Recaudo"',
'                             , a.NumerodeArchivo     --as "Numero de Archivo"',
'                             , a.TipodeRecaudo       --as "Tipo de Recaudo"',
'                             , a.OrigendelDocumento  --as "Origen del Documento"',
'                          from (',
'                                        select b.id_rcdo_cntrol as NumerodeControl',
'                                             , a.id_rcdo as NumerodeRecaudo',
'                                             , b.id_prcso_crga as NumerodeArchivo',
'                                             , b.file_name as NombredeArchivo',
'                                             , b.dscrpcion_orgen as TipodeRecaudo',
'                                             , a.dscrpcion_rcdo_orgn_tpo as OrigendelDocumento',
'                                             , a.nmro_dcmnto as NumerodeDocumumento',
'                                             , a.vlor as ValorRecaudo',
'                                             , to_char( a.fcha_rcdo , ''DD/MM/YYYY'' ) as FechadeRecaudo',
'                                             , a.obsrvcion as Observacion',
'                                             , a.idntfccion_sjto as Identificacion',
'                                             , c.nmbre_impsto as Impuesto',
'                                             , b.dscrpcion_bnco as Banco',
'                                             , b.nmro_cnta as Cuenta',
'                                             , a.dscrpcion_rcdo_estdo as EstadodelRecaudo',
'                                             , to_char( a.fcha_rcdo , ''MM'' ) as Mes',
'                                             , to_char( a.fcha_apliccion , ''DD/MM/YYYY'' ) as FechadeAplicacion',
'                                        from v_re_g_recaudos a',
'                                        join v_re_g_recaudos_control b',
'                                          on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                                        join v_si_i_sujetos_impuesto c',
'                                          on a.id_sjto_impsto = c.id_sjto_impsto',
'                                        where a.cdgo_clnte = :F_CDGO_CLNTE',
'                                          and cdgo_rcdo_estdo in ( ''AP'' , ''RG'' )',
'                                          and c.id_impsto                   = nvl(:P35_IMPSTO,c.id_impsto)',
'                                          --and to_char(fcha_rcdo,''YYYY'')     = :P35_VGNCIA',
'                                           and trunc( a.fcha_rcdo ) between :P35_FCHA_IN AND :P35_FCHA_FIN--to_number(:mes)',
'                                         union all    ',
'                                            select null as NumerodeContro',
'                                                 , null as NumerodeRecaudo',
'                                                 , a.id_prcso_crga as NumerodeArchivo',
'                                                 , a.file_name as NombredeArchivo',
'                                                 , ''RECAUDO ARCHIVO ASOBANCARIA'' as TipodeRecaudo',
'                                                 , ''DESCONOCIDO'' as OrigendelDocumento',
'                                                 , b.nmro_dcmnto as NumerodeDocumumento',
'                                                 , b.vlor_rcdo as ValorRecaudo',
'                                                 , to_char( b.fcha_rcdo , ''DD/MM/YYYY'' ) as FechadeRecaudo',
'                                                 , b.mnsje_rspsta as Observacion   ',
'                                                 , ''NO IDENTIFICA'' as Identificacion',
'                                                 , null as Impuesto',
'                                                 , c.nmbre_bnco as Banco',
'                                                 , d.nmro_cnta as Cuenta',
'                                                 , ''No Identificado'' as EstadodelRecaudo',
'                                                 , to_char( b.fcha_rcdo , ''MM'' ) as Mes',
'                                                 , null  as Fechadeplicacion',
'                                              from et_g_procesos_carga a',
'                                             join table ( pkg_re_recaudos.fnc_co_datos_asobancaria( p_id_prcso_crga     => a.id_prcso_crga ',
'                                                                                                  , p_cdgo_tpo_asbncria => ''AS2001'' )) b',
'                                               on a.id_prcso_crga = b.id_prcso_crga',
'                                             join df_c_bancos c',
'                                               on b.id_bnco = c.id_bnco',
'                                             join df_c_bancos_cuenta d',
'                                               on b.id_bnco_cnta = d.id_bnco_cnta',
'                                            where a.cdgo_clnte = :F_CDGO_CLNTE',
'                                              and a.id_prcso_crga in (',
'                                                                           select id_prcso_crga --id_rcdo_asbncria ',
'                                                                             from re_g_recaudos_asobancaria',
'                                                                            where tpo_rgstro = ''06''',
'                                                                              and mnsje_rspsta <> ''Procesado''',
'                                                                              and not mnsje_rspsta like ''%pagado%''',
'                                                                     )',
'                                              and b.id_rcdo_asbncria in (',
'                                                                           select id_rcdo_asbncria ',
'                                                                             from re_g_recaudos_asobancaria',
'                                                                            where tpo_rgstro = ''06''',
'                                                                              and mnsje_rspsta <> ''Procesado''',
'                                                                              and not mnsje_rspsta like ''%pagado%''',
'                                                                        )',
'                                              and not b.nmro_dcmnto in (',
'                                                                          select nmro_dcmnto',
'                                                                            from v_re_g_recaudos',
'                                                                           where cdgo_rcdo_estdo in (''RG'' , ''AP'')',
'                                                                             and cdgo_rcdo_orgn_tpo = ''DC''',
'                                                                             and id_rcdo_cntrol in (',
'                                                                                                         select id_rcdo_cntrol',
'                                                                                                           from re_g_recaudos_control',
'                                                                                                          where cdgo_rcdo_orgen = ''MN''',
'                                                                                                    )',
'                                                                       )',
'                                            -- and to_char(fcha_rcdo,''YYYY'')     = :P35_VGNCIA',
'                                             and trunc( b.fcha_rcdo ) between :P35_FCHA_IN AND :P35_FCHA_FIN---to_number(:mes) ',
'                             ) a',
'                        order by  a.Mes',
'                               , a.FechadeRecaudo',
'                               , a.NumerodeDocumumento)',
'    loop     ',
'        v_num_fla :=  v_num_fla + 1;                ',
'        as_xlsx.cell( 1, v_num_fla , c_rcdos.NumerodeDocumumento);--,p_borderId => as_xlsx.get_border(''medium'', ''medium'', ''thin'', ''thin''));        ',
'        as_xlsx.cell( 2, v_num_fla , c_rcdos.FechadeRecaudo);    ',
'        as_xlsx.cell( 3, v_num_fla , c_rcdos.Mes);    ',
'        as_xlsx.cell( 4, v_num_fla , c_rcdos.ValorRecaudo);  --FM$999G999G999G999G999G999G990  ',
'        as_xlsx.cell( 5, v_num_fla , c_rcdos.EstadodelRecaudo);    ',
'        as_xlsx.cell( 6, v_num_fla , c_rcdos.Impuesto);    ',
'        as_xlsx.cell( 7, v_num_fla , c_rcdos.Identificacion);    ',
'        as_xlsx.cell( 8, v_num_fla , c_rcdos.Banco);    ',
'        as_xlsx.cell( 9, v_num_fla , c_rcdos.Cuenta);    ',
'        as_xlsx.cell( 10, v_num_fla , c_rcdos.Observacion);    ',
'        as_xlsx.cell( 11, v_num_fla , c_rcdos.NombredeArchivo);    ',
'        as_xlsx.cell( 12, v_num_fla , c_rcdos.NumerodeControl);    ',
'        as_xlsx.cell( 13, v_num_fla , c_rcdos.NumerodeRecaudo);    ',
'        as_xlsx.cell( 14, v_num_fla , c_rcdos.NumerodeArchivo);    ',
'        as_xlsx.cell( 15, v_num_fla , c_rcdos.TipodeRecaudo);    ',
'        as_xlsx.cell( 16, v_num_fla , c_rcdos.OrigendelDocumento);            ',
'    end loop;',
'     as_xlsx.save( v_directorio, v_file_name );     ',
'     ',
'     v_bfile := bfilename( v_directorio, v_file_name);',
'--------------------------------------------------------------------------------------',
'        dbms_lob.open(v_bfile, dbms_lob.lob_readonly);',
'        dbms_lob.createtemporary(',
'            lob_loc => o_file_blob, ',
'            cache   => true, ',
'            dur     => dbms_lob.session',
'        );',
'        -- Open temporary lob',
'        dbms_lob.open(o_file_blob, dbms_lob.lob_readwrite);',
'',
'        -- Load binary file into temporary LOB',
'        dbms_lob.loadfromfile(',
'            dest_lob => o_file_blob,',
'            src_lob  => v_bfile,',
'            amount   => dbms_lob.getlength(v_bfile)',
'        );',
'',
'        -- Close lob objects',
'        dbms_lob.close(o_file_blob);',
'        dbms_lob.close(v_bfile);',
'',
'        utl_file.fremove(v_directorio,v_file_name);',
'        ',
'        owa_util.mime_header(  ',
'            ''application/ms-excel'',  ',
'            false  ',
'         );',
'    ',
'    htp.p(''Content-length: '' ||sys.dbms_lob.getlength(o_file_blob) );  ',
'    htp.p(''Content-Disposition: attachment; filename="Recaudos.xlsx"'');  ',
'    htp.p(''Cache-Control: max-age=0'');',
'    owa_util.http_header_close;  ',
'    wpg_docload.download_file(o_file_blob);  ',
'    apex_application.stop_apex_engine;',
' exception',
'        when others then',
'            raise_application_error(-20000,''Problemas al generar excel, ''||sqlerrm);',
'    ',
'end;        '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(68546476052156221)
,p_process_when=>'imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
