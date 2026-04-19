
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_G_RECAUDOS_WEBSERVICE_LOG_IU"
for insert or update on  ws_g_recaudos_webservice_log
compound  trigger

before each row is
	begin
		if inserting then
			if :new.id_rcdo_wbsrvce_log is null then
				:new.id_rcdo_wbsrvce_log := sq_ws_g_recaudos_webservice_log.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "WS_G_RECAUDOS_WEBSERVICE_LOG_IU" ENABLE;

