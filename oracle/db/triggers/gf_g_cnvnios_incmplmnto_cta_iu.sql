
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CNVNIOS_INCMPLMNTO_CTA_IU"
	for insert or update on gf_g_cnvnios_incmplmnto_cta
	compound trigger
	d number;
	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_incmplmnto_cta is null then
                d := sq_gf_g_cnvnios_incmplmnto_cta.nextval;
                :new.id_cnvnio_incmplmnto_cta := d;
			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "GF_G_CNVNIOS_INCMPLMNTO_CTA_IU" ENABLE;

