
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_EXTRACCIONES_FORMULRIO_IU"
  for insert or update on gi_d_extracciones_formulrio
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_extrccion_frmlrio := sq_gi_d_extracciones_formulrio.nextval;
		end if;
	end before each row;
end gi_d_extracciones_formulrio_iu;




/
ALTER TRIGGER "GI_D_EXTRACCIONES_FORMULRIO_IU" ENABLE;

