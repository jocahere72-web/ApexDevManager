
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_TITULOS_EJECUTIVO_IU" for insert or update on "GI_G_TITULOS_EJECUTIVO_2" compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_TTLO_EJCTVO is null then

				select nvl(max(ID_TTLO_EJCTVO)+1, 1) into d from GI_G_TITULOS_EJECUTIVO;
				:new.ID_TTLO_EJCTVO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "GI_G_TITULOS_EJECUTIVO_IU" ENABLE;

