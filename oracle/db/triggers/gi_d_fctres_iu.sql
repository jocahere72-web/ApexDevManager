
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FCTRES_IU"
	for insert or update on gi_d_fctres

compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fctr is null then

				select nvl(max(id_fctr)+1, 1)
				  into d
				  from gi_d_fctres;
				:new.id_fctr := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "GI_D_FCTRES_IU" ENABLE;

