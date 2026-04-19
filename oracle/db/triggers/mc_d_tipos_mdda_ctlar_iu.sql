
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_TIPOS_MDDA_CTLAR_IU"
	for insert or update on mc_d_tipos_mdda_ctlar
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_tpos_mdda_ctlar is null then

				select nvl(max(id_tpos_mdda_ctlar)+1, 1) into d
				  from mc_d_tipos_mdda_ctlar;
				:new.id_tpos_mdda_ctlar := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_TIPOS_MDDA_CTLAR_IU" ENABLE;

