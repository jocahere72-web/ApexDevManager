
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_CAJAS_BANCO_IU"
	for insert on df_s_cajas_banco
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cja_bnco is null then
				d	:= sq_df_s_cajas_banco.nextval();
				:new.id_cja_bnco := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "DF_S_CAJAS_BANCO_IU" ENABLE;

