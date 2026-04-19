
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_C_SUJETOS_IU"
	for insert or update on si_c_sujetos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if length(:new.idntfccion) = 15 then
				:new.idntfccion_sjto_frmtda := pkg_gn_generalidades.fnc_cl_formato_texto( p_txto => :new.idntfccion
																						, p_frmto => 'xx-xx-xxxx-xxxx-xxx'
																						, p_crcter_dlmtdor => '-');
			elsif length(:new.idntfccion) = 25 then
				:new.idntfccion_sjto_frmtda := pkg_gn_generalidades.fnc_cl_formato_texto( p_txto => :new.idntfccion
																						, p_frmto => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'
																						, p_crcter_dlmtdor => '-');
			else
				:new.idntfccion_sjto_frmtda := :new.idntfccion;
			end if;

			if length(:new.idntfccion_antrior) = 15 then
				:new.idntfccion_antrior_frmtda := pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => :new.idntfccion_antrior
																						 , p_frmto => 'xx-xx-xxxx-xxxx-xxx'
																						 , p_crcter_dlmtdor => '-');
			elsif length(:new.idntfccion_antrior) = 25 then
				:new.idntfccion_antrior_frmtda := pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => :new.idntfccion_antrior
																						  , p_frmto => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'
																						  , p_crcter_dlmtdor => '-');
			else
				:new.idntfccion_antrior_frmtda := :new.idntfccion_antrior;
			end if;
		elsif updating then
			if :new.idntfccion != :old.idntfccion then
                if length(:new.idntfccion) = 15 then
                    :new.idntfccion_sjto_frmtda := pkg_gn_generalidades.fnc_cl_formato_texto( p_txto => :new.idntfccion
                                                                                            , p_frmto => 'xx-xx-xxxx-xxxx-xxx'
                                                                                            , p_crcter_dlmtdor => '-');
                elsif length(:new.idntfccion) = 25 then
                    :new.idntfccion_sjto_frmtda := pkg_gn_generalidades.fnc_cl_formato_texto( p_txto => :new.idntfccion
                                                                                            , p_frmto => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'
                                                                                            , p_crcter_dlmtdor => '-');
                else
                    :new.idntfccion_sjto_frmtda := :new.idntfccion;
                end if;
            end if;

            if :new.idntfccion_antrior != :old.idntfccion_antrior then
                if length(:new.idntfccion_antrior) = 15 then
                    :new.idntfccion_antrior_frmtda := pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => :new.idntfccion_antrior
                                                                                             , p_frmto => 'xx-xx-xxxx-xxxx-xxx'
                                                                                             , p_crcter_dlmtdor => '-');
                elsif length(:new.idntfccion_antrior) = 25 then
                    :new.idntfccion_antrior_frmtda := pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => :new.idntfccion_antrior
                                                                                              , p_frmto => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'
                                                                                              , p_crcter_dlmtdor => '-');
                else
                    :new.idntfccion_antrior_frmtda := :new.idntfccion_antrior;
                end if;
            end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "SI_C_SUJETOS_IU" ENABLE;

