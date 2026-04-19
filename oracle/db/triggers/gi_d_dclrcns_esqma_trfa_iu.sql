
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNS_ESQMA_TRFA_IU"
  for insert or update on gi_d_dclrcns_esqma_trfa
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcns_esqma_trfa := sq_gi_d_dclrcns_esqma_trfa.nextval;
		end if;
	end before each row;
end gi_d_dclrcns_esqma_trfa_iu;





/
ALTER TRIGGER "GI_D_DCLRCNS_ESQMA_TRFA_IU" ENABLE;

