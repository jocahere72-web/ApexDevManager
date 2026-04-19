prompt --application/pages/page_00047
begin
wwv_flow_api.create_page(
 p_id=>47
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
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
'        if ($v(''P47_VHCLO_PLCA'') != ''''){',
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
'                        x01: $v(''P47_VGNCIA''),',
'                        x02: $v(''P47_VHCLO_LNEA_1''),',
'                        x03: $v(''P47_VHCLO_MRCA_1'')',
'                    }).then((resp) => {',
'                            console.log(''Respuesta:  '',resp);',
'                            apex.item(''P47_CLNDRJE_1'').setValue(resp.v_clndrje);',
'                    });       ',
'',
'        } catch (e) {',
'            console.log(e);',
'        };',
'',
'    };',
'',
'',
'function validarMotor(){',
'    apex.server.process(',
'        "validarmotor",',
'        {',
'            x01: $v(''P47_NMRO_MTOR_1''),',
'            x02: $v(''P47_CDGO_CLNTE''),',
'            x03: $v(''P47_ID_IMPSTO''),',
'        },',
'        {',
'            success: function(pData){',
'                var data = pData;',
'                if (data.o_cdgo_rspsta != ''0''){',
'                    apex.item(''P47_NMRO_MTOR_1'').setFocus();',
'                    apex.item(''P47_NMRO_MTOR_1'').setValue();',
'                    Swal.fire({ // icon: ''error'',',
unistr('                                title: ''<H2 >Validaci\00F3n</H2>'','),
'                                 html: `<h4>${data.o_mnsje_rspsta}</h4>`',
'                            }).then((result) => {',
'                                    console.log(''Ok'');',
'                                    });                                                  ',
'                ',
'                }',
'            }',
'        }',
'    );',
'}',
'',
'',
'',
'',
'function validarChasis(){',
'    apex.server.process(',
'        "validar_chasis",',
'        {',
'            x01: $v(''P47_NMRO_CHSIS_1''),',
'            x02: $v(''P47_CDGO_CLNTE''),',
'            x03: $v(''P47_ID_IMPSTO''),',
'        },',
'        {',
'            success: function(pData){',
'                var data = pData;',
'                if (data.o_cdgo_rspsta != ''0''){',
'                    apex.item(''P47_NMRO_CHSIS_1'').setFocus();',
'                    apex.item(''P47_NMRO_CHSIS_1'').setValue();',
'                    Swal.fire({ // icon: ''error'',',
unistr('                                title: ''<H2 >Validaci\00F3n</H2>'','),
'                                 html: `<h4>${data.o_mnsje_rspsta}</h4>`',
'                            }).then((result) => {',
'                                    console.log(''Ok'');',
'                                    });                                                  ',
'                ',
'                }',
'            }',
'        }',
'    );',
'}',
'',
'',
'function validarNmroMAtricula(){',
'    apex.server.process(',
'        "validar_nmro_matricula",',
'        {',
'            x01: $v(''P47_NMRO_MTRCLA_1''),',
'            x02: $v(''P47_CDGO_CLNTE''),',
'            x03: $v(''P47_ID_IMPSTO''),',
'        },',
'        {',
'            success: function(pData){',
'                var data = pData;',
'                if (data.o_cdgo_rspsta != ''0''){',
'                    apex.item(''P47_NMRO_MTRCLA_1'').setFocus();',
'                    apex.item(''P47_NMRO_MTRCLA_1'').setValue();',
'                    Swal.fire({ // icon: ''error'',',
unistr('                                title: ''<H2 >Validaci\00F3n</H2>'','),
'                                 html: `<h4>${data.o_mnsje_rspsta}</h4>`',
'                            }).then((result) => {',
'                                    console.log(''Ok'');',
'                                    });                                                  ',
'                ',
'                }',
'            }',
'        }',
'    );',
'}',
'',
'function ValidaCilindrajepuntual(){',
'  console.log(''entrando'');',
'  console.log($v(''P47_VHCLO_LNEA_1''));',
'  console.log($v(''P47_VHCLO_MRCA_1''));',
'   ',
'    try{',
'                apex.server.process(',
'                    ''ValidarCilindraje'',',
'                    {',
'                        x01: 2021, //ojo//',
'                        x02: $v(''P47_VHCLO_LNEA_1''),',
'                        x03: $v(''P47_VHCLO_MRCA_1''),',
'                    }).then((resp) => {',
'                            console.log(''Respuesta:  '',resp);',
'                             apex.item(''P47_CLNDRJE_1'').setValue(resp.v_clndrje);',
'                           ',
'                    });       ',
'',
'        } catch (e) {',
'            console.log(e);',
'        };',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*document.getElementById(''P26_VHCLO_PLCA'').style.fontWeight = "900";',
'document.getElementById(''P26_VHCLO_PLCA'').style.fontSize = "29px"',
'document.getElementById(''P26_VHCLO_PLCA'').style.fontFamily = "Lucida Console";',
'document.getElementById(''P26_VHCLO_PLCA'').style.textAlign = "center";*/',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'RROBLEDO'
,p_last_upd_yyyymmddhh24miss=>'20210331145433'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6823562418603001)
,p_plug_name=>'flujo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108896844244359562)
,p_plug_name=>'TabVehiculo'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(180917930149142233)
,p_plug_name=>unistr('Informaci\00F3n Veh\00EDculo')
,p_parent_plug_id=>wwv_flow_api.id(108896844244359562)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98267329838145203)
,p_plug_name=>unistr('Datos B\00E1sicos ')
,p_parent_plug_id=>wwv_flow_api.id(180917930149142233)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95276235940557886)
,p_plug_name=>'Tabs'
,p_parent_plug_id=>wwv_flow_api.id(98267329838145203)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(182531902048350697)
,p_plug_name=>unistr('Informaci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(95276235940557886)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(182532762332350706)
,p_plug_name=>'Rodamiento'
,p_parent_plug_id=>wwv_flow_api.id(95276235940557886)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108896854059359563)
,p_plug_name=>'Tab Liquidacion'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95278633115557910)
,p_plug_name=>unistr('Datos a Utilizar en Liquidaci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(108896854059359563)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95276307908557887)
,p_plug_name=>unistr(' Liquidaci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(95278633115557910)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(182534376722350722)
,p_plug_name=>unistr('Inicio Liquidaci\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(95278633115557910)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(303507988461832636)
,p_plug_name=>'Datos Adicionales'
,p_parent_plug_id=>wwv_flow_api.id(108896854059359563)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187237386597809283)
,p_plug_name=>'Datos Principales'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88515074654834653)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>3
,p_plug_display_column=>5
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(292102563541644857)
,p_plug_name=>'Opciones'
,p_region_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>' <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(292105881580659880)
,p_plug_name=>'Ayuda'
,p_region_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
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
 p_id=>wwv_flow_api.id(6667990969513375)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_api.id(292102563541644857)
,p_button_name=>'Btn_Reliquidar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reliquidar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_estado number;',
'begin',
'   select w.id_estdo_trnscion',
'     into v_estado',
'     from wf_g_instancias_transicion w',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and w.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'      and w.id_usrio = :F_ID_USRIO;',
'',
'  if v_estado = 3 then ',
'    return false; ',
'    else ',
'    return true; ',
'  end if ;',
'',
'exception',
'        when others then ',
'        null; ',
'    ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-rotate-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7104476646287901)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_api.id(292102563541644857)
,p_button_name=>'Btn_ver_Liquidacion'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Liquidacion'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,50:P50_ID_SJTO_IMPSTO:&P47_ID_SJTO_IMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_estado number;',
'begin',
'   select w.id_estdo_trnscion',
'     into v_estado',
'     from wf_g_instancias_transicion w',
'    where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and w.id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'      and w.id_usrio = :F_ID_USRIO;',
'',
'  if v_estado = 3 then ',
'    return true; ',
'    else ',
'    return false; ',
'  end if ;',
'',
'exception',
'        when others then ',
'        null; ',
'    ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6704636254513477)
,p_branch_name=>unistr('Ir a reliquidaci\00F3n ')
,p_branch_action=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:RP:P48_VGNCIA_INCIO_LQDCION,P48_ID_SJTO_IMPSTO,P48_ID_IMPSTO,P48_ID_IMPSTO_SBMPSTO,P48_CDGO_MRCA,P48_CDGO_CLSE,P48_CDGO_OPRCIO,P48_CDGO_CRRCRIA,P48_CDGO_SRVCIO,P48_MDLO,P48_CDGO_CRRCRIA,P48_VHCLO_CTGTRIA,P48_AVALUO:&P47_VGNCIA_INCIO_LQDCION.,&P47_ID_SJTO_IMPSTO.,&P47_ID_IMPSTO.,&P47_ID_IMPSTO_SBIMPSTO.,&P47_VHCLO_MRCA_1.,&P47_VHCLO_CLSE_1.,&P47_VHCLO_OPRCION_1.,&P47_VHCLO_CRRCRIA_1.,&P47_VHCLO_SRVCIO_1.,&P47_MDLO.,&P47_VHCLO_CRRCRIA_1.,&P47_VHCLO_CTGTRIA_1.,&P47_AVLUO_1.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6667990969513375)
,p_branch_sequence=>20
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P47_VGNCIA_INCIO_LQDCION'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6704230362513471)
,p_branch_name=>unistr('Ir a P\00E1gina 29')
,p_branch_action=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP,29:P29_ID_IMPSTO,P29_ID_IMPSTO_SBMPSTO,P29_ID_SJTO_IMPSTO:&P26_ID_IMPSTO.,&P26_ID_IMPSTO_SBIMPSTO.,&P26_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6667990969513375)
,p_branch_sequence=>30
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6668932918513382)
,p_name=>'P47_VHCLO_CTGTRIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>unistr('Categor\00EDa: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CATEGORIA_VEHICULO3'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CTGTRIA as d,',
'       CDGO_VHCLO_CTGTRIA as r',
'  from DF_S_VEHICULOS_CATEGORIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_VHCLO_CTGTRIA'
,p_ajax_optimize_refresh=>'Y'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6669386569513398)
,p_name=>'P47_VHCLO_CLSE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>'Clase:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion_vhclo_clse as d',
'     , c.cdgo_vhclo_clse      as r',
'  from df_s_vehiculos_clase_ctgria c',
'  join df_s_vehiculos_clase        b on b.cdgo_vhclo_clse = c.cdgo_vhclo_clse',
' where c.cdgo_vhclo_ctgtria = :P47_VHCLO_CTGTRIA'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_VHCLO_CTGTRIA'
,p_ajax_items_to_submit=>'P47_VHCLO_CLSE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6669614956513399)
,p_name=>'P47_VHCLO_MRCA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>'Marca:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select j.dscrpcion_vhclo_mrca,j.cdgo_vhclo_mrca from df_s_vehiculos_marca j',
'where j.mnstrio = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_VHCLO_CTGTRIA'
,p_ajax_items_to_submit=>'P47_VHCLO_MRCA'
,p_ajax_optimize_refresh=>'Y'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6670051986513399)
,p_name=>'P47_VHCLO_LNEA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>'Linea:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion_vhclo_lnea as d',
'        , id_vhclo_lnea        as r',
'     from df_s_vehiculos_linea',
'    where cdgo_vhclo_mrca = :P47_VHCLO_MRCA'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_VHCLO_MRCA'
,p_ajax_items_to_submit=>'P47_VHCLO_MRCA,P47_VHCLO_LNEA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6670476944513399)
,p_name=>'P47_CLNDRJE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>'Cilindraje: '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6670890734513400)
,p_name=>'P47_MDLO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>unistr('A\00F1o Modelo:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS4'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6671212615513401)
,p_name=>'P47_FCHA_CMPRA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>'Fecha de Factura:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_cattributes_element=>' onkeydown="return false" '
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6671689766513402)
,p_name=>'P47_FCHA_MTRCLA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>'Fecha de Matricula:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_cattributes_element=>' onkeydown="return false" '
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6672070150513402)
,p_name=>'P47_FCHA_IMPRTCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>unistr('Fecha de Importaci\00F3n: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6672463703513402)
,p_name=>'P47_BLNDDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>'Blindaje:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_blndje as d',
'     , cdgo_vhclo_blndje      as r',
'  from df_s_vehiculos_blindaje;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_FCHA_MTRCLA'
,p_ajax_items_to_submit=>'P47_FCHA_MTRCLA,P47_BLNDDO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6672847057513402)
,p_name=>'P47_VHCLO_CRRCRIA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>unistr('Carrocer\00EDa: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CARROCERIA3'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CRROCRIA as d,',
'       CDGO_VHCLO_CRRCRIA as r',
'  from DF_S_VEHICULOS_CARROCERIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6673262589513403)
,p_name=>'P47_VHCLO_SRVCIO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>'Servicio: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_SERVICIO_VEHICULOS3'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_SRVCIO  as d,',
'       CDGO_VHCLO_SRVCIO as r',
'  from DF_S_VEHICULOS_SERVICIO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6673695656513404)
,p_name=>'P47_VHCLO_OPRCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>unistr('Operaci\00F3n: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_OPERACION_VEHICULOS3'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_OPRCION as d,',
'       CDGO_VHCLO_OPRCION as r',
'  from DF_S_VEHICULOS_OPERACION',
' order by 1'))
,p_lov_display_null=>'YES'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6674035714513404)
,p_name=>'P47_CPCDAD_CRGA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>'Capacidad de Carga:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6674436153513404)
,p_name=>'P47_CPCDAD_PSJRO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_prompt=>'Capacidad de Pasajeros:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6674832005513404)
,p_name=>'P47_INDCDOR'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6675250135513406)
,p_name=>'P47_ID_IMPSTO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(180917930149142233)
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
 p_id=>wwv_flow_api.id(6676505196513408)
,p_name=>'P47_NMRO_MTOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_prompt=>unistr('N\00FAmero de Motor:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6676959420513408)
,p_name=>'P47_NMRO_CHSIS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_prompt=>unistr('N\00FAmero de Chasis: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6677358644513409)
,p_name=>'P47_DCLRCION_IMPRTCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_prompt=>unistr('N\00FAmero de Importaci\00F3n: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6677789207513409)
,p_name=>'P47_NMRO_MTRCLA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_prompt=>'No. Matricula:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6678101257513414)
,p_name=>'P47_AVLUO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_prompt=>'Valor Factura:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>16
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'')" onkeypress="return  validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6678502207513414)
,p_name=>'P47_VLOR_CMRCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_prompt=>'Valor Comercial:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>16
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroComa'')" onkeypress="return  validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6678964345513414)
,p_name=>'P47_ORGNSMO_TRNSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_prompt=>'Organismo de Transito: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_orgnsmo_trnsto as d',
'     , id_orgnsmo_trnsto    as r',
'  from df_s_organismos_transito'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6679322605513415)
,p_name=>'P47_VHCLO_CMBSTBLE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_prompt=>'Combustible: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_COMBUSTIBLE_VEHICULO3'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhculo_cmbstble as d',
'     , cdgo_vhclo_cmbstble       as r',
'  from df_s_vehiculos_combustible',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6679746930513415)
,p_name=>'P47_VHCLO_TRNSMSION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_prompt=>unistr('Transmisi\00F3n: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TRANSMISION_VEHICULO3'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_trnsmsion as d',
'     , cdgo_vhclo_trnsmsion      as r',
'  from df_s_vehiculos_transmision',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'20%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6680118861513415)
,p_name=>'P47_CLSCO_S_N'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_item_default=>'N'
,p_prompt=>unistr('Cl\00E1sico:')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6680540582513415)
,p_name=>'P47_INTRNDO_S_N'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(182531902048350697)
,p_item_default=>'N'
,p_prompt=>'Internado:'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6681205030513416)
,p_name=>'P47_DPRTMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(182532762332350706)
,p_prompt=>'Departamento: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmbre_dprtmnto as d',
'       , id_dprtmnto    as r ',
'   from df_s_departamentos;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6681691801513416)
,p_name=>'P47_MNCPIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(182532762332350706)
,p_prompt=>'Municipio: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmbre_mncpio as d',
'       , id_mncpio    as r ',
'   from df_s_municipios',
'  where id_dprtmnto = :P47_DPRTMNTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_DPRTMNTO'
,p_ajax_items_to_submit=>'P47_DPRTMNTO,P47_MNCPIO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6682054094513416)
,p_name=>'P47_ASGRDRA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(182532762332350706)
,p_prompt=>'Aseguradora:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_asgrdra as d',
'     , id_asgrdra    as r',
'  from df_s_aseguradoras;'))
,p_lov_display_null=>'YES'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6682401822513417)
,p_name=>'P47_NMRO_SOAT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(182532762332350706)
,p_prompt=>unistr('N\00FAmero P\00F3liza:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6682831026513417)
,p_name=>'P47_FCHA_VNCMNTO_SOAT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(182532762332350706)
,p_prompt=>'Fecha Vencimiento:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" '
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6683837938513419)
,p_name=>'P47_VGNCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95278633115557910)
,p_prompt=>'Vigencia Actual:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6684298847513420)
,p_name=>'P47_PRDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95278633115557910)
,p_prompt=>'Periodo Actual: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo    as d',
'     , id_prdo as r',
'  from df_i_periodos',
' where id_prdo = :P47_PRDO;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6684977221513421)
,p_name=>'P47_VHCLO_CTGTRIA_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_item_default=>'P47_VHCLO_CTGTRIA'
,p_item_default_type=>'ITEM'
,p_prompt=>unistr('Categor\00EDa: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CATEGORIA_VEHICULO3'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CTGTRIA as d,',
'       CDGO_VHCLO_CTGTRIA as r',
'  from DF_S_VEHICULOS_CATEGORIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6685325800513421)
,p_name=>'P47_VHCLO_CLSE_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_item_default=>'P47_VHCLO_CLSE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Clase:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct b.dscrpcion_vhclo_clse as d',
'     , c.cdgo_vhclo_clse  as r',
'  from df_s_vehiculos_clase_ctgria c',
'  join df_s_vehiculos_clase        b on b.cdgo_vhclo_clse = c.cdgo_vhclo_clse',
' where c.cdgo_vhclo_ctgtria = :P47_VHCLO_CTGTRIA_1',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_VHCLO_CTGTRIA_1'
,p_ajax_items_to_submit=>'P47_VHCLO_CLSE_1,P47_VHCLO_CTGTRIA_1'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6685772825513422)
,p_name=>'P47_VHCLO_MRCA_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_item_default=>'P47_VHCLO_MRCA'
,p_item_default_type=>'ITEM'
,p_prompt=>'Marca:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select j.dscrpcion_vhclo_mrca,j.cdgo_vhclo_mrca from df_s_vehiculos_marca j',
'where j.mnstrio = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_VHCLO_CTGTRIA_1,P47_VHCLO_CLSE_1'
,p_ajax_items_to_submit=>'P47_VHCLO_MRCA_1,P47_VHCLO_CLSE_1'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6686172034513422)
,p_name=>'P47_VHCLO_LNEA_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_item_default=>'P47_VHCLO_LNEA'
,p_item_default_type=>'ITEM'
,p_prompt=>'Linea:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l.dscrpcion_vhclo_lnea||'' - [''||d.clndrje_dsde||'']'' as d',
'     , d.id_vhclo_grpo                                      as r',
'  from df_s_vehiculos_grupo d',
'  join df_s_vehiculos_linea l on d.id_vhclo_lnea = l.id_vhclo_lnea',
'  join  df_s_vehiculos_clase_ctgria h  on h.id_vhclo_clse_ctgria = d.id_vhclo_clse_ctgria and h.vgncia =  d.vgncia',
'  and d.cdgo_vhclo_mrca = l.cdgo_vhclo_mrca',
'  where d.vgncia   = extract (year from sysdate)',
'   and h.cdgo_vhclo_clse      = :P47_VHCLO_CLSE_1  ',
'   and h.cdgo_vhclo_ctgtria   = :P47_VHCLO_CTGTRIA_1',
'   and d.cdgo_vhclo_mrca      = :P47_VHCLO_MRCA_1',
'   and l.mnstrio              = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_VHCLO_MRCA_1'
,p_ajax_items_to_submit=>'P47_VHCLO_LNEA_1'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6686549283513423)
,p_name=>'P47_CLNDRJE_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>'Cilindraje: '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>6
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6686982178513423)
,p_name=>'P47_MDLO_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>unistr('A\00F1o Modelo:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_VIGENCIAS4'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6687389821513423)
,p_name=>'P47_FCHA_CMPRA_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>'Fecha de Factura:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cattributes_element=>' onkeydown="return false" '
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6687719445513423)
,p_name=>'P47_FCHA_MTRCLA_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>'Fecha de Matricula:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cattributes_element=>' onkeydown="return false" '
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6688158920513423)
,p_name=>'P47_FCHA_IMPRTCION_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>unistr('Fecha de Importaci\00F3n: ')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>16
,p_tag_attributes=>'ondblclick="this.value=''''"'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6688558057513424)
,p_name=>'P47_BLNDDO_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>'Blindaje:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_blndje as d',
'     , cdgo_vhclo_blndje      as r',
'  from df_s_vehiculos_blindaje;',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_FCHA_MTRCLA_1'
,p_ajax_items_to_submit=>'P47_BLNDDO_1'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6688964394513424)
,p_name=>'P47_VHCLO_CRRCRIA_1'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>unistr('Carrocer\00EDa: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CARROCERIA3'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_CRROCRIA as d,',
'       CDGO_VHCLO_CRRCRIA as r',
'  from DF_S_VEHICULOS_CARROCERIA',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6689320786513424)
,p_name=>'P47_VHCLO_SRVCIO_1'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>'Servicio: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_SERVICIO_VEHICULOS3'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_SRVCIO  as d,',
'       CDGO_VHCLO_SRVCIO as r',
'  from DF_S_VEHICULOS_SERVICIO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6689753001513424)
,p_name=>'P47_VHCLO_OPRCION_1'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>unistr('Operaci\00F3n: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_OPERACION_VEHICULOS3'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_OPRCION as d,',
'       CDGO_VHCLO_OPRCION as r',
'  from DF_S_VEHICULOS_OPERACION',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6690133527513426)
,p_name=>'P47_CPCDAD_CRGA_1'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>'Capacidad de Carga:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6690583337513426)
,p_name=>'P47_CPCDAD_PSJRO_1'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_prompt=>'Capacidad de Pasajeros:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6690992014513427)
,p_name=>'P47_INDCDOR_1'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6691686668513428)
,p_name=>'P47_VGNCIA_INCIO_LQDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(182534376722350722)
,p_prompt=>unistr('Vigencia Inicio de Liquidaci\00F3n:')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select vgncia as d',
'        , vgncia as r',
'     from df_s_vigencias',
'   where vgncia >= nvl(extract (year from(to_date(:P47_FCHA_MTRCLA_1))),extract (year from(to_date(:P47_FCHA_CMPRA))))',
'     -- and vgncia <> :P47_VGNCIA ',
'    order by 1',
'      '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_FCHA_MTRCLA_1,P47_VGNCIA'
,p_ajax_items_to_submit=>'P47_VGNCIA_INCIO_LQDCION'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6692320620513429)
,p_name=>'P47_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(187237386597809283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6692744875513429)
,p_name=>'P47_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(187237386597809283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6693156700513429)
,p_name=>'P47_ID_IMPSTO_SBIMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(187237386597809283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6693559248513430)
,p_name=>'P47_VHCLO_PLCA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(187237386597809283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6823650364603002)
,p_name=>'P47_FECHA_NOVEDAD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(187237386597809283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6823735527603003)
,p_name=>'P47_CDGO_NVDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(187237386597809283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6837843870299801)
,p_name=>'P47_OBSRVCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(187237386597809283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6889084296348823)
,p_name=>'P47_NMRO_MTOR_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>unistr('N\00FAmero de Motor:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letraNumero'')"'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6889439451348828)
,p_name=>'P47_NMRO_CHSIS_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>unistr('N\00FAmero de Chasis: ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_tag_attributes=>'onkeyup="campoMayuscula(this)" onkeypress="return validarExpresion(event, ''letraNumero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6889831139348828)
,p_name=>'P47_DCLRCION_IMPRTCION_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>unistr('Numero Importaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6890299176348828)
,p_name=>'P47_NMRO_MTRCLA_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>'Numero  Matricula'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6890660550348831)
,p_name=>'P47_AVLUO_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>'Valor Factura'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'P47_AVLUO_1'
,p_attribute_02=>'10000000000000'
,p_attribute_03=>'-10000000000000'
,p_attribute_08=>','
,p_attribute_09=>'0'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>','
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6891033199348832)
,p_name=>'P47_VLOR_CMRCIAL_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>'Valor Comercial'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'P47_VLOR_CMRCIAL_1'
,p_attribute_02=>'10000000000000'
,p_attribute_03=>'-10000000000000'
,p_attribute_08=>','
,p_attribute_09=>'0'
,p_attribute_10=>'null'
,p_attribute_11=>'null'
,p_attribute_12=>'null'
,p_attribute_13=>'3'
,p_attribute_14=>','
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6891433193348833)
,p_name=>'P47_ORGNSMO_TRNSTO_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>'Organismo de Transito: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_orgnsmo_trnsto as d',
'     , id_orgnsmo_trnsto    as r',
'  from df_s_organismos_transito'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6891860267348833)
,p_name=>'P47_VHCLO_CMBSTBLE_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>'Combustible: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_COMBUSTIBLE_VEHICULO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhculo_cmbstble as d',
'     , cdgo_vhclo_cmbstble       as r',
'  from df_s_vehiculos_combustible',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6892209497348833)
,p_name=>'P47_VHCLO_TRNSMSION_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>unistr('Transmisi\00F3n: ')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TRANSMISION_VEHICULO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_trnsmsion as d',
'     , cdgo_vhclo_trnsmsion      as r',
'  from df_s_vehiculos_transmision',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6892693684348834)
,p_name=>'P47_CLSCO_S_N_1'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>unistr('Cl\00E1sico:')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6893010631348834)
,p_name=>'P47_INTRNDO_S_N_1'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>'Internado:'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6893499045348834)
,p_name=>'P47_DPRTMNTO_1'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>'Departamento:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmbre_dprtmnto as d',
'       , id_dprtmnto    as r ',
'   from df_s_departamentos;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6893839775348836)
,p_name=>'P47_MNCPIO_1'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_prompt=>'Municipio: '
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmbre_mncpio as d',
'       , id_mncpio    as r ',
'   from df_s_municipios',
'  where id_dprtmnto = :P47_DPRTMNTO_1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_DPRTMNTO_1'
,p_ajax_items_to_submit=>'P47_DPRTMNTO_1,P47_MNCPIO_1'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6894223483348836)
,p_name=>'P47_FECHA_NOVEDAD_1'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(303507988461832636)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8028224780128401)
,p_name=>'P47_RSPTA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(95276307908557887)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6694459750513440)
,p_computation_sequence=>10
,p_computation_item=>'P47_CDGO_CLNTE'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_CDGO_CLNTE'
,p_compute_when=>'P47_CDGO_CLNTE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6694073811513436)
,p_computation_sequence=>20
,p_computation_item=>'P47_ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(6695622729513441)
,p_computation_sequence=>30
,p_computation_item=>'P47_ID_IMPSTO_SBIMPSTO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P47_ID_IMPSTO'))
,p_compute_when=>'P47_ID_IMPSTO_SBIMPSTO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6694809659513440)
,p_computation_sequence=>40
,p_computation_item=>'P47_VGNCIA'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return extract(year from sysdate) ;',
'',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6695275039513441)
,p_computation_sequence=>50
,p_computation_item=>'P47_PRDO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prdo',
'  from df_i_periodos',
' where cdgo_clnte        = :F_CDGO_CLNTE',
'   and id_impsto         = :P47_ID_IMPSTO',
'   and id_impsto_sbmpsto = :P47_ID_IMPSTO_SBIMPSTO',
'   and vgncia            = :P47_VGNCIA;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6696446238513447)
,p_validation_name=>'Categoria no nula'
,p_validation_sequence=>10
,p_validation=>'P47_VHCLO_CTGTRIA_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(6667990969513375)
,p_associated_item=>wwv_flow_api.id(6684977221513421)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6696872843513449)
,p_validation_name=>'Clase no nula'
,p_validation_sequence=>20
,p_validation=>'P47_VHCLO_CLSE_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(6667990969513375)
,p_associated_item=>wwv_flow_api.id(6685325800513421)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6697236667513449)
,p_validation_name=>'Marca no nula'
,p_validation_sequence=>30
,p_validation=>'P47_VHCLO_MRCA_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(6667990969513375)
,p_associated_item=>wwv_flow_api.id(6685772825513422)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6697661177513449)
,p_validation_name=>'Linea no nula'
,p_validation_sequence=>40
,p_validation=>'P47_VHCLO_LNEA_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(6667990969513375)
,p_associated_item=>wwv_flow_api.id(6686172034513422)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6698063645513450)
,p_validation_name=>'Cilidraje no nulo'
,p_validation_sequence=>50
,p_validation=>'P47_CLNDRJE_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(6667990969513375)
,p_associated_item=>wwv_flow_api.id(6686549283513423)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6698438084513450)
,p_validation_name=>'Modelo no nulo'
,p_validation_sequence=>60
,p_validation=>'P47_MDLO_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(6667990969513375)
,p_associated_item=>wwv_flow_api.id(6686982178513423)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6698843165513450)
,p_validation_name=>'fecha compra no nula'
,p_validation_sequence=>70
,p_validation=>'P47_FCHA_CMPRA_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(6667990969513375)
,p_associated_item=>wwv_flow_api.id(6687389821513423)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6699227672513450)
,p_validation_name=>'Fecha matricula no nula'
,p_validation_sequence=>80
,p_validation=>'P47_FCHA_MTRCLA_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(6667990969513375)
,p_associated_item=>wwv_flow_api.id(6687719445513423)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6699648058513450)
,p_validation_name=>'Blindaje no nulo'
,p_validation_sequence=>90
,p_validation=>'P47_BLNDDO_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor.')
,p_when_button_pressed=>wwv_flow_api.id(6667990969513375)
,p_associated_item=>wwv_flow_api.id(6688558057513424)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6696029939513442)
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
'       and id_impsto                 = :P47_ID_IMPSTO',
'       and idntfccion_sjto           = :P47_VHCLO_PLCA',
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
 p_id=>wwv_flow_api.id(7486046096126101)
