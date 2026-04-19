
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDORES_IU"
	for insert or update on ws_d_provedores
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prvdor is null then

				select nvl(max(id_prvdor)+1, 1) into d
				  from ws_d_provedores;
				:new.id_prvdor := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "WS_D_PROVEDORES_IU" ENABLE;

