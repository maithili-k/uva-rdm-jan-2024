# Data storage and publication using Yoda

**Authors**
- Maithili Kalamkar Stam (SURF)
- Jorik van Kemenade (SURF)
- Claudio Cacciari (SURF)
- Alice Stuart Lee (SURF)

**License**
Copyright (c) 2023, SURFsara. All rights reserved.
This project is licensed under the GPLv3 license.
The full license text can be found in [LICENSE](LICENSE).

## What is expected of you in this module
We will continue following the steps you read in the [premise](https://github.com/maithili-k/uva-rdm-jan-2024/blob/main/2-data-creation-and-analysis/snellius-researchdrive-exercise.md#premise). We will focus on steps 4 and 5 in this module. You will be using the workflow defined in this module using the how-tos on SURF's Yoda documentation, links to which are provided at each step.

> **_Food for thought:_**
>
> * In your daily work, what do you typically do with data/software that you used for your work (e.g., assignments, projects)? Do you store it on dropbox, SURFdrive, on your computer, github, etc.?
> * Do you think it can be used by someone else? How can you ensure that?
> * Let's say you have made your work publicly available (e.g., on github). Do you think you have provided sufficient details (think traceability, versioning, reproducability, information about data aka metadata, licence, GDPR, etc.) for it to be of high enough quality to be reusable? If this 'metadata' is not rich /informative enough, can the data be reused? Would you remember all the details a year from now?
> * Now extend this problem to all scientific domains where thousands of researchers build their work on existing research and data spread across exabytes of data in billions of files - how is it done there? This is why research data management is important! And knowing which tools can support you there will help!

## 1. Prerequisites

- You have an account on Yoda at SURF
- You have finished [exercise 2](https://github.com/maithili-k/uva-rdm-jan-2024/blob/main/2-data-creation-and-analysis/snellius-researchdrive-exercise.md)

## 2. Login to the Yoda portal

Yoda is a research data management service that enables researchers to securely deposit, share, publish and preserve large amounts of research data during all stages of a research project. In this module, you will use Yoda for steps 4 and 5 of the [premise](https://github.com/maithili-k/uva-rdm-jan-2024/blob/main/2-data-creation-and-analysis/snellius-researchdrive-exercise.md#premise). In this tutorial you downloaded the input data from Research Drive, but it could also have been pulled from an existing dataset already available in Yoda (think of resuability).

There are several ways to connect to Yoda (e.g., via a [network disk](https://servicedesk.surf.nl/wiki/display/WIKI/Connecting+to+Yoda+via+network+drive), via clients such as [icommands](https://servicedesk.surf.nl/wiki/pages/viewpage.action?pageId=19824798) or rclone, or via a web portal). In this tutorial, you will upload data to Yoda with rclone and then use the web portal to publish the results.

You will have received the username and password with which you can login to [SURF's Yoda service](https://scuba-yoda.irods.surfsara.nl/). 

## 3. Familiarise yourself with the portal
You can access the [Yoda portal](https://scuba-yoda.irods.surfsara.nl/) via any browser. With the username/password credentials provided in the previous step, please login and familiarise yourself with the Yoda environment. The details of the portal can be found in SURF's Yoda documentation [here](https://servicedesk.surf.nl/wiki/display/WIKI/Getting+started+with+the+Yoda+portal) (refer to the section 'Research module and the Vault'). You do not have any data in Yoda yet, so read this section for now, and we will perform some of the steps described shortly. 

> **_Food for thought:_**
>
> * Can you think of a situation for yourself when the separation of Research and Vault could be useful? 
> * Do you already use something similar in your daily work? If not, could Yoda be benificial to you?

## 4. Upload your results to Yoda
Now that you know a little more about Yoda and are a little bit familiar with the environment, let us first push some data into Yoda from Snellius. 

The Yoda username/password you received allows you to interact with Yoda via a browser. From the Snellius login node we will use a command line client to upload data. You already used rclone to interact with Research Drive and will use the same client to upload your results to Yoda, but with Yoda's data access password. You can find the instructions [here](https://servicedesk.surf.nl/wiki/display/WIKI/How+to+get+a+Data+Access+Password) to generate a temporary password. 

The password cannot be readily used as the rclone client requires an "obscured" password:

```
rclone obscure passwordstring
```
The output generated is your obscured password. Let us test if you can access Yoda with rclone. In the command below, you are using rclone without creating a configuration as for Research Drive (but you can also create a configuration for Yoda)

```
rclone ls :webdav: --no-check-certificate --webdav-url=https://scuba-data.irods.surfsara.nl --webdav-vendor=other --webdav-user=your-yoda-account@something.nl --webdav-pass=myobscurepassword
```
If you do not get an error but also see no output, don't worry. As you do not have any data, there should not be any output. Now with the following command, upload your result(s) to Yoda. 

First let us create a folder for yourself so you do not mix up your results with others. Pay attention to the folder name that you create. E.g., if you are yodauser5@sharklasers.com then create a folder called yodauser5_collection

```
rclone mkdir :webdav:research-uva-2023/yodauserX_collection --no-check-certificate --webdav-url=https://scuba-data.irods.surfsara.nl --webdav-vendor=other --webdav-user=yodauserX@sharklasers.com --webdav-pass=myobscurepassword
```
Check with rclone or via the web portal to see if it succeeded. Now copy the result to your Yoda folder.

```
rclone copy result-XXXXXXXXX.txt :webdav:research-uva-2023/yodauserX_collection --no-check-certificate --webdav-url=https://scuba-data.irods.surfsara.nl --webdav-vendor=other --webdav-user=yodauserX@sharklasers.com  --webdav-pass=myobscurepassword
```
Check with rclone ls command to see if the upload succeeded. Now go to the Yoda portal and see if you can find your uploaded result.

> **_Food for thought:_**
>
> * Why did the data end up in Research and not Vault? 

## 5. Archive your uploaded results in Yoda

In Yoda, when you archive the data, several steps need to happen before the data can be considered archived. These are as follows:
1. You need to ensure that the current data is complete and well structured, because it should no longer be changed after it is archived. This step is the creation of a data package
2. You need to enrich the metadata such that it can be used by anyone and in the long term
3. Then you can submit the data package to the Vault
4. The data manager will assess the data package and then approve, reject or suggest improvements. The approved data packages are published

Please go through the food for thought section below before archiving the data.

> **_Food for thought:_**
>
> * What is the difference between data storage and data archiving? When do you do one or the other?
> * What is the role of metadata here? 
> * Think of all the steps you performed so far, and now think how you would describe this as metadata that can be understood by anyone
> * What would you like to know about the data/software if you were to reuse someone else's data? This is important metadata
> * Can you think of a standardised template that can be used for metadata in your field of work? Yoda can support various metadata templates

You can find the necessary details to perform the archivng steps [here](https://servicedesk.surf.nl/wiki/display/WIKI/How+to+archive+data+packages). You do not have the data manager role, so someone else will have to evaluate your request

## 6. Publish your uploaded results in Yoda

Now that you have an immutable dataset archived in the Vault of Yoda, you may wish to try publishing using the instructions [here](https://servicedesk.surf.nl/wiki/display/WIKI/How+to+publish+data+packages), but first read the food for thought below and note that, as this is a test dataset, you will not actually be publishing the data but doing a dry run.

> **_Food for thought:_**
>
> * What is an immutable dataset? 
> * Is is necessary to publish a dataset? Isn't archiving it enough? What's the difference between these two? 
> * What is a DOI? Have you encountered this term before?
> * Do I HAVE to publish my dataset? Is it the same as making the data publicly accessible? What about GDPR?
> * Can I publish only my metadata? 
> * The data used in this exercise is publicly available and can be reused as per the licence, but what if this was personal/sensitive/medical data? How do researchers in that domain find data, evaluate its reusability, share data and collaborate? 
> * Can you search (think data discovery) for the datasets from your fellow participants in this course? Are they reusable, can you find such a dataset?
> * Do you know of other data repositories? Can you download data from there, or make your dataset/metadata findable in those repositories?


## Reflection
You have just gone through the typical life cycle of a dataset in the field of scientific research. Every action you took brought you closer to doing data management in a correct way. Data management is becoming increasingly important and now you are better equipped to put it into practice!
