
  CREATE OR REPLACE EDITIONABLE PROCEDURE "GET_PRINT_HTML_PDF" ( p_html         in clob
                                               , p_sql          in clob
                                               , p_style        in varchar2 default 'style'
                                               , p_url          in varchar2 default 'http://192.168.11.34:8000/generarPdf'
                                               , o_cdgo_rspsta  out number
                                               , o_mnsje_rspsta out varchar2
                                               , o_blob         out blob
                                               )
    as
        type c_cursor_type  is ref cursor;
        c_cursor            c_cursor_type;
        v_to_cursor_number  number;
        v_desc_table        dbms_sql.desc_tab;
        v_column_count      number;
        v_column_value      clob;
        v_result            clob;
        v_html              clob;
        v_body              clob;
        v_salto             varchar2(100);
    begin
        o_cdgo_rspsta   := 0;
        o_mnsje_rspsta  := '¡Arhivo generado con exito!';
        --REALIZAMOS CORRESPONDENCIA DE DATOS
        begin
            open c_cursor for p_sql;
            v_to_cursor_number := dbms_sql.to_cursor_number(c_cursor);
            dbms_sql.describe_columns(v_to_cursor_number, v_column_count, v_desc_table);
            for i in 1 .. v_column_count loop
                dbms_sql.define_column(v_to_cursor_number, i, v_column_value);
            end loop;
            while dbms_sql.fetch_rows(v_to_cursor_number) > 0
            loop
                v_html := p_html;
                for i in 1 .. v_column_count loop
                    dbms_sql.column_value(v_to_cursor_number, i, v_column_value);
                    if( length(v_column_value) > 4000 ) then
                        v_html := pkg_gn_generalidades.fnc_clob_replace( p_source  => v_html
                                                                       , p_search  => '#' || v_desc_table(i).col_name || '#'
                                                                       , p_replace => v_column_value );
                    else
                        v_html := replace( v_html , '#' || v_desc_table(i).col_name || '#' , v_column_value );
                    end if;
                end loop;
                v_result    := v_result || v_salto || v_html;
                v_salto     := '<div class="salto"></div>';
            end loop;
            dbms_sql.close_cursor(v_to_cursor_number);
        exception
            when others then
                o_cdgo_rspsta   := 1;
                o_mnsje_rspsta  := o_cdgo_rspsta || '. Ocurrio un error al realizar el proceso de correspondencia ' || sqlerrm;
                return;
        end;
        dbms_output.put_line('tamaño html ' || length(v_result));
        --GENERAMOS EL ARCHIVO
        begin
            apex_web_service.g_request_headers(1).name  := 'Content-Type';
            apex_web_service.g_request_headers(1).value := 'application/json';

            select json_object( 'html'  value v_result
                              , 'style' value p_style  returning clob)
              into v_body
              from dual;

            --REALIZMOS LA PETICION
            o_blob := apex_web_service.make_rest_request_b( p_url               => p_url
                                                          , p_http_method       => 'POST'
                                                          , p_body              => v_body
                                                          , p_transfer_timeout  => 300
                                                          );
        exception
            when others then
                o_cdgo_rspsta   := 2;
                o_mnsje_rspsta  := o_cdgo_rspsta || '. Ocurrio un error al generar el archivo ' || ' p_url ' || p_url || ' ' || sqlerrm;
                return;
        end;
    end get_print_html_pdf;
/

