CREATE TABLE Estudiante (
    EstudianteID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    DocumentoIdentidadTipo VARCHAR(10), -- Tipo de documento (e.g., CC, TI, etc.)
    DocumentoIdentidadNumero VARCHAR(20), -- Número de documento
    CorreoElectronico VARCHAR(100),
    Telefono VARCHAR(20)
);

CREATE TABLE Programa (
    ProgramaID INT PRIMARY KEY,
    Nombre VARCHAR(100)
);

CREATE TABLE Curso (
    CursoID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    ProgramaID INT,
    FOREIGN KEY (ProgramaID) REFERENCES Programa(ProgramaID)
);

CREATE TABLE Matricula (
    MatriculaID INT PRIMARY KEY,
    EstudianteID INT,
    CursoID INT,
    PagoMatricula BOOLEAN,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiante(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);

CREATE TABLE Materia (
    MateriaID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    CursoID INT,
    SemestreID INT,
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
    FOREIGN KEY (SemestreID) REFERENCES Semestre(SemestreID)
);

CREATE TABLE Nota (
    NotaID INT PRIMARY KEY,
    EstudianteID INT,
    MateriaID INT,
    Nota FLOAT,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiante(EstudianteID),
    FOREIGN KEY (MateriaID) REFERENCES Materia(MateriaID)
);

CREATE TABLE Semestre (
    SemestreID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE Pago (
    PagoID INT PRIMARY KEY,
    MatriculaID INT,
    Monto DECIMAL(10, 2),
    FechaPago DATE,
    FOREIGN KEY (MatriculaID) REFERENCES Matricula(MatriculaID)
);

CREATE TABLE EstadoCuenta (
    EstadoCuentaID INT PRIMARY KEY,
    EstudianteID INT,
    MontoTotal DECIMAL(10, 2),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiante(EstudianteID)
);

CREATE VIEW VistaEstudiantes AS
SELECT e.Nombre AS NombreEstudiante, e.Apellido AS ApellidoEstudiante, e.CorreoElectronico, c.Nombre AS NombreCurso
FROM Estudiante e
JOIN Matricula m ON e.EstudianteID = m.EstudianteID
JOIN Curso c ON m.CursoID = c.CursoID;

SELECT * FROM VistaNotasEstudiantes;