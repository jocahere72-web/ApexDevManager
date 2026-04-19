
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_NTFCCNES_RSPNSBLE_IU"
  for insert or update on nt_g_ntfccnes_rspnsble
  compound trigger
  d number;
  v_fcha_ntfcion                gn_g_actos_responsable.fcha_ntfcion%type;
  v_id_acto_rspnsble            gn_g_actos_responsable.id_acto_rspnsble%type;
  v_indcdor_ntfcdo              nt_g_ntfccnes_rspnsble.indcdor_ntfcdo%type;
  before each row is
  begin
  	if inserting then
  		if :new.id_ntfccion_rspnsble is null then
  			d := sq_nt_g_ntfccnes_rspnsble.nextval;
  			:new.id_ntfccion_rspnsble := d;
  		end if;
  	end if;
    v_fcha_ntfcion      := :new.fcha_ntfccion;
    v_id_acto_rspnsble  := :new.id_acto_rspnsble;
    v_indcdor_ntfcdo    := :new.indcdor_ntfcdo;
  end before each row;

  after statement is
  begin
    if inserting or updating then
		if(v_indcdor_ntfcdo = 'S')then
			update gn_g_actos_responsable
            set indcdor_ntfccion = 'S',
				fcha_ntfcion = v_fcha_ntfcion
            where id_acto_rspnsble = v_id_acto_rspnsble;
		end if;
	end if;
  end after statement;

end nt_g_ntfccnes_rspnsble_iu;



/
ALTER TRIGGER "NT_G_NTFCCNES_RSPNSBLE_IU" ENABLE;

