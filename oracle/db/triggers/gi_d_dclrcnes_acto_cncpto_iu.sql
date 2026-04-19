
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNES_ACTO_CNCPTO_IU"
  for insert or update on gi_d_dclrcnes_acto_cncpto
  compound trigger
	before each row is
	begin
		if (:new.fla is null) then
			:new.fla := 1;
		end if;
		if inserting then
			:new.id_dclrcion_acto_cncpto := sq_gi_d_dclrcnes_acto_cncpto.nextval;
		end if;
	end before each row;
end gi_d_dclrcnes_acto_cncpto_iu;






/
ALTER TRIGGER "GI_D_DCLRCNES_ACTO_CNCPTO_IU" ENABLE;

