
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBRGS_RSLCION_RSPNSBL_IU"
	for insert or update on mc_g_embrgs_rslcion_rspnsbl
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgs_rslcion_rspnsbl is null then

				select nvl(max(id_embrgs_rslcion_rspnsbl)+1, 1) into d
				  from mc_g_embrgs_rslcion_rspnsbl;
				:new.id_embrgs_rslcion_rspnsbl := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_EMBRGS_RSLCION_RSPNSBL_IU" ENABLE;

