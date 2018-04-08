consumer_key = "QU2BhMy9th0YCufv29pUPYrns"
consumer_secret = "OFflhaTabnJBFtlmUtn97whTiDF7Cs6ElUVHy0q1MpPBgi0bbT"
access_token = "1358275434-HuunDh25a0mN9QlwvPjbsAK5hI4o5v9NoIbyp5J"
access_token_secret = "Obbqg9AshVcfW2zw5wXarz6SxWg5BYJGXcN9DH8Y1gpzY"

def code1():
    import tweepy
    #python -m textblob.download_corpora | pip install tweepy  ------- Dependencies
    import textblob
    from textblob import TextBlob
    #some_sentence = TextBlob("my favorite movie is dark knight series")
    #print (some_sentence.tags)
    #print(some_sentence.words)
    auth = tweepy.OAuthHandler(consumer_key=consumer_key, consumer_secret=consumer_secret)
    auth.set_access_token(access_token, access_token_secret)

    api = tweepy.API(auth)
    public_tweets = api.search('Sterlite')

    for tweet in public_tweets:
        print(tweet.text)
        analysis = TextBlob(tweet.text)
        print(analysis.sentiment)

def code2():
    import tweepy
    from textblob import TextBlob
    # French adaptor
    from textblob_fr import PatternTagger, PatternAnalyzer

    import numpy as np
    import operator

    # Step 1 - Authenticate
    consumer_key = 'CONSUMER_KEY_HERE'
    consumer_secret = 'CONSUMER_SECRET_HERE'

    access_token = 'ACCESS_TOKEN_HERE'
    access_token_secret = 'ACCESS_TOKEN_SECRET_HERE'

    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)

    api = tweepy.API(auth)

    # Step 2 - Prepare query features

    # List of candidates to French Republicans Primary Elections
    candidates_names = ['Sarkozy', 'Kosciusko', 'Cope', 'Juppe', 'Fillon', 'Le Maire', 'Poisson']
    # Hashtag related to the debate
    name_of_debate = "PrimaireLeDebat"
    # Date of the debate : October 13th
    since_date = "2016-10-13"
    until_date = "2016-10-14"

    # Step 2b - Function of labelisation of analysis
    def get_label(analysis, threshold=0):
        if analysis.sentiment[0] > threshold:
            return 'Positive'
        else:
            return 'Negative'

    # Step 3 - Retrieve Tweets and Save Them
    all_polarities = dict()
    for candidate in candidates_names:
        this_candidate_polarities = []
        # Get the tweets about the debate and the candidate between the dates
        this_candidate_tweets = api.search(q=[name_of_debate, candidate], count=100, since=since_date, until=until_date)
        # Save the tweets in csv
        with open('%s_tweets.csv' % candidate, 'wb') as this_candidate_file:
            this_candidate_file.write('tweet,sentiment_label\n')
            for tweet in this_candidate_tweets:
                analysis = TextBlob(tweet.text, pos_tagger=PatternTagger(), analyzer=PatternAnalyzer())
                # Get the label corresponding to the sentiment analysis
                this_candidate_polarities.append(analysis.sentiment[0])
                this_candidate_file.write('%s,%s\n' % (tweet.text.encode('utf8'), get_label(analysis)))
        # Save the mean for final results
        all_polarities[candidate] = np.mean(this_candidate_polarities)

    # Step bonus - Print a Result
    sorted_analysis = sorted(all_polarities.items(), key=operator.itemgetter(1), reverse=True)
    print('Mean Sentiment Polarity in descending order :')
    for candidate, polarity in sorted_analysis:
        print('%s : %0.3f' % (candidate, polarity))


def code3():
    # Please download movieslens.zip file from url provided in movielens.py file. If you will use default movielens.py file may face Badzip exception.
    # In this example movielens.zip, movielens.py and RecomendationSystem.py all are in same directory and executed by python3.
    import numpy as np
    import movielens
    from lightfm import LightFM

    # CHALLENGE part 1 of 3 - write your own fetch and format method for a different recommendation
    # dataset. Here a good few https://gist.github.com/entaroadun/1653794
    # And take a look at the fetch_movielens method to see what it's doing


    # fetch data and format it
    data = movielens.fetch_movielens(min_rating=4.0)

    # print training and testing data
    print(repr(data['train']))
    print(repr(data['test']))

    # CHALLENGE part 2 of 3 - use 3 different loss functions (so 3 different models), compare results, print results for
    # the best one. - Available loss functions are warp, logistic, bpr, and warp-kos.

    # create model
    model = LightFM(loss='warp')
    # train model
    model.fit(data['train'], epochs=30, num_threads=2)

    # CHALLENGE part 3 of 3 - Modify this function so that it parses your dataset correctly to retrieve
    # the necessary variables (products, songs, tv shows, etc.)
    # then print out the recommended results

    def sample_recommendation(model, data, user_ids):

        # number of users and movies in training data
        n_users, n_items = data['train'].shape

        # generate recommendations for each user we input
        for user_id in user_ids:

            # movies they already like
            known_positives = data['item_labels'][data['train'].tocsr()[user_id].indices]

            # movies our model predicts they will like
            scores = model.predict(user_id, np.arange(n_items))
            # rank them in order of most liked to least
            top_items = data['item_labels'][np.argsort(-scores)]

            # print out the results
            print("User %s" % user_id)
            print("     Known positives:")

            for x in known_positives[:3]:
                print("        %s" % x)

            print("     Recommended:")

            for x in top_items[:3]:
                print("        %s" % x)

    sample_recommendation(model, data, [3, 25, 450])

def code4():
    import tweepy
    from textblob import TextBlob
    import csv
    import sys
    import re

    # Step 1 - Authenticate
    consumer_key = 'CONSUMER_KEY_HERE'
    consumer_secret = 'CONSUMER_SECRET_HERE'

    access_token = 'ACCESS_TOKEN_HERE'
    access_token_secret = 'ACCESS_TOKEN_SECRET_HERE'

    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)

    api = tweepy.API(auth)

    # Step 3 - Retrieve Tweets
    public_tweets = api.search(sys.argv[1])

    def clean_tweet(tweet):
        tweet = ' '.join(re.sub("(@[A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\w+:\/\/\S+)", " ", tweet).split())
        # print ('AFTER regex: \n ',tweet,'\n')
        return tweet

    f = open(sys.argv[2], 'wt')
    try:
        writer = csv.writer(f)
        writer.writerow(('Tweet', 'Sentiment'))

        for tweet in public_tweets:

            cleaned_tweet = clean_tweet(tweet.text)
            analysis = TextBlob(cleaned_tweet)

            if (analysis.sentiment.polarity > 0):
                sentiment = 'POSITIVE'
            elif (analysis.sentiment.polarity == 0):
                sentiment = 'NEUTRAL'
            else:
                sentiment = 'NEGATIVE'

            writer.writerow((cleaned_tweet, sentiment))

    finally:
        f.close()

    print(open(sys.argv[2], 'rt').read())

