
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_D_ACTOS_TIPO_MTVO_RQRDO_IU"
	for insert or update on pq_d_actos_tipo_mtvo_rqrdo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_acto_tpo_mtvo_rqrdo is null then
				select nvl( max(id_acto_tpo_mtvo_rqrdo), 0 ) + 1  into d
				from pq_d_actos_tipo_mtvo_rqrdo;
				:new.id_acto_tpo_mtvo_rqrdo := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "PQ_D_ACTOS_TIPO_MTVO_RQRDO_IU" ENABLE;

