
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_RVSION_TREA_FLJO_IU"
		for insert or update on pq_g_rvsion_trea_fljo
		compound trigger
			d number;

			before each row is
			begin
			if inserting then
				if :new.id_rvsion_trea is null then
					:new.id_rvsion_trea := sq_pq_g_rvsion_trea_fljo.nextval();
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "PQ_G_RVSION_TREA_FLJO_IU" ENABLE;

