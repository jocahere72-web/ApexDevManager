
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_CARTERA_IU"
	for insert or update on gf_g_convenios_cartera
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_crtra is null then

				d := sq_gf_g_convenios_cartera.nextval;
				:new.id_cnvnio_crtra := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CONVENIOS_CARTERA_IU" ENABLE;

