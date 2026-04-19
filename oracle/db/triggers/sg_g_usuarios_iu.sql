
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_USUARIOS_IU"
	for insert or update or delete on sg_g_usuarios
	compound trigger
    v_idntfccion 	number;
	v_id_prfil		number;

	before each row is
	begin
		if inserting then
			if :new.id_usrio is null then
				:new.id_usrio := sq_sg_g_usuarios.nextval;
			end if;
             if :new.user_name is null then
			    select idntfccion into v_idntfccion
				 from v_si_c_terceros
                 where id_trcro = :new.id_trcro;
				  :new.user_name := v_idntfccion;
            end if;
		  --:new.user_name := v_idntfccion;
		  :new.fecha_digita := systimestamp;
		  :new.fcha_crcion := systimestamp;
		end if;
	end before each row;

	after each row is
    begin
        if inserting or updating then
            if :new.admin = 1 and (:new.admin != :old.admin or :old.admin is null) then
                begin
                    select id_prfil
                      into v_id_prfil
                      from sg_g_perfiles a
                      join v_si_c_terceros b on a.cdgo_clnte = b.cdgo_clnte
                       and id_trcro = :new.id_trcro
                       and id_prfil not in (select id_prfil
                                              from sg_g_perfiles_usuario c
                                             where c.id_usrio = :new.id_usrio
                                               and c.id_prfil = a.id_prfil)

                     where indcdor_prfil_admnstdor = 'S';
                    -- Se registra el perfil de administrador al usuario
                    insert into sg_g_perfiles_usuario (id_prfil,	id_usrio)
                                               values (v_id_prfil,	:new.id_usrio);
                exception
					when no_data_found then
                        null;
				end;
            end if;
        end if;

		if deleting or updating then
			if :new.admin = 0 and :new.admin != :old.admin then
                begin
					select id_prfil
					  into v_id_prfil
					  from sg_g_perfiles   a
					  join v_si_c_terceros b on a.cdgo_clnte = b.cdgo_clnte
					   and id_trcro                 = :new.id_trcro
					 where indcdor_prfil_admnstdor  = 'S';

					-- Se elimina el perfil de administrador al usuario
					delete sg_g_perfiles_usuario
					 where id_usrio = :old.id_usrio
					   and id_prfil = v_id_prfil;
				exception
					when no_data_found then
                        null;
				end;
            end if;
		end if;
	end after each row;
end sg_g_usuarios_iu;




/
ALTER TRIGGER "SG_G_USUARIOS_IU" ENABLE;

