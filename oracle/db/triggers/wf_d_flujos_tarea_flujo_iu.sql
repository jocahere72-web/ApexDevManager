
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_TAREA_FLUJO_IU"
	for insert or update on wf_d_flujos_tarea_flujo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_trea_fljo is null then
				select nvl( max(id_fljo_trea_fljo), 0 ) + 1  into d
				from wf_d_flujos_tarea_flujo;
				:new.id_fljo_trea_fljo := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "WF_D_FLUJOS_TAREA_FLUJO_IU" ENABLE;

