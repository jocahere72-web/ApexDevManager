
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_DCMNTO_LTE_BLOB_IU"
for insert on re_g_dcmnto_lte_blob
compound trigger
	d number;
before each row is
begin
	if inserting then
		if ( :new.id_dcmnto_lte_blob is null ) then
			d := sq_re_g_dcmnto_lte_blob.nextval;
			:new.id_dcmnto_lte_blob  := d;
		end if;
	end if;
end before each row;
end;





/
ALTER TRIGGER "RE_G_DCMNTO_LTE_BLOB_IU" ENABLE;

