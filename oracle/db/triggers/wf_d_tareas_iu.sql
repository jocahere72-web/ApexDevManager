
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_TAREAS_IU"
	for insert or update on wf_d_tareas
	compound trigger
	d number;
    v_idntfccion number;

	before each row is
	begin
		if inserting then
			if :new.id_trea is null then
				select nvl( max(id_trea), 0 ) + 1  into d
				from wf_d_tareas;
				:new.id_trea := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "WF_D_TAREAS_IU" ENABLE;

