
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_EXTRACCIONES_ATRIBUTO_IU"
  for insert or update on gi_d_extracciones_atributo
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_extrccion_atrbto := sq_gi_d_extracciones_atributo.nextval;
		end if;
	end before each row;
end gi_d_extracciones_atributo_iu;






/
ALTER TRIGGER "GI_D_EXTRACCIONES_ATRIBUTO_IU" ENABLE;

