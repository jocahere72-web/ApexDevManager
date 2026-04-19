
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_LOTES_MDDA_CTLAR_IU"
	for insert or update on mc_g_lotes_mdda_ctlar
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_lte_mdda_ctlar is null then

				select nvl(max(id_lte_mdda_ctlar)+1, 1) into d
				  from mc_g_lotes_mdda_ctlar;
				:new.id_lte_mdda_ctlar := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_LOTES_MDDA_CTLAR_IU" ENABLE;

