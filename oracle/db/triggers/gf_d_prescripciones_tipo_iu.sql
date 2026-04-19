
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_PRESCRIPCIONES_TIPO_IU"
  for insert or update on gf_d_prescripciones_tipo
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_prscrpcion_tpo := sq_gf_d_prescripciones_tipo.nextval;
		end if;
	end before each row;
end gf_d_prescripciones_tipo_iu;






/
ALTER TRIGGER "GF_D_PRESCRIPCIONES_TIPO_IU" ENABLE;

