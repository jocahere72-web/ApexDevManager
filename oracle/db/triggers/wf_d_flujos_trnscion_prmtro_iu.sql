
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_TRNSCION_PRMTRO_IU"
	for insert or update on wf_d_flujos_trnscion_prmtro
	compound trigger
	d number;
    v_idntfccion number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_trnscion_prmtro is null then
				select nvl( max(id_fljo_trnscion_prmtro), 0 ) + 1  into d
				from wf_d_flujos_trnscion_prmtro;
				:new.id_fljo_trnscion_prmtro := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "WF_D_FLUJOS_TRNSCION_PRMTRO_IU" ENABLE;

