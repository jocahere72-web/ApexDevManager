
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_D_PRIORIDADES_IU"
	for insert or update on ti_d_prioridades
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prrdad is null then
				select nvl( max(id_prrdad), 0 ) + 1  into :new.id_prrdad
				from ti_d_prioridades;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_D_PRIORIDADES_IU" ENABLE;

