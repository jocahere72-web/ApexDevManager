
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_ANULACION_IU"
	for insert or update on gf_g_convenios_anulacion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_anlcion is null then

				d := sq_gf_g_convenios_anulacion.nextval;
				:new.id_cnvnio_anlcion := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CONVENIOS_ANULACION_IU" ENABLE;

