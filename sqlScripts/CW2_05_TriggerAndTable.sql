-- log table
CREATE TABLE CW2.UserLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    Username VARCHAR(50),
    ActionDate DATETIME
);
GO

-- make trigger
CREATE TRIGGER CW2.LogNewUser
ON CW2.users
AFTER INSERT
AS
BEGIN
    -- when someone adds a user, also add to log
    INSERT INTO CW2.UserLog (UserID, Username, ActionDate)
    SELECT UserID, Username, GETDATE()
    FROM inserted
END;
GO