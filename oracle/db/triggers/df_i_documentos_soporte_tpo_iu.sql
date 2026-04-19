
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_DOCUMENTOS_SOPORTE_TPO_IU"
	for insert or update on df_i_documentos_soporte_tipo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dcmnto_tpo_sprte is null then

				select nvl(max(id_dcmnto_tpo_sprte)+1, 1)
				  into d
				  from df_i_documentos_soporte_tipo;
				:new.id_dcmnto_tpo_sprte := d;

			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "DF_I_DOCUMENTOS_SOPORTE_TPO_IU" ENABLE;

