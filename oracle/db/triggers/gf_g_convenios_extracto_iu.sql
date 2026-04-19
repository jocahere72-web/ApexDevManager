
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_EXTRACTO_IU"
	for insert or update on gf_g_convenios_extracto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_extrcto is null then

				d := sq_gf_g_convenios_extracto.nextval;
				:new.id_cnvnio_extrcto := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CONVENIOS_EXTRACTO_IU" ENABLE;

