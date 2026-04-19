
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_TPS_MDDA_CTLR_CSL_DSMB_IU"
	for insert or update on mc_d_tps_mdda_ctlr_csl_dsmb
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_tps_mdda_ctlr_csl_dsmb is null then

				select nvl(max(id_tps_mdda_ctlr_csl_dsmb)+1, 1) into d
				  from mc_d_tps_mdda_ctlr_csl_dsmb;
				:new.id_tps_mdda_ctlr_csl_dsmb := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_TPS_MDDA_CTLR_CSL_DSMB_IU" ENABLE;

