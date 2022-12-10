#  c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Marko\Desktop\jp27\rad\ribnjak.sql

drop database if exists ribnjak;
create database ribnjak default charset utf8;
use ribnjak;
create table ribolovac (
   sifra int not null primary key auto_increment,
   broj_ribolovaca int not null,
   broj_stapova int not null,
   ime varchar(50) not null,
   prezime varchar(50) not null,
   kontakt varchar(50) not null
);
create table posjeta (
    sifra int not null primary key auto_increment,
    ukupna_cijena decimal(18,2) not null,
    datum_dolaska datetime,
    datum_odlaska datetime,
    mjesto int not null,
    ribolovac int not null
);
create table mjesto (
    sifra int not null primary key auto_increment,
    lokacija boolean,
    velicina_kucice int null,
    cijena_boravka decimal(18,2) not null
);
create table riba (
    sifra int not null primary key auto_increment,
    vrsta varchar(50) null,
    tezina int null,
    cijena_ribe decimal (18,2) null
);

create table posjeta_riba (
    posjeta int not null,
    riba int not null
);

alter table posjeta add foreign key (ribolovac) references ribolovac(sifra);

alter table posjeta add foreign key (mjesto) references mjesto(sifra);

alter table posjeta_riba add foreign key (posjeta) references posjeta(sifra);
alter table posjeta_riba add foreign key (riba) references riba (sifra);
