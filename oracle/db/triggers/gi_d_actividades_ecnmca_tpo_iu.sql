
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_ACTIVIDADES_ECNMCA_TPO_IU"
  for insert or update on gi_d_actividades_ecnmca_tpo
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_actvdad_ecnmca_tpo := sq_gi_d_actividades_ecnmca_tpo.nextval;
		end if;
	end before each row;
end gi_d_actividades_ecnmca_tpo_iu;







/
ALTER TRIGGER "GI_D_ACTIVIDADES_ECNMCA_TPO_IU" ENABLE;

