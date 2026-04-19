
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DETERMINACION_AD_PRSNA_IU"
	for insert or update on gi_g_determinacion_ad_prsna
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dtrmncion_ad_prsna is null then
				:new.id_dtrmncion_ad_prsna := sq_gi_g_determinacion_ad_prsna.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GI_G_DETERMINACION_AD_PRSNA_IU" ENABLE;

