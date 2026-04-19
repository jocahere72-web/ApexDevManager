
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_INCMPLMNTO_IU"
	for insert or update on gf_g_convenios_incmplmnto
	compound trigger
	d number;
	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_incmplmnto is null then

				d := sq_gf_g_convenios_incmplmnto.nextval;
                :new.id_cnvnio_incmplmnto := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CONVENIOS_INCMPLMNTO_IU" ENABLE;

