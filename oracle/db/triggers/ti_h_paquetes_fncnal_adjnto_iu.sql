
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_H_PAQUETES_FNCNAL_ADJNTO_IU"
	for insert or update on ti_h_paquetes_fncnal_adjnto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_pqte_fncnal_adjnto_hstrco is null then
				select nvl( max(id_pqte_fncnal_adjnto_hstrco), 0 ) + 1  into :new.id_pqte_fncnal_adjnto_hstrco
				from ti_h_paquetes_fncnal_adjnto;
			end if;
            if :new.nmro_vrsion is null then
				select nvl( max(nmro_vrsion), 0 ) + 1  into :new.nmro_vrsion
				from ti_h_paquetes_fncnal_adjnto;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_H_PAQUETES_FNCNAL_ADJNTO_IU" ENABLE;

