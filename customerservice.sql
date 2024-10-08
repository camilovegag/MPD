PGDMP     	    
        	        y            customerservice    13.1    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    customerservice    DATABASE     n   CREATE DATABASE customerservice WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE customerservice;
                postgres    false            �            1259    16434    cs_customer_calls    TABLE     �   CREATE TABLE public.cs_customer_calls (
    employeenumber integer NOT NULL,
    customernumber integer NOT NULL,
    productcode character varying(15) NOT NULL,
    text character varying(200),
    date timestamp(6) without time zone NOT NULL
);
 %   DROP TABLE public.cs_customer_calls;
       public         heap    postgres    false            �            1259    16419    cs_customer_products    TABLE     �   CREATE TABLE public.cs_customer_products (
    customernumber integer NOT NULL,
    productcode character varying(15) NOT NULL
);
 (   DROP TABLE public.cs_customer_products;
       public         heap    postgres    false            �            1259    16398    cs_customers    TABLE     �  CREATE TABLE public.cs_customers (
    customernumber integer NOT NULL,
    contactlastname character varying(50),
    contactfirstname character varying(50),
    phone character varying(50),
    addressline1 character varying(50),
    addressline2 character varying(50),
    city character varying(50),
    state character varying(50),
    postalcode character varying(15),
    country character varying(50)
);
     DROP TABLE public.cs_customers;
       public         heap    postgres    false            �            1259    16414    cs_employees    TABLE     �   CREATE TABLE public.cs_employees (
    employeenumber integer NOT NULL,
    lastname character varying(50),
    firstname character varying(50),
    email character varying(100)
);
     DROP TABLE public.cs_employees;
       public         heap    postgres    false            �            1259    16404    cs_products    TABLE     �   CREATE TABLE public.cs_products (
    productcode character varying(15) NOT NULL,
    productname character varying(70),
    productscale character varying(10),
    productvendor character varying(50),
    productdescription text
);
    DROP TABLE public.cs_products;
       public         heap    postgres    false            �          0    16434    cs_customer_calls 
   TABLE DATA           d   COPY public.cs_customer_calls (employeenumber, customernumber, productcode, text, date) FROM stdin;
    public          postgres    false    204   \       �          0    16419    cs_customer_products 
   TABLE DATA           K   COPY public.cs_customer_products (customernumber, productcode) FROM stdin;
    public          postgres    false    203   +       �          0    16398    cs_customers 
   TABLE DATA           �   COPY public.cs_customers (customernumber, contactlastname, contactfirstname, phone, addressline1, addressline2, city, state, postalcode, country) FROM stdin;
    public          postgres    false    200   �,       �          0    16414    cs_employees 
   TABLE DATA           R   COPY public.cs_employees (employeenumber, lastname, firstname, email) FROM stdin;
    public          postgres    false    202   ,A       �          0    16404    cs_products 
   TABLE DATA           p   COPY public.cs_products (productcode, productname, productscale, productvendor, productdescription) FROM stdin;
    public          postgres    false    201   <C       8           2606    16423 ,   cs_customer_products cs_customer_products_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.cs_customer_products
    ADD CONSTRAINT cs_customer_products_pk PRIMARY KEY (customernumber, productcode);
 V   ALTER TABLE ONLY public.cs_customer_products DROP CONSTRAINT cs_customer_products_pk;
       public            postgres    false    203    203            2           2606    16402    cs_customers cs_customers_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.cs_customers
    ADD CONSTRAINT cs_customers_pk PRIMARY KEY (customernumber);
 F   ALTER TABLE ONLY public.cs_customers DROP CONSTRAINT cs_customers_pk;
       public            postgres    false    200            6           2606    16418    cs_employees cs_employees_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.cs_employees
    ADD CONSTRAINT cs_employees_pk PRIMARY KEY (employeenumber);
 F   ALTER TABLE ONLY public.cs_employees DROP CONSTRAINT cs_employees_pk;
       public            postgres    false    202            4           2606    16411    cs_products cs_products_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.cs_products
    ADD CONSTRAINT cs_products_pk PRIMARY KEY (productcode);
 D   ALTER TABLE ONLY public.cs_products DROP CONSTRAINT cs_products_pk;
       public            postgres    false    201            <           2606    16442 '   cs_customer_calls cs_customer_calls_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.cs_customer_calls
    ADD CONSTRAINT cs_customer_calls_fk1 FOREIGN KEY (customernumber) REFERENCES public.cs_customers(customernumber);
 Q   ALTER TABLE ONLY public.cs_customer_calls DROP CONSTRAINT cs_customer_calls_fk1;
       public          postgres    false    204    200    2866            ;           2606    16437 '   cs_customer_calls cs_customer_calls_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.cs_customer_calls
    ADD CONSTRAINT cs_customer_calls_fk2 FOREIGN KEY (employeenumber) REFERENCES public.cs_employees(employeenumber);
 Q   ALTER TABLE ONLY public.cs_customer_calls DROP CONSTRAINT cs_customer_calls_fk2;
       public          postgres    false    202    2870    204            =           2606    16447 '   cs_customer_calls cs_customer_calls_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.cs_customer_calls
    ADD CONSTRAINT cs_customer_calls_fk3 FOREIGN KEY (productcode) REFERENCES public.cs_products(productcode);
 Q   ALTER TABLE ONLY public.cs_customer_calls DROP CONSTRAINT cs_customer_calls_fk3;
       public          postgres    false    2868    204    201            9           2606    16424 -   cs_customer_products cs_customer_products_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.cs_customer_products
    ADD CONSTRAINT cs_customer_products_fk1 FOREIGN KEY (customernumber) REFERENCES public.cs_customers(customernumber);
 W   ALTER TABLE ONLY public.cs_customer_products DROP CONSTRAINT cs_customer_products_fk1;
       public          postgres    false    203    200    2866            :           2606    16429 -   cs_customer_products cs_customer_products_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.cs_customer_products
    ADD CONSTRAINT cs_customer_products_fk2 FOREIGN KEY (productcode) REFERENCES public.cs_products(productcode);
 W   ALTER TABLE ONLY public.cs_customer_products DROP CONSTRAINT cs_customer_products_fk2;
       public          postgres    false    203    2868    201            �   �  x��Zێ�F}n�~`�����.``mda$O5j�L-�R[R���K]H��2�L�X���!k��b���-���1�_7��]�i:�yZ����-��u�^�[�Xw?mS1-�^������KU��������|��K]֗/U������;�V�M�m�6w�6:<�}���g�G�����>���y��fmZs���(���2���F_����覽�����h�{�Za��T�@vLW]/��<�;z���s�'�^�hܭ�܎?p��t/�u�?d�A7��|�n���r`c�rL���w0���g�<��>}������T��T����2-�]
