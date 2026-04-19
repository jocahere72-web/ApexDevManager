
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_QUEJAS_RECLAMO_ADJUNTO_IU"
  for insert or update on pq_g_quejas_reclamo_adjunto
  compound trigger

  before each row is
  begin
    if inserting then
      :new.id_qja_rclmo_adjnto  := sq_pq_g_quejas_reclamo_adjunto.nextval;
            :new.user_dgta      := user;
      :new.fcha_dgta      := systimestamp;
    end if;
  end before each row;
end;



/
ALTER TRIGGER "PQ_G_QUEJAS_RECLAMO_ADJUNTO_IU" ENABLE;

