
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_G_INCONSISTENCIA_IU"
	for insert or update on wf_g_inconsistencia
	compound trigger
	d number;
    v_idntfccion number;

	before each row is
	begin
		if inserting then
			if :new.id_incsstncia is null then
				select nvl( max(id_incsstncia), 0 ) + 1  into d
				from wf_g_inconsistencia;
				:new.id_incsstncia := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "WF_G_INCONSISTENCIA_IU" ENABLE;

