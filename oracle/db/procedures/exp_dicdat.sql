
  CREATE OR REPLACE EDITIONABLE PROCEDURE "EXP_DICDAT" IS

V_ARCHVO       UTL_FILE.FILE_TYPE;
V_DRCTRIO      VARCHAR2(200);
V_NMBRE_ARCHVO VARCHAR2(50) := 'DicDat-Taxation-Valledupar.html';
V_LNEA         VARCHAR2(1000);
V_TPO_CMPO     VARCHAR2(50);
V_RQRDO        VARCHAR2(2);
V_IMPSTO       VARCHAR2(100);
V_CLNTE        VARCHAR2(100);
V_LSTA_CMPOS   VARCHAR2(200);
V_NMRBE_TBLA   VARCHAR2(100);


--cursor que recupera el listado de tablas y sus comentarios
CURSOR C1 IS
   select table_name,comments
     from user_tab_comments
    order by table_name;
--Cursor que localiza la definicion de campos de la tabla
CURSOR C2 (p_tbla varchar2) IS
   select column_name,data_type,data_length,data_precision,data_scale,nullable
     from user_tab_columns
    where table_name = p_tbla
    order by column_name;
--Cursor que localiza la descripci???n del campo
CURSOR C3 (p_tbla varchar2,p_cmpo varchar2) IS
  select comments
   from user_col_comments
  where table_name = p_tbla
    and column_name = p_cmpo
  order by table_name;
--Cursor para consultar constrains de una tabla
CURSOR C4 (p_tbla varchar2)IS
   select constraint_name,constraint_type,search_condition
     from user_constraints
    where table_name = p_tbla
      and generated = 'USER NAME';
--Cursor que retorna los campos que contituyen un constraints
CURSOR C5 (p_cnstraint varchar2)IS
   select column_name
     from User_cons_columns
     where constraint_name = p_cnstraint
     order by position;
--Cursor que retorna daos referenciados por una llave foranea
CURSOR C6 (p_cnstraint varchar2) IS
    select UC2.TABLE_NAME as REFERENCES_TABLE,UC2.CONSTRAINT_NAME
      from USER_CONS_COLUMNS UCC,
           USER_CONSTRAINTS UC,
           USER_CONSTRAINTS UC2
     where UCC.CONSTRAINT_NAME = UC.CONSTRAINT_NAME
       and UC.R_CONSTRAINT_NAME = UC2.CONSTRAINT_NAME
       and UC.CONSTRAINT_TYPE = 'R'
       and UCC.CONSTRAINT_NAME = p_cnstraint
    group by UC2.TABLE_NAME,UC2.CONSTRAINT_NAME;

CURSOR C7 (p_tabla varchar2) is
   select I.index_name,I.index_type,uniqueness
     from USER_INDEXES I
    where I.TABLE_NAME = p_tabla
      and I.INDEX_NAME not in (select K.index_name
                                 from user_constraints k
                                where k.table_name = p_tabla
                                  and k.index_name is not  null);

CURSOR C8 (P_index_name varchar2) is
    select column_name,descend
      from user_ind_columns
     where index_name = p_index_name
     order by column_position;

