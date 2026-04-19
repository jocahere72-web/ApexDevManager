
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_ADJUNTOS_IU"
	for insert or update on gn_g_adjuntos
	compound trigger

	before each row is
		begin
			if inserting then
				if :new.id_adjnto is null then
					:new.id_adjnto := sq_gn_g_adjuntos.nextval;
				end if;
			end if;
			:new.fcha_rgstro := systimestamp;
	end before each row;

	end gn_g_adjuntos_iu;

/
ALTER TRIGGER "GN_G_ADJUNTOS_IU" ENABLE;

