# Amici

Like Tinder, but for finding friends with similar interests!

## Security

This is a demo app, I didn't use identity framework so there is no authentication/ authorisation.

However, one interesting thing I did implement is protection from finding the exact location of the user, as described here:
https://robertheaton.com/bumble-vulnerability/

The password as: AMICI_DB_PASSWORD
The username as: AMICI_DB_USERNAME

During development, use dotnet user-secrets.