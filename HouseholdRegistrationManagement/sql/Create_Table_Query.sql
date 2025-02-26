CREATE TABLE Users ( 
    UserID INT PRIMARY KEY IDENTITY(1,1), 
    FullName VARCHAR(100) NOT NULL, 
    Email VARCHAR(100) NOT NULL UNIQUE, 
    Password VARCHAR(255) NOT NULL, 
    Role VARCHAR(20) NOT NULL CHECK (Role IN ('Citizen', 'AreaLeader', 'Police')), 
    Address TEXT NOT NULL 
);

CREATE TABLE Households ( 
    HouseholdID INT PRIMARY KEY IDENTITY(1,1), 
    HeadOfHouseholdID INT, 
    Address TEXT NOT NULL, 
    CreatedDate DATE DEFAULT GETDATE(), 
    FOREIGN KEY (HeadOfHouseholdID) REFERENCES Users(UserID) 
);

CREATE TABLE Registrations ( 
    RegistrationID INT PRIMARY KEY IDENTITY(1,1), 
    UserID INT, 
    RegistrationType VARCHAR(20) NOT NULL CHECK (RegistrationType IN ('Permanent', 'Temporary', 'TemporaryStay')), 
    StartDate DATE NOT NULL, 
    EndDate DATE NULL, 
    Status VARCHAR(10) DEFAULT 'Pending' CHECK (Status IN ('Pending', 'Approved', 'Rejected')), 
    ApprovedBy INT NULL, 
    Comments TEXT NULL, 
    FOREIGN KEY (UserID) REFERENCES Users(UserID), 
    FOREIGN KEY (ApprovedBy) REFERENCES Users(UserID) 
);

CREATE TABLE HouseholdMembers ( 
    MemberID INT PRIMARY KEY IDENTITY(1,1), 
    HouseholdID INT, 
    UserID INT, 
    Relationship VARCHAR(50) NOT NULL, 
    FOREIGN KEY (HouseholdID) REFERENCES Households(HouseholdID), 
    FOREIGN KEY (UserID) REFERENCES Users(UserID) 
);

CREATE TABLE Notifications ( 
    NotificationID INT PRIMARY KEY IDENTITY(1,1), 
    UserID INT, 
    Message TEXT NOT NULL, 
    SentDate DATETIME DEFAULT GETDATE(), 
    IsRead BIT DEFAULT 0, 
    FOREIGN KEY (UserID) REFERENCES Users(UserID) 
);

CREATE TABLE Logs ( 
    LogID INT PRIMARY KEY IDENTITY(1,1), 
    UserID INT, 
    Action VARCHAR(100) NOT NULL, 
    Timestamp DATETIME DEFAULT GETDATE(), 
    FOREIGN KEY (UserID) REFERENCES Users(UserID) 
);
