
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_RGLAS_NGCIO_CLNTE_FNC_IU"
  for insert or update on gn_d_rglas_ngcio_clnte_fnc
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_rgla_ngcio_clnte_fncion is null then
        select nvl( max(id_rgla_ngcio_clnte_fncion), 0 ) + 1  into d
        from gn_d_rglas_ngcio_clnte_fnc;
        :new.id_rgla_ngcio_clnte_fncion := d;
      end if;
    end if;
  end before each row;
end;








/
ALTER TRIGGER "GN_D_RGLAS_NGCIO_CLNTE_FNC_IU" ENABLE;

