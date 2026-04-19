
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_DSMBRGS_REMANENTE_IU"
  for insert or update on mc_g_dsmbrgs_remanente
  compound trigger
    before each row is
	begin
		if inserting then
			if :new.id_dsmbrgos_rmnte is null then
				:new.id_dsmbrgos_rmnte := sq_mc_g_dsmbrgs_remanente.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "MC_G_DSMBRGS_REMANENTE_IU" ENABLE;

