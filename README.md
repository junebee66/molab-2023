# molab-2023 09-June-Bee-junebee66

June's molab

# 2023-09-13 22:21:19

- jht: updated .gitignore


**🛑 some of the demo GIFs take some time to load, please be patient, thank you!🛑**

# 10 Homework
## 10.1 Saving Models
Working on saving scanned model and view as a list <br>
<img src="https://github.com/molab-itp/content-2023-Fa/assets/81065927/4abe5a86-0031-4a80-a298-10edae0d7d14" width="30%">
<img src="https://github.com/molab-itp/content-2023-Fa/assets/81065927/1c193396-6f99-4d98-9744-decfdef1eb16" width="30%">



# 09 Homework
## 9.1 Google Firebase & Video Background
This week I went to Professor's office hour to setup my firebase database app and also wrote a little pipeline to set a video in the background. However, I do receive an email saying that google api key is exposed on github. <br>
<img src="https://github.com/junebee66/molab-2023/blob/main/Week09/source/flower.gif" width="30%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week09/source/avatar.gif" width="30%">

## Sharing App Setup 
<img src="https://github.com/junebee66/molab-2023/blob/main/Week05/source/app_icon.PNG" width="30%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week09/source/mushroom.gif" width="30%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week09/source/particle.gif" width="30%">

