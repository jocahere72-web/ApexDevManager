
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_D_MOTIVOS_DOCUMENTO_IU"
	for insert or update on pq_d_motivos_documento
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_mtvo_dcmnto is null then
				select nvl( max(id_mtvo_dcmnto), 0 ) + 1  into d
				from pq_d_motivos_documento;
				:new.id_mtvo_dcmnto := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "PQ_D_MOTIVOS_DOCUMENTO_IU" ENABLE;

