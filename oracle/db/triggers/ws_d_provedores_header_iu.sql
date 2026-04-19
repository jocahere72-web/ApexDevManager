
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDORES_HEADER_IU"
	for insert or update on ws_d_provedores_header
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prvdor_header is null then

				select nvl(max(id_prvdor_header)+1, 1) into d
				  from ws_d_provedores_header;
				:new.id_prvdor_header := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "WS_D_PROVEDORES_HEADER_IU" ENABLE;

