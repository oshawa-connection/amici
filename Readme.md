# Amici

Like Tinder, but for finding friends with similar interests! Note that I only made the UI for mobile, it looks horrible on desktop.

![Screenshot of mobile app](https://github.com/oshawa-connection/amici/blob/develop/ReadMeImages/mainapp.png)

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
3. SPA's are more complex to get authentication working correctly for and deploy correctly and should be avoided unless necessary.

### Why didn't you use TypeScript?

I love TypeScript, but not everyone feels this way. Writing in JS with types/ annotations in JSDoc + a jsconfig.json file gives _most_ of the benefits of TS while allowing other developers, who might not like TS, to contribute to the app.

### Testing

In a production app, I would add tests to the JavaScript for the front-end, and potentially add some integration/ e2e tests for the back-end to make sure that the correct data is being pulled through from the database to the API.

## Security

This is a demo app, I didn't use identity framework so there is no authentication/ authorisation.

However, one interesting thing I did implement is protection from finding the exact location of the user, as described here:
https://robertheaton.com/bumble-vulnerability/

### Environment variables

Set the following environment variables or dotnet user-secrets:

The password as a variable called: AMICI_DB_PASSWORD
The username as a variable called: AMICI_DB_USERNAME


## Improvements

Things that could be done better:
1. Some apsects of the UI could be done better if they used the state pattern.
2. The UI is ugly as sin and only works on mobile.
3. Error handling in general. E.g. displaying a placeholder image if one cannot be loaded.
4. Better validation of route parameters
5. Dockerfile does not install node and build with node_env=PRODUCTION.