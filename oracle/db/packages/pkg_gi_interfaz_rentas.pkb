
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_GI_INTERFAZ_RENTAS" as

      procedure prc_vl_json ( p_json              in  clob,
                            o_cdgo_rspsta       out number,
                            o_mnsje_rspsta      out varchar2) as

        v_cdgo_impsto          	    df_c_impuestos.cdgo_impsto%type;
        v_cdgo_impsto_sbmpsto       df_i_impuestos_subimpuesto.cdgo_impsto_sbmpsto%type;
        v_cdgo_impsto_acto		    df_i_impuestos_acto.cdgo_impsto_acto%type;
        v_fcha_expdcion             gi_g_rentas.fcha_expdcion%type;
        v_bse_grvble    		    gi_g_rentas.vlor_bse_grvble%type;
        v_fcha_vncmnto_dcmnto       gi_g_rentas.fcha_vncmnto_dcmnto%type;
        v_cdgo_idntfccion_tpo       si_i_sujetos_responsable.cdgo_idntfccion_tpo%type;
        v_idntfccion                si_i_sujetos_responsable.idntfccion%type;
        v_tpo_prsna                 si_i_personas.tpo_prsna%type;
        v_prmer_nmbre               si_i_sujetos_responsable.prmer_nmbre%type;
        v_sgndo_nmbre               si_i_sujetos_responsable.sgndo_nmbre%type;
        v_prmer_aplldo              si_i_sujetos_responsable.prmer_aplldo%type;
        v_sgndo_aplldo              si_i_sujetos_responsable.sgndo_aplldo%type;
        v_prncpal                   si_i_sujetos_responsable.prncpal_s_n%type;
        v_cdgo_dprtmnto             df_s_departamentos.cdgo_dprtmnto%type;
        v_cdgo_mncpio               df_s_municipios.cdgo_mncpio%type;
        v_drccion                   si_i_sujetos_responsable.drccion_ntfccion%type;
        v_email                     si_i_sujetos_responsable.email%type;
        v_tlfno                     si_i_sujetos_responsable.tlfno%type;
        v_cllar                     si_i_sujetos_responsable.cllar%type;
        v_cdgo_tpo_rspnsble         si_i_sujetos_responsable.cdgo_tpo_rspnsble%type;
        v_url_ntfccion              varchar2(1000);
        v_txto_ascda                varchar2(100);
    begin
        o_cdgo_rspsta   := 0;
        o_mnsje_rspsta  := 'Informacion extraida correctamente';

        DBMS_OUTPUT.PUT_LINE('********** p_json = ' || p_json);

        begin
        --Se extraen los valores del Json
            select  a.txto_ascda,
                    a.cdgo_impsto,
                    a.cdgo_impsto_sbmpsto,
                    a.cdgo_impsto_acto,
                    a.fcha_expdcion,
                    a.bse_grvble,
                    a.fcha_vncmnto_dcmnto,
                    a.url_ntfccion,
                    a.cdgo_idntfccion_tpo,
                    a.idntfccion,
                    a.tpo_prsna,
                    a.prmer_nmbre,
                    a.sgndo_nmbre,
                    a.prmer_aplldo,
                    a.sgndo_aplldo,
                    a.prncpal,
                    a.cdgo_tpo_rspnsble,
                    a.cdgo_dprtmnto,
                    a.cdgo_mncpio,
                    a.drccion,
                    a.email,
                    a.tlfno,
                    a.cllar
            into    v_txto_ascda,
                    v_cdgo_impsto,
                    v_cdgo_impsto_sbmpsto,
                    v_cdgo_impsto_acto,
                    v_fcha_expdcion,
                    v_bse_grvble,
                    v_fcha_vncmnto_dcmnto,
                    v_url_ntfccion,
                    v_cdgo_idntfccion_tpo,
                    v_idntfccion,
                    v_tpo_prsna,
                    v_prmer_nmbre,
                    v_sgndo_nmbre,
                    v_prmer_aplldo,
                    v_sgndo_aplldo,
                    v_prncpal,
                    v_cdgo_tpo_rspnsble,
                    v_cdgo_dprtmnto,
                    v_cdgo_mncpio,
                    v_drccion,
                    v_email,
                    v_tlfno,
                    v_cllar
            from json_table(p_json,'$'
                            columns (   txto_ascda             varchar2 path '$.txto_ascda',
                                        cdgo_impsto            varchar2 path '$.cdgo_impsto',
                                        cdgo_impsto_sbmpsto    varchar2 path '$.cdgo_impsto_sbmpsto',
                                        cdgo_impsto_acto       varchar2 path '$.cdgo_impsto_acto',
                                        fcha_expdcion          varchar2 path '$.fcha_expdcion',
                                        bse_grvble             number   path '$.bse_grvble',
                                        fcha_vncmnto_dcmnto    varchar2 path '$.fcha_vncmnto_dcmnto',
                                        url_ntfccion           varchar2 path '$.url_ntfccion',

                                        nested path '$.sujeto'
                                        columns (
                                                cdgo_idntfccion_tpo   varchar2 path '$.cdgo_idntfccion_tpo',
                                                idntfccion            varchar2 path '$.idntfccion',
                                                tpo_prsna             varchar2 path '$.tpo_prsna',
                                                prmer_nmbre           varchar2 path '$.prmer_nmbre',
                                                sgndo_nmbre           varchar2 path '$.sgndo_nmbre',
                                                prmer_aplldo          varchar2 path '$.prmer_aplldo',
                                                sgndo_aplldo          varchar2 path '$.sgndo_aplldo',
                                                prncpal               varchar2 path '$.prncpal',
                                                cdgo_tpo_rspnsble     varchar2 path '$.cdgo_tpo_rspnsble',
                                                cdgo_dprtmnto         varchar2 path '$.cdgo_dprtmnto',
                                                cdgo_mncpio           varchar2 path '$.cdgo_mncpio',
                                                drccion               varchar2 path '$.drccion',
                                                email                 varchar2 path '$.email',
                                                tlfno                 varchar2 path '$.tlfno',
                                                cllar                 varchar2 path '$.cllar'
                                                )
                                    )
            ) a;
        exception
            when others then
                o_cdgo_rspsta := 1;
                o_mnsje_rspsta := 'No se pudieron extraer los datos del json. '|| sqlerrm;
                return;
        end;

        --Se validan los campos obligatorios
        if v_cdgo_impsto is null then
            o_cdgo_rspsta := 6;
            o_mnsje_rspsta := 'El Código del Impuesto es requerido.';
            return;
        elsif v_cdgo_impsto_sbmpsto is null then
            o_cdgo_rspsta := 7;
            o_mnsje_rspsta := 'El Código del Impuesto Subimpuesto es requerido.';
            return;
        elsif v_cdgo_impsto_acto is null then
            o_cdgo_rspsta := 8;
            o_mnsje_rspsta := 'El Código del Impuesto Acto es requerido.';
            return;
        elsif v_fcha_expdcion is null then
            o_cdgo_rspsta := 9;
            o_mnsje_rspsta := 'La Fecha de Expedición es requerida.';
            return;
        elsif v_bse_grvble is null then
            o_cdgo_rspsta := 10;
            o_mnsje_rspsta := 'La Base Gravable es requerida.';
            return;
        elsif v_fcha_vncmnto_dcmnto is null then
            o_cdgo_rspsta := 11;
            o_mnsje_rspsta := 'La Fecha de Vencimiento del Documento es requerida.';
            return;
        elsif v_cdgo_idntfccion_tpo is null  or v_cdgo_idntfccion_tpo not in ('C','E','T','P','N') then
            o_cdgo_rspsta := 12;
            o_mnsje_rspsta := 'El tipo de identificación es requerido o los posibles valores son C(CÉDULA DE CIUDADANÍA), E(CÉDULA DE EXTRANJERIA), T(TARJETA DE IDENTIDAD), P(PASAPORTES), N(No DE IDENTIFICACIÓN TRIBUTARIA)';
            return;
        elsif v_tpo_prsna is null or v_tpo_prsna not in ('N','J') then
            o_cdgo_rspsta := 13;
            o_mnsje_rspsta := 'El tipo de persona es requerida o los posibles valores son N (para persona Natural) o J (para persona Jurídica).';
            return;
        elsif v_idntfccion is null then
            o_cdgo_rspsta := 14;
            o_mnsje_rspsta := 'La Identificación es requerida.';
            return;
        elsif v_prmer_nmbre is null then
            o_cdgo_rspsta := 15;
            o_mnsje_rspsta := 'El Primer Nombre es requerido.';
            return;
        elsif v_prmer_aplldo is null then
            o_cdgo_rspsta := 16;
            o_mnsje_rspsta := 'El Primer Apellido es requerido.';
            return;
        elsif v_prncpal is null or v_prncpal not in ('S','N') then
            o_cdgo_rspsta := 17;
            o_mnsje_rspsta := 'Principal, S (Si) o N (NO) es requerido.';
            return;
        elsif v_cdgo_dprtmnto is null then
            o_cdgo_rspsta := 18;
            o_mnsje_rspsta := 'El Departamento es requerido.';
            return;
        elsif v_cdgo_mncpio is null then
            o_cdgo_rspsta := 19;
            o_mnsje_rspsta := 'El Municipio es requerido.';
            return;
        elsif v_drccion is null then
            o_cdgo_rspsta := 20;
            o_mnsje_rspsta := 'La Dirección es requerida.';
            return;
        elsif v_email is null then
            o_cdgo_rspsta := 21;
            o_mnsje_rspsta := 'El Email es requerido.';
            return;
        elsif not regexp_like (v_email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$') then
            o_cdgo_rspsta := 22;
            o_mnsje_rspsta := 'El Email no tiene la estructura correcta.';
            return;
        elsif trunc(v_fcha_vncmnto_dcmnto) < trunc(sysdate) then
            o_cdgo_rspsta := 23;
            o_mnsje_rspsta := 'La fecha de vencimiento del documento NO puede ser menor a hoy.';
            return;
        elsif v_fcha_expdcion > trunc(sysdate) then
            o_cdgo_rspsta := 24;
            o_mnsje_rspsta := 'La fecha de expedición NO puede ser mayor a hoy.';
            return;
        elsif v_cdgo_tpo_rspnsble is null then
            o_cdgo_rspsta := 25;
            o_mnsje_rspsta := 'El Tipo de Responsable es requerido.';
            return;
        end if;
        --Fin se validan los campos obligatios
    exception
        when others then
            o_cdgo_rspsta := 999;
            o_mnsje_rspsta := 'Error al extraer o validar los datos del json.'|| sqlerrm;
            return;
    end;

    procedure prc_rg_renta (p_json              in  clob,
                            o_id_rnta           out number,
                            o_id_dcmnto         out number,
                            o_nmro_dcmnto       out number,
                            o_cdgo_rspsta       out number,
                            o_mnsje_rspsta      out varchar2) as

    v_cdgo_clnte                            df_s_clientes.cdgo_clnte%type;
    v_id_pais_clnte                         df_s_clientes.id_pais%type;
    v_id_dprtmnto_clnte                     df_s_clientes.id_dprtmnto%type;
    v_id_mncpio_clnte                       df_s_clientes.id_mncpio%type;
    v_id_dprtmnto                           df_s_clientes.id_dprtmnto%type;
    v_id_mncpio                             df_s_clientes.id_mncpio%type;
    v_id_sjto_impsto                        si_i_sujetos_impuesto.id_sjto_impsto%type;
    v_json_sjto                             clob;
    v_json_impsto_acto_cncpto               clob;
    v_json_impsto_acto_cncpto_slccndo       clob;
    v_cdgo_dprtmnto                         v_df_s_municipios.cdgo_dprtmnto%type;
    v_cdgo_mncpio                           v_df_s_municipios.cdgo_mncpio%type;
    v_cdgo_dprtmnto_clnte                   df_s_departamentos.cdgo_dprtmnto%type;
    v_cdgo_mncpio_clnte                     df_s_municipios.cdgo_mncpio%type;
    v_id_impsto                             df_c_impuestos.id_impsto%type;
    v_id_impsto_sbmpsto                     df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;
    v_id_impsto_acto                        df_i_impuestos_acto.id_impsto_acto%type;
    v_rqre_ascsda                           df_i_impuestos_acto.indcdor_rqre_ascsda%type;
    v_cdgo_ascda                            gi_d_subimpuestos_asociada.cdgo_ascda%type;
    v_id_sbmpsto_ascda                      gi_d_subimpuestos_asociada.id_sbmpsto_ascda%type;
    v_cdgo_sjto_estdo                       v_si_i_sujetos_impuesto.cdgo_sjto_estdo%type;
    v_id_rprte                              gn_d_reportes.id_rprte%type;
    v_blob                                  blob;
    v_session_id                            number;
    v_id_usrio                              v_sg_g_usuarios.id_usrio%type;

    begin
        o_cdgo_rspsta   := 0;
        o_mnsje_rspsta  := 'Liquidación Generada Satisfactoriamente.';

        DBMS_OUTPUT.PUT_LINE('********** p_json = ' || p_json);

        --Se busca la informacion del cliente
        begin
            select  cdgo_clnte,
                    id_dprtmnto,
                    id_mncpio,
                    (select cdgo_dprtmnto from df_s_departamentos where id_dprtmnto = a.id_dprtmnto) cdgo_dprtmnto,
                    (select cdgo_mncpio from df_s_municipios where id_mncpio = a.id_mncpio) cdgo_mncpio
            into    v_cdgo_clnte,
                    v_id_dprtmnto_clnte,
                    v_id_mncpio_clnte,
                    v_cdgo_dprtmnto_clnte,
                    v_cdgo_mncpio_clnte
            from    df_s_clientes  a ;
        exception
            when others then
                o_cdgo_rspsta := 40;
                o_mnsje_rspsta := 'No se encontró el código del cliente.';
                return;
        end;

        --Se busca el usuario con el que se va a registrar la renta -  INTERFAZ RENTAS
        begin
            select id_usrio
            into v_id_usrio
            from v_sg_g_usuarios
            where user_name = '1111111120';
        exception
            when others then
                o_cdgo_rspsta := 41;
                o_mnsje_rspsta := 'No se encontro el usuario 1111111120 para registrar la renta.  ';
                return;
        end;


       -- Se extraen los campos del json
        for c_rnta in (select 	*
                        from  json_table(p_json, '$[*]'
                                    columns(txto_ascda				    varchar2        path '$.txto_ascda',
                                            cdgo_impsto                 varchar2        path '$.cdgo_impsto',
                                            cdgo_impsto_sbmpsto         varchar2        path '$.cdgo_impsto_sbmpsto',
                                            cdgo_impsto_acto         	varchar2        path '$.cdgo_impsto_acto',
                                            fcha_expdcion           	varchar2        path '$.fcha_expdcion',
                                            bse_grvble           		varchar2        path '$.bse_grvble',
                                            fcha_vncmnto_dcmnto         varchar2        path '$.fcha_vncmnto_dcmnto',
                                            url_ntfccion                varchar2        path '$.url_ntfccion',
                                            cdgo_idntfccion_tpo   		varchar2        path '$.sujeto.cdgo_idntfccion_tpo',
                                            idntfccion 		            varchar2       	path '$.sujeto.idntfccion',
                                            tpo_prsna 		            varchar2       	path '$.sujeto.tpo_prsna',
                                            prmer_nmbre          		varchar2        path '$.sujeto.prmer_nmbre',
                                            sgndo_nmbre          	    varchar2        path '$.sujeto.sgndo_nmbre',
                                            prmer_aplldo        		varchar2        path '$.sujeto.prmer_aplldo',
                                            sgndo_aplldo        	    varchar2        path '$.sujeto.sgndo_aplldo',
                                            prncpal        	            varchar2        path '$.sujeto.prncpal',
                                            cdgo_tpo_rspnsble        	varchar2        path '$.sujeto.cdgo_tpo_rspnsble',
                                            cdgo_dprtmnto   			varchar2       	path '$.sujeto.cdgo_dprtmnto',
                                            cdgo_mncpio   				varchar2       	path '$.sujeto.cdgo_mncpio',
                                            drccion    				    varchar2        path '$.sujeto.drccion',
                                            email    				    varchar2        path '$.sujeto.email',
                                            tlfno    				    varchar2        path '$.sujeto.tlfno',
                                            cllar    				    varchar2        path '$.sujeto.cllar'
                                           ))
                            )
        loop
            -- Consultamos el Municipio
            begin
               select   id_mncpio,
                        id_dprtmnto,
                        cdgo_dprtmnto,
                        cdgo_mncpio
                  into  v_id_mncpio,
                        v_id_dprtmnto,
                        v_cdgo_dprtmnto,
                        v_cdgo_mncpio
                  from v_df_s_municipios
                 where cdgo_mncpio = c_rnta.cdgo_mncpio;
            exception
                when others then
                  -- Municipio y Departamento por defecto
                  v_id_mncpio       := v_id_mncpio_clnte;
                  begin
                    select  id_mncpio,
                            id_dprtmnto,
                            cdgo_dprtmnto,
                            cdgo_mncpio
                      into  v_id_mncpio,
                            v_id_dprtmnto,
                            v_cdgo_dprtmnto,
                            v_cdgo_mncpio
                      from v_df_s_municipios
                     where id_mncpio = v_id_mncpio;
                  exception
                    when others then
                        v_id_mncpio         := v_id_mncpio_clnte;
                        v_id_dprtmnto       := v_id_dprtmnto_clnte;
                        v_cdgo_dprtmnto     := v_cdgo_dprtmnto_clnte;
                        v_cdgo_mncpio       := v_cdgo_mncpio_clnte;
                end;
            end;

            -- Se consulta el id_impsto y subimpuesto
            begin
                select id_impsto, id_impsto_sbmpsto
                into v_id_impsto, v_id_impsto_sbmpsto
                from v_df_i_impuestos_subimpuesto
                where cdgo_impsto = c_rnta.cdgo_impsto
                    and cdgo_impsto_sbmpsto = c_rnta.cdgo_impsto_sbmpsto;
            exception
                when others then
                    o_cdgo_rspsta := 42;
                    o_mnsje_rspsta := o_cdgo_rspsta || ' Error al consultar el id del impuesto y/o sub impuesto. '|| sqlerrm;
                    rollback;
                    return;
            end;

            -- Se consulta el id_impsto_acto
            begin
                select id_impsto_acto
                into v_id_impsto_acto
                from df_i_impuestos_acto
                where cdgo_impsto_acto = c_rnta.cdgo_impsto_acto;
            exception
                when others then
                    rollback;
                    o_cdgo_rspsta := 43;
                    o_mnsje_rspsta := o_cdgo_rspsta || ' Error al consultar el id del acto. ';
                    return;
            end;

            -- Se revisa en la parametrica si el acto requiere asociada
            begin
                select indcdor_rqre_ascsda
                into v_rqre_ascsda
                 from df_i_impuestos_acto
                where id_impsto_sbmpsto      = v_id_impsto_sbmpsto
                  and id_impsto_acto         = v_id_impsto_acto;
                  --and indcdor_rqre_ascsda    = 'S';
            exception
                when no_data_found then
                    null;
                when others then
                    rollback;
                    o_cdgo_rspsta := 49;
                    o_mnsje_rspsta := o_cdgo_rspsta || ' Error al consultar si el acto requiere asociada. '|| sqlerrm;
                    return;
            end;

            --Si requiere asociada, se verifica que venga en el json
            if v_rqre_ascsda = 'S' and c_rnta.txto_ascda is null then
                o_cdgo_rspsta := 44;
                o_mnsje_rspsta := o_cdgo_rspsta || ' El campo Asociada es requerido. ';
                return;
            else
                --Se busca el codigo de la asociada que debe estar activa
                begin
                     select cdgo_ascda, id_sbmpsto_ascda
                     into v_cdgo_ascda, v_id_sbmpsto_ascda
                     from gi_d_subimpuestos_asociada
                    where cdgo_clnte                    = v_cdgo_clnte
                      and id_impsto_sbmpsto             = v_id_impsto_sbmpsto
                      and activo                        = 'S';
                exception
                    when others then
                        o_cdgo_rspsta := 45;
                        o_mnsje_rspsta := o_cdgo_rspsta || ' No se encontró el código de la asociada. ';
                        return;
                end;

                --Si la asociada es una referencia catastrasl
                if v_cdgo_ascda = 'REF' then
                    -- Se debe validar que tenga 25 digitos exactamente si es una referencia catastral
                    if length(c_rnta.txto_ascda) != 25  then
                        o_cdgo_rspsta := 46;
                        o_mnsje_rspsta := 'La Referencia Catastral debe tener 25 dígitos.';
                        return;
                    else
                        --Se debe validar el la referencia este ACTIVA
                        begin
                            select cdgo_sjto_estdo
                            into v_cdgo_sjto_estdo
                            from v_si_i_sujetos_impuesto
                            where idntfccion_sjto = c_rnta.txto_ascda
                                and id_impsto = (select id_impsto from df_c_impuestos where cdgo_impsto = 'IPU');

                            if v_cdgo_sjto_estdo != 'A' then --Activo
                                o_cdgo_rspsta := 47;
                                o_mnsje_rspsta := 'El predio no está ACTIVO. Esta en estado : '||v_cdgo_sjto_estdo;
                                return;
                            end if;
                        exception
                            when others then
                                o_cdgo_rspsta := 48;
                                o_mnsje_rspsta := 'Error al consultar el estado del predio. '|| sqlerrm;
                                return;
                        end;
                    end if; --if length(c_rnta.txto_ascda) != 25  then
                end if;  -- if v_cdgo_ascda = 'REF' then
            end if; --if v_rqre_ascsda = 'S' and c_rnta.txto_ascda is null then

            -- Validamos si el sujeto impuesto existe
            begin
                select id_sjto_impsto
                  into v_id_sjto_impsto
                  from v_si_i_sujetos_impuesto
                 where id_impsto = v_id_impsto
                   and idntfccion_sjto = c_rnta.idntfccion;
                DBMS_OUTPUT.PUT_LINE('v_id_sjto_impsto EXISTE = ' || v_id_sjto_impsto);

            exception
                -- Si no existe lo creamos
                when no_data_found then
                    -- Creamos el Json con los datos para registrar el sujeto-impuesto
                    select json_object(  'cdgo_clnte'               value           v_cdgo_clnte,
                                         'id_sjto'                  value           null,
                                         'id_sjto_impsto'           value           null,
                                         'idntfccion'               value           c_rnta.idntfccion ,
                                         'id_dprtmnto'              value           v_id_dprtmnto,
                                         'id_mncpio'                value           v_id_mncpio,
                                         'drccion'                  value           c_rnta.drccion,
                                         'id_impsto'                value           v_id_impsto,
                                         'id_dprtmnto_ntfccion'     value           v_id_dprtmnto,
                                         'id_mncpio_ntfccion'       value           v_id_mncpio,
                                         'drccion_ntfccion'         value           c_rnta.drccion,
                                         'email'                    value           c_rnta.email,
                                         'tlfno'                    value           c_rnta.tlfno,
                                         'id_usrio'                 value           v_id_usrio,
                                         'cdgo_idntfccion_tpo'      value           c_rnta.cdgo_idntfccion_tpo,
                                         'tpo_prsna'                value           c_rnta.tpo_prsna, -- Se toma por defecto de la tabla de consiguracion
                                         'prmer_nmbre'              value           c_rnta.prmer_nmbre,
                                         'sgndo_nmbre'              value           nvl(c_rnta.sgndo_nmbre,'.'),
                                         'prmer_aplldo'             value           c_rnta.prmer_aplldo,
                                         'sgndo_aplldo'             value           nvl(c_rnta.sgndo_aplldo,'.'),
                                         'nmbre_rzon_scial'         value           null,
                                         'nmro_rgstro_cmra_cmrcio'  value           null,
                                         'fcha_rgstro_cmra_cmrcio'  value           null,
                                         'fcha_incio_actvddes'      value           null,
                                         'nmro_scrsles'             value           null,
                                         'drccion_cmra_cmrcio'      value           null,
                                         'id_sjto_tpo'              value           null,
                                         'id_actvdad_ecnmca'        value           null,
                                         'rspnsble'                 value
                                         (select json_arrayagg(json_object('cdgo_clnte'             value       v_cdgo_clnte,
                                                                           'id_sjto_impsto'         value       null,
                                                                           'cdgo_idntfccion_tpo'    value       c_rnta.cdgo_idntfccion_tpo,
                                                                           'idntfccion'             value       c_rnta.idntfccion ,
                                                                           'prmer_nmbre'            value       c_rnta.prmer_nmbre,
                                                                           'sgndo_nmbre'            value       nvl(c_rnta.sgndo_nmbre,'.'),
                                                                           'prmer_aplldo'           value       c_rnta.prmer_aplldo,
                                                                           'sgndo_aplldo'           value       nvl(c_rnta.sgndo_aplldo,'.'),
                                                                           'prncpal'                value       c_rnta.prncpal,
                                                                           'cdgo_tpo_rspnsble'      value       c_rnta.cdgo_tpo_rspnsble,
                                                                           'id_dprtmnto_ntfccion'   value       v_id_dprtmnto,
                                                                           'id_mncpio_ntfccion'     value       v_id_mncpio,
                                                                           'drccion_ntfccion'       value       REGEXP_REPLACE(decode(c_rnta.drccion,'(null)',null,' ',null,c_rnta.drccion), '[@+&%\$_|¿()¿!?¿¿]"*=~^<>'),
                                                                           'email'                  value       c_rnta.email,
                                                                           'tlfno'                  value       c_rnta.tlfno,
                                                                           'cllar'                  value       c_rnta.tlfno,
                                                                           'actvo'                  value       'S',
                                                                           'id_sjto_rspnsble'       value       null)
                                                               returning clob)
                                            from dual) returning clob)
                        into v_json_sjto
                    from dual;
                    -- Fin Creacion del Json de Sujeto

                    -- Validamos que el Json no sea nulo
                    if v_json_sjto is null then
                        o_cdgo_rspsta  := 50;
                        o_mnsje_rspsta := 'Error al crear el json de sujeto-impuesto. '|| sqlerrm;
                        rollback;
                        return;
                    end if;


                    DBMS_OUTPUT.PUT_LINE('v_json_sjto = ' || v_json_sjto);
                    --  Registramos el Sujeto, Sujeto Impuesto, Persona y Tercero
                    begin
                        pkg_si_sujeto_impuesto.prc_rg_general_sujeto_impuesto(p_json         => v_json_sjto,
                                                                              o_sjto_impsto  => v_id_sjto_impsto,
                                                                              o_cdgo_rspsta  => o_cdgo_rspsta,
                                                                              o_mnsje_rspsta => o_mnsje_rspsta);

                        if (o_cdgo_rspsta != 0) then
                              o_cdgo_rspsta := 51 || o_cdgo_rspsta;
                              o_mnsje_rspsta := ' Error al registrar el sujeto-impuesto. '|| o_mnsje_rspsta;
                              rollback;
                              return;
                        end if;

                    exception
                        when others then
                          o_cdgo_rspsta  := 52;
                          o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||  ': Error al crear sujeto-impuesto ' || sqlerrm;
                          rollback;
                          return;
                    end;
            end; --fin registrar Sujeto

            --Se buscan los conceptos a liquidar
            begin
                DBMS_OUTPUT.PUT_LINE('v_cdgo_clnte = ' || v_cdgo_clnte);
                DBMS_OUTPUT.PUT_LINE('v_id_impsto = ' || v_id_impsto);
                DBMS_OUTPUT.PUT_LINE('v_id_impsto_sbmpsto = ' || v_id_impsto_sbmpsto);
                DBMS_OUTPUT.PUT_LINE('v_id_impsto_acto = ' || v_id_impsto_acto);
                DBMS_OUTPUT.PUT_LINE('v_id_sjto_impsto = ' || v_id_sjto_impsto);
                DBMS_OUTPUT.PUT_LINE('c_rnta.bse_grvble = ' || c_rnta.bse_grvble);
                DBMS_OUTPUT.PUT_LINE('c_rnta.fcha_expdcion = ' || c_rnta.fcha_expdcion);
                DBMS_OUTPUT.PUT_LINE(' PRUEBA '  );


                select json_arrayagg(json_object(key 'ID_CNCPTO' is a.id_cncpto,
                                                 key 'ID_IMPSTO_ACTO' is a.id_impsto_acto,
                                                 key 'ID_IMPSTO_ACTO_CNCPTO' is a.id_impsto_acto_cncpto) )
                into v_json_impsto_acto_cncpto
                from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			        => v_cdgo_clnte
                                                                        , p_id_impsto					=> v_id_impsto
                                                                        , p_id_impsto_sbmpsto			=> v_id_impsto_sbmpsto
                                                                        , p_id_impsto_acto				=> v_id_impsto_acto
                                                                        , p_id_sjto_impsto            	=> v_id_sjto_impsto
                                                                        , p_json_cncptos				=> null
                                                                        , p_vlor_bse					=> to_number(c_rnta.bse_grvble, '999G999G999G999G999G999G990D99')
                                                                        , p_indcdor_usa_extrnjro		=> 'N'
                                                                        , p_indcdor_usa_mxto			=> 'N'
                                                                        , p_fcha_expdcion				=> to_date(nvl(c_rnta.fcha_expdcion, sysdate))
                                                                        , p_fcha_vncmnto				=> to_date(nvl(c_rnta.fcha_vncmnto_dcmnto, sysdate))
                                                                        , p_indcdor_lqdccion_adcnal   	=> 'N'
                                                                        , p_id_rnta_antrior		    	=> null
                                                                        , p_indcdor_cntrto_gslna      	=> 'N'
                                                                        , p_id_impsto_acto_slccndo      => '[{"ID_IMPSTO_ACTO":'|| v_id_impsto_acto ||'}]'
                                                                         )
                            ) a
                 where abs(vlor_lqddo) > 0
                   and a.indcdor_cncpto_oblgtrio    = 'S';
            exception
                when others then
                    o_cdgo_rspsta  := 53;
                    o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||  ': Error al crear el json de Conceptos Obligatorios.' || sqlerrm;
                    rollback;
                    return;
            end;

            begin
                select json_arrayagg(  json_object(  key 'ID_IMPSTO_ACTO_CNCPTO' is l.id_impsto_acto_cncpto
                                                   , key 'ID_IMPSTO_ACTO'        is l.id_impsto_acto
                                                   , key 'GNRA_INTRES_MRA'       is l.gnra_intres_mra
                                                   , key 'FCHA_VNCMNTO'          is l.fcha_vncmnto
                                                   , key 'DIAS_MRA'              is l.dias_mra
                                                   , key 'BSE_CNCPTO'            is l.bse_grvble
                                                   , key 'VLOR_INDCDOR'          is l.vlor_cdgo_indcdor_tpo
                                                   , key 'VLOR_TRFA'             is l.vlor_trfa
                                                   , key 'VLOR'                  is l.vlor_trfa_clcldo
                                                   , key 'TXTO_TRFA'             is l.txto_trfa
                                                   , key 'VLOR_LQDDO'            is l.vlor_lqddo
                                                   , key 'VLOR_PGDO'             is l.vlor_pgdo
                                                   , key 'VLOR_INTRES_MRA'       is l.vlor_intres_mra
                                                   , key 'VLOR_TTAL'             is l.vlor_ttal
                                                   , key 'PRCNTJE_BSE_LQDCION'   is l.prcntje_bse_lqdcion
                                                   , key 'FCTOR'                 is l.fctor
                                                   , key 'ID_CNCPTO'             is l.id_cncpto
                                                    )
                                    )cncptos
                     into v_json_impsto_acto_cncpto_slccndo
                     from  (select  a.id_impsto_acto_cncpto
                                    , a.id_impsto_acto
                                    , a.gnra_intres_mra
                                    , to_char(a.fcha_vncmnto, 'dd/mm/yyyy')   fcha_vncmnto
                                    , nvl(a.dias_mra,'0') dias_mra
                                    , a.bse_grvble
                                    , nvl(a.vlor_cdgo_indcdor_tpo,'0') vlor_cdgo_indcdor_tpo
                                    , nvl(a.vlor_trfa,'0')  vlor_trfa
                                    , nvl(a.vlor_trfa_clcldo,'0') vlor_trfa_clcldo
                                    , a.txto_trfa
                                    , a.vlor_lqddo
                                    , a.vlor_pgdo
                                    , a.vlor_intres_mra
                                    , a.vlor_ttal
                                    , a.prcntje_bse_lqdcion
                                    , a.fctor
                                    , a.id_cncpto
                            from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion( p_cdgo_clnte 			        => v_cdgo_clnte
                                                                                    , p_id_impsto					=> v_id_impsto
                                                                                    , p_id_impsto_sbmpsto			=> v_id_impsto_sbmpsto
                                                                                    , p_id_impsto_acto				=> v_id_impsto_acto
                                                                                    , p_id_sjto_impsto            	=> v_id_sjto_impsto
                                                                                   -- , p_json_cncptos				=> v_json_impsto_acto_cncpto
                                                                                    , p_json_cncptos				=> null
                                                                                    , p_vlor_bse					=> to_number(c_rnta.bse_grvble, '999G999G999G999G999G999G990D99')
                                                                                    , p_indcdor_usa_extrnjro		=> 'N'
                                                                                    , p_indcdor_usa_mxto			=> 'N'
                                                                                    , p_fcha_expdcion				=> nvl(c_rnta.fcha_expdcion, sysdate)
                                                                                    , p_fcha_vncmnto				=> nvl(c_rnta.fcha_vncmnto_dcmnto, sysdate)
                                                                                    , p_indcdor_lqdccion_adcnal   	=> 'N'
                                                                                    , p_id_rnta_antrior		    	=> null
                                                                                    , p_indcdor_cntrto_gslna      	=> 'N'
                                                                                    , p_id_impsto_acto_slccndo      => '[{"ID_IMPSTO_ACTO":'|| v_id_impsto_acto ||'}]') ) a
                            where abs(vlor_lqddo) > 0
                            group by    a.id_impsto_acto_cncpto   , a.id_impsto_acto  , a.gnra_intres_mra  , to_char(a.fcha_vncmnto, 'dd/mm/yyyy')   , nvl(a.dias_mra,'0')  , a.bse_grvble
                                        , nvl(a.vlor_cdgo_indcdor_tpo,'0')  , nvl(a.vlor_trfa,'0')    , nvl(a.vlor_trfa_clcldo,'0')   , a.txto_trfa   , a.vlor_lqddo , a.vlor_pgdo  , a.vlor_intres_mra
                                        , a.vlor_ttal , a.prcntje_bse_lqdcion, a.fctor, a.id_cncpto ) l  ;
                 exception
                    when others then
                        o_cdgo_rspsta  := 54;
                        o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||  ': Error al crear el json de conceptos ' || sqlerrm;
                        rollback;
                        return;
            end;

            DBMS_OUTPUT.PUT_LINE('v_json_impsto_acto_cncpto = ' || v_json_impsto_acto_cncpto);
            DBMS_OUTPUT.PUT_LINE('v_json_impsto_acto_cncpto_slccndo = ' || v_json_impsto_acto_cncpto_slccndo);

            --Se registra la renta
            begin
                pkg_gi_rentas.prc_re_liquidacion_renta (  p_cdgo_clnte                => v_cdgo_clnte
                                                        , p_id_impsto                 => v_id_impsto
                                                        , p_id_impsto_sbmpsto         => v_id_impsto_sbmpsto
                                                        , p_id_sjto_impsto            => v_id_sjto_impsto
                                                        , p_json_impsto_acto_cncpto   => v_json_impsto_acto_cncpto_slccndo
                                                        , p_id_sbmpsto_ascda          => v_id_sbmpsto_ascda
                                                        , p_txto_ascda                => c_rnta.txto_ascda
                                                        , p_fcha_expdcion             => nvl(c_rnta.fcha_expdcion, sysdate)
                                                        , p_vlor_bse_grvble           => to_number(c_rnta.bse_grvble, '999G999G999G999G999G999G990D99')
                                                        , p_indcdor_usa_extrnjro      => 'N'
                                                        , p_indcdor_usa_mxto          => 'N'
                                                        , p_fcha_vncmnto_dcmnto       => nvl(c_rnta.fcha_vncmnto_dcmnto, sysdate)
                                                        , p_id_usrio                  => v_id_usrio
                                                        , p_entrno                    => 'PRVDO'
                                                        , p_id_entdad                 =>  null
                                                        , p_indcdor_lqdccion_adcnal   => 'N'
                                                        , p_id_rnta_antrior           => null
                                                        , p_indcdor_cntrto_gslna      => 'N'
                                                        , p_indcdor_cntrto_ese        => 'N'
                                                        -- , p_json_mtdtos             => :P139_JSON_MTDTOS
                                                        , p_id_rnta                   => o_id_rnta
                                                        , o_id_dcmnto                 => o_id_dcmnto
                                                        , o_nmro_dcmnto               => o_nmro_dcmnto
                                                        , o_cdgo_rspsta               => o_cdgo_rspsta
                                                        , o_mnsje_rspsta              => o_mnsje_rspsta
                                                     );

                DBMS_OUTPUT.PUT_LINE('pkg_gi_rentas.prc_re_liquidacion_renta o_cdgo_rspsta = ' || o_cdgo_rspsta);
                DBMS_OUTPUT.PUT_LINE('pkg_gi_rentas.prc_re_liquidacion_renta o_mnsje_rspsta = ' || o_mnsje_rspsta);

                if o_cdgo_rspsta != 0 then
                    DBMS_OUTPUT.PUT_LINE('ERROR pkg_gi_rentas.prc_re_liquidacion_renta o_cdgo_rspsta = ' || o_cdgo_rspsta);
                    o_cdgo_rspsta := 55;
                    o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||  ': Error al registrar la liquidación. ' || o_mnsje_rspsta;
                    rollback;
                    return;
                else
                    begin
                        --Si no envian url de notificacion, no se hace nada, es decir, no se debe notificar el pago, solo se registra la renta
                        if c_rnta.url_ntfccion is not null then
                            -- Se insertan los datos en la tabla de gestion, de donde los procesos tomaran la informacion para
                            -- realizar la gestion puntual por accion
                             pkg_gn_acciones_dinamicas.prc_rg_informacion_accion(
                                                                                p_cdgo_clnte 		=> v_cdgo_clnte,
                                                                                p_cdgo_prcso        => 'RE',
                                                                                p_nmbre_tbla 		=> 'RE_G_DOCUMENTOS',
                                                                                p_nmbre_cmpo 		=> 'ID_DCMNTO',
                                                                                p_id_impsto 		=> v_id_impsto,
                                                                                p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,
                                                                                p_orgen 			=> o_id_dcmnto,
                                                                                p_url_ntfccion      => c_rnta.url_ntfccion,
                                                                                o_cdgo_rspsta 		=> o_cdgo_rspsta,
                                                                                o_mnsje_rspsta 		=> o_mnsje_rspsta
                                                                              );

                            if o_cdgo_rspsta != 0 then
                                o_cdgo_rspsta := 56;
                                o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||  ': Error al registrar la acción a realizar. ' || o_mnsje_rspsta;
                                rollback;
                                return;
                            end if;
                        end if;
                    exception
                        when others then
                            o_cdgo_rspsta := 56;
                            o_mnsje_rspsta := o_cdgo_rspsta || ' Error al insertar en la tabla de eventos. ' || sqlerrm;
                            rollback;
                            return;
                    end;
                  --commit;
                end if;

            exception
                when others then
                    o_cdgo_rspsta := 56;
                    o_mnsje_rspsta := o_cdgo_rspsta || ' Error al liquidar la renta. ' || sqlerrm;
                    rollback;
                    return;
            end;
        end loop;


       begin
          -- Generamos el blob del documento
          -- Se busca el id del reporte del recibo de rentas
          begin
            select a.id_rprte
              into v_id_rprte
              from gn_d_reportes   a
               join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte
               and cdgo_clnte              = v_cdgo_clnte
             where cdgo_rprte_grpo = 'RRV'
               and a.indcdor_gnrco = 'N';
        exception
            when no_data_found then
                 select a.id_rprte
                  into v_id_rprte
                  from gn_d_reportes   a
                 where a.cdgo_rprte_grpo = 'RRV'
                   and a.indcdor_gnrco = 'S'
                   and rownum = 1;
            when others then
                v_id_rprte := null;
        end;

         --Se crea una session para poder crear el blob
        apex_session.create_session(p_app_id   => 66000,
                                    p_page_id  => 2,
                                    p_username => 'INTERFAZ_RENTAS'  --ojo
                                    );

        -- DIRIGIMOS LA SESION A LA PAGINA 2 IMPRESION
       /*apex_session.attach(p_app_id     => 66000,
                            p_page_id    => 2,
                            p_session_id => apex_application.g_instance --v('APP_SESSION')
                            );  */

        apex_util.set_session_state('P2_ID_RPRTE',  v_id_rprte);
        apex_util.set_session_state('P2_PRMTRO_1',  o_id_rnta);
        apex_util.set_session_state('P2_PRMTRO_2',  o_id_dcmnto);
        apex_util.set_session_state('P2_NMBRE_RPRTE','Liquidacion_'||o_id_rnta);
        apex_util.set_session_state('F_CDGO_CLNTE',  v_cdgo_clnte);
        apex_util.set_session_state('F_FRMTO_MNDA',  '999G999G999G999G999G990');

        --Se genera el blob del recibo
       v_blob := pkg_gn_generalidades.fnc_gn_blob_documento(  p_id_rprte    => v_id_rprte,--518,
                                                               p_prmtro_1    => o_id_rnta,
                                                               p_prmtro_2    => o_id_dcmnto,
                                                               p_nmbre_rprte => 'Liquidacion_' || o_id_rnta,
                                                               p_app_id      => 66000,--V('APP_ID'),
                                                               p_page_id     => 2--V('APP_PAGE_ID')
                                                               );


          -- Insertamos el blob en la tabla temporal
          begin
            insert into gn_g_temporal
              (id_ssion, n001, blob001, c001)
            values
              (o_id_rnta || o_id_dcmnto, o_id_rnta, v_blob, 'RENTAS');
            commit;
          exception
            when others then
              o_cdgo_rspsta  := 57;
              o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||  ': Error al generar el documento. ' ;
              rollback;
              return;
          end;

        exception
          when others then
            o_cdgo_rspsta  := 58;
            o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||  ' Error al insertar el blob : ' || o_id_rnta || sqlerrm;
            rollback;
            return;
        end;

        if o_cdgo_rspsta = 0 then
            o_mnsje_rspsta  := 'Liquidación Generada Satisfactoriamente.';
        end if;

  exception
        when others then
            rollback;
            o_cdgo_rspsta := 99;
            o_mnsje_rspsta := o_cdgo_rspsta || ' Error general al liquidar la renta. ' || o_mnsje_rspsta;
            return;
    end  prc_rg_renta;

end pkg_gi_interfaz_rentas ;
/

