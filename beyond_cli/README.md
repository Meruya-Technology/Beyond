# Getting started
`beyond_cli` is a command line interface for beyond framework. `beyond_cli` can be used for multiple beyond project operation :
1. Initialize beyond project
2. Generate model from json
3. Create beyond model (modelv2)
4. Create controller | WIP 🚧
5. Create usecase | WIP 🚧
6. Create exception | WIP 🚧

### Installation 🚀
To install beyond_cli just simply run this command
```sh
dart pub global activate beyond_cli
```
Then run this command to check if beyond_cli is already installed
```sh
beyond -v
```

### Initialize beyond project
project name can only be 1 word, or using snake case like `example_project`
```sh
beyond create project_name
```

### Generate model from json
```sh
beyond generate model <ClassName> --path <path to file> --suffix
```
- ClassName will be used for first class name, also will be transformed to snake_case for file name
- `--suffix` is optional but when it used, it must be followed by desired prefix like `--suffix Model`, so the model will be generated using suffix

### Create beyond model (modelv2)
```sh
beyond generate model <ClassName>
```