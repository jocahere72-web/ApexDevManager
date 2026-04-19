
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_TAREAS_ATRIBUTO_IU"
	for insert or update on wf_d_tareas_atributo
	compound trigger
	d number;
    v_idntfccion number;

	before each row is
	begin
		if inserting then
			if :new.id_trea_atrbto is null then
				select nvl( max(id_trea_atrbto), 0 ) + 1  into d
				from wf_d_tareas_atributo;
				:new.id_trea_atrbto := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "WF_D_TAREAS_ATRIBUTO_IU" ENABLE;

