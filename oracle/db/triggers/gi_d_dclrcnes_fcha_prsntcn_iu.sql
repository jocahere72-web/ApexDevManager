
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNES_FCHA_PRSNTCN_IU"
  for insert or update on gi_d_dclrcnes_fcha_prsntcn
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcion_fcha_prsntcion := sq_gi_d_dclrcnes_fcha_prsntcn.nextval;
		end if;
	end before each row;
end gi_d_dclrcnes_fcha_prsntcn_iu;






/
ALTER TRIGGER "GI_D_DCLRCNES_FCHA_PRSNTCN_IU" ENABLE;

