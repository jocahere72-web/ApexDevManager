
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_SALDOS_FVOR_TPO_IMPSTO_IU"
	for insert or update on gf_d_saldos_fvor_tpo_impsto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sldo_fvor_tpo_impsto is null then

				select nvl(max(id_sldo_fvor_tpo_impsto)+1, 1) into d
				  from gf_d_saldos_fvor_tpo_impsto;
				:new.id_sldo_fvor_tpo_impsto := d;

			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "GF_D_SALDOS_FVOR_TPO_IMPSTO_IU" ENABLE;

