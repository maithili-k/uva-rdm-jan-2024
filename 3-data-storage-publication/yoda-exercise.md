1. login to yoda portal and find your way around a little - https://servicedesk.surf.nl/wiki/display/WIKI/Getting+started+with+the+Yoda+portal
2. you have uploaded alice-final.txt to Lisa, do you see it on the Yoda portal, where is it and why?
3. now that you have the final version of the data, think of how you would describe it best (keywords, etc) to share in the future?
4. think of this in metadata context
5. add metadata and publish
6. what happends after it is published (PID, reusability, etc)? what does it mena data is published
7. if it is public, can you download it? 

# Data storage and publication using Yoda

**Authors**
- Maithili Kalamkar Stam (SURF)
- Jorik van Kemenade (SURF)
- Claudio Cacciari (SURF)

**License**
Copyright (c) 2023, SURFsara. All rights reserved.
This project is licensed under the GPLv3 license.
The full license text can be found in [LICENSE](LICENSE).

## What is expected of you in this module
We will continue following the steps you read in the [premise](https://github.com/maithili-k/uva-rdm-jan-2023/blob/main/2-data-creation-and-analysis/lisa-researchdrive-exercise.md). We will focus on steps 4 and 5 of the premise in this module. You shall be using the workflow defined in this module and can find the generic how-to's on SURF's Yoda documentation pages. The relevant pointers in the documentation are provided for each steps below.

> **_Food for thought:_**
>
> * In your daily work, what do you typically do with data/software that you used for your work (e.g., assignments, projects)? Store it on dropbox, SURFdrive, on your computer, github, etc.
> * Do you think it can be used by someone else, how can you ensure that?
> * Let's say, you have made your work publicly available (e.g., on github). Do you think you have provided sufficient details (think traceability, versioning, reproducability, information about data aka metadata, licence, GDPR, etc.) for it to be of enough quality to be reusable? If this 'metadata' is not rich enough/informative enough, can it be put to use? Would you remember all the details a year from now?
> * Now extend this problem to all scientific domains where thousands of researchers build their work on existing research and data spread across Exabytes of data in billions of files, how is it done there? This is why research data management is important!

## 1. Prerequisites

- Module 2 [exercise](https://github.com/maithili-k/uva-rdm-jan-2023/blob/main/2-data-creation-and-analysis/lisa-researchdrive-exercise.md) is completed
- You have an account on Yoda at SURF

## 2. Login to the Yoda portal

Yoda is a research data management service that enables researchers to securely deposit, share, publish and preserve large amounts of research data during all stages of a research project.

There are several ways to connect to Yoda (e.g., via a [network disk](https://servicedesk.surf.nl/wiki/display/WIKI/Connecting+to+Yoda+via+network+disk) or clients such as [icommands](https://servicedesk.surf.nl/wiki/pages/viewpage.action?pageId=19824798), rclone or via a webportal). In this tutorial, you will upload data to Yoda with rclone and then use the web portal to publish the results.

You shall have received the username and password with which you can login to the [SURF's Yoda service](https://scuba-yoda.irods.surfsara.nl/). 

## 3. Familiarize yourself with the Portal
You can view the Yoda portal via any browser. Once you have logged in, please familiarize yourself with the Yoda environment. The details can be found in our [Yoda documentation](https://servicedesk.surf.nl/wiki/display/WIKI/Getting+started+with+the+Yoda+portal). 

> **_Food for thought:_**
>
> * Can you think of a situation for yourself when the separation of Research and Vault could be useful? 
> * Do you already use something similar in your daily work? If not, could Yoda be benificial to you?

## 4. Upload your results to Yoda
Now that you know a little more about Yoda and are little familiar with the environment let us push some data into Yoda. You ran analysis on Lisa and have a result to show. In this step you shall upload the result output from Lisa to Yoda. 

The Yoda username/password you received allows you to interact with Yoda via a browser. However, from the Lisa login node we shall use a command line client to upload data. You already used rclone to interact with Research Drive and will use the same client to upload your results to Yoda, but with Yoda's data access password. You can find the insrtructions [here](https://servicedesk.surf.nl/wiki/display/WIKI/How+to+get+a+Data+Access+Password) to generate a temporary password. 

The password cannot be reaily used as rclone client requires an "obscurated" password:

```
rclone obscure passwordstring
```
The output generated is your obscured password. Let us test if you can access Yoda with rclone. (Check if this clashes with Research Drive rclone config clashes)

```
rclone ls :webdav: --no-check-certificate --webdav-url=https://scuba-data.irods.surfsara.nl --webdav-vendor=other --webdav-user=your-yoda-account@something.nl --webdav-pass=myobscurepassword
```

Now with the following command, upload your result(s) to Yoda. 

```
rclone move result.txt :webdav:path/to-upload --no-check-certificate --webdav-url=https://scuba-data.irods.surfsara.nl --webdav-vendor=other --webdav-user=your-yoda-account@something.nl --webdav-pass=myobscurepassword
```
Check with rclone if the upload succeeded. Now go to the Yoda portal and see if you can fild your uploaded result.

> **_Food for thought:_**
>
> * Why did the data end up in Research and not Vault? 

