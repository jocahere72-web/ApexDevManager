
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_DSMBRGS_SLCTD_ENTDDS_IU"
	for insert or update on mc_g_dsmbrgs_slctd_entdds
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dsmbrgo_slctud_entddes is null then


				:new.id_dsmbrgo_slctud_entddes := sq_mc_g_dsmbrgs_slctd_entdds.NEXTVAL;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_DSMBRGS_SLCTD_ENTDDS_IU" ENABLE;

