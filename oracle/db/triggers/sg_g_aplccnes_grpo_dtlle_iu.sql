
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_APLCCNES_GRPO_DTLLE_IU"
	for insert or update on sg_g_aplccnes_grpo_dtlle
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_aplccion_grpo_dtlle is null then
				select nvl( max(id_aplccion_grpo_dtlle), 0 ) + 1  into d
				from sg_g_aplccnes_grpo_dtlle;
				:new.id_aplccion_grpo_dtlle := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "SG_G_APLCCNES_GRPO_DTLLE_IU" ENABLE;

