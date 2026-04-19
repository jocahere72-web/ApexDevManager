
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_SLCTDES_OBSRVCN_ADJNTO_IU"
	for insert or update on pq_g_slctdes_obsrvcn_adjnto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_slctdes_obsrvcn_adjnto is null then
				d := sq_pq_g_slctdes_obsrvcn_adjnto.nextval;
				:new.id_slctdes_obsrvcn_adjnto := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "PQ_G_SLCTDES_OBSRVCN_ADJNTO_IU" ENABLE;

