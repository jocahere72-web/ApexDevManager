
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_REVOCATORIA_IU"
	for insert or update on gf_g_convenios_revocatoria
	compound trigger
	d number;
	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_rvctria is null then

				d := sq_gf_g_convenios_revocatoria.nextval;
                :new.id_cnvnio_rvctria := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CONVENIOS_REVOCATORIA_IU" ENABLE;

