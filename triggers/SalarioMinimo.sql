CREATE OR REPLACE TRIGGER SalarioMinimo
BEFORE  insert on Jugador 
 FOR EACH ROW
  DECLARE 
   v_minimo NUMBER;
  BEGIN
   select Salario INTO v_minimo 
    from Jugador;
   		if(v_minimo>735)
          THEN raise_application_error(-20100,'el salario debe de ser superior a 735');
    END IF;
END;