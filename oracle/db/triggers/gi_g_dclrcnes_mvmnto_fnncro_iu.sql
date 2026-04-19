
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DCLRCNES_MVMNTO_FNNCRO_IU"
  for insert or update on gi_g_dclrcnes_mvmnto_fnncro
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcion_mvmnto_fnncro := sq_gi_g_dclrcnes_mvmnto_fnncro.nextval;
		end if;
	end before each row;
end gi_g_dclrcnes_mvmnto_fnncro_iu;






/
ALTER TRIGGER "GI_G_DCLRCNES_MVMNTO_FNNCRO_IU" ENABLE;

