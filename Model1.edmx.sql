
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/26/2020 07:03:29
-- Generated from EDMX file: D:\deletee\DITSapp\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [work];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Post_Detector]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Post] DROP CONSTRAINT [FK_Post_Detector];
GO
IF OBJECT_ID(N'[dbo].[FK_TechProcess_Employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TechProcess] DROP CONSTRAINT [FK_TechProcess_Employee];
GO
IF OBJECT_ID(N'[dbo].[FK_Post_Station]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Post] DROP CONSTRAINT [FK_Post_Station];
GO
IF OBJECT_ID(N'[dbo].[FK_Post_TechProcess]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Post] DROP CONSTRAINT [FK_Post_TechProcess];
GO
IF OBJECT_ID(N'[dbo].[FK_DetectorTypeDetector]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Detector] DROP CONSTRAINT [FK_DetectorTypeDetector];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Detector]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Detector];
GO
IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO
IF OBJECT_ID(N'[dbo].[Post]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Post];
GO
IF OBJECT_ID(N'[dbo].[Station]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Station];
GO
IF OBJECT_ID(N'[dbo].[TechProcess]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TechProcess];
GO
IF OBJECT_ID(N'[dbo].[DetectorTypeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DetectorTypeSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Detector'
CREATE TABLE [dbo].[Detector] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MakeDate] datetime  NULL,
    [RemoveDate] datetime  NULL,
    [DetectorTypeId] int  NOT NULL
);
GO

-- Creating table 'Employee'
CREATE TABLE [dbo].[Employee] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SecondName] nvarchar(50)  NULL,
    [Name] nvarchar(max)  NULL,
    [Login] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NULL,
    [PositionId] int  NOT NULL
);
GO

-- Creating table 'Post'
CREATE TABLE [dbo].[Post] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Station_Id] int  NOT NULL,
    [Num] int  NULL,
    [Detector_Id] int  NOT NULL,
    [TechProcess_Id] int  NOT NULL
);
GO

-- Creating table 'Station'
CREATE TABLE [dbo].[Station] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NULL
);
GO

-- Creating table 'TechProcess'
CREATE TABLE [dbo].[TechProcess] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TechProcessDate] datetime  NULL,
    [NextTechProcessDate] datetime  NULL,
    [Employee_Id] int  NOT NULL
);
GO

-- Creating table 'DetectorTypeSet'
CREATE TABLE [dbo].[DetectorTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PositionSet'
CREATE TABLE [dbo].[PositionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Detector'
ALTER TABLE [dbo].[Detector]
ADD CONSTRAINT [PK_Detector]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Employee'
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [PK_Employee]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Post'
ALTER TABLE [dbo].[Post]
ADD CONSTRAINT [PK_Post]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Station'
ALTER TABLE [dbo].[Station]
ADD CONSTRAINT [PK_Station]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TechProcess'
ALTER TABLE [dbo].[TechProcess]
ADD CONSTRAINT [PK_TechProcess]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetectorTypeSet'
ALTER TABLE [dbo].[DetectorTypeSet]
ADD CONSTRAINT [PK_DetectorTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PositionSet'
ALTER TABLE [dbo].[PositionSet]
ADD CONSTRAINT [PK_PositionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Detector_Id] in table 'Post'
ALTER TABLE [dbo].[Post]
ADD CONSTRAINT [FK_Post_Detector]
    FOREIGN KEY ([Detector_Id])
    REFERENCES [dbo].[Detector]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Post_Detector'
CREATE INDEX [IX_FK_Post_Detector]
ON [dbo].[Post]
    ([Detector_Id]);
GO

-- Creating foreign key on [Employee_Id] in table 'TechProcess'
ALTER TABLE [dbo].[TechProcess]
ADD CONSTRAINT [FK_TechProcess_Employee]
    FOREIGN KEY ([Employee_Id])
    REFERENCES [dbo].[Employee]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TechProcess_Employee'
CREATE INDEX [IX_FK_TechProcess_Employee]
ON [dbo].[TechProcess]
    ([Employee_Id]);
GO

-- Creating foreign key on [Station_Id] in table 'Post'
ALTER TABLE [dbo].[Post]
ADD CONSTRAINT [FK_Post_Station]
    FOREIGN KEY ([Station_Id])
    REFERENCES [dbo].[Station]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Post_Station'
CREATE INDEX [IX_FK_Post_Station]
ON [dbo].[Post]
    ([Station_Id]);
GO

-- Creating foreign key on [TechProcess_Id] in table 'Post'
ALTER TABLE [dbo].[Post]
ADD CONSTRAINT [FK_Post_TechProcess]
    FOREIGN KEY ([TechProcess_Id])
    REFERENCES [dbo].[TechProcess]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Post_TechProcess'
CREATE INDEX [IX_FK_Post_TechProcess]
ON [dbo].[Post]
    ([TechProcess_Id]);
GO

-- Creating foreign key on [DetectorTypeId] in table 'Detector'
ALTER TABLE [dbo].[Detector]
ADD CONSTRAINT [FK_DetectorTypeDetector]
    FOREIGN KEY ([DetectorTypeId])
    REFERENCES [dbo].[DetectorTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DetectorTypeDetector'
CREATE INDEX [IX_FK_DetectorTypeDetector]
ON [dbo].[Detector]
    ([DetectorTypeId]);
GO

-- Creating foreign key on [PositionId] in table 'Employee'
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [FK_PositionEmployee]
    FOREIGN KEY ([PositionId])
    REFERENCES [dbo].[PositionSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PositionEmployee'
CREATE INDEX [IX_FK_PositionEmployee]
ON [dbo].[Employee]
    ([PositionId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------