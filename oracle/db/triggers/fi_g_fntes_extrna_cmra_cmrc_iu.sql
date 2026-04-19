
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FNTES_EXTRNA_CMRA_CMRC_IU"
	for insert or update on fi_g_fntes_extrna_cmra_cmrc
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fnte_extrna_cmra_cmrc is null then
				d := sq_fi_g_fntes_extrna_cmra_cmrc.nextval();
				:new.id_fnte_extrna_cmra_cmrc := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_FNTES_EXTRNA_CMRA_CMRC_IU" ENABLE;

