# Amici

Like Tinder, but for finding friends with similar interests!

## What is this app built with?

Dotnet core v3.1 - Because it is LTS and I haven't gotten around to learning v6.
NO entity framework - because it's mappings don't support a lot of spatial stuff.
NO identity framework - because I didn't have time.
POSTGIS - For its amazing Geospatial data support.

## Security

This is a demo app, I didn't use identity framework so there is no authentication/ authorisation.

However, one interesting thing I did implement is protection from finding the exact location of the user, as described here:
https://robertheaton.com/bumble-vulnerability/

The password as: AMICI_DB_PASSWORD
The username as: AMICI_DB_USERNAME

During development, use dotnet user-secrets.