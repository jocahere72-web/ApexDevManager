
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_CLIENTES_IU"
	for insert or update on df_s_clientes
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.cdgo_clnte is null then
				select nvl( max(cdgo_clnte), 0 ) + 1  into d
				from df_s_clientes;
				:new.cdgo_clnte := d;
			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "DF_S_CLIENTES_IU" ENABLE;

