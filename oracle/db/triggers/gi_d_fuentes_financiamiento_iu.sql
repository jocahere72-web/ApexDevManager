
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FUENTES_FINANCIAMIENTO_IU"
	for insert or update on gi_d_fuentes_financiamiento

compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fnte_fnncmnto is null then

				select nvl(max(id_fnte_fnncmnto)+1, 1)
				  into d
				  from gi_d_fuentes_financiamiento;
				:new.id_fnte_fnncmnto := d;

			end if;
		end if;
	end before each row;

end;








/
ALTER TRIGGER "GI_D_FUENTES_FINANCIAMIENTO_IU" ENABLE;

