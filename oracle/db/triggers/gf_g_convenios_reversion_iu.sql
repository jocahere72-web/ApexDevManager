
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_REVERSION_IU"
	for insert or update on gf_g_convenios_reversion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_rvrsion is null then

				d := sq_gf_g_convenios_reversion.nextval;
				:new.id_cnvnio_rvrsion := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CONVENIOS_REVERSION_IU" ENABLE;

