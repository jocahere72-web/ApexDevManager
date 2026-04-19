
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_USUARIOS_TELEFONIA_IU"
	for insert on GI_D_USUARIOS_TELEFONIA
	compound trigger
	d number;

		before each row is
		begin
			if inserting then
				if :new.id_usrio_tlfnia is null then
					d	:= sq_gi_d_usuarios_telefonia.nextval();
					:new.id_usrio_tlfnia := d;
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "GI_D_USUARIOS_TELEFONIA_IU" ENABLE;

