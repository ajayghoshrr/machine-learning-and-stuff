def code1():
    from sklearn import tree

    clf = tree.DecisionTreeClassifier()

    # CHALLENGE - create 3 more classifiers...
    # 1
    # 2
    # 3

    # [height, weight, shoe_size]
    X = [[181, 80, 44], [177, 70, 43], [160, 60, 38], [154, 54, 37], [166, 65, 40],
         [190, 90, 47], [175, 64, 39],
         [177, 70, 40], [159, 55, 37], [171, 75, 42], [181, 85, 43]]

    Y = ['male', 'male', 'female', 'female', 'male', 'male', 'female', 'female',
         'female', 'male', 'male']


    # CHALLENGE - ...and train them on our data
    clf = clf.fit(X, Y)

    prediction = clf.predict([[190, 70, 43]])

    # CHALLENGE compare their reusults and print the best one!

    print(prediction)

#==============================CODE - 2==============================
def code2():
    from sklearn import tree
    from sklearn.naive_bayes import GaussianNB
    from sklearn.svm import SVC
    from sklearn.gaussian_process import GaussianProcessClassifier

    clf = tree.DecisionTreeClassifier()  # decision tree
    clf2 = SVC()  # simple SVM
    clf1 = GaussianNB()  # naive_bayes
    clf3 = GaussianProcessClassifier()  # Gaussian Process Classifier
    # CHALLENGE - create 3 more classifiers...

    # [height, weight, shoe_size]
    X = [[181, 80, 44], [177, 70, 43], [160, 60, 38], [154, 54, 37], [166, 65, 40],
         [190, 90, 47], [175, 64, 39],
         [177, 70, 40], [159, 55, 37], [171, 75, 42], [181, 85, 43]]

    Y = ['male', 'male', 'female', 'female', 'male', 'male', 'female', 'female',
         'female', 'male', 'male']

    # CHALLENGE - ...and train them on our data
    clf = clf.fit(X, Y)
    clf1 = clf1.fit(X, Y)
    clf2 = clf2.fit(X, Y)
    clf3 = clf3.fit(X, Y)

    prediction = clf.predict([[190, 70, 43]])
    prediction1 = clf1.predict([[190, 70, 43]])
    prediction2 = clf2.predict([[190, 70, 43]])
    prediction3 = clf3.predict([[190, 70, 43]])

    # CHALLENGE compare their reusults and print the best one!

    most_accurate = max(prediction, prediction1, prediction2, prediction3)

    if most_accurate == prediction:
        print("decision tree")
    elif most_accurate == prediction1:
        print("naive bayes")
    elif most_accurate == prediction2:
        print("simple SVM")
    elif most_accurate == prediction3:
        print("gaussian process classifier")

#===============================CODE - 3=========================================
def code3():
    from sklearn import tree
    from sklearn.ensemble import RandomForestClassifier
    from sklearn.naive_bayes import GaussianNB
    from sklearn.neighbors import KNeighborsClassifier
    from sklearn.metrics import accuracy_score

    ### Data ###
    # Data for training
    # [height, weight, shoe_size]
    X = [[190, 86, 10],
         [183, 78, 11],
         [178, 70, 10],
         [180, 68, 9],
         [178, 76, 10],
         [178, 83, 10],
         [175, 68, 10],
         [188, 84, 5],
         [173, 77, 9],
         [173, 70, 10],
         [180, 76, 38],
         [183, 83, 12],
         [178, 72, 10],
         [178, 80, 46],
         [175, 65, 10],
         [183, 73, 40]]
    X += [[165, 54, 7],
          [165, 56, 8],
          [160, 60, 7],
          [180, 58, 9],
          [163, 48, 6],
          [170, 52, 8],
          [160, 58, 8],
          [163, 52, 7],
          [168, 54, 9],
          [168, 54, 8],
          [170, 59, 9],
          [155, 51, 6],
          [155, 54, 8],
          [158, 52, 7],
          [160, 52, 8],
          [157, 49, 7],
          [178, 64, 10],
          [160, 54, 7],
          [173, 55, 8],
          [152, 49, 7],
          [173, 57, 8],
          [168, 53, 32],
          [168, 57, 7],
          [160, 60, 8]]

    Y = ['male'] * 16 + ['female'] * 24

    # Data for testing
    # [height, weight, shoe_size]
    X_test = [
        [188, 70, 38], [189, 94, 34], [180, 70, 42], [159, 61, 37], [165, 58, 39],
        [162, 54, 34], [171, 60, 40], [170, 70, 40], [143, 45, 37], [153, 48, 39]
    ]

    Y_test = ['male', 'male', 'male', 'female', 'male',
              'female', 'male', 'male', 'female', 'female']

    # DecTree
    clf_tree = tree.DecisionTreeClassifier()
    clf_tree.fit(X, Y)
    clf_predict_tree = clf_tree.predict(X_test)
    print("Predict DTree :", clf_predict_tree)

    # KNeighbors
    clf_kneighbors = KNeighborsClassifier()
    clf_kneighbors.fit(X, Y)
    clf_predict_neighbors = clf_kneighbors.predict(X_test)
    print("Predict Neighbors :", clf_predict_neighbors)

    # GaussianNB
    clf_gaus = GaussianNB()
    clf_gaus.fit(X, Y)
    clf_predict_gaus = clf_gaus.predict(X_test)
    print("Predict Gaussian :", clf_predict_gaus)

    # RandomForest
    clf_ranfor = RandomForestClassifier()
    clf_ranfor.fit(X, Y)
    clf_predict_ranfor = clf_ranfor.predict(X_test)
    print("Predict Random Forest :", clf_predict_ranfor)

    # Summary: the classifiers KNeigbors and Gaussian naive bayes where the most accurate ones.

