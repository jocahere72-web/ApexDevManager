
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_MANEJOS_ERROR_IU"
	for insert or update on sg_g_manejos_error
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_mnjo_error is null then
				select nvl( max(id_mnjo_error), 0 ) + 1  into d
				from sg_g_manejos_error;
				:new.id_mnjo_error := d;
			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "SG_G_MANEJOS_ERROR_IU" ENABLE;

