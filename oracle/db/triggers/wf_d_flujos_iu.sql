
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_IU"
	for insert or update on wf_d_flujos
	compound trigger
	d number;
    v_idntfccion number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo is null then
				select nvl( max(id_fljo), 0 ) + 1  into d
				from wf_d_flujos;
				:new.id_fljo := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "WF_D_FLUJOS_IU" ENABLE;

