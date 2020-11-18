PGDMP     )                
    x            sarcdb    12.4    12.4 #   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    78144    sarcdb    DATABASE     �   CREATE DATABASE sarcdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE sarcdb;
                postgres    false                       1255    78625    inhabilitar_auto()    FUNCTION     �  CREATE FUNCTION public.inhabilitar_auto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 )   DROP FUNCTION public.inhabilitar_auto();
       public          postgres    false                       1255    78621    integridad_usuario()    FUNCTION     w  CREATE FUNCTION public.integridad_usuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;
 +   DROP FUNCTION public.integridad_usuario();
       public          postgres    false            �            1259    78176 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    78174    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    78186    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    78184    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    78168    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    78166    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    78194 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    78204    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    78202    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    78192    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212            �            1259    78212    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    78210 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216            �            1259    78272    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    78270    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    219            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    218            �            1259    78158    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    78156    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    78147    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    78145    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202                       1259    78610    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    78305    inventario_auto    TABLE     �   CREATE TABLE public.inventario_auto (
    id integer NOT NULL,
    bastidor character varying(17) NOT NULL,
    estado boolean NOT NULL,
    concesionario_id integer NOT NULL,
    modelo_auto_id integer NOT NULL
);
 #   DROP TABLE public.inventario_auto;
       public         heap    postgres    false            �            1259    78303    inventario_auto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_auto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.inventario_auto_id_seq;
       public          postgres    false    221            �           0    0    inventario_auto_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.inventario_auto_id_seq OWNED BY public.inventario_auto.id;
          public          postgres    false    220            �            1259    78315    inventario_cliente    TABLE     	  CREATE TABLE public.inventario_cliente (
    id integer NOT NULL,
    dni character varying(13) NOT NULL,
    nombre character varying(50) NOT NULL,
    domicilio character varying(50) NOT NULL,
    correo character varying(255) NOT NULL,
    usuario_id integer
);
 &   DROP TABLE public.inventario_cliente;
       public         heap    postgres    false            �            1259    78313    inventario_cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.inventario_cliente_id_seq;
       public          postgres    false    223            �           0    0    inventario_cliente_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.inventario_cliente_id_seq OWNED BY public.inventario_cliente.id;
          public          postgres    false    222            �            1259    78323    inventario_equipamiento    TABLE     �   CREATE TABLE public.inventario_equipamiento (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    precio numeric(10,2) NOT NULL
);
 +   DROP TABLE public.inventario_equipamiento;
       public         heap    postgres    false            �            1259    78321    inventario_equipamiento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_equipamiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.inventario_equipamiento_id_seq;
       public          postgres    false    225            �           0    0    inventario_equipamiento_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.inventario_equipamiento_id_seq OWNED BY public.inventario_equipamiento.id;
          public          postgres    false    224            �            1259    78331    inventario_facturaventa    TABLE     C  CREATE TABLE public.inventario_facturaventa (
    id integer NOT NULL,
    fecha_emision date NOT NULL,
    precio numeric(10,2) NOT NULL,
    descuento numeric(10,2) NOT NULL,
    forma_pago character varying(50) NOT NULL,
    auto_id integer NOT NULL,
    cliente_id integer NOT NULL,
    vendedor_id integer NOT NULL
);
 +   DROP TABLE public.inventario_facturaventa;
       public         heap    postgres    false            �            1259    78329    inventario_facturaventa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_facturaventa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.inventario_facturaventa_id_seq;
       public          postgres    false    227            �           0    0    inventario_facturaventa_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.inventario_facturaventa_id_seq OWNED BY public.inventario_facturaventa.id;
          public          postgres    false    226            �            1259    78392    inventario_facturaventadetalle    TABLE     �   CREATE TABLE public.inventario_facturaventadetalle (
    id integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    precio numeric(10,2) NOT NULL,
    es_serie boolean NOT NULL,
    factura_id integer
);
 2   DROP TABLE public.inventario_facturaventadetalle;
       public         heap    postgres    false            �            1259    78390 %   inventario_facturaventadetalle_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_facturaventadetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.inventario_facturaventadetalle_id_seq;
       public          postgres    false    241            �           0    0 %   inventario_facturaventadetalle_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.inventario_facturaventadetalle_id_seq OWNED BY public.inventario_facturaventadetalle.id;
          public          postgres    false    240            �            1259    78339    inventario_marca    TABLE     r   CREATE TABLE public.inventario_marca (
    id integer NOT NULL,
    descripcion character varying(50) NOT NULL
);
 $   DROP TABLE public.inventario_marca;
       public         heap    postgres    false            �            1259    78337    inventario_marca_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_marca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.inventario_marca_id_seq;
       public          postgres    false    229            �           0    0    inventario_marca_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.inventario_marca_id_seq OWNED BY public.inventario_marca.id;
          public          postgres    false    228            �            1259    78376    inventario_modeloauto    TABLE     '  CREATE TABLE public.inventario_modeloauto (
    id integer NOT NULL,
    nombre_modelo character varying(50) NOT NULL,
    potencia numeric(10,2) NOT NULL,
    cilindraje integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    descuento numeric(10,2) NOT NULL,
    marca_id integer NOT NULL
);
 )   DROP TABLE public.inventario_modeloauto;
       public         heap    postgres    false            �            1259    78384 #   inventario_modeloauto_equipamientos    TABLE     �   CREATE TABLE public.inventario_modeloauto_equipamientos (
    id integer NOT NULL,
    modeloauto_id integer NOT NULL,
    equipamiento_id integer NOT NULL
);
 7   DROP TABLE public.inventario_modeloauto_equipamientos;
       public         heap    postgres    false            �            1259    78382 *   inventario_modeloauto_equipamientos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_modeloauto_equipamientos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.inventario_modeloauto_equipamientos_id_seq;
       public          postgres    false    239            �           0    0 *   inventario_modeloauto_equipamientos_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.inventario_modeloauto_equipamientos_id_seq OWNED BY public.inventario_modeloauto_equipamientos.id;
          public          postgres    false    238            �            1259    78374    inventario_modeloauto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_modeloauto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.inventario_modeloauto_id_seq;
       public          postgres    false    237            �           0    0    inventario_modeloauto_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.inventario_modeloauto_id_seq OWNED BY public.inventario_modeloauto.id;
          public          postgres    false    236            �            1259    78347    inventario_servicio    TABLE     �   CREATE TABLE public.inventario_servicio (
    id integer NOT NULL,
    dni character varying(13) NOT NULL,
    nombre character varying(50) NOT NULL,
    domicilio character varying(50) NOT NULL,
    tipo character varying(50) NOT NULL
);
 '   DROP TABLE public.inventario_servicio;
       public         heap    postgres    false            �            1259    78345    inventario_servicio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.inventario_servicio_id_seq;
       public          postgres    false    231            �           0    0    inventario_servicio_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.inventario_servicio_id_seq OWNED BY public.inventario_servicio.id;
          public          postgres    false    230            �            1259    78355    inventario_usuario    TABLE     �   CREATE TABLE public.inventario_usuario (
    id integer NOT NULL,
    correo character varying(255) NOT NULL,
    contrasena character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL
);
 &   DROP TABLE public.inventario_usuario;
       public         heap    postgres    false            �            1259    78353    inventario_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.inventario_usuario_id_seq;
       public          postgres    false    233            �           0    0    inventario_usuario_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.inventario_usuario_id_seq OWNED BY public.inventario_usuario.id;
          public          postgres    false    232            �            1259    78368    inventario_vendedor    TABLE     
  CREATE TABLE public.inventario_vendedor (
    id integer NOT NULL,
    dni character varying(13) NOT NULL,
    nombre character varying(50) NOT NULL,
    domicilio character varying(50) NOT NULL,
    correo character varying(255) NOT NULL,
    usuario_id integer
);
 '   DROP TABLE public.inventario_vendedor;
       public         heap    postgres    false            �            1259    78366    inventario_vendedor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_vendedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.inventario_vendedor_id_seq;
       public          postgres    false    235            �           0    0    inventario_vendedor_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.inventario_vendedor_id_seq OWNED BY public.inventario_vendedor.id;
          public          postgres    false    234                       1259    78536    servicio_tecnico_citas    TABLE     �   CREATE TABLE public.servicio_tecnico_citas (
    id integer NOT NULL,
    fecha date NOT NULL,
    hora character varying(50) NOT NULL,
    estado boolean NOT NULL,
    cliente_id integer NOT NULL,
    mecanico_id integer
);
 *   DROP TABLE public.servicio_tecnico_citas;
       public         heap    postgres    false                        1259    78534    servicio_tecnico_citas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_citas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.servicio_tecnico_citas_id_seq;
       public          postgres    false    257            �           0    0    servicio_tecnico_citas_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.servicio_tecnico_citas_id_seq OWNED BY public.servicio_tecnico_citas.id;
          public          postgres    false    256            �            1259    78470     servicio_tecnico_facturaservicio    TABLE     �   CREATE TABLE public.servicio_tecnico_facturaservicio (
    id integer NOT NULL,
    fecha_emision date NOT NULL,
    cliente_id integer NOT NULL,
    revision_tecnica_id integer
);
 4   DROP TABLE public.servicio_tecnico_facturaservicio;
       public         heap    postgres    false            �            1259    78468 '   servicio_tecnico_facturaservicio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_facturaservicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.servicio_tecnico_facturaservicio_id_seq;
       public          postgres    false    243            �           0    0 '   servicio_tecnico_facturaservicio_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.servicio_tecnico_facturaservicio_id_seq OWNED BY public.servicio_tecnico_facturaservicio.id;
          public          postgres    false    242            �            1259    78523 '   servicio_tecnico_facturaserviciodetalle    TABLE     �   CREATE TABLE public.servicio_tecnico_facturaserviciodetalle (
    id integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    precio numeric(10,2) NOT NULL,
    cantidad integer NOT NULL,
    factura_id integer,
    repuesto_id integer
);
 ;   DROP TABLE public.servicio_tecnico_facturaserviciodetalle;
       public         heap    postgres    false            �            1259    78521 .   servicio_tecnico_facturaserviciodetalle_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_facturaserviciodetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.servicio_tecnico_facturaserviciodetalle_id_seq;
       public          postgres    false    255            �           0    0 .   servicio_tecnico_facturaserviciodetalle_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.servicio_tecnico_facturaserviciodetalle_id_seq OWNED BY public.servicio_tecnico_facturaserviciodetalle.id;
          public          postgres    false    254            �            1259    78478    servicio_tecnico_mecanico    TABLE     W  CREATE TABLE public.servicio_tecnico_mecanico (
    id integer NOT NULL,
    dni character varying(13) NOT NULL,
    nombre character varying(50) NOT NULL,
    domicilio character varying(50) NOT NULL,
    correo character varying(255) NOT NULL,
    citas_pendientes integer NOT NULL,
    taller_id integer NOT NULL,
    usuario_id integer
);
 -   DROP TABLE public.servicio_tecnico_mecanico;
       public         heap    postgres    false            �            1259    78476     servicio_tecnico_mecanico_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_mecanico_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.servicio_tecnico_mecanico_id_seq;
       public          postgres    false    245            �           0    0     servicio_tecnico_mecanico_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.servicio_tecnico_mecanico_id_seq OWNED BY public.servicio_tecnico_mecanico.id;
          public          postgres    false    244            �            1259    78486    servicio_tecnico_repuestos    TABLE     �   CREATE TABLE public.servicio_tecnico_repuestos (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    precio numeric(10,2) NOT NULL,
    cantidad integer NOT NULL
);
 .   DROP TABLE public.servicio_tecnico_repuestos;
       public         heap    postgres    false            �            1259    78484 !   servicio_tecnico_repuestos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_repuestos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.servicio_tecnico_repuestos_id_seq;
       public          postgres    false    247            �           0    0 !   servicio_tecnico_repuestos_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.servicio_tecnico_repuestos_id_seq OWNED BY public.servicio_tecnico_repuestos.id;
          public          postgres    false    246            �            1259    78494     servicio_tecnico_revisiontecnica    TABLE     ]  CREATE TABLE public.servicio_tecnico_revisiontecnica (
    id integer NOT NULL,
    fecha_revision date NOT NULL,
    fecha_proxima_revision date NOT NULL,
    kilometraje_actual numeric(10,2) NOT NULL,
    costo_revision numeric(10,2) NOT NULL,
    cliente_id integer NOT NULL,
    mecanico_id integer NOT NULL,
    vehiculo_id integer NOT NULL
);
 4   DROP TABLE public.servicio_tecnico_revisiontecnica;
       public         heap    postgres    false            �            1259    78492 '   servicio_tecnico_revisiontecnica_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_revisiontecnica_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.servicio_tecnico_revisiontecnica_id_seq;
       public          postgres    false    249            �           0    0 '   servicio_tecnico_revisiontecnica_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.servicio_tecnico_revisiontecnica_id_seq OWNED BY public.servicio_tecnico_revisiontecnica.id;
          public          postgres    false    248            �            1259    78510 '   servicio_tecnico_revisiontecnicadetalle    TABLE     �   CREATE TABLE public.servicio_tecnico_revisiontecnicadetalle (
    id integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    precio numeric(10,2) NOT NULL,
    revision_tecnica_id integer NOT NULL
);
 ;   DROP TABLE public.servicio_tecnico_revisiontecnicadetalle;
       public         heap    postgres    false            �            1259    78508 .   servicio_tecnico_revisiontecnicadetalle_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_revisiontecnicadetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.servicio_tecnico_revisiontecnicadetalle_id_seq;
       public          postgres    false    253            �           0    0 .   servicio_tecnico_revisiontecnicadetalle_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.servicio_tecnico_revisiontecnicadetalle_id_seq OWNED BY public.servicio_tecnico_revisiontecnicadetalle.id;
          public          postgres    false    252            �            1259    78502    servicio_tecnico_vehiculo    TABLE     �   CREATE TABLE public.servicio_tecnico_vehiculo (
    id integer NOT NULL,
    chasis character varying(50) NOT NULL,
    matricula character varying(50) NOT NULL,
    cliente_id integer NOT NULL
);
 -   DROP TABLE public.servicio_tecnico_vehiculo;
       public         heap    postgres    false            �            1259    78500     servicio_tecnico_vehiculo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_vehiculo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.servicio_tecnico_vehiculo_id_seq;
       public          postgres    false    251            �           0    0     servicio_tecnico_vehiculo_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.servicio_tecnico_vehiculo_id_seq OWNED BY public.servicio_tecnico_vehiculo.id;
          public          postgres    false    250            /           2604    78179    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            0           2604    78189    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            .           2604    78171    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            1           2604    78197    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            2           2604    78207    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            3           2604    78215    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            4           2604    78275    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            -           2604    78161    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            ,           2604    78150    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            6           2604    78308    inventario_auto id    DEFAULT     x   ALTER TABLE ONLY public.inventario_auto ALTER COLUMN id SET DEFAULT nextval('public.inventario_auto_id_seq'::regclass);
 A   ALTER TABLE public.inventario_auto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            7           2604    78318    inventario_cliente id    DEFAULT     ~   ALTER TABLE ONLY public.inventario_cliente ALTER COLUMN id SET DEFAULT nextval('public.inventario_cliente_id_seq'::regclass);
 D   ALTER TABLE public.inventario_cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            8           2604    78326    inventario_equipamiento id    DEFAULT     �   ALTER TABLE ONLY public.inventario_equipamiento ALTER COLUMN id SET DEFAULT nextval('public.inventario_equipamiento_id_seq'::regclass);
 I   ALTER TABLE public.inventario_equipamiento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            9           2604    78334    inventario_facturaventa id    DEFAULT     �   ALTER TABLE ONLY public.inventario_facturaventa ALTER COLUMN id SET DEFAULT nextval('public.inventario_facturaventa_id_seq'::regclass);
 I   ALTER TABLE public.inventario_facturaventa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            @           2604    78395 !   inventario_facturaventadetalle id    DEFAULT     �   ALTER TABLE ONLY public.inventario_facturaventadetalle ALTER COLUMN id SET DEFAULT nextval('public.inventario_facturaventadetalle_id_seq'::regclass);
 P   ALTER TABLE public.inventario_facturaventadetalle ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            :           2604    78342    inventario_marca id    DEFAULT     z   ALTER TABLE ONLY public.inventario_marca ALTER COLUMN id SET DEFAULT nextval('public.inventario_marca_id_seq'::regclass);
 B   ALTER TABLE public.inventario_marca ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            >           2604    78379    inventario_modeloauto id    DEFAULT     �   ALTER TABLE ONLY public.inventario_modeloauto ALTER COLUMN id SET DEFAULT nextval('public.inventario_modeloauto_id_seq'::regclass);
 G   ALTER TABLE public.inventario_modeloauto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            ?           2604    78387 &   inventario_modeloauto_equipamientos id    DEFAULT     �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos ALTER COLUMN id SET DEFAULT nextval('public.inventario_modeloauto_equipamientos_id_seq'::regclass);
 U   ALTER TABLE public.inventario_modeloauto_equipamientos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            ;           2604    78350    inventario_servicio id    DEFAULT     �   ALTER TABLE ONLY public.inventario_servicio ALTER COLUMN id SET DEFAULT nextval('public.inventario_servicio_id_seq'::regclass);
 E   ALTER TABLE public.inventario_servicio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            <           2604    78358    inventario_usuario id    DEFAULT     ~   ALTER TABLE ONLY public.inventario_usuario ALTER COLUMN id SET DEFAULT nextval('public.inventario_usuario_id_seq'::regclass);
 D   ALTER TABLE public.inventario_usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            =           2604    78371    inventario_vendedor id    DEFAULT     �   ALTER TABLE ONLY public.inventario_vendedor ALTER COLUMN id SET DEFAULT nextval('public.inventario_vendedor_id_seq'::regclass);
 E   ALTER TABLE public.inventario_vendedor ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            H           2604    78539    servicio_tecnico_citas id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_citas ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_citas_id_seq'::regclass);
 H   ALTER TABLE public.servicio_tecnico_citas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    257    257            A           2604    78473 #   servicio_tecnico_facturaservicio id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_facturaservicio ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_facturaservicio_id_seq'::regclass);
 R   ALTER TABLE public.servicio_tecnico_facturaservicio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            G           2604    78526 *   servicio_tecnico_facturaserviciodetalle id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_facturaserviciodetalle ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_facturaserviciodetalle_id_seq'::regclass);
 Y   ALTER TABLE public.servicio_tecnico_facturaserviciodetalle ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254    255            B           2604    78481    servicio_tecnico_mecanico id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_mecanico ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_mecanico_id_seq'::regclass);
 K   ALTER TABLE public.servicio_tecnico_mecanico ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            C           2604    78489    servicio_tecnico_repuestos id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_repuestos ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_repuestos_id_seq'::regclass);
 L   ALTER TABLE public.servicio_tecnico_repuestos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246    247            D           2604    78497 #   servicio_tecnico_revisiontecnica id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_revisiontecnica_id_seq'::regclass);
 R   ALTER TABLE public.servicio_tecnico_revisiontecnica ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    249    249            F           2604    78513 *   servicio_tecnico_revisiontecnicadetalle id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_revisiontecnicadetalle_id_seq'::regclass);
 Y   ALTER TABLE public.servicio_tecnico_revisiontecnicadetalle ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    253    253            E           2604    78505    servicio_tecnico_vehiculo id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_vehiculo ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_vehiculo_id_seq'::regclass);
 K   ALTER TABLE public.servicio_tecnico_vehiculo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    251    251            h          0    78176 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   r�      j          0    78186    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   ��      f          0    78168    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   ��      l          0    78194 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   n�      n          0    78204    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   ��      p          0    78212    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   ��      r          0    78272    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219   ť      d          0    78158    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   �      b          0    78147    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   �      �          0    78610    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    258   ��      t          0    78305    inventario_auto 
   TABLE DATA           a   COPY public.inventario_auto (id, bastidor, estado, concesionario_id, modelo_auto_id) FROM stdin;
    public          postgres    false    221   Ө      v          0    78315    inventario_cliente 
   TABLE DATA           \   COPY public.inventario_cliente (id, dni, nombre, domicilio, correo, usuario_id) FROM stdin;
    public          postgres    false    223   �      x          0    78323    inventario_equipamiento 
   TABLE DATA           E   COPY public.inventario_equipamiento (id, nombre, precio) FROM stdin;
    public          postgres    false    225   �      z          0    78331    inventario_facturaventa 
   TABLE DATA           �   COPY public.inventario_facturaventa (id, fecha_emision, precio, descuento, forma_pago, auto_id, cliente_id, vendedor_id) FROM stdin;
    public          postgres    false    227   *�      �          0    78392    inventario_facturaventadetalle 
   TABLE DATA           g   COPY public.inventario_facturaventadetalle (id, descripcion, precio, es_serie, factura_id) FROM stdin;
    public          postgres    false    241   G�      |          0    78339    inventario_marca 
   TABLE DATA           ;   COPY public.inventario_marca (id, descripcion) FROM stdin;
    public          postgres    false    229   d�      �          0    78376    inventario_modeloauto 
   TABLE DATA           u   COPY public.inventario_modeloauto (id, nombre_modelo, potencia, cilindraje, precio, descuento, marca_id) FROM stdin;
    public          postgres    false    237   ��      �          0    78384 #   inventario_modeloauto_equipamientos 
   TABLE DATA           a   COPY public.inventario_modeloauto_equipamientos (id, modeloauto_id, equipamiento_id) FROM stdin;
    public          postgres    false    239   ��      ~          0    78347    inventario_servicio 
   TABLE DATA           O   COPY public.inventario_servicio (id, dni, nombre, domicilio, tipo) FROM stdin;
    public          postgres    false    231   ��      �          0    78355    inventario_usuario 
   TABLE DATA           J   COPY public.inventario_usuario (id, correo, contrasena, tipo) FROM stdin;
    public          postgres    false    233   ة      �          0    78368    inventario_vendedor 
   TABLE DATA           ]   COPY public.inventario_vendedor (id, dni, nombre, domicilio, correo, usuario_id) FROM stdin;
    public          postgres    false    235   ��      �          0    78536    servicio_tecnico_citas 
   TABLE DATA           b   COPY public.servicio_tecnico_citas (id, fecha, hora, estado, cliente_id, mecanico_id) FROM stdin;
    public          postgres    false    257   �      �          0    78470     servicio_tecnico_facturaservicio 
   TABLE DATA           n   COPY public.servicio_tecnico_facturaservicio (id, fecha_emision, cliente_id, revision_tecnica_id) FROM stdin;
    public          postgres    false    243   /�      �          0    78523 '   servicio_tecnico_facturaserviciodetalle 
   TABLE DATA           }   COPY public.servicio_tecnico_facturaserviciodetalle (id, descripcion, precio, cantidad, factura_id, repuesto_id) FROM stdin;
    public          postgres    false    255   L�      �          0    78478    servicio_tecnico_mecanico 
   TABLE DATA           �   COPY public.servicio_tecnico_mecanico (id, dni, nombre, domicilio, correo, citas_pendientes, taller_id, usuario_id) FROM stdin;
    public          postgres    false    245   i�      �          0    78486    servicio_tecnico_repuestos 
   TABLE DATA           R   COPY public.servicio_tecnico_repuestos (id, nombre, precio, cantidad) FROM stdin;
    public          postgres    false    247   ��      �          0    78494     servicio_tecnico_revisiontecnica 
   TABLE DATA           �   COPY public.servicio_tecnico_revisiontecnica (id, fecha_revision, fecha_proxima_revision, kilometraje_actual, costo_revision, cliente_id, mecanico_id, vehiculo_id) FROM stdin;
    public          postgres    false    249   ��      �          0    78510 '   servicio_tecnico_revisiontecnicadetalle 
   TABLE DATA           o   COPY public.servicio_tecnico_revisiontecnicadetalle (id, descripcion, precio, revision_tecnica_id) FROM stdin;
    public          postgres    false    253   ��      �          0    78502    servicio_tecnico_vehiculo 
   TABLE DATA           V   COPY public.servicio_tecnico_vehiculo (id, chasis, matricula, cliente_id) FROM stdin;
    public          postgres    false    251   ݪ      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    208            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);
          public          postgres    false    206            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    214            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);
          public          postgres    false    212            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    218            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);
          public          postgres    false    204            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);
          public          postgres    false    202            �           0    0    inventario_auto_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.inventario_auto_id_seq', 1, false);
          public          postgres    false    220            �           0    0    inventario_cliente_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.inventario_cliente_id_seq', 1, false);
          public          postgres    false    222            �           0    0    inventario_equipamiento_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.inventario_equipamiento_id_seq', 1, false);
          public          postgres    false    224            �           0    0    inventario_facturaventa_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.inventario_facturaventa_id_seq', 1, false);
          public          postgres    false    226            �           0    0 %   inventario_facturaventadetalle_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.inventario_facturaventadetalle_id_seq', 1, false);
          public          postgres    false    240            �           0    0    inventario_marca_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.inventario_marca_id_seq', 1, false);
          public          postgres    false    228            �           0    0 *   inventario_modeloauto_equipamientos_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.inventario_modeloauto_equipamientos_id_seq', 1, false);
          public          postgres    false    238            �           0    0    inventario_modeloauto_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.inventario_modeloauto_id_seq', 1, false);
          public          postgres    false    236            �           0    0    inventario_servicio_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.inventario_servicio_id_seq', 1, false);
          public          postgres    false    230            �           0    0    inventario_usuario_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.inventario_usuario_id_seq', 1, false);
          public          postgres    false    232            �           0    0    inventario_vendedor_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.inventario_vendedor_id_seq', 1, false);
          public          postgres    false    234            �           0    0    servicio_tecnico_citas_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.servicio_tecnico_citas_id_seq', 1, false);
          public          postgres    false    256            �           0    0 '   servicio_tecnico_facturaservicio_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.servicio_tecnico_facturaservicio_id_seq', 1, false);
          public          postgres    false    242            �           0    0 .   servicio_tecnico_facturaserviciodetalle_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.servicio_tecnico_facturaserviciodetalle_id_seq', 1, false);
          public          postgres    false    254            �           0    0     servicio_tecnico_mecanico_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.servicio_tecnico_mecanico_id_seq', 1, false);
          public          postgres    false    244            �           0    0 !   servicio_tecnico_repuestos_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.servicio_tecnico_repuestos_id_seq', 1, false);
          public          postgres    false    246            �           0    0 '   servicio_tecnico_revisiontecnica_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.servicio_tecnico_revisiontecnica_id_seq', 1, false);
          public          postgres    false    248            �           0    0 .   servicio_tecnico_revisiontecnicadetalle_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.servicio_tecnico_revisiontecnicadetalle_id_seq', 1, false);
          public          postgres    false    252            �           0    0     servicio_tecnico_vehiculo_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.servicio_tecnico_vehiculo_id_seq', 1, false);
          public          postgres    false    250            V           2606    78301    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            [           2606    78228 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            ^           2606    78191 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            X           2606    78181    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            Q           2606    78219 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            S           2606    78173 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            f           2606    78209 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215            i           2606    78243 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215            `           2606    78199    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213            l           2606    78217 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217            o           2606    78257 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            c           2606    78295     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213            r           2606    78281 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    219            L           2606    78165 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            N           2606    78163 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            J           2606    78155 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            �           2606    78617 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    258            v           2606    78312 ,   inventario_auto inventario_auto_bastidor_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.inventario_auto
    ADD CONSTRAINT inventario_auto_bastidor_key UNIQUE (bastidor);
 V   ALTER TABLE ONLY public.inventario_auto DROP CONSTRAINT inventario_auto_bastidor_key;
       public            postgres    false    221            z           2606    78310 $   inventario_auto inventario_auto_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.inventario_auto
    ADD CONSTRAINT inventario_auto_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.inventario_auto DROP CONSTRAINT inventario_auto_pkey;
       public            postgres    false    221            |           2606    78320 *   inventario_cliente inventario_cliente_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.inventario_cliente
    ADD CONSTRAINT inventario_cliente_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.inventario_cliente DROP CONSTRAINT inventario_cliente_pkey;
       public            postgres    false    223                       2606    78328 4   inventario_equipamiento inventario_equipamiento_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.inventario_equipamiento
    ADD CONSTRAINT inventario_equipamiento_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.inventario_equipamiento DROP CONSTRAINT inventario_equipamiento_pkey;
       public            postgres    false    225            �           2606    78336 4   inventario_facturaventa inventario_facturaventa_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.inventario_facturaventa
    ADD CONSTRAINT inventario_facturaventa_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.inventario_facturaventa DROP CONSTRAINT inventario_facturaventa_pkey;
       public            postgres    false    227            �           2606    78397 B   inventario_facturaventadetalle inventario_facturaventadetalle_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventario_facturaventadetalle
    ADD CONSTRAINT inventario_facturaventadetalle_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.inventario_facturaventadetalle DROP CONSTRAINT inventario_facturaventadetalle_pkey;
       public            postgres    false    241            �           2606    78344 &   inventario_marca inventario_marca_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.inventario_marca
    ADD CONSTRAINT inventario_marca_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.inventario_marca DROP CONSTRAINT inventario_marca_pkey;
       public            postgres    false    229            �           2606    78445 c   inventario_modeloauto_equipamientos inventario_modeloauto_eq_modeloauto_id_equipamien_aa6ff43c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos
    ADD CONSTRAINT inventario_modeloauto_eq_modeloauto_id_equipamien_aa6ff43c_uniq UNIQUE (modeloauto_id, equipamiento_id);
 �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos DROP CONSTRAINT inventario_modeloauto_eq_modeloauto_id_equipamien_aa6ff43c_uniq;
       public            postgres    false    239    239            �           2606    78389 L   inventario_modeloauto_equipamientos inventario_modeloauto_equipamientos_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos
    ADD CONSTRAINT inventario_modeloauto_equipamientos_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos DROP CONSTRAINT inventario_modeloauto_equipamientos_pkey;
       public            postgres    false    239            �           2606    78381 0   inventario_modeloauto inventario_modeloauto_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.inventario_modeloauto
    ADD CONSTRAINT inventario_modeloauto_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.inventario_modeloauto DROP CONSTRAINT inventario_modeloauto_pkey;
       public            postgres    false    237            �           2606    78352 ,   inventario_servicio inventario_servicio_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.inventario_servicio
    ADD CONSTRAINT inventario_servicio_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.inventario_servicio DROP CONSTRAINT inventario_servicio_pkey;
       public            postgres    false    231            �           2606    78365 0   inventario_usuario inventario_usuario_correo_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.inventario_usuario
    ADD CONSTRAINT inventario_usuario_correo_key UNIQUE (correo);
 Z   ALTER TABLE ONLY public.inventario_usuario DROP CONSTRAINT inventario_usuario_correo_key;
       public            postgres    false    233            �           2606    78363 *   inventario_usuario inventario_usuario_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.inventario_usuario
    ADD CONSTRAINT inventario_usuario_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.inventario_usuario DROP CONSTRAINT inventario_usuario_pkey;
       public            postgres    false    233            �           2606    78373 ,   inventario_vendedor inventario_vendedor_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.inventario_vendedor
    ADD CONSTRAINT inventario_vendedor_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.inventario_vendedor DROP CONSTRAINT inventario_vendedor_pkey;
       public            postgres    false    235            �           2606    78541 2   servicio_tecnico_citas servicio_tecnico_citas_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.servicio_tecnico_citas
    ADD CONSTRAINT servicio_tecnico_citas_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.servicio_tecnico_citas DROP CONSTRAINT servicio_tecnico_citas_pkey;
       public            postgres    false    257            �           2606    78475 F   servicio_tecnico_facturaservicio servicio_tecnico_facturaservicio_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_facturaservicio
    ADD CONSTRAINT servicio_tecnico_facturaservicio_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.servicio_tecnico_facturaservicio DROP CONSTRAINT servicio_tecnico_facturaservicio_pkey;
       public            postgres    false    243            �           2606    78528 T   servicio_tecnico_facturaserviciodetalle servicio_tecnico_facturaserviciodetalle_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_facturaserviciodetalle
    ADD CONSTRAINT servicio_tecnico_facturaserviciodetalle_pkey PRIMARY KEY (id);
 ~   ALTER TABLE ONLY public.servicio_tecnico_facturaserviciodetalle DROP CONSTRAINT servicio_tecnico_facturaserviciodetalle_pkey;
       public            postgres    false    255            �           2606    78483 8   servicio_tecnico_mecanico servicio_tecnico_mecanico_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.servicio_tecnico_mecanico
    ADD CONSTRAINT servicio_tecnico_mecanico_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.servicio_tecnico_mecanico DROP CONSTRAINT servicio_tecnico_mecanico_pkey;
       public            postgres    false    245            �           2606    78491 :   servicio_tecnico_repuestos servicio_tecnico_repuestos_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.servicio_tecnico_repuestos
    ADD CONSTRAINT servicio_tecnico_repuestos_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.servicio_tecnico_repuestos DROP CONSTRAINT servicio_tecnico_repuestos_pkey;
       public            postgres    false    247            �           2606    78499 F   servicio_tecnico_revisiontecnica servicio_tecnico_revisiontecnica_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica
    ADD CONSTRAINT servicio_tecnico_revisiontecnica_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica DROP CONSTRAINT servicio_tecnico_revisiontecnica_pkey;
       public            postgres    false    249            �           2606    78515 T   servicio_tecnico_revisiontecnicadetalle servicio_tecnico_revisiontecnicadetalle_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle
    ADD CONSTRAINT servicio_tecnico_revisiontecnicadetalle_pkey PRIMARY KEY (id);
 ~   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle DROP CONSTRAINT servicio_tecnico_revisiontecnicadetalle_pkey;
       public            postgres    false    253            �           2606    78507 8   servicio_tecnico_vehiculo servicio_tecnico_vehiculo_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.servicio_tecnico_vehiculo
    ADD CONSTRAINT servicio_tecnico_vehiculo_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.servicio_tecnico_vehiculo DROP CONSTRAINT servicio_tecnico_vehiculo_pkey;
       public            postgres    false    251            T           1259    78302    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            Y           1259    78239 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            \           1259    78240 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            O           1259    78225 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            d           1259    78255 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215            g           1259    78254 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215            j           1259    78269 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217            m           1259    78268 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217            a           1259    78296     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213            p           1259    78292 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219            s           1259    78293 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219            �           1259    78619 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    258            �           1259    78618 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    258            t           1259    78418 &   inventario_auto_bastidor_eea1ee1a_like    INDEX     z   CREATE INDEX inventario_auto_bastidor_eea1ee1a_like ON public.inventario_auto USING btree (bastidor varchar_pattern_ops);
 :   DROP INDEX public.inventario_auto_bastidor_eea1ee1a_like;
       public            postgres    false    221            w           1259    78466 )   inventario_auto_concesionario_id_c4ce35f9    INDEX     q   CREATE INDEX inventario_auto_concesionario_id_c4ce35f9 ON public.inventario_auto USING btree (concesionario_id);
 =   DROP INDEX public.inventario_auto_concesionario_id_c4ce35f9;
       public            postgres    false    221            x           1259    78467 '   inventario_auto_modelo_auto_id_196a49ea    INDEX     m   CREATE INDEX inventario_auto_modelo_auto_id_196a49ea ON public.inventario_auto USING btree (modelo_auto_id);
 ;   DROP INDEX public.inventario_auto_modelo_auto_id_196a49ea;
       public            postgres    false    221            }           1259    78465 &   inventario_cliente_usuario_id_0934ab88    INDEX     k   CREATE INDEX inventario_cliente_usuario_id_0934ab88 ON public.inventario_cliente USING btree (usuario_id);
 :   DROP INDEX public.inventario_cliente_usuario_id_0934ab88;
       public            postgres    false    223            �           1259    78429 (   inventario_facturaventa_auto_id_87cec3a1    INDEX     o   CREATE INDEX inventario_facturaventa_auto_id_87cec3a1 ON public.inventario_facturaventa USING btree (auto_id);
 <   DROP INDEX public.inventario_facturaventa_auto_id_87cec3a1;
       public            postgres    false    227            �           1259    78430 +   inventario_facturaventa_cliente_id_1fb9f4c0    INDEX     u   CREATE INDEX inventario_facturaventa_cliente_id_1fb9f4c0 ON public.inventario_facturaventa USING btree (cliente_id);
 ?   DROP INDEX public.inventario_facturaventa_cliente_id_1fb9f4c0;
       public            postgres    false    227            �           1259    78464 ,   inventario_facturaventa_vendedor_id_53b6f329    INDEX     w   CREATE INDEX inventario_facturaventa_vendedor_id_53b6f329 ON public.inventario_facturaventa USING btree (vendedor_id);
 @   DROP INDEX public.inventario_facturaventa_vendedor_id_53b6f329;
       public            postgres    false    227            �           1259    78463 2   inventario_facturaventadetalle_factura_id_9b5d9c15    INDEX     �   CREATE INDEX inventario_facturaventadetalle_factura_id_9b5d9c15 ON public.inventario_facturaventadetalle USING btree (factura_id);
 F   DROP INDEX public.inventario_facturaventadetalle_factura_id_9b5d9c15;
       public            postgres    false    241            �           1259    78457 <   inventario_modeloauto_equipamientos_equipamiento_id_7aff93a2    INDEX     �   CREATE INDEX inventario_modeloauto_equipamientos_equipamiento_id_7aff93a2 ON public.inventario_modeloauto_equipamientos USING btree (equipamiento_id);
 P   DROP INDEX public.inventario_modeloauto_equipamientos_equipamiento_id_7aff93a2;
       public            postgres    false    239            �           1259    78456 :   inventario_modeloauto_equipamientos_modeloauto_id_81838bf8    INDEX     �   CREATE INDEX inventario_modeloauto_equipamientos_modeloauto_id_81838bf8 ON public.inventario_modeloauto_equipamientos USING btree (modeloauto_id);
 N   DROP INDEX public.inventario_modeloauto_equipamientos_modeloauto_id_81838bf8;
       public            postgres    false    239            �           1259    78443 '   inventario_modeloauto_marca_id_8741d667    INDEX     m   CREATE INDEX inventario_modeloauto_marca_id_8741d667 ON public.inventario_modeloauto USING btree (marca_id);
 ;   DROP INDEX public.inventario_modeloauto_marca_id_8741d667;
       public            postgres    false    237            �           1259    78431 '   inventario_usuario_correo_ad9d6790_like    INDEX     |   CREATE INDEX inventario_usuario_correo_ad9d6790_like ON public.inventario_usuario USING btree (correo varchar_pattern_ops);
 ;   DROP INDEX public.inventario_usuario_correo_ad9d6790_like;
       public            postgres    false    233            �           1259    78437 '   inventario_vendedor_usuario_id_d79de4c5    INDEX     m   CREATE INDEX inventario_vendedor_usuario_id_d79de4c5 ON public.inventario_vendedor USING btree (usuario_id);
 ;   DROP INDEX public.inventario_vendedor_usuario_id_d79de4c5;
       public            postgres    false    235            �           1259    78608 *   servicio_tecnico_citas_cliente_id_e0472dc4    INDEX     s   CREATE INDEX servicio_tecnico_citas_cliente_id_e0472dc4 ON public.servicio_tecnico_citas USING btree (cliente_id);
 >   DROP INDEX public.servicio_tecnico_citas_cliente_id_e0472dc4;
       public            postgres    false    257            �           1259    78609 +   servicio_tecnico_citas_mecanico_id_a7dfdf79    INDEX     u   CREATE INDEX servicio_tecnico_citas_mecanico_id_a7dfdf79 ON public.servicio_tecnico_citas USING btree (mecanico_id);
 ?   DROP INDEX public.servicio_tecnico_citas_mecanico_id_a7dfdf79;
       public            postgres    false    257            �           1259    78547 4   servicio_tecnico_facturaservicio_cliente_id_e4eeeb95    INDEX     �   CREATE INDEX servicio_tecnico_facturaservicio_cliente_id_e4eeeb95 ON public.servicio_tecnico_facturaservicio USING btree (cliente_id);
 H   DROP INDEX public.servicio_tecnico_facturaservicio_cliente_id_e4eeeb95;
       public            postgres    false    243            �           1259    78597 =   servicio_tecnico_facturaservicio_revision_tecnica_id_56df4331    INDEX     �   CREATE INDEX servicio_tecnico_facturaservicio_revision_tecnica_id_56df4331 ON public.servicio_tecnico_facturaservicio USING btree (revision_tecnica_id);
 Q   DROP INDEX public.servicio_tecnico_facturaservicio_revision_tecnica_id_56df4331;
       public            postgres    false    243            �           1259    78595 ;   servicio_tecnico_facturaserviciodetalle_factura_id_94d5523e    INDEX     �   CREATE INDEX servicio_tecnico_facturaserviciodetalle_factura_id_94d5523e ON public.servicio_tecnico_facturaserviciodetalle USING btree (factura_id);
 O   DROP INDEX public.servicio_tecnico_facturaserviciodetalle_factura_id_94d5523e;
       public            postgres    false    255            �           1259    78596 <   servicio_tecnico_facturaserviciodetalle_repuesto_id_68a64f84    INDEX     �   CREATE INDEX servicio_tecnico_facturaserviciodetalle_repuesto_id_68a64f84 ON public.servicio_tecnico_facturaserviciodetalle USING btree (repuesto_id);
 P   DROP INDEX public.servicio_tecnico_facturaserviciodetalle_repuesto_id_68a64f84;
       public            postgres    false    255            �           1259    78558 ,   servicio_tecnico_mecanico_taller_id_74d2c269    INDEX     w   CREATE INDEX servicio_tecnico_mecanico_taller_id_74d2c269 ON public.servicio_tecnico_mecanico USING btree (taller_id);
 @   DROP INDEX public.servicio_tecnico_mecanico_taller_id_74d2c269;
       public            postgres    false    245            �           1259    78559 -   servicio_tecnico_mecanico_usuario_id_11b70898    INDEX     y   CREATE INDEX servicio_tecnico_mecanico_usuario_id_11b70898 ON public.servicio_tecnico_mecanico USING btree (usuario_id);
 A   DROP INDEX public.servicio_tecnico_mecanico_usuario_id_11b70898;
       public            postgres    false    245            �           1259    78583 7   servicio_tecnico_revisiont_revision_tecnica_id_d8c091af    INDEX     �   CREATE INDEX servicio_tecnico_revisiont_revision_tecnica_id_d8c091af ON public.servicio_tecnico_revisiontecnicadetalle USING btree (revision_tecnica_id);
 K   DROP INDEX public.servicio_tecnico_revisiont_revision_tecnica_id_d8c091af;
       public            postgres    false    253            �           1259    78570 4   servicio_tecnico_revisiontecnica_cliente_id_4586057b    INDEX     �   CREATE INDEX servicio_tecnico_revisiontecnica_cliente_id_4586057b ON public.servicio_tecnico_revisiontecnica USING btree (cliente_id);
 H   DROP INDEX public.servicio_tecnico_revisiontecnica_cliente_id_4586057b;
       public            postgres    false    249            �           1259    78571 5   servicio_tecnico_revisiontecnica_mecanico_id_8b6f2647    INDEX     �   CREATE INDEX servicio_tecnico_revisiontecnica_mecanico_id_8b6f2647 ON public.servicio_tecnico_revisiontecnica USING btree (mecanico_id);
 I   DROP INDEX public.servicio_tecnico_revisiontecnica_mecanico_id_8b6f2647;
       public            postgres    false    249            �           1259    78584 5   servicio_tecnico_revisiontecnica_vehiculo_id_33c02c4b    INDEX     �   CREATE INDEX servicio_tecnico_revisiontecnica_vehiculo_id_33c02c4b ON public.servicio_tecnico_revisiontecnica USING btree (vehiculo_id);
 I   DROP INDEX public.servicio_tecnico_revisiontecnica_vehiculo_id_33c02c4b;
       public            postgres    false    249            �           1259    78577 -   servicio_tecnico_vehiculo_cliente_id_cd3440e6    INDEX     y   CREATE INDEX servicio_tecnico_vehiculo_cliente_id_cd3440e6 ON public.servicio_tecnico_vehiculo USING btree (cliente_id);
 A   DROP INDEX public.servicio_tecnico_vehiculo_cliente_id_cd3440e6;
       public            postgres    false    251            �           2620    78626 (   inventario_facturaventa inhabilitar_auto    TRIGGER     �   CREATE TRIGGER inhabilitar_auto AFTER INSERT OR DELETE ON public.inventario_facturaventa FOR EACH ROW EXECUTE FUNCTION public.inhabilitar_auto();
 A   DROP TRIGGER inhabilitar_auto ON public.inventario_facturaventa;
       public          postgres    false    227    260            �           2620    78622 %   inventario_cliente integridad_usuario    TRIGGER     �   CREATE TRIGGER integridad_usuario BEFORE INSERT OR DELETE OR UPDATE ON public.inventario_cliente FOR EACH ROW EXECUTE FUNCTION public.integridad_usuario('Cliente');
 >   DROP TRIGGER integridad_usuario ON public.inventario_cliente;
       public          postgres    false    259    223            �           2620    78623 &   inventario_vendedor integridad_usuario    TRIGGER     �   CREATE TRIGGER integridad_usuario BEFORE INSERT OR DELETE OR UPDATE ON public.inventario_vendedor FOR EACH ROW EXECUTE FUNCTION public.integridad_usuario('Vendedor');
 ?   DROP TRIGGER integridad_usuario ON public.inventario_vendedor;
       public          postgres    false    235    259            �           2620    78624 ,   servicio_tecnico_mecanico integridad_usuario    TRIGGER     �   CREATE TRIGGER integridad_usuario BEFORE INSERT OR DELETE OR UPDATE ON public.servicio_tecnico_mecanico FOR EACH ROW EXECUTE FUNCTION public.integridad_usuario('Mecanico');
 E   DROP TRIGGER integridad_usuario ON public.servicio_tecnico_mecanico;
       public          postgres    false    245    259            �           2606    78234 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    207    2899    211            �           2606    78229 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    211    209    2904            �           2606    78220 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    207    205    2894            �           2606    78249 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    2904    215    209            �           2606    78244 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    2912    215    213            �           2606    78263 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    207    217    2899            �           2606    78258 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    2912    217    213            �           2606    78282 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    2894    219    205            �           2606    78287 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    2912    213    219            �           2606    78408 F   inventario_auto inventario_auto_concesionario_id_c4ce35f9_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_auto
    ADD CONSTRAINT inventario_auto_concesionario_id_c4ce35f9_fk_inventari FOREIGN KEY (concesionario_id) REFERENCES public.inventario_servicio(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.inventario_auto DROP CONSTRAINT inventario_auto_concesionario_id_c4ce35f9_fk_inventari;
       public          postgres    false    221    231    2952            �           2606    78413 D   inventario_auto inventario_auto_modelo_auto_id_196a49ea_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_auto
    ADD CONSTRAINT inventario_auto_modelo_auto_id_196a49ea_fk_inventari FOREIGN KEY (modelo_auto_id) REFERENCES public.inventario_modeloauto(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.inventario_auto DROP CONSTRAINT inventario_auto_modelo_auto_id_196a49ea_fk_inventari;
       public          postgres    false    2963    221    237            �           2606    78403 R   inventario_cliente inventario_cliente_usuario_id_0934ab88_fk_inventario_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_cliente
    ADD CONSTRAINT inventario_cliente_usuario_id_0934ab88_fk_inventario_usuario_id FOREIGN KEY (usuario_id) REFERENCES public.inventario_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.inventario_cliente DROP CONSTRAINT inventario_cliente_usuario_id_0934ab88_fk_inventario_usuario_id;
       public          postgres    false    233    223    2957            �           2606    78424 M   inventario_facturaventa inventario_facturave_cliente_id_1fb9f4c0_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_facturaventa
    ADD CONSTRAINT inventario_facturave_cliente_id_1fb9f4c0_fk_inventari FOREIGN KEY (cliente_id) REFERENCES public.inventario_cliente(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.inventario_facturaventa DROP CONSTRAINT inventario_facturave_cliente_id_1fb9f4c0_fk_inventari;
       public          postgres    false    2940    223    227            �           2606    78458 T   inventario_facturaventadetalle inventario_facturave_factura_id_9b5d9c15_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_facturaventadetalle
    ADD CONSTRAINT inventario_facturave_factura_id_9b5d9c15_fk_inventari FOREIGN KEY (factura_id) REFERENCES public.inventario_facturaventa(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.inventario_facturaventadetalle DROP CONSTRAINT inventario_facturave_factura_id_9b5d9c15_fk_inventari;
       public          postgres    false    241    227    2947            �           2606    78398 N   inventario_facturaventa inventario_facturave_vendedor_id_53b6f329_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_facturaventa
    ADD CONSTRAINT inventario_facturave_vendedor_id_53b6f329_fk_inventari FOREIGN KEY (vendedor_id) REFERENCES public.inventario_vendedor(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.inventario_facturaventa DROP CONSTRAINT inventario_facturave_vendedor_id_53b6f329_fk_inventari;
       public          postgres    false    2959    227    235            �           2606    78419 V   inventario_facturaventa inventario_facturaventa_auto_id_87cec3a1_fk_inventario_auto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_facturaventa
    ADD CONSTRAINT inventario_facturaventa_auto_id_87cec3a1_fk_inventario_auto_id FOREIGN KEY (auto_id) REFERENCES public.inventario_auto(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.inventario_facturaventa DROP CONSTRAINT inventario_facturaventa_auto_id_87cec3a1_fk_inventario_auto_id;
       public          postgres    false    2938    227    221            �           2606    78451 ^   inventario_modeloauto_equipamientos inventario_modeloaut_equipamiento_id_7aff93a2_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos
    ADD CONSTRAINT inventario_modeloaut_equipamiento_id_7aff93a2_fk_inventari FOREIGN KEY (equipamiento_id) REFERENCES public.inventario_equipamiento(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos DROP CONSTRAINT inventario_modeloaut_equipamiento_id_7aff93a2_fk_inventari;
       public          postgres    false    2943    225    239            �           2606    78446 \   inventario_modeloauto_equipamientos inventario_modeloaut_modeloauto_id_81838bf8_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos
    ADD CONSTRAINT inventario_modeloaut_modeloauto_id_81838bf8_fk_inventari FOREIGN KEY (modeloauto_id) REFERENCES public.inventario_modeloauto(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos DROP CONSTRAINT inventario_modeloaut_modeloauto_id_81838bf8_fk_inventari;
       public          postgres    false    237    2963    239            �           2606    78438 T   inventario_modeloauto inventario_modeloauto_marca_id_8741d667_fk_inventario_marca_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_modeloauto
    ADD CONSTRAINT inventario_modeloauto_marca_id_8741d667_fk_inventario_marca_id FOREIGN KEY (marca_id) REFERENCES public.inventario_marca(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.inventario_modeloauto DROP CONSTRAINT inventario_modeloauto_marca_id_8741d667_fk_inventario_marca_id;
       public          postgres    false    2950    237    229            �           2606    78432 H   inventario_vendedor inventario_vendedor_usuario_id_d79de4c5_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_vendedor
    ADD CONSTRAINT inventario_vendedor_usuario_id_d79de4c5_fk_inventari FOREIGN KEY (usuario_id) REFERENCES public.inventario_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.inventario_vendedor DROP CONSTRAINT inventario_vendedor_usuario_id_d79de4c5_fk_inventari;
       public          postgres    false    235    233    2957            �           2606    78598 L   servicio_tecnico_citas servicio_tecnico_cit_cliente_id_e0472dc4_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_citas
    ADD CONSTRAINT servicio_tecnico_cit_cliente_id_e0472dc4_fk_inventari FOREIGN KEY (cliente_id) REFERENCES public.inventario_cliente(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.servicio_tecnico_citas DROP CONSTRAINT servicio_tecnico_cit_cliente_id_e0472dc4_fk_inventari;
       public          postgres    false    257    2940    223            �           2606    78603 M   servicio_tecnico_citas servicio_tecnico_cit_mecanico_id_a7dfdf79_fk_servicio_    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_citas
    ADD CONSTRAINT servicio_tecnico_cit_mecanico_id_a7dfdf79_fk_servicio_ FOREIGN KEY (mecanico_id) REFERENCES public.servicio_tecnico_mecanico(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.servicio_tecnico_citas DROP CONSTRAINT servicio_tecnico_cit_mecanico_id_a7dfdf79_fk_servicio_;
       public          postgres    false    257    245    2978            �           2606    78542 V   servicio_tecnico_facturaservicio servicio_tecnico_fac_cliente_id_e4eeeb95_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_facturaservicio
    ADD CONSTRAINT servicio_tecnico_fac_cliente_id_e4eeeb95_fk_inventari FOREIGN KEY (cliente_id) REFERENCES public.inventario_cliente(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_facturaservicio DROP CONSTRAINT servicio_tecnico_fac_cliente_id_e4eeeb95_fk_inventari;
       public          postgres    false    243    223    2940            �           2606    78585 ]   servicio_tecnico_facturaserviciodetalle servicio_tecnico_fac_factura_id_94d5523e_fk_servicio_    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_facturaserviciodetalle
    ADD CONSTRAINT servicio_tecnico_fac_factura_id_94d5523e_fk_servicio_ FOREIGN KEY (factura_id) REFERENCES public.servicio_tecnico_facturaservicio(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_facturaserviciodetalle DROP CONSTRAINT servicio_tecnico_fac_factura_id_94d5523e_fk_servicio_;
       public          postgres    false    243    255    2975            �           2606    78590 ^   servicio_tecnico_facturaserviciodetalle servicio_tecnico_fac_repuesto_id_68a64f84_fk_servicio_    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_facturaserviciodetalle
    ADD CONSTRAINT servicio_tecnico_fac_repuesto_id_68a64f84_fk_servicio_ FOREIGN KEY (repuesto_id) REFERENCES public.servicio_tecnico_repuestos(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_facturaserviciodetalle DROP CONSTRAINT servicio_tecnico_fac_repuesto_id_68a64f84_fk_servicio_;
       public          postgres    false    247    2982    255            �           2606    78529 _   servicio_tecnico_facturaservicio servicio_tecnico_fac_revision_tecnica_id_56df4331_fk_servicio_    FK CONSTRAINT       ALTER TABLE ONLY public.servicio_tecnico_facturaservicio
    ADD CONSTRAINT servicio_tecnico_fac_revision_tecnica_id_56df4331_fk_servicio_ FOREIGN KEY (revision_tecnica_id) REFERENCES public.servicio_tecnico_revisiontecnica(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_facturaservicio DROP CONSTRAINT servicio_tecnico_fac_revision_tecnica_id_56df4331_fk_servicio_;
       public          postgres    false    249    243    2986            �           2606    78548 N   servicio_tecnico_mecanico servicio_tecnico_mec_taller_id_74d2c269_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_mecanico
    ADD CONSTRAINT servicio_tecnico_mec_taller_id_74d2c269_fk_inventari FOREIGN KEY (taller_id) REFERENCES public.inventario_servicio(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.servicio_tecnico_mecanico DROP CONSTRAINT servicio_tecnico_mec_taller_id_74d2c269_fk_inventari;
       public          postgres    false    245    231    2952            �           2606    78553 O   servicio_tecnico_mecanico servicio_tecnico_mec_usuario_id_11b70898_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_mecanico
    ADD CONSTRAINT servicio_tecnico_mec_usuario_id_11b70898_fk_inventari FOREIGN KEY (usuario_id) REFERENCES public.inventario_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.servicio_tecnico_mecanico DROP CONSTRAINT servicio_tecnico_mec_usuario_id_11b70898_fk_inventari;
       public          postgres    false    245    233    2957            �           2606    78560 V   servicio_tecnico_revisiontecnica servicio_tecnico_rev_cliente_id_4586057b_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica
    ADD CONSTRAINT servicio_tecnico_rev_cliente_id_4586057b_fk_inventari FOREIGN KEY (cliente_id) REFERENCES public.inventario_cliente(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica DROP CONSTRAINT servicio_tecnico_rev_cliente_id_4586057b_fk_inventari;
       public          postgres    false    249    2940    223            �           2606    78565 W   servicio_tecnico_revisiontecnica servicio_tecnico_rev_mecanico_id_8b6f2647_fk_servicio_    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica
    ADD CONSTRAINT servicio_tecnico_rev_mecanico_id_8b6f2647_fk_servicio_ FOREIGN KEY (mecanico_id) REFERENCES public.servicio_tecnico_mecanico(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica DROP CONSTRAINT servicio_tecnico_rev_mecanico_id_8b6f2647_fk_servicio_;
       public          postgres    false    2978    249    245            �           2606    78578 f   servicio_tecnico_revisiontecnicadetalle servicio_tecnico_rev_revision_tecnica_id_d8c091af_fk_servicio_    FK CONSTRAINT     
  ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle
    ADD CONSTRAINT servicio_tecnico_rev_revision_tecnica_id_d8c091af_fk_servicio_ FOREIGN KEY (revision_tecnica_id) REFERENCES public.servicio_tecnico_revisiontecnica(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle DROP CONSTRAINT servicio_tecnico_rev_revision_tecnica_id_d8c091af_fk_servicio_;
       public          postgres    false    2986    253    249            �           2606    78516 W   servicio_tecnico_revisiontecnica servicio_tecnico_rev_vehiculo_id_33c02c4b_fk_servicio_    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica
    ADD CONSTRAINT servicio_tecnico_rev_vehiculo_id_33c02c4b_fk_servicio_ FOREIGN KEY (vehiculo_id) REFERENCES public.servicio_tecnico_vehiculo(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica DROP CONSTRAINT servicio_tecnico_rev_vehiculo_id_33c02c4b_fk_servicio_;
       public          postgres    false    2990    251    249            �           2606    78572 O   servicio_tecnico_vehiculo servicio_tecnico_veh_cliente_id_cd3440e6_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_vehiculo
    ADD CONSTRAINT servicio_tecnico_veh_cliente_id_cd3440e6_fk_inventari FOREIGN KEY (cliente_id) REFERENCES public.inventario_cliente(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.servicio_tecnico_vehiculo DROP CONSTRAINT servicio_tecnico_veh_cliente_id_cd3440e6_fk_inventari;
       public          postgres    false    251    223    2940            h      x������ � �      j      x������ � �      f   �  x�}�ێ�0�����T�9溯Q�B��EJB�!վ}a<�����7��x�g~6�Ss��n��)<���8��/cZH��<>������p���9��.�S�:�PAʞa�w����AO�R�S �l%�)
�f������ʏ���&��l�Y�K�'5%� �YJ@.g�`�`r�>Z���q��@!wG 7�@�{�2l+ڹ��rk���L
pj����B60
R�E���O���274�U�#�c��Z�`Y���I��v�Pa��U�p�7�ԛ
䬏֫��UU����B�e�<.r���nyC������f���Iw�0UŌ��J��d��%��9���gs_�{sYr�f��74
���7(U���� Z��?M;�Csz-�Y���'a�f�;���]�W!���. N�qvƽڅ��\ق ����1�a"@�ëk��8��c��ڢ��IYi�2I>Md-��Z5Q�y��ae2�0�������"�<#8��	�
�02��*�����A�B�Eb(�I�I�4&�A$�bg��%E��߉8��P�ذ�����S�1^
7l�X~u�^^����-W�<�K��o�-�,N��N�O�7Ɨ�@����l�J�lQ�G��Q��X�U�cr`�?���� v�=�ͣk6~���VʿKH�r�$S�)<,�XwD�����8��q��G�R>V 
�r�bQ�`��	"W	��n��9M�]N�F�q�mUk��(R�	�h��@:����0�0<�&ȉ.�ٵ�7�a�c[{�E�.��LwQ&��&2�]�9좉*޾wr��G�?��.�����:(O�ݭ�<ǷCy���$�]帼�U�";�Y)���]�I�[�q�u2�縣Q����,G�rp'i����?0��AH���Q����C�1����뇵�?�5��      l      x������ � �      n      x������ � �      p      x������ � �      r      x������ � �      d   �   x��P[n� �fS��R�Z�6Y	�.K�}���Tn�/fg�a�����`�|W#ŁSb	Э�-J�_��(�QY	�^ˏ�R;�I%Zn�'���0U#�"pi�B�kK�W��YЇV�D�K�e�[i�h+gZ����rM�Z��2����������+WyY���]e��@��7?2��v��t��=Y���^�4JY��_���W�3��{�Dw���2๊�^��Y���r��o �))��      b   �  x���ݎ� F��S�h�?�y��b�DŃ�L�� :����.�o�Y{+nZ?F;�x��� ��v����A�1>c���D\��3�'Ҙ%~��P��	ژ���㈤�"�#�!��]*4�u���Y����\��&����}0RN�6:?���t���MvY��(���)f��yG�f��$�}��#���=�0�y��̷��إ�vQ������j��b��C
`��*�=S�R��S|aGXG���ό��1�w�fK��s@D�9ƕ"���Uo񮳴A7�c<�V����j�si��=�y6݋�VT�´�`�΁fH�
�U����-#�֚�
���L�a8Shň��z��!����O�B�@,=ʌ:͘<��Ӆw�%1#+7�R�Mp��_���\5�̛k��Ѷ�k��$��|���v��FJʜ�{9�N�Ţx�      �      x������ � �      t      x������ � �      v      x������ � �      x      x������ � �      z      x������ � �      �      x������ � �      |      x������ � �      �      x������ � �      �      x������ � �      ~      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     