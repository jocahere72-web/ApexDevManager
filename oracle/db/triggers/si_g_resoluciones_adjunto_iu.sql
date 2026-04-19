
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_RESOLUCIONES_ADJUNTO_IU"
	for insert on si_g_resoluciones_adjunto
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_rsl_adjnto is null then
				:new.id_rsl_adjnto  := sq_si_g_resoluciones_adjunto.nextval;
			end if;
		end if;
	end before each row;
end;
/
ALTER TRIGGER "SI_G_RESOLUCIONES_ADJUNTO_IU" ENABLE;

