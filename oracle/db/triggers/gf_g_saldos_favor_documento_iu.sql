
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SALDOS_FAVOR_DOCUMENTO_IU"
	for insert or update on gf_g_saldos_favor_documento
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sldo_fvor_dcmnto is null then

				select nvl(max(id_sldo_fvor_dcmnto)+1, 1) into d
				  from gf_g_saldos_favor_documento;
				:new.id_sldo_fvor_dcmnto := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_G_SALDOS_FAVOR_DOCUMENTO_IU" ENABLE;

