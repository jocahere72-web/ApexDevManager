
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_D_TIPOS_ERROR_IU"
	for insert or update on sg_d_tipos_error
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_tpo_error is null then
				select nvl( max(id_tpo_error), 0 ) + 1  into d
				from sg_d_tipos_error;
				:new.id_tpo_error := d;
			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "SG_D_TIPOS_ERROR_IU" ENABLE;

