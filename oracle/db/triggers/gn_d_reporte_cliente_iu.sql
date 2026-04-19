
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_REPORTE_CLIENTE_IU"
	for insert or update on gn_d_reporte_cliente
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rprte_clnte is null then
				select nvl( max(id_rprte_clnte), 0 ) + 1  into d
				from gn_d_reporte_cliente;
				:new.id_rprte_clnte := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GN_D_REPORTE_CLIENTE_IU" ENABLE;

