
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_TRMTES_TPO_MTCION_CLSE_IU"
  for insert or update on "DF_S_TRMTES_TPO_MTCION_CLSE_OLD"
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_trmte_tpo_mtcion_clse is null then
        select nvl(max(id_trmte_tpo_mtcion_clse), 0) + 1
          into d
          from DF_S_TRMTES_TPO_MTCION_CLSE_OLD;
        :new.id_trmte_tpo_mtcion_clse := d;
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "DF_S_TRMTES_TPO_MTCION_CLSE_IU" ENABLE;

