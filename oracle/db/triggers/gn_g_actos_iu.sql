
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_ACTOS_IU"
  for insert or update on gn_g_actos
  compound trigger

  --d          number;
  v_indcdor_ntfccion gn_g_actos.indcdor_ntfccion%type;
  v_fcha_ntfccion    gn_g_actos.fcha_ntfccion%type;
  v_id_acto          gn_g_actos.id_acto%type;

  before each row is
  begin

    v_indcdor_ntfccion := :new.indcdor_ntfccion;
    v_fcha_ntfccion    := :new.fcha_ntfccion;
    v_id_acto          := :new.id_acto;

  end before each row;

  after statement is
  begin
    if updating then
      if (v_indcdor_ntfccion = 'S' and v_fcha_ntfccion is not null) then
        for c_actos in (select id_acto
                          from gn_g_actos a
                         where id_acto_rqrdo_ntfccion = v_id_acto) loop
          update gn_g_actos
             set fcha_incio_ntfccion = v_fcha_ntfccion
           where id_acto = c_actos.id_acto;
        end loop;
        pkg_nt_notificacion.prc_rg_notificacion_automatica(p_id_acto => v_id_acto);
      end if;
    end if;
  end after statement;
end;




/
ALTER TRIGGER "GN_G_ACTOS_IU" ENABLE;

