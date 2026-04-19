
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDORES_CLIENTE_IU"
	for insert or update on ws_d_provedores_cliente
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prvdor_clnte is null then

				select nvl(max(id_prvdor_clnte)+1, 1) into d
				  from ws_d_provedores_cliente;
				:new.id_prvdor_clnte := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "WS_D_PROVEDORES_CLIENTE_IU" ENABLE;

