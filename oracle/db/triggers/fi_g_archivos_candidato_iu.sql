
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_ARCHIVOS_CANDIDATO_IU"
	for insert or update on fi_g_archivos_candidato
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_archvo_cnddto is null then
				d := sq_fi_g_archivos_candidato.nextval();
				:new.id_archvo_cnddto := d;
			end if;
			:new.user_dgta := user;
			:new.fcha_dgta := systimestamp;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_ARCHIVOS_CANDIDATO_IU" ENABLE;

