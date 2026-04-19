
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDORES_API_IU"
	for insert or update on ws_d_provedores_api
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prvdor_api is null then

				select nvl(max(id_prvdor_api)+1, 1) into d
				  from ws_d_provedores_api;
				:new.id_prvdor_api := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "WS_D_PROVEDORES_API_IU" ENABLE;

