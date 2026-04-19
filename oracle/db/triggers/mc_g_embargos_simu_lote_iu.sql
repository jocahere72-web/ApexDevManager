
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_SIMU_LOTE_IU"
	for insert or update on mc_g_embargos_simu_lote
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_smu_lte is null then
				:new.id_embrgos_smu_lte := sq_mc_g_embargos_simu_lote.nextval;
			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_EMBARGOS_SIMU_LOTE_IU" ENABLE;

