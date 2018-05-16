CREATE OR REPLACE TRIGGER maximojugadores
  BEFORE INSERT ON Jugador
    FOR EACH ROW
      DECLARE
        v_numeroJugadores NUMBER;    
      BEGIN
        SELECT COUNT(*)
          INTO v_numeroJugadores
            FROM Jugador
            WHERE Equipo_id = :new.Equipo_id;  
              IF(v_numeroJugadores>5)
               THEN raise_application_error(-20100, 'maximo jugadores permitidos son 6');
              END IF;        
END;