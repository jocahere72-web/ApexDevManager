
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_PRCSO_INCNSSTNCIA_TPO_IU"
	for insert or update on wf_d_prcso_incnsstncia_tpo
	compound trigger
	d number;
    v_idntfccion number;

	before each row is
	begin
		if inserting then
			if :new.cdgo_prcso_incsstncia_tpo is null then
				select nvl( max(cdgo_prcso_incsstncia_tpo), 0 ) + 1  into d
				from wf_d_prcso_incnsstncia_tpo;
				:new.cdgo_prcso_incsstncia_tpo := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "WF_D_PRCSO_INCNSSTNCIA_TPO_IU" ENABLE;

