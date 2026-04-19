
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_SMU_MVMNTO_IU"
	for insert or update on mc_g_embargos_smu_mvmnto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_smu_mvmnto is null then

				select nvl(max(id_embrgos_smu_mvmnto)+1, 1) into d
				  from mc_g_embargos_smu_mvmnto;
				:new.id_embrgos_smu_mvmnto := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_EMBARGOS_SMU_MVMNTO_IU" ENABLE;

