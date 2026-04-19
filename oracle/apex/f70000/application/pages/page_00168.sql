prompt --application/pages/page_00168
begin
wwv_flow_api.create_page(
 p_id=>168
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Gesti\00F3n Solicitud de Productos ')
,p_step_title=>unistr('Gesti\00F3n Solicitud de Productos ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function validarCantidadAprobada() {',
'',
unistr('    //Obtenemos el modelo de la regi\00F3n del InteractiveGrid de Liquidaci\00F3n'),
'    var Dtlle_slctud = apex.region("dtlle_slctud").widget().interactiveGrid("getViews", "grid").model;',
'    var ttal_aprbda = 0;',
'    var ttal_slctda = 0;',
'    var cont1 = 0;',
'    var cont2 = 0;',
'',
'    //Recorrido del InteractiveGrid',
'    Dtlle_slctud.forEach(function(detalle) {',
'        ttal_aprbda = ttal_aprbda + Number(detalle[Dtlle_slctud.getFieldKey("CNTDAD_APRBDA")]);',
'        ttal_slctda = ttal_slctda + Number(detalle[Dtlle_slctud.getFieldKey("CNTDAD_SLCTDA")]);',
'',
'        // Si la cantidad aprobada es mayor que la solicitada',
'        if (Number(detalle[Dtlle_slctud.getFieldKey("CNTDAD_APRBDA")]) > Number(detalle[Dtlle_slctud.getFieldKey("CNTDAD_SLCTDA")])) {',
'',
'            cont1 = cont1 + 1;',
'',
'            // Si la cantidad aprobada es mayor que el Stock    ',
'        } else if (Number(detalle[Dtlle_slctud.getFieldKey("CNTDAD_APRBDA")]) > (Number(detalle[Dtlle_slctud.getFieldKey("CNTDAD_ACTAL")]) - Number(detalle[Dtlle_slctud.getFieldKey("CNTDAD_RSRVDA")]))) {',
'',
'            // Si la cantidad aprobada es mayor que 0',
'            if (Number(detalle[Dtlle_slctud.getFieldKey("CNTDAD_APRBDA")]) > 0) {',
'',
'                cont2 = cont2 + 1;',
'',
'            }',
'',
'        };',
'',
'    });// Fin Recorrido del InteractiveGrid',
'    ',
'',
'    console.log(''Total aprobado: '' + ttal_aprbda);',
'',
'    // Si encontro cantidad aprobada mayor que la solicitada',
'    if (cont1 != 0) {',
'',
'        //Se muestra Alerta ',
'        Swal.fire({',
'            title: ''<H2 >Alerta</H2>'',',
'            html: `<h4>La cantidad aprobada no puede ser mayor que la solicitada.</h4>`',
'        });',
'',
'        console.log(''La cantidad aprobada no puede ser mayor que la solicitada'');',
'',
'        // Si encontro cantidad aprobada mayor que el stock     ',
'    } else if (cont2 != 0) {',
'',
'        // Se Muestra Atlerta',
'        Swal.fire({',
'            title: ''<H2 >Alerta</H2>'',',
'            html: `<h4>La cantidad aprobada no puede ser mayor que la cantidad en Stock.</h4>`',
'        });',
'',
'        console.log(''La cantidad aprobada no puede ser mayor que la cantidad en Stock'');',
'',
'        // Si el total aprobado es igual a 0 ',
'    } else if (ttal_aprbda == 0) {',
'',
'        //Se muestra alerta ',
'        Swal.fire({',
'            title: ''<H2 >Alerta</H2>'',',
'            html: `<h4>No es posible aprobar una solicitud con cantidad de productos 0.</h4>`',
'        });',
'',
'        console.log(''no es posible aprobar una solicitud con cantidad de productos 0'');',
'',
'        // Si la cantidad aprobada es menor que la solicitada se agregar observacion  y aprueba la solicitud',
'    } else if (ttal_aprbda < ttal_slctda) {',
'',
unistr('        console.log(''Menor Agregar Observaci\00F3n para aprobar solicitud'');'),
'        apex.submit(''Aprobar_solicitud'');',
'',
'        // Si no se aprueba la solicitud',
'    } else {',
'',
unistr('        apex.message.confirm("\00BFEst\00E1 seguro de aprobar la solicitud?", function(okPressed) {'),
'            if (okPressed) {',
'                console.log(''se aprueba solicitud'');',
'                apex.submit(''Btn_aprobar_solicitud'');',
'            }',
'        });',
'',
'    }',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210409181524'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95919463784512603)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95954930429150805)
,p_plug_name=>unistr('Informaci\00F3n  del Sujeto Tributo ')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P168_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96155562557215001)
,p_plug_name=>'Opciones '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
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
 p_id=>wwv_flow_api.id(96161619824222903)
,p_plug_name=>'Solicitud'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96027682251877301)
,p_plug_name=>unistr('Tab Gesti\00F3n solicitud')
,p_parent_plug_id=>wwv_flow_api.id(96161619824222903)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple:t-TabsRegion-mod--large'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95954622412150802)
,p_plug_name=>'Resoluciones '
,p_parent_plug_id=>wwv_flow_api.id(96027682251877301)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_rslcion,',
'        a.file_name,',
'       -- a.file_blob,',
'       a.nmro_rslcion,',
'       a.fcha_incial,',
'       a.fcha_fnal,',
'       case when trunc(sysdate) >= trunc(a.fcha_incial) and trunc(sysdate) <= trunc(a.fcha_fnal) then',
'                ''Vigente''',
'            else',
'                ''No Vigente''',
'       end as stdo,     ',
'        1 DESCARGAR        ',
'from    si_d_resoluciones a ',
'where   a.id_sjto_impsto = :P168_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(96027700422877302)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JRANGEL'
,p_internal_uid=>96027700422877302
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96027814419877303)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Nombre Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96028051901877305)
,p_db_column_name=>'ID_RSLCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Rslcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96028152651877306)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:SI_D_RESOLUCIONES:FILE_BLOB:ID_RSLCION::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-cloud-arrow-down" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100021811886170901)
,p_db_column_name=>'NMRO_RSLCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('N\00FAmero de Resolucion')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100021930647170902)
,p_db_column_name=>'FCHA_INCIAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha Inicial '
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100022023866170903)
,p_db_column_name=>'FCHA_FNAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha Final '
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100022126653170904)
,p_db_column_name=>'STDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(96055338212965622)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'960554'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_RSLCION:FCHA_INCIAL:FCHA_FNAL:STDO:FILE_NAME:DESCARGAR:'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(101512615714357114)
,p_report_id=>wwv_flow_api.id(96055338212965622)
,p_name=>'Resoluciones No vigentes'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'STDO'
,p_operator=>'='
,p_expr=>'No Vigente'
,p_condition_sql=>' (case when ("STDO" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''No Vigente''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#ECF7A8'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95956400330150820)
,p_plug_name=>'Detalle Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(96027682251877301)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95955013716150806)
,p_plug_name=>'Detalle de la Solicitud'
,p_region_name=>'dtlle_slctud'
,p_parent_plug_id=>wwv_flow_api.id(95956400330150820)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select x.id_rnta_prdcto',
'      , x.id_subprdcto',
'      , x.id_rnta',
'      , x.cntdad_slctda',
'      , x.cntdad_aprbda',
'      , x.vlor_untrio',
'      , x.vlor_ttal',
'      , nvl(x.cntdad_actal,0)  cntdad_actal',
'      , nvl(x.cntdad_rsrvda,0) cntdad_rsrvda',
'      , nvl(x.cntdad_actal,0) - nvl(x.cntdad_rsrvda,0) as stock',
'      -- Consultamos si hay dispinibilidad indicador = 0 si no indicador = 1 (es utilizado para resaltar la fila para los productos sin diaponibilidad)',
'      , case',
'            when x.cntdad_slctda > (x.cntdad_dspnble - nvl(x.cntdad_rsrvda, 0)) then',
'                    0',
'            when x.cntdad_dspnble - nvl(x.cntdad_rsrvda, 0) > x.cntdad_slctda then',
'                    1',
'        end as indcdor',
'   from (',
'             select a.id_rnta_prdcto',
'                  , a.id_subprdcto',
'                  , a.id_rnta',
'                  , a.cntdad_slctda',
'                  , a.cntdad_aprbda',
'                  , a.vlor_untrio',
'                  , a.vlor_ttal',
'                  , a.cntdad_actal',
'                  , c.cntdad_dspnble  ',
'                  -- Consultamos cantidades reservadas del producto ',
'                  , ( select sum(cntdad_rsrvda)',
'                        from gi_g_rentas_producto',
'                       where id_subprdcto   = a.id_subprdcto',
'                         and indcdor_rsrvdo = 1)   cntdad_rsrvda',
'              ',
'               from gi_g_rentas_producto      a',
'               join gi_d_subproductos         b on a.id_subprdcto     = b.id_subprdcto',
'               left join v_ex_almacen_externo c on b.cdgo_subproducto = c.cdgo_prdcto',
'              where a.id_rnta = :P168_ID_RNTA',
'        ) x '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95955371453150809)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95955409498150810)
,p_name=>'CNTDAD_SLCTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNTDAD_SLCTDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad Solicitada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95955502788150811)
,p_name=>'CNTDAD_APRBDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNTDAD_APRBDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad Aprobada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_item_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'NOT_EXISTS'
,p_readonly_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_g_rentas',
' where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'   and cdgo_rnta_estdo = (''RGS'');'))
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95955605239150812)
,p_name=>'VLOR_UNTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_UNTRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Unitario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95955731819150813)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95955985510150815)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(95956115341150817)
,p_name=>'ID_RNTA_PRDCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA_PRDCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97343786746979902)
,p_name=>'ID_SUBPRDCTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SUBPRDCTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Descripci\00F3n Producto ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion as v',
'     , a.id_subprdcto                                                                                  as r       ',
'  from v_gi_d_productos a',
' where a.actvo = ''S'''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101071848267424401)
,p_name=>'CNTDAD_ACTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNTDAD_ACTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad Actual'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101071903360424402)
,p_name=>'CNTDAD_RSRVDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNTDAD_RSRVDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad Reservada '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101072219048424405)
,p_name=>'INDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Indcdor'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(101123189325513001)
,p_name=>'STOCK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCK'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Stock'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(95955129666150807)
,p_internal_uid=>95955129666150807
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(95963548849207721)
,p_interactive_grid_id=>wwv_flow_api.id(95955129666150807)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(95963691789207721)
,p_report_id=>wwv_flow_api.id(95963548849207721)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95964676003207729)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(95955371453150809)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95965121180207731)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(95955409498150810)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95965663071207732)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(95955502788150811)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95966167667207735)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(95955605239150812)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95966660127207737)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(95955731819150813)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(95968647409215783)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(95956115341150817)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97349509712992819)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(97343786746979902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>586
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101077892001424641)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(101071848267424401)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101078394181424649)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(101071903360424402)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101084114589610884)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(101072219048424405)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101129220613513167)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(101123189325513001)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>47
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(121929000001)
,p_view_id=>wwv_flow_api.id(95963691789207721)
,p_execution_seq=>5
,p_name=>'Cantidad Solicitada no Disponible '
,p_background_color=>'#ECF7A8'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(101072219048424405)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'0'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96028477872877309)
,p_plug_name=>'Adjuntos '
,p_parent_plug_id=>wwv_flow_api.id(96027682251877301)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.id_rnta_adjnto,',
'        b.file_name,',
'       -- b.file_blob,',
'        1 DESCARGAR',
'from    gi_g_rentas_adjnto b',
'where   b.id_rnta = :P168_ID_RNTA',
'',
''))
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
 p_id=>wwv_flow_api.id(96028522956877310)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JRANGEL'
