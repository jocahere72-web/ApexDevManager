
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_TEMPORAL_IU"
	for insert or update on gn_g_temporal
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_tmpral is null then
				:new.id_tmpral  := sq_gn_g_temporal.nextval;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "GN_G_TEMPORAL_IU" ENABLE;

