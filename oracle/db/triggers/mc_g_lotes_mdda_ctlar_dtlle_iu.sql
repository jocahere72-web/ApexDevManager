
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_LOTES_MDDA_CTLAR_DTLLE_IU"
	for insert or update on mc_g_lotes_mdda_ctlar_dtlle
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_lte_mdda_ctlar_dtlle is null then

				:new.id_lte_mdda_ctlar_dtlle := sq_mc_g_lotes_mdda_ctlar_dtlle.NEXTVAL;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_LOTES_MDDA_CTLAR_DTLLE_IU" ENABLE;

