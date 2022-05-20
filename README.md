## Overview

This starter project enables you to load Ensemble-powered Apps. It also includes examples on how to integrate Ensemble pages into your existing Flutter App.

Ensemble's page definitions can be loaded locally (default) or remotely (via your server or Ensemble-hosted server). Change your configuration via `/ensemble/ensemble-config.yaml`

## Getting Started
### Prerequisite
- Install [Flutter](https://docs.flutter.dev/get-started/install) on your machine.
- To run on iOS emulator, install Xcode and Simulator. Run `open -a Simulator`. Create a new Simulator as needed (File -> Open Simulator -> ..).
- Please follow Flutter instructions on other platforms

### Download and setup Ensemble
- Create a folder of your choice e.g ensemble, and navigate to this folder on your command line tool.
- Fetch Ensemble by executing `git clone https://github.com/EnsembleUI/ensemble_starter.git`.
- Navigate to this project with `cd ensemble_starter`.
- Run `flutter create .` to generate the runtime and fetch dependencies.
- To build Native Apps for other OS, run `flutter create --platforms=windows,macos,linux .` (note the period at the end). You can selectively pick what you need.

### Run
- We included a sample App under /ensemble/apps/helloApp with the home screen named `Hello Home`. Open it with any text editor at `<your_folder>/ensemble_starter/ensemble/apps/helloApp/Hello Home.yaml`.
- To run this App, simply use the default config and run `flutter run`.
- If you currently have a running iOS or Android emulator, the command will prompt for a selection, otherwise the App will be opened in the web browser.
- Try making changes to the definition. Upon re-run your screen should reflect the changes.

## Editing Ensemble definitions
Ensemble use JSON Schema to enable type-ahead support. We recommend using an Editor with JSON Schema support for an optimal experience.
### Android Studio
- Open Preferences and go to `Languages & Frameworks > Schemas and DTDs > JSON Schema Mappings`
- Add a new schema
- Under Schema URL, enter `https://raw.githubusercontent.com/EnsembleUI/ensemble/main/assets/schema/ensemble_schema.json`
- Select Schema version 7
- Add a Directory mapping right below, pointing to `<your_folder>/ensemble_starter/ensemble/apps`.
- Editing any definition files will show the appropriate type-ahead.

### Visual Studio Code
- With [VS Code](https://code.visualstudio.com/download), open folder `<your_folder>/ensemble_starter/ensemble/apps`. 
- Type-ahead should just work with the the default config (in .vscode/settings.json).

## Build your Apps for deployment
- Run `flutter build web --release`. The output will be under `/build/web`
- Follow [iOS](https://docs.flutter.dev/deployment/ios), [Android](https://docs.flutter.dev/deployment/android), [MacOS](https://docs.flutter.dev/deployment/macos), [Windows](https://docs.flutter.dev/deployment/windows) release documentation.


## Misc
### Run with remote definition (to be continued)
To take advantage of Server-driven UI (change your UI at anytime from the server), you can host these definitions on your file server.

### For Flutter developers
Use [Android Studio](https://developer.android.com/studio) to open this project and run `main.dart`.
To incorporate Ensemble pages to your existing Flutter App, see `example_existing_app_*.dart`.

