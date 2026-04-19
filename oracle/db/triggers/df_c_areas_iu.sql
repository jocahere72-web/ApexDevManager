
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_AREAS_IU"
	for insert or update on df_c_areas
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_area is null then
				select nvl( max(id_area), 0 ) + 1  into d
				from df_c_areas;
				:new.id_area := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "DF_C_AREAS_IU" ENABLE;

