## Overview

This starter project enables you to run Ensemble-powered Apps and generate release builds across iOS, Android, Web, Windows, ... It also includes examples on how to integrate Ensemble pages into your existing Flutter App.

Ensemble's page definitions can be hosted via Ensemble Studio(default), on your server, or embed with this Flutter project locally. Change your configuration via `/ensemble/ensemble-config.yaml`

## Setup
### Prerequisite
- Install [Flutter](https://docs.flutter.dev/get-started/install) on your machine. 
- Web is supported out-of-the-box. 
- To run on iOS emulator, install Xcode and Simulator. Run `open -a Simulator`. Create a new Simulator as needed (File -> Open Simulator -> ..).
- Please follow Flutter instructions on other platforms.

### Getting Started with Ensemble Studio
- Login to studio.ensembleui.com. If you don't have a login, request one by going here - https://ensembleui.com/, clicking on "Join the Waitlist" or "Request an Account" and filling up the form. Make sure you put your google email (your gmail or work email if that's on google). We'll create an account for you and send you an email with details.
- Select your App or any of the available sample Apps.
- Go to the App's Setting to get your `App ID`. Enter this under appId in `/ensemble/ensemble-config.yaml`
- Run `flutter create --platforms=ios,android,web .` (note the end period) to generate the runtime and fetch dependencies. Other available platforms are `windows,macos`. You'll only have to do this step once.
- Run `flutter pub upgrade` to update dependencies as the supported libraries change.
- Run the App with `flutter run`. If you currently have a running iOS or Android emulator, the command will prompt for a selection, otherwise the App will be opened in the web browser.
- Try making changes to your App on Ensemble Studio. Re-run this project and the changes should be reflected.

### Getting Started with hosting your own definition
We recommend using Ensemble Studio for an optimal experience, but you can host the definitions yourself, either locally in this project, or remotely on your own server.
Note: the ability to execute Typescript code within your definition locally is not yet supported. 
- In `/ensemble/ensemble-config.yaml`, change `from: ensemble` to `from: local`.
- We included a sample App under /ensemble/apps/helloApp with the home screen named `Hello Home`. Open it with any text editor at `/ensemble/apps/helloApp/Hello Home.yaml`.
- Follow the same steps above to generate runtime and update dependencies. 
- Try making changes to the definition. Upon re-run your screen should reflect the changes.

## Editing definitions
Ensemble Studio includes an Online Editor for making changes with type-ahead support and enables Live Preview. However if you decide to host your own definitions, we include a JSON Schema to help with type-ahead for popular Editors.
### Android Studio
- Open Preferences and go to `Languages & Frameworks > Schemas and DTDs > JSON Schema Mappings`
- Add a new schema
- Under Schema URL, enter `https://raw.githubusercontent.com/EnsembleUI/ensemble/main/assets/schema/ensemble_schema.json`
- Select Schema version 7
- Add a Directory mapping right below, pointing to `<your_folder>/ensemble_starter/ensemble/apps`.
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

