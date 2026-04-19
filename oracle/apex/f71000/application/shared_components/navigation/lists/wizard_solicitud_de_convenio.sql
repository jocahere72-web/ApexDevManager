prompt --application/shared_components/navigation/lists/wizard_solicitud_de_convenio
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(43441465037066295)
,p_name=>'Wizard Solicitud de Convenio'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(43442532468066300)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Sujeto Tributo'
,p_list_item_link_target=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18393704321493836)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Validaciones'
,p_list_item_link_target=>'f?p=&APP_ID.:361:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(43450414838066309)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Cartera'
,p_list_item_link_target=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(52438021928427290)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Cuota Inicial'
,p_list_item_link_target=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(43454758727066311)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Plan de Pago'
,p_list_item_link_target=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(50980609833822128)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Resumen'
,p_list_item_link_target=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
