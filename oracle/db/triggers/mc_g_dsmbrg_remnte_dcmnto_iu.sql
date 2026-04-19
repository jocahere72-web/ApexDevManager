
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_DSMBRG_REMNTE_DCMNTO_IU"
  for insert or update on mc_g_dsmbrg_remnte_dcmnto
  compound trigger
    before each row is
	begin
		if inserting then
			if :new.id_dsmbg_rmnte_dcmnto is null then
				:new.id_dsmbg_rmnte_dcmnto := sq_mc_g_dsmbrg_remnte_dcmnto.nextval;
			end if;
		end if;
	end before each row;
end;

/
ALTER TRIGGER "MC_G_DSMBRG_REMNTE_DCMNTO_IU" ENABLE;

