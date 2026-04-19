
  CREATE OR REPLACE EDITIONABLE TRIGGER "AD_D_MODULOS_IU"
	for insert or update on ad_d_modulos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_mdlo is null then
				select nvl( max(id_mdlo), 0 ) + 1  into d
				from ad_d_modulos;
				:new.id_mdlo := d;
			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "AD_D_MODULOS_IU" ENABLE;