BEGIN
    --Consultando la ruta de escritura
    V_DRCTRIO := 'LOGS'; --Ruta de escritura
    --SELECT VLOR into NMBRE_CLNTE FROM DF_S_CLIENTES;   --Nombre del cliente
    V_IMPSTO := 'SISTEMA DE INFORMACION TRIBUTARIO TAXATION - MULTI-IMPUESTOS';  --Nombre del impuesto

     IF (V_DRCTRIO) IS NOT NULL THEN
        V_ARCHVO  := UTL_FILE.FOPEN(V_DRCTRIO,V_NMBRE_ARCHVO,'a',5000); -- abriendo
        V_LNEA := '<html>';
        UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

        V_LNEA := '<CENTER><H1> INFORMATICA Y TRIBUTOS S.A.S </H1></CENTER>';
        UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
        V_LNEA := '<CENTER><H2> DICCIONARIO DE BASE DE DATOS </H2></CENTER>';
        UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

        V_LNEA := '<br>';
        UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
        V_LNEA := '<H3> IMPUESTO: '||V_IMPSTO||'</H3>';
        UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
        V_LNEA := '<H3> CLIENTE: '||V_CLNTE||'</H3>';
        UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
        V_LNEA := '<br>';
        UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);


        FOR T IN C1 LOOP -- Nueva tabla
           V_LNEA := '<table border = "1px">';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           V_LNEA := '<tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td  bgcolor = "Teal"><font color="White">Tabla:</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td colspan = "3"  bgcolor = "Teal"><font color="White">'||T.TABLE_NAME||'</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '</tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           V_LNEA := '<tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td  bgcolor = "Teal"><font color="White">Descripci???n:</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td colspan = "3">'||T.COMMENTS||'</td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '</tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           V_LNEA := '<tr bgcolor="Blue">';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Campo</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Tipo</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Requerido</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Descripci???n</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '</tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           FOR C IN C2(T.TABLE_NAME) LOOP

             V_LNEA := '<tr>';
             UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

             V_LNEA := '<td>'||C.COLUMN_NAME||'</td>';
             UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

             --Cambiando la cadena del tipo de dato
             V_TPO_CMPO := C.DATA_TYPE;

             IF C.DATA_TYPE = 'NUMBER' THEN
                IF C.DATA_PRECISION IS NOT NULL THEN
                   V_TPO_CMPO := V_TPO_CMPO || '(' || C.DATA_PRECISION;
                END IF;
                IF C.DATA_SCALE IS NOT NULL THEN
                   V_TPO_CMPO := V_TPO_CMPO || ',' || C.DATA_SCALE || ')';
                ELSE
                   V_TPO_CMPO := V_TPO_CMPO || ')';
                END IF;
             ELSIF C.DATA_TYPE = 'VARCHAR2' OR C.DATA_TYPE = 'CHAR' THEN
                V_TPO_CMPO := V_TPO_CMPO || '(' || C.DATA_LENGTH || ')';
             END IF;

             V_LNEA := '<td>'||V_TPO_CMPO||'</td>';
             UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

             --Cambiando la cadena de requerido
             IF C.NULLABLE = 'Y' THEN
               V_RQRDO := 'SI';
             ELSE
               V_RQRDO := 'NO';
             END IF;

             V_LNEA := '<td>'||V_RQRDO||'</td>';
             UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

             FOR X IN C3(T.TABLE_NAME,C.COLUMN_NAME) LOOP

                 V_LNEA := '<td>'||X.COMMENTS||'</td>';
                 UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

             END LOOP;

             V_LNEA := '</tr>';
             UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           END LOOP;
           V_LNEA := '</table>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);


           V_LNEA := '<table border = "1px">';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           --insertando el titulo para la relaci???n de constraint
           V_LNEA := '<tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td  bgcolor = "Teal" colspan = "5"><font color="White">Constraints:</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '</tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           V_LNEA := '<tr bgcolor="Blue">';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Nombre</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Tipo</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Campos</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Tabla</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '</tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           FOR K IN C4(T.TABLE_NAME) LOOP --NUEVO CONSTRAINT

              V_LNEA := '<tr>';
              UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              V_LNEA := '<td>'||K.CONSTRAINT_NAME||'</td>';
              UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              V_LNEA := '<td>'||K.CONSTRAINT_TYPE||'</td>';
              UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              V_LSTA_CMPOS := NULL;
              --Concatenando el listado de campos
              FOR L IN C5(K.CONSTRAINT_NAME) LOOP
                  V_LSTA_CMPOS := V_LSTA_CMPOS || L.COLUMN_NAME || ',';
              END LOOP;
              V_LSTA_CMPOS := SUBSTR(RTRIM(V_LSTA_CMPOS),1,LENGTH(RTRIM(V_LSTA_CMPOS))-1);
              V_LNEA := '<td>'||V_LSTA_CMPOS||'</td>';
              UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

              IF K.CONSTRAINT_TYPE IN ('P','U') THEN
                 V_LNEA := '<td>-Null-</td>';
                 UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              ELSIF K.CONSTRAINT_TYPE = 'R' THEN
                 V_NMRBE_TBLA := NULL;
                 FOR F IN C6(K.CONSTRAINT_NAME) LOOP
                    V_NMRBE_TBLA := F.REFERENCES_TABLE;
                 END LOOP;
                 V_LNEA := '<td>'||V_NMRBE_TBLA||'</td>';
                 UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              ELSIF K.CONSTRAINT_TYPE = 'C' THEN
                 V_LNEA := '<td>'||K.SEARCH_CONDITION||'</td>';
                 UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              END IF;
              V_LNEA := '</tr>';
              UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           END LOOP;
           V_LNEA := '</table>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           --insertando el titulo para la relaci???n de indices
           V_LNEA := '<table border = "1px">';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td  bgcolor = "Teal" colspan = "5"><font color="White">Indices:</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '</tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           V_LNEA := '<tr bgcolor="Blue">';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Nombre</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Tipo</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '<td><font color="White">Campos</font></td>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           V_LNEA := '</tr>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           for r7 in c7(t.table_name) loop
              V_LNEA := '<tr>';
              UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              V_LNEA := '<td>'||r7.index_name||'</td>';
              UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              if r7.index_type = 'BITMAP' then
                 V_LNEA := '<td>BITMAP</td>';
                 UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              elsif r7.uniqueness = 'UNIQUE' then
                 V_LNEA := '<td>UNIQUE</td>';
                 UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              else
                 V_LNEA := '<td>NORMAL</td>';
                 UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
              end if;
              V_LSTA_CMPOS := NULL;
              for r8 in c8(r7.index_name) loop
                  V_LSTA_CMPOS := V_LSTA_CMPOS || r8.column_name || ' ' || r8.descend || ',';
              end loop;
              V_LSTA_CMPOS := SUBSTR(RTRIM(V_LSTA_CMPOS),1,LENGTH(RTRIM(V_LSTA_CMPOS))-1);
              V_LNEA := '<td>'||V_LSTA_CMPOS||'</td>';
              UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
           end loop;
           V_LNEA := '</table>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);

           V_LNEA := '<br>';
           UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
        END LOOP;

        V_LNEA := '</html>';
        UTL_FILE.PUT_LINE(V_ARCHVO, V_LNEA);
        UTL_FILE.FCLOSE(V_ARCHVO); --Cerrando
     END IF;

END;

/

