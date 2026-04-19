
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGO_RMNTE_DTLLE_IU"
  for insert or update on mc_g_embrgo_remnte_dtlle
  compound trigger
    before each row is
	begin
		if inserting then
			if :new.id_embrgo_rmnte_dtlle is null then
				:new.id_embrgo_rmnte_dtlle := sq_mc_g_embargo_rmnte_dtlle.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "MC_G_EMBARGO_RMNTE_DTLLE_IU" ENABLE;

