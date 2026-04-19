prompt --application/pages/page_00054
begin
wwv_flow_api.create_page(
 p_id=>54
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Cambio de Estratos Masivo'
,p_step_title=>'Cambio de Estratos Masivo'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220525180520'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10662567265872603)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
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
 p_id=>wwv_flow_api.id(10662781879872605)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
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
'<i>',
'Funcionalidad que permite<br><br>',
'Procesar un archivo para el cambio masivo de estratos.<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(246422196331163639)
,p_plug_name=>'Cambio de Estratos Msivo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188015486321002110)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(10662567265872603)
,p_button_name=>'Btn_Procesar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de procesar el archivo?  Nota: Al aceptar el procesamiento del archivo se realizarÃ¡ en segundo plano. En cuanto termine el procesamiento el sistema le notificara de manera automÃ¡tica que Ã©ste ha terminado. '',''Btn_Procesar'');'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10662608643872604)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(10662567265872603)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:RP,58::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(188019058416002153)
,p_branch_name=>'Branch'
,p_branch_action=>'f?p=&P54_BRANCH_APP.:&P54_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP,54::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(188015486321002110)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(188019428181002153)
,p_branch_name=>'Branch'
,p_branch_action=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:RP,54::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(188015486321002110)
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10662363804872601)
,p_branch_name=>'Ir a la pagina de resumen'
,p_branch_action=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(188015486321002110)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188015888163002122)
,p_name=>'P54_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(246422196331163639)
,p_prompt=>'Tributo:'
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
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188016221583002128)
,p_name=>'P54_IMPUESTO_SUBIMPUESTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(246422196331163639)
,p_prompt=>'Sub Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P54_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P54_IMPSTO'
,p_ajax_items_to_submit=>'P54_IMPSTO,P54_IMPUESTO_SUBIMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188016623526002129)
,p_name=>'P54_ID_ENTDAD_NVDAD'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(246422196331163639)
,p_prompt=>'Originada por:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as v',
'     , id_entdad_nvdad as k',
'from   df_i_entidades_novedad',
'where  cdgo_clnte = :F_CDGO_CLNTE',
'and    id_impsto  = :P54_IMPSTO',
'order by v'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P54_IMPSTO'
,p_ajax_items_to_submit=>'P54_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Entidad que autoriza la novedad.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'400'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188017411013002130)
,p_name=>'P54_ARCHIVO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(246422196331163639)
,p_prompt=>'Archivo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.file_name || ''  |  '' || to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || a.nmbre_trcro as d',
'      , a.id_prcso_crga as r',
'   from v_et_g_procesos_carga a',
'  where a.cdgo_clnte        = :F_CDGO_CLNTE',
'    and a.id_impsto         = :P54_IMPSTO',
'    and a.id_impsto_sbmpsto = :P54_IMPUESTO_SUBIMPUESTO',
'   -- and a.vgncia            = :P54_VGNCIA  ',
'   -- and a.id_prdo           = :P54_PRDO',
'    and a.indcdor_prcsdo    = ''N''',
'    and exists( select 1',
'                from si_g_novedades_prdio_crgue c',
'                where c.id_prcso_crga = a.id_prcso_crga',
'                group by a.id_prcso_crga',
'              );'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P54_IMPSTO,P54_IMPUESTO_SUBIMPUESTO'
,p_ajax_items_to_submit=>'P54_IMPSTO,P54_IMPUESTO_SUBIMPUESTO,P54_ARCHIVO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>8
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188017856489002130)
,p_name=>'P54_BRANCH_APP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(246422196331163639)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188018258863002130)
,p_name=>'P54_BRANCH_PAGE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(246422196331163639)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(188018655806002149)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Estratos Job'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(4000);',
'    v_error 		varchar2(1000);',
'begin',
'    /*pkg_si_novedades_predio.prc_ac_estratos_masivo( p_cdgo_clnte			=> :F_CDGO_CLNTE',
'                                                     , p_id_usrio			=> :F_ID_USRIO',
'                                                     , p_id_impsto			=> :P54_IMPSTO',
'                                                     , p_id_impsto_sbmpsto  => :P54_IMPUESTO_SUBIMPUESTO',
'                                                     , p_id_prcso_crga		=> :P54_ARCHIVO',
'                                                     , p_id_entdad_nvdad    => :P54_ID_ENTDAD_NVDAD',
'                                                     , o_cdgo_rspsta  		=> v_cdgo_rspsta',
'                                                     , o_mnsje_rspsta 		=> v_mnsje_rspsta );',
'    ',
'    if( V_cdgo_rspsta != 0 ) then',
'        raise_application_error( -20001 , v_mnsje_rspsta );',
'	end if;*/',
'    ',
'       --insert into gti_aux (col1, col2) values (''F_ID_USRIO'', :F_ID_USRIO); commit;',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_SI_PROCESAR_CAMBIO_ESTRATO"'', attribute => ''job_action'', value => ''PKG_SI_NOVEDADES_PREDIO.PRC_AC_ESTRATOS_MASIVO'');',
'',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_SI_PROCESAR_CAMBIO_ESTRATO"'', attribute => ''number_of_arguments'', value => ''6'');',
'		--IN',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_SI_PROCESAR_CAMBIO_ESTRATO'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_SI_PROCESAR_CAMBIO_ESTRATO'', argument_position => 2, argument_value => :F_ID_USRIO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_SI_PROCESAR_CAMBIO_ESTRATO'', argument_position => 3, argument_value => :P54_IMPSTO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_SI_PROCESAR_CAMBIO_ESTRATO'', argument_position => 4, argument_value => :P54_IMPUESTO_SUBIMPUESTO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_SI_PROCESAR_CAMBIO_ESTRATO'', argument_position => 5, argument_value => :P54_ARCHIVO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_SI_PROCESAR_CAMBIO_ESTRATO'', argument_position => 6, argument_value => :P54_ID_ENTDAD_NVDAD);',
'		--OUT',
'       /* DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_SI_PROCESAR_CAMBIO_ESTRATO'', argument_position => 7, argument_value => v_cdgo_rspsta);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_SI_PROCESAR_CAMBIO_ESTRATO'', argument_position => 8, argument_value => v_mnsje_rspsta);*/',
'',
'    END; ',
'    ',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_SI_PROCESAR_CAMBIO_ESTRATO"'');',
'    END; ',
'    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(188015486321002110)
,p_process_success_message=>unistr('Proceso Realizado con \00C9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10638544070239902)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtiene Impuesto Predial'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto into :P54_IMPSTO',
'from df_c_impuestos where cdgo_impsto = ''IPU'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
