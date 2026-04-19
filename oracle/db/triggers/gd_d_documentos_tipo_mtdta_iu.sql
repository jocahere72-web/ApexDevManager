
  CREATE OR REPLACE EDITIONABLE TRIGGER "GD_D_DOCUMENTOS_TIPO_MTDTA_IU"
	for insert or update on gd_d_documentos_tipo_mtdta
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dcmnto_tpo_mtdta is null then
				select nvl( max(id_dcmnto_tpo_mtdta), 0 ) + 1  into d
				from gd_d_documentos_tipo_mtdta;
				:new.id_dcmnto_tpo_mtdta := d;
			end if;
		end if;
		if deleting then
			delete from gd_d_dcmntos_tpo_mtdta_vlor where id_dcmnto_tpo_mtdta = :old.id_dcmnto_tpo_mtdta;
		end if;

	end before each row;
end gd_d_documentos_tipo_mtdta_iu;







/
ALTER TRIGGER "GD_D_DOCUMENTOS_TIPO_MTDTA_IU" ENABLE;

