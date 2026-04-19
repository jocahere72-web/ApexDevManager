
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DTRMNCION_LTE_BLOB_IU"
for insert on gi_g_dtrmncion_lte_blob
compound trigger
	d number;
before each row is
begin
	if inserting then
		if ( :new.id_dtrm_lte_blob is null ) then
			d := sq_gi_g_dtrmncion_lte_blob.nextval;
			:new.id_dtrm_lte_blob  := d;
		end if;
	end if;
end before each row;
end;



/
ALTER TRIGGER "GI_G_DTRMNCION_LTE_BLOB_IU" ENABLE;

