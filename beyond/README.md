### Prerequisite
Beyond is a mini framework that depend on multiple package, for multiple function. For the notes Beyond 1.0.0 will not work without the dependency installed. Meanwhile there is easy shorcut for initializing Beyond project using beyond_cli, but if you are insist to use Beyond on exsisting package make sure these dependency already installed :
- [Postgresql](https://pub.dev/packages/postgres)
- [GetIt](https://pub.dev/packages/get_it)

### Quick Start
You can straight initialize beyond project using beyond_cli, create beyond_cli package and done !

### Add to exsisting dart server
If you are already has dart server and do not interested to using beyond_cli, Beyond is a mini framework that depend on multiple package, for multiple function. For the notes Beyond 1.0.0 will not work without the dependency installed. To use Beyond on exsisting package make sure these dependency already installed :
- [Postgresql](https://pub.dev/packages/postgres)
- [GetIt](https://pub.dev/packages/get_it)

1. Add beyond from `pubspec.yaml` 
```yaml
dependencies:
  beyond: ^1.0.0
```

2. Open postgresql connection & initialize using `DB.initialize()`
```dart
final postgresql = await database.openConnection();

DB.initialize(postgresql);
```
3. You can now start using beyond model and `DB` Query builder !