���.[a����.7��t�}�|w��=�a�z1`���~����������b� ��xw�ӶY�G:��n�i��f�A�|�}P���|*f�p���=���G��6l>9nt&����Tׁ����>��x�컻�*���S�j�-�ß�@���.�_g< ��l�mZ�/���g�i��CF�ץ����`�u��}E�d*qƠ��# �u�L����s��2y8b ��y��9��-���k��>D����V ��b�2��)������"�Q��\u�������f�}ZQ�PӀ���s���IHuU&3|��a��j	P����4�Tӂw}	��s��O����cȀc��LA=`Tc@C�@M��)b*Ѻ���CL���!���nO�R1�pNd�@@�����es˫�BFZon͈���C�+[��ۊ<��g��g�!�R{�~$V�����RisuWs�5�6�̜���=�x�=��@O��2Ȍ6�Dj $�������F��	����Ip��J\mCm�vۑm�mh'����d��G��Ʃ���p;�<����DlY��.�r�v1-�Lu�������ww؉[3^�~�0�0x9��@ �y�G���.U)챐����/�u +*�	�p_o��eX�㱘(l�T��ܩ�Ujc����ԗ�0��*(0����n�]B�~��^X��P�"��B�R}��2��6���`����7�H��Up�e�W��A��4�LX�`��$�����M��*�c�b�e]RD<D��*C�.�_��j�cb�� �i�9(�}���U�d��qF�D�rɍ0h$��;e�2�zY��/~�ݾ#XG�A�w�i�1��TJ�V�g�C��<`��e��4��U �t��@���Xnc�ӛ���UF��`����^�l�d�(li��M�Zv��v�B�mq貀Uq%�tX�Q�лB^S�UT�Eu��Kv��*#"
@X�^��YlD�k%��&Tҏ��:"y\�@$k�-��#�N�1���Hc��"X���� AI�Q���ݡ����`�?ݻ�{.�e�\��n�������GZSR/�1NX�X���z���~u ��%��W� S�c
ސHo��p���0�+���m�&u�8,�|&i��L���F��7�Z&F+ȡT��$F��"�E�Jؐ��G��L�j�h-U_*�W������ih��=�[�x��bI:=��4)�*�18ꑒIB2�W(u��D,�A5* ���T�Z��X*�wK�N�\����E�;ԚFP�3t3�#xCef��F|k}'Ip���'hDR3wqB��n��H��A�r��+e^s�y&�;�qs��tvwW�2D�;=W�u�)�L������;[��p�n_��,{���X��'+�1��\16�>hV:P9jĉUwεҫ�O�M��L���ӈ<Pۚ���`���XU���bɴ+��@Ei�#\+��$�{<�N��4i�E��=J4"���Y�4esB8��ɇAO�� �~4v	^R1} �f��>�/t`w�����F�+d�Q����=��8�ŦG>χ���;��W�����F;��E�Y1B��Q����O�j�9�M�i71Tq�nc �AYE0��w�H!��X������q�@h�e�6�NL�&�5�I�$&�U�T[��K�TC�=�v.��sm$CĜ�:�Z,+��?d�1�9�U���U��"ɶ�'�D���TAx���_j��7��m��+�CR!Z��d<�PW�3ړ��47y���)f�H	���Х�ju����D�Ϫ'q�l�1ؒ�@�Vu�Ҭ�Ci0Kp3L�A��X�mQ�1�;s�(P��!,w�����>�]RY�F��eGf�յѦ�W��$n��@��x �*�2}m��N�c9�b���I��������Լ�x�s��bVƩ�C�@|1��м������ .f���Z�/y��:8��z��⤈��Ӵ
��j�rÁ����;W���짍��ٺ�N�TR�!��[�,Ը֧
qḲ�f5YT�C�����UwոQ��D��$�^i1Ӟw�pf|\�qU����2&�_����K�JH�H1�"��g���g&�#��x �E�Oa�-末>�[��+%���� P�M$�B�e��)���е����c%��9#9�h�h��?f5�/�g<V���i:2o�U!�I7.��gЃ��=���E14��4'U�� ��(<
Į��;(P�A�kO+c��/�?P��+���"B��x�.�l�-��+j�4�< �B��)L����fc���@#.~�b��}0&�H� &"z��o��,'.V�$mY�f�N-`�R:�P�i91��>㑫����Rl��#�,KN�)AʶD%L���$�Y�|�aSC��?c�x1��m}�ʙ�r�&{����Q�v�Hz)������aI�䰍�	=�I=<�n\qU�Z��I=��g6`T���l����5��g��D*�q*s����Zʆ�ɳ�z57'ފ���0�_C�/�45	�'�;I�/�>�v�<x�u�J�4�_$%��Qr�����ǋx����P��S9�"�Iʦ~��ELN�X/5@��:�c����@�6�j�^q`����c�����9RX�d�:�[��7�����ؒ�\ք��R��?Qf=o���Π~����E��dm���	I���$���I]�[K,��M�*�\��i�}��A��[��k�_1e]�յxb-4bQj�2��Ay ���{�H�z��C�E{�f(�A��^ �*#T�p`���y�V��γ�ӯR!�%\��J@�鷡Z������Ç��q$L      �   �  x�M�ɭ%!E׏`Zx6qԶ��?��
�G�ӵ����E!R@���H$���� �{�֗�ۈ�����m�����X}I�&���âAR�h�h��{�?����{X_j��Xbf�(�s�*��X	�V��r�����	�%�aJ�B��md�&�jWbę}�'���\��<�慉��L�]n��jf��a�C� �#+k�~��sFZ��R�9��M���.����rO9�N��fF�!N��6H�.��lQ@�{/�����c6��.6@�cM������z@n���޳#��)0G3��j�[����j�y��5�k/��6�mrB����w.g3t�5m�(�A�>�/��������ͱ�����N?k��G���}������u� ���m�U���%�G�J��Ih�쀽N�|M}��ڀ�/{�=��hO�R۹)ݧ<J�pH�z>�k;��9���J)��	      �      x��Z�rG�]��"#fawH�+�Z��$J$(���vGo�@H�PE�4���M�Dkы��bbv��97���(��aK^d��yܒ���W׶��Ԯ���h��X�q�b��ם�������������:�"��6�ܾB�W.�GkJ�F��"S�t��Y[W����OMï��4��e*R�e6A���z�5U��mkk)��2�Β���+2vj����MmqSuuiٕ��U�SQ�٤k��� v����;|�)�k&�8��pͅm��+���Sk��߻��N\�6�d�7cQ:�3�q�օ�{��z��K��iFqf��ں�!���YUߛ"jvf���k�I-bʤ�#'i�"�3S�skl�',O�D�Tʘ�;��?���{7`��5v�ُ2�O��tĮ�w�@�{��kS7����H�"���*L�@܌�X���.�;��y��Gܷ��*m��s�)%k}��-�!�b�xo�)�9�v��j�>v��,�#�o���~�HK���\����ֶ��}\3��ݵi��h�N�cRHN��R�&��CX>�ڲ=��!�c"�d�?-pl��-;rvY!i��G(�k�5;��O+�փ�L�g	ř�E��Jf.?�3�D0���萯�U�֕}�K1�+ʚo�m�}��Җ��:�v�}��Qg���ۅ��q��v�mŔ�C�+W�<�g�ڶ/�Iuc˕��~)�<����kDJ�L��������4��*0�OE�����s�-*�/eN36���0%�ۺ�m���u�Ȃ�6;@�>�Y��/'w-䧄_�f��ng��bP�-Q��M�{�D,دU�!��v��
��K���N9t�85�У�����)�}�F.��D ?at�4�~^m�ڪFlR�l�{@҄p-�,��4+���
�[��w�,�эQ����h`6�E�&ɀ[eŮ��>w��c�(᧮D�=�q4��$�WTU�"s(�c/s8�'��N�����)�')W�=
bW�o�	��/�R��p���ִ��g<�P�U�#p�_yTX1)?n�z`�ݹ�4k[�z�EDwϏ�t%;�jeR������C�؇�� �ُ<'#ߑo	����1���O�cʷ�kn*<N�Xu�-M�J��]������[�2�d�����+�5��gb ~IT��1�P�8߇�TRRp4b��Z���)��%vk�?\�|�#���IҘ��)�b�fj�ޱD���+��`����o�C���,-�NX���(�{
�Pj!�4b8S�0|�� �;-}�����B<�G���e<`�9�c&8�0QZr(1JF���7��9?q��;��1k�x��2�@�wx�����Mr��+bd}�q:xCcw���S�_ �	�؂�K$�mˣ͊g�۬�fm���v6u�ڗ_�QEW2�L��=Q:d�±~D�x���xg��-l]��wM@��m(k���C����r��9j�4|D2赊ǉe�c�qT�S�f��s�qwl�gdjΗg���
���m<;���43�E/��R��E��)���Id��n�o����o*e&� ֣��D�=�֖?(��0�*wUUxu�g��SaI�pC��k,İ&�Q�݈����z8�aE�`���]�w\����H#h���7�©[v�F���4Q�<������@���ێ1ب����&�xd���$CŚ�[��p�C�����vĸǙ.WP',�mLc�/@Yey�큲M��M�F�����s�~۲,'Q '	l�+������M�8� Ӑ�]zN��I
�ޛ
�[[m,��q��0^��H}�#3ї:��C|S�cRI'D��O#4��I- ߋڰ��?쵑���~t*�@ޚ�{�/��\��J��h��D���^�A e�I�J=����nY@Z����z�K�`b_,|�IQ5��	}�R9�6���̒*5��N��qro�E(�PQ�$L�LهRW�( � JƋ���,��ZB\�y�[�
ȐI�bPVR)ҐM��� _�TAʇ�ȢX3���"�=5]��{��P��Ϧ`?wT�9;�8TO��R"������M/QSs�u�����䋯�)�O<�r!�qe
OfiB��H�D|�cH{{U��/C�z`�rp� ]K�����?���kP;�%�� $��ـ�!�Ѥ�n�j��'������-�9��-��/��$b��c]�9)�贪k�Οl^�/�k��ެ�6��i`V�F�B:���y����yp�]����1R�l2��H��*0�#��r�p���� ��A�`�p0�ӂXpzG��\�5x���@#\��eP�2}�'�$���F�μPq�=]�貂�u}d��h��&�xOD�[�𶫫;��+L�!)Bf�Y�sv~#��n���h _����JR�W5}`��z����G)��)�I�A��=�ڧ3R��&���z�����̥|ǳ�~��T�"�~��Cf�w������´\{Ě>�/��?eĊ�O�&��� ,�G���<WIP! \>��Ճg�
���hg�E	:9�]㳸��B��.{節)KGX��t�-��C'��|hE֐�J�l|KI��R�����x� 	�5�X��;�u)���sł�d&b~n��������մ�}U-�����2;�P�0*^j�A��W�\�d_1�w����U�&&�Bk8�Ďyq��E�5���P��)uO�(@�p̮}@iIQI(�����(:�Qxi��5M<!,1�-���3 $��/���co*�R�=���Qm���fk�S�d���!��V}�S��O�M�
�nWx�aT�� Bڃ�",��\�����19�i҅�H�����"��7���&���L��^������.��~*훩��B�X_Ac�T��8w�z]�<�i(�������SWt�{њk��J�
�7�H��+�1�~�5Gc] �>V��[�H��*�x��a$:	��K�m4�]ƬŸ���f�\�����2�zEvc�ʆ���w�JF��Q��y �9xWY���$_{`T�ΘW�����g�_s	��IS��_m�������P���s��`�9x��f�yK*1��5%��^��q�bM(���	�f|�D2O�7uo�z�@U�k��?+���&�V����q8$��2�@j�N L�x��:��}�u��])9�Y�0Q�;d��T����<��+�&,+�����ҫ���1n�\��Yt�_Qj2��8�h1�UPO��|Z�4fē�x�m��Y�^�cԞKN�9{{�?���~�·3�H�⹷Uuc@v�|�
w����35�,)�Y��&�,o��)��i�����ކ����_Z�$'C#�;G�����{�g��� ���LÒ]i�d�Q��m�\_�s�x*3���a�˶饚D">��C����KA���R�A�"��MV"}P�Wj����rii���ܗ���O,��i1�`>&�$��� ����\�sb�
uG�_���KS��Gm�6<�k,��ß��O �`�lZ[ X�g1o�N�j:h)��u�[��Ѡ�&77f���G��x�P
��["_*:��n�-8M��kK®�+�io�����P!F0���C�ͧf~B͹#7�4'z��Yj����k��\p�-���
���2,�f���)g������ ��u���[��h���ŰC���J������-QO����=A������%hF�"�ݽ�iV�ag�,�s��`9�Z{�a@�C�a�G~��.�m�\W~-!h�d���Hd���v¤wH���(J=������yϹS��ņJ�Ṑ_H�++ @�r���Q�[hu���J
O����g-ǃ��奫�����kejZ����	�'���<www�,w��R���)�Rсߊ���H�ꗠ9#��0e��~�(��G�@�N�`���CpfZO���	=�~� q�����/)�N{4FGYh!P/)gX! r���X����f��5�6@��D��/������j   ������Ĝ�܆�bpkqD�SEW��+x9��svw�����:�ϊ����zW���]֧�#p,PØ�#b.Z��s:����e����!y�mN�ѐsJ�'�:��Y
?�4�Z�u�&j� �(,���]��~�(��C�ѫ��E�Ca!M��ЩyЩ�^hsCbĳF��&�S.�s� �tD�zcw8�5���1�9�K�?b=6ec�	ߢӮć�_K�g&�(��ę~	�i��8��/֩a��}�����v؅����T:l�R�A����Ժ���=�"}��Zӳ�{T�x҃ ��__.w��^aU/��d ��!d ϵ2�ĈG�t��[�)l��B�ԏ���"g]EZ��H�{����^�B�瀣,��%f�t@��Ku
d�x@>��Ü�@
��aI����Ш�L�4ɏ�@��y����� ���;�� �Z��_��CB�e};T(��֓C��sP����{������ß`H����o(�/�nO*I#�����a�-��"v@W.��t���`�̰����Z:��Pp�h�+W�;X�"�⯔�w-�NbHG���*�h���
��4o��G��R��֒�@��_\���kH|��D}�'�S�9m�������D���;"�ߔ�T��=�B�V9�h�_GQ���l	�V�E�bf��V���
�pq
�<�P�qZ�;��*E;(t�����z��H�j<S5�S��"Qg��w���",��6����J�;�(K����)���$�	�L4n�b�g�w��ly��O#O0�k�#4�� ��yϧ���<O%'�ÒHa� g�}��2�����ه�L#�   ����l�Jf%f��0Uo�򻶙�Bh�hB<��uF�
�`@V\���3�LXΗ����GCD�O�<����%S��f�K��r6���n��?�f9r=B�P)���>~�'���sr����a�T��ބ�|��ߒ�:Gr���M��]��O��aR��X�q���}e��E�_ǯ^��?e��      �      x�uT�nA<c�6���1�@d�H����6�h{g��"�����sعu��؞�jX�E�Z>xH�����}�b(�����ƛ�B�7�o�[>�ں"6\4�P8ph!w��2�#;�����,|`SY̩�"��w˧ؚ�$/��l�����XSM!0��A�u�t���sj��O�[����6\2� �	�;�6��`Wz��`�w�1t؍p�w-����v����-��)/�Cy#2�!���*�3O #�-�*�u>M��2�	~*�0/O�BHuF9�VO����h����ڂ���l�3�6�9����sҙ]���	/�J�&�R���>^Is���0
E� K������ט5z\��X�:0S�EԵ������Ef�#,i�׾lD�@F:������(eC�(���W�>_����Ir�����X����RڨyEu#2�G}C���[�X�q!2���GN�P�]@F�7J�j��
����3�s},�n�]ĊmS�U\a���C���Z!�8      �      x��]�r�F��-?EW�vw���A�ٿt��L��+*vf*U�&�$�hQ��}�}�}����n AJ�;��VMyD�˹|�ڝ���{��Ig�/D���H7"Z'*=������"S���ԅ�r�V�U2�N��X����uD/��^f"�Q���k�l�z�S|%a\L�d.�h>���D��i�e���*�u.4GK�s��V�᩸�K�������Ab��B��Mé��1���O:��P\�i�2�۝�x��,�bc����h�i�Dٝ�2ˢP\�?^�J�N���E�	z����T�Q���4R�(h��U�R��J<yb� Ah���Zn��D��[b��%5���'�C��\�Dz���D�w"��E��+��K���*W�t���j���)x0�թx�w
,Q�d�k0}"�Դ���'1�;��([��0y��S�a1)=��-�>��5�Z,W��̲��y`E��u|��%�E\Ga�'Ef(V������%H5O�;CK�����n@�wb-�����n�8+W��J���.[%�I�"��!~�e΂8i�k"_�vN䫑JXR9"A c�j�_��ɆW��є����$�Ȋ$�z�(�'�}qY�B1�<qQ̝^E��ZnD���'������|,W���dtrA²B��&]�:%ʶ��F�sL��JA&�콋H�rĬu��c��H�EΡ���D���k�;�A0�8���;�w�e+<9�B~�!��
s+)}_�^�Hf�����x�r�gK�d�h�z�D�t-�iU��?b?���"�3�M�R��	֕�aHM`ȇuO�!��Of�[KE kQ��1���1H4z����� �{�C�)Q�w^M#"�#X}K����,��=>:K7��E,�x�F��i�� �Qj�RYf1ܨߊ(U��`s�z�$�Ih�
7w��ʮ��U�QZb��$[�wb����~�nЧL��^ ��y�~Kg��誔�B�Ҏ�;%�,ړ���1}`�B�t<	y�]�U�2Kl�7�i��bBF)�}*Ȇ.0Wz���$�bK���h6��@��a��V�f�6s�V�6�&�6��h�4%�YJ&!��T�r�F�ɘ/.�<�*iwz�y^=��Q���%mv_Ao�v��E��S"7&��[f�Q�ו'h�V�N���6��/�4-�����[;P͋��6�@���|�o�r���� �2hC��
5�}Cxqi��X7g�f �vz��_��Xֵr�[HT�+��A�z��x�:Ŗ��V��I��h�䙧��v�Fv��>���$� Q���B����?b�L5�,�}�1-���T���s��X�t �L��c [@V�+�[x����r����ږ6�b+�Z�0H��kV�74�����pE{1*b�h�mh��q����s��]*��c�䍍�q��p!F]��n��l��h�eZ#�1"��`y֪x��%����b>w�_:���h��L���>�f���q-I�.���w�f���ת�N�[Z�����6�=�E��JxF�|����i
����:�aiq;1������"�oc�we�C/���ض@�F�g�`v�rːY��b�ܢ$�5��Η5AyY���u�yi � Bby�َ�u(�!�!�|S|��N��"�����3D
D��{����}Hu$I��t�=O(��uȾ�tB�%^O�MH��Q�P��"B� *�MM,�q1����"�Ƹ֩� ���)	P����k#Ǌ�%���]kkGXdx8����5��;`b�O|��Z�m���Jα���;�mxz�Q�9a���뚡�8���A#�i��	�S���FL��X(y�i��h�;�����v�Х�����r�ۄ�Ęy*W�ȭ��u3@LT�3�)��>*I���
'&��c���(��
�cf ����(�4�4����a�ϐ�Z���@i5�.�!�؇hU�ԌlR�29&�"�-5@R�BEsK��QʣE#����o�k�۬�͠G�ǀ�l&�z|{f�Ԓb��8����<LfQ�_#���o�`oeA>#�7��Kޛ�5	�
[��x#�?�����9��?O�Ь�sF��MLag��`=[̝���p���֍�ЊwH߲J�Ԑ�11@{�x�W��i*�H�J>j�����k�C�sq���<�����aw�������^��mbP@��b��A�H���sv�km3μ8�w�����H�t�����s��o�:�*���-��a�}Ķ�u�)(�^��$��HT=ao�m�`�7��c������̆��/�naulV�zg.�tN��L���?&��s՞��㜊�����l<�<п?8y��L���
>�L��s��?P~o%�� 
�*ƦhI�d��r���.��X�Z�!�c��`�;��<�.� �����qB1�v'�]3�����}*��NoZى(�����h�W�s���yL*�"��T�S�ᙁb|��,2@�uٶ�GSg4r���r/ZW�f�>"@kRD��h��T�s�ޫ�O�d&6'��Q�ev�U[���e���UEo��DY_ۀ~��4}��^:6��j�|�]��RɸH��jTN�����t�C�1)�ΐ��I�(�!��M���@a�05�*3=��mHd�"�����,[2���^ �ÊU+�!����p��j������9+�hEm
/A&��B/)ɠᦚǚB�`����uŵ�Ÿ��=0�:�7P��M��d+�/�����s����i2��Sn)��u�$��B�t��s��&���=��E� �c��ې])�l
^�A��Վe���I"� #8� ��s�|=��N�m��F˩���z��se��@�R���;��U�^ؖ0��/J�oE2-�,�x��X�gO������h�c#�X�̭Ѧ��3M]p�Ώ@!�P���:ڦ�8���E��JtDv�0�r��g?(b�D\���%�.K�W�0�b���#�5��G��5�+yK�&�:�w���8���^2'���OŷIE�Z�Pfʥ���\�v=p�v<Z�Be�}O�K�#�H}���^&ι��J���K����\Q����.D~���L�x��{o��۳����ه�*�bM޿�/�
�)+9TqJ�M�����v��m8?��7)=r�۱���1����FqoX*�4j�FН"&+��b0�pBT���V^U?#{���0pE{'Q{�`՞Zg51N;����vFg���j�c��NAv�"[�N�- ���,�wX.�Lt{����{EZ��m	]˕�k�F�-q4Ȅ���%0��}Z+�xM��1ݦ�����͎��n2R�ҽ������Յ9�#��;���u".d���ȗ���5w;l��ua�r��as*��$v[V��k�yz�&�)�������/�6��D�q�M�A���6y�@��q4�ۈb]�so��2�f{J|�9@�`��=Eb���>q�����=]��~߆�d�_����8�!�&Vri��t�d�� K���+�׀��3��K4ֆ�X�$V���>M���%iŋ��醲*3�3
�q��~�VZz��ɻv�Ӿ�$�~��^ɬ��x7�6�!]�"��7�߫)���w	"�X���>f��M`�B�ܔ�hH�ٜY���Ef�}��J�� 2��������w�Y6v!�l�W/ŵ��a8���h���3ͱ� .j�␛�[M)�2�\����N̜�����ۖm��_q���{�V=�S��0��X��*�%�S���mW �"�E��u~+����n�V���fd�װ��B%�E��`w�Y�;��5{�K�h�K�����i�k�{����W2\��VU�D��N����m�^�<��6�p���n`x��|ܻ�Ʌ��[�6��m���ݤ{ݧK#��㭱}e*ꕥ�+�e~w�zV��t=����ʥ\H#�\˼y�;��y�D�?ñ	�RǎN�&:ݾ9 ra��N�+��Zƹ�CZ�X��Gq���e�S阭�k�[�c�ob7ɘj���DBOn��9�9�q�-�\zC����j�����(B��{J��Wh�h �  �n��j�sv�U���w��
���$������{�]�}�~G��6��Q}؃���9��X��ӳ��sN�K���w�N�G��Ω�y�r��dm��5�Fz�GN*Ԁ-�[�f��sM��R�y	��������.�F#�9����s5��ނ���'��U'M���7Ƥ/�\�l��q�R��X;X�~��ʠ�^�*��%��#��zLb=f���h����	t62�v���O�j�������rv�a�_��M�+�Tp���X�����0��s�f���ꉶ�͊�mOε�`��H�V([�*�Bc���Ʃ�[7�,���B#���L��6+R�\�1� �����1Kh����}���@FȻx3���Å�C��6j����9��9�N夁��\��x �l$�G��K'~Ze�6����?0E{�a�\-���)�Ќ�G,�a[�	odRA�F��Uu~�x��FJ�&��z�Џ��elc��I�U\P���o�gV=/��]�5�%�͡��p��Iv�1�f��ܞ\%(OՂ�	�y*���t�č��q^�h�	�'I�S\Πχ�/3�o��R��dG�
U��?�̫�aD=�(Ӂ�s�!*���e�g;׾i�U��?���6�vDө�A� �eR�O~Cw�=j^=���S፭[齊�5��J]*��mj �������nٲ�=�N�7�⚫�3qK����c�Rܩ���S~ �<^$��J�kz�h-���q^��5�̶Vns�U	rű�(�#4�������)@�{��[H'�׉i�[p���umK���/�0Q:}z��p�r�R���K�8&��\��	���Ze1��Q���ܘ��lYMG m����jgKE��R�ͱ����ۃi��j�b<A/0�C�&����|Lʫfҿ�I�mN�	U_�#���5�X����� \c���-͂ 04�]P�`s�J����ZC��hC�~9۬����h ί?�>�#����~q��m�p���f�^����&�j���9l��B�:�>I���?�x� <��~Rr�e�<b%SKi�m�����U=�i+�LEq+���X+���e�%�JC`��l"���0٣慐ŝ��v����`h+�)�1[ �6��突�̞�>~Kñl3Ǩ;���I�/j3�t���=o���TM�m��2���[`�wf���,\�u����kh�)���o�\n���4)�������jѥ�Nf� p��t{����2.)����m��/r�Hϣ�:��]Ϻ��2�3F&��B���aug��}�|#��2�WLm3}���Q{|�D�[��q��;r���vٯN�m.�6w����)��zK�?�&fq��"�	���Vd��L�Ѵ�@W5pw�2d��#����m�&獻Ĵ,/[1ۢ������3�nC��8�$�N� HdeȆi�+��XH����SÌ^'0�#��P�TGdE`��PZV��)sϚ���ym�R�_"�h�=�Wv�(r�ម��yqcמ?��qsd �mst�/�I,9f��.uy��7�Bĝc��H[&���� ����b�MtXڿ�%��sM]�6{�Ɩ����q�1T}���ߝ��#�Nw�w͌�b�<.T�32x���Gos=�ݎ�<�+)޷��m	���t�fq�����VZ;�z�*�9+�(ֲ�J�=t��y$Mg��1�قM���Ռ[���P�vB��W뙆3�Ρ�pK��+'��>��k�[��d��UjO7Q�r!}2�&Q\��9E�T�@�,�n�����X�"g�J���a�9)}xx�����mΗ'�T6�I�G�	�D�6o���]���5C3��d��[rs�&P�����Q{χU��99(���U��jE�me�_���ߔ%Y>��M5�E�M�����������\$��n�1�������a���s��ͼɠ�w�%>��'^��ޠ�o��y�E=-��{���8P��j�w+k~�㱬��8􂼭(/ش��ʮf���	���*�^ ���瀎oM�Ş���l=?�-�J�u��n�|/�V�*<�jR6�ssQ�Қc���;�JR��>�d1m�f]p��n�^9آ�Ao�7�{,�L7���)ra�h�ݮ�Ψ�~�C-��~��-ѵ�8�n�.*�ʔ�/�MJV��E�pr��K��i��U�� ��A��n����6�;i�2ח�Ng��!ly���%��G�$I�����ɹV����]�L�e��s�Ĝ]��cO��*�Enf{��;���V!�T�i�܅�<���d����'{���M�|�L�����7� z�w�$�CG�;r��r��
��)�?~��!���q����ܑ�c��/]�ޭ/����W�i�U��{�7b���]�ѱ�����O���r��|�N�Oja>G�����~TP���w�:=ֳ���.]�g���'�����/��BnT�(��cN�6]��Gl�!��������l,S���S3k��\L{S��U@O���F��X)�(�\���\=X��+|R��u�ە��~�o!�<�oO��5ܤ�0S�)���2�m$�<�Y������Da�|�"�җ���;Nѥy��M�@{@h^�y���_�|3�}������ěkr[��"@�,�L���f�><���)lGRf$��Eʱ`U0�ԑ����L����,�)v�N���5�p�zD�ȤM���-YLCȩ���ps}΍2f��A������<1�5�;Ԋ���K�Rx����~�*�Q_ܘ�]�<qH���=��/Q�%��8
�i�+5�R��;�&Q�.m���g��L�u����d��pY�q����|˙�jR����zȌ6���'A�!�N'���F���@�;x���9 ��~�������Ϥ6�Y�����kZuV�t�[w�&��Xi*��YY���+ݾמ*2�x,���BZ��o	?LM��v�ʉ�P��R('�����j���f�r�k��I��ݑ|���g��G6�}     