
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_DEFINICIONES_CLIENTE_IU"
	for insert or update on df_c_definiciones_cliente
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dfncion_clnte is null then
				select nvl( max(id_dfncion_clnte), 0 ) + 1  into d
				from df_c_definiciones_cliente;
				:new.id_dfncion_clnte := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "DF_C_DEFINICIONES_CLIENTE_IU" ENABLE;

