
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_CINTA_IGAC_IU"
for insert or update on gi_g_cinta_igac
compound trigger
    v_cdgo_dstno_igac df_s_destinos_igac.cdgo_dstno_igac%type;
	before each row is
begin
    if inserting then

        :new.avluo_igac        := round( :new.avluo_igac , -3 );
        :new.area_cnstrda_igac := round( :new.area_cnstrda_igac , 0 );
        :new.area_trrno_igac   := round( :new.area_trrno_igac , 0 );

        --Verifica si Existe el Destino Igac en el Sistema
        begin
            select cdgo_dstno_igac
              into v_cdgo_dstno_igac
              from df_s_destinos_igac
             where cdgo_dstno_igac = :new.dstno_ecnmco_igac;
        exception
              when no_data_found then
                   :new.dstno_ecnmco_igac := 'Z';
        end;

    end if;
end before each row;
end gi_g_cinta_igac_iu;







/
ALTER TRIGGER "GI_G_CINTA_IGAC_IU" ENABLE;

