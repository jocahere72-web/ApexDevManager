
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_D_ACTOS_TIPO_MOTIVO_IU"
	for insert or update on pq_d_actos_tipo_motivo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_acto_tpo_mtvo is null then
				select nvl( max(id_acto_tpo_mtvo), 0 ) + 1  into d
				from pq_d_actos_tipo_motivo;
				:new.id_acto_tpo_mtvo := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "PQ_D_ACTOS_TIPO_MOTIVO_IU" ENABLE;

