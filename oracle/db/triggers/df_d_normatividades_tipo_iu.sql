
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_D_NORMATIVIDADES_TIPO_IU"
for insert or update on df_d_normatividades_tipo
compound trigger

  before each row is
  begin
    if inserting then
      if :new.id_nrmtvddes_tpo is null then
        :new.id_nrmtvddes_tpo := sq_df_d_normatividades_tipo.nextval;
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
ALTER TRIGGER "DF_D_NORMATIVIDADES_TIPO_IU" ENABLE;

