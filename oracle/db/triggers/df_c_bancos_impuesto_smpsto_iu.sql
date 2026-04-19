
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_BANCOS_IMPUESTO_SMPSTO_IU"
	for insert on df_c_bancos_impuesto_smpsto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_bnco_impsto_sbmpsto is null then
				d	:= sq_df_c_bancos_impuesto_smpsto.nextval();
				:new.id_bnco_impsto_sbmpsto := d;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "DF_C_BANCOS_IMPUESTO_SMPSTO_IU" ENABLE;

