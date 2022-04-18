# Amici

Like Tinder, but for finding friends with similar interests!

## What is this app built with?

Dotnet core v3.1 - Because it is LTS and I haven't gotten around to learning v6.
NO entity framework - because it's mappings don't support a lot of spatial stuff.
NO identity framework - because I didn't have time.
POSTGIS - For its amazing Geospatial data support.

### Why didn't you use an SPA framework?

A few reasons:
1. If this were a real app, it would have a small number of pages that users spend a large amount of time on. 
This is the perfect use case for a multi-page application. SPA's are better suited to apps with a large number of pages, 
with lots of developers working on them.
2. I can write non-SPA apps about 3 times faster.
3. SPA's are more complex to get authentication working correctly for.

## Security

This is a demo app, I didn't use identity framework so there is no authentication/ authorisation.

However, one interesting thing I did implement is protection from finding the exact location of the user, as described here:
https://robertheaton.com/bumble-vulnerability/

The password as: AMICI_DB_PASSWORD
The username as: AMICI_DB_USERNAME

During development, use dotnet user-secrets.