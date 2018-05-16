CREATE OR REPLACE TRIGGER salarioTotal
  BEFORE INSERT ON Jugador
    FOR EACH ROW
      DECLARE
        v_total NUMBER;    
      BEGIN
        SELECT sum(Sueldo)
        into v_total
            FROM Jugador
            group by Equipo_id;  
              IF(v_total*12>200.000)
               THEN raise_application_error(-20100, 'maximo jugadores permitidos son 6');
              END IF;        
END;