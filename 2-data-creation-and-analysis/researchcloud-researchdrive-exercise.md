<img align="right" src="images/surf.jpg" width="100px">
<br><br>


# Data creation/reuse and analysis using Research Drive and SURF Research Cloud

**Authors**
- Maithili Kalamkar Stam (SURF)
- Jorik van Kemenade (SURF)
- Claudio Cacciari (SURF)
- Steven Voges (SURF)
- Alice Stuart Lee (SURF)

**License**
Copyright (c) 2023, SURFsara. All rights reserved.
This project is licensed under the GPLv3 license.
The full license text can be found in [LICENSE](LICENSE).

## Premise
You heard the talk about data management principles and problems associated with managing data. Let us see what it means in practice to manage data. During your degree course you handle study material (think of notes, papers, book pdfs, scripts, and online material). You also make your own study notes, contribute to projects and associated material, and write your own scripts. Think of all this material as data (including your software) and consider the data life cycle.  

1. You create/collect 'data' for your study from 'somewhere' 
2. You need to save/upload this data 'somewhere' safely
3. You compute/analyse this data 'somewhere' (a laptop, compute cluster, etc.) either on your own or in a collaboration
4. You publish the results 'somewhere' (e.g., github)
5. 'Something' should happen to this data and the results, e.g., data stays on hard disk till disks go corrupt, or data are uploaded 'somewhere' for discovery and reuse by 'someone' hopefully (including yourself)

> **_Food for thought:_**
>
> * How many versions of 'somewhere' and 'something' have you dealt with so far? 
> * You heard about the data management principles - do you think you are doing well in terms of the data management steps? Do you have enough knowledge (including among fellow students) and enough support (within your institute) to do this right?
> * Expand this problem to the data in various research areas (weather data, DNA profiles, medical data, etc.) where millions of files containing petabytes of data are scattered across several storage systems. How do you even find the necessary data (can all data be public?), analyse it and publish it?


### What we expect you to do
In this assignment we will focus on data management during the active phase of research. Imagine you are part of a group of researchers that is analysing the literary works of Lewis Carol. Your task is to analyse Alice in Wonderland. You get access to the full text via the storage service Research Drive, use the SURF Research Cloud to analyse the text, and share the results with your collaborators via the Yoda Data Management Service. You can comfortably go through this exercise at your own pace. We will pause at intervals to see if we are all more or less on the same page and discuss together the 'Food for thought' questions. You can of course always ask questions or for help if you cannot proceed.

## 1. Prerequisites

- access to SURF Research Cloud
- Research Drive account username/password

## 2. Login to SURF Research Cloud

In this assignment we will use the SURF Research Cloud as our user interface where we will mount Research Drive and download data, run analysis in the workspace and upload output into Yoda.

Login to the SURF Research Cloud Workspace:

For this part of the assignment you need to login to an Ubuntu-based workspace on SURF Research Cloud. You performed all the steps to reach this point in your SURF Research CLoud training earlier this week. If you already have a workspace running and can ssh/login to that workspace, you may skip the following 2 steps. 

