
  CREATE OR REPLACE EDITIONABLE TRIGGER "ET_D_CNFGRCION_CRGUE_IMPSTO_IU"
  for insert or update on et_d_cnfgrcion_crgue_impsto
  compound trigger

  before each row is
  begin
    if inserting then
      if :new.id_cnfgrcion_crgue_impsto is null then
        :new.id_cnfgrcion_crgue_impsto := sq_et_d_cnfgrcion_crgue_impsto.nextval;
      end if;
      :new.user_dgta := coalesce(sys_context('APEX$SESSION', 'app_user'),
                                 regexp_substr(sys_context('userenv',
                                                           'client_identifier'),
                                               '^[^:]*'),
                                 sys_context('userenv', 'session_user'));
      :new.fcha_dgta := systimestamp;
    elsif updating then
      :new.user_mdfca := coalesce(sys_context('APEX$SESSION', 'app_user'),
                                  regexp_substr(sys_context('userenv',
                                                            'client_identifier'),
                                                '^[^:]*'),
                                  sys_context('userenv', 'session_user'));
      :new.fcha_mdfca := systimestamp;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "ET_D_CNFGRCION_CRGUE_IMPSTO_IU" ENABLE;

