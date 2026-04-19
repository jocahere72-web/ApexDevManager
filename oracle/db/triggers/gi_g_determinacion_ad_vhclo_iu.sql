
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DETERMINACION_AD_VHCLO_IU"
	for insert or update on gi_g_determinacion_ad_vhclo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dtrmncion_ad_vhclo is null then
				:new.id_dtrmncion_ad_vhclo := sq_gi_g_determinacion_ad_vhclo.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GI_G_DETERMINACION_AD_VHCLO_IU" ENABLE;

