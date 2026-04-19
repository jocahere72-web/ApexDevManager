
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_EXONERACIONES_SUJETO_IU"
	for insert or update on gi_g_exoneraciones_sujeto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_exnrcion_sujeto is null then

				select nvl(max(id_exnrcion_sujeto)+1, 1) into d
				  from gi_g_exoneraciones_sujeto;
				:new.id_exnrcion_sujeto := d;

			end if;

			-- Fecha Final de la Exoneracion
			if :new.fcha_fnal is null then

				-- Fecha final = Fecha Inicio + 10 Años  ( Articulo 28 Decreto 352 de 2002 )
				:new.fcha_fnal := add_months(:new.fcha_incio, 12*10);

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GI_G_EXONERACIONES_SUJETO_IU" ENABLE;

