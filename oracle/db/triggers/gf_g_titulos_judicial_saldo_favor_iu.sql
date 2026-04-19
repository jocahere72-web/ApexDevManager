
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JUDICIAL_SALDO_FAVOR_IU"
  for insert or update on GF_G_TITULOS_JUDICIAL_SALDO_FAVOR
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.ID_TTLO_JDCIAL_SLDO_FVOR is null then
        :new.ID_TTLO_JDCIAL_SLDO_FVOR := SQ_GF_G_TITULOS_SALDO_FAVOR.nextval;
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "GF_G_TITULOS_JUDICIAL_SALDO_FAVOR_IU" ENABLE;

