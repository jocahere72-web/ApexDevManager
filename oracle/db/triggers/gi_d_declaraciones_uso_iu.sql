
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DECLARACIONES_USO_IU"
  for insert or update on gi_d_declaraciones_uso
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcion_uso := sq_gi_d_declaraciones_uso.nextval;
		end if;
	end before each row;
end gi_d_declaraciones_uso_iu;






/
ALTER TRIGGER "GI_D_DECLARACIONES_USO_IU" ENABLE;

