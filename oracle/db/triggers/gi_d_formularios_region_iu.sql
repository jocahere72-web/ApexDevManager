
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FORMULARIOS_REGION_IU"
  for insert or update on gi_d_formularios_region
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_frmlrio_rgion := sq_gi_d_formularios_region.nextval;
		end if;
	end before each row;
end gi_d_formularios_region_iu;









/
ALTER TRIGGER "GI_D_FORMULARIOS_REGION_IU" ENABLE;

