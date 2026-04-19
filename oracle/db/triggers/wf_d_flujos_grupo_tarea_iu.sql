
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_GRUPO_TAREA_IU"
	for insert or update on wf_d_flujos_grupo_tarea
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_grpo_trea is null then
				select nvl( max(id_fljo_grpo_trea), 0 ) + 1  into d
				from wf_d_flujos_grupo_tarea;
				:new.id_fljo_grpo_trea := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "WF_D_FLUJOS_GRUPO_TAREA_IU" ENABLE;

