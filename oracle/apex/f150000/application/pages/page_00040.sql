prompt --application/pages/page_00040
begin
wwv_flow_api.create_page(
 p_id=>40
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Consultar archivos de normatividad'
,p_step_title=>'Consultar archivos de normatividad'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("click", ".a-TreeView-label", function (e) {',
'    $(this).closest("li").find(".a-TreeView-toggle").first().click();',
'});',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css',
''))
,p_step_template=>wwv_flow_api.id(252165693921651362)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250317092656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5591551656856805)
,p_plug_name=>'Normatividades'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>5
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when connect_by_isleaf = 1 then 0 when level = 1 then 1 else -1 end as status,',
'        level,',
'        title,',
'        case',
'            when level = 1 then  ''fa-folder-o fa-1x''',
'            when level = 2 then  ''fa-calendar-check-o fa-1x''',
'            when level = 3 then  ''fa-file-pdf-o fa-1x''',
'        end as icon,',
'        --''icon-tree-folder'' as icon,',
'        id_hjo as value,',
'        id_pdre as value_padre,',
'        tooltip,',
'        fcha_nrmtva,',
'         case',
'            when level  > 2 then ',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':'' || :APP_PAGE_ID || '':'' || :APP_SESSION || ''::NO::P40_NODO_SELECCIONADO:'' || id_hjo)  ',
'            else ',
'                null',
'        end as link',
'from ',
'( select a.id_nrmtvddes_tpo + 100000 id_hjo, null id_pdre, a.dscrpcion title, null tooltip,null fcha_nrmtva from df_d_normatividades_tipo a ',
'union',
'      select to_number( c.id_nrmtvddes_tpo || to_char(c.fcha_nrmtva, ''YYYY'') ) id_hjo, id_nrmtvddes_tpo + 100000 id_pdre,',
'            to_char(c.fcha_nrmtva, ''YYYY'') title, ''Vigencia'' tooltip,null fcha_nrmtva',
'      from gd_g_normatividades c ',
'      group by c.id_nrmtvddes_tpo, to_char(c.fcha_nrmtva, ''YYYY'')',
'union',
'  select b.id_nrmtvdad id_hjo,  to_number( b.id_nrmtvddes_tpo || to_char(b.fcha_nrmtva, ''YYYY'') ) id_pdre, b.nmbre_nrmtva title, b.dscrpcion tooltip,trunc(b.fcha_nrmtva) fcha_nrmtva  from gd_g_normatividades b',
')',
'start with id_pdre is null',
'connect by prior id_hjo = id_pdre',
'order siblings by value_padre,fcha_nrmtva',
''))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'S'
,p_attribute_03=>'P40_NODO_SELECCIONADO'
,p_attribute_04=>'DB'
,p_attribute_08=>'fa'
,p_attribute_09=>'icon-tree-folder'
,p_attribute_10=>'TITLE'
,p_attribute_12=>'ICON'
,p_attribute_13=>'VALUE'
,p_attribute_14=>'VALUE_PADRE'
,p_attribute_16=>'NULL'
,p_attribute_20=>'VALUE'
,p_attribute_22=>'TOOLTIP'
,p_attribute_23=>'SQL'
,p_attribute_24=>'LINK'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5591636878856806)
,p_name=>'Normativa'
,p_template=>wwv_flow_api.id(252179169018651396)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_new_grid_row=>false
,p_grid_column_span=>5
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_nrmtvdad',
'        ,  b.dscrpcion ||''  [ ''|| b.cdgo_nrmtvddes_tpo ||'' ]''    descripcion_codigo',
'	  	, a.nmbre_nrmtva     ',
'		, a.dscrpcion        ',
'        , nmro_nrmtva',
'		, trunc(a.fcha_nrmtva)  fcha_nrmtva',
'		, trunc(a.fcha_incio)   fcha_incio',
'		, trunc(a.fcha_fnal)    fcha_fnal',
'	--	, decode (a.actvo,''S'', ''Si'', ''No'')        actvo ',
'	 --	, a.file_name        ',
'	   , 1 as dscrgar',
'from gd_g_normatividades	a  join df_d_normatividades_tipo b on a.id_nrmtvddes_tpo = b.id_nrmtvddes_tpo',
'where a.id_nrmtvdad = :P40_NODO_SELECCIONADO',
'     and cdgo_clnte = 23001 --:F_CDGO_CLNTE ;',
'     and a.actvo = ''S''',
'     /*and  ( a.id_nrmtvddes_tpo = :P40_ID_NRMTVDDES_TPO or :P40_ID_NRMTVDDES_TPO is null)',
'     and ((trunc(a.fcha_nrmtva)           between :P40_FCHA_INCIO  and :P40_FCHA_FNAL)',
'       or :P40_FCHA_INCIO   is null  or :P40_FCHA_FNAL     is null)',
'     and sysdate between fcha_incio and fcha_fnal*/'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(252191632506651419)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5591776108856807)
,p_query_column_id=>1
,p_column_alias=>'ID_NRMTVDAD'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5592716971856817)
,p_query_column_id=>2
,p_column_alias=>'DESCRIPCION_CODIGO'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5591939235856809)
,p_query_column_id=>3
,p_column_alias=>'NMBRE_NRMTVA'
,p_column_display_sequence=>3
,p_column_heading=>'Nombre'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5592078064856810)
,p_query_column_id=>4
,p_column_alias=>'DSCRPCION'
,p_column_display_sequence=>4
,p_column_heading=>unistr('Descripci\00F3n')
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5592129644856811)
,p_query_column_id=>5
,p_column_alias=>'NMRO_NRMTVA'
,p_column_display_sequence=>2
,p_column_heading=>unistr('N\00FAmero')
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5592225730856812)
,p_query_column_id=>6
,p_column_alias=>'FCHA_NRMTVA'
,p_column_display_sequence=>5
,p_column_heading=>'Fecha del Acto'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5592342797856813)
,p_query_column_id=>7
,p_column_alias=>'FCHA_INCIO'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5592468687856814)
,p_query_column_id=>8
,p_column_alias=>'FCHA_FNAL'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5592578977856815)
,p_query_column_id=>9
,p_column_alias=>'DSCRGAR'
,p_column_display_sequence=>8
,p_column_heading=>'Archivo de Normativa'
,p_use_as_row_header=>'N'
,p_column_format=>'DOWNLOAD:GD_G_NORMATIVIDADES:FILE_BLOB:ID_NRMTVDAD::FILE_MIMETYPE:FILE_NAME:::attachment:<i class="fa fa-file-pdf-o fa-3x"></i> Descargar:'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(85165424553979620)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5591636878856806)
,p_button_name=>'RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,40::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5592644854856816)
,p_name=>'P40_NODO_SELECCIONADO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5591551656856805)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
