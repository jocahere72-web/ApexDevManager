
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_MODIFICACION_IU"
	for insert or update on gf_g_convenios_modificacion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_mdfccion is null then

				d := sq_gf_g_convenios_modificacion.nextval;
				:new.id_cnvnio_mdfccion := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CONVENIOS_MODIFICACION_IU" ENABLE;

