
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_D_TIPOS_IU"
	for insert or update on pq_d_tipos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_tpo is null then
				select nvl( max(id_tpo), 0 ) + 1  into d
				from pq_d_tipos;
				:new.id_tpo := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "PQ_D_TIPOS_IU" ENABLE;

