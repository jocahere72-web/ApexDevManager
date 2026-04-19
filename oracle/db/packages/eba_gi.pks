
  CREATE OR REPLACE EDITIONABLE PACKAGE "EBA_GI" as
    -------------------------------------------------------------------------
    -- Generates a unique Identifier
    -------------------------------------------------------------------------
    function gen_id return number;

end eba_gi;
/

