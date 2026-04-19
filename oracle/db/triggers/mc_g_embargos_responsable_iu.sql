
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_RESPONSABLE_IU"
	for insert or update on mc_g_embargos_responsable
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_rspnsble is null then
				:new.id_embrgos_rspnsble := SQ_MC_G_EMBARGOS_RESPONSABLE.NEXTVAL;
			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_EMBARGOS_RESPONSABLE_IU" ENABLE;

