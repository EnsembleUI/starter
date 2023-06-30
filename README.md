## Overview
This starter project enables running and deploying Ensemble-powered Apps across iOS, Android, and Web (other platforms are not yet fully supported). It also includes examples on how to integrate Ensemble pages into your existing Flutter App.

## Setup and Run
### Prerequisite
- Install [Flutter](https://docs.flutter.dev/get-started/install) on your machine. 
- Web is supported out-of-the-box. 
- To run on iOS emulator, install Xcode and Simulator. Run `open -a Simulator`. Create a new Simulator as needed (File -> Open Simulator -> ..).
- Please follow Flutter instructions on other platforms.

### Initial Setup
- Review `/ensemble/ensemble.properties`. Update the appId as needed - this is your app's bundle ID in the format of <reversed-domain>.<project name> e.g. `com.ensembleui.myfirstapp` (all lowercase, no special characters).
- From the project root, run `flutter create --org com.ensembleui --project-name starter --platform=ios,android,web .` (note the period at the end). If you modified the appId, make sure the org and project name match the bundle ID.
- Run the App with `flutter run`. If you currently have a running iOS or Android emulator, the command will prompt for a selection, otherwise the App will be opened in the web browser.
- This will run the `helloApp` packaged with this repo. You can package your app locally, or hosted them on your own server or on Ensemble-hosted server. 
- Note: if you get this error while running on iOS simulator: 'Error (Xcode): Building for iOS Simulator, but linking in object file built for iOS', simply run `flutter run` again.

### Getting Started with Ensemble Studio
Ensemble Studio enables you to make changes to your pages and immediately broadcast the changes to your App (both native and web). Here's how to get started:
- Login or sign up at studio.ensembleui.com.
- Find your App ID. This is under the App's Settings screen, or on the App's URL `https://studio.ensembleui.com/app/<appId>/...`.
- Open up `/ensemble/ensemble-config.yaml`. 
  - Update `definitions -> from` to `ensemble` (previously `local`)
  - Update `definitions -> ensemble -> appId` with your App ID.
- Run the App with `flutter run`. Your App now fetches its pages and resources from Ensemble server.
- Go back to your App on Ensemble Studio and make any changes. Re-running the App with `flutter run` should have the latest content.

### Prepared your app for deployment
- Register your Bundle ID for iOS and Android. They should ideally be the same.
- Go back to `/ensemble/ensemble.properties`. Update the `appId` to this bundle ID and change your `appName`.
- 


### Concepts
- Each YAML definition under your app folder represents a screen.
- `theme.ensemble` allows you to make styling changes that are applicable to the entire app
- `resources.ensemble` is where you can define you own custom widgets, visible across the entire app.

## Editing definitions
Ensemble Studio includes an Online Editor for making changes with type-ahead support and enables Live Preview. However if you decide to host your own definitions, we include a JSON Schema to help with type-ahead for popular Editors.
### Android Studio
- Open Preferences and go to `Languages & Frameworks > Schemas and DTDs > JSON Schema Mappings`
- Add a new schema
- Under Schema URL, enter `https://raw.githubusercontent.com/EnsembleUI/ensemble/main/assets/schema/ensemble_schema.json`
- Select Schema version 7
- Add a Directory mapping right below, pointing to `<your_folder>/starter/ensemble/apps`.
- Editing any definition files will show the appropriate type-ahead.

### Visual Studio Code
- With [VS Code](https://code.visualstudio.com/download), open folder `/ensemble/apps`. 
- Type-ahead should just work with the the default config (in .vscode/settings.json).

## Generate release code for deployment 
- Run `flutter build web --release`. The output will be under `/build/web`
- Follow [iOS](https://docs.flutter.dev/deployment/ios), [Android](https://docs.flutter.dev/deployment/android), [MacOS](https://docs.flutter.dev/deployment/macos), [Windows](https://docs.flutter.dev/deployment/windows) release documentation.


## Misc
### Run with remote definition (to be continued)
To take advantage of Server-driven UI (change your UI at anytime from the server), you can host these definitions on your file server.

### For Flutter developers
Use [Android Studio](https://developer.android.com/studio) to open this project and run `main.dart`.
To incorporate Ensemble pages to your existing Flutter App, see `example_existing_app_*.dart`.

