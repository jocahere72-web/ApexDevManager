
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_FINALIZACION_IU"
	for insert or update on gf_g_convenios_finalizacion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_fnlzcion is null then

				d := sq_gf_g_convenios_finalizacion.nextval;
				:new.id_cnvnio_fnlzcion := d;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "GF_G_CONVENIOS_FINALIZACION_IU" ENABLE;

