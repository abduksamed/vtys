PGDMP     3    $                z            odev    15.1    15.0 J    u           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            v           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            w           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            x           1262    16398    odev    DATABASE     x   CREATE DATABASE odev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE odev;
                postgres    false            ?            1255    16573 5   filmekle(integer, text, date, integer, integer, real) 	   PROCEDURE     ?   CREATE PROCEDURE public.filmekle(IN p1 integer, IN p2 text, IN p3 date, IN p4 integer, IN p5 integer, IN p6 real)
    LANGUAGE sql
    AS $$
insert into film(film_id,filmin_adi,cikis_tarihi,dil_id,sure,puan) values(p1,p2,p3,p4,p5,p6);
$$;
 q   DROP PROCEDURE public.filmekle(IN p1 integer, IN p2 text, IN p3 date, IN p4 integer, IN p5 integer, IN p6 real);
       public          postgres    false            ?            1255    16706    filmgetir(character varying)    FUNCTION     S  CREATE FUNCTION public.filmgetir(prsd character varying) RETURNS TABLE(film_i integer, filmin_ad text, cikis_tarih date, dil_i integer, suresi integer, "puanı" real)
    LANGUAGE plpgsql
    AS $$
Begin
	Return Query
	Select
	film_id, 
	filmin_adi,
	cikis_tarihi, 
	dil_id, 
	sure, 
	puan
From
	film
Where
	filmin_adi like prsd;
