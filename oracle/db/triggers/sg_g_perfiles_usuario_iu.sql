
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_PERFILES_USUARIO_IU"
  for insert or update or delete on sg_g_perfiles_usuario

compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_prfil_usrio is null then
				select nvl( max(id_prfil_usrio), 0 ) + 1
				  into :new.id_prfil_usrio
				from sg_g_perfiles_usuario;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "SG_G_PERFILES_USUARIO_IU" ENABLE;

