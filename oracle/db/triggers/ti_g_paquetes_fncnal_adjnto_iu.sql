
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_PAQUETES_FNCNAL_ADJNTO_IU"
	for insert or update or delete on ti_g_paquetes_fncnal_adjnto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_pqte_fncnal_adjnto is null then
				select nvl( max(id_pqte_fncnal_adjnto), 0 ) + 1  into :new.id_pqte_fncnal_adjnto
				from ti_g_paquetes_fncnal_adjnto;
			end if;
            if :new.nmro_vrsion is null then
				select nvl( max(nmro_vrsion), 0 ) + 1  into :new.nmro_vrsion
				from ti_g_paquetes_fncnal_adjnto
               where id_pqte_fncnal_adjnto = :new.id_pqte_fncnal_adjnto;
			end if;
		end if;
        if updating then
            if dbms_lob.compare(:new.file_blob, :old.file_blob) = 1 then
                :new.nmro_vrsion := nvl(:old.nmro_vrsion + 1,0);
                :new.fcha := systimestamp;


            end if;
        end if;
	end before each row;
   /* after each row is
   begin
        if updating then
            if dbms_lob.compare(:new.file_blob, :old.file_blob) = 1  then
                insert into ti_h_paquetes_fncnal_adjnto (id_pqte_fncnal_adjnto,        cdgo_adjnto_tpo,         fcha,
                                                         obsrvcion,                     nmro_aplccion,          nmro_pgna,
                                                         file_blob,                     file_name,              file_mimetype,
                                                         nmro_vrsion)
                                                 values (:old.id_pqte_fncnal_adjnto,    :old.cdgo_adjnto_tpo,   :old.fcha,
                                                         :old.obsrvcion,                :old.nmro_aplccion,     :old.nmro_pgna,
                                                         :old.file_blob,                :old.file_name,         :old.file_mimetype,
                                                         :old.nmro_vrsion);
            end if;
        end if; -- Fin updating
    end after each row;*/
end;






/
ALTER TRIGGER "TI_G_PAQUETES_FNCNAL_ADJNTO_IU" ENABLE;