End;
$$;
 8   DROP FUNCTION public.filmgetir(prsd character varying);
       public          postgres    false            ?            1255    16598    kdvli(double precision)    FUNCTION     ?   CREATE FUNCTION public.kdvli(tutar double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
begin
tutar:=tutar*0.08 + tutar;
return tutar;
end;
$$;
 4   DROP FUNCTION public.kdvli(tutar double precision);
       public          postgres    false            ?            1255    16571    netmaas(double precision)    FUNCTION     ?   CREATE FUNCTION public.netmaas(maas double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
begin
maas:=maas - maas*0.15;
maas:=maas- 1730;
return maas;
end;
$$;
 5   DROP FUNCTION public.netmaas(maas double precision);
       public          postgres    false            ?            1259    16466    adres    TABLE     ?   CREATE TABLE public.adres (
    adres_id integer NOT NULL,
    "ilçe_id" integer NOT NULL,
    adres text NOT NULL,
    postakodu integer
);
    DROP TABLE public.adres;
       public         heap    postgres    false            ?            1259    16430    aktor    TABLE     p   CREATE TABLE public.aktor (
    aktor_id integer NOT NULL,
    isim text NOT NULL,
    soyisim text NOT NULL
);
    DROP TABLE public.aktor;
       public         heap    postgres    false            ?            1259    16418    dil    TABLE     Q   CREATE TABLE public.dil (
    dil_id integer NOT NULL,
    isim text NOT NULL
);
    DROP TABLE public.dil;
       public         heap    postgres    false            ?            1259    16454    envanter    TABLE     ?   CREATE TABLE public.envanter (
    envanter_id integer NOT NULL,
    film_id integer NOT NULL,
    magaza_id integer NOT NULL
);
    DROP TABLE public.envanter;
       public         heap    postgres    false            ?            1259    16406    film    TABLE     ?   CREATE TABLE public.film (
    film_id integer NOT NULL,
    filmin_adi text NOT NULL,
    cikis_tarihi date NOT NULL,
    dil_id integer NOT NULL,
    sure integer NOT NULL,
    puan real
);
    DROP TABLE public.film;
       public         heap    postgres    false            ?            1259    16425    film_basrol    TABLE     a   CREATE TABLE public.film_basrol (
    aktor_id integer NOT NULL,
    film_id integer NOT NULL
);
    DROP TABLE public.film_basrol;
       public         heap    postgres    false            ?            1259    16599    film_kategorisi    TABLE     h   CREATE TABLE public.film_kategorisi (
    film_id integer NOT NULL,
    kategori_id integer NOT NULL
);
 #   DROP TABLE public.film_kategorisi;
       public         heap    postgres    false            ?            1259    16480    il    TABLE     M   CREATE TABLE public.il (
    il_id integer NOT NULL,
    il text NOT NULL
);
    DROP TABLE public.il;
       public         heap    postgres    false            ?            1259    16473    ilçe    TABLE     x   CREATE TABLE public."ilçe" (
    "ilçe_id" integer NOT NULL,
    "ilçe" text NOT NULL,
    il_id integer NOT NULL
);
    DROP TABLE public."ilçe";
       public         heap    postgres    false            ?            1259    16399    kategori    TABLE     [   CREATE TABLE public.kategori (
    kategori_id integer NOT NULL,
    isim text NOT NULL
);
    DROP TABLE public.kategori;
       public         heap    postgres    false            ?            1259    16449    kiralama    TABLE     ?   CREATE TABLE public.kiralama (
    kiralama_id integer NOT NULL,
    envanter_id integer NOT NULL,
    musteri_id integer NOT NULL,
    personel_id integer NOT NULL,
    kiralama_tarihi date NOT NULL,
    donus_tarihi date NOT NULL
);
    DROP TABLE public.kiralama;
       public         heap    postgres    false            ?            1259    16750    kisi    TABLE     N   CREATE TABLE public.kisi (
    ad text,
    soyad text,
    telefon bigint
);
    DROP TABLE public.kisi;
       public         heap    postgres    false            ?            1259    16487    magaza    TABLE     ^   CREATE TABLE public.magaza (
    magaza_id integer NOT NULL,
    adres_id integer NOT NULL
);
    DROP TABLE public.magaza;
       public         heap    postgres    false            ?            1259    16459    musteri    TABLE     ?   CREATE TABLE public.musteri (
    musteri_id integer NOT NULL,
    adres_id integer NOT NULL,
    ad text NOT NULL,
    soyad text NOT NULL,
    telefon bigint NOT NULL
)
INHERITS (public.kisi);
    DROP TABLE public.musteri;
       public         heap    postgres    false    229            ?            1259    16444    odeme    TABLE     ?   CREATE TABLE public.odeme (
    odeme_id integer NOT NULL,
    personel_id integer NOT NULL,
    musteri_id integer NOT NULL,
    kiralama_id integer NOT NULL,
    odeme_tarihi date NOT NULL,
    tutar integer NOT NULL
);
    DROP TABLE public.odeme;
       public         heap    postgres    false            ?            1259    16437    personel    TABLE     ?   CREATE TABLE public.personel (
    personel_id integer NOT NULL,
    ad text NOT NULL,
    soyad text NOT NULL,
    telefon bigint NOT NULL,
    adres_id integer NOT NULL,
    magaza_id integer NOT NULL,
    maas integer
)
INHERITS (public.kisi);
    DROP TABLE public.personel;
       public         heap    postgres    false    229            m          0    16466    adres 
   TABLE DATA           G   COPY public.adres (adres_id, "ilçe_id", adres, postakodu) FROM stdin;
    public          postgres    false    224   ?V       g          0    16430    aktor 
   TABLE DATA           8   COPY public.aktor (aktor_id, isim, soyisim) FROM stdin;
    public          postgres    false    218   _W       e          0    16418    dil 
   TABLE DATA           +   COPY public.dil (dil_id, isim) FROM stdin;
    public          postgres    false    216   ?W       k          0    16454    envanter 
   TABLE DATA           C   COPY public.envanter (envanter_id, film_id, magaza_id) FROM stdin;
    public          postgres    false    222   ?W       d          0    16406    film 
   TABLE DATA           U   COPY public.film (film_id, filmin_adi, cikis_tarihi, dil_id, sure, puan) FROM stdin;
    public          postgres    false    215   X       f          0    16425    film_basrol 
   TABLE DATA           8   COPY public.film_basrol (aktor_id, film_id) FROM stdin;
    public          postgres    false    217   ?X       q          0    16599    film_kategorisi 
   TABLE DATA           ?   COPY public.film_kategorisi (film_id, kategori_id) FROM stdin;
    public          postgres    false    228   ?X       o          0    16480    il 
   TABLE DATA           '   COPY public.il (il_id, il) FROM stdin;
    public          postgres    false    226   Y       n          0    16473    ilçe 
   TABLE DATA           =   COPY public."ilçe" ("ilçe_id", "ilçe", il_id) FROM stdin;
    public          postgres    false    225   OY       c          0    16399    kategori 
   TABLE DATA           5   COPY public.kategori (kategori_id, isim) FROM stdin;
    public          postgres    false    214   ?Y       j          0    16449    kiralama 
   TABLE DATA           t   COPY public.kiralama (kiralama_id, envanter_id, musteri_id, personel_id, kiralama_tarihi, donus_tarihi) FROM stdin;
    public          postgres    false    221   Z       r          0    16750    kisi 
   TABLE DATA           2   COPY public.kisi (ad, soyad, telefon) FROM stdin;
    public          postgres    false    229   TZ       p          0    16487    magaza 
   TABLE DATA           5   COPY public.magaza (magaza_id, adres_id) FROM stdin;
    public          postgres    false    227   qZ       l          0    16459    musteri 
   TABLE DATA           K   COPY public.musteri (musteri_id, adres_id, ad, soyad, telefon) FROM stdin;
    public          postgres    false    223   ?Z       i          0    16444    odeme 
   TABLE DATA           d   COPY public.odeme (odeme_id, personel_id, musteri_id, kiralama_id, odeme_tarihi, tutar) FROM stdin;
    public          postgres    false    220   ?Z       h          0    16437    personel 
   TABLE DATA           ^   COPY public.personel (personel_id, ad, soyad, telefon, adres_id, magaza_id, maas) FROM stdin;
    public          postgres    false    219   [       ?           2606    16412    film Film_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.film
    ADD CONSTRAINT "Film_pkey" PRIMARY KEY (film_id);
 :   ALTER TABLE ONLY public.film DROP CONSTRAINT "Film_pkey";
       public            postgres    false    215            ?           2606    16405    kategori Kategori_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT "Kategori_pkey" PRIMARY KEY (kategori_id);
 B   ALTER TABLE ONLY public.kategori DROP CONSTRAINT "Kategori_pkey";
       public            postgres    false    214            ?           2606    16472    adres adres_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.adres
    ADD CONSTRAINT adres_pkey PRIMARY KEY (adres_id);
 :   ALTER TABLE ONLY public.adres DROP CONSTRAINT adres_pkey;
       public            postgres    false    224            ?           2606    16436    aktor aktor_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.aktor
    ADD CONSTRAINT aktor_pkey PRIMARY KEY (aktor_id);
 :   ALTER TABLE ONLY public.aktor DROP CONSTRAINT aktor_pkey;
       public            postgres    false    218            ?           2606    16424    dil dil_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.dil
    ADD CONSTRAINT dil_pkey PRIMARY KEY (dil_id);
 6   ALTER TABLE ONLY public.dil DROP CONSTRAINT dil_pkey;
       public            postgres    false    216            ?           2606    16458    envanter envanter_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.envanter
    ADD CONSTRAINT envanter_pkey PRIMARY KEY (envanter_id);
 @   ALTER TABLE ONLY public.envanter DROP CONSTRAINT envanter_pkey;
       public            postgres    false    222            ?           2606    16429    film_basrol film_aktorleri_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.film_basrol
    ADD CONSTRAINT film_aktorleri_pkey PRIMARY KEY (aktor_id);
 I   ALTER TABLE ONLY public.film_basrol DROP CONSTRAINT film_aktorleri_pkey;
       public            postgres    false    217            ?           2606    16718 $   film_kategorisi film_kategorisi_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.film_kategorisi
    ADD CONSTRAINT film_kategorisi_pkey PRIMARY KEY (film_id);
 N   ALTER TABLE ONLY public.film_kategorisi DROP CONSTRAINT film_kategorisi_pkey;
       public            postgres    false    228            ?           2606    16486 
   il il_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.il
    ADD CONSTRAINT il_pkey PRIMARY KEY (il_id);
 4   ALTER TABLE ONLY public.il DROP CONSTRAINT il_pkey;
       public            postgres    false    226            ?           2606    16479    ilçe ilçe_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."ilçe"
    ADD CONSTRAINT "ilçe_pkey" PRIMARY KEY ("ilçe_id");
 >   ALTER TABLE ONLY public."ilçe" DROP CONSTRAINT "ilçe_pkey";
       public            postgres    false    225            ?           2606    16453    kiralama kiralama_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.kiralama
    ADD CONSTRAINT kiralama_pkey PRIMARY KEY (kiralama_id);
 @   ALTER TABLE ONLY public.kiralama DROP CONSTRAINT kiralama_pkey;
       public            postgres    false    221            ?           2606    16491    magaza magaza_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.magaza
    ADD CONSTRAINT magaza_pkey PRIMARY KEY (magaza_id);
 <   ALTER TABLE ONLY public.magaza DROP CONSTRAINT magaza_pkey;
       public            postgres    false    227            ?           2606    16465    musteri musteri_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT musteri_pkey PRIMARY KEY (musteri_id);
 >   ALTER TABLE ONLY public.musteri DROP CONSTRAINT musteri_pkey;
       public            postgres    false    223            ?           2606    16448    odeme odeme_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.odeme
    ADD CONSTRAINT odeme_pkey PRIMARY KEY (odeme_id);
 :   ALTER TABLE ONLY public.odeme DROP CONSTRAINT odeme_pkey;
       public            postgres    false    220            ?           2606    16443    personel personel_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.personel
    ADD CONSTRAINT personel_pkey PRIMARY KEY (personel_id);
 @   ALTER TABLE ONLY public.personel DROP CONSTRAINT personel_pkey;
       public            postgres    false    219            ?           2606    16664    personel adres_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.personel
    ADD CONSTRAINT adres_id FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) NOT VALID;
 ;   ALTER TABLE ONLY public.personel DROP CONSTRAINT adres_id;
       public          postgres    false    3257    224    219            ?           2606    16674    magaza adres_id    FK CONSTRAINT        ALTER TABLE ONLY public.magaza
    ADD CONSTRAINT adres_id FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) NOT VALID;
 9   ALTER TABLE ONLY public.magaza DROP CONSTRAINT adres_id;
       public          postgres    false    3257    224    227            ?           2606    16689    musteri adres_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT adres_id FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) NOT VALID;
 :   ALTER TABLE ONLY public.musteri DROP CONSTRAINT adres_id;
       public          postgres    false    223    224    3257            ?           2606    16634    film_basrol aktor_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.film_basrol
    ADD CONSTRAINT aktor_id FOREIGN KEY (aktor_id) REFERENCES public.aktor(aktor_id) NOT VALID;
 >   ALTER TABLE ONLY public.film_basrol DROP CONSTRAINT aktor_id;
       public          postgres    false    218    217    3245            ?           2606    16624    film dil_id    FK CONSTRAINT     u   ALTER TABLE ONLY public.film
    ADD CONSTRAINT dil_id FOREIGN KEY (dil_id) REFERENCES public.dil(dil_id) NOT VALID;
 5   ALTER TABLE ONLY public.film DROP CONSTRAINT dil_id;
       public          postgres    false    3241    215    216            ?           2606    16644    kiralama envanter_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.kiralama
    ADD CONSTRAINT envanter_id FOREIGN KEY (envanter_id) REFERENCES public.envanter(envanter_id) NOT VALID;
 >   ALTER TABLE ONLY public.kiralama DROP CONSTRAINT envanter_id;
       public          postgres    false    221    3253    222            ?           2606    16614    film_kategorisi film_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.film_kategorisi
    ADD CONSTRAINT film_id FOREIGN KEY (film_id) REFERENCES public.film(film_id) NOT VALID;
 A   ALTER TABLE ONLY public.film_kategorisi DROP CONSTRAINT film_id;
       public          postgres    false    3239    228    215            ?           2606    16629    film_basrol film_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.film_basrol
    ADD CONSTRAINT film_id FOREIGN KEY (film_id) REFERENCES public.film(film_id) NOT VALID;
 =   ALTER TABLE ONLY public.film_basrol DROP CONSTRAINT film_id;
       public          postgres    false    3239    217    215            ?           2606    16639    envanter film_id    FK CONSTRAINT     }   ALTER TABLE ONLY public.envanter
    ADD CONSTRAINT film_id FOREIGN KEY (film_id) REFERENCES public.film(film_id) NOT VALID;
 :   ALTER TABLE ONLY public.envanter DROP CONSTRAINT film_id;
       public          postgres    false    215    3239    222            ?           2606    16679    ilçe il_id    FK CONSTRAINT     t   ALTER TABLE ONLY public."ilçe"
    ADD CONSTRAINT il_id FOREIGN KEY (il_id) REFERENCES public.il(il_id) NOT VALID;
 7   ALTER TABLE ONLY public."ilçe" DROP CONSTRAINT il_id;
       public          postgres    false    226    3261    225            ?           2606    16684    adres ilçe_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.adres
    ADD CONSTRAINT "ilçe_id" FOREIGN KEY ("ilçe_id") REFERENCES public."ilçe"("ilçe_id") NOT VALID;
 :   ALTER TABLE ONLY public.adres DROP CONSTRAINT "ilçe_id";
       public          postgres    false    224    3259    225            ?           2606    16712    film_kategorisi kategori_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.film_kategorisi
    ADD CONSTRAINT kategori_id FOREIGN KEY (kategori_id) REFERENCES public.kategori(kategori_id) NOT VALID;
 E   ALTER TABLE ONLY public.film_kategorisi DROP CONSTRAINT kategori_id;
       public          postgres    false    214    228    3237            ?           2606    16649    odeme kiralama_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.odeme
    ADD CONSTRAINT kiralama_id FOREIGN KEY (kiralama_id) REFERENCES public.kiralama(kiralama_id) NOT VALID;
 ;   ALTER TABLE ONLY public.odeme DROP CONSTRAINT kiralama_id;
       public          postgres    false    221    220    3251            ?           2606    16669    personel magaza_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.personel
    ADD CONSTRAINT magaza_id FOREIGN KEY (magaza_id) REFERENCES public.magaza(magaza_id) NOT VALID;
 <   ALTER TABLE ONLY public.personel DROP CONSTRAINT magaza_id;
       public          postgres    false    3263    227    219            ?           2606    16707    envanter magaza_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.envanter
    ADD CONSTRAINT magaza_id FOREIGN KEY (magaza_id) REFERENCES public.magaza(magaza_id) NOT VALID;
 <   ALTER TABLE ONLY public.envanter DROP CONSTRAINT magaza_id;
       public          postgres    false    222    227    3263            ?           2606    16724    odeme musteri_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.odeme
    ADD CONSTRAINT musteri_id FOREIGN KEY (musteri_id) REFERENCES public.musteri(musteri_id) NOT VALID;
 :   ALTER TABLE ONLY public.odeme DROP CONSTRAINT musteri_id;
       public          postgres    false    223    220    3255            ?           2606    16729    kiralama musteri_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.kiralama
    ADD CONSTRAINT musteri_id FOREIGN KEY (musteri_id) REFERENCES public.musteri(musteri_id) NOT VALID;
 =   ALTER TABLE ONLY public.kiralama DROP CONSTRAINT musteri_id;
       public          postgres    false    3255    221    223            ?           2606    16654    kiralama personel_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.kiralama
    ADD CONSTRAINT personel_id FOREIGN KEY (personel_id) REFERENCES public.personel(personel_id) NOT VALID;
 >   ALTER TABLE ONLY public.kiralama DROP CONSTRAINT personel_id;
       public          postgres    false    221    219    3247            ?           2606    16659    odeme personel_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.odeme
    ADD CONSTRAINT personel_id FOREIGN KEY (personel_id) REFERENCES public.personel(personel_id) NOT VALID;
 ;   ALTER TABLE ONLY public.odeme DROP CONSTRAINT personel_id;
       public          postgres    false    220    219    3247            m   ~   x?5???0???n[???2? ?	Y!?$;?B3??H_8s?????M??J?_????dI???E*?
???J?k?4PBB??q??:?Zf?D??v?;Îz?~ߐ???#?.??#n<1??*\      g   7   x?3?<:?1-1??8?*??ˈ3?49??3)'19?ː?,3?3%3?85?+F??? |??      e   6   x?3?L??M?KN?2??J,???8K?)?>?<?ː33/=3'?*9?+F??? ???      k      x?3?4?4?2?B?=... *
      d   ?   x?mα?0???n
/`tg?%?#?@8?(Y?2??,??+?k?k??????c??m??k;???X2KR??TAU\Q??B?V??L-WP#?0??i?o???x??86??c??Lv?B#??j DQ??>^nX?X?????e??A?e??????#      f      x?3?44?2?4?2?4?????? ?B      q      x?3?4?2aSN#?=... ?      o   4   x?3??NLNL???2?L??N,J?2??,.I?K*??2?,N?U&r??qqq >?E      n   J   x?3?LOM?J?4?2??M?M??4?2???<:?1?$???#9???8?S?R2??8?9S?R?rR???=... ?PD      c   a   x?-??	?@E?u^V ??^?D?bf`tڌ?ؗ
???fĺ??rRo?((hl舝o????hhf?O???AV?DcX"*??R????h????Jd?      j   *   x?3?4?@#C]C1? L.CN?!d?t?L?b???? O
9      r      x?????? ? ?      p      x?3?4?2?4?????? ??      l   6   x?3?4?,N?M-?<?<?*?????̄ːӐ3;1%??3;?(hlh????? H??      i   )   x?3?4C###]CC ?46?2?? LԈ?Ā+F??? ??7      h   ~   x??A? ????0??һ??D??V??????U??4o???\q?K??t?[k??<??n??4????z??v??¨@?Q?!??Y?\q????I=jF???(2-??????p????|2????$?     