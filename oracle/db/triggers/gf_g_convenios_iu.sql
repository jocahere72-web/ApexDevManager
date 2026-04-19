
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_IU"
	for insert or update on gf_g_convenios
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio is null then

				d := sq_gf_g_convenios.nextval;
				:new.id_cnvnio := d;

			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "GF_G_CONVENIOS_IU" ENABLE;

