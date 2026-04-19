
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_D_MOTIVOS_IU"
	for insert or update on pq_d_motivos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_mtvo is null then
				select nvl( max(id_mtvo), 0 ) + 1  into d
				from pq_d_motivos;
				:new.id_mtvo := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "PQ_D_MOTIVOS_IU" ENABLE;

