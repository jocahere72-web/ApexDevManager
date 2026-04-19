
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DETERMINACION_AD_PRDIO_IU"
	for insert or update on gi_g_determinacion_ad_prdio
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dtrmncion_ad_prdio is null then
				:new.id_dtrmncion_ad_prdio := sq_gi_g_determinacion_ad_prdio.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GI_G_DETERMINACION_AD_PRDIO_IU" ENABLE;

