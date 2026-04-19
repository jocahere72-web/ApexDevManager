
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_PRESCRIPCIONES_IU"
  for insert or update on gf_g_prescripciones
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_prscrpcion := sq_gf_g_prescripciones.nextval;
		end if;
	end before each row;
end gf_g_prescripciones_iu;






/
ALTER TRIGGER "GF_G_PRESCRIPCIONES_IU" ENABLE;

