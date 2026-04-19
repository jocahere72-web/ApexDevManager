
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_SALDOS_FVOR_MVMNTS_TPO_IU"
	for insert or update on gf_d_saldos_fvor_mvmnts_tpo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sldos_fvor_mvmnto_tpo is null then

				select nvl(max(id_sldos_fvor_mvmnto_tpo)+1, 1) into d
				  from gf_d_saldos_fvor_mvmnts_tpo;
				:new.id_sldos_fvor_mvmnto_tpo := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_D_SALDOS_FVOR_MVMNTS_TPO_IU" ENABLE;

