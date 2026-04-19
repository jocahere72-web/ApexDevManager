
  CREATE OR REPLACE EDITIONABLE TRIGGER "GD_G_NORMATIVIDADES_IU"
for insert or update on gd_g_normatividades
compound trigger

  before each row is
  begin
    if inserting then
      if :new.id_nrmtvdad is null then
        :new.id_nrmtvdad := sq_gd_g_normatividades.nextval;
      end if;
      :new.user_dgta := user;
      :new.fcha_dgta := systimestamp;
    elsif updating then
      :new.user_mdfca := coalesce( sys_context('apex$session','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
      :new.fcha_mdfca := systimestamp;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GD_G_NORMATIVIDADES_IU" ENABLE;

