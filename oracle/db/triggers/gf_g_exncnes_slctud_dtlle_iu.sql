
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_EXNCNES_SLCTUD_DTLLE_IU"
	for insert or update on gf_g_exncnes_slctud_dtlle
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_exncion_slctud_dtlle is null then
				:new.id_exncion_slctud_dtlle := sq_gf_g_exncnes_slctud_dtlle.nextval;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_EXNCNES_SLCTUD_DTLLE_IU" ENABLE;

