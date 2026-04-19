
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNES_TPOS_VGNCIAS_IU"
  for insert or update on gi_d_dclrcnes_tpos_vgncias
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcion_tpo_vgncia := sq_gi_d_dclrcnes_tpos_vgncias.nextval;
		end if;
	end before each row;
end gi_d_dclrcnes_tpos_vgncias_iu;






/
ALTER TRIGGER "GI_D_DCLRCNES_TPOS_VGNCIAS_IU" ENABLE;

