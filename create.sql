PGDMP     #    4                {           imdb    15.1    15.1     "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    17636    imdb    DATABASE     f   CREATE DATABASE imdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE imdb;
                postgres    false            �            1259    25898    akas    TABLE       CREATE TABLE public.akas (
    title_id character varying NOT NULL,
    ordering character varying,
    title character varying,
    region character varying,
    language character varying,
    types character varying,
    attributes character varying,
    is_original_title boolean
);
    DROP TABLE public.akas;
       public         heap    postgres    false            �            1259    25847    basics    TABLE     ;  CREATE TABLE public.basics (
    tconst character varying NOT NULL,
    title_type character varying,
    primary_title character varying,
    original_title character varying,
    is_adult boolean,
    start_year integer,
    end_year integer,
    runtime_minutes integer,
    genres character varying NOT NULL
);
    DROP TABLE public.basics;
       public         heap    postgres    false            �            1259    25874    crew    TABLE     �   CREATE TABLE public.crew (
    tconst character varying NOT NULL,
    directors character varying,
    writers character varying
);
    DROP TABLE public.crew;
       public         heap    postgres    false            �            1259    25886    episode    TABLE     �   CREATE TABLE public.episode (
    tconst character varying,
    parent_tconst character varying NOT NULL,
    season_number integer,
    episode_number integer
);
    DROP TABLE public.episode;
       public         heap    postgres    false            �            1259    25911    ratings    TABLE     z   CREATE TABLE public.ratings (
    tconst character varying NOT NULL,
    average_rating numeric,
    num_votes integer
);
    DROP TABLE public.ratings;
       public         heap    postgres    false                      0    25898    akas 
   TABLE DATA           q   COPY public.akas (title_id, ordering, title, region, language, types, attributes, is_original_title) FROM stdin;
    public          postgres    false    217   �                 0    25847    basics 
   TABLE DATA           �   COPY public.basics (tconst, title_type, primary_title, original_title, is_adult, start_year, end_year, runtime_minutes, genres) FROM stdin;
    public          postgres    false    214   �                  0    25874    crew 
   TABLE DATA           :   COPY public.crew (tconst, directors, writers) FROM stdin;
    public          postgres    false    215   9*                 0    25886    episode 
   TABLE DATA           W   COPY public.episode (tconst, parent_tconst, season_number, episode_number) FROM stdin;
    public          postgres    false    216   �+                 0    25911    ratings 
   TABLE DATA           D   COPY public.ratings (tconst, average_rating, num_votes) FROM stdin;
    public          postgres    false    218   &.       �           2606    25904    akas akas_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.akas
    ADD CONSTRAINT akas_pkey PRIMARY KEY (title_id);
 8   ALTER TABLE ONLY public.akas DROP CONSTRAINT akas_pkey;
       public            postgres    false    217                       2606    25873    basics basics_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.basics
    ADD CONSTRAINT basics_pkey PRIMARY KEY (tconst);
 <   ALTER TABLE ONLY public.basics DROP CONSTRAINT basics_pkey;
       public            postgres    false    214            �           2606    25880    crew crew_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.crew
    ADD CONSTRAINT crew_pkey PRIMARY KEY (tconst);
 8   ALTER TABLE ONLY public.crew DROP CONSTRAINT crew_pkey;
       public            postgres    false    215            �           2606    25892    episode episode_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.episode
    ADD CONSTRAINT episode_pkey PRIMARY KEY (parent_tconst);
 >   ALTER TABLE ONLY public.episode DROP CONSTRAINT episode_pkey;
       public            postgres    false    216            �           2606    25917    ratings ratings_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (tconst);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public            postgres    false    218            �           1259    25930    ratings_tconst_index    INDEX     J   CREATE INDEX ratings_tconst_index ON public.ratings USING btree (tconst);
 (   DROP INDEX public.ratings_tconst_index;
       public            postgres    false    218            �           2606    25905    akas akas_fk    FK CONSTRAINT     q   ALTER TABLE ONLY public.akas
    ADD CONSTRAINT akas_fk FOREIGN KEY (title_id) REFERENCES public.basics(tconst);
 6   ALTER TABLE ONLY public.akas DROP CONSTRAINT akas_fk;
       public          postgres    false    3455    217    214            �           2606    25881    crew crew_fk    FK CONSTRAINT     o   ALTER TABLE ONLY public.crew
    ADD CONSTRAINT crew_fk FOREIGN KEY (tconst) REFERENCES public.basics(tconst);
 6   ALTER TABLE ONLY public.crew DROP CONSTRAINT crew_fk;
       public          postgres    false    214    3455    215            �           2606    25893    episode episode_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.episode
    ADD CONSTRAINT episode_fk FOREIGN KEY (parent_tconst) REFERENCES public.basics(tconst);
 <   ALTER TABLE ONLY public.episode DROP CONSTRAINT episode_fk;
       public          postgres    false    216    3455    214            �           2606    25918    ratings ratings_fk    FK CONSTRAINT     u   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_fk FOREIGN KEY (tconst) REFERENCES public.basics(tconst);
 <   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_fk;
       public          postgres    false    218    214    3455               �  x��X�r�6>�O��rI2��ߣ$[r�Q%ٙ����
4 h�=�}���-��ړ_�~��Reǡ�4��x��b��o1����{u����/���s�����=�������}�x��uxsƓ��Y�yyb
��9�k*SA��i��7{�@5�So���>ˬD]\9Pm��Miz�Y�A�R�G\R�0%�嵽�R���gt���ggLr0�IB� s�T����'n������(7K�[iuCO��%d��F�Zs��8���T�$�,4�һ��[�/��Xi��y .JF���s��d��#6�!��Y�Z��(��aDu�$�n�"��0�t�=t[ ��.8s��D1'#����J�hbs�����YP�5Ő|�P"�!W��oW�y2�,��y�S,r_�`�����<�\�Q���TG�j[��RK7�Q�
2�3r���n���@�-܎�#�~�ڇ*�w�Y��a�zd����\�(6nT�8�� O�����f�"O��v���
�$K��\�	�1H�[{�\Ȍr��TB��#��G�̕�!Y�>NR�c`���u8�i~#��$ߑl�JɄ�}K�9��Jp���?E�m��� )"}Ǝ�t�r�d�b�&&?z����ЈdLAa��z��0,Yarm���k7vǘ1���ȏ)�p$�dJ��3��f�H��.3$!��0y��a7�pCަ8���7�=�0lT�RM(�p����6,qv
��jc)P8,1 $M��@(zȈd<:�F�}	�5�k~��� wt�8���V��!��p��$%�#�Y���;x�f� �� �9�L�-dρ�yD�(אM�~�c!���P;4�~�`�\A6����գ��T��*K�| �(�lK~RzE�d/�R�u.g���1�A_��Y�2�b���������"���-cj7-ݾ���ڴ4�o4������p��jy��ۯ���(K�c��������g��ij=oOg[�q��ni5���r%v	�r�uh�U@,� �?�k�3��������î̴��!w�����3v˅#"�z¿��u
�BtS�����Om$�jp2�`�$������4\�~�����+��\�"���ρ�<P�y���H3,>�&��߶%R/���@w���t����,��A��@��!P�����c�iH�΄���0�ѐ�WS�?���"]+���4���*C�u�%�9�<���'�p�0����,�P>.�y�y�v�e�[��S����_G�J�XI\���	Pm�����x������!�{yr�S��R��L�p�x;����<V)�.X�JP0���U�q�p��`�W�v��π�&W��r	��^(��3ۭ?���J;[�>��a�P|�U���]a9|�F=�kؙC��A�ܰ����������-�m[p-�M�}j�VGh����������`��]Q���v�;����Ke�u�~?}#����᪺�_����)`Pw         h	  x��YM�۸=˿7_�-}�6#yfv=3�HN\��DAJ$� ����&��a������ �$H��7��j�d�h4ݯ_CƴݿIk��ʴ����'�T�?�Vg<�~yn������;�N��OS?}ㆋ-1;F�h`$&>R�1�Y3��5�<�?��9��<&R�6V����f2�#&UI�B���^�5\;��\�����r_�Ӑk�4~��7��Dn%_����Z��v��1V�̥dʥ�&�=l���0�I#��v<�BS)����neX���,~�a�>�X}\�����VT�=fv��I`��p�&�\5^�ן}϶�Aq��ʟ��>,��ŊP�p|+��ʈ�m��tb�;�1���V�Ƀ�z*Ó�[�_94�����nG'�?r&\�(rKc����y�9~�'�3��J~c����/��U�k�_���6��c�W#Ԋ)��mF+��i\cS��i�1�J��M���,�?��LI�+oW<����^�k�0fB֚*����T%~F�uŤ=�
��#���v����)UX)����~���%����J�� Vɽ:�.B*�z��C�s�6�kT��v�dݜ�/��9EɳWge�!����aOt�r+�^'!�Z"��Vˤݮ����/�f��}�XXwn@�i�앪=�1��V}uJ:5Q����i��7;���L�t�ꀣ;�!�G���;�������9��2��3�5��3�Y��/���<���F⇏.ieZ$r��x T��� ���ն�Py��?�m#�uǾ#���{M���� MEu|;P��N��֣��i��\#��u ���Z�Un)����w~w-�2�Z��+䫫#�W�b���ːk�(���̶ {� 
0��{�r����,(_i��C�������usM_��|2�̷������Wʪ2,�	I�b���-��B�I�LKs�ݺC���ا_�?3! aO�Z�pM�fMb���bfԳ�����c�#�&�=A�j$VM���LшV6��#PeQ#:'u��8ї���e�W�{��﷫���Sf)�,�i>�g���ʜ����5uke͚:~aA�e��X#�M�ԅ��ne@�w+���W��g?�*1����jS�U�s���,4���'/.��Ag��љu~|/SG���ix�\���+�Ȝ@�N�Ɂ��/WU� d��{v�s�xZG��h���Z��9�`9�ZS'ujFc8�\/�#�d��g�skmOjyH�ŖѴ�>���� �[X`,w@��>%��E9.7������س��fN������^�g��ȃ#���n6��j��^)�ԕ��e�<X���I����^�(Dv:��M"��$�F�ȩ|��;�@���v�oO)�Y�?�W����KL��E"/5��#��6�g�y.-�u+ڲ8_"z�A3��l�>��űF;�~̃)
��L׉��;��8�bߒe�Z�Cc?�PX�<R�認�oז�ڋ�5"�Ġ�Yn�� 	����.�ƴ��]k�f�,Gn�͆����la�W�F�2��˵q�u�\[ïWF�c!cIS��������KEzC��ƛ0ر���c��J���������}\H$x��]lާ_5f�N6[�|�V�`��c�F�]T{���/�D��BD����������fX�ݐ��4����)��qT�,1(�����j�v��h�q�����W�i�y� .��yP����)F��A[P�Vܠifb�<�Q��{GY��1fS����[�sI�I��9�{�b=u�ะF�k���_�( u�\��H�N��\Mц|{WxPrͷ�`�%ͧ���8��������w��mE��6\��w~3�����&��{��/����5��	�N��d\.L��*��i<pM���ve�?��Y2L�_�I4��(��Y,���s���R}�4�ɸW�|�J�c���ӱO�>�`G]H]��\j<�=�������Ѷ�6����ȟc���e ��ί|�qJ�c�����r����NaA�\~��4�׆l�tϮ)ƣ�*J�CO"4J"i��\c��|�W�d>���_��O 5)��_!S�F�׊t*����!NY}��6�ϯ�r�~o��+�	˴qذC_*L�t-?>�S[�|c*Y7�S��h[�g�E�ݩ����#���z�ZaR�EG�����~#p�'ļ���Ҙw����)b�.�K�u"S����I�ɧ��=�@6~��h1�W��A��O���OJ�qa�w�\�V����s{��6�j$([7��Xeq�i�i� /�������;�r~u�_;��Sq\Jᨤ�](p��,�D�� U�N�5"���&�߸����y�i��ڟ�Nh���N�|���X��ݻw� ��9         V  x�u��m1��b�6�
�Brr���6����� 4z�^��<��������u���'�;O�.�p��'��kZx-���O^�3��w��=��yz�0S[�@�7৯͡��'�>�>��_���W�W�W|_I��+��d̐w�8�*��c��K{����9}#]>��W{���o�k�|U{�/_�|���v�ڿ��:�:쯃��<�A߿����c��-������\�#ߚ�K��
��}��������U��˜�.�_���78�&�����0��\�*��y.���������������������{�>��S/�         w  x�U�Qv$!E����)71+�2z�'`�/��#�<�����'�Z-�ߞZjY��K��I�{��7a���������R2J/�>�ٳ�,���M�NB=a��և��I}ǟ��<h���F�}.�O�
*�V���+�<i�n!�K[�ĕx@/�F|�'zHп�վ��k��Aj���q�[@��`v�W�$�v������^Z
�nMW�.�%�v��趡9�����FΌk�aP�ڵS$��a5�u�{X��veK�:Ю��āv�g� �.�qj��4N�vi;�-@�pGfyr#�T(�0�T���_s/PKP�U�ڥ�` Z�մO�viO�.�G��K� ڥ�`@�z�ƀڵ����]+�����t�1��P�ymʀz�uM�Gx�+1�v���M��s�M�gxMc'�souV�z��X:��}T�z^k=����8���蹽�M
�\�)���7���kڤPk��C�����`�\ע����I��W�­1�d`����1�u��eP[�xZg`[�����v^Z��	�#���L����@3�m��'AmzNǂ�������4X`�0�
�:�6u��zm��$��m�{ɵv�f���^����C��x����ǐ?�I����g�'������z���w         ,  x�]T[r#1�����]���%���-�H__�~���R����eo]�y��jĀoā�
�F��9�P,:I������!8K��U�drP�фHP+z:�7/��2�V�����%̆M�1/2���>�ycO~L<�M��l%�p�"P6�F�r��F�?JL��g�ة9��!(�e�epV�!}�lhG`����3�le�A�����,��I��g����Q�ڟY��gTN�ؙ�(jɔ�LF�.�k}�yo��"a�bi����~����� ��e���i������ȳg����U8�U
��T��['-�rЛ����#Kq��$�ZQ}�V;��>{៖�5���ٮ�?��Q-<�p�Bg�T��YÒ"P�-���L�r�:�9�$��3%Y*��7m�u�L��u�K5r��?��ԉ�ֺP�ֺՁ��vuf\����Y3ƱؗE��!��}�h���|�R~̓z�jfaׯ���yk��w����5��D��N��ZJ��s��)w�gj=u<=�b��U2�?�>"�|�_�����_��7��R�     