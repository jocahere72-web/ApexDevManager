
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_EVENTO_MANEJDOR_IU"
	for insert or update on wf_d_flujos_evento_manejdor
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_evnto_mnjdor is null then
				select nvl( max(id_fljo_evnto_mnjdor), 0 ) + 1  into d
				from wf_d_flujos_evento_manejdor;
				:new.id_fljo_evnto_mnjdor := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "WF_D_FLUJOS_EVENTO_MANEJDOR_IU" ENABLE;

