prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>unistr('Medio de Envi\00F3 Programado')
,p_step_title=>unistr('Medio de Envi\00F3 Programado')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function drag(ev) {',
'   ev.dataTransfer.setData("text", $(ev.target).data(''valor''));',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var acc = document.getElementsByClassName("accordion");',
'var i; ',
'for (i = 0; i < acc.length; i++) {',
'  acc[i].addEventListener("click", function() {',
'    this.classList.toggle("active");',
'    var panel = this.nextElementSibling;    ',
'    if (panel.style.maxHeight){',
'      panel.style.maxHeight = null;',
'    } else {',
'      panel.style.maxHeight = panel.scrollHeight + "px";',
'    } ',
'  });',
'}',
'',
'$(''.column'').hover(function(){',
'    var  content = `<div>${$(this).data(''tooltip'')} </div>`;',
'    $(this).tooltipster({',
'        contentAsHTML: true,',
'        interactive: true,',
'        theme: ''tooltipster-shadow'',//''tooltipster-light'',',
'        animation: ''fade'',',
'        delay: [100, 1000]',
'        }).tooltipster(''content'', content).tooltipster(''open'');',
'}, function () {$(this).tooltipster(''close'');});'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-light.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-punk.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-noir.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.BTN_CARGAR_PLANTILLA{',
'    margin-top: 30px;',
'}',
'',
'.accordion {',
'    background-color: #eee;',
'    color: #444;',
'    cursor: pointer;',
'    padding: 5px;',
'    width: 100%;',
'    border: 1px solid #eee;',
'    text-align: left;',
'    border-radius: 5px;',
'    outline: none;',
'    font-size: 12px;',
'    transition: 0.4s;',
'    margin-bottom: 4px;',
'}',
'',
'.active, .accordion:hover {',
'    background-color: #ccc;',
'}',
'',
'.accordion:after {',
'    content: ''\002B'';',
'    color: #777;',
'    font-weight: bold;',
'    float: right;',
'    margin-right: 4px;',
'}',
'',
'.active:after {',
'    content: "\2212";',
'}',
'',
'.panel {',
'    padding: 0 8px;',
'    background-color: white;',
'    max-height: 0;',
'    overflow: hidden;',
'    transition: max-height 0.6s ease-out;',
'}',
'',
'#varlist, #columnslist {',
'    list-style-type: none;',
'    margin: 0 !important;',
'    padding: 0;',
'}',
'#varlist li, #columnslist li {',
'    background: #c4ced724;',
'    border: 1px solid #c4ced724;',
'    border-radius: 5px;',
'    margin-bottom: 5px;',
'    height: 25px;',
'    line-height: 25px;',
'    cursor: move;',
'}',
'#varlist li:nth-child(2n), #columnslist li:nth-child(2n) {',
'    background: #c4ced7c9;',
'    border: 1px solid #c4ced7c9;',
'}',
'#varlist li:hover, #columnslist li:hover {',
'    background: #FFFDE3;',
'    border-left: 5px solid #DCDAC1;',
'    margin-left: -5px; ',
'}',
'.column {',
'    padding: 0 20px;',
'    white-space: nowrap;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}'))
,p_step_template=>wwv_flow_api.id(71592158849187941)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5645043626637214)
,p_plug_name=>'Medio'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5645969179637223)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Opciones <i class="fa fa-gear" aria-hidden="true"></i></center></b></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5647115225637235)
,p_plug_name=>'Preferencias'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71613067978187954)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Consultamos si el medio seleccionado tiene preferencias*/',
'declare',
'    v_exist_parametros_preferencia number := 0;',
'    v_vlor varchar2(500);',
'begin',
'    select count(b.id_envio_mdio_cnfgrcion_pf)',
'    into v_exist_parametros_preferencia',
'    from ma_d_envios_medio_cnfgrcion a',
'    inner join ma_d_envios_mdio_cnfgrcn_pf b on a.id_envio_mdio_cnfgrcion = b.id_envio_mdio_cnfgrcion',
'    where a.cdgo_clnte = :F_CDGO_CLNTE and',
'          a.cdgo_envio_mdio = :P13_CDGO_ENVIO_MDIO and',
'          a.actvo = ''S'' and',
'          b.actvo = ''S'';',
'    if(v_exist_parametros_preferencia < 1)then',
'        htp.p(''<center><h5>No hay preferencias disponibles para el medio seleccionado.</h5><center>'');',
'    else',
'        /*Recoremos las preferencias*/',
'        for c_preferencia in (select b.*',
'                              from ma_d_envios_medio_cnfgrcion a',
'                              inner join ma_d_envios_mdio_cnfgrcn_pf b on a.id_envio_mdio_cnfgrcion = b.id_envio_mdio_cnfgrcion',
'                              where a.cdgo_clnte = :F_CDGO_CLNTE and',
'                                    a.cdgo_envio_mdio = :P13_CDGO_ENVIO_MDIO and',
'                                    a.actvo = ''S'' and',
'                                    b.actvo = ''S''',
'                              order by b.orden asc)loop',
'            --Consultamos si existe la preferencia',
'            begin',
'                select vlor',
'                into v_vlor',
'                from ma_g_envios_prgrmdo_mdio_pf',
'                where id_envio_prgrmdo_mdio = :P13_ID_ENVIO_PRGRMDO_MDIO and',
'                      id_envio_mdio_cnfgrcion_pf = c_preferencia.id_envio_mdio_cnfgrcion_pf;',
'            exception',
'                when no_data_found then',
'                    v_vlor := null;',
'            end;',
'            --Validamos el tipo de parametro',
'            case c_preferencia.prmtro_tpo',
'                when ''TXT'' then',
'                    htp.p(',
'                        ''<label for="''||''INP''||c_preferencia.id_envio_mdio_cnfgrcion_pf||''" style="padding: 5px;">''||c_preferencia.nmbre||''</label>''||',
'                        case c_preferencia.indcdor_rqrdo when ''S'' then ''<span style="color:red;">* </span>'' else '''' end||',
'                        apex_item.text(',
'                            p_idx        => 1,',
'                            p_value      => v_vlor,',
'                            p_attributes => null,',
'                            p_item_id    => ''INP''||c_preferencia.id_envio_mdio_cnfgrcion_pf,',
'                            p_item_label => c_preferencia.nmbre',
'                        )',
'                    );',
'                when ''LOV'' then',
'                   htp.p(',
'                        ''<label for="''||''INP''||c_preferencia.id_envio_mdio_cnfgrcion_pf||''" style="padding: 5px;">''||c_preferencia.nmbre||''</label>''||',
'                        case c_preferencia.indcdor_rqrdo when ''S'' then ''<span style="color:red;">* </span>'' else '''' end||',
'                        case c_preferencia.orgen_tpo',
'                           when ''E'' then',
'                               apex_item.select_list(',
'                                   p_idx           => 1,',
'                                   p_value         => v_vlor,',
'                                   p_list_values   => c_preferencia.orgen,',
'                                   p_attributes    => null,',
'                                   p_show_null     => ''YES'',',
'                                   p_null_value    => null,',
'                                   p_null_text     => ''Seleccione'',',
'                                   p_item_id       => ''INP''||c_preferencia.id_envio_mdio_cnfgrcion_pf,',
'                                   p_item_label    => c_preferencia.nmbre,',
'                                   p_show_extra    => null',
'                               )',
'                           when ''S'' then',
'                               apex_item.select_list_from_query_xl(',
'                                   p_idx           => 1,',
'								   p_value         => v_vlor,',
'								   p_query         => c_preferencia.orgen,',
'								   p_attributes    => null,',
'								   p_show_null     => ''YES'',',
'								   p_null_value    => null,',
'								   p_null_text     => ''Seleccione'',',
'								   p_item_id       => ''INP''||c_preferencia.id_envio_mdio_cnfgrcion_pf,',
'								   p_item_label    => c_preferencia.nmbre,',
'								   p_show_extra    => null)',
'                       end',
'                    );',
'            end case;',
'            ',
'        end loop;',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P13_CDGO_ENVIO_MDIO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13047560580893340)
,p_plug_name=>'Mensaje'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13047610034893341)
,p_plug_name=>'Columnas'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71602665844187947)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13047711392893342)
,p_plug_name=>'Columnas disponibles'
,p_parent_plug_id=>wwv_flow_api.id(13047610034893341)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   c_clmnas         integer;',
'   v_dscrpcion_tbla dbms_sql.desc_tab2;',
'   v_nmro_clmna     integer;  ',
'   v_sql            clob;',
'   v_rt_ma_g_envios_prgrmdo_cnslta    ma_g_envios_prgrmdo_cnslta%rowtype;',
'   ',
'   ',
'   v_id_envio_prgrmd_cnslta_prncpal number;',
'begin',
'    c_clmnas := dbms_sql.open_cursor;',
'    htp.p(''<div class="columns"> <ul id="columnslist">'');',
'    ',
'    --Consultamos la consulta principal',
'    begin',
'        select id_envio_prgrmd_cnslta_prncpal',
'        into v_id_envio_prgrmd_cnslta_prncpal',
'        from ma_g_envios_programado',
'        where id_envio_prgrmdo = :P13_ID_ENVIO_PRGRMDO;',
'    exception',
'        when others then',
'            raise_application_error(-20001,''error:''||sqlerrm);',
'    end;',
'    ',
'    --Obtenemos la consulta',
'    begin',
'        select *',
'        into v_rt_ma_g_envios_prgrmdo_cnslta',
'        from ma_g_envios_prgrmdo_cnslta',
'        where id_envio_prgrmdo_cnslta = v_id_envio_prgrmd_cnslta_prncpal;',
'        ',
'        --Validamos el origen de la consulta',
'        if(v_rt_ma_g_envios_prgrmdo_cnslta.id_cnslta_mstro is not null)then',
'            v_sql := pkg_cs_constructorsql.fnc_co_sql_dinamica(p_id_cnslta_mstro => v_rt_ma_g_envios_prgrmdo_cnslta.id_envio_prgrmdo_cnslta, ',
'                                                               p_cdgo_clnte      => :F_CDGO_CLNTE, ',
'                                                               p_rturn_alias     => ''S'');',
'        else',
'            v_sql := v_rt_ma_g_envios_prgrmdo_cnslta.cnslta;',
'        end if;',
'        ',
'        dbms_sql.parse( c_clmnas, v_sql , dbms_sql.native );',
'        dbms_sql.describe_columns2( c_clmnas, v_nmro_clmna, v_dscrpcion_tbla );',
'        htp.p(''<div class="accordion">''|| v_rt_ma_g_envios_prgrmdo_cnslta.dscrpcion || ''</div>'');',
'        htp.p(''<div class="panel">'');',
'        for c_columnas in 1 .. v_nmro_clmna loop',
'            htp.p( ''<li><div ondragstart=" drag(event)" class="column h-card" data-tooltip="''||  v_dscrpcion_tbla( c_columnas ).col_name ||''" data-valor="#''||v_dscrpcion_tbla( c_columnas ).col_name ||''#"   draggable="true" >'' || v_dscrpcion_tbla( c_c'
||'olumnas ).col_name || ''</div></li>'') ;',
'        end loop;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'',
'    htp.p(''</div>'');',
'    htp.p( ''</ul></div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5646038483637224)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5645969179637223)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5646197861637225)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5645969179637223)
,p_button_name=>'BTN_ELIMINAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition=>'P13_ID_ENVIO_PRGRMDO_MDIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5646288166637226)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5645969179637223)
,p_button_name=>'BTN_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P13_ID_ENVIO_PRGRMDO_MDIO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5646305526637227)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5645969179637223)
,p_button_name=>'BTN_CREAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P13_ID_ENVIO_PRGRMDO_MDIO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9198794438752704)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(5645043626637214)
,p_button_name=>'BTN_CARGAR_PLANTILLA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_image_alt=>'Cargar Plantilla'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_grid_column_css_classes=>'BTN_CARGAR_PLANTILLA'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5647050094637234)
,p_branch_name=>'Go To Page 11'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,10:P11_ID_ENVIO_PRGRMDO:&P13_ID_ENVIO_PRGRMDO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'BTN_REGRESAR,BTN_GUARDAR,BTN_CREAR,BTN_ELIMINAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5645361449637217)
,p_name=>'P13_ID_ENVIO_PRGRMDO_MDIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5645043626637214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5645411250637218)
,p_name=>'P13_ID_ENVIO_PRGRMDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5645043626637214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5645575461637219)
,p_name=>'P13_CDGO_ENVIO_MDIO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5645043626637214)
,p_prompt=>'Medio de Envio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_ENVIOS_MEDIO_CLIENTE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion d, a.cdgo_envio_mdio r',
'from ma_d_envios_medio a',
'where a.actvo = ''S'' and',
'      a.cdgo_envio_mdio in(select b.cdgo_envio_mdio ',
'                           from ma_d_envios_medio_cnfgrcion b ',
'                           where b.cdgo_clnte   = :F_CDGO_CLNTE and  ',
'                                 b.actvo        = ''S'')',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when=>'P13_ID_ENVIO_PRGRMDO_MDIO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5645602687637220)
,p_name=>'P13_ASNTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5645043626637214)
,p_prompt=>'Asunto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675659070187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5645717138637221)
,p_name=>'P13_TXTO_MNSJE_HTML'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(13047560580893340)
,p_prompt=>'Mensaje'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cMaxlength=>32767
,p_tag_attributes=>'contenteditable="true"'
,p_display_when=>'P13_CRCTRES_PRMTDOS'
,p_display_when2=>'LBA'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_api.id(71675659070187989)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (options){',
'',
'    CKEDITOR.plugins.add( ''hcard'', {',
'			requires: ''widget'',',
'			init: function( editor ) {',
'				editor.widgets.add( ''hcard'', {',
'					allowedContent: ''span(!h-card); a[href](!u-email,!p-name); span(!p-tel)'',',
'					requiredContent: ''span(h-card)'',',
'					pathName: ''hcard'',',
'					upcast: function( el ) {',
'						return el.name == ''span'' && el.hasClass( ''h-card'' );',
'					}',
'				} );',
'',
'				editor.addFeature( editor.widgets.registered.hcard );',
'',
'				editor.on( ''paste'', function( evt ) {',
'					var column = evt.data.dataTransfer.getData( ''column'' );',
'					if ( !column ) {',
'						return;',
'					}',
'                    ',
'                    //var element = CKEDITOR.dom.element.createFromHtml(column);',
'                    console.log(column);',
'                    CKEDITOR.instances.P13_TXTO_MNSJE_HTML.insertText( column );                   ',
'                    return;',
'				});',
'			}',
'		});',
'    ',
'		CKEDITOR.on( ''instanceReady'', function(ev) {            ',
'            var columnslist = CKEDITOR.document.getById( ''columnslist'' );',
'            if (columnslist) {',
'			    columnslist.on( ''dragstart'', function( evt ) {                   ',
'                    CKEDITOR.plugins.clipboard.initDragDataTransfer( evt );',
'                    var dataTransfer = evt.data.dataTransfer; ',
'                    dataTransfer.setData( ''column'', $(evt.data.$.target).data(''valor'') );',
'                    dataTransfer.setData( ''text/html'', ''<hidden><hidden>'' );',
'			    });                ',
'            }',
'                       ',
'		} );',
'    ',
'    options.uiColor = ''#f1f1f1'';',
'    options.skin = ''office2013,skins/office2013/'';',
'    options.height = 500;',
'    options.extraPlugins = ''hcard'';',
'    options.enterMode = 2;	options.removePlugins = ''contextmenu,liststyle,tabletools'';	return  options;',
'}'))
,p_attribute_03=>'Y'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5645808240637222)
,p_name=>'P13_ACTVO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(5645043626637214)
,p_item_default=>'S'
,p_prompt=>unistr('\00BFActivo?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675717475187989)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6012030026689101)
,p_name=>'P13_TXTO_MNSJE_PLAIN_TEXT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(13047560580893340)
,p_prompt=>'Mensaje'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>'P13_CRCTRES_PRMTDOS'
,p_display_when2=>'LBA'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(71675659070187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9198613245752703)
,p_name=>'P13_ID_ENVIO_MDIO_CNFGRCION_PL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(5645043626637214)
,p_prompt=>'Plantilla'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.dscrpcion d, c.id_envio_mdio_cnfgrcion_pl r',
'from ma_d_envios_medio_cnfgrcion a',
'inner join ma_d_envios_medio b on a.cdgo_envio_mdio = b.cdgo_envio_mdio',
'inner join ma_d_envios_mdio_cnfgrcn_pl c on a.id_envio_mdio_cnfgrcion = c.id_envio_mdio_cnfgrcion',
'where a.cdgo_clnte = :F_CDGO_CLNTE and',
'      a.cdgo_envio_mdio = :P13_CDGO_ENVIO_MDIO and',
'      b.actvo = a.actvo and',
'      c.actvo = a.actvo and',
'      a.actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675659070187989)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13048463172893349)
,p_name=>'P13_CRCTRES_PRMTDOS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(5645043626637214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9198955750752706)
,p_name=>'Al hacer clic en Cargar Plantilla'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(9198794438752704)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9199035926752707)
,p_event_id=>wwv_flow_api.id(9198955750752706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select txto_plntlla, txto_plntlla',
'    into :P13_TXTO_MNSJE_HTML,:P13_TXTO_MNSJE_PLAIN_TEXT',
'    from ma_d_envios_mdio_cnfgrcn_pl',
'    where id_envio_mdio_cnfgrcion_pl = :P13_ID_ENVIO_MDIO_CNFGRCION_PL;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_attribute_02=>'P13_ID_ENVIO_MDIO_CNFGRCION_PL'
,p_attribute_03=>'P13_TXTO_MNSJE_HTML,P13_TXTO_MNSJE_PLAIN_TEXT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5646873329637232)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestion Envio Programado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number             := 0;',
'    v_mnsje_rspsta    varchar2(32000);',
'    v_crctres_prmtdos ma_d_envios_medio_cnfgrcion.crctres_prmtdos%type;',
'begin',
'    /*Validamos los caracteres permitido segun el medio de envio*/',
'    v_crctres_prmtdos := :P13_CRCTRES_PRMTDOS;',
'    ',
'    /*Validmos si es un nuevo registro*/',
'    if(:REQUEST = ''BTN_CREAR'')then',
'        :P13_ID_ENVIO_PRGRMDO_MDIO := sq_ma_g_envios_programado_mdio.nextval;',
'    end if;',
'    ',
'    /*Procedimiento para la gestion de envio medio programado*/',
'    pkg_ma_envios.prc_cd_envios_programado_medio(',
'          p_cdgo_clnte              => :F_CDGO_CLNTE,',
'          p_id_usrio                => :F_ID_USRIO,',
'          p_request                 => :REQUEST,',
'          p_id_envio_prgrmdo_mdio   => :P13_ID_ENVIO_PRGRMDO_MDIO,',
'          p_id_envio_prgrmdo        => :P13_ID_ENVIO_PRGRMDO,',
'          p_cdgo_envio_mdio         => :P13_CDGO_ENVIO_MDIO,',
'          p_asnto                   => :P13_ASNTO,',
'          p_txto_mnsje              => case ',
'                                           when v_crctres_prmtdos  = ''LBA'' then',
'                                               :P13_TXTO_MNSJE_PLAIN_TEXT',
'                                           when v_crctres_prmtdos != ''LBA'' then        ',
'                                               :P13_TXTO_MNSJE_HTML',
'                                       end,',
'          p_actvo                   => :P13_ACTVO,',
'          o_cdgo_rspsta			    => v_cdgo_rspsta,',
'          o_mnsje_rspsta            => v_mnsje_rspsta',
'    );',
'    ',
'    /*Validamos si hubo errores*/',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_GUARDAR,BTN_CREAR,BTN_ELIMINAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5647401281637238)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestion de Preferencias'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_count number := 0;',
'begin',
'    /*Recorremos las preferencias*/',
'    for c_preferencia in (select b.*',
'                          from ma_d_envios_medio_cnfgrcion a',
'                          inner join ma_d_envios_mdio_cnfgrcn_pf b on a.id_envio_mdio_cnfgrcion = b.id_envio_mdio_cnfgrcion',
'                          where a.cdgo_clnte = :F_CDGO_CLNTE and',
'                                a.cdgo_envio_mdio = :P13_CDGO_ENVIO_MDIO and',
'                                a.actvo = ''S'' and',
'                                b.actvo = ''S''',
'                          order by b.orden asc)loop',
'        v_count := v_count + 1;',
'        if(APEX_APPLICATION.G_F01(v_count) is not null)then',
'            /*Consultamos si existe la preferencia*/',
'            declare',
'                v_id_envio_prgrmd_md_pf number;',
'            begin',
'                select id_envio_prgrmd_md_pf',
'                into v_id_envio_prgrmd_md_pf',
'                from ma_g_envios_prgrmdo_mdio_pf',
'                where id_envio_prgrmdo_mdio = :P13_ID_ENVIO_PRGRMDO_MDIO and',
'                      id_envio_mdio_cnfgrcion_pf = c_preferencia.id_envio_mdio_cnfgrcion_pf;',
'               ',
'                --Actualizamos el parametro de preferencia',
'                begin',
'                    update ma_g_envios_prgrmdo_mdio_pf',
'                    set vlor = APEX_APPLICATION.G_F01(v_count)',
'                    where id_envio_prgrmd_md_pf = v_id_envio_prgrmd_md_pf;',
'                exception',
'                    when others then',
'                        raise_application_error(-20001, ''Problemas al actualizar preferencia, ''||sqlerrm);',
'                end;',
'                ',
'            exception',
'                when no_data_found then',
'                    begin',
'                        insert into ma_g_envios_prgrmdo_mdio_pf(',
'                            id_envio_prgrmd_md_pf,',
'                            id_envio_prgrmdo_mdio,',
'                            id_envio_mdio_cnfgrcion_pf,',
'                            vlor',
'                        )values(',
'                            sq_ma_g_envios_prgrmdo_mdio_pf.nextval,',
'                            :P13_ID_ENVIO_PRGRMDO_MDIO,',
'                            c_preferencia.id_envio_mdio_cnfgrcion_pf,',
'                            APEX_APPLICATION.G_F01(v_count)',
'                        );',
'                    exception',
'                        when others then',
'                            raise_application_error(-20001, ''Problemas al registrar preferencia, ''||sqlerrm);',
'                    end;   ',
'            end;',
'        else',
'            declare',
'               v_id_envio_prgrmd_md_pf number; ',
'            begin',
'                select id_envio_prgrmd_md_pf',
'                into v_id_envio_prgrmd_md_pf',
'                from ma_g_envios_prgrmdo_mdio_pf',
'                where id_envio_prgrmdo_mdio = :P13_ID_ENVIO_PRGRMDO_MDIO and',
'                      id_envio_mdio_cnfgrcion_pf = c_preferencia.id_envio_mdio_cnfgrcion_pf;',
'                /*Eliminamos la preferencia*/',
'                begin',
'                    delete from ma_g_envios_prgrmdo_mdio_pf',
'                    where id_envio_mdio_cnfgrcion_pf = c_preferencia.id_envio_mdio_cnfgrcion_pf;',
'                exception',
'                    when others then',
'                        raise_application_error(-20001, ''Problemas al eliminar preferencia, ''||sqlerrm);',
'                end;',
'            exception',
'                when no_data_found then',
'                    continue;',
'            end;',
'        end if;',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_GUARDAR,BTN_CREAR,BTN_ELIMINAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5648269490637246)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recuperacion de Envio Medio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_txto_mnsje    ma_g_envios_programado_mdio.txto_mnsje%type;',
'begin',
'    begin',
'        select  id_envio_prgrmdo,',
'                cdgo_envio_mdio,',
'                asnto,',
'                actvo,',
'                txto_mnsje',
'        into    :P13_ID_ENVIO_PRGRMDO,',
'                :P13_CDGO_ENVIO_MDIO,',
'                :P13_ASNTO,',
'                :P13_ACTVO,',
'                v_txto_mnsje',
'        from ma_g_envios_programado_mdio',
'        where id_envio_prgrmdo_mdio = :P13_ID_ENVIO_PRGRMDO_MDIO;',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''Problemas al recuperar medio de envio programado, ''||sqlerrm);',
'    end;',
'',
'    /*Validamos los caracteres permitido segun el medio de envio*/',
'    declare',
'        v_crctres_prmtdos ma_d_envios_medio_cnfgrcion.crctres_prmtdos%type;',
'    begin',
'        select a.crctres_prmtdos',
'        into v_crctres_prmtdos',
'        from ma_d_envios_medio_cnfgrcion a',
'        inner join ma_d_envios_medio b on a.cdgo_envio_mdio = b.cdgo_envio_mdio',
'        where a.cdgo_clnte         = :F_CDGO_CLNTE and',
'              a.cdgo_envio_mdio    = :P13_CDGO_ENVIO_MDIO and',
'              a.actvo              = ''S'' and',
'              b.actvo              = ''S'';',
'',
'       if(v_crctres_prmtdos = ''LBA'')then',
'           :P13_TXTO_MNSJE_PLAIN_TEXT := v_txto_mnsje;',
'       else',
'           :P13_TXTO_MNSJE_HTML := v_txto_mnsje;',
'       end if;',
'       ',
'    exception',
'        when no_data_found then',
'            raise_application_error(-20001, ''Problemas al consultar en medio de envio en configuraciones, no se hallaron resultados.'');',
'        when others then',
'            raise_application_error(-20001, ''Problemas al consultar en medio de envio en configuraciones, ''||sqlerrm);',
'    end;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P13_ID_ENVIO_PRGRMDO_MDIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13048328659893348)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Caracteres permitidos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.crctres_prmtdos',
'into :P13_CRCTRES_PRMTDOS',
'from ma_d_envios_medio_cnfgrcion a',
'inner join ma_d_envios_medio b on a.cdgo_envio_mdio = b.cdgo_envio_mdio',
'where a.cdgo_clnte = :F_CDGO_CLNTE and',
'      a.cdgo_envio_mdio = :P13_CDGO_ENVIO_MDIO and',
'      a.actvo = ''S'' and',
'      b.actvo = ''S'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P13_CDGO_ENVIO_MDIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
