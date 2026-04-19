
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_OBRAS_IU"
	for insert or update on gi_g_obras

compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_obra is null then

				select nvl(max(id_obra)+1, 1)
				  into d
				  from gi_g_obras;
				:new.id_obra := d;

			end if;
		end if;
	end before each row;

end;







/
ALTER TRIGGER "GI_G_OBRAS_IU" ENABLE;

