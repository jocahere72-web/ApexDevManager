
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PRDIOS_CLCLO_CLSFCCION_IU" for insert or update on gi_d_predios_clclo_clsfccion
	compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prdio_clclo_clsfccion is null then

				select nvl(max(id_prdio_clclo_clsfccion)+1, 1)
				  into d
				  from gi_d_predios_clclo_clsfccion;
				:new.id_prdio_clclo_clsfccion := d;

			end if;
		end if;
	end before each row;

end;










/
ALTER TRIGGER "GI_D_PRDIOS_CLCLO_CLSFCCION_IU" ENABLE;

