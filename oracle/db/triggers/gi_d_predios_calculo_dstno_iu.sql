
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PREDIOS_CALCULO_DSTNO_IU"
	for insert or update on gi_d_predios_calculo_destino
	compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prdio_clclo_dstno is null then

				select nvl(max(id_prdio_clclo_dstno)+1, 1)
				  into d
				  from gi_d_predios_calculo_destino;
				:new.id_prdio_clclo_dstno := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "GI_D_PREDIOS_CALCULO_DSTNO_IU" ENABLE;

