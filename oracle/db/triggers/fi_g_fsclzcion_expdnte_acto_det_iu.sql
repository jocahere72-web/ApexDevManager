
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FSCLZCION_EXPDNTE_ACTO_DET_IU"
  for insert on fi_g_fsclzcion_expdnte_acto_det
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_fsclzcion_expdnte_acto_det is null then
        d                                  := sq_fi_g_fsclzcion_expdnte_acto_det.nextval();
        :new.id_fsclzcion_expdnte_acto_det := d;
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "FI_G_FSCLZCION_EXPDNTE_ACTO_DET_IU" ENABLE;

