
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_D_ESTADOS_IU"
	for insert or update on pq_d_estados
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_estdo is null then
				select nvl( max(id_estdo), 0 ) + 1  into d
				from pq_d_estados;
				:new.id_estdo := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "PQ_D_ESTADOS_IU" ENABLE;

