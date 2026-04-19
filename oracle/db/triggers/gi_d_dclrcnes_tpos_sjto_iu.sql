
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNES_TPOS_SJTO_IU"
  for insert or update on gi_d_dclrcnes_tpos_sjto
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcion_tpo_sjto := sq_gi_d_dclrcnes_tpos_sjto.nextval;
		end if;
	end before each row;
end gi_d_dclrcnes_tpos_sjto_iu;






/
ALTER TRIGGER "GI_D_DCLRCNES_TPOS_SJTO_IU" ENABLE;

