
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_PAGADORES_DOCUMENTO_IU"
	for insert or update on RE_G_PAGADORES_DOCUMENTO
	compound trigger
	d number;

	before each row is
		begin
			if inserting then
				if :new.ID_PGDOR_DCMNTO is null then
					:new.ID_PGDOR_DCMNTO := SQ_RE_G_PAGADORES_DOCUMENTO.nextval;
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "RE_G_PAGADORES_DOCUMENTO_IU" ENABLE;

