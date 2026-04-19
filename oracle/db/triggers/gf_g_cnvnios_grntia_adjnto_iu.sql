
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CNVNIOS_GRNTIA_ADJNTO_IU"
	for insert or update on gf_g_cnvnios_grntia_adjnto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_grntia_adjnto is null then
				d := sq_gf_g_cnvnios_grntia_adjnto.nextval;
				:new.id_cnvnio_grntia_adjnto := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CNVNIOS_GRNTIA_ADJNTO_IU" ENABLE;

