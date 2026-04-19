
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_IMAGENES_CLIENTE_IU"
	for insert or update on df_c_imagenes_cliente
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_imgen_clnte is null then
				select nvl( max(id_imgen_clnte), 0 ) + 1  into d
				from df_c_imagenes_cliente;
				:new.id_imgen_clnte := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "DF_C_IMAGENES_CLIENTE_IU" ENABLE;

