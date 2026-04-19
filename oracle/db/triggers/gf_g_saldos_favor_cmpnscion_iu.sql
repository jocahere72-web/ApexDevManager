
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SALDOS_FAVOR_CMPNSCION_IU"
	for insert or update on gf_g_saldos_favor_cmpnscion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sld_fvr_cmpnscion is null then

				select nvl(max(id_sld_fvr_cmpnscion)+1, 1) into d
				  from gf_g_saldos_favor_cmpnscion;
				:new.id_sld_fvr_cmpnscion := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_G_SALDOS_FAVOR_CMPNSCION_IU" ENABLE;

