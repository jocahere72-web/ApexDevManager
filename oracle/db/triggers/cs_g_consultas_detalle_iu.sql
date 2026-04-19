
  CREATE OR REPLACE EDITIONABLE TRIGGER "CS_G_CONSULTAS_DETALLE_IU"
	for insert or update on cs_g_consultas_detalle
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnslta_dtlle is null then
				select nvl( max(id_cnslta_dtlle), 0 ) + 1  into d
				from cs_g_consultas_detalle;
				:new.id_cnslta_dtlle := d;
			end if;
		end if;
	end before each row;
end cs_g_consultas_detalle_iu;








/
ALTER TRIGGER "CS_G_CONSULTAS_DETALLE_IU" ENABLE;