#===============================CODE - 4 ============================

def code4():
    #from Data.BasicDataClf import getShoeFeature, getShoeLabel, getShoeFeaturesTest, getShoeLabelTest
    from sklearn import tree
    from sklearn.ensemble import AdaBoostClassifier, RandomForestClassifier
    from sklearn.naive_bayes import GaussianNB
    from sklearn.neighbors import KNeighborsClassifier
    from sklearn.metrics import accuracy_score
    #-------------------------------------------
    def getShoeFeature():
        X = [
            [181, 80, 44], [177, 70, 43], [160, 60, 38], [154, 54, 37], [166, 65, 40],
            [190, 90, 47], [175, 64, 39], [177, 70, 40], [159, 55, 37], [171, 75, 42],
            [181, 85, 43]
        ]
        return X

    def getShoeLabel():
        Y = [
            'male', 'male', 'female', 'female', 'male', 'male',
            'female', 'female', 'female', 'male', 'male']
        return Y

    def getShoeFeaturesTest():
        X_test = [
            [188, 70, 38], [189, 94, 34], [180, 70, 42], [159, 61, 37], [165, 58, 39],
            [162, 54, 34], [171, 60, 40], [170, 70, 40], [143, 45, 37], [153, 48, 39]
        ]
        return X_test

    def getShoeLabelTest():
        Y_test = ['male', 'male', 'male', 'female', 'male',
                  'female', 'male', 'male', 'female', 'female']
        return Y_test
    #-------------------------------------------

    X = getShoeFeature()
    Y = getShoeLabel()
    X_test = getShoeFeaturesTest()
    Y_test = getShoeLabelTest()

    # Adaboost
    clf_adaboost = AdaBoostClassifier()
    clf_adaboost.fit(X, Y)
    clf_predict_adaboost = clf_adaboost.predict(X_test)
    print("Predict Adaboost :", clf_predict_adaboost)

    # DecTree
    clf_tree = tree.DecisionTreeClassifier()
    clf_tree.fit(X, Y)
    clf_predict_tree = clf_tree.predict(X_test)
    print("Predict DTree :", clf_predict_tree)

    # GaussianNB
    clf_gaus = GaussianNB()
    clf_gaus.fit(X, Y)
    clf_predict_gaus = clf_gaus.predict(X_test)
    print("Predict Gaussian :", clf_predict_gaus)

    # KNeighbors
    clf_kneighbors = KNeighborsClassifier()
    clf_kneighbors.fit(X, Y)
    clf_predict_neighbors = clf_kneighbors.predict(X_test)
    print("Predict Neighbors :", clf_predict_neighbors)

    # RandomForest
    clf_ranfor = RandomForestClassifier()
    clf_ranfor.fit(X, Y)
    clf_predict_ranfor = clf_ranfor.predict(X_test)
    print("Predict Random Forest :", clf_predict_ranfor)

    # Accuracy Score for each classifier
    acc_adaboost = accuracy_score(Y_test, clf_predict_adaboost)
    print("Accuracy Adaboost :", acc_adaboost)

    acc_dectree = accuracy_score(Y_test, clf_predict_tree)
    print("Accuracy Decision Tree :", acc_dectree)

    acc_gauss = accuracy_score(Y_test, clf_predict_gaus)
    print("Accuracy Gaussian :", acc_gauss)

    acc_neighbors = accuracy_score(Y_test, clf_predict_neighbors)
    print("Accuracy Neighbors :", acc_neighbors)

    acc_ranfor = accuracy_score(Y_test, clf_predict_ranfor)
    print("Accuracy Random Forest :", acc_ranfor)

#===============================================================================================
#credits - siraj raval & github
