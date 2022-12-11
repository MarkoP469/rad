drop database if exists ribnjakvjezba;
create database ribnjakvjezba default charset utf8;
use ribnjakvjezba;
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
    broj_kreveta int null,
    cijena_boravka decimal(18,2) not null
);
create table riba (
    sifra int not null primary key auto_increment,
    vrsta varchar(50) null,
    tezina decimal(3,3) null,
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


insert into ribolovac (sifra,broj_ribolovaca,broj_stapova,ime,prezime,kontakt)
values  (1,1,3,'Marko','Markovic','0038596123456'),
        (2,1,3,'Petar','Petrovic','0038596654321'),
        (3,2,6,'Josip','Josipovic','00385961234567'),
        (4,3,9,'Ivan','Ivanovic','00385967654321');

insert into mjesto (sifra,lokacija,broj_kreveta,cijena_boravka)
values  (1,null,1,10),
        (2,null,1,10),
        (3,null,2,20),
        (4,null,3,30);


insert into posjeta (sifra,ukupna_cijena,datum_dolaska,datum_odlaska,mjesto,ribolovac)
values  (1,10,'2023-04-01','2023-04-02',1,1),
        (2,10,'2023-05-01','2023-05-02',2,2),
        (3,20,'2023-06-01','2023-06-02',3,3),
        (4,30,'2023-07-01','2023-07-02',4,4);

insert into riba (sifra,vrsta,tezina,cijena_ribe)
values  (1,'saran',null,null),
        (2,'smud',null,null),
        (3,'stuka',null,null),
        (4,'som',null,null);
