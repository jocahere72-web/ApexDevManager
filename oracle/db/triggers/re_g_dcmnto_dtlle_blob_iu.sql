
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_DCMNTO_DTLLE_BLOB_IU"
for insert on re_g_dcmnto_dtlle_blob
compound trigger
	d number;
before each row is
begin
	if inserting then
		if ( :new.id_dcmnto_dtlle_blob is null ) then
			d := sq_re_g_dcmnto_dtlle_blob.nextval;
			:new.id_dcmnto_dtlle_blob  := d;
		end if;
	end if;
end before each row;
end;





/
ALTER TRIGGER "RE_G_DCMNTO_DTLLE_BLOB_IU" ENABLE;

