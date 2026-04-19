
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNS_ESQMA_TRFA_TPO_IU"
  for insert or update on gi_d_dclrcns_esqma_trfa_tpo
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcns_esqma_trfa_tpo := sq_gi_d_dclrcns_esqma_trfa_tpo.nextval;
		end if;
	end before each row;
end gi_d_dclrcns_esqma_trfa_tpo_iu;





/
ALTER TRIGGER "GI_D_DCLRCNS_ESQMA_TRFA_TPO_IU" ENABLE;

