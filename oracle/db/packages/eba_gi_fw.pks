
  CREATE OR REPLACE EDITIONABLE PACKAGE "EBA_GI_FW" as
    function compress_int (
        n in integer )
        return varchar2;
end;
/

