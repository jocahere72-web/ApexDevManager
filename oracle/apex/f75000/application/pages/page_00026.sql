prompt --application/pages/page_00026
begin
wwv_flow_api.create_page(
 p_id=>26
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Re-liquidar Veh\00EDculo')
,p_step_title=>unistr('Re-liquidar Veh\00EDculo')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'onkeypress="return codigoBarra(event,''numeroEntero'');" ',
'let validarPlaca = (event, expresion) => {',
'',
'    if (event.key == "Enter") {',
'        ',
'        if ($v(''P26_VHCLO_PLCA'') != ''''){',
'            return apex.submit({ request: ''validarPlaca'', submitIfEnter: event});                        ',
'        }else{',
'            Swal.fire({',
'                       icon: ''error'',',
unistr('                      title: ''<H2 >Validaci\00F3n</H2>'','),
'                       html: `<h4>Digite una placa</h4>`',
'                     }); ',
'               return apex.submit({ request: ''Limpiar'', submitIfEnter: event});  ',
'        }',
'    ',
'    }',
'    ',
'    return validarExpresion(event, expresion);',
'};',
'function calcularCilindraje(){',
'',
'        try{',
'                apex.server.process(',
'                    ''calcularCilindraje'',',
'                    {',
'                        x01: $v(''P26_VGNCIA''),',
'                        x02: $v(''P26_VHCLO_LNEA_1''),',
'                        x03: $v(''P26_VHCLO_MRCA_1'')',
'                    }).then((resp) => {',
'                            console.log(''Respuesta:  '',resp);',
'                            apex.item(''P26_CLNDRJE_1'').setValue(resp.v_clndrje);',
'                    });       ',
'',
'        } catch (e) {',
'            console.log(e);',
'        };',
'',
'    };',
'',
'function ValidaCilindrajepuntual(){',
'  console.log(''entrando'');',
'  console.log($v(''P26_VHCLO_LNEA_1''));',
'  console.log($v(''P26_VHCLO_MRCA_1''));',
'   ',
'    try{',
'                apex.server.process(',
'                    ''ValidarCilindraje'',',
'                    {',
'                        x01: 2021, //ojo//',
'                        x02: $v(''P26_VHCLO_LNEA_1''),',
'                        x03: $v(''P26_VHCLO_MRCA_1''),',
'                    }).then((resp) => {',
'                            console.log(''Respuesta:  '',resp);',
'                             apex.item(''P26_CLNDRJE_1'').setValue(resp.v_clndrje);',
'                           ',
'                    });       ',
'',
'        } catch (e) {',
'            console.log(e);',
'        };',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById(''P26_VHCLO_PLCA'').style.fontWeight = "900";',
'document.getElementById(''P26_VHCLO_PLCA'').style.fontSize = "29px"',
'document.getElementById(''P26_VHCLO_PLCA'').style.fontFamily = "Lucida Console";',
'document.getElementById(''P26_VHCLO_PLCA'').style.textAlign = "center";',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(237212187010524183)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JGONZALEZ'
,p_last_upd_yyyymmddhh24miss=>'20240117085824'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(102229792835846201)
,p_plug_name=>'TabVehiculo'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(237251008003524203)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(174250878740628872)
,p_plug_name=>unistr('Informaci\00F3n Veh\00EDculo')
,p_parent_plug_id=>wwv_flow_api.id(102229792835846201)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91600278429631842)
,p_plug_name=>unistr('Datos B\00E1sicos ')
,p_parent_plug_id=>wwv_flow_api.id(174250878740628872)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237233096139524196)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88609184532044525)
,p_plug_name=>'Tabs'
,p_parent_plug_id=>wwv_flow_api.id(91600278429631842)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(237251008003524203)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175864850639837336)
,p_plug_name=>unistr('Informaci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(88609184532044525)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175865710923837345)
,p_plug_name=>'Rodamiento'
,p_parent_plug_id=>wwv_flow_api.id(88609184532044525)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(102229802650846202)
,p_plug_name=>'Tab Liquidacion'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(237251008003524203)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88611581707044549)
,p_plug_name=>unistr('Datos a Utilizar en Liquidaci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(102229802650846202)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88609256500044526)
,p_plug_name=>unistr(' Liquidaci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(88611581707044549)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175867325313837361)
,p_plug_name=>unistr('Inicio Liquidaci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(88611581707044549)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(180570335189295922)
,p_plug_name=>'Datos Principales'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>3
,p_plug_display_column=>5
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(285435512133131496)
,p_plug_name=>'Opciones'
,p_region_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>' <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(285438830172146519)
,p_plug_name=>'Ayuda'
,p_region_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'                <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'	<i>',
unistr('        Funcionalidad que permite realizar la reliquidaci\00F3n de un nuevo veh\00EDculo seg\00FAn sus caracter\00EDsticas.'),
'        <br>	',
'        <br>',
unistr('	    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dirijase al Manual de Usuario.'),
'    </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(90991581761206521)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_api.id(285435512133131496)
,p_button_name=>'Btn_Reliquidar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reliquidar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P26_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-rotate-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(93239608583357005)
,p_branch_name=>unistr('Ir a reliquidaci\00F3n ')
,p_branch_action=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP,33:P33_VGNCIA_INCIO_LQDCION,P33_ID_SJTO_IMPSTO,P33_ID_IMPSTO,P33_ID_IMPSTO_SBMPSTO,P33_CDGO_MRCA,P33_CDGO_CLSE,P33_CDGO_OPRCIO,P33_CDGO_CRRCRIA,P33_CDGO_SRVCIO,P33_MDLO,P33_CTGRIA:&P26_VGNCIA_INCIO_LQDCION.,&P26_ID_SJTO_IMPSTO.,&P26_ID_IMPSTO.,&P26_ID_IMPSTO_SBIMPSTO.,&P26_VHCLO_MRCA_1.,&P26_VHCLO_CLSE_1.,&P26_VHCLO_OPRCION_1.,&P26_VHCLO_CRRCRIA_1.,&P26_VHCLO_SRVCIO_1.,&P26_MDLO_1.,&P26_VHCLO_CTGTRIA_1.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(90991581761206521)
,p_branch_sequence=>20
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P26_VGNCIA_INCIO_LQDCION'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(91985427079340510)
,p_branch_name=>unistr('Ir a P\00E1gina 29')
,p_branch_action=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP,29:P29_ID_IMPSTO,P29_ID_IMPSTO_SBMPSTO,P29_ID_SJTO_IMPSTO:&P26_ID_IMPSTO.,&P26_ID_IMPSTO_SBIMPSTO.,&P26_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(90991581761206521)
,p_branch_sequence=>30
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88609424625044528)
,p_name=>'P26_VHCLO_CTGTRIA_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_item_default=>'P26_VHCLO_CTGTRIA'
,p_item_default_type=>'ITEM'
,p_prompt=>unistr('Categor\00EDa: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CATEGORIA_VEHICULO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CTGTRIA as d,',
'       CDGO_VHCLO_CTGTRIA as r',
'  from DF_S_VEHICULOS_CATEGORIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88609579739044529)
,p_name=>'P26_VHCLO_CLSE_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_item_default=>'P26_VHCLO_CLSE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Clase:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct b.dscrpcion_vhclo_clse as d',
'     , c.cdgo_vhclo_clse  as r',
'  from df_s_vehiculos_clase_ctgria c',
'  join df_s_vehiculos_clase        b on b.cdgo_vhclo_clse = c.cdgo_vhclo_clse',
' where c.cdgo_vhclo_ctgtria = :P26_VHCLO_CTGTRIA_1',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_VHCLO_CTGTRIA_1'
,p_ajax_items_to_submit=>'P26_VHCLO_CLSE_1,P26_VHCLO_CTGTRIA_1'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88609692643044530)
,p_name=>'P26_VHCLO_MRCA_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_item_default=>'P26_VHCLO_MRCA'
,p_item_default_type=>'ITEM'
,p_prompt=>'Marca:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select j.dscrpcion_vhclo_mrca,j.cdgo_vhclo_mrca from df_s_vehiculos_marca j',
'where j.mnstrio = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_VHCLO_CTGTRIA_1,P26_VHCLO_CLSE_1'
,p_ajax_items_to_submit=>'P26_VHCLO_MRCA_1,P26_VHCLO_CLSE_1'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88609741515044531)
,p_name=>'P26_VHCLO_LNEA_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_item_default=>'P26_VHCLO_LNEA'
,p_item_default_type=>'ITEM'
,p_prompt=>'Linea:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l.dscrpcion_vhclo_lnea || '' - ['' || d.clndrje_dsde || '']'' as d,',
'         l.id_vhclo_lnea as r',
'    from df_s_vehiculos_grupo d',
'    join df_s_vehiculos_linea l',
'      on d.id_vhclo_lnea = l.id_vhclo_lnea',
'     and d.vgncia =extract (year from sysdate)',
'   where d.cdgo_vhclo_mrca = :P26_VHCLO_MRCA_1-- and',
'   --d.id_vhclo_clse_ctgria in (select hj.id_vhclo_clse_ctgria from df_s_vehiculos_clase_ctgria hj ',
'                          -- where hj.vgncia =  extract (year from sysdate) and hj.cdgo_vhclo_clse = :P26_VHCLO_CLSE_1 ) and l.mnstrio    = ''S'' ',
'   ',
'   ',
'',
'/*select l.dscrpcion_vhclo_lnea||'' - [''||d.clndrje_dsde||'']'' as d',
'     , l.id_vhclo_lnea                                     as r',
'  from df_s_vehiculos_grupo d',
'  join df_s_vehiculos_linea l on d.id_vhclo_lnea = l.id_vhclo_lnea',
'  join  df_s_vehiculos_clase_ctgria h  on h.id_vhclo_clse_ctgria = d.id_vhclo_clse_ctgria and h.vgncia =  d.vgncia',
'  and d.cdgo_vhclo_mrca = l.cdgo_vhclo_mrca',
'  where d.vgncia   = extract (year from sysdate)',
'   and h.cdgo_vhclo_clse      = :P26_VHCLO_CLSE_1  ',
'   and h.cdgo_vhclo_ctgtria   = :P26_VHCLO_CTGTRIA_1',
'   and d.cdgo_vhclo_mrca      = :P26_VHCLO_MRCA_1',
'   and l.mnstrio              = ''S''*/'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_VHCLO_MRCA_1'
,p_ajax_items_to_submit=>'P26_VHCLO_LNEA_1'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88609864660044532)
,p_name=>'P26_CLNDRJE_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>'Cilindraje: '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88609964396044533)
,p_name=>'P26_MDLO_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>unistr('A\00F1o Modelo:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88610071414044534)
,p_name=>'P26_FCHA_CMPRA_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>'Fecha de Factura:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cattributes_element=>' onkeydown="return false" '
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88610152836044535)
,p_name=>'P26_FCHA_MTRCLA_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>'Fecha de Matricula:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cattributes_element=>' onkeydown="return false" '
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88610290663044536)
,p_name=>'P26_FCHA_IMPRTCION_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>unistr('Fecha de Importaci\00F3n: ')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88610379611044537)
,p_name=>'P26_BLNDDO_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>'Blindaje:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_blndje as d',
'     , cdgo_vhclo_blndje      as r',
'  from df_s_vehiculos_blindaje;',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_FCHA_MTRCLA_1'
,p_ajax_items_to_submit=>'P26_BLNDDO_1'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88610452767044538)
,p_name=>'P26_VHCLO_CRRCRIA_1'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>unistr('Carrocer\00EDa: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CARROCERIA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CRROCRIA as d,',
'       CDGO_VHCLO_CRRCRIA as r',
'  from DF_S_VEHICULOS_CARROCERIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88610527502044539)
,p_name=>'P26_VHCLO_SRVCIO_1'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>'Servicio: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_SERVICIO_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_SRVCIO  as d,',
'       CDGO_VHCLO_SRVCIO as r',
'  from DF_S_VEHICULOS_SERVICIO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88610658578044540)
,p_name=>'P26_VHCLO_OPRCION_1'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>unistr('Operaci\00F3n: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_OPERACION_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_OPRCION as d,',
'       CDGO_VHCLO_OPRCION as r',
'  from DF_S_VEHICULOS_OPERACION',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88610730183044541)
,p_name=>'P26_CPCDAD_CRGA_1'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>'Capacidad de Carga:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88610876758044542)
,p_name=>'P26_CPCDAD_PSJRO_1'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_prompt=>'Capacidad de Pasajeros:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88611151758044545)
,p_name=>'P26_INDCDOR_1'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(88609256500044526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88771811602120469)
,p_name=>'P26_VHCLO_PLCA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(180570335189295922)
,p_prompt=>'No. Placa:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>8
,p_cMaxlength=>6
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarPlaca(event,''letraNumero'');" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295745636524231)
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88772857895122728)
,p_name=>'P26_NMRO_MTOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_prompt=>unistr('N\00FAmero de Motor:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88773217228122729)
,p_name=>'P26_NMRO_CHSIS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_prompt=>unistr('N\00FAmero de Chasis: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88773686482122729)
,p_name=>'P26_DCLRCION_IMPRTCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_prompt=>unistr('N\00FAmero de Importaci\00F3n: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88774031604122729)
,p_name=>'P26_NMRO_MTRCLA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_prompt=>'No. Matricula:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88774464219122729)
,p_name=>'P26_AVLUO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_prompt=>'Valor Factura:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>16
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'')" onkeypress="return  validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88774877669122738)
,p_name=>'P26_VLOR_CMRCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_prompt=>'Valor Comercial:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>16
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'')" onkeypress="return  validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88775220771122738)
,p_name=>'P26_ORGNSMO_TRNSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_prompt=>'Organismo de Transito: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_orgnsmo_trnsto as d',
'     , id_orgnsmo_trnsto    as r',
'  from df_s_organismos_transito'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88775657885122743)
,p_name=>'P26_VHCLO_CMBSTBLE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_prompt=>'Combustible: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_COMBUSTIBLE_VEHICULO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhculo_cmbstble as d',
'     , cdgo_vhclo_cmbstble       as r',
'  from df_s_vehiculos_combustible',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88776057863122744)
,p_name=>'P26_VHCLO_TRNSMSION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_prompt=>unistr('Transmisi\00F3n: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TRANSMISION_VEHICULO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_trnsmsion as d',
'     , cdgo_vhclo_trnsmsion      as r',
'  from df_s_vehiculos_transmision',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'20%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88776432557122744)
,p_name=>'P26_CLSCO_S_N'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_item_default=>'N'
,p_prompt=>unistr('Cl\00E1sico:')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88776873573122744)
,p_name=>'P26_INTRNDO_S_N'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(175864850639837336)
,p_item_default=>'N'
,p_prompt=>'Internado:'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88777235935122744)
,p_name=>'P26_DPRTMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(175865710923837345)
,p_prompt=>'Departamento: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmbre_dprtmnto as d',
'       , id_dprtmnto    as r ',
'   from df_s_departamentos;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88777660490122744)
,p_name=>'P26_MNCPIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(175865710923837345)
,p_prompt=>'Municipio: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmbre_mncpio as d',
'       , id_mncpio    as r ',
'   from df_s_municipios',
'  where id_dprtmnto = :P26_DPRTMNTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_DPRTMNTO'
,p_ajax_items_to_submit=>'P26_DPRTMNTO,P26_MNCPIO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88778381965122745)
,p_name=>'P26_VHCLO_CTGTRIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>unistr('Categor\00EDa: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CATEGORIA_VEHICULO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CTGTRIA as d,',
'       CDGO_VHCLO_CTGTRIA as r',
'  from DF_S_VEHICULOS_CATEGORIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_VHCLO_CTGTRIA'
,p_ajax_optimize_refresh=>'Y'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88778724914122745)
,p_name=>'P26_VHCLO_CLSE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>'Clase:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion_vhclo_clse as d',
'     , c.cdgo_vhclo_clse      as r',
'  from df_s_vehiculos_clase_ctgria c',
'  join df_s_vehiculos_clase        b on b.cdgo_vhclo_clse = c.cdgo_vhclo_clse',
' where c.cdgo_vhclo_ctgtria = :P26_VHCLO_CTGTRIA'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_VHCLO_CTGTRIA'
,p_ajax_items_to_submit=>'P26_VHCLO_CLSE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88779113026122746)
,p_name=>'P26_VHCLO_MRCA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>'Marca:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select j.dscrpcion_vhclo_mrca,j.cdgo_vhclo_mrca from df_s_vehiculos_marca j',
'where j.mnstrio = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_VHCLO_CTGTRIA'
,p_ajax_items_to_submit=>'P26_VHCLO_MRCA'
,p_ajax_optimize_refresh=>'Y'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88779584102122746)
,p_name=>'P26_VHCLO_LNEA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>'Linea:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion_vhclo_lnea as d',
'        , id_vhclo_lnea        as r',
'     from df_s_vehiculos_linea',
'    where cdgo_vhclo_mrca = :P26_VHCLO_MRCA'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_VHCLO_MRCA'
,p_ajax_items_to_submit=>'P26_VHCLO_MRCA,P26_VHCLO_LNEA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88779963890122746)
,p_name=>'P26_CLNDRJE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>'Cilindraje: '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88780327170122749)
,p_name=>'P26_MDLO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>unistr('A\00F1o Modelo:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88780761867122750)
,p_name=>'P26_FCHA_CMPRA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>'Fecha de Factura:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_cattributes_element=>' onkeydown="return false" '
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88781139054122752)
,p_name=>'P26_FCHA_MTRCLA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>'Fecha de Matricula:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_cattributes_element=>' onkeydown="return false" '
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88781596460122752)
,p_name=>'P26_FCHA_IMPRTCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>unistr('Fecha de Importaci\00F3n: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88781969218122753)
,p_name=>'P26_BLNDDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>'Blindaje:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_blndje as d',
'     , cdgo_vhclo_blndje      as r',
'  from df_s_vehiculos_blindaje;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_FCHA_MTRCLA'
,p_ajax_items_to_submit=>'P26_FCHA_MTRCLA,P26_BLNDDO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88782334731122753)
,p_name=>'P26_VHCLO_CRRCRIA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>unistr('Carrocer\00EDa: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CARROCERIA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CRROCRIA as d,',
'       CDGO_VHCLO_CRRCRIA as r',
'  from DF_S_VEHICULOS_CARROCERIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88782799292122753)
,p_name=>'P26_VHCLO_SRVCIO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>'Servicio: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_SERVICIO_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_SRVCIO  as d,',
'       CDGO_VHCLO_SRVCIO as r',
'  from DF_S_VEHICULOS_SERVICIO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88783143805122753)
,p_name=>'P26_VHCLO_OPRCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>unistr('Operaci\00F3n: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_OPERACION_VEHICULOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_OPRCION as d,',
'       CDGO_VHCLO_OPRCION as r',
'  from DF_S_VEHICULOS_OPERACION',
' order by 1'))
,p_lov_display_null=>'YES'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88783520739122753)
,p_name=>'P26_CPCDAD_CRGA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>'Capacidad de Carga:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88783926847122754)
,p_name=>'P26_CPCDAD_PSJRO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_prompt=>'Capacidad de Pasajeros:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88785178223122754)
,p_name=>'P26_INDCDOR'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88785586617122754)
,p_name=>'P26_ID_IMPSTO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(174250878740628872)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_impsto',
'      from df_c_impuestos',
'     where cdgo_clnte  = :F_CDGO_CLNTE',
'       and cdgo_impsto = ''VHL'';'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88785998919122755)
,p_name=>'P26_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(180570335189295922)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88786335039122755)
,p_name=>'P26_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(180570335189295922)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88787061336122756)
,p_name=>'P26_VGNCIA_INCIO_LQDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(175867325313837361)
,p_prompt=>unistr('Vigencia Inicio de Liquidaci\00F3n:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select vgncia as d',
'        , vgncia as r',
'     from df_s_vigencias',
'   where vgncia >= nvl(extract (year from(to_date(:P26_FCHA_MTRCLA_1))),extract (year from(to_date(:P26_FCHA_CMPRA))))',
'     -- and vgncia <> :P26_VGNCIA ',
'    order by 1',
'      '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P26_FCHA_MTRCLA_1,P26_VGNCIA'
,p_ajax_items_to_submit=>'P26_VGNCIA_INCIO_LQDCION'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88787731535122756)
,p_name=>'P26_ASGRDRA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(175865710923837345)
,p_prompt=>'Aseguradora:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_asgrdra as d',
'     , id_asgrdra    as r',
'  from df_s_aseguradoras;'))
,p_lov_display_null=>'YES'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(237295833339524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88788195802122756)
,p_name=>'P26_NMRO_SOAT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(175865710923837345)
,p_prompt=>unistr('N\00FAmero P\00F3liza:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88788502718122758)
,p_name=>'P26_FCHA_VNCMNTO_SOAT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(175865710923837345)
,p_prompt=>'Fecha Vencimiento:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90991600272206522)
,p_name=>'P26_VGNCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(88611581707044549)
,p_prompt=>'Vigencia Actual:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90991710406206523)
,p_name=>'P26_PRDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(88611581707044549)
,p_prompt=>'Periodo Actual: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo    as d',
'     , id_prdo as r',
'  from df_i_periodos',
' where id_prdo = :P26_PRDO;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(237295611961524231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90992111669206527)
,p_name=>'P26_ID_IMPSTO_SBIMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(180570335189295922)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(88790027980180973)
,p_computation_sequence=>10
,p_computation_item=>'P26_CDGO_CLNTE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_CDGO_CLNTE'
,p_compute_when=>'P26_CDGO_CLNTE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(88789363325139927)
,p_computation_sequence=>20
,p_computation_item=>'P26_ID_IMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_impsto',
'      from df_c_impuestos',
'     where cdgo_clnte  = :F_CDGO_CLNTE',
'       and cdgo_impsto = ''VHL'';'))
,p_computation_error_message=>unistr('No Existe el Impuesto de Veh\00EDculo parametrizado!')
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(90992023081206526)
,p_computation_sequence=>30
,p_computation_item=>'P26_ID_IMPSTO_SBIMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P26_ID_IMPSTO'))
,p_compute_when=>'P26_ID_IMPSTO_SBIMPSTO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(90991855324206524)
,p_computation_sequence=>40
,p_computation_item=>'P26_VGNCIA'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return extract(year from sysdate) ;',
'',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(90991935416206525)
,p_computation_sequence=>50
,p_computation_item=>'P26_PRDO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prdo',
'  from df_i_periodos',
' where cdgo_clnte        = :F_CDGO_CLNTE',
'   and id_impsto         = :P26_ID_IMPSTO',
'   and id_impsto_sbmpsto = :P26_ID_IMPSTO_SBIMPSTO',
'   and vgncia            = :P26_VGNCIA;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90992241328206528)
,p_validation_name=>'Categoria no nula'
,p_validation_sequence=>10
,p_validation=>'P26_VHCLO_CTGTRIA_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_associated_item=>wwv_flow_api.id(88609424625044528)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90992333208206529)
,p_validation_name=>'Clase no nula'
,p_validation_sequence=>20
,p_validation=>'P26_VHCLO_CLSE_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_associated_item=>wwv_flow_api.id(88609579739044529)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90992483771206530)
,p_validation_name=>'Marca no nula'
,p_validation_sequence=>30
,p_validation=>'P26_VHCLO_MRCA_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_associated_item=>wwv_flow_api.id(88609692643044530)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90992549057206531)
,p_validation_name=>'Linea no nula'
,p_validation_sequence=>40
,p_validation=>'P26_VHCLO_LNEA_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_associated_item=>wwv_flow_api.id(88609741515044531)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90992681213206532)
,p_validation_name=>'Cilidraje no nulo'
,p_validation_sequence=>50
,p_validation=>'P26_CLNDRJE_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_associated_item=>wwv_flow_api.id(88609864660044532)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90992739834206533)
,p_validation_name=>'Modelo no nulo'
,p_validation_sequence=>60
,p_validation=>'P26_MDLO_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_associated_item=>wwv_flow_api.id(88609964396044533)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90992836277206534)
,p_validation_name=>'fecha compra no nula'
,p_validation_sequence=>70
,p_validation=>'P26_FCHA_CMPRA_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_associated_item=>wwv_flow_api.id(88610071414044534)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90992906016206535)
,p_validation_name=>'Fecha matricula no nula'
,p_validation_sequence=>80
,p_validation=>'P26_FCHA_MTRCLA_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_associated_item=>wwv_flow_api.id(88610152836044535)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(90993022113206536)
,p_validation_name=>'Blindaje no nulo'
,p_validation_sequence=>90
,p_validation=>'P26_BLNDDO_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_associated_item=>wwv_flow_api.id(88610379611044537)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(91600354364631843)
,p_validation_name=>unistr('Vigencia inicio liquidaci\00F3n no null')
,p_validation_sequence=>100
,p_validation=>'P26_VGNCIA_INCIO_LQDCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_associated_item=>wwv_flow_api.id(88787061336122756)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6377471487925101)
,p_validation_name=>'Consultar_existencia_sujeto'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte                = :F_CDGO_CLNTE',
'       and id_impsto                 = :P26_ID_IMPSTO',
'       and idntfccion_sjto           = :P26_VHCLO_PLCA',
'       and id_sjto_estdo             = 1;',
'    ',
'   return true;',
'exception',
'    when no_data_found then ',
'        return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El sujeto tributo consultado no se encuentra activo'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6932249471718101)
,p_validation_name=>'vigencia_liquidacion'
,p_validation_sequence=>130
,p_validation=>'P26_VGNCIA_INCIO_LQDCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar Vigencia de Liquidaci\00F3n. ')
,p_when_button_pressed=>wwv_flow_api.id(90991581761206521)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(88911193013916006)
,p_name=>unistr('Refrescar Liquidaci\00F3n ')
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88911269184916007)
,p_event_id=>wwv_flow_api.id(88911193013916006)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(88611581707044549)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100138687997740205)
,p_name=>'calcular_cilindraje'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P26_VHCLO_LNEA_1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100138759998740206)
,p_event_id=>wwv_flow_api.id(100138687997740205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'ValidaCilindrajepuntual()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(88611653904044550)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validarPlaca'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  ',
'   select',
'          -- Datos del veiculo y reliqidacion ',
'          b.cdgo_vhclo_ctgtria',
'        , b.cdgo_vhclo_ctgtria',
'        , b.cdgo_vhclo_clse',
'        , b.cdgo_vhclo_clse',
'        , b.cdgo_vhclo_mrca',
'        , b.cdgo_vhclo_mrca',
'        , b.id_vhclo_lnea',
'        , b.id_vhclo_lnea',
'        , b.clndrje',
'        , b.clndrje',
'        , b.mdlo',
'        , b.mdlo',
'        , to_char(b.fcha_cmpra, ''DD/MM/YYYY'')',
'        , to_char(b.fcha_cmpra, ''DD/MM/YYYY'')',
'        , to_char(b.fcha_mtrcla, ''DD/MM/YYYY'')',
'        , to_char(b.fcha_mtrcla, ''DD/MM/YYYY'')',
'        , to_char(b.fcha_imprtcion, ''DD/MM/YYYY'')',
'        , to_char(b.fcha_imprtcion, ''DD/MM/YYYY'')                  ',
'        , b.cdgo_vhclo_blndje',
'        , b.cdgo_vhclo_blndje',
'        , b.cdgo_vhclo_crrcria',
'        , b.cdgo_vhclo_crrcria',
'        , b.cdgo_vhclo_srvcio',
'        , b.cdgo_vhclo_srvcio                  ',
'        , b.cdgo_vhclo_oprcion',
'        , b.cdgo_vhclo_oprcion',
'        , b.cpcdad_crga',
'        , b.cpcdad_crga                  ',
'        , b.cpcdad_psjro',
'        , b.cpcdad_psjro ',
'        ',
'        -- Informacion',
'        , b.nmro_mtor',
'        , b.nmro_chsis',
'        , b.nmro_dclrcion_imprtcion',
'        , b.nmro_mtrcla',
'        , b.avluo',
'        , b.vlor_cmrcial',
'        , b.id_orgnsmo_trnsto',
'        , b.cdgo_vhclo_cmbstble',
'        , b.cdgo_vhclo_trnsmsion',
'        , b.indcdor_clsco',
'        , b.indcdor_intrndo',
'        ',
'        -- Rodamiento',
'        , a.id_dprtmnto',
'        , a.id_mncpio',
'        ',
'        -- sujeto impuesto',
'        , b.id_sjto_impsto',
'        ',
'     into :P26_VHCLO_CTGTRIA',
'        , :P26_VHCLO_CTGTRIA_1',
'        , :P26_VHCLO_CLSE',
'        , :P26_VHCLO_CLSE_1',
'        , :P26_VHCLO_MRCA',
'        , :P26_VHCLO_MRCA_1',
'        , :P26_VHCLO_LNEA',
'        , :P26_VHCLO_LNEA_1',
'        , :P26_CLNDRJE',
'        , :P26_CLNDRJE_1',
'        , :P26_MDLO',
'        , :P26_MDLO_1',
'        , :P26_FCHA_CMPRA',
'        , :P26_FCHA_CMPRA_1',
'        , :P26_FCHA_MTRCLA',
'        , :P26_FCHA_MTRCLA_1',
'        , :P26_FCHA_IMPRTCION',
'        , :P26_FCHA_IMPRTCION_1',
'        , :P26_BLNDDO',
'        , :P26_BLNDDO_1',
'        , :P26_VHCLO_CRRCRIA',
'        , :P26_VHCLO_CRRCRIA_1',
'        , :P26_VHCLO_SRVCIO',
'        , :P26_VHCLO_SRVCIO_1',
'        , :P26_VHCLO_OPRCION',
'        , :P26_VHCLO_OPRCION_1',
'        , :P26_CPCDAD_CRGA',
'        , :P26_CPCDAD_CRGA_1',
'        , :P26_CPCDAD_PSJRO',
'        , :P26_CPCDAD_PSJRO_1',
'        ',
'        -- informacion',
'        , :P26_NMRO_MTOR',
'        , :P26_NMRO_CHSIS ',
'        , :P26_DCLRCION_IMPRTCION',
'        , :P26_NMRO_MTRCLA:',
'        , :P26_AVLUO',
'        , :P26_VLOR_CMRCIAL',
'        , :P26_ORGNSMO_TRNSTO',
'        , :P26_VHCLO_CMBSTBLE',
'        , :P26_VHCLO_TRNSMSION',
'        , :P26_CLSCO_S_N',
'        , :P26_INTRNDO_S_N',
'        ',
'        -- Rodamiento',
'        , :P26_DPRTMNTO',
'        , :P26_MNCPIO',
'        -- Sujeto Impuesto',
'        , :P26_ID_SJTO_IMPSTO',
'     from v_si_i_sujetos_impuesto a',
'     join si_i_vehiculos          b on a.id_sjto_impsto = b.id_sjto_impsto',
'    where a.cdgo_clnte      = :F_CDGO_CLNTE',
'      and a.id_impsto       = :P26_ID_IMPSTO',
'      and a.idntfccion_sjto = :P26_VHCLO_PLCA;',
'      ',
'      :P26_VGNCIA_INCIO_LQDCION := '''';',
'exception',
'        when no_data_found then',
'        ',
'            -- Mensaje de que no se encontraron Datos    ',
'            apex_application.g_print_success_message := ''<span> No se encontraron Datos.</span>'';',
'            ',
'            -- Limpiamos Datos del Vehiculo',
'            :P26_VHCLO_CTGTRIA  := '''';',
'            :P26_VHCLO_CLSE     := '''';',
'            :P26_VHCLO_MRCA     := '''';',
'            :P26_VHCLO_LNEA     := '''';',
'            :P26_CLNDRJE        := '''';',
'            :P26_MDLO           := '''';',
'            :P26_FCHA_CMPRA     := '''';',
'            :P26_FCHA_MTRCLA    := '''';',
'            :P26_FCHA_IMPRTCION := '''';',
'            :P26_BLNDDO         := '''';',
'            :P26_VHCLO_CRRCRIA  := '''';',
'            :P26_VHCLO_SRVCIO   := '''';',
'            :P26_VHCLO_OPRCION  := '''';',
'            :P26_CPCDAD_CRGA    := '''';',
'            :P26_CPCDAD_PSJRO   := '''';          ',
'            ',
'            -- Limpiamos datos para reliquidacion ',
'            :P26_VHCLO_CTGTRIA_1  := '''';',
'            :P26_VHCLO_CLSE_1     := '''';',
'            :P26_VHCLO_MRCA_1     := '''';',
'            :P26_VHCLO_LNEA_1     := '''';',
'            :P26_CLNDRJE_1        := '''';',
'            :P26_MDLO_1           := '''';',
'            :P26_FCHA_CMPRA_1     := '''';',
'            :P26_FCHA_MTRCLA_1    := '''';',
'            :P26_FCHA_IMPRTCION_1 := '''';',
'            :P26_BLNDDO_1         := '''';',
'            :P26_VHCLO_CRRCRIA_1  := '''';',
'            :P26_VHCLO_SRVCIO_1   := '''';',
'            :P26_VHCLO_OPRCION_1  := '''';',
'            :P26_CPCDAD_CRGA_1    := '''';',
'            :P26_CPCDAD_PSJRO_1   := '''';      ',
'            ',
'            -- Limpiamos los datos de informacion',
'            :P26_NMRO_MTOR          := '''';',
'            :P26_NMRO_CHSIS         := '''';',
'            :P26_DCLRCION_IMPRTCION := '''';',
'            :P26_NMRO_MTRCLA        := '''';',
'            :P26_AVLUO              := '''';',
'            :P26_VLOR_CMRCIAL       := '''';',
'            :P26_ORGNSMO_TRNSTO     := '''';',
'            :P26_VHCLO_CMBSTBLE     := '''';',
'            :P26_VHCLO_TRNSMSION    := '''';',
'            :P26_CLSCO_S_N          := '''';',
'            :P26_INTRNDO_S_N        := '''';',
'            ',
'            -- Limpiamos los datos de  Rodamiento',
'            :P26_DPRTMNTO := '''';',
'            :P26_MNCPIO   := '''';',
'            ',
'            -- Limpiamos el sujeto',
'            :P26_ID_SJTO_IMPSTO := '''';',
'            :P26_VGNCIA_INCIO_LQDCION := '''';',
'end; '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'validarPlaca'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91596660844631806)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reliquidar Vigencia Actual '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        v_o_id_lqdcion number;',
'        v_cdgo_rpsta   number;',
'        v_mnsje_rspsta varchar2(4000);',
'',
'begin',
'    -- Up para liquidar    ',
'    pkg_gi_vehiculos.prc_rg_liquidacion_vehiculo_general( p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                          p_id_impsto          => :P26_ID_IMPSTO,',
'                                                          p_id_impsto_sbmpsto  => :P26_ID_IMPSTO_SBIMPSTO,',
'                                                          p_id_sjto_impsto     => :P26_ID_SJTO_IMPSTO,',
'                                                          p_vgncia             => :P26_VGNCIA,',
'                                                          p_id_vhclo_lnea      => :P26_VHCLO_LNEA_1,',
'                                                          p_clndrje            => :P26_CLNDRJE_1,',
'                                                          p_cdgo_vhclo_blndje  => :P26_BLNDDO_1,',
'                                                          p_id_prdo            => :P26_PRDO,',
'                                                          p_cdgo_lqdcion_tpo   => ''LB'',',
'                                                          p_id_usrio           => :F_ID_USRIO,',
'                                                          p_cdgo_prdcdad       => ''ANU'',',
'                                                          p_clse_ctgria        => :P26_VHCLO_CLSE_1,',
'                                                          p_cdgo_vhclo_mrca    => :P26_VHCLO_MRCA_1, ',
'                                                          p_cdgo_vhclo_srvcio  => :P26_VHCLO_SRVCIO_1,',
'                                                          p_cdgo_vhclo_oprcion => :P26_VHCLO_OPRCION_1,',
'                                                          p_cdgo_vhclo_crrcria => :P26_VHCLO_CRRCRIA_1,',
'                                                          p_mdlo               => :P26_MDLO_1, ',
'                                                          o_id_lqdcion        => v_o_id_lqdcion,',
'                                                          o_cdgo_rspsta       => v_cdgo_rpsta,',
'                                                          o_mnsje_rspsta      => v_mnsje_rspsta);',
'                                                          ',
'                        ',
'                                                          ',
'    ',
'    -- Validamos si ocurrio error    ',
'    if v_cdgo_rpsta <> 0 then',
'      raise_application_error(-20000 , v_mnsje_rspsta);',
'    end if;',
'',
'         ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(90991581761206521)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Reliquid\00F3 con \00E9xito.')
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6378369667925110)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar_Region '
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Limpiar'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93239419880357003)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'calcularCilindraje'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        ',
'        cursor c1(R_vgncia          number, ',
'                  R_id_vhclo_lnea   number, ',
'                  R_cdgo_vhclo_mrca varchar2) is          ',
'      select d.clndrje_dsde',
'      from df_s_vehiculos_grupo d',
'      join df_s_vehiculos_linea l on d.id_vhclo_lnea = l.id_vhclo_lnea and d.cdgo_vhclo_mrca = l.cdgo_vhclo_mrca',
'     where d.vgncia               = R_vgncia',
'       and l.id_vhclo_lnea        = R_id_vhclo_lnea',
'       and d.cdgo_vhclo_mrca      = R_cdgo_vhclo_mrca;  ',
'        ',
'        v_clndrje         number;',
'        v_cdgo_vhclo_mrca varchar2(10);',
'        v_id_vhclo_lnea  number;',
'        v_vgncia         number;',
'        ',
'        ',
'begin',
unistr('   --recibiendo los par\00E1metros de ajax'),
'   ',
'   v_vgncia            := apex_application.g_x01;',
'   v_id_vhclo_lnea     := apex_application.g_x02;',
'   v_cdgo_vhclo_mrca   := apex_application.g_x03;',
'',
'    for r1 in c1(v_vgncia,v_id_vhclo_lnea,v_cdgo_vhclo_mrca) loop ',
'            v_clndrje := r1.clndrje_dsde;',
'    end loop; ',
'                                             ',
'',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'' , 0);',
'    apex_json.write(''o_mnsje_rspsta'',''OK Parametros: ''||v_vgncia||'' - ''||v_id_vhclo_lnea||'' - ''||v_cdgo_vhclo_mrca);',
'    apex_json.write(''v_clndrje''     , v_clndrje);',
'    apex_json.close_object();',
'    ',
'exception when no_data_found then',
'',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'' , 1);',
'        apex_json.write(''o_mnsje_rspsta'',''No se encontro Cilindraje'');        ',
'        apex_json.write(''v_id_vhclo_lnea'' , v_id_vhclo_lnea);',
'        apex_json.write(''v_vgncia'' , v_vgncia);',
'        apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100138819451740207)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidarCilindraje'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        ',
'        cursor c1(R_vgncia          number, ',
'                  R_id_vhclo_lnea   number, ',
'                  R_cdgo_vhclo_mrca varchar2) is          ',
'      select d.clndrje_dsde',
'      from df_s_vehiculos_grupo d',
'      join df_s_vehiculos_linea l on d.id_vhclo_lnea = l.id_vhclo_lnea and d.cdgo_vhclo_mrca = l.cdgo_vhclo_mrca',
'     where d.vgncia               = R_vgncia',
'       and l.id_vhclo_lnea        = R_id_vhclo_lnea',
'       and d.cdgo_vhclo_mrca      = R_cdgo_vhclo_mrca;  ',
'        ',
'        v_clndrje         number;',
'        v_cdgo_vhclo_mrca varchar2(10);',
'        v_id_vhclo_lnea  number;',
'        v_vgncia         number;',
'        ',
'        ',
'begin',
unistr('   --recibiendo los par\00E1metros de ajax'),
'   ',
'   v_vgncia            := apex_application.g_x01;',
'   v_id_vhclo_lnea     := apex_application.g_x02;',
'   v_cdgo_vhclo_mrca   := apex_application.g_x03;',
'',
'for r1 in c1(v_vgncia,v_id_vhclo_lnea,v_cdgo_vhclo_mrca) loop ',
'v_clndrje := r1.clndrje_dsde;',
'end loop; ',
'                                             ',
'',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'' , 0);',
'    apex_json.write(''o_mnsje_rspsta'',''OK'');',
'    apex_json.write(''v_clndrje''     , v_clndrje);',
'    apex_json.close_object();',
'    ',
'exception when no_data_found then',
'',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'' , 1);',
'        apex_json.write(''o_mnsje_rspsta'',''No se encontro Cilindraje'');        ',
'        apex_json.write(''v_id_vhclo_lnea'' , v_id_vhclo_lnea);',
'        apex_json.write(''v_vgncia'' , v_vgncia);',
'        apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
