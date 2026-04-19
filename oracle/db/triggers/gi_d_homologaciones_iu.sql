
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_HOMOLOGACIONES_IU"
  for insert or update on gi_d_homologaciones
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_hmlgcion := sq_gi_d_homologaciones.nextval;
		end if;
	end before each row;
end gi_d_homologaciones_iu;






/
ALTER TRIGGER "GI_D_HOMOLOGACIONES_IU" ENABLE;

