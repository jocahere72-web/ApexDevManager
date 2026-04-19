
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_SIMU_RSPNSBLE_IU"
	for insert or update on mc_g_embargos_simu_rspnsble
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_smu_rspnsble is null then
				:new.id_embrgos_smu_rspnsble := SQ_MC_G_EMBARGOS_SIMU_RSPNSBLE.nextval;
			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_EMBARGOS_SIMU_RSPNSBLE_IU" ENABLE;

