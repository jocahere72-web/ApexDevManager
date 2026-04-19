
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PRCSOS_JRDCO_DCMNT_LTE_IU"
	for insert on cb_g_prcsos_jrdco_dcmnt_lte
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcso_jrdco_dcmnto_lte is null then
				d	:= sq_cb_g_prcsos_jrdco_dcmnt_lte.nextval();
				:new.id_prcso_jrdco_dcmnto_lte := d;
				:new.fcha_lte			:= systimestamp;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "CB_G_PRCSOS_JRDCO_DCMNT_LTE_IU" ENABLE;

