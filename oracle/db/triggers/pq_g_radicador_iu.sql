
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_RADICADOR_IU"
	for insert or update on pq_g_radicador
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rdcdor is null then
				d := sq_pq_g_radicador.nextval;
				:new.id_rdcdor := d;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "PQ_G_RADICADOR_IU" ENABLE;

