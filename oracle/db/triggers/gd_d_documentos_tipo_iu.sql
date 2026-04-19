
  CREATE OR REPLACE EDITIONABLE TRIGGER "GD_D_DOCUMENTOS_TIPO_IU"
	for insert or update on gd_d_documentos_tipo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dcmnto_tpo is null then
				select nvl( max(id_dcmnto_tpo), 0 ) + 1  into d
				from gd_d_documentos_tipo;
				:new.id_dcmnto_tpo := d;
			end if;
		end if;

	end before each row;
end gd_d_documentos_tipo_iu;







/
ALTER TRIGGER "GD_D_DOCUMENTOS_TIPO_IU" ENABLE;

