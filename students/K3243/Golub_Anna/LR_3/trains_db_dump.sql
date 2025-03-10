PGDMP                         y            db    13.2    13.2 &    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    db    DATABASE     _   CREATE DATABASE db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE db;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    16428    carriage    TABLE     *  CREATE TABLE public.carriage (
    id_carriage integer NOT NULL,
    type character varying(20) NOT NULL,
    seats_number integer NOT NULL,
    id_train integer NOT NULL,
    CONSTRAINT carriage_id_carriage_check CHECK ((id_carriage >= 0)),
    CONSTRAINT carriage_seats_number_check CHECK ((seats_number >= 0)),
    CONSTRAINT carriage_type_check CHECK ((((type)::text = 'сидячий'::text) OR ((type)::text = 'плацкарт'::text) OR ((type)::text = 'купе'::text) OR ((type)::text = 'СВ'::text) OR ((type)::text = 'люкс'::text)))
);
    DROP TABLE public.carriage;
       public         heap    postgres    false    3            �            1259    16448    destination    TABLE     �   CREATE TABLE public.destination (
    id_destination integer NOT NULL,
    name character varying(200) NOT NULL,
    arrival timestamp without time zone NOT NULL,
    CONSTRAINT destination_id_destination_check CHECK ((id_destination >= 0))
);
    DROP TABLE public.destination;
       public         heap    postgres    false    3            �            1259    16420 	   passenger    TABLE     W  CREATE TABLE public.passenger (
    id_passenger integer NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(20) NOT NULL,
    patronim character varying(20),
    passport bigint NOT NULL,
    CONSTRAINT passenger_passport_check CHECK (((passport >= 1000000000) AND (passport <= '9999999999'::bigint)))
);
    DROP TABLE public.passenger;
       public         heap    postgres    false    3            �            1259    16438    seat    TABLE     �  CREATE TABLE public.seat (
    id_seat integer NOT NULL,
    type character varying(20) NOT NULL,
    id_carriage integer NOT NULL,
    number integer NOT NULL,
    CONSTRAINT seat_id_seat_check CHECK ((id_seat >= 0)),
    CONSTRAINT seat_number_check CHECK ((number >= 0)),
    CONSTRAINT seat_type_check CHECK ((((type)::text = 'сидячее'::text) OR ((type)::text = 'верхнее'::text) OR ((type)::text = 'нижнее'::text) OR ((type)::text = 'боковое'::text)))
);
    DROP TABLE public.seat;
       public         heap    postgres    false    3            �            1259    16453    ticket    TABLE       CREATE TABLE public.ticket (
    id_ticket integer NOT NULL,
    price integer NOT NULL,
    id_seat integer NOT NULL,
    id_destination integer NOT NULL,
    CONSTRAINT ticket_id_ticket_check CHECK ((id_ticket >= 0)),
    CONSTRAINT ticket_price_check CHECK ((price >= 0))
);
    DROP TABLE public.ticket;
       public         heap    postgres    false    3            �            1259    16488    ticket_passenger    TABLE     �   CREATE TABLE public.ticket_passenger (
    id_ticket_passenger integer NOT NULL,
    id_ticket integer NOT NULL,
    id_passenger integer NOT NULL
);
 $   DROP TABLE public.ticket_passenger;
       public         heap    postgres    false    3            �            1259    16423    train    TABLE     G  CREATE TABLE public.train (
    id_train integer NOT NULL,
    type character varying(20) NOT NULL,
    train_name character(50) NOT NULL,
    departure timestamp without time zone NOT NULL,
    arrival timestamp without time zone NOT NULL,
    destination character varying(200) NOT NULL,
    CONSTRAINT train_id_train_check CHECK ((id_train >= 0)),
    CONSTRAINT train_type_check CHECK ((((type)::text = 'скоростной'::text) OR ((type)::text = 'фирменный'::text) OR ((type)::text = 'пассажирский'::text) OR ((type)::text = 'скорый'::text)))
);
    DROP TABLE public.train;
       public         heap    postgres    false    3            �            1259    16510    waypoint    TABLE     ]  CREATE TABLE public.waypoint (
    id_waypoint integer NOT NULL,
    id_destination integer NOT NULL,
    id_train integer NOT NULL,
    name character varying(200) NOT NULL,
    arrival timestamp without time zone NOT NULL,
    departure timestamp without time zone NOT NULL,
    CONSTRAINT waypoint_id_waypoint_check CHECK ((id_waypoint >= 0))
);
    DROP TABLE public.waypoint;
       public         heap    postgres    false    3            �          0    16428    carriage 
   TABLE DATA           M   COPY public.carriage (id_carriage, type, seats_number, id_train) FROM stdin;
    public          postgres    false    202   c3       �          0    16448    destination 
   TABLE DATA           D   COPY public.destination (id_destination, name, arrival) FROM stdin;
    public          postgres    false    204   �3       �          0    16420 	   passenger 
   TABLE DATA           \   COPY public.passenger (id_passenger, last_name, first_name, patronim, passport) FROM stdin;
    public          postgres    false    200   94       �          0    16438    seat 
   TABLE DATA           B   COPY public.seat (id_seat, type, id_carriage, number) FROM stdin;
    public          postgres    false    203   �4       �          0    16453    ticket 
   TABLE DATA           K   COPY public.ticket (id_ticket, price, id_seat, id_destination) FROM stdin;
    public          postgres    false    205   '5       �          0    16488    ticket_passenger 
   TABLE DATA           X   COPY public.ticket_passenger (id_ticket_passenger, id_ticket, id_passenger) FROM stdin;
    public          postgres    false    206   a5       �          0    16423    train 
   TABLE DATA           \   COPY public.train (id_train, type, train_name, departure, arrival, destination) FROM stdin;
    public          postgres    false    201   �5       �          0    16510    waypoint 
   TABLE DATA           c   COPY public.waypoint (id_waypoint, id_destination, id_train, name, arrival, departure) FROM stdin;
    public          postgres    false    207   _6       N           2606    16432    carriage Carriage_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.carriage
    ADD CONSTRAINT "Carriage_pkey" PRIMARY KEY (id_carriage);
 B   ALTER TABLE ONLY public.carriage DROP CONSTRAINT "Carriage_pkey";
       public            postgres    false    202            R           2606    16452    destination Destination_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.destination
    ADD CONSTRAINT "Destination_pkey" PRIMARY KEY (id_destination);
 H   ALTER TABLE ONLY public.destination DROP CONSTRAINT "Destination_pkey";
       public            postgres    false    204            J           2606    16504    passenger Passenger_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.passenger
    ADD CONSTRAINT "Passenger_pkey" PRIMARY KEY (id_passenger);
 D   ALTER TABLE ONLY public.passenger DROP CONSTRAINT "Passenger_pkey";
       public            postgres    false    200            P           2606    16442    seat Seat_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.seat
    ADD CONSTRAINT "Seat_pkey" PRIMARY KEY (id_seat);
 :   ALTER TABLE ONLY public.seat DROP CONSTRAINT "Seat_pkey";
       public            postgres    false    203            V           2606    16492 &   ticket_passenger Ticket_Passenger_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.ticket_passenger
    ADD CONSTRAINT "Ticket_Passenger_pkey" PRIMARY KEY (id_ticket_passenger);
 R   ALTER TABLE ONLY public.ticket_passenger DROP CONSTRAINT "Ticket_Passenger_pkey";
       public            postgres    false    206            T           2606    16457    ticket Ticket_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT "Ticket_pkey" PRIMARY KEY (id_ticket);
 >   ALTER TABLE ONLY public.ticket DROP CONSTRAINT "Ticket_pkey";
       public            postgres    false    205            L           2606    16427    train Train_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.train
    ADD CONSTRAINT "Train_pkey" PRIMARY KEY (id_train);
 <   ALTER TABLE ONLY public.train DROP CONSTRAINT "Train_pkey";
       public            postgres    false    201            X           2606    16514    waypoint Waypoint_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.waypoint
    ADD CONSTRAINT "Waypoint_pkey" PRIMARY KEY (id_waypoint);
 B   ALTER TABLE ONLY public.waypoint DROP CONSTRAINT "Waypoint_pkey";
       public            postgres    false    207            Y           2606    16433    carriage Carriage_id_train_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carriage
    ADD CONSTRAINT "Carriage_id_train_fkey" FOREIGN KEY (id_train) REFERENCES public.train(id_train);
 K   ALTER TABLE ONLY public.carriage DROP CONSTRAINT "Carriage_id_train_fkey";
       public          postgres    false    202    2892    201            Z           2606    16443    seat Seat_id_carriage_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.seat
    ADD CONSTRAINT "Seat_id_carriage_fkey" FOREIGN KEY (id_carriage) REFERENCES public.carriage(id_carriage);
 F   ALTER TABLE ONLY public.seat DROP CONSTRAINT "Seat_id_carriage_fkey";
       public          postgres    false    2894    202    203            ^           2606    16505 3   ticket_passenger Ticket_Passenger_id_passenger_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket_passenger
    ADD CONSTRAINT "Ticket_Passenger_id_passenger_fkey" FOREIGN KEY (id_passenger) REFERENCES public.passenger(id_passenger) NOT VALID;
 _   ALTER TABLE ONLY public.ticket_passenger DROP CONSTRAINT "Ticket_Passenger_id_passenger_fkey";
       public          postgres    false    200    206    2890            ]           2606    16493 0   ticket_passenger Ticket_Passenger_id_ticket_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket_passenger
    ADD CONSTRAINT "Ticket_Passenger_id_ticket_fkey" FOREIGN KEY (id_ticket) REFERENCES public.ticket(id_ticket);
 \   ALTER TABLE ONLY public.ticket_passenger DROP CONSTRAINT "Ticket_Passenger_id_ticket_fkey";
       public          postgres    false    205    2900    206            \           2606    16463 !   ticket Ticket_id_destination_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT "Ticket_id_destination_fkey" FOREIGN KEY (id_destination) REFERENCES public.destination(id_destination);
 M   ALTER TABLE ONLY public.ticket DROP CONSTRAINT "Ticket_id_destination_fkey";
       public          postgres    false    205    204    2898            [           2606    16458    ticket Ticket_id_seat_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT "Ticket_id_seat_fkey" FOREIGN KEY (id_seat) REFERENCES public.seat(id_seat);
 F   ALTER TABLE ONLY public.ticket DROP CONSTRAINT "Ticket_id_seat_fkey";
       public          postgres    false    203    205    2896            _           2606    16515 %   waypoint Waypoint_id_destination_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waypoint
    ADD CONSTRAINT "Waypoint_id_destination_fkey" FOREIGN KEY (id_destination) REFERENCES public.destination(id_destination);
 Q   ALTER TABLE ONLY public.waypoint DROP CONSTRAINT "Waypoint_id_destination_fkey";
       public          postgres    false    207    204    2898            `           2606    16520    waypoint Waypoint_id_train_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waypoint
    ADD CONSTRAINT "Waypoint_id_train_fkey" FOREIGN KEY (id_train) REFERENCES public.train(id_train);
 K   ALTER TABLE ONLY public.waypoint DROP CONSTRAINT "Waypoint_id_train_fkey";
       public          postgres    false    207    2892    201            �   J   x�3估���.�]�$.6q�pqq^l�����ہ�NNsSNC.c��.6ul�41�4����� �t2      �   l   x�3�0�¾��v]�ta����������������qq^�{aǅm�ɝ
@�>���@]@��#K+S#�c�/l *�p�	�E����l�=... ²4�      �   �   x�]NK�P\��!>��x`Æ��1Q�J�G�
�94lt�h;ә4���u���xl��喺��8�)84�TS,w^�Y�(���VY����'%vh"���0a�u4���ڽO�/��$=G���s�      �   F   x�3估�¾��xo�4�46�2��xaǅ-�/�_�
5�44�2漰(�H�Č9���b���� h!�      �   *   x�Ʊ 0��&g��0��X���&
�6X%ݖ�Ih{,      �      x�3�4�4�2�4�4�2�4�4����� !��      �   �   x���K�0�u{�^ ӎb(g�0bܹs�1ޠ�HQ�+���Sp!�i�>��oD(�Dּ��A���-9�j���$z��L�4ך�f�5b?�|��$��	o<P�]$�Y��n
�G`��F�J�<�Np�G��<*ś�)�>��\���Dbe�uZ�gs�%��eǙ��tiN4�-s��n�\ͤ����b      �   �   x�]�A
�0E��)r���$U��x���B(t)�<A(����Ȍ�V�����������Jo�sj3�?�*��l8����c���VA�]���bic��l8V��}m�����
���R�h�n�P.;�     