,p_validation_name=>'Validacion_inicio_Liquidacion'
,p_validation_sequence=>130
,p_validation=>'P47_VGNCIA_INCIO_LQDCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# Debe Seleccionar una vigencia de liquidacion.'
,p_when_button_pressed=>wwv_flow_api.id(6667990969513375)
,p_associated_item=>wwv_flow_api.id(6691686668513428)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6702389795513455)
,p_name=>unistr('Refrescar Liquidaci\00F3n ')
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6702841153513458)
,p_event_id=>wwv_flow_api.id(6702389795513455)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(95278633115557910)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6703216241513470)
,p_name=>'calcular_cilindraje'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_VHCLO_LNEA_1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6703774283513470)
,p_event_id=>wwv_flow_api.id(6703216241513470)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'ValidaCilindrajepuntual()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8028549872128404)
,p_name=>'valida_numero_motor'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_NMRO_MTOR_1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8028672332128405)
,p_event_id=>wwv_flow_api.id(8028549872128404)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarMotor()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8555724289088602)
,p_name=>'validar _numero _chasis'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_NMRO_CHSIS_1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8555839479088603)
,p_event_id=>wwv_flow_api.id(8555724289088602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarChasis(); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8556022210088605)
,p_name=>'validar_numero_matricula'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_NMRO_MTRCLA_1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8556107488088606)
,p_event_id=>wwv_flow_api.id(8556022210088605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarNmroMAtricula(); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6700750753513451)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
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
'       -- , b.id_vhclo_lnea',
'     ,  (select li.dscrpcion_vhclo_lnea  from df_s_vehiculos_linea li ',
'            where li.id_vhclo_lnea = b.id_vhclo_lnea)   as id_vhclo_lnea',
'        , b.clndrje  ',
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
'        , b.nmro_mtor',
'        , b.nmro_chsis',
'        , b.nmro_chsis',
'        , b.nmro_dclrcion_imprtcion',
'        ,b.nmro_dclrcion_imprtcion',
'        , b.nmro_mtrcla',
'        , b.nmro_mtrcla',
'        , b.avluo',
'        , b.avluo',
'        , b.vlor_cmrcial',
'        , b.vlor_cmrcial',
'        , b.id_orgnsmo_trnsto',
'        , b.id_orgnsmo_trnsto',
'        , b.cdgo_vhclo_cmbstble',
'        , b.cdgo_vhclo_cmbstble',
'        , b.cdgo_vhclo_trnsmsion',
'        , b.cdgo_vhclo_trnsmsion',
'        , b.indcdor_clsco',
'        , b.indcdor_clsco',
'        , b.indcdor_intrndo',
'        , b.indcdor_intrndo',
'        -- Rodamiento',
'        , a.id_dprtmnto',
'        , a.id_dprtmnto',
'        , a.id_mncpio',
'        , a.id_mncpio',
'        ',
'        -- sujeto impuesto',
'        , b.id_sjto_impsto',
'        ',
'     into :P47_VHCLO_CTGTRIA',
'        , :P47_VHCLO_CTGTRIA_1',
'        , :P47_VHCLO_CLSE',
'        , :P47_VHCLO_CLSE_1',
'        , :P47_VHCLO_MRCA',
'        , :P47_VHCLO_MRCA_1',
'       , :P47_VHCLO_LNEA',
'        , :P47_VHCLO_LNEA_1',
'        , :P47_CLNDRJE',
'        , :P47_CLNDRJE_1',
'        , :P47_MDLO',
'        , :P47_MDLO_1',
'        , :P47_FCHA_CMPRA',
'        , :P47_FCHA_CMPRA_1',
'        , :P47_FCHA_MTRCLA',
'        , :P47_FCHA_MTRCLA_1',
'        , :P47_FCHA_IMPRTCION',
'        , :P47_FCHA_IMPRTCION_1',
'        , :P47_BLNDDO',
'        , :P47_BLNDDO_1',
'        , :P47_VHCLO_CRRCRIA',
'        , :P47_VHCLO_CRRCRIA_1',
'        , :P47_VHCLO_SRVCIO',
'        , :P47_VHCLO_SRVCIO_1',
'        , :P47_VHCLO_OPRCION',
'        , :P47_VHCLO_OPRCION_1',
'        , :P47_CPCDAD_CRGA',
'        , :P47_CPCDAD_CRGA_1',
'        , :P47_CPCDAD_PSJRO',
'        , :P47_CPCDAD_PSJRO_1',
'        ',
'        -- informacion',
'        , :P47_NMRO_MTOR',
'        , :P47_NMRO_MTOR_1',
'        , :P47_NMRO_CHSIS ',
'        , :P47_NMRO_CHSIS_1 ',
'        , :P47_DCLRCION_IMPRTCION',
'        , :P47_DCLRCION_IMPRTCION_1',
'        , :P47_NMRO_MTRCLA',
'        , :P47_NMRO_MTRCLA_1',
'        , :P47_AVLUO',
'        , :P47_AVLUO_1',
'        , :P47_VLOR_CMRCIAL',
'        , :P47_VLOR_CMRCIAL_1',
'        , :P47_ORGNSMO_TRNSTO',
'        , :P47_ORGNSMO_TRNSTO_1',
'        , :P47_VHCLO_CMBSTBLE',
'        , :P47_VHCLO_CMBSTBLE_1',
'        , :P47_VHCLO_TRNSMSION',
'        , :P47_VHCLO_TRNSMSION_1',
'        , :P47_CLSCO_S_N',
'        , :P47_CLSCO_S_N_1',
'        , :P47_INTRNDO_S_N',
'        , :P47_INTRNDO_S_N_1',
'        ',
'        -- Rodamiento',
'        , :P47_DPRTMNTO',
'        , :P47_DPRTMNTO_1',
'        , :P47_MNCPIO',
'        , :P47_MNCPIO_1',
'        -- Sujeto Impuesto',
'        , :P47_ID_SJTO_IMPSTO',
'     from v_si_i_sujetos_impuesto a',
'     join si_i_vehiculos          b on a.id_sjto_impsto = b.id_sjto_impsto',
'    where a.cdgo_clnte      = :F_CDGO_CLNTE',
'      and a.id_impsto       = :P47_ID_IMPSTO',
'      and a.id_sjto_impsto   =:P47_ID_SJTO_IMPSTO;',
'    --  and a.idntfccion_sjto = :P47_VHCLO_PLCA;',
'',
'      :P47_VGNCIA_INCIO_LQDCION := '''';',
'       :P47_RSPTA:= ''N'';',
'exception',
'        when no_data_found then',
'        ',
'            -- Mensaje de que no se encontraron Datos    ',
'            apex_application.g_print_success_message := ''<span> No se encontraron Datos.</span>'';',
'            ',
'            -- Limpiamos Datos del Vehiculo',
'            :P47_VHCLO_CTGTRIA  := '''';',
'            :P47_VHCLO_CLSE     := '''';',
'            :P47_VHCLO_MRCA     := '''';',
'            :P47_VHCLO_LNEA     := '''';',
'            :P47_CLNDRJE        := '''';',
'            :P47_MDLO           := '''';',
'            :P47_FCHA_CMPRA     := '''';',
'            :P47_FCHA_MTRCLA    := '''';',
'            :P47_FCHA_IMPRTCION := '''';',
'            :P47_BLNDDO         := '''';',
'            :P47_VHCLO_CRRCRIA  := '''';',
'            :P47_VHCLO_SRVCIO   := '''';',
'            :P47_VHCLO_OPRCION  := '''';',
'            :P47_CPCDAD_CRGA    := '''';',
'            :P47_CPCDAD_PSJRO   := '''';          ',
'            ',
'            -- Limpiamos datos para reliquidacion ',
'            :P47_VHCLO_CTGTRIA_1  := '''';',
'            :P47_VHCLO_CLSE_1     := '''';',
'            :P47_VHCLO_MRCA_1     := '''';',
'            :P47_VHCLO_LNEA_1     := '''';',
'            :P47_CLNDRJE_1        := '''';',
'            :P47_MDLO_1           := '''';',
'            :P47_FCHA_CMPRA_1     := '''';',
'            :P47_FCHA_MTRCLA_1    := '''';',
'            :P47_FCHA_IMPRTCION_1 := '''';',
'            :P47_BLNDDO_1         := '''';',
'            :P47_VHCLO_CRRCRIA_1  := '''';',
'            :P47_VHCLO_SRVCIO_1   := '''';',
'            :P47_VHCLO_OPRCION_1  := '''';',
'            :P47_CPCDAD_CRGA_1    := '''';',
'            :P47_CPCDAD_PSJRO_1   := '''';      ',
'            ',
'            -- Limpiamos los datos de informacion',
'            :P47_NMRO_MTOR          := '''';',
'            :P47_NMRO_CHSIS         := '''';',
'            :P47_DCLRCION_IMPRTCION := '''';',
'            :P47_NMRO_MTRCLA        := '''';',
'            :P47_AVLUO              := '''';',
'            :P47_VLOR_CMRCIAL       := '''';',
'            :P47_ORGNSMO_TRNSTO     := '''';',
'            :P47_VHCLO_CMBSTBLE     := '''';',
'            :P47_VHCLO_TRNSMSION    := '''';',
'            :P47_CLSCO_S_N          := '''';',
'            :P47_INTRNDO_S_N        := '''';',
'            ',
'            -- Limpiamos los datos de  Rodamiento',
'            :P47_DPRTMNTO := '''';',
'            :P47_MNCPIO   := '''';',
'            ',
'            -- Limpiamos el sujeto',
'            :P47_ID_SJTO_IMPSTO := '''';',
'            :P47_VGNCIA_INCIO_LQDCION := '''';',
'end; '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6701153808513452)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reliquidar Vigencia Actual '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        v_o_id_lqdcion number;',
'        v_cdgo_rpsta   number;',
'        v_mnsje_rspsta varchar2(4000);',
'        v_vhclo_lnea   number; ',
'        v_error        exception;',
'begin',
'    ',
'/* proceso de novedades */',
'/*   insert into muerto(v_001)  values(''Entrando a al proceso de registro de novedades''); ',
'   commit; */',
'   v_cdgo_rpsta:= 1; ',
'',
'',
'/*insert into muerto(v_001) values(''Registrar linea con validacion ''|| v_vhclo_lnea ||''-''||:P47_VHCLO_LNEA_1); commit; */',
'      ',
'pkg_gi_vehiculos.prc_vl_nvdds_vhclos(p_id_sjto_impsto      => :P47_ID_SJTO_IMPSTO,',
'                                     p_vhclo_clse          => :P47_VHCLO_CLSE_1,',
'                                     p_vhclo_mrca          => :P47_VHCLO_MRCA_1,',
'                                     p_vhclo_lnea          => :P47_VHCLO_LNEA_1,',
'                                     p_clndrje             => :P47_CLNDRJE_1,',
'                                     p_mdlo                => :P47_MDLO_1,',
'                                     p_fcha_cmpra          => :P47_FCHA_CMPRA_1,',
'                                     p_fcha_mtrcla         => :P47_FCHA_MTRCLA_1,',
'                                     p_fcha_imprtcion      => :P47_FCHA_IMPRTCION_1,',
'                                     p_blnddo              => :P47_BLNDDO_1,',
'                                     p_vhclo_crrcria       => :P47_VHCLO_CRRCRIA_1,',
'                                     p_vhclo_srvcio        => :P47_VHCLO_SRVCIO_1,',
'                                     p_vhclo_oprcion       => :P47_VHCLO_OPRCION_1,',
'                                     p_cpcdad_crga         => :P47_CPCDAD_CRGA_1,',
'                                     p_cpcdad_psjro        => :P47_CPCDAD_PSJRO_1,',
'                                     p_nmro_mtor           => :P47_NMRO_MTOR_1,',
'                                     p_nmro_chsis          => :P47_NMRO_CHSIS_1,',
'                                     p_dclrcion_imprtcion  => :P47_DCLRCION_IMPRTCION_1,',
'                                     p_nmro_mtrcla         => :P47_NMRO_MTRCLA_1,',
'                                     p_avluo               => :P47_AVLUO_1,',
'                                     p_vlor_cmrcial        => :P47_VLOR_CMRCIAL_1,',
'                                     p_orgnsmo_trnsto      => :P47_ORGNSMO_TRNSTO_1,',
'                                     p_vhclo_cmbstble      => :P47_VHCLO_CMBSTBLE_1,',
'                                     p_vhclo_trnsmsion     => :P47_VHCLO_TRNSMSION_1,',
'                                     p_clsco_s_n           => :P47_CLSCO_S_N_1,',
'                                     p_intrndo_s_n         => :P47_INTRNDO_S_N_1,',
'                                     p_dprtmnto            => :P47_DPRTMNTO_1,',
'                                     p_mncpio              => :P47_MNCPIO_1,',
'                                     p_cdgo_nvda           => :P47_CDGO_NVDA,',
'                                     p_fcha_nvvdad         => :P47_FECHA_NOVEDAD,',
'                                     o_cdgo_rspsta         => v_cdgo_rpsta,',
'                                     o_mnsje_rspsta        => v_mnsje_rspsta);',
'                                     ',
'            :P47_RSPTA:= ''S''; ',
'                                    ',
'                                 /*   APEX_UTIL.SET_SESSION_STATE(''P47_RSPTA'',''S'');*/',
'                                  ',
'                /* insert into muerto(v_001)  values(''saliendo del proceso de registro de novedades''||v_mnsje_rspsta); */ ',
'end ; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6667990969513375)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6700318463513451)
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
 p_id=>wwv_flow_api.id(6701508335513452)
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
 p_id=>wwv_flow_api.id(6701908236513453)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidarCilindraje'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        ',
