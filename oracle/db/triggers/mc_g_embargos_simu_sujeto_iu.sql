
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_SIMU_SUJETO_IU"
	for insert or update on mc_g_embargos_simu_sujeto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_smu_sjto is null then

				select nvl(max(id_embrgos_smu_sjto)+1, 1) into d
				  from mc_g_embargos_simu_sujeto;
				:new.id_embrgos_smu_sjto := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_EMBARGOS_SIMU_SUJETO_IU" ENABLE;

