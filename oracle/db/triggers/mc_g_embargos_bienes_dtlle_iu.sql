
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_BIENES_DTLLE_IU"
	for insert or update on mc_g_embargos_bienes_detalle
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_bnes_dtlle is null then

				select nvl(max(id_embrgos_bnes_dtlle)+1, 1) into d
				  from mc_g_embargos_bienes_detalle;
				:new.id_embrgos_bnes_dtlle := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_EMBARGOS_BIENES_DTLLE_IU" ENABLE;

