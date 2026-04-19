
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_GRUPO_IU"
	for insert or update on wf_d_flujos_grupo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_grpo is null then
				select nvl( max(id_fljo_grpo), 0 ) + 1  into d
				from wf_d_flujos_grupo;
				:new.id_fljo_grpo := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "WF_D_FLUJOS_GRUPO_IU" ENABLE;

