
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_DOCUMENTOS_HIST_IU"
  for insert or update on pq_g_documentos_hist
  compound  trigger

  before each row is
    begin
      if inserting then
        if :new.id_dcmnto_hist is null then
          :new.id_dcmnto_hist := sq_pq_g_documentos_hist.nextval;
        end if;
      end if;
    end before each row;
  end;



/
ALTER TRIGGER "PQ_G_DOCUMENTOS_HIST_IU" ENABLE;

