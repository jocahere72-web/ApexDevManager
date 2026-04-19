
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PREDIOS_CNFGR_LMT_IMP_IU"
  for insert or update on gi_d_predios_cnfgr_lmt_imp
  compound trigger
  d number;
  before each row is
  begin
    if inserting then
      d := sq_gi_d_predios_cnfgr_lmt_imp.nextval;
      :new.id_prdio_cnf_lmt_imp := d;
    elsif updating then
      :new.user_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
      :new.fcha_mdfca := systimestamp;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GI_D_PREDIOS_CNFGR_LMT_IMP_IU" ENABLE;

