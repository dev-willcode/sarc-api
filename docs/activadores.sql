CREATE OR REPLACE FUNCTION integridad_usuario()
RETURNS TRIGGER AS
$$
DECLARE arg TEXT;
DECLARE usuario TEXT;
BEGIN
    IF(TG_OP='INSERT') THEN
		arg := TG_ARGV[0];
	    INSERT INTO inventario_usuario(correo, contrasena,tipo)
		VALUES(NEW.correo, NEW.dni, arg) RETURNING id INTO usuario;
		NEW.usuario_id = usuario;
	    RETURN NEW;
    ELSEIF(TG_OP='UPDATE') THEN
        UPDATE inventario_usuario
        SET correo = NEW.correo
        WHERE id = NEW.usuario_id;
		RETURN NEW;
    ELSEIF(TG_OP='DELETE') THEN
        DELETE FROM inventario_usuario WHERE id = OLD.usuario_id;
		RETURN OLD;
	END IF;
END;
$$ language plpgsql;

CREATE TRIGGER integridad_usuario BEFORE INSERT OR UPDATE OR DELETE
ON inventario_cliente FOR EACH ROW
EXECUTE PROCEDURE integridad_usuario('Cliente');

CREATE TRIGGER integridad_usuario BEFORE INSERT OR UPDATE OR DELETE
ON inventario_vendedor FOR EACH ROW
EXECUTE PROCEDURE integridad_usuario('Vendedor');

CREATE TRIGGER integridad_usuario BEFORE INSERT OR UPDATE OR DELETE
ON servicio_tecnico_mecanico FOR EACH ROW
EXECUTE PROCEDURE integridad_usuario('Mecanico');


CREATE OR REPLACE FUNCTION inhabilitar_auto()
RETURNS TRIGGER AS
$$
BEGIN
    IF(TG_OP='INSERT') THEN
        UPDATE inventario_auto
        SET estado = false
        WHERE id = NEW.auto_id;
	    RETURN NEW;
    ELSEIF(TG_OP='DELETE') THEN
        UPDATE inventario_auto
        SET estado = false
        WHERE id = NEW.auto_id;
	    RETURN NEW;
	END IF;
END;
$$ language plpgsql;

CREATE TRIGGER inhabilitar_auto AFTER INSERT OR DELETE
ON inventario_facturaventa FOR EACH ROW
EXECUTE PROCEDURE inhabilitar_auto();
