
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DECLARACIONES_TIPO_IU"
  for insert or update on gi_d_declaraciones_tipo
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcn_tpo := sq_gi_d_declaraciones_tipo.nextval;
		end if;
	end before each row;
end gi_d_declaraciones_tipo_iu;







/
ALTER TRIGGER "GI_D_DECLARACIONES_TIPO_IU" ENABLE;

