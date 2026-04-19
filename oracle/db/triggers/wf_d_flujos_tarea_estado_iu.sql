
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_TAREA_ESTADO_IU"
	for insert or update on "WF_D_FLUJOS_TAREA_ESTADO"
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_trea_estdo is null then
				select nvl( max(id_fljo_trea_estdo), 0 ) + 1  into d
				from wf_d_flujos_tarea_estado;
				:new.id_fljo_trea_estdo := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "WF_D_FLUJOS_TAREA_ESTADO_IU" ENABLE;

