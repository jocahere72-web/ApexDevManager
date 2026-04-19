
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDOR_PROPIEDADES_IU"
	for insert or update on ws_d_provedor_propiedades
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prvdor_prpdde is null then

				select nvl(max(id_prvdor_prpdde)+1, 1) into d
				  from ws_d_provedor_propiedades;
				:new.id_prvdor_prpdde := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "WS_D_PROVEDOR_PROPIEDADES_IU" ENABLE;

