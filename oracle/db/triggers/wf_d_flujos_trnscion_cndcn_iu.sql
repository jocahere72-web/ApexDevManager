
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_TRNSCION_CNDCN_IU"
	for insert or update on wf_d_flujos_trnscion_cndcion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_trnscion_cndcion is null then
				select nvl( max(id_fljo_trnscion_cndcion), 0 ) + 1  into d
				from wf_d_flujos_trnscion_cndcion;
				:new.id_fljo_trnscion_cndcion := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "WF_D_FLUJOS_TRNSCION_CNDCN_IU" ENABLE;

