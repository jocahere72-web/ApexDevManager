prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Formulario Declaraci\00F3n')
,p_step_title=>unistr('Formulario Declaraci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.BTN-CONSULTAR{',
'    margin-top: 9px;    ',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JGONZALEZ'
,p_last_upd_yyyymmddhh24miss=>'20231128082038'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20293323665660644)
,p_plug_name=>'Encabezado Formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P21_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33151371301214701)
,p_plug_name=>unistr('Formulario Declaraci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.FORMULARIO_DECLARACION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P21_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P21_MSTRAR_FRMLRIO = ''S'')'
,p_attribute_01=>'P21_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_02=>'P21_ID_DCLRCION'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_07=>'Y'
,p_attribute_08=>'P21_ID_SJTO_IMPSTO'
,p_attribute_09=>'P21_IDNTFCCION'
,p_attribute_10=>'f?p=&APP_ID.:118:&SESSION.::&DEBUG.:RP,118:P118_ID_DCLRCION:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(102738253989994214)
,p_plug_name=>'Seleccion Formulario'
,p_region_name=>'RGION_ARBOL'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-right-lg'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  case',
'            when connect_by_isleaf = 1 then 0',
'            when level = 1 then 1',
'            else -1',
'        end as status, ',
'        level,',
'        lpad('''',(level-1)*5)||descripcion as title, ',
'        case',
'          when substr(cod_hijo, 0, 1) = ''A'' then ''fa-file-text-o''           --Formulario    ',
'          when substr(cod_hijo, 0, 1) in (''B'', ''F'', ''J'') then ''fa-tree-org'' --Carpeta Regiones',
'          when substr(cod_hijo, 0, 1) in (''C'', ''K'') then ''fa-layout-header'' --Regiones',
'          when substr(cod_hijo, 0, 1) in (''D'', ''H'') then ''fa-th-list''       --Carpeta Atributos',
'          when substr(cod_hijo, 0, 1) in (''E'', ''I'') then ''fa-variable''      --Atributos',
'          else ''fa-circle''',
'        end as icon,',
'        vlor as value,',
'        case',
'            when substr(vlor, 0, 1) = ''F'' then     --Formulario',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':21:'' || :APP_SESSION || ''::NO:21:P21_ID_DCLRCION_VGNCIA_FRMLRIO:'' || substr(vlor, 2))',
'            else null    ',
'        end as link',
'from (',
'    --Impuestos',
'    select      ''A''||id_impsto                          as cod_hijo,    null                                as cod_padre,',
'                nmbre_impsto                            as descripcion, ''A''||id_impsto                      as vlor,',
'                0                                       as orden',
'    from        df_c_impuestos',
'    where       cdgo_clnte  =   :F_CDGO_CLNTE',
'    and         actvo       =   ''S''',
'    and         CDGO_IMPSTO =   ''ICA''',
'    union',
'    --SubImpuestos',
'    select      ''B''||id_impsto_sbmpsto                  as cod_hijo,    ''A''||id_impsto                      as cod_padre,',
'                nmbre_impsto_sbmpsto                    as descripcion, ''B''||''B''||id_impsto_sbmpsto         as vlor,',
'                0                                       as orden',
'    from        df_i_impuestos_subimpuesto',
'    where       actvo       =   ''S''',
'    union',
'    --Tipos de declaraciones',
'    select      ''C''||id_dclrcn_tpo                      as cod_hijo,    ''B''||id_impsto_sbmpsto              as cod_padre,',
'                dscrpcion                               as descripcion, ''C''||id_dclrcn_tpo                  as vlor,',
'                0                                       as orden',
'    from        gi_d_declaraciones_tipo',
'    where       actvo       =   ''S''',
'    union',
'    --Vigencias',
'    select      ''D''||id_dclrcn_tpo||vgncia              as cod_hijo,    ''C''||id_dclrcn_tpo                  as cod_padre,',
'                to_char(vgncia)                         as descripcion, ''D''||id_dclrcn_tpo||vgncia          as vlor,',
'                0                                       as orden',
'    from        gi_d_dclrcnes_tpos_vgncias',
'    group by    id_dclrcn_tpo,',
'                vgncia',
'    union',
'    --Periodos',
'    select      ''E''||a.id_dclrcion_tpo_vgncia           as cod_hijo,    ''D''||a.id_dclrcn_tpo||a.vgncia      as cod_padre,',
'                b.prdo||'' ''||b.dscrpcion as descripcion, ''E''||a.id_dclrcion_tpo_vgncia       as vlor,',
'                0                                       as orden',
'    from        gi_d_dclrcnes_tpos_vgncias  a',
'    inner join  df_i_periodos               b   on  b.id_prdo   =   a.id_prdo',
'    where       a.actvo     =   ''S''',
'    union',
'    --Formularios',
'    select      ''F''||a.id_dclrcion_vgncia_frmlrio       as cod_hijo,    ''E''||a.id_dclrcion_tpo_vgncia       as cod_padre,',
'                b.cdgo_frmlrio||''-''||b.dscrpcion        as descripcion, ''F''||a.id_dclrcion_vgncia_frmlrio   as vlor,',
'                0                                       as orden',
'    from        gi_d_dclrcnes_vgncias_frmlr a',
'    inner join  gi_d_formularios            b   on  b.id_frmlrio    =   a.id_frmlrio',
'    where       a.actvo         =   ''S''',
'    and         a.cdgo_vslzcion =   ''T''',
') a',
'start with          cod_padre is null',
'connect by nocycle  prior    cod_hijo = cod_padre',
'order siblings by   orden, descripcion;'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P21_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_02=>'D'
,p_attribute_03=>'P21_ID_DCLRCION'
,p_attribute_04=>'DB'
,p_attribute_08=>'fa'
,p_attribute_10=>'TITLE'
,p_attribute_11=>'LEVEL'
,p_attribute_12=>'ICON'
,p_attribute_15=>'STATUS'
,p_attribute_20=>'VALUE'
,p_attribute_22=>'TITLE'
,p_attribute_23=>'LEVEL'
,p_attribute_24=>'LINK'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114614026016659483)
,p_plug_name=>unistr('B\00FAsqueda Sujeto Tributo')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P21_ID_SJTO_IMPSTO IS NULL AND :P21_ID_DCLRCION_VGNCIA_FRMLRIO IS NOT NULL AND NVL(:P21_MSTRAR_FRMLRIO,''N'') = ''N'')'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45616356964503529)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(114614026016659483)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_css_classes=>'BTN-CONSULTAR'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45616702592503530)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(114614026016659483)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_css_classes=>'BTN-CONSULTAR'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(45620148149512121)
,p_branch_name=>'Ir a Busqueda Sujeto Impuesto'
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP,3:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_VLDAR_CRTRA:&APP_ID.,&APP_PAGE_ID.,P21_ID_SJTO_IMPSTO,&P21_ID_IMPSTO.,S&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(45616702592503530)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20293527698660646)
,p_name=>'P21_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20293323665660644)
,p_prompt=>'Formulario'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion,',
'            a.id_dclrcion_vgncia_frmlrio',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_formularios            b   on  b.id_frmlrio    =   a.id_frmlrio',
'where       a.id_dclrcion_vgncia_frmlrio    =   :P21_ID_DCLRCION_VGNCIA_FRMLRIO;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20293685618660647)
,p_name=>'P21_ID_FRMLRIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20293323665660644)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45594217958478004)
,p_name=>'P21_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(114614026016659483)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45617184039503538)
,p_name=>'P21_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(114614026016659483)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45617578312503539)
,p_name=>'P21_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(114614026016659483)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46664125314019103)
,p_name=>'P21_MSTRAR_FRMLRIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20293323665660644)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122470802629820711)
,p_name=>'P21_ID_DCLRCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20293323665660644)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(46664385241019105)
,p_computation_sequence=>10
,p_computation_item=>'P21_MSTRAR_FRMLRIO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'S'
,p_compute_when=>'P21_ID_SJTO_IMPSTO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46664045795019102)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_indcdor_rgstro_sjto_impsto    varchar2(100);',
'begin',
'    select  id_sjto_impsto',
'    into    :P21_ID_SJTO_IMPSTO',
'    from    v_si_i_sujetos_impuesto',
'    where   cdgo_clnte      =   :F_CDGO_CLNTE',
'    and     id_impsto       =   :P21_ID_IMPSTO',
'    and     idntfccion_sjto =   :P21_IDNTFCCION;',
'    :P21_MSTRAR_FRMLRIO := ''S'';',
'exception',
'    when no_data_found then',
'        --Consultamos la definicion ',
'        v_indcdor_rgstro_sjto_impsto := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => :F_CDGO_CLNTE,',
'																						p_cdgo_dfncion_clnte_ctgria	=> ''DCL'',',
'																						p_cdgo_dfncion_clnte		=> ''RST'');',
'        if (v_indcdor_rgstro_sjto_impsto = ''-1'') then',
'            :P21_MSTRAR_FRMLRIO := ''N'';',
unistr('            raise_application_error(-20001, ''Problemas al consultar la definicion asociada al cliente Categoria:''||''DCL''||'', Definici\00F3n:''||''RST'');'),
'        elsif(v_indcdor_rgstro_sjto_impsto = ''N'')then',
unistr('            raise_application_error(-20001, ''No se hallaron resultados para la identificaci\00F3n digitada.'');'),
'            :P21_MSTRAR_FRMLRIO := ''N'';',
'        else',
'            :P21_MSTRAR_FRMLRIO := ''S'';',
'        end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(45616356964503529)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46663956939019101)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener el impuesto asociado al formulario'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select      c.id_impsto',
'    into        :P21_ID_IMPSTO',
'    from        gi_d_dclrcnes_vgncias_frmlr a',
'    inner join  gi_d_dclrcnes_tpos_vgncias  b on a.id_dclrcion_tpo_vgncia   =   b.id_dclrcion_tpo_vgncia',
'    inner join  gi_d_declaraciones_tipo     c on b.id_dclrcn_tpo            =   c.id_dclrcn_tpo',
'    where       a.id_dclrcion_vgncia_frmlrio = :P21_ID_DCLRCION_VGNCIA_FRMLRIO;',
'end;'))
,p_process_error_message=>'Problemas al consultar el impuesto asociado al formulario, #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P21_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
