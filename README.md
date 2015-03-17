mdkn-ios
===

## Installation

1. Clone this repository

        $ git clone git@github.com:HayatoKato/mdkn-ios.git

2. Move to project root

        $ cd mdkn-ios

3. Install the dependencies. (We use [CocoaPods](https://github.com/cocoapods/cocoapods))

        $ bundle install
        $ pod install

4. Use xcworkspace not xcodeproj

        $ open mdkn-ios.xcworkspace

## Contribution

1. Create Your Branch

    When you do new feature development, you create a new branch off the master branch:

        git checkout -b feature/my_new_branch

    When you fix bug or modify specification, you create a hotfix branch off the master branch:

        git checkout -b hotfix/my_new_branch

2. Update Your Branch

   It's pretty likely that other changes to master have happened while you were working. Go get them:

        git checkout master
        git pull origin master

   Reapply your patch on top of the latest changes:

        git checkout feature/my_new_branch
        git merge master

3. Run Test Suite

   Tests still pass? Change still seems reasonable to you? Then move on.

4. Push and Create PullRequest

