
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_REVOCATORIA_METODO_IU"
	for insert or update on gf_d_revocatoria_metodo
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_rvctria_mtdo is null then

				select nvl(max(id_rvctria_mtdo)+1, 1) into :new.id_rvctria_mtdo
				  from gf_d_revocatoria_metodo;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "GF_D_REVOCATORIA_METODO_IU" ENABLE;

