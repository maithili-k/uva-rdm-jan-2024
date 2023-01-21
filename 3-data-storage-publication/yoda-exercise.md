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
We will continue following the steps you read in the [premise](https://github.com/maithili-k/uva-rdm-jan-2023/blob/main/2-data-creation-and-analysis/lisa-researchdrive-exercise.md). We will focus on steps 4 and 5 of the premise in this module. 

> **_Food for thought:_**
>
> * In your daily work, what do you typically do with data/software that you used for your work (e.g., assignments, projects)? Store it on dropbox, SURFdrive, on your computer, github, etc.
> * Do you think it can be used by someone else, how can you ensure that?
> * Let's say, you have made your work publicly available (e.g., on github). Do you think you have provided sufficient details (think traceability, versioning, reproducability, information about data aka metadata, licence, GDPR, etc.) for it to be of enough quality to be reusable? If this 'metadata' is not rich enough/informative enough, can it be put to use? Would you remember all the details a year from now?
> * Now extend this problem to all scientific domains where thousands of researchers build their work on existing research and data spread across Exabytes of data in billions of files, how is it done there? This is why research data management is important!

## 1. Prerequisites

- Module 2 [exercise](https://github.com/maithili-k/uva-rdm-jan-2023/blob/main/2-data-creation-and-analysis/lisa-researchdrive-exercise.md) completed
- an account on Yoda at SURF


## 2. Login to the Yoda portal

Yoda is a research data management service that enables researchers to securely deposit, share, publish and preserve large amounts of research data during all stages of a research project.

There are several ways to connect to Yoda (e.g., via a [network disk](https://servicedesk.surf.nl/wiki/display/WIKI/Connecting+to+Yoda+via+network+disk) or clients such as [icommands](https://servicedesk.surf.nl/wiki/pages/viewpage.action?pageId=19824798), rclone or via a webportal). In this tutorial, you will upload data to Yoda with rclone and then use the web portal to publish the results.

You shall have received the username and password with which you can login to the [SURF's Yoda service](https://scuba-yoda.irods.surfsara.nl/). 


## 5. Push data into Yoda

rclone obscure password
rclone move alice.txt :webdav:research-train-jun22/maithili-test/ --no-check-certificate --webdav-url=https://scuba-data.irods.surfsara.nl --webdav-vendor=other --webdav-user=maithili.kalamkarstam@surf.nl --webdav-pass=myobscurepassword
