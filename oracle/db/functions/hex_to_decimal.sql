
  CREATE OR REPLACE EDITIONABLE FUNCTION "HEX_TO_DECIMAL" ( p_hex_str in varchar2 ) return number is
	-- El proposito de esta función es convertir del sistema Hexadecimal a Decimal

	--this function is based on one by Connor McDonald
	--http://www.jlcomp.demon.co.uk/faq/base_convert.html
	v_dec   number;
	v_hex   varchar2(16) := '0123456789ABCDEF';
begin
	v_dec := 0;
	for indx in 1 .. length(p_hex_str) loop
		v_dec := v_dec * 16 + instr(v_hex,upper(substr(p_hex_str,indx,1)))-1;
	end loop;
	return v_dec;
end hex_to_decimal;
/

