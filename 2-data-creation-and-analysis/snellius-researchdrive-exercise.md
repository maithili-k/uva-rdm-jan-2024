<img align="right" src="images/surf.jpg" width="100px">
<br><br>


# Data creation/reuse and analysis using Research Drive and Snellius

**Authors**
- Maithili Kalamkar Stam (SURF)
- Jorik van Kemenade (SURF)
- Claudio Cacciari (SURF)

**License**
Copyright (c) 2023, SURFsara. All rights reserved.
This project is licensed under the GPLv3 license.
The full license text can be found in [LICENSE](LICENSE).

## Premise
You heard the talk about data management principles and problems associated with managing data. Let us see what it means in practice to 'manage data'. During your degree course you handle study material (think notes, papers, book pdfs, etc.), scripts of a fellow student/online material. You also make your study notes, projects and associated material, write your own scripts. Think of all this material as data (including your software) and the data life cycle that was mentioned.  

1. You create/collect 'data' for your study from 'somewhere' 
2. You need to save/upload this data 'somewhere' safely
3. You compute/analyze this data 'somewhere' (laptop, a compute cluster,etc.) either on your own or in a collaboration
4. You publish the results 'somewhere' (e.g., github)
5. 'Something' should happen to this data and the results e.g., data stays on hard disk till disks go corrupt, uploaded 'somewhere' for discovery and reuse by 'someone' hopefully (including yourself)

> **_Food for thought:_**
>
> * How many 'somewhere' and 'something' have you dealt with so far? 
> * You heard about the data management principles, do you think you are doing well in terms of the data management steps? Do you have enough knowledge (including amongst fellow students) and enough support (within University/Institute) to do this right?
> * Expand this problem to the data in research (weather data, DNA profiles, medical data, etc.) where data is scattered across millions of files across Petabytes of data stored across several storage systems. How do you even find the necessary data (can all data be even public), analyze it and publish it?


### What we expect you to do
In this assignment we will focus on data management in the active phase of research. Imagine you are part of a group of researchers that is analysing the literary works of Lewis Carol. Your task is to analyse Alice in Wonderland. You get access to the full text via Research Drive, use Snellius to analyse the text, and share the results with your collaborators. You can comfortably go through this exercise on your own pace. We will take stops in intervals to see if we are all more or less on the same page and discuss together the 'Food for thought' questions. You can of course always ask questions or help if you cannot proceed.

## 1. Prerequisites

- an account on Snellius system at SURF
- Research Drive account username/password

## 2. Login to Snellius

In this course we will use the Snellius (Dutch National Supercomputer hosted SURF) login node as our user interface where Research Drive can be mounted, and the node has the CLI tool icommands installed to push data into Yoda.

Login to the Snellius compute cluster with your appropriate credentials:

```sh
ssh lcurXXXX@lisa.surfsara.nl
```

## 3. Mount Research Drive on Snellius/Download data from research Drive to Snellius

We start with the first step of the Research Data Life Cycle: acquire data that needs to be processed. For this assignment you have to download the data from Researchdrive. The most efficient way to move data from Researchdrive to Snellius is through rclone. To configure rclone for Researchdrive we ask you to [this guide](https://wiki.surfnet.nl/display/RDRIVE/Access+Research+Drive+via+Rclone) in our documentation. You shall receive credentials for your Research Drive account during the handson session. The portal can be found [here](https://demo.data.surfsara.nl) where you shall create the password for the further steps.

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
lcurXXXX@login3:~$ rclone ls "RD:"
  3308028 Training (Projectfolder)/Hands-on.pdf
 12621077 Training (Projectfolder)/ResearchDriveTraining-Onboarding.pdf
   183769 Training (Projectfolder)/UvA HPC Course Material/alice-in-wonderland.txt
```
This needs to be copied to your home folder:

```sh
rclone copy "RD:Training (Projectfolder)/UvA HPC Course Material" input
```

There are a couple of things to note here. First, the source path is placed within `""`. This is to make sure that the shell does not interpret all spaces and other possible characters. Second, the desitnation file has a different name, this is important for the scripts you are using in the later steps.

> **_Food for thought:_**
> * Are you sure you have the permission to 'just use' this dataset (just because you can download something does not mean you can just use it) or did you do something illegal? What kind of licence allows free reuse of data?
> * What if you did not have the permission to access the data? How would you go about it?
> * We are using Research Drive via rclone, in our [documentation](https://wiki.surfnet.nl/display/RDRIVE/How+to+upload+or+download+your+files) you can find multiple methods to move data around. What are the advantages and disadvantages of each method and when would you recommend one over the other?
> * Snellius has multiple filesystesms, in our (fix this link)[documentation](https://servicedesk.surf.nl/wiki/display/WIKI/Lisa+hardware+and+file+systems) you can find more information. What would be the right place for storing the data from this assignment? What type of data would you store on each filesystem?
> * Research Drive and Snellius' local file systems have different use cases. When would you use on over the other?

## 4. Run analysis on Snellius
Once you have acquired the data (steps 1 and 2 of the premise, first step of the Research Data Life Cycle), it is time for the next step: analyzing the data. To analyze the data, you also need to get some software or scripts. For this project you need a job script that can performa a word count on the acquired data. To get the jobt script run the following command: 

```sh
wget https://raw.githubusercontent.com/maithili-k/uva-rdm-jan-2023/main/2-data-creation-and-analysis/jobscript.sh
```

The jobscript start a short job that runs a wordcount on all files in the defined input directory (default is `/home/lcurXXXX/input/`) and writes the result in the output directory (default is `/home/lcurXXXX/result/`) in a results file that contains the ID of the SLURM job.

To submit the job run the following command:

```
sbatch jobscript.sh
```

Once the job is finished you can inspect the result:

```
cat result/result-XXXXXXXXX.txt
````

> **_Food for thought:_**
> * When looking at the results, what do you notice? How would you change the jobscript to get rid of the noise? Would you use bash or change to a completely different implementation?
> * Downloading and uploading results is a manual process in our current workflow. Is it possible to do this as part of the job? Why would or wouldn't you do this?

## 5. Share the results
Research is mostly a collaborative effort. This means that once you ran your analysis you want to share the results with other collaborators. Start with uploding your result to your _own_ projectfolder on Research Drive:

```
rclone copy result/result-XXXXXXXXX.txt "RD:Demo XX (Projectfolder)"
```

Share the result file, or maybe even the source, with the demo account sitting next to you. You can use the [Research Drive documentation](https://wiki.surfnet.nl/display/RDRIVE/How+to+share+a+folder+or+file) to find information on how to do that.

> **_Food for thought:_**
> * If people want to reproduce the results you shared what information do they need? How do you make sure that they _can_ reproduce your work?
> * Are there differences between your result and that of other groups? Do you know why the results are different? What has changed in the wordcounting algorithm?

## Reflection
You downloaded an existing dataset, ran some analysis on it and shared the result in a collaboration. Would you be able to do it one year from now? Or a fellow student colleague of yours, and what would your instructions to him/her look like? Think of where the data would be, how would you find it, get access to it, software version, where would you run the analysis, etc. This is a very common problem. We will try to address this in the next module and introduce to you the best practices and steps you can already take to ensure you are ready to tackle "data management".
