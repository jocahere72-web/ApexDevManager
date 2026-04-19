
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_EXENCIONES_SLCTUD_MTVO_IU"
	for insert or update on gf_g_exenciones_slctud_mtvo
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_exncion_slctud_mtvo is null then
				:new.id_exncion_slctud_mtvo := sq_gf_g_exenciones_slctud_mtvo.nextval;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "GF_G_EXENCIONES_SLCTUD_MTVO_IU" ENABLE;

