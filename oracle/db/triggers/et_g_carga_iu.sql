
  CREATE OR REPLACE EDITIONABLE TRIGGER "ET_G_CARGA_IU"
	for insert or update on et_g_carga
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_crga is null then
				select nvl( max(id_crga), 0 ) + 1  into d
				from et_g_carga;
				:new.id_crga := d;
			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "ET_G_CARGA_IU" ENABLE;

