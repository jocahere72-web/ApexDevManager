
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SLDO_FVOR_SLCTUD_ESTDO_IU"
	for insert or update on gf_g_sldo_fvor_slctud_estdo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sldo_fvor_slctud_estdo is null then

				select nvl(max(id_sldo_fvor_slctud_estdo)+1, 1) into d
				  from gf_g_sldo_fvor_slctud_estdo;
				:new.id_sldo_fvor_slctud_estdo := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_G_SLDO_FVOR_SLCTUD_ESTDO_IU" ENABLE;

