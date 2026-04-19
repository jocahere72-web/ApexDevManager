
  CREATE OR REPLACE EDITIONABLE TRIGGER "GD_D_SERIES_IU"
	for insert or update on gd_d_series
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_srie is null then
				select nvl( max(id_srie), 0 ) + 1  into d
				from gd_d_series;
				:new.id_srie := d;
			end if;
		end if;

	end before each row;
end gd_d_series_iu;







/
ALTER TRIGGER "GD_D_SERIES_IU" ENABLE;

