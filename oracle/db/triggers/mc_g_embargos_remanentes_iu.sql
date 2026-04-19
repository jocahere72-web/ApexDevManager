
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_REMANENTES_IU"
	for insert on mc_g_embargos_remanente
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_rmnte is null then
				:new.id_embrgos_rmnte := sq_mc_g_embargos_remanentes.nextval;
			end if;
		end if;
	end before each row;

end;


/
ALTER TRIGGER "MC_G_EMBARGOS_REMANENTES_IU" ENABLE;

