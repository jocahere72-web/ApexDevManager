
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_APLICACIONES_GRUPO_IU"
	for insert or update on sg_g_aplicaciones_grupo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_aplccion_grpo is null then
				select nvl( max(id_aplccion_grpo), 0 ) + 1  into d
				from sg_g_aplicaciones_grupo;
				:new.id_aplccion_grpo := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "SG_G_APLICACIONES_GRUPO_IU" ENABLE;

