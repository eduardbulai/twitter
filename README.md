# Project drafts
- The goal: Mine a sampling of Twitter public tweets and visually display on a single-page app.

- Optional: Dynamic real-time data (real-time), save queries & visualizations from users (CRUD) 

-------------------------------

## Tools
- Front-end: jQuery, D3
- Back-end: Rails 4 with Active Record
- Database: PostgreSQL
- API: Twitter

- Sentiment Analysis tools: (Who created this tool? - Finn Årup Nielsen) (When? - 2011, How does it work?)

http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010

AFINN is a list of English words rated for valence with an integer between minus five (negative) and plus five (positive). The words have been manually labeled by Finn Årup Nielsen in 2009-2011. The file is tab-separated.

Others http://blog.mashape.com/post/48757031167/list-of-16-sentiment-analysis-apis

Use cases:
http://www.cs.washington.edu/education/courses/cse190p/12su/homework/hw5/homework5.html (compare NYC or CA, who Tweets about being happier or sadder?)
https://election.twitter.com/ (real-time election stats comparisons - which candidate has more buzz?)
http://jeffreybreen.wordpress.com/2011/07/04/twitter-text-mining-r-slides/
(Text-mining Tweets and comparing it with airline sentiments and ratings - does Twitter sentiment correlate with airline satisfaction ratings?)
http://ny.spatial.ly/ (What languages are people Tweeting in - in a city?)
https://code.google.com/p/otterapi/wiki/UsesOtter


More tools
Topsy API http://about.topsy.com/products/api/overview/


----------------------------------------

## Project preparation: 

Before we start building the app, we will have to build a Ruby script that will analyze and score each tweet, using the Afinn model.

- Figure out how to pull tweets and filter by parameters
- Convert to string
- Apply sentiment filter
- Write a Ruby script to score each tweet by what words are used in it, and what scores each word has 

Goal: get a Ruby script

----------------------------------------

## Test data:

After that, we will start testing our Ruby script on test data sets so we can get the resulting test CSV (tabular data) returned and testing visualization options. 

- Start testing the Ruby script on various test data sets. 
- Run the script on the test data, and return a CSV of words and frequency
- Put that CSV into D3 and Start learning D3 to play around with various static and/or interactive visualization options.

Goal: test the Ruby script, test a D3 visualization script

----------------------------------------

## Build the app:

After we have a test Ruby script and test visualization script, we can start building out the app and database. Create a test page.html that catches a query and runs the Ruby script on it, and then spits back out a D3 visualization. 

- index.html (html/css/ajax) - form with search query
- run Ruby script with that query term
- grab that data, convert to CSV
- return that data with d3 visualization on top of it 

----------------------------------------

## Breaking it down: for the User

MINIMUM VIABLE PRODUCT: 
- A user will be able to enter a search query and submit it.
- A user will to choose start and end date and optional parameters, like location. 
- Display a static bubble chart of the top words in tweets that have the word “Lakers” in it -- and then, color them by sentiment & size the bubbles by frequency. User can save the chart as PNG or share it online. 

OPTIONAL FUNCTIONS:
- Display an interactive bubble chart of the top words in tweets that have the word “Lakers” in it. Filter by parameters, like jQuery slider by time.
------

## Breaking it down: for Client / Server
- Get query (for example, “Lakers” or “Prop 8 struck down”)
- Get data of query 

What data parameter options?
Data parameters: start/end date, language, geo-location, timezone,  #hashtags

What analysis options & possibilities?
- Mine status update words to measure frequency of words by sentiment (What can we tell by the words people use on their Twitter statuses? Let’s measure overall Twitter sentiments by analyzing happy v. sad terms in a slice of tweets during a certain period of time.) 

- Location by frequency of words by sentiment (We can also filter and compare by locations)

- Compare two search queries with sentiment analysis. (Do people tweet more angry or sad about X-Box v. Play Station).

- Analyze & display it:

What display options?
- For one data set: words + sentiments + frequency: A bubble chart with the top X number of the most frequently Tweeted words, where size of bubble indicates frequency and color of bubble indicates positive v. negative: http://bl.ocks.org/mbostock/4063269

Example: What words are most popularly tweeted during a NBA Finals game? How happy / sad are the tweets?

- For comparing sentiment frequency over time: sentiments + frequency + time: A stacked area chart with time along the X-axis and frequency along the Y-axis to compare how people’s Twitter status moods are changing over a given time period.

Example: On Election day, compare tweets and sentiments as election results are reported. 


# Things to keep in mind: 
* Testing - Sanity-testing -- is the model working? does the data make sense? 
* Foreign languages? -- figure out what that weird code is

     


