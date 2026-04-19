
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDORES_ESTADOS_IU"
	for insert on ws_d_provedores_estados
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prvdr_estdo is null then

				select nvl(max(id_prvdr_estdo)+1, 1) into d
				  from ws_d_provedores_estados;
				:new.id_prvdr_estdo := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "WS_D_PROVEDORES_ESTADOS_IU" ENABLE;

