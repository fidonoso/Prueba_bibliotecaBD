PGDMP     7    .                z        
   biblioteca    14.1    14.1 +               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            "           1262    16644 
   biblioteca    DATABASE     f   CREATE DATABASE biblioteca WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE biblioteca;
                postgres    false            ?            1259    16656    autor    TABLE     ?   CREATE TABLE public.autor (
    cod_autor integer NOT NULL,
    nombre character varying(30),
    apellido character varying(30),
    fecha_nac integer,
    fecha_muerte integer
);
    DROP TABLE public.autor;
       public         heap    postgres    false            ?            1259    16655    autor_cod_autor_seq    SEQUENCE     ?   CREATE SEQUENCE public.autor_cod_autor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.autor_cod_autor_seq;
       public          postgres    false    212            #           0    0    autor_cod_autor_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.autor_cod_autor_seq OWNED BY public.autor.cod_autor;
          public          postgres    false    211            ?            1259    16672    autores    TABLE     ?   CREATE TABLE public.autores (
    id integer NOT NULL,
    cod_autor_id integer,
    tipo_autor_id integer,
    isbn_id character varying(15)
);
    DROP TABLE public.autores;
       public         heap    postgres    false            ?            1259    16671    autores_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.autores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.autores_id_seq;
       public          postgres    false    216            $           0    0    autores_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.autores_id_seq OWNED BY public.autores.id;
          public          postgres    false    215            ?            1259    16650    libros    TABLE     }   CREATE TABLE public.libros (
    isbn character varying(15) NOT NULL,
    titulo character varying(50),
    n_pag integer
);
    DROP TABLE public.libros;
       public         heap    postgres    false            ?            1259    16694 	   prestamos    TABLE     ?   CREATE TABLE public.prestamos (
    id integer NOT NULL,
    isbn_libro character varying(15),
    fecha_inicio date,
    fecha_real_devol date,
    rut_socio character varying(10)
);
    DROP TABLE public.prestamos;
       public         heap    postgres    false            ?            1259    16693    prestamos_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.prestamos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.prestamos_id_seq;
       public          postgres    false    218            %           0    0    prestamos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.prestamos_id_seq OWNED BY public.prestamos.id;
          public          postgres    false    217            ?            1259    16645    socios    TABLE     ?   CREATE TABLE public.socios (
    rut character varying(10) NOT NULL,
    nombre character varying(30),
    apellido character varying(30),
    direccion character varying(100),
    telefono character varying(14)
);
    DROP TABLE public.socios;
       public         heap    postgres    false            ?            1259    16663 
   tipo_autor    TABLE     t   CREATE TABLE public.tipo_autor (
    id integer NOT NULL,
    nombre character varying(50),
    descripcion text
);
    DROP TABLE public.tipo_autor;
       public         heap    postgres    false            ?            1259    16662    tipo_autor_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tipo_autor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tipo_autor_id_seq;
       public          postgres    false    214            &           0    0    tipo_autor_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tipo_autor_id_seq OWNED BY public.tipo_autor.id;
          public          postgres    false    213            s           2604    16659    autor cod_autor    DEFAULT     r   ALTER TABLE ONLY public.autor ALTER COLUMN cod_autor SET DEFAULT nextval('public.autor_cod_autor_seq'::regclass);
 >   ALTER TABLE public.autor ALTER COLUMN cod_autor DROP DEFAULT;
       public          postgres    false    212    211    212            u           2604    16675 
   autores id    DEFAULT     h   ALTER TABLE ONLY public.autores ALTER COLUMN id SET DEFAULT nextval('public.autores_id_seq'::regclass);
 9   ALTER TABLE public.autores ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            v           2604    16697    prestamos id    DEFAULT     l   ALTER TABLE ONLY public.prestamos ALTER COLUMN id SET DEFAULT nextval('public.prestamos_id_seq'::regclass);
 ;   ALTER TABLE public.prestamos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            t           2604    16666    tipo_autor id    DEFAULT     n   ALTER TABLE ONLY public.tipo_autor ALTER COLUMN id SET DEFAULT nextval('public.tipo_autor_id_seq'::regclass);
 <   ALTER TABLE public.tipo_autor ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214                      0    16656    autor 
   TABLE DATA           U   COPY public.autor (cod_autor, nombre, apellido, fecha_nac, fecha_muerte) FROM stdin;
    public          postgres    false    212   ?/                 0    16672    autores 
   TABLE DATA           K   COPY public.autores (id, cod_autor_id, tipo_autor_id, isbn_id) FROM stdin;
    public          postgres    false    216   0                 0    16650    libros 
   TABLE DATA           5   COPY public.libros (isbn, titulo, n_pag) FROM stdin;
    public          postgres    false    210   T0                 0    16694 	   prestamos 
   TABLE DATA           ^   COPY public.prestamos (id, isbn_libro, fecha_inicio, fecha_real_devol, rut_socio) FROM stdin;
    public          postgres    false    218   ?0                 0    16645    socios 
   TABLE DATA           L   COPY public.socios (rut, nombre, apellido, direccion, telefono) FROM stdin;
    public          postgres    false    209   g1                 0    16663 
   tipo_autor 
   TABLE DATA           =   COPY public.tipo_autor (id, nombre, descripcion) FROM stdin;
    public          postgres    false    214   2       '           0    0    autor_cod_autor_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.autor_cod_autor_seq', 1, false);
          public          postgres    false    211            (           0    0    autores_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.autores_id_seq', 1, false);
          public          postgres    false    215            )           0    0    prestamos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.prestamos_id_seq', 1, false);
          public          postgres    false    217            *           0    0    tipo_autor_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tipo_autor_id_seq', 1, false);
          public          postgres    false    213            |           2606    16661    autor autor_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (cod_autor);
 :   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pkey;
       public            postgres    false    212            ?           2606    16677    autores autores_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.autores DROP CONSTRAINT autores_pkey;
       public            postgres    false    216            z           2606    16654    libros libros_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (isbn);
 <   ALTER TABLE ONLY public.libros DROP CONSTRAINT libros_pkey;
       public            postgres    false    210            ?           2606    16699    prestamos prestamos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.prestamos DROP CONSTRAINT prestamos_pkey;
       public            postgres    false    218            x           2606    16649    socios socios_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (rut);
 <   ALTER TABLE ONLY public.socios DROP CONSTRAINT socios_pkey;
       public            postgres    false    209            ~           2606    16670    tipo_autor tipo_autor_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tipo_autor
    ADD CONSTRAINT tipo_autor_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tipo_autor DROP CONSTRAINT tipo_autor_pkey;
       public            postgres    false    214            ?           2606    16678 !   autores autores_cod_autor_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_cod_autor_id_fkey FOREIGN KEY (cod_autor_id) REFERENCES public.autor(cod_autor);
 K   ALTER TABLE ONLY public.autores DROP CONSTRAINT autores_cod_autor_id_fkey;
       public          postgres    false    212    216    3196            ?           2606    16688    autores autores_isbn_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_isbn_id_fkey FOREIGN KEY (isbn_id) REFERENCES public.libros(isbn);
 F   ALTER TABLE ONLY public.autores DROP CONSTRAINT autores_isbn_id_fkey;
       public          postgres    false    3194    210    216            ?           2606    16683 "   autores autores_tipo_autor_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_tipo_autor_id_fkey FOREIGN KEY (tipo_autor_id) REFERENCES public.tipo_autor(id);
 L   ALTER TABLE ONLY public.autores DROP CONSTRAINT autores_tipo_autor_id_fkey;
       public          postgres    false    216    3198    214            ?           2606    16700 #   prestamos prestamos_isbn_libro_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_isbn_libro_fkey FOREIGN KEY (isbn_libro) REFERENCES public.libros(isbn);
 M   ALTER TABLE ONLY public.prestamos DROP CONSTRAINT prestamos_isbn_libro_fkey;
       public          postgres    false    218    210    3194            ?           2606    16705 "   prestamos prestamos_rut_socio_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_rut_socio_fkey FOREIGN KEY (rut_socio) REFERENCES public.socios(rut);
 L   ALTER TABLE ONLY public.prestamos DROP CONSTRAINT prestamos_rut_socio_fkey;
       public          postgres    false    209    3192    218               n   x?M??
? ??>L?m?ϱ?BJ!??˂????Ds?uf,???P??Qv?ۗk???X${M?????LO|??w???05??^?%7>^)??H?i??0o":r? ?         A   x?e???@???.E$)۰?P?y?X??? ???)??3{^?./c*?"IeS????]???^$????         ?   x?%̽1??ڞ????W?kh???
."q1?s??*7Dy??????Q?UJS??25?U+??{???w۾lS??dyk?>E؀G!?0??5[Ӛ?^,3??0????7.+??d???ˉ??O??!??X-?         n   x?u???0??'Xp?L??#???'??Y;????Ē????@??T$+?W?vrw?de؍jpPDH$+??ݨ???????u|íö|?????1???>|         ?   x?34]CN???<????|N?0W?OGC?`G?OGwNKC(?2? ]#NǼD΀G??R?8??\???@UqC??1gpb^JQ"?czifNb?&mP??\&?k??Z\??t?W*?.?.cd]P?&\??k???S?t?o??%?p'???*6?????? yqC1         E   x?3?(??K?,H??t,-?/R(??RRr?????8??A?0Z!_!9?'1)?(?AR???? 	??     