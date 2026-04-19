
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_D_REQUISITOS_ESTADO_IU"
	for insert or update on ti_d_requisitos_estado
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rqsto_estdo is null then
				select nvl( max(id_rqsto_estdo), 0 ) + 1  into :new.id_rqsto_estdo
				from ti_d_requisitos_estado;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_D_REQUISITOS_ESTADO_IU" ENABLE;

