
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FORMULARIOS_CONDICION_IU"
  for insert or update on gi_d_formularios_condicion
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_frmlrio_cndcion := sq_gi_d_formularios_condicion.nextval;
		end if;
	end before each row;
end gi_d_formularios_condicion_iu;








/
ALTER TRIGGER "GI_D_FORMULARIOS_CONDICION_IU" ENABLE;

