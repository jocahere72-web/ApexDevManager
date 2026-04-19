
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FORMULARIOS_IU"
  for insert or update on gi_d_formularios
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_frmlrio := sq_gi_d_formularios.nextval;
		end if;
	end before each row;
end gi_d_formularios_iu;









/
ALTER TRIGGER "GI_D_FORMULARIOS_IU" ENABLE;

