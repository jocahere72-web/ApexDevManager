
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DTRMNCION_DTLLE_BLOB_IU"
for insert on gi_g_dtrmncion_dtlle_blob
compound trigger
	d number;
before each row is
begin
	if inserting then
		if ( :new.id_dtrmncion_dtlle_blob is null ) then
			d := sq_gi_g_dtrmncion_dtlle_blob.nextval;
			:new.id_dtrmncion_dtlle_blob  := d;
		end if;
	end if;
end before each row;
end;



/
ALTER TRIGGER "GI_G_DTRMNCION_DTLLE_BLOB_IU" ENABLE;

