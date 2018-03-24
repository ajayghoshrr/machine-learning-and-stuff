My opinion about these cloud platform.


- Frankly speaking, Out of Azure, Google Cloud, AWS, IBM Watson/Bluemix, I'll choose the AWS. Both VM and Machine Learning platforms.
Google cloud - finds easy to setup and run the model, same time cost compared to less. I'll go for AWS.
Because AWS is offering many platforms for machine learning- We can hire AWS for hourly basis and train our models.
If you are creating a Model for your startup/company which have huge amout of data, Please go for AWS or IBM Bluemix/watson


- As a begineer do you like to train your Machine learning model, created from Pytorch or Tensorflow, Keras or anything like that, And you have huge data you can go with floyd hub
Floyd hub is cheap and we can train small models with medium expenses.
If you are a beginner , Go with "FLOYD". 



Instrcutions for Beginners - Platform name - Floyd

1 - Go to their website https://www.floydhub.com and create an account. Verify your mail.


2 - Open the command prompt and download the Floyd CLI using  - "pip install -U floyd-cli" 


3 - Go through the Dashboard. It almost like git. All command will be there in the UI itself.


4 - Using command line , if you want to login to your account , type - floyd login


-------------------------------------------------------------------------------------------------------

floyd login

Authentication token page will now open in your browser. Continue? [Y/n]: Y

Please copy and paste the authentication token.

This is an invisible field. Paste token and press ENTER:

Login Successful as ajayghoshrr

--------------------------------------------------------------------------------------

You will redirect to the web page contain the Authkey. Copy it and paste it. Press Enter.

Now you are logged in to the Floyd

5 - This is an important step. You must be having your training model with you. It must be Jupyter or Codes and You might be used Pytorch or Tensorflow or Keras
  You might be having datasets attached to the code. 
  You must be having lot of training/testing data - You have to add that into the Floyd
  In Dashboard you can add.
  ![alt text](https://github.com/ajayghoshrr/machine-learning-and-stuff/master/floyd_setup.png)
  
  or You can easily add through command prompt.
  
  $ git clone https://github.com/ajayghoshrr/machine-learning-and-stuff.git   - Git command
  $ cd <path-of-your-model>
  $ floyd init quick-start
  
  Then from Dashboard , you can choose instances - CPU or GPU 
  
  then Which package - Tensorflow or Keras or PyTorch

  Which type - Jupyter (Recommended) or Code
  
  You can add datasets etc.
  
  example command for train - floyd run --gpu --mode jupyter --env pytorch-0.2 (GPU mode, Jupyter Notebook, Pytorch environment)
  
  It will take time to train your model depends on Dataset and code complexity.

  After training you can see the out on Jupyter. You can take your model as pickle as well.
