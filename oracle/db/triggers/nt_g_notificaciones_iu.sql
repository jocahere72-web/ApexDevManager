
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_NOTIFICACIONES_IU"
  for insert or update on nt_g_notificaciones
  compound trigger
  d number;
  v_id_acto			gn_g_actos.id_acto%type;
  v_indcdor_ntfcdo	nt_g_notificaciones.indcdor_ntfcdo%type;
  v_fcha_ntfccion    nt_g_notificaciones.fcha_ntfccion%type;

  before each row is
  begin
        if inserting then
            if :new.id_ntfccion is null then
                select nvl( max(id_ntfccion), 0 ) + 1  into d
                from nt_g_notificaciones;
                :new.id_ntfccion := d;
            end if;
        end if;
        v_id_acto := :new.id_acto;
        v_indcdor_ntfcdo := :new.indcdor_ntfcdo;
        v_fcha_ntfccion := :new.fcha_ntfccion;
  end before each row;

  after statement is
    begin
         if updating then
            if( v_indcdor_ntfcdo = 'S')then

                update gn_g_actos
                   set indcdor_ntfccion = 'S'
                     , fcha_ntfccion = v_fcha_ntfccion
                 where id_acto = v_id_acto;
                update gn_g_actos
        		   set fcha_incio_ntfccion = v_fcha_ntfccion
                 where id_acto_rqrdo_ntfccion = v_id_acto;

            end if;
        end if;
  end after statement;

end nt_g_notificaciones_iu;


/
ALTER TRIGGER "NT_G_NOTIFICACIONES_IU" ENABLE;

