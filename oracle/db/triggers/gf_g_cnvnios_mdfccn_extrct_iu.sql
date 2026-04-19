
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CNVNIOS_MDFCCN_EXTRCT_IU"
	for insert or update on gf_g_cnvnios_mdfccn_extrct
	compound trigger
	d number;
	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_mdfccion_extrcto is null then
                d := sq_gf_g_cnvnios_mdfccn_extrct.nextval;
				:new.id_cnvnio_mdfccion_extrcto := d;

			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "GF_G_CNVNIOS_MDFCCN_EXTRCT_IU" ENABLE;

