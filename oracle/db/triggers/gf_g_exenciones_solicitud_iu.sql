
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_EXENCIONES_SOLICITUD_IU"
	for insert or update on gf_g_exenciones_solicitud
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_exncion_slctud is null then
				:new.id_exncion_slctud := sq_gf_g_exenciones_solicitud.nextval;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_EXENCIONES_SOLICITUD_IU" ENABLE;

