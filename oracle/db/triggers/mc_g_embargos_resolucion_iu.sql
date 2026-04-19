
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_RESOLUCION_IU"
	for insert or update on mc_g_embargos_resolucion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_rslcion is null then

				select nvl(max(id_embrgos_rslcion)+1, 1) into d
				  from mc_g_embargos_resolucion;
				:new.id_embrgos_rslcion := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_EMBARGOS_RESOLUCION_IU" ENABLE;

