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


### Run
- We included a sample App under /ensemble/helloApp with the home screen named `Hello Home`. Open it with any text editor at `<your_folder>/ensemble_starter/ensemble/helloApp/Hello Home.yaml`.
- To run this App, simply use the default config and run `flutter run`.
- If you currently have a running iOS or Android emulator, the command will prompt for a selection, otherwise the App will be opened in the web browser.

### Run with remote definition (to be continued)
To take advantage of Server-driven UI (change your UI at anytime from the server), you can host these definitions on a remote server.

## Misc
### For Flutter developers
Use [Android Studio](https://developer.android.com/studio) to open this project and run `main.dart`.
To incorporate Ensemble pages to your existing Flutter App, see `example_existing_app_*.dart`.

### Editing Ensemble definition
Ensemble use JSON Schema to enable type-ahead support. We recommend using an Editor with JSON Schema support for an optimal experience.
#### Android Studio
...

#### Visual Studio Code
With [VS Code](https://code.visualstudio.com/download), open folder `<your_folder>/ensemble_starter/assets/ensemble`. Type-ahead should just work with the the default config (in .vscode/settings.json).

#### Other Editors
- Many Text Editors with support for JSON Schema. Please follow the appropriate editor's guides on how to include the JSON Schema (located in /ensemble/schema)

