
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PREDIOS_CALCULO_USO_IU"
	for insert or update on gi_d_predios_calculo_uso
	compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prdio_clclo_uso is null then

				select nvl(max(id_prdio_clclo_uso)+1, 1)
				  into d
				  from gi_d_predios_calculo_uso;
				:new.id_prdio_clclo_uso := d;

			end if;
		end if;
	end before each row;

end;










/
ALTER TRIGGER "GI_D_PREDIOS_CALCULO_USO_IU" ENABLE;

