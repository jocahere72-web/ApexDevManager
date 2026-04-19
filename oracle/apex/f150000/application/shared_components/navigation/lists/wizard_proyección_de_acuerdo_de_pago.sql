prompt --application/shared_components/navigation/lists/wizard_proyección_de_acuerdo_de_pago
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(72870253246195914)
,p_name=>unistr('Wizard Proyecci\00F3n de Acuerdo de Pago')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(72870584409195927)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Contribuyente'
,p_list_item_link_target=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(72870930629195938)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Cartera'
,p_list_item_link_target=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(72871342967195938)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Cuota Inicial'
,p_list_item_link_target=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P111_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(72871761656195938)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Plan de Pago'
,p_list_item_link_target=>'f?p=&APP_ID.:114:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(72872127563195939)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Resumen'
,p_list_item_link_target=>'f?p=&APP_ID.:115:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
