
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBRGO_DSMBRGO_ERROR_IU"
	for insert on mc_g_embrgo_dsmbrgo_error
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgo_dsmbrgo_error is null then
				d	:= sq_mc_g_embrgo_dsmbrgo_error.nextval();
				:new.id_embrgo_dsmbrgo_error := d;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "MC_G_EMBRGO_DSMBRGO_ERROR_IU" ENABLE;

