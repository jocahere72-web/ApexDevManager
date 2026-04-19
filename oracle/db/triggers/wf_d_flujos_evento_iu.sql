
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_EVENTO_IU"
	for insert or update on wf_d_flujos_evento
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_evnto is null then
				select nvl( max(id_fljo_evnto), 0 ) + 1  into d
				from wf_d_flujos_evento;
				:new.id_fljo_evnto := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "WF_D_FLUJOS_EVENTO_IU" ENABLE;

