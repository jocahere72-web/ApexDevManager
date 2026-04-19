
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_TITULO_RESPONSABLE_IU" for insert or update on GI_G_TITULO_RESPONSABLE compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_TTLO_RSPNSBLE is null then

				select nvl(max(ID_TTLO_RSPNSBLE)+1, 1) into d from GI_G_TITULO_RESPONSABLE;
				:new.ID_TTLO_RSPNSBLE := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "GI_G_TITULO_RESPONSABLE_IU" ENABLE;

