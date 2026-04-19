
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_CONVENIOS_CNFGRCION_IU"
  for insert or update on gf_d_convenios_cnfgrcion
  compound trigger

  before each row is
  begin
    if inserting then
      :new.id_cnvnio_cnfgrcion := sq_gf_d_convenios_cnfgrcion.nextval;
      :new.user_dgta           := user;
      :new.fcha_dgta           := systimestamp;
    elsif updating then
      :new.user_mdfca := coalesce(sys_context('APEX$SESSION', 'app_user'),
                                  regexp_substr(sys_context('userenv',
                                                            'client_identifier'),
                                                '^[^:]*'),
                                  sys_context('userenv', 'session_user'));
      :new.fcha_mdfca := systimestamp;

      insert into gf_d_cnvnios_cnfgrcion_aud
        (id_cnvnio_cnfgrcion,
         cdgo_clnte,
         indcdor_cnvnio_crtra_rvcda,
         indcdor_cnvnio_crtra_rvcda_new,
         indcdor_cnv_rvcd_otrs_vgnc,
         indcdor_cnv_rvcd_otrs_vgnc_new,
         user_dgta,
         fcha_dgta,
         user_mdfca,
         fcha_mdfca)
      values
        (:old.id_cnvnio_cnfgrcion,
         :old.cdgo_clnte,
         :old.indcdor_cnvnio_crtra_rvcda,
         :new.indcdor_cnvnio_crtra_rvcda,
         :old.indcdor_cnv_rvcd_otrs_vgnc,
         :new.indcdor_cnv_rvcd_otrs_vgnc,
         :old.user_dgta,
         :old.fcha_dgta,
         coalesce(sys_context('APEX$SESSION', 'app_user'),
                  regexp_substr(sys_context('userenv', 'client_identifier'),
                                '^[^:]*'),
                  sys_context('userenv', 'session_user')),
         systimestamp);
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GF_D_CONVENIOS_CNFGRCION_IU" ENABLE;

