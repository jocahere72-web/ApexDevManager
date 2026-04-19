
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SALDOS_FAVOR_IU"
  for insert or update on gf_g_saldos_favor
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_sldo_fvor is null then

        :new.id_sldo_fvor := SQ_GF_G_SALDOS_FAVOR.NEXTVAL;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GF_G_SALDOS_FAVOR_IU" ENABLE;

