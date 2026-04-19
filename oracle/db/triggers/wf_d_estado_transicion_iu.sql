
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_ESTADO_TRANSICION_IU"
	for insert or update on wf_d_estado_transicion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_estdo_trnscion is null then
				select nvl( max(id_estdo_trnscion), 0 ) + 1  into d
				from wf_d_estado_transicion;
				:new.id_estdo_trnscion := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "WF_D_ESTADO_TRANSICION_IU" ENABLE;

