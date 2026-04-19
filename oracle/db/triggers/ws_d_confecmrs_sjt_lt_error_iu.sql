
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_CONFECMRS_SJT_LT_ERROR_IU"
  for insert on ws_d_confecmrs_sjt_lt_error
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_cnfcmr_sjt_lt_error is null then
        d := sq_ws_d_confecmrs_sjt_lt_error.nextval();
        :new.id_cnfcmr_sjt_lt_error := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_CONFECMRS_SJT_LT_ERROR_IU" ENABLE;

