
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_TEMAS_DETALLE_IU"
	for insert or update on df_s_temas_detalle
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_tma_dtlle is null then
				select nvl( max(id_tma_dtlle), 0 ) + 1  into d
				from df_s_temas_detalle;
				:new.id_tma_dtlle := d;
			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "DF_S_TEMAS_DETALLE_IU" ENABLE;

