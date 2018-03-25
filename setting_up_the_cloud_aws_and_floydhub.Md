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
  ![alt text](https://github.com/ajayghoshrr/machine-learning-and-stuff/blob/master/floyd_setup.PNG)
  
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


AWS - 

Go to https://us-east-2.console.aws.amazon.com/console/

Select the Launch Virtual Machine

Choose an Amazon Machine Image (AMI) -  For Deep Learning - My opinion is - sg-c4dd91af -  Linux environment with all packages

Choose the instances

Launch the Virtual Machine

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html

https://linuxacademy.com/howtoguides/posts/show/topic/17385-use-putty-to-access-ec2-linux-instances-via-ssh-from-windows

-----------------------------------------------------------------------------------------------------------------------------
Authenticating with public key "imported-openssh-key"
=============================================================================
       __|  __|_  )
       _|  (     /   Deep Learning AMI  (Ubuntu)
      ___|\___|___|
=============================================================================

Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-1052-aws x86_64v)

Please use one of the following commands to start the required environment with                                                                                         the framework of your choice:

for MXNet(+Keras1) with Python3 (CUDA 9) _____________________ source activate m                                                                                        xnet_p36

for MXNet(+Keras1) with Python2 (CUDA 9) _____________________ source activate m                                                                                        xnet_p27

for TensorFlow(+Keras2) with Python3 (CUDA 8) ________________ source activate t                                                                                        ensorflow_p36

for TensorFlow(+Keras2) with Python2 (CUDA 8) ________________ source activate t                                                                                        ensorflow_p27

for Theano(+Keras2) with Python3 (CUDA 9) ____________________ source activate t                                                                                        heano_p36

for Theano(+Keras2) with Python2 (CUDA 9) ____________________ source activate t                                                                                        heano_p27

for PyTorch with Python3 (CUDA 9) ____________________________ source activate p                                                                                        ytorch_p36

for PyTorch with Python2 (CUDA 9) ____________________________ source activate p                                                                                        ytorch_p27

for CNTK(+Keras2) with Python3 (CUDA 8) ______________________ source activate c                                                                                        ntk_p36

for CNTK(+Keras2) with Python2 (CUDA 8) ______________________ source activate c                                                                                        ntk_p27

for Caffe2 with Python2 (CUDA 9) _____________________________ source activate c                                                                                        affe2_p27

for Caffe with Python2 (CUDA 8) ______________________________ source activate c                                                                                        affe_p27

for Caffe with Python3 (CUDA 8) ______________________________ source activate c                                                                                        affe_p35

for Chainer with Python2 (CUDA 9) ____________________________ source activate c                                                                                        hainer_p27

for Chainer with Python3 (CUDA 9) ____________________________ source activate c                                                                                        hainer_p36

for base Python2 (CUDA 9) ____________________________________ source activate p                                                                                        ython2

for base Python3 (CUDA 9) ____________________________________ source activate p                                                                                        ython3


Official Conda User Guide: https://conda.io/docs/user-guide/index.html

AWS Deep Learning AMI Homepage: https://aws.amazon.com/machine-learning/amis/

Developer Guide and Release Notes: https://docs.aws.amazon.com/dlami/latest/devg                                                                                        uide/what-is-dlami.html

Support: https://forums.aws.amazon.com/forum.jspa?forumID=263

 * Documentation:  https://help.ubuntu.com
 
 * Management:     https://landscape.canonical.com
 
 * Support:        https://ubuntu.com/advantage
 

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

79 packages can be updated.

0 updates are security updates.




The programs included with the Ubuntu system are free software;

the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.


Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.




Connect through putty to linux - and enjoy - Play with AWS features

 ![alt text](https://github.com/ajayghoshrr/machine-learning-and-stuff/blob/master/amazon_ml_features.PNG)
