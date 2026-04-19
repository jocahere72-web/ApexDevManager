
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FRMLRIOS_RGION_ATRBTO_IU"
  for insert or update on gi_d_frmlrios_rgion_atrbto
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_frmlrio_rgion_atrbto := sq_gi_d_frmlrios_rgion_atrbto.nextval;
		end if;
	end before each row;
end gi_d_frmlrios_rgion_atrbto_iu;









/
ALTER TRIGGER "GI_D_FRMLRIOS_RGION_ATRBTO_IU" ENABLE;

