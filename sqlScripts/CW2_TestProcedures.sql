-- add user
EXEC CW2.AddUser
    'Test',
    'Name',
    'Test Name',
    'test@plymouth.ac.uk',
    'pass123',
    'Original bio',
    1; -- CityID 1 = Plymouth

-- checks whos currently there
SELECT * FROM CW2.USERS;

-- reads user
EXEC CW2.GetUser 11;

-- updates user
EXEC CW2.UpdateUser 11, 'This is the updated bio', 2, 'newpass123';

-- checks bio
EXEC CW2.GetUser 8;

-- deletes user
EXEC CW2.DeleteUser 11;

-- Checks if it's gone
SELECT * FROM CW2.USERS WHERE UserID = 11;




