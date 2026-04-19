
  CREATE OR REPLACE EDITIONABLE TRIGGER "GD_D_TRD_IU"
	for insert or update on gd_d_trd
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_trd is null then
				select nvl( max(id_trd), 0 ) + 1  into d
				from gd_d_trd;
				:new.id_trd := d;
			end if;
		end if;

	end before each row;
end gd_d_trd_iu;







/
ALTER TRIGGER "GD_D_TRD_IU" ENABLE;

