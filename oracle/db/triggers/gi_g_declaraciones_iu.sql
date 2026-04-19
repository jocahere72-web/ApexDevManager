
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DECLARACIONES_IU"
  for insert or update on gi_g_declaraciones
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcion := sq_gi_g_declaraciones.nextval;
		end if;
	end before each row;
end gi_g_declaraciones_iu;






/
ALTER TRIGGER "GI_G_DECLARACIONES_IU" ENABLE;

