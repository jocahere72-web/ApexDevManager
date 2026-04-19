
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNES_VGNCIAS_FRMLR_IU"
  for insert or update on gi_d_dclrcnes_vgncias_frmlr
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcion_vgncia_frmlrio := sq_gi_d_dclrcnes_vgncias_frmlr.nextval;
		end if;
	end before each row;
end gi_d_dclrcnes_vgncias_frmlr_iu;






/
ALTER TRIGGER "GI_D_DCLRCNES_VGNCIAS_FRMLR_IU" ENABLE;

