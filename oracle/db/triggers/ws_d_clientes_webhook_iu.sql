
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_CLIENTES_WEBHOOK_IU"
for insert or update on ws_d_clientes_webhook
compound  trigger

before each row is
  begin
    if inserting then
      if :new.id_clnte_wbhook is null then
        :new.id_clnte_wbhook := sq_ws_d_clientes_webhook.nextval;
      end if;
    elsif updating then
      :new.usrio_mdfca := coalesce( sys_context('apex$session','app_user'),
                      regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'),
                      sys_context('userenv','session_user') ) ;
      :new.fcha_mdfca := systimestamp;
    end if;
  end before each row;
end;



/
ALTER TRIGGER "WS_D_CLIENTES_WEBHOOK_IU" ENABLE;

