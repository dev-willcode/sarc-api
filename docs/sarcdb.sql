PGDMP     3    ;        
    
    x            sarcdb    12.4    12.4 �    b           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            c           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            d           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            e           1262    44025    sarcdb    DATABASE     �   CREATE DATABASE sarcdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE sarcdb;
                postgres    false            �            1255    44453    integridad_usuario()    FUNCTION     w  CREATE FUNCTION public.integridad_usuario() RETURNS trigger
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
       public          postgres    false            �            1259    44057 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    44055    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            f           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    44067    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    44065    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            g           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    44049    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    44047    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            h           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    44075 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         heap    postgres    false            �            1259    44085    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    44083    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215            i           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    44073    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            j           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212            �            1259    44093    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    44091 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217            k           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216            �            1259    44153    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false            �            1259    44151    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    219            l           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    218            �            1259    44039    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    44037    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205            m           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    44028    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    44026    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            n           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    44401    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    44186    inventario_auto    TABLE     �   CREATE TABLE public.inventario_auto (
    id integer NOT NULL,
    bastidor character varying(17) NOT NULL,
    imagen character varying(100),
    concesionario_id integer NOT NULL,
    modelo_auto_id integer NOT NULL,
    estado boolean NOT NULL
);
 #   DROP TABLE public.inventario_auto;
       public         heap    postgres    false            �            1259    44184    inventario_auto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_auto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.inventario_auto_id_seq;
       public          postgres    false    221            o           0    0    inventario_auto_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.inventario_auto_id_seq OWNED BY public.inventario_auto.id;
          public          postgres    false    220            �            1259    44196    inventario_cliente    TABLE     	  CREATE TABLE public.inventario_cliente (
    id integer NOT NULL,
    dni character varying(13) NOT NULL,
    nombre character varying(50) NOT NULL,
    domicilio character varying(50) NOT NULL,
    correo character varying(255) NOT NULL,
    usuario_id integer
);
 &   DROP TABLE public.inventario_cliente;
       public         heap    postgres    false            �            1259    44194    inventario_cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.inventario_cliente_id_seq;
       public          postgres    false    223            p           0    0    inventario_cliente_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.inventario_cliente_id_seq OWNED BY public.inventario_cliente.id;
          public          postgres    false    222            �            1259    44204    inventario_equipamiento    TABLE     �   CREATE TABLE public.inventario_equipamiento (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    precio numeric(10,2) NOT NULL
);
 +   DROP TABLE public.inventario_equipamiento;
       public         heap    postgres    false            �            1259    44202    inventario_equipamiento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_equipamiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.inventario_equipamiento_id_seq;
       public          postgres    false    225            q           0    0    inventario_equipamiento_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.inventario_equipamiento_id_seq OWNED BY public.inventario_equipamiento.id;
          public          postgres    false    224            �            1259    44257    inventario_facturaventa    TABLE     G  CREATE TABLE public.inventario_facturaventa (
    id integer NOT NULL,
    numero_factura character varying(17),
    fecha_emision date NOT NULL,
    precio numeric(10,2) NOT NULL,
    forma_pago character varying(50) NOT NULL,
    auto_id integer NOT NULL,
    cliente_id integer NOT NULL,
    vendedor_id integer NOT NULL
);
 +   DROP TABLE public.inventario_facturaventa;
       public         heap    postgres    false            �            1259    44255    inventario_facturaventa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_facturaventa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.inventario_facturaventa_id_seq;
       public          postgres    false    237            r           0    0    inventario_facturaventa_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.inventario_facturaventa_id_seq OWNED BY public.inventario_facturaventa.id;
          public          postgres    false    236            �            1259    44212    inventario_marca    TABLE     r   CREATE TABLE public.inventario_marca (
    id integer NOT NULL,
    descripcion character varying(50) NOT NULL
);
 $   DROP TABLE public.inventario_marca;
       public         heap    postgres    false            �            1259    44210    inventario_marca_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_marca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.inventario_marca_id_seq;
       public          postgres    false    227            s           0    0    inventario_marca_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.inventario_marca_id_seq OWNED BY public.inventario_marca.id;
          public          postgres    false    226            �            1259    44249    inventario_modeloauto    TABLE       CREATE TABLE public.inventario_modeloauto (
    id integer NOT NULL,
    nombre_modelo character varying(50) NOT NULL,
    potencia numeric(10,2) NOT NULL,
    cilindraje integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    marca_id integer NOT NULL
);
 )   DROP TABLE public.inventario_modeloauto;
       public         heap    postgres    false            �            1259    44431 #   inventario_modeloauto_equipamientos    TABLE     �   CREATE TABLE public.inventario_modeloauto_equipamientos (
    id integer NOT NULL,
    modeloauto_id integer NOT NULL,
    equipamiento_id integer NOT NULL
);
 7   DROP TABLE public.inventario_modeloauto_equipamientos;
       public         heap    postgres    false            �            1259    44429 *   inventario_modeloauto_equipamientos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_modeloauto_equipamientos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.inventario_modeloauto_equipamientos_id_seq;
       public          postgres    false    250            t           0    0 *   inventario_modeloauto_equipamientos_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.inventario_modeloauto_equipamientos_id_seq OWNED BY public.inventario_modeloauto_equipamientos.id;
          public          postgres    false    249            �            1259    44247    inventario_modeloauto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_modeloauto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.inventario_modeloauto_id_seq;
       public          postgres    false    235            u           0    0    inventario_modeloauto_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.inventario_modeloauto_id_seq OWNED BY public.inventario_modeloauto.id;
          public          postgres    false    234            �            1259    44220    inventario_servicio    TABLE     �   CREATE TABLE public.inventario_servicio (
    id integer NOT NULL,
    dni character varying(13) NOT NULL,
    nombre character varying(50) NOT NULL,
    domicilio character varying(50) NOT NULL,
    tipo character varying(50) NOT NULL
);
 '   DROP TABLE public.inventario_servicio;
       public         heap    postgres    false            �            1259    44218    inventario_servicio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.inventario_servicio_id_seq;
       public          postgres    false    229            v           0    0    inventario_servicio_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.inventario_servicio_id_seq OWNED BY public.inventario_servicio.id;
          public          postgres    false    228            �            1259    44228    inventario_usuario    TABLE     �   CREATE TABLE public.inventario_usuario (
    id integer NOT NULL,
    correo character varying(255) NOT NULL,
    contrasena character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL
);
 &   DROP TABLE public.inventario_usuario;
       public         heap    postgres    false            �            1259    44226    inventario_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.inventario_usuario_id_seq;
       public          postgres    false    231            w           0    0    inventario_usuario_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.inventario_usuario_id_seq OWNED BY public.inventario_usuario.id;
          public          postgres    false    230            �            1259    44241    inventario_vendedor    TABLE     
  CREATE TABLE public.inventario_vendedor (
    id integer NOT NULL,
    dni character varying(13) NOT NULL,
    nombre character varying(50) NOT NULL,
    domicilio character varying(50) NOT NULL,
    correo character varying(255) NOT NULL,
    usuario_id integer
);
 '   DROP TABLE public.inventario_vendedor;
       public         heap    postgres    false            �            1259    44239    inventario_vendedor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_vendedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.inventario_vendedor_id_seq;
       public          postgres    false    233            x           0    0    inventario_vendedor_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.inventario_vendedor_id_seq OWNED BY public.inventario_vendedor.id;
          public          postgres    false    232            �            1259    44352     servicio_tecnico_facturaservicio    TABLE     �   CREATE TABLE public.servicio_tecnico_facturaservicio (
    id integer NOT NULL,
    numero_factura character varying(17) NOT NULL,
    fecha_emision date NOT NULL,
    total numeric(10,2) NOT NULL,
    revision_tecnica_id integer NOT NULL
);
 4   DROP TABLE public.servicio_tecnico_facturaservicio;
       public         heap    postgres    false            �            1259    44350 '   servicio_tecnico_facturaservicio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_facturaservicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.servicio_tecnico_facturaservicio_id_seq;
       public          postgres    false    247            y           0    0 '   servicio_tecnico_facturaservicio_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.servicio_tecnico_facturaservicio_id_seq OWNED BY public.servicio_tecnico_facturaservicio.id;
          public          postgres    false    246            �            1259    44315    servicio_tecnico_mecanico    TABLE     0  CREATE TABLE public.servicio_tecnico_mecanico (
    id integer NOT NULL,
    dni character varying(13) NOT NULL,
    nombre character varying(50) NOT NULL,
    domicilio character varying(50) NOT NULL,
    correo character varying(255) NOT NULL,
    taller_id integer NOT NULL,
    usuario_id integer
);
 -   DROP TABLE public.servicio_tecnico_mecanico;
       public         heap    postgres    false            �            1259    44313     servicio_tecnico_mecanico_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_mecanico_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.servicio_tecnico_mecanico_id_seq;
       public          postgres    false    239            z           0    0     servicio_tecnico_mecanico_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.servicio_tecnico_mecanico_id_seq OWNED BY public.servicio_tecnico_mecanico.id;
          public          postgres    false    238            �            1259    44323     servicio_tecnico_revisiontecnica    TABLE       CREATE TABLE public.servicio_tecnico_revisiontecnica (
    id integer NOT NULL,
    kilometraje_actual numeric(10,2) NOT NULL,
    fecha_revision date NOT NULL,
    fecha_proxima_revision date NOT NULL,
    mecanico_id integer NOT NULL,
    vehiculo_id integer NOT NULL
);
 4   DROP TABLE public.servicio_tecnico_revisiontecnica;
       public         heap    postgres    false            �            1259    44321 '   servicio_tecnico_revisiontecnica_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_revisiontecnica_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.servicio_tecnico_revisiontecnica_id_seq;
       public          postgres    false    241            {           0    0 '   servicio_tecnico_revisiontecnica_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.servicio_tecnico_revisiontecnica_id_seq OWNED BY public.servicio_tecnico_revisiontecnica.id;
          public          postgres    false    240            �            1259    44339 '   servicio_tecnico_revisiontecnicadetalle    TABLE     �   CREATE TABLE public.servicio_tecnico_revisiontecnicadetalle (
    id integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    descripcion character varying(50) NOT NULL,
    repuesto_id integer NOT NULL,
    revision_tecnica_id integer NOT NULL
);
 ;   DROP TABLE public.servicio_tecnico_revisiontecnicadetalle;
       public         heap    postgres    false            �            1259    44337 .   servicio_tecnico_revisiontecnicadetalle_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_revisiontecnicadetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.servicio_tecnico_revisiontecnicadetalle_id_seq;
       public          postgres    false    245            |           0    0 .   servicio_tecnico_revisiontecnicadetalle_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.servicio_tecnico_revisiontecnicadetalle_id_seq OWNED BY public.servicio_tecnico_revisiontecnicadetalle.id;
          public          postgres    false    244            �            1259    44331    servicio_tecnico_vehiculo    TABLE     �   CREATE TABLE public.servicio_tecnico_vehiculo (
    id integer NOT NULL,
    chasis character varying(50) NOT NULL,
    matricula character varying(50) NOT NULL,
    cliente_id integer NOT NULL
);
 -   DROP TABLE public.servicio_tecnico_vehiculo;
       public         heap    postgres    false            �            1259    44329     servicio_tecnico_vehiculo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_tecnico_vehiculo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.servicio_tecnico_vehiculo_id_seq;
       public          postgres    false    243            }           0    0     servicio_tecnico_vehiculo_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.servicio_tecnico_vehiculo_id_seq OWNED BY public.servicio_tecnico_vehiculo.id;
          public          postgres    false    242                       2604    44060    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209                       2604    44070    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211                       2604    44052    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207                       2604    44078    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213                       2604    44088    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                       2604    44096    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                       2604    44156    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219                       2604    44042    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205                       2604    44031    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203                       2604    44189    inventario_auto id    DEFAULT     x   ALTER TABLE ONLY public.inventario_auto ALTER COLUMN id SET DEFAULT nextval('public.inventario_auto_id_seq'::regclass);
 A   ALTER TABLE public.inventario_auto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221                       2604    44199    inventario_cliente id    DEFAULT     ~   ALTER TABLE ONLY public.inventario_cliente ALTER COLUMN id SET DEFAULT nextval('public.inventario_cliente_id_seq'::regclass);
 D   ALTER TABLE public.inventario_cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223                       2604    44207    inventario_equipamiento id    DEFAULT     �   ALTER TABLE ONLY public.inventario_equipamiento ALTER COLUMN id SET DEFAULT nextval('public.inventario_equipamiento_id_seq'::regclass);
 I   ALTER TABLE public.inventario_equipamiento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            %           2604    44260    inventario_facturaventa id    DEFAULT     �   ALTER TABLE ONLY public.inventario_facturaventa ALTER COLUMN id SET DEFAULT nextval('public.inventario_facturaventa_id_seq'::regclass);
 I   ALTER TABLE public.inventario_facturaventa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237                        2604    44215    inventario_marca id    DEFAULT     z   ALTER TABLE ONLY public.inventario_marca ALTER COLUMN id SET DEFAULT nextval('public.inventario_marca_id_seq'::regclass);
 B   ALTER TABLE public.inventario_marca ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            $           2604    44252    inventario_modeloauto id    DEFAULT     �   ALTER TABLE ONLY public.inventario_modeloauto ALTER COLUMN id SET DEFAULT nextval('public.inventario_modeloauto_id_seq'::regclass);
 G   ALTER TABLE public.inventario_modeloauto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234    235            +           2604    44434 &   inventario_modeloauto_equipamientos id    DEFAULT     �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos ALTER COLUMN id SET DEFAULT nextval('public.inventario_modeloauto_equipamientos_id_seq'::regclass);
 U   ALTER TABLE public.inventario_modeloauto_equipamientos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            !           2604    44223    inventario_servicio id    DEFAULT     �   ALTER TABLE ONLY public.inventario_servicio ALTER COLUMN id SET DEFAULT nextval('public.inventario_servicio_id_seq'::regclass);
 E   ALTER TABLE public.inventario_servicio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            "           2604    44231    inventario_usuario id    DEFAULT     ~   ALTER TABLE ONLY public.inventario_usuario ALTER COLUMN id SET DEFAULT nextval('public.inventario_usuario_id_seq'::regclass);
 D   ALTER TABLE public.inventario_usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            #           2604    44244    inventario_vendedor id    DEFAULT     �   ALTER TABLE ONLY public.inventario_vendedor ALTER COLUMN id SET DEFAULT nextval('public.inventario_vendedor_id_seq'::regclass);
 E   ALTER TABLE public.inventario_vendedor ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            *           2604    44355 #   servicio_tecnico_facturaservicio id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_facturaservicio ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_facturaservicio_id_seq'::regclass);
 R   ALTER TABLE public.servicio_tecnico_facturaservicio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247            &           2604    44318    servicio_tecnico_mecanico id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_mecanico ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_mecanico_id_seq'::regclass);
 K   ALTER TABLE public.servicio_tecnico_mecanico ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            '           2604    44326 #   servicio_tecnico_revisiontecnica id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_revisiontecnica_id_seq'::regclass);
 R   ALTER TABLE public.servicio_tecnico_revisiontecnica ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            )           2604    44342 *   servicio_tecnico_revisiontecnicadetalle id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_revisiontecnicadetalle_id_seq'::regclass);
 Y   ALTER TABLE public.servicio_tecnico_revisiontecnicadetalle ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244    245            (           2604    44334    servicio_tecnico_vehiculo id    DEFAULT     �   ALTER TABLE ONLY public.servicio_tecnico_vehiculo ALTER COLUMN id SET DEFAULT nextval('public.servicio_tecnico_vehiculo_id_seq'::regclass);
 K   ALTER TABLE public.servicio_tecnico_vehiculo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243            6          0    44057 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   �`      8          0    44067    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   �`      4          0    44049    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   �`      :          0    44075 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   �c      <          0    44085    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   d      >          0    44093    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   "d      @          0    44153    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219   ?d      2          0    44039    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   \d      0          0    44028    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   Ge      ]          0    44401    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    248   �g      B          0    44186    inventario_auto 
   TABLE DATA           i   COPY public.inventario_auto (id, bastidor, imagen, concesionario_id, modelo_auto_id, estado) FROM stdin;
    public          postgres    false    221   �g      D          0    44196    inventario_cliente 
   TABLE DATA           \   COPY public.inventario_cliente (id, dni, nombre, domicilio, correo, usuario_id) FROM stdin;
    public          postgres    false    223   h      F          0    44204    inventario_equipamiento 
   TABLE DATA           E   COPY public.inventario_equipamiento (id, nombre, precio) FROM stdin;
    public          postgres    false    225   Kh      R          0    44257    inventario_facturaventa 
   TABLE DATA           �   COPY public.inventario_facturaventa (id, numero_factura, fecha_emision, precio, forma_pago, auto_id, cliente_id, vendedor_id) FROM stdin;
    public          postgres    false    237   �h      H          0    44212    inventario_marca 
   TABLE DATA           ;   COPY public.inventario_marca (id, descripcion) FROM stdin;
    public          postgres    false    227   �h      P          0    44249    inventario_modeloauto 
   TABLE DATA           j   COPY public.inventario_modeloauto (id, nombre_modelo, potencia, cilindraje, precio, marca_id) FROM stdin;
    public          postgres    false    235   �h      _          0    44431 #   inventario_modeloauto_equipamientos 
   TABLE DATA           a   COPY public.inventario_modeloauto_equipamientos (id, modeloauto_id, equipamiento_id) FROM stdin;
    public          postgres    false    250   i      J          0    44220    inventario_servicio 
   TABLE DATA           O   COPY public.inventario_servicio (id, dni, nombre, domicilio, tipo) FROM stdin;
    public          postgres    false    229   (i      L          0    44228    inventario_usuario 
   TABLE DATA           J   COPY public.inventario_usuario (id, correo, contrasena, tipo) FROM stdin;
    public          postgres    false    231   ni      N          0    44241    inventario_vendedor 
   TABLE DATA           ]   COPY public.inventario_vendedor (id, dni, nombre, domicilio, correo, usuario_id) FROM stdin;
    public          postgres    false    233   �i      \          0    44352     servicio_tecnico_facturaservicio 
   TABLE DATA           y   COPY public.servicio_tecnico_facturaservicio (id, numero_factura, fecha_emision, total, revision_tecnica_id) FROM stdin;
    public          postgres    false    247   	j      T          0    44315    servicio_tecnico_mecanico 
   TABLE DATA           n   COPY public.servicio_tecnico_mecanico (id, dni, nombre, domicilio, correo, taller_id, usuario_id) FROM stdin;
    public          postgres    false    239   &j      V          0    44323     servicio_tecnico_revisiontecnica 
   TABLE DATA           �   COPY public.servicio_tecnico_revisiontecnica (id, kilometraje_actual, fecha_revision, fecha_proxima_revision, mecanico_id, vehiculo_id) FROM stdin;
    public          postgres    false    241   `j      Z          0    44339 '   servicio_tecnico_revisiontecnicadetalle 
   TABLE DATA           |   COPY public.servicio_tecnico_revisiontecnicadetalle (id, precio, descripcion, repuesto_id, revision_tecnica_id) FROM stdin;
    public          postgres    false    245   }j      X          0    44331    servicio_tecnico_vehiculo 
   TABLE DATA           V   COPY public.servicio_tecnico_vehiculo (id, chasis, matricula, cliente_id) FROM stdin;
    public          postgres    false    243   �j      ~           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    208                       0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);
          public          postgres    false    206            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    214            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);
          public          postgres    false    212            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    218            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);
          public          postgres    false    204            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);
          public          postgres    false    202            �           0    0    inventario_auto_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.inventario_auto_id_seq', 2, true);
          public          postgres    false    220            �           0    0    inventario_cliente_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.inventario_cliente_id_seq', 29, true);
          public          postgres    false    222            �           0    0    inventario_equipamiento_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.inventario_equipamiento_id_seq', 4, true);
          public          postgres    false    224            �           0    0    inventario_facturaventa_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.inventario_facturaventa_id_seq', 1, false);
          public          postgres    false    236            �           0    0    inventario_marca_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.inventario_marca_id_seq', 2, true);
          public          postgres    false    226            �           0    0 *   inventario_modeloauto_equipamientos_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.inventario_modeloauto_equipamientos_id_seq', 3, true);
          public          postgres    false    249            �           0    0    inventario_modeloauto_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.inventario_modeloauto_id_seq', 2, true);
          public          postgres    false    234            �           0    0    inventario_servicio_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.inventario_servicio_id_seq', 1, true);
          public          postgres    false    228            �           0    0    inventario_usuario_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.inventario_usuario_id_seq', 35, true);
          public          postgres    false    230            �           0    0    inventario_vendedor_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.inventario_vendedor_id_seq', 4, true);
          public          postgres    false    232            �           0    0 '   servicio_tecnico_facturaservicio_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.servicio_tecnico_facturaservicio_id_seq', 1, false);
          public          postgres    false    246            �           0    0     servicio_tecnico_mecanico_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.servicio_tecnico_mecanico_id_seq', 2, true);
          public          postgres    false    238            �           0    0 '   servicio_tecnico_revisiontecnica_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.servicio_tecnico_revisiontecnica_id_seq', 1, false);
          public          postgres    false    240            �           0    0 .   servicio_tecnico_revisiontecnicadetalle_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.servicio_tecnico_revisiontecnicadetalle_id_seq', 1, false);
          public          postgres    false    244            �           0    0     servicio_tecnico_vehiculo_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.servicio_tecnico_vehiculo_id_seq', 1, false);
          public          postgres    false    242            9           2606    44182    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            >           2606    44109 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            A           2606    44072 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            ;           2606    44062    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            4           2606    44100 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            6           2606    44054 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            I           2606    44090 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215            L           2606    44124 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215            C           2606    44080    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213            O           2606    44098 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217            R           2606    44138 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            F           2606    44176     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213            U           2606    44162 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    219            /           2606    44046 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            1           2606    44044 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            -           2606    44036 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            �           2606    44408 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    248            Y           2606    44193 ,   inventario_auto inventario_auto_bastidor_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.inventario_auto
    ADD CONSTRAINT inventario_auto_bastidor_key UNIQUE (bastidor);
 V   ALTER TABLE ONLY public.inventario_auto DROP CONSTRAINT inventario_auto_bastidor_key;
       public            postgres    false    221            ]           2606    44191 $   inventario_auto inventario_auto_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.inventario_auto
    ADD CONSTRAINT inventario_auto_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.inventario_auto DROP CONSTRAINT inventario_auto_pkey;
       public            postgres    false    221            _           2606    44201 *   inventario_cliente inventario_cliente_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.inventario_cliente
    ADD CONSTRAINT inventario_cliente_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.inventario_cliente DROP CONSTRAINT inventario_cliente_pkey;
       public            postgres    false    223            b           2606    44209 4   inventario_equipamiento inventario_equipamiento_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.inventario_equipamiento
    ADD CONSTRAINT inventario_equipamiento_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.inventario_equipamiento DROP CONSTRAINT inventario_equipamiento_pkey;
       public            postgres    false    225            u           2606    44262 4   inventario_facturaventa inventario_facturaventa_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.inventario_facturaventa
    ADD CONSTRAINT inventario_facturaventa_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.inventario_facturaventa DROP CONSTRAINT inventario_facturaventa_pkey;
       public            postgres    false    237            d           2606    44217 &   inventario_marca inventario_marca_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.inventario_marca
    ADD CONSTRAINT inventario_marca_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.inventario_marca DROP CONSTRAINT inventario_marca_pkey;
       public            postgres    false    227            �           2606    44438 c   inventario_modeloauto_equipamientos inventario_modeloauto_eq_modeloauto_id_equipamien_aa6ff43c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos
    ADD CONSTRAINT inventario_modeloauto_eq_modeloauto_id_equipamien_aa6ff43c_uniq UNIQUE (modeloauto_id, equipamiento_id);
 �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos DROP CONSTRAINT inventario_modeloauto_eq_modeloauto_id_equipamien_aa6ff43c_uniq;
       public            postgres    false    250    250            �           2606    44436 L   inventario_modeloauto_equipamientos inventario_modeloauto_equipamientos_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos
    ADD CONSTRAINT inventario_modeloauto_equipamientos_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos DROP CONSTRAINT inventario_modeloauto_equipamientos_pkey;
       public            postgres    false    250            q           2606    44254 0   inventario_modeloauto inventario_modeloauto_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.inventario_modeloauto
    ADD CONSTRAINT inventario_modeloauto_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.inventario_modeloauto DROP CONSTRAINT inventario_modeloauto_pkey;
       public            postgres    false    235            f           2606    44225 ,   inventario_servicio inventario_servicio_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.inventario_servicio
    ADD CONSTRAINT inventario_servicio_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.inventario_servicio DROP CONSTRAINT inventario_servicio_pkey;
       public            postgres    false    229            h           2606    44236 *   inventario_usuario inventario_usuario_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.inventario_usuario
    ADD CONSTRAINT inventario_usuario_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.inventario_usuario DROP CONSTRAINT inventario_usuario_pkey;
       public            postgres    false    231            k           2606    44238 1   inventario_usuario inventario_usuario_usuario_key 
   CONSTRAINT     n   ALTER TABLE ONLY public.inventario_usuario
    ADD CONSTRAINT inventario_usuario_usuario_key UNIQUE (correo);
 [   ALTER TABLE ONLY public.inventario_usuario DROP CONSTRAINT inventario_usuario_usuario_key;
       public            postgres    false    231            m           2606    44246 ,   inventario_vendedor inventario_vendedor_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.inventario_vendedor
    ADD CONSTRAINT inventario_vendedor_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.inventario_vendedor DROP CONSTRAINT inventario_vendedor_pkey;
       public            postgres    false    233            �           2606    44357 F   servicio_tecnico_facturaservicio servicio_tecnico_facturaservicio_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_facturaservicio
    ADD CONSTRAINT servicio_tecnico_facturaservicio_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.servicio_tecnico_facturaservicio DROP CONSTRAINT servicio_tecnico_facturaservicio_pkey;
       public            postgres    false    247            x           2606    44320 8   servicio_tecnico_mecanico servicio_tecnico_mecanico_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.servicio_tecnico_mecanico
    ADD CONSTRAINT servicio_tecnico_mecanico_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.servicio_tecnico_mecanico DROP CONSTRAINT servicio_tecnico_mecanico_pkey;
       public            postgres    false    239            }           2606    44328 F   servicio_tecnico_revisiontecnica servicio_tecnico_revisiontecnica_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica
    ADD CONSTRAINT servicio_tecnico_revisiontecnica_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica DROP CONSTRAINT servicio_tecnico_revisiontecnica_pkey;
       public            postgres    false    241            �           2606    44344 T   servicio_tecnico_revisiontecnicadetalle servicio_tecnico_revisiontecnicadetalle_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle
    ADD CONSTRAINT servicio_tecnico_revisiontecnicadetalle_pkey PRIMARY KEY (id);
 ~   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle DROP CONSTRAINT servicio_tecnico_revisiontecnicadetalle_pkey;
       public            postgres    false    245            �           2606    44336 8   servicio_tecnico_vehiculo servicio_tecnico_vehiculo_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.servicio_tecnico_vehiculo
    ADD CONSTRAINT servicio_tecnico_vehiculo_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.servicio_tecnico_vehiculo DROP CONSTRAINT servicio_tecnico_vehiculo_pkey;
       public            postgres    false    243            7           1259    44183    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            <           1259    44120 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            ?           1259    44121 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            2           1259    44106 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            G           1259    44136 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215            J           1259    44135 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215            M           1259    44150 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217            P           1259    44149 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217            D           1259    44177     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213            S           1259    44173 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219            V           1259    44174 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219            �           1259    44410 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    248            �           1259    44409 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    248            W           1259    44278 &   inventario_auto_bastidor_eea1ee1a_like    INDEX     z   CREATE INDEX inventario_auto_bastidor_eea1ee1a_like ON public.inventario_auto USING btree (bastidor varchar_pattern_ops);
 :   DROP INDEX public.inventario_auto_bastidor_eea1ee1a_like;
       public            postgres    false    221            Z           1259    44311 )   inventario_auto_concesionario_id_c4ce35f9    INDEX     q   CREATE INDEX inventario_auto_concesionario_id_c4ce35f9 ON public.inventario_auto USING btree (concesionario_id);
 =   DROP INDEX public.inventario_auto_concesionario_id_c4ce35f9;
       public            postgres    false    221            [           1259    44312 '   inventario_auto_modelo_auto_id_196a49ea    INDEX     m   CREATE INDEX inventario_auto_modelo_auto_id_196a49ea ON public.inventario_auto USING btree (modelo_auto_id);
 ;   DROP INDEX public.inventario_auto_modelo_auto_id_196a49ea;
       public            postgres    false    221            `           1259    44310 &   inventario_cliente_usuario_id_0934ab88    INDEX     k   CREATE INDEX inventario_cliente_usuario_id_0934ab88 ON public.inventario_cliente USING btree (usuario_id);
 :   DROP INDEX public.inventario_cliente_usuario_id_0934ab88;
       public            postgres    false    223            r           1259    44307 (   inventario_facturaventa_auto_id_87cec3a1    INDEX     o   CREATE INDEX inventario_facturaventa_auto_id_87cec3a1 ON public.inventario_facturaventa USING btree (auto_id);
 <   DROP INDEX public.inventario_facturaventa_auto_id_87cec3a1;
       public            postgres    false    237            s           1259    44308 +   inventario_facturaventa_cliente_id_1fb9f4c0    INDEX     u   CREATE INDEX inventario_facturaventa_cliente_id_1fb9f4c0 ON public.inventario_facturaventa USING btree (cliente_id);
 ?   DROP INDEX public.inventario_facturaventa_cliente_id_1fb9f4c0;
       public            postgres    false    237            v           1259    44309 ,   inventario_facturaventa_vendedor_id_53b6f329    INDEX     w   CREATE INDEX inventario_facturaventa_vendedor_id_53b6f329 ON public.inventario_facturaventa USING btree (vendedor_id);
 @   DROP INDEX public.inventario_facturaventa_vendedor_id_53b6f329;
       public            postgres    false    237            �           1259    44450 <   inventario_modeloauto_equipamientos_equipamiento_id_7aff93a2    INDEX     �   CREATE INDEX inventario_modeloauto_equipamientos_equipamiento_id_7aff93a2 ON public.inventario_modeloauto_equipamientos USING btree (equipamiento_id);
 P   DROP INDEX public.inventario_modeloauto_equipamientos_equipamiento_id_7aff93a2;
       public            postgres    false    250            �           1259    44449 :   inventario_modeloauto_equipamientos_modeloauto_id_81838bf8    INDEX     �   CREATE INDEX inventario_modeloauto_equipamientos_modeloauto_id_81838bf8 ON public.inventario_modeloauto_equipamientos USING btree (modeloauto_id);
 N   DROP INDEX public.inventario_modeloauto_equipamientos_modeloauto_id_81838bf8;
       public            postgres    false    250            o           1259    44291 '   inventario_modeloauto_marca_id_8741d667    INDEX     m   CREATE INDEX inventario_modeloauto_marca_id_8741d667 ON public.inventario_modeloauto USING btree (marca_id);
 ;   DROP INDEX public.inventario_modeloauto_marca_id_8741d667;
       public            postgres    false    235            i           1259    44279 (   inventario_usuario_usuario_88d00a92_like    INDEX     }   CREATE INDEX inventario_usuario_usuario_88d00a92_like ON public.inventario_usuario USING btree (correo varchar_pattern_ops);
 <   DROP INDEX public.inventario_usuario_usuario_88d00a92_like;
       public            postgres    false    231            n           1259    44285 '   inventario_vendedor_usuario_id_d79de4c5    INDEX     m   CREATE INDEX inventario_vendedor_usuario_id_d79de4c5 ON public.inventario_vendedor USING btree (usuario_id);
 ;   DROP INDEX public.inventario_vendedor_usuario_id_d79de4c5;
       public            postgres    false    233            �           1259    44400 =   servicio_tecnico_facturaservicio_revision_tecnica_id_56df4331    INDEX     �   CREATE INDEX servicio_tecnico_facturaservicio_revision_tecnica_id_56df4331 ON public.servicio_tecnico_facturaservicio USING btree (revision_tecnica_id);
 Q   DROP INDEX public.servicio_tecnico_facturaservicio_revision_tecnica_id_56df4331;
       public            postgres    false    247            y           1259    44368 ,   servicio_tecnico_mecanico_taller_id_74d2c269    INDEX     w   CREATE INDEX servicio_tecnico_mecanico_taller_id_74d2c269 ON public.servicio_tecnico_mecanico USING btree (taller_id);
 @   DROP INDEX public.servicio_tecnico_mecanico_taller_id_74d2c269;
       public            postgres    false    239            z           1259    44369 -   servicio_tecnico_mecanico_usuario_id_11b70898    INDEX     y   CREATE INDEX servicio_tecnico_mecanico_usuario_id_11b70898 ON public.servicio_tecnico_mecanico USING btree (usuario_id);
 A   DROP INDEX public.servicio_tecnico_mecanico_usuario_id_11b70898;
       public            postgres    false    239            �           1259    44393 7   servicio_tecnico_revisiont_revision_tecnica_id_d8c091af    INDEX     �   CREATE INDEX servicio_tecnico_revisiont_revision_tecnica_id_d8c091af ON public.servicio_tecnico_revisiontecnicadetalle USING btree (revision_tecnica_id);
 K   DROP INDEX public.servicio_tecnico_revisiont_revision_tecnica_id_d8c091af;
       public            postgres    false    245            {           1259    44375 5   servicio_tecnico_revisiontecnica_mecanico_id_8b6f2647    INDEX     �   CREATE INDEX servicio_tecnico_revisiontecnica_mecanico_id_8b6f2647 ON public.servicio_tecnico_revisiontecnica USING btree (mecanico_id);
 I   DROP INDEX public.servicio_tecnico_revisiontecnica_mecanico_id_8b6f2647;
       public            postgres    false    241            ~           1259    44394 5   servicio_tecnico_revisiontecnica_vehiculo_id_33c02c4b    INDEX     �   CREATE INDEX servicio_tecnico_revisiontecnica_vehiculo_id_33c02c4b ON public.servicio_tecnico_revisiontecnica USING btree (vehiculo_id);
 I   DROP INDEX public.servicio_tecnico_revisiontecnica_vehiculo_id_33c02c4b;
       public            postgres    false    241            �           1259    44392 <   servicio_tecnico_revisiontecnicadetalle_repuesto_id_a397ebd4    INDEX     �   CREATE INDEX servicio_tecnico_revisiontecnicadetalle_repuesto_id_a397ebd4 ON public.servicio_tecnico_revisiontecnicadetalle USING btree (repuesto_id);
 P   DROP INDEX public.servicio_tecnico_revisiontecnicadetalle_repuesto_id_a397ebd4;
       public            postgres    false    245                       1259    44381 -   servicio_tecnico_vehiculo_cliente_id_cd3440e6    INDEX     y   CREATE INDEX servicio_tecnico_vehiculo_cliente_id_cd3440e6 ON public.servicio_tecnico_vehiculo USING btree (cliente_id);
 A   DROP INDEX public.servicio_tecnico_vehiculo_cliente_id_cd3440e6;
       public            postgres    false    243            �           2620    44473 %   inventario_cliente integridad_usuario    TRIGGER     �   CREATE TRIGGER integridad_usuario BEFORE INSERT OR DELETE OR UPDATE ON public.inventario_cliente FOR EACH ROW EXECUTE FUNCTION public.integridad_usuario('Cliente');
 >   DROP TRIGGER integridad_usuario ON public.inventario_cliente;
       public          postgres    false    223    251            �           2620    44474 &   inventario_vendedor integridad_usuario    TRIGGER     �   CREATE TRIGGER integridad_usuario BEFORE INSERT OR DELETE OR UPDATE ON public.inventario_vendedor FOR EACH ROW EXECUTE FUNCTION public.integridad_usuario('Vendedor');
 ?   DROP TRIGGER integridad_usuario ON public.inventario_vendedor;
       public          postgres    false    251    233            �           2620    44475 ,   servicio_tecnico_mecanico integridad_usuario    TRIGGER     �   CREATE TRIGGER integridad_usuario BEFORE INSERT OR DELETE OR UPDATE ON public.servicio_tecnico_mecanico FOR EACH ROW EXECUTE FUNCTION public.integridad_usuario('Mecanico');
 E   DROP TRIGGER integridad_usuario ON public.servicio_tecnico_mecanico;
       public          postgres    false    239    251            �           2606    44115 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    211    2870    207            �           2606    44110 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    211    2875    209            �           2606    44101 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    2865    207    205            �           2606    44130 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    215    209    2875            �           2606    44125 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    215    213    2883            �           2606    44144 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    207    2870    217            �           2606    44139 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    213    2883    217            �           2606    44163 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    219    2865    205            �           2606    44168 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    219    2883    213            �           2606    44268 F   inventario_auto inventario_auto_concesionario_id_c4ce35f9_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_auto
    ADD CONSTRAINT inventario_auto_concesionario_id_c4ce35f9_fk_inventari FOREIGN KEY (concesionario_id) REFERENCES public.inventario_servicio(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.inventario_auto DROP CONSTRAINT inventario_auto_concesionario_id_c4ce35f9_fk_inventari;
       public          postgres    false    221    2918    229            �           2606    44273 D   inventario_auto inventario_auto_modelo_auto_id_196a49ea_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_auto
    ADD CONSTRAINT inventario_auto_modelo_auto_id_196a49ea_fk_inventari FOREIGN KEY (modelo_auto_id) REFERENCES public.inventario_modeloauto(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.inventario_auto DROP CONSTRAINT inventario_auto_modelo_auto_id_196a49ea_fk_inventari;
       public          postgres    false    221    235    2929            �           2606    44458 R   inventario_cliente inventario_cliente_usuario_id_0934ab88_fk_inventario_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_cliente
    ADD CONSTRAINT inventario_cliente_usuario_id_0934ab88_fk_inventario_usuario_id FOREIGN KEY (usuario_id) REFERENCES public.inventario_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.inventario_cliente DROP CONSTRAINT inventario_cliente_usuario_id_0934ab88_fk_inventario_usuario_id;
       public          postgres    false    223    2920    231            �           2606    44297 M   inventario_facturaventa inventario_facturave_cliente_id_1fb9f4c0_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_facturaventa
    ADD CONSTRAINT inventario_facturave_cliente_id_1fb9f4c0_fk_inventari FOREIGN KEY (cliente_id) REFERENCES public.inventario_cliente(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.inventario_facturaventa DROP CONSTRAINT inventario_facturave_cliente_id_1fb9f4c0_fk_inventari;
       public          postgres    false    223    2911    237            �           2606    44302 N   inventario_facturaventa inventario_facturave_vendedor_id_53b6f329_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_facturaventa
    ADD CONSTRAINT inventario_facturave_vendedor_id_53b6f329_fk_inventari FOREIGN KEY (vendedor_id) REFERENCES public.inventario_vendedor(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.inventario_facturaventa DROP CONSTRAINT inventario_facturave_vendedor_id_53b6f329_fk_inventari;
       public          postgres    false    2925    237    233            �           2606    44292 V   inventario_facturaventa inventario_facturaventa_auto_id_87cec3a1_fk_inventario_auto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_facturaventa
    ADD CONSTRAINT inventario_facturaventa_auto_id_87cec3a1_fk_inventario_auto_id FOREIGN KEY (auto_id) REFERENCES public.inventario_auto(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.inventario_facturaventa DROP CONSTRAINT inventario_facturaventa_auto_id_87cec3a1_fk_inventario_auto_id;
       public          postgres    false    237    2909    221            �           2606    44444 ^   inventario_modeloauto_equipamientos inventario_modeloaut_equipamiento_id_7aff93a2_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos
    ADD CONSTRAINT inventario_modeloaut_equipamiento_id_7aff93a2_fk_inventari FOREIGN KEY (equipamiento_id) REFERENCES public.inventario_equipamiento(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos DROP CONSTRAINT inventario_modeloaut_equipamiento_id_7aff93a2_fk_inventari;
       public          postgres    false    225    2914    250            �           2606    44439 \   inventario_modeloauto_equipamientos inventario_modeloaut_modeloauto_id_81838bf8_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos
    ADD CONSTRAINT inventario_modeloaut_modeloauto_id_81838bf8_fk_inventari FOREIGN KEY (modeloauto_id) REFERENCES public.inventario_modeloauto(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.inventario_modeloauto_equipamientos DROP CONSTRAINT inventario_modeloaut_modeloauto_id_81838bf8_fk_inventari;
       public          postgres    false    2929    235    250            �           2606    44286 T   inventario_modeloauto inventario_modeloauto_marca_id_8741d667_fk_inventario_marca_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_modeloauto
    ADD CONSTRAINT inventario_modeloauto_marca_id_8741d667_fk_inventario_marca_id FOREIGN KEY (marca_id) REFERENCES public.inventario_marca(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.inventario_modeloauto DROP CONSTRAINT inventario_modeloauto_marca_id_8741d667_fk_inventario_marca_id;
       public          postgres    false    227    2916    235            �           2606    44463 H   inventario_vendedor inventario_vendedor_usuario_id_d79de4c5_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_vendedor
    ADD CONSTRAINT inventario_vendedor_usuario_id_d79de4c5_fk_inventari FOREIGN KEY (usuario_id) REFERENCES public.inventario_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.inventario_vendedor DROP CONSTRAINT inventario_vendedor_usuario_id_d79de4c5_fk_inventari;
       public          postgres    false    233    2920    231            �           2606    44395 _   servicio_tecnico_facturaservicio servicio_tecnico_fac_revision_tecnica_id_56df4331_fk_servicio_    FK CONSTRAINT       ALTER TABLE ONLY public.servicio_tecnico_facturaservicio
    ADD CONSTRAINT servicio_tecnico_fac_revision_tecnica_id_56df4331_fk_servicio_ FOREIGN KEY (revision_tecnica_id) REFERENCES public.servicio_tecnico_revisiontecnica(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_facturaservicio DROP CONSTRAINT servicio_tecnico_fac_revision_tecnica_id_56df4331_fk_servicio_;
       public          postgres    false    247    2941    241            �           2606    44358 N   servicio_tecnico_mecanico servicio_tecnico_mec_taller_id_74d2c269_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_mecanico
    ADD CONSTRAINT servicio_tecnico_mec_taller_id_74d2c269_fk_inventari FOREIGN KEY (taller_id) REFERENCES public.inventario_servicio(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.servicio_tecnico_mecanico DROP CONSTRAINT servicio_tecnico_mec_taller_id_74d2c269_fk_inventari;
       public          postgres    false    239    229    2918            �           2606    44468 O   servicio_tecnico_mecanico servicio_tecnico_mec_usuario_id_11b70898_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_mecanico
    ADD CONSTRAINT servicio_tecnico_mec_usuario_id_11b70898_fk_inventari FOREIGN KEY (usuario_id) REFERENCES public.inventario_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.servicio_tecnico_mecanico DROP CONSTRAINT servicio_tecnico_mec_usuario_id_11b70898_fk_inventari;
       public          postgres    false    2920    231    239            �           2606    44370 W   servicio_tecnico_revisiontecnica servicio_tecnico_rev_mecanico_id_8b6f2647_fk_servicio_    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica
    ADD CONSTRAINT servicio_tecnico_rev_mecanico_id_8b6f2647_fk_servicio_ FOREIGN KEY (mecanico_id) REFERENCES public.servicio_tecnico_mecanico(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica DROP CONSTRAINT servicio_tecnico_rev_mecanico_id_8b6f2647_fk_servicio_;
       public          postgres    false    2936    241    239            �           2606    44382 ^   servicio_tecnico_revisiontecnicadetalle servicio_tecnico_rev_repuesto_id_a397ebd4_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle
    ADD CONSTRAINT servicio_tecnico_rev_repuesto_id_a397ebd4_fk_inventari FOREIGN KEY (repuesto_id) REFERENCES public.inventario_equipamiento(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle DROP CONSTRAINT servicio_tecnico_rev_repuesto_id_a397ebd4_fk_inventari;
       public          postgres    false    245    2914    225            �           2606    44387 f   servicio_tecnico_revisiontecnicadetalle servicio_tecnico_rev_revision_tecnica_id_d8c091af_fk_servicio_    FK CONSTRAINT     
  ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle
    ADD CONSTRAINT servicio_tecnico_rev_revision_tecnica_id_d8c091af_fk_servicio_ FOREIGN KEY (revision_tecnica_id) REFERENCES public.servicio_tecnico_revisiontecnica(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnicadetalle DROP CONSTRAINT servicio_tecnico_rev_revision_tecnica_id_d8c091af_fk_servicio_;
       public          postgres    false    2941    245    241            �           2606    44345 W   servicio_tecnico_revisiontecnica servicio_tecnico_rev_vehiculo_id_33c02c4b_fk_servicio_    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica
    ADD CONSTRAINT servicio_tecnico_rev_vehiculo_id_33c02c4b_fk_servicio_ FOREIGN KEY (vehiculo_id) REFERENCES public.servicio_tecnico_vehiculo(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.servicio_tecnico_revisiontecnica DROP CONSTRAINT servicio_tecnico_rev_vehiculo_id_33c02c4b_fk_servicio_;
       public          postgres    false    241    2945    243            �           2606    44376 O   servicio_tecnico_vehiculo servicio_tecnico_veh_cliente_id_cd3440e6_fk_inventari    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_tecnico_vehiculo
    ADD CONSTRAINT servicio_tecnico_veh_cliente_id_cd3440e6_fk_inventari FOREIGN KEY (cliente_id) REFERENCES public.inventario_cliente(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.servicio_tecnico_vehiculo DROP CONSTRAINT servicio_tecnico_veh_cliente_id_cd3440e6_fk_inventari;
       public          postgres    false    243    2911    223            6      x������ � �      8      x������ � �      4     x�}�ݎ�0�����T�?��kT�q�HR���k���1����7��c2�O��v��ɍ��i2�ǿ��6��hǻST(1X xs�[4J� �{�Oa[����=���_�~MҸ`k)N��N��ԧX(�KT$hܕT��i}�³��R\�G]�dRSDP"9K� ����/7�l�6+��8�����#����q����M��O��|>��@����.RH� �_���G}���,3�A�b3R�r�Tk�#�+�3�:	Sng�&���"��ޮ�d��=�\�gQH ��@	F�i�<L�{���_șK8�0��r03��"�\�X<��	'3N("�f�w��c�O�
�d���	�u�r{ҀRu�p��hs�ܵƧ�[��2�Q�'��N'��t���~2Y��c[&g�,���L��#�l�=R����vޘ�+ڲ�WAtm!�蛋8������(�Đ���xs�i6Y����V*CaL�,H�1)� 9�'�1�%��,��a�T6M�*	='p���('�O�-��n��x��?�f+���u��ɮ���Z�f� �5�)z���οh�Kı�U�$�5�*E����H�"Ʌ/L�hv�~�����9�:���X����Q��5��5�;�E�����vM2�}���/��0�M�D�(��L��$%1�*��a#U|���&K;�dף�)�;���q�:�w�"�9>Z�����*G�Ek��N?��,O���0�KǞ�/u���r��&� j���Z�V�xU      :      x������ � �      <      x������ � �      >      x������ � �      @      x������ � �      2   �   x��PIn�0<��)Bg�K������,�Z����&P�CO�����(�x�s��	���f�8JJ���r�Z&8��$�p4VC�k�9q�	�L�e;� �����E[�¥W��
����E&�����)Z�^��f�RG�^.��p߫8vrձץ{�F6�H<�?��l�غɖ <o�ȳ�3��\�33?�_��8��=ðێ�6}_�� ~ ���      0   w  x����n� �����$b����e%��"��럨}��:i�nrc)���̙�@Q�nr�4}�n,c`|�'o��=���7��
�$��3������s2�%/����1I�*AӄS4:|�����L�?{<n3J�R'��2��u�֓�yo�����1�M�$�Q�CZ�m�r`҉�l�I1
�+�k|hl3���nh�8&GIoZ�iם�[�(M�r'Ԋ��<Ƈk�o�S�N��^)tKI�l'��v:�I��V��e4v�R�>V67�=��5�L��R�t��~X�͹��6�^��'g�����0�޻a�i�8��/m�Xϓ|ũ�p��̹֔{���CD/��$���:a�_ÔL�Km�3�1"g�!|~��/�H�r�j�f�۪���jY�i���
ߝc�����]A��/
t�<��3����r���G�j��J��A����^J*�8} ��cQa\�L]n�M㯃a�t�ߙ����CE@*΃&��AwZn��1܊*����K%�!�y��3���+�P��y�b�_�� ��2T2@�"�+�@d�|0߆�k�RB�%�m}<�P,�W"F�8�<Mx?���L�� [�� V�*AA��HmO$�L*��L�s��v� V$      ]      x������ � �      B      x�3�4NNCN#��=... #�      D   '   x�34ᴄΌ��Dᐞ��������ih����� -v�      F   5   x�3��+M-��42�30�2�,NM/�K�@&�%�EɩE � �=... u��      R      x������ � �      H      x�3�t�H-+��I-����� .��      P      x�3�424642�4�30�4�P�\1z\\\ ?�      _      x�3�4�4����� �\      J   6   x�3�442426226�424" �Ј3�8%���9?�8�83?/�(3�+F��� qX      L   L   x�3��L�+M�,vH��K�紀N��Լ�T.#Ό|������1"�9Sr3� 
R ����,�d� �S&      N   /   x�3ᴀμ�Բ|μ��Ĕb�ļҤ�b��\��|NCK�=... :h�      \      x������ � �      T   *   x�3�44242"#CΌ��Dᐞ����i�id����� �o	�      V      x������ � �      Z      x������ � �      X      x������ � �     