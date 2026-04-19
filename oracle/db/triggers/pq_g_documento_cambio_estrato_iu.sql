
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_DOCUMENTO_CAMBIO_ESTRATO_IU"
	for insert or update on pq_g_documento_cambio_estrato
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dcmnto is null then
				d := sq_pq_g_documento_cambio_estrato.nextval;
				:new.id_dcmnto := d;
			end if;
		end if;
	end before each row;
end;

/
ALTER TRIGGER "PQ_G_DOCUMENTO_CAMBIO_ESTRATO_IU" ENABLE;

