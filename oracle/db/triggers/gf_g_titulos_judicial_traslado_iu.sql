
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JUDICIAL_TRASLADO_IU"
  for insert or update on GF_G_TITULOS_JUDICIAL_TRASLADO
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.Id_Ttlo_Jdcial_Trsldo is null then
        :new.Id_Ttlo_Jdcial_Trsldo := SQ_GF_G_TITULOS_JUDICIAL_TRASLADO.nextval;
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "GF_G_TITULOS_JUDICIAL_TRASLADO_IU" ENABLE;

