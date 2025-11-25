-- add user procedure
CREATE PROCEDURE CW2.AddUser
    @Firstname VARCHAR(50),
    @Lastname VARCHAR(50),
    @Username VARCHAR(50),
    @Email VARCHAR(100),
    @Password VARCHAR(255),
    @Bio VARCHAR(500),
    @CityID INT
AS
BEGIN
    INSERT INTO CW2.USERS (Firstname, Lastname, Username, Email, Password, Bio, CityID)
    VALUES (@Firstname, @Lastname, @Username, @Email, @Password, @Bio, @CityID);
END
GO

-- Get user procedure
CREATE PROCEDURE CW2.GetUser
    @UserID INT
AS
BEGIN
    SELECT * FROM CW2.UserProfileView WHERE UserID = @UserID; -- selects from shorter view for cleaner result
END
GO

-- Update user procedure
CREATE PROCEDURE CW2.UpdateUser
    @UserID INT,
    @Bio VARCHAR(500),
    @CityID INT,
    @Password VARCHAR(255)
AS
BEGIN
    UPDATE CW2.USERS
    SET
        Bio = @Bio, CityID = @CityID, Password = @Password
    WHERE UserID = @UserID;
END
GO

-- Delete user procedure
CREATE PROCEDURE CW2.DeleteUser
    @UserID INT
AS
BEGIN
    DELETE FROM CW2.USERACTIVITY WHERE UserID = @UserID; --deletes dependent records first
    DELETE FROM CW2.USERS WHERE UserID = @UserID; -- deletes the user record
END
GO