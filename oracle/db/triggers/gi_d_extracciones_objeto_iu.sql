
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_EXTRACCIONES_OBJETO_IU"
  for insert or update on gi_d_extracciones_objeto
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_extrccion_objto := sq_gi_d_extracciones_objeto.nextval;
		end if;
	end before each row;
end gi_d_extracciones_objeto_iu;




/
ALTER TRIGGER "GI_D_EXTRACCIONES_OBJETO_IU" ENABLE;

