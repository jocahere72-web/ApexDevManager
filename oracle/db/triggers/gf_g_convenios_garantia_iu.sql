
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_GARANTIA_IU"
	for insert or update on gf_g_convenios_garantia
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_grntia is null then

				d := sq_gf_g_convenios_garantia.nextval;
				:new.id_cnvnio_grntia := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CONVENIOS_GARANTIA_IU" ENABLE;

