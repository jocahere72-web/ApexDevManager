prompt --application/pages/page_00063
begin
wwv_flow_api.create_page(
 p_id=>63
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Fechas de Vencimientos'
,p_step_title=>'Fechas de Vencimientos'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20180924173558'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4418721327966863)
,p_plug_name=>'Fechas de Vencimientos'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4414536068966851)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190552185526328966)
,p_plug_name=>'Fechas de Vencimiento'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select seq_id,',
'       d001 fcha_vncmnto,',
'       c001 txto',
'   from apex_collections ',
'  where collection_name = ''FCHAS_VNCMNTO''       '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4632252544108801)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190552827160328973)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190553006830328974)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192255269561066532)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD-MON-YYYY'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(192255319362066533)
,p_name=>'TXTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Texto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>unistr('Texto auxiliar para imprimir en el reporte de liquidaci\00F3n')
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(190552281541328967)
,p_internal_uid=>190552281541328967
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(192232818414876964)
,p_interactive_grid_id=>wwv_flow_api.id(190552281541328967)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(192232915421876968)
,p_report_id=>wwv_flow_api.id(192232818414876964)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4638577960116815)
,p_view_id=>wwv_flow_api.id(192232915421876968)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(4632252544108801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192235585250879239)
,p_view_id=>wwv_flow_api.id(192232915421876968)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(190552827160328973)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192296803891383311)
,p_view_id=>wwv_flow_api.id(192232915421876968)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(192255269561066532)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(192297218813383313)
,p_view_id=>wwv_flow_api.id(192232915421876968)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(192255319362066533)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(374419464752702583)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(375816380531538159)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
unistr('Para la creaci\00F3n de lote de facturaci\00F3n masiva con multiples fechas se deden realizar 4 pasos. En esta opci\00F3n se ejecutara el tercer paso.<br>'),
'<center><b><i> Paso 3: Fechas de Vencimientos </i></b> </br></center>',
'Se debe tener las siguientes consideraciones:<br>',
unistr('<b><i> -</i></b>Se debe ingresar m\00E1s de 2 fechas de vencimientos.<br>'),
'<b><i> -</i></b>Todas las Fechas de vencimientos debes ser mayor que la fecha del sistema.<br>',
'<b><i> -</i></b>Si en el paso 1 todas las vigencias seleccionadas aun no se encuentran vencidas, las Fechas de Vencimiento seleccionadas deben ser inferior a la fecha de vencimientos de la vigencia menor.<br>',
unistr('<b><i> -</i></b>Si en el paso 1 se seleccionaron al menos una vigencia que ya se encuentra vencida, las Fechas de Vencimiento seleccionadas deben estar entre los rangos de tasas moras par\00E1metrizados en el sistema.<br>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4438462422067880)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(190552185526328966)
,p_button_name=>'BTN_GUARDAR_FECHAS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Guardar Fechas'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-calendar-check-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4438862520067881)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(190552185526328966)
,p_button_name=>'BTN_BORRAR_FECHAS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Borrar Fechas'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4442689747079407)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(374419464752702583)
,p_button_name=>'BTN_CONSULTAR_DESCUENTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Descuentos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:RP:P58_ID_IMPSTO,P58_ID_IMSPTO_SBMPSTO,P58_VGNCIA_DSDE,P58_PRDO_DSDE,P58_VGNCIA_DSDE,P58_PRDO_DSDE:&P60_ID_IMPSTO.,&P60_ID_IMSPTO_SBMPSTO.,&P60_VGNCIA_DSDE.,&P60_PRDO_DSDE.,&P60_VGNCIA_DSDE.,&P60_PRDO_DSDE.'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4420569393966864)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4418721327966863)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-calendar-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4420875702966864)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4418721327966863)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4420733453966864)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4418721327966863)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4422355949966867)
,p_branch_action=>'f?p=&APP_ID.:64:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4420875702966864)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4421649164966867)
,p_branch_action=>'f?p=&APP_ID.:62:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4420733453966864)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4439374965067881)
,p_tabular_form_region_id=>wwv_flow_api.id(190552185526328966)
,p_validation_name=>unistr('Validar que la fecha de vencimiento sea v\00E1lida')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_fcha_vlda varchar2(1);',
'v_vncda    varchar2(1);',
'v_fcha_vncmnto    date;',
'',
unistr('-- Se vlida que la fecha de vencimiento 1 sea v\00E1lida'),
'-- 1. Si alguna de las vigencias-periodo que estan dentro del rango del vigencias y periodo seleccionados (Vigencia-periodo Desde y Vigencia-periodo Hasta) esta vencida ',
unistr('--    la fecha de vencimiento 1 se v\00E1lida contra la par\00E1metrizaci\00F3n de tasas mora'),
'-- 2. Si ninguna de las vigencias-periodo que estan dentro del rango del vigencias y periodo seleccionados (Vigencia-periodo Desde y Vigencia-periodo Hasta) esta vencida ',
unistr('--    la fecha de vencimiento 1 se v\00E1lida contra la fecha de vencimiento del periodo. '),
'',
'begin ',
unistr('    -- Inicializaci\00F3n de Variables'),
'    v_vncda    := ''N'';',
'    ',
'    -- Se consultan las fechas de vencimientos de cada unas de las vigenciaa-periodos ',
'    for c_vgncia_prdo in (select trunc(fcha_vncmnto)fcha_vncmnto,',
'                                 case when (fcha_vncmnto < sysdate) or (fcha_vncmnto is null ) then ',
'                                           ''S''',
'                                      else',
'                                           ''N''',
'                                 end as vncda',
'                               from v_df_i_periodos ',
'                              where (vgncia * 100) + prdo  between ( :P60_vgncia_dsde * 100 ) + :P60_prdo_dsde',
'                                                               and ( :P60_vgncia_hsta * 100 ) + :P60_prdo_hsta',
'                          ',
'                        )loop',
'        -- Si la vigencia-periodo esta vencida se guarda en la varible la v_vncda',
'        if c_vgncia_prdo.vncda = ''S'' then ',
'            v_vncda := ''S'';',
'        -- Si la vigencia no esta vencida se guarda la fecha de vencimiento de la vigencia-periodo',
'        else ',
'            if (v_fcha_vncmnto < c_vgncia_prdo.fcha_vncmnto) or v_fcha_vncmnto is null then ',
'               v_fcha_vncmnto := c_vgncia_prdo.fcha_vncmnto;',
'            end if;',
'        end if;',
'    ',
'    end loop; -- fin del ciclo   ',
'    ',
unistr('    -- Al finalizar el ciclo se valida el estado de la variable v_vnciada, si es S, se valida que la fecha de vencimiento seleccionada esta en dentro de la par\00E1metrizaci\00F3n'),
'    -- de tasas mora, si la varible es N; se valida si la fecha de vencimieno seleccionada no sea mayor que la fecha de vencimiento del periodo.',
'    if v_vncda = ''S'' then ',
'        v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P60_ID_IMPSTO, to_date(:FCHA_VNCMNTO,''DD/MM/YYYY''));',
'    else ',
'        if to_date(:FCHA_VNCMNTO,''DD/MM/YYYY'') > v_fcha_vncmnto then         ',
'            v_fcha_vlda := ''N'';',
'        else ',
'            v_fcha_vlda := ''S'';',
'        end if;',
'    end if; ',
'    ',
'    ',
'    if v_fcha_vlda = ''S'' then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('La Fecha de Vencimiento seleccionada No es v\00E1lida. '),
unistr('Por favor revise la fecha de vencimiento de las vigencias y periodos seleccionados y/o las par\00E1metrizaci\00F3n de Tasas Mora. ')))
,p_when_button_pressed=>wwv_flow_api.id(4438462422067880)
,p_only_for_changed_rows=>'N'
,p_associated_column=>'FCHA_VNCMNTO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4439761355067882)
,p_tabular_form_region_id=>wwv_flow_api.id(190552185526328966)
,p_validation_name=>'Validar que las Fechas de Vencimiento no sea iguales'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from apex_collections ',
'where collection_name = ''FCHAS_VNCMNTO''',
'  and to_char(:D001,''DD/MM/YYYY'') = to_char(:FCHA_VNCMNTO,''DD/MM/YYYY'')'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Las Fechas de Vencimientos no pueden ser iguales'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(4438462422067880)
,p_associated_column=>'FCHA_VNCMNTO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4632461104108803)
,p_validation_name=>'Validar que existan fechas almancenadas'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_nmro_fcha    number; ',
'begin ',
'     begin',
'         select count (seq_id) ',
'           into v_nmro_fcha',
'           from apex_collections ',
'          where collection_name = ''FCHAS_VNCMNTO'';   ',
'          ',
'     exception  ',
'         when no_data_found then ',
'             v_nmro_fcha := 0;',
'     end;',
'    ',
'    if v_nmro_fcha  > 0 then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Deben guardar alguna fecha de vencimiento'
,p_when_button_pressed=>wwv_flow_api.id(4420875702966864)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4440061115067883)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(190552185526328966)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Guardar Fechas de Vencimiento - Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    case :APEX$ROW_STATUS',
'        when ''C'' then ',
'            APEX_COLLECTION.ADD_MEMBER( p_collection_name => ''FCHAS_VNCMNTO'',',
'                                        p_D001            => :FCHA_VNCMNTO,',
'                                        p_C001            => :TXTO); ',
'        when ''U'' then',
'            APEX_COLLECTION.UPDATE_MEMBER (p_collection_name  => ''FCHAS_VNCMNTO'',',
'                                           p_seq              => :SEQ_ID,',
'                                           p_D001             => :FCHA_VNCMNTO,',
'                                           p_c001             => :TXTO);',
'        when ''D'' then',
'            APEX_COLLECTION.DELETE_MEMBER(p_collection_name => ''FCHAS_VNCMNTO'', p_seq => :SEQ_ID);',
'        else',
'            insert into gti_aux (col1,col2, col3) values (''NN'',:FCHA_VNCMNTO,  :TXTO);',
'        end case;',
'end;'))
,p_attribute_05=>'N'
,p_attribute_06=>'N'
,p_process_error_message=>'Error al gurardar las fechas, #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4438462422067880)
,p_process_when=>'FCHA_VNCMNTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_exec_cond_for_each_row=>'Y'
,p_only_for_changed_rows=>'N'
,p_process_success_message=>'Se Guardaron las fechas exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4515788226339047)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Borrar fechas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    APEX_COLLECTION.DELETE_COLLECTION(',
'        p_collection_name => ''FCHAS_VNCMNTO'');',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4438862520067881)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4515907811339049)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Crear Colecci\00F3n de Fechas')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin    ',
'    if apex_collection.collection_exists( p_collection_name => ''FCHAS_VNCMNTO'' ) then ',
'        ',
'       for c_cllction in (select seq_id from apex_collections where collection_name = ''FCHAS_VNCMNTO'' and d001 is null) loop ',
'           APEX_COLLECTION.DELETE_MEMBER( p_collection_name => ''FCHAS_VNCMNTO'', p_seq => c_cllction.seq_id);',
'       end loop;',
'    ',
'        null;',
'     else ',
'         APEX_COLLECTION.CREATE_COLLECTION(p_collection_name => ''FCHAS_VNCMNTO''); ',
'    end if;',
'end;',
'        ',
'        ',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