# 08 Homework
## 8.1 Accessing data in AR Space & Problems with updating.
This week I finally was able to access the image texture node in AR space and pass the ui image as image data into that space. I watched this [YouTube tutorial](https://youtu.be/xVG1FdBT-5k?si=eMp4VuE0LhYg0PPD) to find a work around. However, I couldn't find a better way to update the AR sphere texture other than updating (reconstructing) the entire AR view. Another problem was that I couldn't update the second image generation and make the prompt input box be as wide as the screen. <br>
<img src="https://github.com/junebee66/molab-2023/blob/main/Week08/source/sand.gif" width="30%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week08/source/fish.gif" width="30%">

## Create AI 3D model in AR Scene
I planned to have the user be able to generate their own 3D assets through ai and place it in the AR space to re-envisioned and re-write stories that way. 
I have written a website to convert 2D image into 3D model with depth map [here](https://github.com/junebee66/DepthMap-To-3DModel/tree/main). I will try to write it in swift language next week.
<br>
<img src="https://github.com/junebee66/DepthMap-To-3DModel/blob/main/source/popcorn.gif" width="100%">


**🟡 Next Steps**
- depth map to 3D model
- spawning function
- Geography data to see the created assets
- export / sync the creation in AR with their VisionOS Space

# 07 Homework
## 7.1 External API Call
I recently found this ai database called [Pollinations.ai](https://pollinations.ai/), and this week I tried writing it into my app.
However, I've been having problems with passing UIimage as regular image to the AR space.

## Changing box texture with AI generated image
<img src="https://github.com/junebee66/molab-2023/blob/main/Week07/source/ai_art.gif" width="100%">



# 06 Homework
## 6.1 LiDar Sample Code from Apple
This is the 
[🍀 Sample Code](https://developer.apple.com/documentation/avfoundation/additional_data_capture/capturing_depth_using_the_lidar_camera) I used to start this project.

## Simple LiDAR implementation with ARKit
I followed Apple's tutorial to make some examples of Lidar usage with ARKit. I made a collision test, depth map viewer, obj exporter, scan with texture, and a point cloud code sketch.
<img src="https://github.com/junebee66/molab-2023/blob/main/Week06/source/collision.gif" width="100%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week06/source/depth-map.gif" width="23%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week06/source/differences.gif" width="23%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week06/source/export.gif" width="23%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week06/source/scan-with-texture.gif" width="23%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week06/source/pointcloud.gif" width="100%">


# 05 Homework
## 5.1 Unsure about functions format to write in ARKit
I have to admit that this week has been one of the busiest so far in this semester, so I didn't do as much swift cosding as I wish to have. I've been having trouble to write buttons that execute certain interactions in the 3D space with ARKit documentation.

## 5.1 Changing models and animation with clicks
<img src="https://github.com/junebee66/molab-2023/blob/main/Week05/source/halfScreen.gif" width="30%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week05/source/girlShow.gif" width="30%">

# 04 Homework
## 4.1 Reality Composer & VisionOS Problems
I feel like most of my problems every week is with the ios versions and simulator compatibility... <br>
<br>
**🔴 Reality Composer Missing** <br>
This week I spent a great amount of time going through Apple's documentation and Reddit people's help to try to figure out why is my reality composer not shown in my Xcode. 
It happened to be that Apple took away all Reality composer/ 3D kit away in Xcode 15. Therefore I took some time to clean my mac and download the older version. I used the following command code (for my own documentation, in case I forgot the command code):<br>
``xcrun simctl runtime
`` <br>
``
xcrun simctl runtime add "~/Downloads/visionOS_1_beta_4_Simulator_Runtime.dmg"
``
<br>
<br>
**🔴 VisionPro Missing** <br>
I realized that only Xcode 15 beta8 has VisionOS Simulator. The latest Xcode 15 does not support development on Macbook with Intel Chip.
<img src="https://github.com/junebee66/molab-2023/blob/main/Week04/source/xcode15-m2.png" width="50%">
<br>

## 4.2 Music & Time
I made a little AR space where if you tap on the fox, music will start to play. The texts are also set to when tapping on fox or planets. <br>
![](https://github.com/junebee66/molab-2023/blob/main/Week04/source/realityProFox.gif)
<img src="https://github.com/junebee66/molab-2023/blob/main/Week04/source/FoxHold.gif" width="40%">
<img src="https://github.com/junebee66/molab-2023/blob/main/Week04/source/PlanetSmall.gif" width="40%">
<br>
<br>
I also made a little UI stuff in VisionOS.
![](https://github.com/junebee66/molab-2023/blob/main/Week04/source/VisionProTest.gif)


# 03 Homework
## 3.1 Swift ARKit Exploration & Problems
I've been a little buzy this week but was still able to catch up the 100 days of Swift to Day 15. I've been exploring the AR kit on my own too to prepare for my final project. However, I've been having problems to find the Reality Composer Pro on my Xcode > Developer Tool, so I just hard coded most things which is (not gonna lie) a bit tedious.. 

## 3.2 Placing, Animating, Converting 3D Objects

![](https://github.com/junebee66/molab-2023/blob/main/Week03/source/leaves.gif)

![](https://github.com/junebee66/molab-2023/blob/main/Week03/source/AR_Butterfly.gif)
![](https://github.com/junebee66/molab-2023/blob/main/Week03/source/AR_Box.gif)
![](https://github.com/junebee66/molab-2023/blob/main/Week03/source/AR_ball.gif)
![](https://github.com/junebee66/molab-2023/blob/main/Week03/source/AR_Draw.gif)


# 02 Homework
## 2.0 Question
⚠️ Is anyone also experincing problems with downloading the IOS 17.0 Simulator? I see a lot of people talking about it on the Apple's forum since yesterday. It seems like Apple hasn't done anything about it, but it is preventing me from seeing the UI images I coded in the playground (I couldn't run it...) If anyone has a solution, please let me know! my email is jmb10035@nyu.edu

[🔴 Apple Forum](https://developer.apple.com/forums/thread/737648) <br>
 <br>
I found the SOLUTION!!! You can just follow the answer in this Stackoverflow post: <br>
[💡 iOS 17.0 Simulator (21A328) Failed with HTTP status 400: bad request](https://stackoverflow.com/questions/77133646/ios-17-0-simulator-21a328-failed-with-http-status-400-bad-request)

![](https://github.com/junebee66/molab-2023/blob/main/Week02/sources/Screenshot%202023-09-20%20at%2012.25.43%20PM.png)

## 2.1 Swift Graphics 2D & 3D Learning
This is the directions I went on for this assignment <br>
→ 2D graphics > 2D graphics animation > 3D viewer > 3D in different colors > Generative 3D

I might be a little off topic for this assignment because I went into the rabbit hole of 3D. I was interested in how the 3D geometry rendering ability of swift is capable of since I will be doing the AR and VR integration for the final project. <br>

🤲🏻 For people who are interested, I used [SceneKit](https://developer.apple.com/documentation/scenekit/) for this project

![](https://github.com/junebee66/molab-2023/blob/main/Week02/sources/graphic.png)
![](https://github.com/junebee66/molab-2023/blob/main/Week02/sources/3DSpheres_1.gif)
![](https://github.com/junebee66/molab-2023/blob/main/Week02/sources/3dSpheresFloating_1.gif)
![](https://github.com/junebee66/molab-2023/blob/main/Week02/sources/3DModelColor_1.gif)
![](https://github.com/junebee66/molab-2023/blob/main/Week02/sources/3dModelMaterial_1.gif)
![](https://github.com/junebee66/molab-2023/blob/main/Week02/sources/3dBoxesFloating.gif)

I’m planning on dive deeper into the AR kit and vision OS data transfer compatibility with IOS for future homework assignments.

# 01 Homework
## 1.1 Swift Fundamentals
I watched the Swift 100 days to day 2 and starting to look through Swift look book for most what I need and build the text art. This week has been a bit chaotic with my course registration, but I'll start spending more time int the following weeks).<br>
>⏰ : 4hr in total<br>

## 1.2 Text Art Playground
Uploaded to class wiki 
[Forest & Rabbit](https://github.com/junebee66/molab-2023/tree/main/Week01) </br>

![](https://github.com/junebee66/molab-2023/blob/main/Week01/images/forest-rabbit-demo.png)


# 01 Class Post
### 💛 Favorite App
This might be weird but my favorite app on my phone is my "Bank of America" app. It is the only app that I feel like the UI really makes sense and actually makes complicated tasks a lot easier.
### ⭐️ Project Idea: </br>
* Mobile Integration for VR (Vision Pro) 
* No Code for Vision OS <br>
<br>
<br>

