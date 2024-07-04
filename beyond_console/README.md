# beyond_console

Beyond Console is a all in one complete Flutter Dashboard Template, that support Dark Mode, using Material 3, Centralized theming, Clean architecture, reusable component, extended widgets, stand alone and swapable Packages & plugins. Also it use Riverpod as it's main state management, with GetIt as dependency injection. Which is can be swapped with any other similar packages.

## Getting Started

To start using Beyond Console, make sure to Install the latest Flutter 3.19.1 and latest Dart **dart version here**. After that simply navigating to the root of the project and run this command to Get all the dependencies
```
Flutter pub get
```
After that you can start run it localy, 


**Optional step** Environment variable, for VsCode user to store environment variable you can simply put multiple files on `.vscode` folder on project directory, the file is `launch.json` and the environment file itself `env-development.json`
```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Beyond Console (Development)",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
            "args": [
                "--web-browser-flag",
                "--disable-web-security",
				"--dart-define-from-file",
				".vscode/env-development.json",
            ]
        }]
}
```
Inside the development files there is only APP_NAME, but latter you can use this with your own Environment variables
```{
    "APP_NAME": "Beyond Console [Development]",
    "YOUR_NEW_ENVIRONMENT": "This is very secret"
}
```
# beyond_console
