prompt --application/pages/page_00191
begin
wwv_flow_api.create_page(
 p_id=>191
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Imprimir Oficio '
,p_page_mode=>'MODAL'
,p_step_title=>'Imprimir Oficio '
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-light.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-punk.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-noir.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css',
''))
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'650'
,p_dialog_width=>'80%'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104922810302156609)
,p_plug_name=>'Plantilla'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104923553282156616)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(104922810302156609)
,p_button_name=>'Btn_Imprmir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5163479905438502)
,p_name=>'P191_ID_PLSVLIA_DTLLE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(104922810302156609)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104922928512156610)
,p_name=>'P191_ID_PLNTLLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104922810302156609)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104923122406156612)
,p_name=>'P191_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(104922810302156609)
,p_prompt=>'Plantilla:'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>150
,p_cMaxlength=>40000
,p_cHeight=>70
,p_tag_attributes=>'atributos personalizado contenteditable="true"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
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
'                    var element = CKEDITOR.dom.element.createFromHtml(column);',
'                    CKEDITOR.instances.P191_PLNTLLA.insertElement( element );                   ',
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
'            ',
'            var varlist = CKEDITOR.document.getById( ''varlist'' );',
'            if (varlist) {',
'			    varlist.on( ''dragstart'', function( evt ) {                   ',
'                    CKEDITOR.plugins.clipboard.initDragDataTransfer( evt );',
'                    var dataTransfer = evt.data.dataTransfer; ',
'                    dataTransfer.setData( ''column'', $(evt.data.$.target).data(''valor'') );',
'                    dataTransfer.setData( ''text/html'', ''<hidden><hidden>'' );',
'			    });                ',
'            }            ',
'		} );',
'    ',
'    options.uiColor = ''#f1f1f1'';',
'    options.skin = ''office2013,skins/office2013/'';',
'    options.height = 300;',
'    options.resize_enabled = false',
'    options.extraPlugins = ''hcard'';',
'    options.enterMode = 2;	options.removePlugins = ''contextmenu,liststyle,tabletools'';	return  options;',
'}'))
,p_attribute_03=>'Y'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104923451829156615)
,p_name=>'P191_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(104922810302156609)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104923664461156617)
,p_name=>'P191_CNSCTVO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(104922810302156609)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104923824601156619)
,p_name=>'P191_ID_ACTO_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(104922810302156609)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104923968449156620)
,p_name=>'P191_ID_OFCIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(104922810302156609)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104923797284156618)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar e Imprimir Oficio '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_object json_object_t := json_object_t();  ',
'     v_json                      clob;   ',
'     v_gn_d_reportes             gn_d_reportes%rowtype;',
'     v_blob                      blob;  ',
'     v_mnsje_rspsta              varchar2(4000);',
'     v_cdgo_rspsta               number;',
'     v_id_ofcio                  number;      ',
'begin   ',
'    -- CONSULTAMOS LOS DATOS DEL REPORTE    ',
'    begin',
'        select /*+ RESULT_CACHE */',
'                r.*',
'           into v_gn_d_reportes ',
'           from gn_d_reportes r',
'          where r.id_rprte = (',
'                                  select a.id_rprte',
'                                    from gn_d_plantillas a',
'                                   where a.id_plntlla = :P191_ID_PLNTLLA',
'                              ); ',
'         ',
'    exception',
'        when others then',
'                null;',
'    end;     ',
'',
'    -- Registramos el Oficio de Plusvalia ',
'    pkg_gi_plusvalia.prc_rg_oficio_plusvalia (',
'                        p_cdgo_clnte			=> :F_CDGO_CLNTE',
'                      ,	p_id_plntlla 			=> :P191_ID_PLNTLLA',
'                      , p_id_sjto_impsto		=> :P191_ID_SJTO_IMPSTO',
'                      , p_nmro_cnsctvo_ofcio	=> :P191_CNSCTVO',
'                      , p_id_usrio			    => :F_ID_USRIO',
'                      , p_blob	    			=>  v_blob',
'                      , p_id_plsvlia_dtlle      => :P191_ID_PLSVLIA_DTLLE',
'                      , p_dcmnto                => :P191_PLNTLLA  ',
'                      , o_id_ofcio              => :P191_ID_OFCIO  ',
'                      , o_mnsje_rspsta			=> v_mnsje_rspsta',
'                      , o_cdgo_rspsta			=> v_cdgo_rspsta',
'    );',
'   ',
'    -- Validamos si Hubo errores        ',
'    if v_cdgo_rspsta <> 0 then',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;        ',
'    -- Fin Registramos el Oficio de Plusvalia ',
'    ',
'exception',
'     when others then',
'          raise_application_error(-20000, sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(104923553282156616)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104923327363156614)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        v_cdgo_acto_tpo   varchar2(4);',
'begin',
'   -- consultamos el tipo de acto para generar el consecutivo',
'    begin',
'        select b.cdgo_acto_tpo',
'             --, a.id_acto_tpo',
'          into v_cdgo_acto_tpo',
'             --, :P191_ID_ACTO_TPO',
'          from gn_d_plantillas a',
'          join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'         where a.id_plntlla = :P191_ID_PLNTLLA; ',
'    exception',
'            when no_data_found then',
unistr('                    raise_application_error(-20000, ''No se encontr\00F3 el tipo de acto a generar'');'),
'    end;',
'    ',
'    -- Consultamos el Consecutivo',
'    :P191_CNSCTVO := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, v_cdgo_acto_tpo);    ',
'    ',
'    -- Generamos el HTML de la plantilla            ',
'     if :P191_ID_PLSVLIA_DTLLE is null then ',
'              select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml  => ''{"id_sjto_impsto":''||:P191_ID_SJTO_IMPSTO||'', "cnsctvo":''||:P191_CNSCTVO||'',"cdgo_acto_tpo":"''||v_cdgo_acto_tpo||''"}''',
'                                                     , p_id_plntlla => :P191_ID_PLNTLLA) as html',
'              into :P191_PLNTLLA',
'              from dual;',
'      else',
'         select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml   => ''{"id_plsvlia_dtlle":''||:P191_ID_PLSVLIA_DTLLE||'',"id_sjto_impsto":''||:P191_ID_SJTO_IMPSTO||'', "cnsctvo":''||:P191_CNSCTVO||'',"cdgo_acto_tpo":"''||v_cdgo_acto_tpo||''"}''',
'                                                  , p_id_plntlla => :P191_ID_PLNTLLA) as html',
'          into :P191_PLNTLLA',
'          from dual;',
'       ',
'      end if;',
'',
'           insert into muerto (v_001)values (''{"id_plsvlia_dtlle":''||:P191_ID_PLSVLIA_DTLLE||'',"id_sjto_impsto":''||:P191_ID_SJTO_IMPSTO||'', "cnsctvo":''||:P191_CNSCTVO||'',"cdgo_acto_tpo":"''||v_cdgo_acto_tpo||''"}'');',
'exception',
'        when no_data_found then ',
'                null;',
'end;  ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'generar_oficio'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