'    cursor c1 (R_id_vhclo_grpo in number)is         ',
'       select d.clndrje_dsde',
'      from df_s_vehiculos_grupo d',
'       where d.id_vhclo_grpo = R_id_vhclo_grpo; ',
'      ',
'        v_clndrje         number;',
'        v_cdgo_vhclo_mrca varchar2(10);',
'        v_id_vhclo_lnea  number;',
'        v_vgncia         number;',
'           ',
'begin',
unistr('   --recibiendo los par\00E1metros de ajax'),
'   ',
'  -- v_vgncia            := apex_application.g_x01;',
'   v_id_vhclo_lnea     := apex_application.g_x02;',
'---   v_cdgo_vhclo_mrca   := apex_application.g_x03;',
'',
'    for r1 in c1(v_id_vhclo_lnea) loop ',
'            v_clndrje := r1.clndrje_dsde;',
'    end loop;                                 ',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8028449762128403)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validarmotor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_mtor        varchar2(4000) := APEX_APPLICATION.g_x01;',
'    v_clnte            number         := APEX_APPLICATION.g_x02;',
'    v_id_impsto        number         := APEX_APPLICATION.g_x03;',
'    o_cdgo_rspsta      number         := 0;',
'    o_mnsje_rspsta     varchar2(4000);',
'begin',
'    o_mnsje_rspsta := pkg_gi_vehiculos.fnc_co_vehiculo_nmro_mtor (p_cdgo_clnte => v_clnte,',
'                                                                  p_id_impsto  => v_id_impsto,',
'                                                                  p_nmro_mtor  => v_nmro_mtor);    ',
'        ',
'    if o_mnsje_rspsta is not null  then        ',
'        o_cdgo_rspsta  := 1;        ',
'    end if;        ',
'    ',
'    -- Abrimos objeto json',
'    apex_json.open_object;',
'    -- Adicionamos datos al json',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    -- Cerramos objeto json',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8555664138088601)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validar_chasis'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_chasis      varchar2(4000) := APEX_APPLICATION.g_x01;',
'    v_clnte            number         := APEX_APPLICATION.g_x02;',
'    v_id_impsto        number         := APEX_APPLICATION.g_x03;',
'    o_cdgo_rspsta      number         := 0;',
'    o_mnsje_rspsta     varchar2(4000);',
'begin',
'    o_mnsje_rspsta :=  pkg_gi_vehiculos.fnc_co_vehiculo_nmro_chsis(p_cdgo_clnte => v_clnte,',
'                                                                   p_id_impsto =>  v_id_impsto,',
'                                                                   p_nmro_chsis => v_nmro_chasis);',
'    ',
'    if o_mnsje_rspsta is not null  then        ',
'        o_cdgo_rspsta  := 1;        ',
'    end if;        ',
'    ',
'    -- Abrimos objeto json',
'    apex_json.open_object;',
'    -- Adicionamos datos al json',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    -- Cerramos objeto json',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8555999015088604)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validar_nmro_matricula'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_nmro_mtrcla      varchar2(4000) := APEX_APPLICATION.g_x01;',
'    v_clnte            number         := APEX_APPLICATION.g_x02;',
'    v_id_impsto        number         := APEX_APPLICATION.g_x03;',
'    o_cdgo_rspsta      number         := 0;',
'    o_mnsje_rspsta     varchar2(4000);',
'begin',
'    o_mnsje_rspsta :=  pkg_gi_vehiculos.fnc_co_vehiculo_nmro_mtrcla(p_cdgo_clnte => v_clnte,',
'                                                          p_id_impsto => v_id_impsto,',
'                                                          p_nmro_mtrcla => v_nmro_mtrcla);',
'    if o_mnsje_rspsta is not null  then        ',
'        o_cdgo_rspsta  := 1;        ',
'    end if;        ',
'    ',
'    -- Abrimos objeto json',
'    apex_json.open_object;',
'    -- Adicionamos datos al json',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    -- Cerramos objeto json',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
