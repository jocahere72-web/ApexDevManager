
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_ACTIVIDADES_ECONOMICA_IU"
  for insert or update on gi_d_actividades_economica
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_actvdad_ecnmca := sq_gi_d_actividades_economica.nextval;
		end if;
	end before each row;
end gi_d_actividades_economica_iu;







/
ALTER TRIGGER "GI_D_ACTIVIDADES_ECONOMICA_IU" ENABLE;

