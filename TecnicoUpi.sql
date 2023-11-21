
Create DataBase TecnicoUPI
use  TecnicoUPI

CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(50) NOT NULL,
    CorreoElectronico VARCHAR(50),
    Telefono VARCHAR(15),
    CONSTRAINT UQ_CorreoElectronico UNIQUE (CorreoElectronico)
);

CREATE TABLE Equipos (
    EquipoID INT PRIMARY KEY IDENTITY,
    TipoEquipo VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50),
	UsuarioID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID)
   
);



CREATE TABLE Reparaciones (
    ReparacionID INT PRIMARY KEY IDENTITY,
    EquipoID INT FOREIGN KEY REFERENCES Equipos(EquipoID),
    FechaSolicitud DATETIME,
    Estado CHAR(1)
);

CREATE TABLE Tecnicos (
    TecnicoID INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(50),
    Especialidad VARCHAR(50)
);

CREATE TABLE Asignacion (
    AsignacionID INT PRIMARY KEY IDENTITY,
    ReparacionID INT FOREIGN KEY REFERENCES Reparaciones(ReparacionID),
    TecnicoID INT FOREIGN KEY REFERENCES Tecnicos(TecnicoID),
    FechaAsignacion DATETIME
);

CREATE TABLE DetallesReparacion (
    DetalleID INT PRIMARY KEY IDENTITY,
    ReparacionID INT FOREIGN KEY REFERENCES Reparaciones(ReparacionID),
    Descripcion VARCHAR(50),
    FechaInicio DATETIME,
    FechaFin DATETIME
);

