

drop database if exists ribnjak;
create database ribnjak default charset utf8;
use ribnjak;

drop database if exists ribnjak;
create database ribnjak;
use ribnjak;

create table djelatnik (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    kontakt varchar(50) not null
);

create table ribolovac (
   sifra int not null primary key auto_increment,
   broj_ribolovaca int not null,
   broj_stapova int not null,
   ime varchar(50) not null,
   prezime varchar(50) not null,
   kontakt varchar(50) not null,
   posjeta int not null
);

create table posjeta (
    sifra int not null primary key auto_increment,
    ukupna_cijena decimal(18,2) not null,
    datum_dolaska datetime,
    datum_odlaska datetime,
    djelatnik int not null,
    mjesto int not null
);

create table mjesto (
    sifra int not null primary key auto_increment,
    lokacija boolean,
    velicina_kucice int null,
    cijena_boravka decimal(18,2) not null,
    riba int null
);

create table riba (
    sifra int not null primary key auto_increment,
    vrsta varchar(50) null,
    tezina int null,
    cijena_ribe decimal (18,2) null
);


alter table ribolovac add foreign key (posjeta) references posjeta(sifra);

alter table posjeta add foreign key (djelatnik) references djelatnik(sifra);
alter table posjeta add foreign key (mjesto) references mjesto(sifra);

alter table mjesto add foreign key (riba) references riba(sifra);




