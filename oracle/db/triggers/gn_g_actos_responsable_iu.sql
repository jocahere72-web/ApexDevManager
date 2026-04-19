
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_ACTOS_RESPONSABLE_IU"
	for insert or update on gn_g_actos_responsable
	compound trigger
	--d number;
    v_number 				number;
    v_id_acto 				gn_g_actos.id_acto%type;
    v_indcdor_ntfccion 		varchar2(1);
	v_cdgo_clnte 			number;
	v_def_clnte_acto_ntfcdo varchar2(1);
    v_fcha_ntfcion          gn_g_actos_responsable.fcha_ntfcion%type;

	before each row is
	begin
        v_id_acto := :new.id_acto;
        v_indcdor_ntfccion := :new.indcdor_ntfccion;
        v_fcha_ntfcion := :new.fcha_ntfcion;
	end before each row;

    after statement is
		begin
			if updating then
				if  v_indcdor_ntfccion = 'S' then

			--	selec de la definicion de cliente

			begin
				select cdgo_clnte
				into v_cdgo_clnte
				from gn_g_actos
				where id_acto = v_id_acto;
			end;
			begin
				select vlor
				into v_def_clnte_acto_ntfcdo
				from df_c_definiciones_clnte_ctgria a
				join v_df_c_definiciones_cliente b on a.id_dfncion_clnte_ctgria = b.id_dfncion_clnte_ctgria
				where a.cdgo_clnte = v_cdgo_clnte
				and a.cdgo_dfncion_clnte_ctgria = 'NTFCC';
			end;
					if v_def_clnte_acto_ntfcdo = 'S' then
						begin
							select count(*)
							into v_number
							from gn_g_actos_responsable
							where id_acto = v_id_acto and
								  indcdor_ntfccion = 'N';
							if(v_number = 0)then
								begin
									update nt_g_notificaciones
									set indcdor_ntfcdo = 'S',
										cdgo_estdo     = 'NPR',
                                        fcha_ntfccion  = v_fcha_ntfcion
									where id_acto = v_id_acto;
								end;
							end if;

						end;
					elsif 	v_def_clnte_acto_ntfcdo = 'N' then
						begin
							select count(*)
							into v_number
							from gn_g_actos_responsable
							where id_acto = v_id_acto and
								  indcdor_ntfccion = 'S';
							if(v_number > 0 )then
								begin
									update nt_g_notificaciones
									set indcdor_ntfcdo = 'S',
										cdgo_estdo     = 'NPR',
                                        fcha_ntfccion  = v_fcha_ntfcion
									where id_acto = v_id_acto;
								end;
							end if;

						end;
					end if;
				end if;
			end if;
		end after statement;
end;



/
ALTER TRIGGER "GN_G_ACTOS_RESPONSABLE_IU" ENABLE;

