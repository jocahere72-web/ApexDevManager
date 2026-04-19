
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FRMLRIOS_CNDCION_ACCN_IU"
  for insert or update on gi_d_frmlrios_cndcion_accn
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_frmlrio_cndcion_accion := sq_gi_d_frmlrios_cndcion_accn.nextval;
		end if;
	end before each row;
end gi_d_frmlrios_cndcion_accn_iu;






/
ALTER TRIGGER "GI_D_FRMLRIOS_CNDCION_ACCN_IU" ENABLE;

