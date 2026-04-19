
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_HMLGCNES_PRPDAD_IU"
  for insert or update on gi_d_hmlgcnes_prpdad
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_hmlgcion_prpdad := sq_gi_d_hmlgcnes_prpdad.nextval;
		end if;
	end before each row;
end gi_d_hmlgcnes_prpdad_iu;






/
ALTER TRIGGER "GI_D_HMLGCNES_PRPDAD_IU" ENABLE;

