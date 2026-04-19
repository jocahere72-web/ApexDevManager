prompt --application/shared_components/navigation/lists/div_class_fa_fa_money_saldo_a_favor_div
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(91968045407275523)
,p_name=>'<div class="fa fa-money"> Saldo a Favor</div>'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91968233238275523)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Tipo de Origen Saldo a Favor'
,p_list_item_link_target=>'f?p=&APP_ID.:80:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
