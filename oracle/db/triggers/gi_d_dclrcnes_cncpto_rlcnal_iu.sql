
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNES_CNCPTO_RLCNAL_IU"
  for insert or update on gi_d_dclrcnes_cncpto_rlcnal
  compound trigger
	before each row is
	begin
		if (:new.fla is null) then
			:new.fla := 1;
		end if;
		if inserting then
			:new.id_dclrcion_cncpto_rlcnal := sq_gi_d_dclrcnes_cncpto_rlcnal.nextval;
		end if;
	end before each row;
end gi_d_dclrcnes_cncpto_rlcnal_iu;






/
ALTER TRIGGER "GI_D_DCLRCNES_CNCPTO_RLCNAL_IU" ENABLE;

