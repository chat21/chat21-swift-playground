Chat21 is the core of the open source live chat platform [Tiledesk.com](http://www.tiledesk.com).

# chat21-swift-playground
This App shows some basic features of Chat21 iOS with Swift language.
Please follow the instructions to run this project.

## Prerequisites

Before you begin, you first need to set up your environment:

1. Xcode 9.0 or later
2. An Xcode project targeting iOS 9 or above
3. The bundle identifier of your app

## Firebase setup

### **Create a Firebase project**

Sign up on Firebase and create a project. Please refer directly to Firebase [https://firebase.google.com](https://firebase.google.com/) to accomplish and better understand this task. Chat21 relies on Firebase as the backend, so it's really important for you to acquire familiarity with Firebase and all of his services.

### Setup the backend for your project

After you successfully created a Firebase project you must **setup the backend**. Please follow this link to install [**Chat21 cloud functions**](https://github.com/chat21/chat21-cloud-functions) on your just created Firebase project.

## Configure authentication

Now with the setup of your Firebase project and backend functions installed you can enable email authentication to provide an easy way for your app to sign in with email and password.

Enable **email signin** in Firebase console:

![](http://www.chat21.org/wp-content/uploads/2018/02/firebase-add-user-step0-1500x746.png)

Create a user to test chat functions:

![](http://www.chat21.org/wp-content/uploads/2018/02/firebase-add-user-step1-1500x692.png)

Choose email and password:

![](http://www.chat21.org/wp-content/uploads/2018/02/firebase-add-user-step2-1500x692.png)

Add the user with “ADD USER” button.

## Create the Firebase iOS App

Switch on the project on Firebase, go to the _Firebase Console_ &gt; _Project Overview_ and add a **iOS App** to your project by clicking on “Add iOS App” and follow the setup steps.

When prompted, enter your app’s bundle ID. It’s important to enter the bundle ID your app is using, this can only be set when you add an app to your Firebase project.

At the end, you’ll download a **GoogleService-Info.plist** file. You can download this file again at any time.

Now add this file to your Xcode project root using the Add Files utility in Xcode \(from the File menu, click Add Files\). Make sure the file is included in your app’s build target.

## Add Chat21 SDK to the project

Chat21 uses CocoaPods so simply create a file named “Podfile” in the project’s root folder with the following content:

```text
platform :ios, '10.0'
use_frameworks!

target 'MyChat' do
  pod 'Chat21'
end

```

**Close Xcode** and run:

> **pod install**

From now on open the project using _MyChatAdvanced.xcworkspace_ file.
