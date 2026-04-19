
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_SOLICITANTES_IU"
	for insert or update on pq_g_solicitantes
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_slctnte is null then
				d := sq_pq_g_solicitantes.nextval;
				:new.id_slctnte := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "PQ_G_SOLICITANTES_IU" ENABLE;

