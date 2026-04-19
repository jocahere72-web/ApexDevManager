
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_PROYECTOS_CLIENTE_IU"
	for insert or update on ti_g_proyectos_cliente
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prycto_clnte is null then
				select nvl( max(id_prycto_clnte), 0 ) + 1  into :new.id_prycto_clnte
				from ti_g_proyectos_cliente;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_G_PROYECTOS_CLIENTE_IU" ENABLE;

