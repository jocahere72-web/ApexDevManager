
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_TP_BS_SNCN_DCL_VGN_FRM_IU"
	for insert or update on fi_d_tp_bs_sncn_dcl_vgn_frm
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_tp_bs_sncn_dcl_vgn_frm is null then
				d := sq_fi_d_tp_bs_sncn_dcl_vgn_frm.nextval();
				:new.id_tp_bs_sncn_dcl_vgn_frm := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_TP_BS_SNCN_DCL_VGN_FRM_IU" ENABLE;

