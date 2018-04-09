def code1():
    import numpy as np
    from lightfm.datasets import fetch_movielens
    from lightfm import LightFM

    # CHALLENGE part 1 of 3 - write your own fetch and format method for a different recommendation
    # dataset. Here a good few https://gist.github.com/entaroadun/1653794
    # And take a look at the fetch_movielens method to see what it's doing
    #

    # fetch data and format it
    data = fetch_movielens(min_rating=4.0)

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

def code2():
    def Min(a):
        m = None
        for k in a:
            if (k != None):
                m = k if (m == None or k < m)else m
        return m

    def Max(a):
        m = None
        for k in a:
            if (k != None):
                m = k if (m == None or k > m)else m
        return m

    def is_number(s):
        try:
            float(s)
            return True
        except ValueError:
            return False

    def colMin(data, col):
        return (Min([data[k][col] for k in range(0, len(data))]))

    def colMax(data, col):
        return (Max([data[k][col] for k in range(0, len(data))]))

    def EucAB(a, b):
        dist = 0.
        if (len(a) != len(b)): raise ValueError('Vectors are not of similar dimensionality.')
        for k in range(0, len(a)):
            if (a[k] != None and b[k] != None):
                dist += (a[k] - b[k]) ** 2
        dist = dist ** 0.5
        return (dist)

    def EucABdims(a, b):
        dist = 0.
        d = 0
        if (len(a) != len(b)): raise ValueError('Vectors are not of similar dimensionality.')
        for k in range(0, len(a)):
            if (a[k] != None and b[k] != None):
                dist += (a[k] - b[k]) ** 2
                d += 1
        dist = dist ** 0.5
        return ((dist, d))

    def fetchpPrediction(data, row, col):  # Rows of models, columns of output layer.
        p = 0.  # prediction = 0
        bot = 0.
        m = colMax(data, col) - colMin(data, col)
        if (m == 0):
            return (colMax(data, col))
        for k in range(0, len(data)):
            temp = EucABdims(data[k], data[row])
            euc = temp[0]  # the euclidean distance between two samples
            dims = temp[1]  # the number of genes in the union of two samples data
            if (k != row and dims != 0 and data[k][
                col] != None):  # does not use samples with 0** common genes to make predictions.
                p += data[k][col] / ((euc + 0.000001) ** 2)  # Adds to a weighted sum
                bot += m / ((euc + 0.000001) ** 2)  # Adds to a weighted averager    ## poorMan's limit : p Im2lz7
        if (bot == 0):
            return (colMin(data, col) + m / 2.)
        return (colMin(data, col) + m * (p / bot))

    a = [[0., 0., 1.],
         [0., None, 1.],
         [0., 1, 0.]]

    print(str(fetchpPrediction(a, 1, 1)))  # Example filling in a blank value

    def cook(data):
        r = [k[:] for k in data]  # makes a detached copy from
        for k in range(0, len(r)):
            for k2 in range(0, len(r[k])):
                if (r[k][k2] == None):
                    r[k][k2] = fetchpPrediction(a, k, k2)
        return (r)

    def pr(data):
        s = ""
        for k in data:
            for k2 in k:
                s += str(round(k2, 5) if k2 != None else "Nan") + "\t" * 3
            s += "\n"
        return (s)

    print("In:")
    print(pr(a))
    print("Out:")
    print(pr(cook(a)))  # example batch run for a table

def code3():
    import numpy as np
    from lightfm.datasets import fetch_movielens
    from lightfm import LightFM

    # CHALLENGE part 1 of 3 - write your own fetch and format method for a different recommendation
    # dataset. Here a good few https://gist.github.com/entaroadun/1653794
    # And take a look at the fetch_movielens method to see what it's doing
    #

    # fetch data and format it
    data = fetch_movielens(min_rating=4.0)

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