,p_internal_uid=>96028522956877310
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96028668834877311)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Nombre Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96028821127877313)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GI_G_RENTAS_ADJNTO:FILE_BLOB:ID_RNTA_ADJNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-cloud-arrow-down" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96028949339877314)
,p_db_column_name=>'ID_RNTA_ADJNTO'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Id Rnta Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(96066278789213298)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'960663'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:DESCARGAR:ID_RNTA_ADJNTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192842627000259578)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
'<i>',
'    Funcionalidad que permite gestionar la cantidad aprobada de los productos, aprobar o rechazar una solicitud de',
'    productos.',
unistr('    <br><br> Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96161421817222901)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(96155562557215001)
,p_button_name=>'Btn_aprobar_solicitud'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check-circle-o'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96161598025222902)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(96155562557215001)
,p_button_name=>'Btn_rechazar_solicitud'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Rechazar Solicitud'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.:RP,174:P174_ID_RNTA,P174_CDGO_ESTDO:&P168_ID_RNTA.,RCH'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101231255763777850)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(96155562557215001)
,p_button_name=>'Btn_regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(100339053644756402)
,p_branch_name=>unistr('Observaci\00F3n ')
,p_branch_action=>'f?p=&APP_ID.:174:&SESSION.:Branch:&DEBUG.:RP,174:P174_CDGO_ESTDO,P174_ID_RNTA:APR,&P168_ID_RNTA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'Aprobar_solicitud'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95954706856150803)
,p_name=>'P168_ID_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95956400330150820)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95954851802150804)
,p_name=>'P168_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95956400330150820)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95956697930150822)
,p_name=>'P168_NMRO_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96027682251877301)
,p_prompt=>unistr('N\00FAmero de Solicitud ')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95956774742150823)
,p_name=>'P168_FCHA_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(96027682251877301)
,p_prompt=>'Fecha de Solicitud '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95956824927150824)
,p_name=>'P168_USRIO_SLCTUD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(96027682251877301)
,p_prompt=>'Usuario que Solicita '
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_USUARIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95956960887150825)
,p_name=>'P168_VLOR_SLCTUD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(96027682251877301)
,p_prompt=>'Total de la Solicitud'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96497457897506101)
,p_name=>'P168_CDGO_RNTA_STDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(96027682251877301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101101278184321101)
,p_name=>'P168_CDGO_RNTA_ESTDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(96027682251877301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96427545287673201)
,p_name=>'Al cargar pagina desactivar Botones Aprobar y rechazar'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NOT_EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'          from gi_g_rentas',
'         where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'           and cdgo_rnta_estdo = (''RGS'');'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96427625509673202)
,p_event_id=>wwv_flow_api.id(96427545287673201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(96161421817222901)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96427729414673203)
,p_event_id=>wwv_flow_api.id(96427545287673201)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(96161598025222902)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96526818346075703)
,p_name=>'Aprobar Solicitud'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(96161421817222901)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96526970649075704)
,p_event_id=>wwv_flow_api.id(96526818346075703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarCantidadAprobada();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96018172875779701)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(95955013716150806)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Actualizar valor total y cantidad aprobada'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Se Actualizan las cantidades aprobadas y el valor total para las filas modificadas',
'declare',
'',
'        v_vlor_ttal number;        ',
'        ',
'begin',
'',
'    v_vlor_ttal := :CNTDAD_APRBDA * :VLOR_UNTRIO;',
'    ',
'    case :APEX$ROW_STATUS   ',
'    ',
'        when ''U'' then                          ',
'        ',
'           update gi_g_rentas_producto',
'              set cntdad_aprbda  = :CNTDAD_APRBDA',
'                , vlor_ttal      = v_vlor_ttal                     ',
'            where id_rnta_prdcto = :ID_RNTA_PRDCTO;      ',
'          ',
'    end case;',
'    ',
'    commit;',
'    ',
'exception',
'    when others then',
'            raise_application_error(-21000, ''Error al actualizar los totales de la solicitud: ''||sqlerrm);',
'end;'))
,p_attribute_05=>'N'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Btn_aprobar_solicitud, Aprobar_solicitud'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_exec_cond_for_each_row=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96038310704903702)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reservamos los productos de la solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Se reservan los productos de la solicitud',
'declare',
'        v_vlor_ttal number;',
'begin  ',
'',
'     -- Actualizamos el Stock',
'    begin ',
'        for c_prdctos in (',
'                            select cntdad_aprbda',
'                                 , id_subprdcto',
'                              from gi_g_rentas_producto                     ',
'                             where id_rnta      = :P168_ID_RNTA',
'         )loop',
'',
'            update gi_g_rentas_producto',
'               set cntdad_rsrvda  = c_prdctos.cntdad_aprbda',
'                 , indcdor_rsrvdo = 1',
'             where id_rnta      = :P168_ID_RNTA',
'               and id_subprdcto = c_prdctos.id_subprdcto;',
'',
'         end loop;',
'',
'    end; ',
'     ',
'     commit;',
'     ',
'exception ',
'        when others then',
'                raise_application_error(-20000, ''Error al actualizar la base de la solicitud'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96276846425509101)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobar Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_dcmnto        number;',
'    v_nmro_dcmnto      number;',
'    v_vlor_ttal        number;                ',
'    v_cdgo_rspsta      number;',
'    v_mnsje_rspsta     varchar2(4000);',
'    ',
'begin',
'',
'    -- Consultamos el total del pedido    ',
'    select sum(vlor_ttal)',
'      into v_vlor_ttal',
'      from gi_g_rentas_producto',
'     where id_rnta = :P168_ID_RNTA;',
'     ',
'     ',
'     -- Actualizamos en la tabla de rentas',
'     update gi_g_rentas',
'        set vlor_bse_grvble = v_vlor_ttal',
'      where id_rnta         = :P168_ID_RNTA;',
'    ',
'    -- Aprobamos la solicitud  ',
'    pkg_gi_productos.prc_ap_solicitud_producto (  p_cdgo_clnte          	    => :F_CDGO_CLNTE',
'                                                , p_id_rnta             	    => :P168_ID_RNTA',
'                                                , p_id_usrio            	    => :F_ID_USRIO',
'                                                , o_id_dcmnto           	    => v_id_dcmnto',
'                                                , o_nmro_dcmnto         	    => v_nmro_dcmnto',
'                                                , o_cdgo_rspsta         	    => v_cdgo_rspsta',
'                                                , o_mnsje_rspsta        	    => v_mnsje_rspsta);',
'    if v_cdgo_rspsta <> 0 then',
'        raise_application_error(-20000, v_mnsje_rspsta);',
'    end if;',
'    ',
'exception ',
'  when others then',
'          raise_application_error(-20001, ''Ocurrio un Error inesperado: '' || sqlerrm );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Btn_aprobar_solicitud'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95954538563150801)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar datos de la renta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Se consultan los datos de la solicitud',
'begin',
'        select id_rnta',
'             , id_sjto_impsto',
'             , nmro_rnta',
'             , id_usrio',
'             , fcha_rgstro',
'             , to_char(vlor_bse_grvble, :F_FRMTO_MNDA)',
'             , cdgo_rnta_estdo',
'          into :P168_ID_RNTA',
'             , :P168_ID_SJTO_IMPSTO   ',
'             , :P168_NMRO_SLCTUD',
'             , :P168_USRIO_SLCTUD',
'             , :P168_FCHA_SLCTUD',
'             , :P168_VLOR_SLCTUD',
'             , :P168_CDGO_RNTA_ESTDO',
'          from gi_g_rentas',
'         where id_instncia_fljo = :F_ID_INSTNCIA_FLJO; ',
'         ',
'exception ',
'        when no_data_found then',
'                raise_application_error(-20000, ''No se encontraron los datos de la solicitud'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101072023187424403)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Stock y Valor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Se actualizan los datos de valor y cantidades (ya que pueden varian por modificaciones de almacen)',
'begin',
'',
'    for c_prdctos_almcen in (',
'                                select case',
'                                        when a.cntdad_slctda > (c.cntdad_dspnble - nvl(a.cntdad_rsrvda, 0)) then',
'                                                c.cntdad_dspnble  - nvl(a.cntdad_rsrvda, 0)',
'                                        when c.cntdad_dspnble - nvl(a.cntdad_rsrvda, 0) >= a.cntdad_slctda then',
'                                                a.cntdad_slctda',
'                                        end as cntdad_aprbda',
'                                      , c.cntdad_dspnble  ',
'                                      , c.vlor_untrio',
'                                      , a.id_subprdcto ',
'                                      , a.id_rnta',
'                                   from gi_g_rentas_producto      a',
'                                   join gi_d_subproductos         b on a.id_subprdcto     = b.id_subprdcto',
'                                   left join v_ex_almacen_externo c on b.cdgo_subproducto = c.cdgo_prdcto',
'                                  where a.id_rnta = :P168_ID_RNTA',
'    )loop',
'    ',
'        update gi_g_rentas_producto',
'           set vlor_untrio   = c_prdctos_almcen.vlor_untrio',
'             , cntdad_aprbda = c_prdctos_almcen.cntdad_aprbda  ',
'             , cntdad_actal  = c_prdctos_almcen.cntdad_dspnble',
'             , vlor_ttal     = c_prdctos_almcen.cntdad_aprbda * c_prdctos_almcen.vlor_untrio',
'         where id_rnta       = c_prdctos_almcen.id_rnta',
'           and id_subprdcto  = c_prdctos_almcen.id_subprdcto;',
'       ',
'    end loop;     ',
'    ',
'    commit;',
'    ',
'exception',
' when others then',
'         raise_application_error(-20000, ''Error al actualizar cantidades: ''||sqlerrm);',
'         rollback;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P168_CDGO_RNTA_ESTDO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'RGS'
);
end;
/
