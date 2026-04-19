
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_TRANSICION_IU"
	for insert or update on wf_d_flujos_transicion
	compound trigger
	d number;
    v_idntfccion number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_trnscion is null then
				select nvl( max(id_fljo_trnscion), 0 ) + 1  into d
				from wf_d_flujos_transicion;
				:new.id_fljo_trnscion := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "WF_D_FLUJOS_TRANSICION_IU" ENABLE;

