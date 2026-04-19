
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SALDOS_FAVOR_VIGENCIA_IU"
	for insert or update on gf_g_saldos_favor_vigencia
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sldo_fvor_vgncia is null then

				select nvl(max(id_sldo_fvor_vgncia)+1, 1) into d
				  from gf_g_saldos_favor_vigencia;
				:new.id_sldo_fvor_vgncia := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_G_SALDOS_FAVOR_VIGENCIA_IU" ENABLE;

