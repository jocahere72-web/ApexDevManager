
  CREATE OR REPLACE EDITIONABLE FUNCTION "PREPARE_URL_POPUP" ( p_app_id          in varchar2 default null,
                                              p_app_page_id     in varchar2,
                                              p_id              in varchar2,
                                              p_items           in varchar2 default null,
                                              p_values          in varchar2 default null,
                                              p_options         in varchar2 default null) return varchar2 is
v_url varchar2(4000);
begin
    if(p_app_page_id is null) then
        return '#';
    end if;

    v_url := apex_util.prepare_url(p_url => 'f?p='||nvl(p_app_id, v('APP_ID'))||':'||p_app_page_id||':'||v('APP_SESSION')||'::NO:'||p_app_page_id||':' || p_items || ':'|| p_values );
    return 'javascript:apex.navigation.popup({url:"' ||substr (v_url, instr (v_url, 'f?p' ), (instr (v_url, '{t' ) -3) - (instr (v_url, 'f?p' )) + 1) || '"'|| case when p_options is not null then ','||p_options else ''end||'})';
end prepare_url_popup;
/

