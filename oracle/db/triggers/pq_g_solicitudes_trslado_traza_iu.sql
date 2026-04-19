
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_SOLICITUDES_TRSLADO_TRAZA_IU"
for insert or update on pq_g_solicitudes_trslado_traza
compound trigger
    before each row is
    begin
        if inserting then
            if :new.id_slctud_trza is null then
                :new.id_slctud_trza := sq_pq_g_solicitudes_trslado_traza.nextval;
            end if;
        end if;
    end before each row;
end;


/
ALTER TRIGGER "PQ_G_SOLICITUDES_TRSLADO_TRAZA_IU" ENABLE;

