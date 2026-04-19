
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DECLARACIONES_ADCNAL_IU"
	for insert or update on gi_g_declaraciones_adicional
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dclrcion_adcnal is null then

				d := sq_gi_g_declaraciones_adicional.nextval;
				:new.id_dclrcion_adcnal := d;

			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "GI_G_DECLARACIONES_ADCNAL_IU" ENABLE;

