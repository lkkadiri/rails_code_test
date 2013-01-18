# iTriage Code Exam

## Summary
A company has contracted you to write a piece of software that will perform searches against several APIs and display the results. Because they expect high traffic and have to limit their API calls, they have requested that you cache these results for a period of time so that a user's searchs don't bankrupt the startup. Because this is the next big social search app, the startup needs user accounts and searches scoped to users. The company also wants users to be able to scope searches by various key words like Google does, and has a few it wants to start with - but will add a few more over time. The challenge is to create an application to fulfill all of the user stories that resulted from the discovery session with the company.

## Notes
Clean, well designed code is more important than finishing all of the requirements. The application is expected to grow over time with new APIs and new searches, so it should be able to do this with little additional work.

## Relevant URLs
Google Search API

    http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=#{QUERY}

Twitter Search API

    http://search.twitter.com/search.json?q=#{QUERY}

## User Stories
1. As a user, I should be able to search for a topic from Twitter and Google so that I can see what is going on in the world
2. As a user, I should be able to see a list of 10 results from the search (not separated) so that I'm not overwhelmed by my search
3. As a user, I should see a result's relevant information so that my search is useful. For a Google search, this might be the title and link. For a Twitter search, this might be the username, tweet, and a link to the tweet's detail page.
4. As a user, I should be able to see a list of results from a search with a horizontal rule after every third item, so that my results are organized
5. As a user, I should see cached results if the search happened less than or equal to five minutes ago, so that I can quickly access a recent search
6. As a user, I should receive a new set of results if the search happened over five minutes ago, so that my results don't get stale
7. As a user, when I prepend "google:" to a search, it should only search for Google posts, so that I can limit myself to Google
8. As a user, when I prepend "ragnarok:" to a search, it should redirect me to the first result in Twitter, because sometimes I'm feeling really lucky.
9. As a user, when I prepend "giveittomefresh:" to a search, it should ALWAYS pull new results, so that I can be more discerning in how I actually search for things.
10. As a user, when I combine google or ragnarok with giveittomefresh with a + (google+giveittomefresh:), it should combine the rules so that I can really live on the edge.
