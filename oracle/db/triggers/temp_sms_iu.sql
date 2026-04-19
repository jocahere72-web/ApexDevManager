
  CREATE OR REPLACE EDITIONABLE TRIGGER "TEMP_SMS_IU"
  for insert on TEMP_SMS
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_sms is null then
        d           := sq_TEMP_SMS.nextval();
        :new.id_sms := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "TEMP_SMS_IU" ENABLE;

