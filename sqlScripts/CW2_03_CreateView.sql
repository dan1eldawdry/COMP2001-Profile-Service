-- view to display users details with location and one activity
CREATE VIEW CW2.UserProfileView AS
SELECT
    CW2.USERS.UserID,
    CW2.USERS.Firstname,
    CW2.USERS.Lastname,
    CW2.USERS.Username,
    CW2.USERS.Email,
    CW2.USERS.Bio,
    CW2.CITY.CityName AS Location,
    CW2.ACTIVITY.ActivityName
FROM
    CW2.USERS
INNER JOIN -- needed to match user to their city
    CW2.CITY ON CW2.USERS.CityID = CW2.CITY.CityID
LEFT JOIN -- needed to link users to activities
    CW2.USERACTIVITY ON CW2.USERS.UserID = CW2.USERACTIVITY.UserID
LEFT JOIN -- nneeded to show actual name of activity
    CW2.ACTIVITY ON CW2.USERACTIVITY.ActivityID = CW2.ACTIVITY.ActivityID;
GO