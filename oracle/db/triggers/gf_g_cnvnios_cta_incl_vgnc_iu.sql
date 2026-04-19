
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CNVNIOS_CTA_INCL_VGNC_IU"
	for insert or update on gf_g_cnvnios_cta_incl_vgnc
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_cta_incial_vgncia is null then

				d := sq_gf_g_cnvnios_cta_incl_vgnc.nextval;
				:new.id_cnvnio_cta_incial_vgncia := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CNVNIOS_CTA_INCL_VGNC_IU" ENABLE;