1] Followed the instructions [here](https://servicedesk.surf.nl/wiki/display/WIKI/Hands-On+for+Introduction+to+SURF+Research+Cloud) to create your own Ubuntu-based workspace, if you do not already have one. 
2] Then proceed to [login/ssh](https://servicedesk.surf.nl/wiki/display/WIKI/Log+in+to+your+workspace) into the workspace

Install Rclone client:
Once you have logged in, run the following command to install the Rclone client:

```sh
sudo apt install rclone -y
```

## 3. Mount Research Drive on Research Cloud/Download data from Research Drive to Research Cloud

We start with the first step of the Research Data Life Cycle: acquire data that needs to be processed. For this assignment you have to download the data from Research Drive. The most efficient way to move data from Research Drive to Research Cloud is through Rclone, which you installed in the previous step. You need to configure it for Research Drive. You will receive credentials for your Research Drive account during the hands-on session. Please refer to [this guide](https://wiki.surfnet.nl/display/RDRIVE/Access+Research+Drive+via+Rclone) in our documentation to configure Rclone. The portal can be found [here](https://demo.data.surfsara.nl) where you will create the password to proceed.

The final config should look something like this:

```
[RD]
type = webdav
url = https://demo.data.surfsara.nl/remote.php/webdav/
vendor = owncloud
user = demoXX
pass = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

Once you have configured rclone you can inspect the remote location:

```
(fix this line) lcurXXXX@login3:~$ rclone ls RD:
 3308028  Training (Projectfolder)/Hands-on.pdf
 15747551 Training (Projectfolder)/ResearchDriveTraining-Onboarding.pdf
   104077 UvA-HPC (Projectfolder)/UvA HPC Course Material/alice-in-wonderland.txt
```
This needs to be copied to your home folder on Snellius:

```sh
rclone copy "RD:UvA-HPC (Projectfolder)/UvA HPC Course Material" input
```

There are a couple of things to note here. First, the source path is placed within quotation marks (`""`). This is to make sure that the shell does not interpret all spaces and other possible characters. Second, the destination file has a different name, which is important for the scripts you are using in the later steps.

> **_Food for thought:_**
> * Are you sure you have the permission to 'just use' this dataset (just because you can download something does not mean you can just use it) or did you do something illegal? What kind of licence allows free reuse of data?
> * What if you did not have the permission to access the data? How would you go about it?
> * We are using Research Drive via rclone, in our [documentation](https://wiki.surfnet.nl/display/RDRIVE/How+to+upload+or+download+your+files) you can find multiple methods to move data around. What are the advantages and disadvantages of each method and when would you recommend one over the other?

## 4. Run analysis on Research Cloud
Once you have acquired the data (steps 1 and 2 of the premise, first step of the Research Data Life Cycle), it is time for the next step: analysing the data. To analyse the data, you also need some software or a script. For this project you need a job script that can perform a word count on the acquired data. To get the job script, run the following command: 

```sh
wget https://raw.githubusercontent.com/maithili-k/uva-rdm-jan-2024/main/2-data-creation-and-analysis/jobscript-src.sh
```

The jobscript runs a wordcount on all files in the defined input directory (default is `/home/username/input/`) and writes the result in the output directory (default is `/home/username/result/`) in a results file that contains the ID of the SLURM job.

To submit the job run the following command:

```
$HOME/jobscript-src.sh
```

Once the job is finished you can inspect the result:

```
cat result/result.txt
````

> **_Food for thought:_**
> * Look into this - When looking at the results, what do you notice? How would you change the jobscript to get rid of the noise? Would you use bash or change to a completely different implementation?
> * Downloading and uploading results is a manual process in our current workflow. Is it possible to do this as part of a job on e.g., Dutch supercomputer Snellius? Why would or wouldn't you do this?

## 5. Share the results
Research is mostly a collaborative effort. This means that once you have run your analysis you need to share the results with other collaborators. Start by uploding your result to your _own_ projectfolder on Research Drive:

Tip! Double check your project folder's name using the rclone lsd command

```
rclone copy result/result.txt "RD:Demo XX (Projectfolder)"
```

Share the result file, or maybe even the source, with the demo account sitting next to you. You can use the [Research Drive documentation](https://wiki.surfnet.nl/display/RDRIVE/How+to+share+a+folder+or+file) to find information on how to do that.

> **_Food for thought:_**
> * If someone wants to reproduce the results you just shared in the previous step, what information do they need? How do you make sure that they _can_ reproduce your work?
> * How can you ensure they have the right licence to use your results?

## Reflection
You downloaded an existing dataset, ran some analysis on it and shared the result with a collaborator. Would you be able to do it one year from now? Or would a fellow student colleague of yours be able to? What would your instructions to them look like? Think of where the data would be, how would you find it, get access to it, what the software version is, where the analysis would be run, etc. This is a very common problem. We will try to address this in the next module and introduce to you the best practices and steps you can already take to ensure you are ready to tackle "data management".
