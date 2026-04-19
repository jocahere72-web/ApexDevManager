
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FORMULARIOS_VALIDACION_IU"
  for insert or update on gi_d_formularios_validacion
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_frmlrio_vldcion := sq_gi_d_formularios_validacion.nextval;
		end if;
	end before each row;
end gi_d_formularios_validacion_iu;






/
ALTER TRIGGER "GI_D_FORMULARIOS_VALIDACION_IU" ENABLE;

