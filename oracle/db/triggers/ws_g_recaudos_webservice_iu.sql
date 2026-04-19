
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_G_RECAUDOS_WEBSERVICE_IU"
  for insert on ws_g_recaudos_webservice
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_rcdo_wbsrvce is null then

        d                    := sq_ws_g_recaudos_webservice.nextval();
        :new.id_rcdo_wbsrvce := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_G_RECAUDOS_WEBSERVICE_IU" ENABLE;

