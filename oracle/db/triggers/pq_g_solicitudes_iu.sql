
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_SOLICITUDES_IU"
	for insert or update on pq_g_solicitudes
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_slctud is null then
				d := sq_pq_g_solicitudes.nextval;
				:new.id_slctud := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "PQ_G_SOLICITUDES_IU" ENABLE;

