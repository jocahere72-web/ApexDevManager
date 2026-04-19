
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_VL_REGLAS_NEGOCIO" ( p_id_rgla_ngcio_clnte_fncion in  clob
                                                  , p_xml                        in  varchar2
                                                  , o_indcdor_vldccion           out varchar2
                                                  , o_rspstas                    out pkg_gn_generalidades.g_rspstas)

    as

        type t_funciones is record(
          id_rgla_ngcio_clnte_fncion gn_d_rglas_ngcio_clnte_fnc.id_rgla_ngcio_clnte_fncion%type
        , orden_agrpcion             gn_d_rglas_ngcio_clnte_fnc.orden_agrpcion%type
        , cmprta_lgca                gn_d_rglas_ngcio_clnte_fnc.cmprta_lgca%type
        , indcdor_cmple_vldccion     gn_d_rglas_ngcio_clnte_fnc.indcdor_cmple_vldccion%type
        , rspsta_pstva               gn_d_rglas_ngcio_clnte_fnc.rspsta_pstva%type
        , rspsta_ngtva               gn_d_rglas_ngcio_clnte_fnc.rspsta_ngtva%type
        , dscrpcion                  gn_d_funciones.dscrpcion%type
        , nmbre_up                   gn_d_funciones.nmbre_up%type
        );

        type g_funciones is table of t_funciones;

        v_funciones   g_funciones;
        v_where       varchar2(2000);
    begin

        o_rspstas := pkg_gn_generalidades.g_rspstas();

        --Llena la coleccion de reglas de negocio cliente
        select a.id_rgla_ngcio_clnte_fncion
             , a.orden_agrpcion
             , a.cmprta_lgca
             , a.indcdor_cmple_vldccion
             , a.rspsta_pstva
             , a.rspsta_ngtva
             , b.dscrpcion
             , b.nmbre_up
         bulk collect
         into v_funciones
         from gn_d_rglas_ngcio_clnte_fnc a
         join gn_d_funciones b on a.id_fncion = b.id_fncion
        where a.id_rgla_ngcio_clnte_fncion in (
                                                 select cdna
                                                   from ( table ( pkg_gn_generalidades.fnc_ca_split_table( p_cdna           => p_id_rgla_ngcio_clnte_fncion
                                                                                                         , p_crcter_dlmtdor => ',' )))
                                              )
          and a.actvo = 'S'
     order by a.orden_agrpcion
            , a.cmprta_lgca;

        for i in 1..v_funciones.count loop

            o_rspstas.extend;

            --Ejecuta la funcion de validacion
            begin
                execute immediate 'begin :result := ' || v_funciones(i).nmbre_up || '( p_xml  => :p_xml); end;'
                  using out o_indcdor_vldccion
                      ,  in p_xml;
            exception
                 when others then
                         o_rspstas(i).mnsje := 'No fue posible ejecutar la funcion: ' || v_funciones(i).nmbre_up || '( p_xml  => ' || chr(39) || p_xml || chr(39) || ') de la regla #' || v_funciones(i).id_rgla_ngcio_clnte_fncion;
                         raise_application_error( -20009 , o_rspstas(i).mnsje );
            end;

            if( o_indcdor_vldccion = v_funciones(i).indcdor_cmple_vldccion ) then
                o_indcdor_vldccion := 'S';
                o_rspstas(i).mnsje := v_funciones(i).rspsta_pstva;
            else
                o_rspstas(i).mnsje := v_funciones(i).rspsta_ngtva;
                o_indcdor_vldccion := 'N';
            end if;

           --Construcion del where
           v_where := v_where || chr(39) || o_indcdor_vldccion || chr(39) || ' = '
                              || chr(39) || 'S' || chr(39)
                              || ( case when i <> v_funciones.count and v_funciones(i).orden_agrpcion <> v_funciones(i+1).orden_agrpcion then
                                         ') ' || v_funciones(i).cmprta_lgca  || ' ( '
                                        when i <> v_funciones.count then
                                         ' '  || v_funciones(i).cmprta_lgca  || ' '
                                   end );

            o_rspstas(i).id_orgen         := v_funciones(i).id_rgla_ngcio_clnte_fncion;
            o_rspstas(i).indcdor_vldccion := o_indcdor_vldccion;

        end loop;

                v_where := '(' || nvl( v_where  , ' 1 = 0 ' ) || ')';

                --Comprueba las condiciones construidas por cada función
                begin
                    execute immediate ( 'select ''S'' from dual where ' || v_where )
                       into o_indcdor_vldccion;
                exception
                     when others then
                          o_indcdor_vldccion := 'N';
                end;

    end prc_vl_reglas_negocio;
/

