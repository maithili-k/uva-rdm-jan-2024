<img align="right" src="images/surf.jpg" width="100px">
<br><br>


# Data creation/reuse and analysis using Research Drive and Lisa

**Authors**
- Maithili Kalamkar Stam (SURF)
- Jorik van Kemenade (SURF)
- Claudio Cacciari (SURF)

**License**
Copyright (c) 2023, SURFsara. All rights reserved.
This project is licensed under the GPLv3 license.
The full license text can be found in [LICENSE](LICENSE).

## Premise
You heard the talk about data management principles and problems associated with in managing data. Let us see what it means in practive to 'manage data'. During your degree course you handle study material (think notes,papers, book pdfs, etc.), scripts of a fellow student/online material. You also make your study notes, projects and associated material, write your own scripts. Think of all this material as data (including your software).  

1. You create/collect/observe "data" for your study from 'somewhere' 
2. You need to save/upload this data 'somewhere' safely
3. You compute/analyze this data 'somehere' (laptop, a compute cluster,etc.) either on your own or in a collaboration
4. You publish the results 'somewhere' (e.g., github)
5. 'Something' should happen to this data and the results e.g., data stays on hard disk till disks go corrupt, uploaded 'somewhere' for reuse by 'someone' hopefully (including yourself)

> **_Food for brain:_**
>
> * How many 'somewhere' and 'something' have you dealt with so far? 
> * You heard about the data management principles, do you think you are doing well in terms of the data management steps? Do you have enough knowledge (including amongst fellow students) and enough support (within University/Institute) to do this right?
> * Expand this problem to the data in research (weather data, DNA profiles, medical data, etc.) where data is scattered across millions of files across Petabytes of data stored across several storage systems. How do you even find the necessary data (can all data be even public), analyze it and publish it?


### What we expect you to do
You can comfortably go through this exercise on your own and more importantly, at your own pace. We will take stops in intervals to see if we are all more or less on the same page and discuss together the 'Food for Brain' questions. You can of course always ask questions or help if you cannot proceed.

## 1. Prerequisites

- an account on Lisa or Snellius system at SURF
- Research Drive account username/password

## 2. Login to Lisa

In this course we will use the Lisa login node as our user interface where Research Drive can be mounted, and the node has the CLI tool icommands installed to push data into Yoda. 

Login to the Lisa compute cluster with your appropriate credentials:

```sh
ssh lcur#@lisa.surfsara.nl
```

## 3. Mount Research Drive on Lisa/ Download data from research Drive to Lisa (Jorik)

## 4. Run analysis on Lisa (Maithili/Jorik)

## 5. Push data into Yoda (Maithili)

