USE [master]
GO
/****** Object:  Database [skorka]    Script Date: 5/14/2015 9:09:28 PM ******/
CREATE DATABASE [skorka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'skorka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\skorka.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'skorka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\skorka_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [skorka] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [skorka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [skorka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [skorka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [skorka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [skorka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [skorka] SET ARITHABORT OFF 
GO
ALTER DATABASE [skorka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [skorka] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [skorka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [skorka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [skorka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [skorka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [skorka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [skorka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [skorka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [skorka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [skorka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [skorka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [skorka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [skorka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [skorka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [skorka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [skorka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [skorka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [skorka] SET RECOVERY FULL 
GO
ALTER DATABASE [skorka] SET  MULTI_USER 
GO
ALTER DATABASE [skorka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [skorka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [skorka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [skorka] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [skorka]
GO
/****** Object:  Table [dbo].[Dostawcy]    Script Date: 5/14/2015 9:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dostawcy](
	[Nazwa firmy] [varchar](50) NULL,
	[Miasto] [varchar](50) NULL,
	[Ulica] [varchar](50) NULL,
	[Kod pocztowy] [varchar](10) NULL,
	[Numer budynku] [varchar](50) NULL,
	[Numer mieszkania] [varchar](50) NULL,
	[Osoba reprezentujaca] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Dostawcy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Harmonogramy]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Harmonogramy](
	[id] [int] NOT NULL,
	[Pracownik] [int] NULL,
	[Dzien tygodnia] [varchar](10) NULL,
	[Godzina rozpoczecia] [time](7) NULL,
	[Godzina zakonczenia] [time](7) NULL,
	[Godzina rozpoczecia przerwy] [time](7) NULL,
	[Data p. obowiazywania] [date] NULL,
	[Data k. obowiazywania] [date] NULL,
 CONSTRAINT [PK_Harmonogramy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Klienci](
	[id] [int] NOT NULL,
	[Nazwa firmy] [varchar](50) NULL,
	[Miasto] [varchar](50) NULL,
	[Ulica] [varchar](50) NULL,
	[Kod Pocztowy] [varchar](10) NULL,
	[Numer budynku] [smallint] NULL,
	[Numer miekszania] [smallint] NULL,
	[Adres e-mail] [varchar](50) NULL,
	[Osoba reprezentujaca] [int] NOT NULL,
	[Telefon] [varchar](50) NULL,
 CONSTRAINT [PK_Klienci] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Komponenty produktow]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Komponenty produktow](
	[id] [int] NOT NULL,
	[Material] [int] NULL,
	[Produkt] [int] NULL,
 CONSTRAINT [PK_Komponenty produktow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Materialy]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Materialy](
	[id] [int] NOT NULL,
	[Nazwa] [varchar](40) NULL,
 CONSTRAINT [PK_Materialy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Osoby]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Osoby](
	[id] [int] NOT NULL,
	[Imie] [varchar](50) NULL,
	[Nazwisko] [varchar](50) NULL,
	[Miasto] [varchar](50) NULL,
	[Ulica] [varchar](50) NULL,
	[Kod pocztowy] [varchar](10) NULL,
	[Numer budnyku] [smallint] NULL,
	[Numer miekszania] [smallint] NULL,
	[Telefon] [varchar](50) NULL,
 CONSTRAINT [PK_Osoby] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Piony]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Piony](
	[id] [int] NOT NULL,
	[Nazwa] [varchar](50) NULL,
	[Szef] [int] NULL,
 CONSTRAINT [PK_Piony] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pozycje zamowienia]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pozycje zamowienia](
	[id] [int] NOT NULL,
	[Produkt] [int] NULL,
	[Zamowienie] [int] NULL,
	[Ilosc] [int] NULL,
	[Rabat] [real] NOT NULL,
 CONSTRAINT [PK_Pozycje zamowienia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pracownicy](
	[id] [int] NOT NULL,
	[Osoba] [int] NOT NULL,
	[Data urodzenia] [date] NULL,
	[Tytul] [varchar](50) NULL,
	[Stanowisko] [int] NOT NULL,
	[Pion] [int] NULL,
	[Data zatrudnienia] [date] NULL,
	[Data zwolnienia] [date] NULL,
	[Przelozony] [int] NULL,
	[Na zwolnieniu] [bit] NULL,
 CONSTRAINT [PK_Pracownicy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produkty]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produkty](
	[id] [int] NOT NULL,
	[Cena jednostkowa] [money] NULL,
	[Gramatura] [real] NULL,
	[Rodzaj] [varchar](40) NULL,
	[Opis slowny] [text] NULL,
	[Ilosc na magazynie] [int] NULL,
 CONSTRAINT [PK_Produkty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stanowiska]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stanowiska](
	[id] [int] NOT NULL,
	[Nazwa] [varchar](50) NULL,
 CONSTRAINT [PK_Stanowiska] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zadania]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zadania](
	[id] [int] NOT NULL,
	[Zlecajacy] [int] NULL,
	[Produkt] [int] NULL,
	[Ilosc] [int] NULL,
	[Dealine] [date] NULL,
	[Data zlecenia] [date] NULL,
	[Data wykonania] [date] NULL,
	[Odpowiedzialny za wykonanie] [int] NULL,
	[Szczegoly] [text] NULL,
 CONSTRAINT [PK_Zadania] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Zamowienia]    Script Date: 5/14/2015 9:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zamowienia](
	[id] [int] NOT NULL,
	[Klient] [int] NULL,
	[Pracownik obslugujacy] [int] NULL,
	[Data zamowienia] [date] NULL,
	[Data wyslania] [date] NULL,
 CONSTRAINT [PK_Zamowienia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Dostawcy]  WITH CHECK ADD  CONSTRAINT [FK_Dostawcy_Osoby] FOREIGN KEY([Osoba reprezentujaca])
REFERENCES [dbo].[Osoby] ([id])
GO
ALTER TABLE [dbo].[Dostawcy] CHECK CONSTRAINT [FK_Dostawcy_Osoby]
GO
ALTER TABLE [dbo].[Harmonogramy]  WITH CHECK ADD  CONSTRAINT [FK_Harmonogramy_Pracownicy] FOREIGN KEY([Pracownik])
REFERENCES [dbo].[Pracownicy] ([id])
GO
ALTER TABLE [dbo].[Harmonogramy] CHECK CONSTRAINT [FK_Harmonogramy_Pracownicy]
GO
ALTER TABLE [dbo].[Klienci]  WITH CHECK ADD  CONSTRAINT [FK_Klienci_Osoby] FOREIGN KEY([Osoba reprezentujaca])
REFERENCES [dbo].[Osoby] ([id])
GO
ALTER TABLE [dbo].[Klienci] CHECK CONSTRAINT [FK_Klienci_Osoby]
GO
ALTER TABLE [dbo].[Komponenty produktow]  WITH CHECK ADD  CONSTRAINT [FK_Komponenty produktow_Materialy] FOREIGN KEY([Material])
REFERENCES [dbo].[Materialy] ([id])
GO
ALTER TABLE [dbo].[Komponenty produktow] CHECK CONSTRAINT [FK_Komponenty produktow_Materialy]
GO
ALTER TABLE [dbo].[Komponenty produktow]  WITH CHECK ADD  CONSTRAINT [FK_Komponenty produktow_Produkty] FOREIGN KEY([Produkt])
REFERENCES [dbo].[Produkty] ([id])
GO
ALTER TABLE [dbo].[Komponenty produktow] CHECK CONSTRAINT [FK_Komponenty produktow_Produkty]
GO
ALTER TABLE [dbo].[Piony]  WITH CHECK ADD  CONSTRAINT [FK_Piony_Pracownicy] FOREIGN KEY([Szef])
REFERENCES [dbo].[Pracownicy] ([id])
GO
ALTER TABLE [dbo].[Piony] CHECK CONSTRAINT [FK_Piony_Pracownicy]
GO
ALTER TABLE [dbo].[Pozycje zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Pozycje zamowienia_Produkty] FOREIGN KEY([Produkt])
REFERENCES [dbo].[Produkty] ([id])
GO
ALTER TABLE [dbo].[Pozycje zamowienia] CHECK CONSTRAINT [FK_Pozycje zamowienia_Produkty]
GO
ALTER TABLE [dbo].[Pozycje zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Pozycje zamowienia_Zamowienia] FOREIGN KEY([Produkt])
REFERENCES [dbo].[Zamowienia] ([id])
GO
ALTER TABLE [dbo].[Pozycje zamowienia] CHECK CONSTRAINT [FK_Pozycje zamowienia_Zamowienia]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [FK_Pracownicy_Osoby] FOREIGN KEY([Osoba])
REFERENCES [dbo].[Osoby] ([id])
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Pracownicy_Osoby]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [FK_Pracownicy_Piony] FOREIGN KEY([Pion])
REFERENCES [dbo].[Piony] ([id])
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Pracownicy_Piony]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [FK_Pracownicy_Pracownicy] FOREIGN KEY([Przelozony])
REFERENCES [dbo].[Pracownicy] ([id])
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Pracownicy_Pracownicy]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [FK_Pracownicy_Stanowiska] FOREIGN KEY([Stanowisko])
REFERENCES [dbo].[Stanowiska] ([id])
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Pracownicy_Stanowiska]
GO
ALTER TABLE [dbo].[Zadania]  WITH CHECK ADD  CONSTRAINT [FK_Zadania_Pracownicy] FOREIGN KEY([Zlecajacy])
REFERENCES [dbo].[Pracownicy] ([id])
GO
ALTER TABLE [dbo].[Zadania] CHECK CONSTRAINT [FK_Zadania_Pracownicy]
GO
ALTER TABLE [dbo].[Zadania]  WITH CHECK ADD  CONSTRAINT [FK_Zadania_Pracownicy1] FOREIGN KEY([Odpowiedzialny za wykonanie])
REFERENCES [dbo].[Pracownicy] ([id])
GO
ALTER TABLE [dbo].[Zadania] CHECK CONSTRAINT [FK_Zadania_Pracownicy1]
GO
ALTER TABLE [dbo].[Zadania]  WITH CHECK ADD  CONSTRAINT [FK_Zadania_Produkty] FOREIGN KEY([Produkt])
REFERENCES [dbo].[Produkty] ([id])
GO
ALTER TABLE [dbo].[Zadania] CHECK CONSTRAINT [FK_Zadania_Produkty]
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Zamowienia_Klienci] FOREIGN KEY([Klient])
REFERENCES [dbo].[Klienci] ([id])
GO
ALTER TABLE [dbo].[Zamowienia] CHECK CONSTRAINT [FK_Zamowienia_Klienci]
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD  CONSTRAINT [FK_Zamowienia_Pracownicy] FOREIGN KEY([Pracownik obslugujacy])
REFERENCES [dbo].[Pracownicy] ([id])
GO
ALTER TABLE [dbo].[Zamowienia] CHECK CONSTRAINT [FK_Zamowienia_Pracownicy]
GO
USE [master]
GO
ALTER DATABASE [skorka] SET  READ_WRITE 
GO
