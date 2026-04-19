
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_DOCUMENTOS_CNVNIO_CTA_IU"
	for insert or update on re_g_documentos_cnvnio_cta
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dcmnto_cnvnio_cta is null then

				d := sq_re_g_documentos_cnvnio_cta.nextval;
                :new.id_dcmnto_cnvnio_cta := d;
			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "RE_G_DOCUMENTOS_CNVNIO_CTA_IU" ENABLE;

