
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FSCLZC_EXPDN_CNDD_VGNC_IU"
	for insert or update on fi_g_fsclzc_expdn_cndd_vgnc
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.ID_FSCLZC_EXPDN_CNDD_VGNC is null then
				d := sq_fi_g_fsclzc_expdn_cndd_vgnc.nextval();
				:new.ID_FSCLZC_EXPDN_CNDD_VGNC := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_FSCLZC_EXPDN_CNDD_VGNC_IU" ENABLE;

