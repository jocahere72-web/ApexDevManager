
  CREATE OR REPLACE EDITIONABLE TRIGGER "GE_P_CONSULTA_DETALLE_IU"
	for insert or update on ge_p_consulta_detalle
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnslta_dtlle is null then
				select nvl( max(id_cnslta_dtlle), 0 ) + 1  into d
				from ge_p_consulta_detalle;
				:new.id_cnslta_dtlle := d;
			end if;
		end if;
	end before each row;
end ge_p_consulta_detalle_iu;









/
ALTER TRIGGER "GE_P_CONSULTA_DETALLE_IU" ENABLE;

