
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_LIQUIDACIONES_AD_PRSNA_IU"
for insert or update on gi_g_liquidaciones_ad_prsna compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_lqdcion_adcnal_prsna is null then

				select nvl(max(id_lqdcion_adcnal_prsna)+1, 1) into d
				  from gi_g_liquidaciones_ad_prsna;
				  :new.id_lqdcion_adcnal_prsna := d;

			end if;
		end if;
	end before each row;

end;





/
ALTER TRIGGER "GI_G_LIQUIDACIONES_AD_PRSNA_IU" ENABLE;

