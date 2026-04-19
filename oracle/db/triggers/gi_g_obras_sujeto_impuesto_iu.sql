
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_OBRAS_SUJETO_IMPUESTO_IU"
	for insert or update on gi_g_obras_sujeto_impuesto

compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_obra_sjto_impsto is null then

				select nvl(max(id_obra_sjto_impsto)+1, 1)
				  into d
				  from gi_g_obras_sujeto_impuesto;
				:new.id_obra_sjto_impsto := d;

			end if;
		end if;
	end before each row;

end;







/
ALTER TRIGGER "GI_G_OBRAS_SUJETO_IMPUESTO_IU" ENABLE;

