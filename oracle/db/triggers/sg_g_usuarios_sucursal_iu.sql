
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_USUARIOS_SUCURSAL_IU"
	for insert or update on sg_g_usuarios_sucursal
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_usrio_scrsal is null then
				:new.id_usrio_scrsal := sq_sg_g_usuarios_sucursal.nextval;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "SG_G_USUARIOS_SUCURSAL_IU" ENABLE;

