
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_BIENES_IU"
	for insert or update on mc_g_embargos_bienes
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_bnes is null then

				select nvl(max(id_embrgos_bnes)+1, 1) into d
				  from mc_g_embargos_bienes;
				:new.id_embrgos_bnes := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_EMBARGOS_BIENES_IU" ENABLE;

