
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_SOLICITUDES_CIERRE_IU"
  for insert on pq_g_solicitudes_cierre
  compound trigger
        o_cdgo_rspsta number;
        o_mnsje_rspsta varchar2(100);
  before each row is
    begin
      if inserting then
        if :new.id_slctud_cierre is null then
          :new.id_slctud_cierre := sq_pq_g_solicitudes_cierre.nextval;
        end if;
        :new.user_dgta := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
        :new.fcha_dgta := systimestamp;
                 begin
                    begin
                        pkg_pq_pqr.prc_rg_cierre_radicado(:new.id_slctud,o_cdgo_rspsta,o_mnsje_rspsta);
                        if o_cdgo_rspsta > 0 then
                            raise_application_error(-20001, ' Error al cerrar la solicitud.');
                        end if;
                    exception
                        when others then
                            raise_application_error(-20001, ' Error al cerrar la solicitud.');
                    end;
                 end;
      end if;
    end before each row;
  end;



/
ALTER TRIGGER "PQ_G_SOLICITUDES_CIERRE_IU" ENABLE;

