
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLJ_TREA_ESTD_PRTCPNTE_IU"
	for insert or update on wf_d_flj_trea_estd_prtcpnte
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_estdo_prtcpnte is null then
				select nvl( max(id_estdo_prtcpnte), 0 ) + 1  into d
				from wf_d_flj_trea_estd_prtcpnte;
				:new.id_estdo_prtcpnte := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "WF_D_FLJ_TREA_ESTD_PRTCPNTE_IU" ENABLE;

