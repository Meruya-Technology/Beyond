import 'dart:io';

import 'package:beyond_cli/src/samples/server/bin/main_sample.dart';
import 'package:beyond_cli/src/samples/server/pubspec_sample.dart';
import 'package:beyond_cli/src/samples/server/src/app/api_sample.dart';
import 'package:beyond_cli/src/samples/server/src/app/controllers/user_controller_sample.dart';
import 'package:beyond_cli/src/samples/server/src/app/http_sample.dart';
import 'package:beyond_cli/src/samples/server/src/app/models/user_sample.dart';
import 'package:beyond_cli/src/samples/server/src/app/usecases/create_user_sample.dart';
import 'package:beyond_cli/src/samples/server/src/app/usecases/delete_user_sample.dart';
import 'package:beyond_cli/src/samples/server/src/app/usecases/retrieve_user_sample.dart';
import 'package:beyond_cli/src/samples/server/src/app/usecases/update_user_sample.dart';
import 'package:beyond_cli/src/samples/server/src/utils/custom_error_handler_sample.dart';
import 'package:beyond_cli/src/samples/server/src/utils/database_util_sample.dart';
import 'package:beyond_cli/src/samples/server/src/utils/postgresql_sample.dart';
import 'package:beyond_cli/src/utils/directory_util.dart';

class Server {
  static Future<void> project(String directory) async {
    final serverDirectory = '$directory/server';
    await initializeServer(directory);
    await deleteYaml(serverDirectory);
    await deleteBin(serverDirectory);
    await writeNewYaml(serverDirectory);
    await writeMain(serverDirectory);
    await writePostgresql(serverDirectory);
    await writeDatabaseUtil(serverDirectory);
    await writeCustomErrorHandler(serverDirectory);
    await writeApi(serverDirectory);
    await writeHttp(serverDirectory);
    await writeModels(serverDirectory);
    await writeUseCases(serverDirectory);
    await writeUserController(serverDirectory);
    await updateDependencies(serverDirectory);
  }

  static Future<ProcessResult> initializeServer(String directory) async {
    /// Create server package
    return Process.run(
      'dart',
      ['create', '-t', 'server-shelf', '--no-pub', 'server'],
      workingDirectory: directory,
    );
  }

  static Future<ProcessResult> deleteYaml(String serverDirectory) {
    /// Delete Yaml
    return Process.run(
      'rm',
      ['-f', 'pubspec.yaml'],
      workingDirectory: serverDirectory,
    );
  }

  static Future<ProcessResult> deleteBin(String serverDirectory) {
    /// Delete Yaml
    return Process.run(
      'rm',
      ['-r', 'bin'],
      workingDirectory: serverDirectory,
    );
  }

  static Future<void> writeNewYaml(String serverDirectory) async {
    /// Write new Yaml, using booted template
    final file = File('$serverDirectory/pubspec.yaml');
    final template = PubspecSample.content;
    DirectoryUtil.createFile(file, template);
  }

  static Future<void> writeMain(String serverDirectory) async {
    /// Write new Yaml, using booted template
    final file = File('$serverDirectory/bin/main.dart');
    final template = MainSample.content;
    DirectoryUtil.createFile(file, template);
  }

  static Future<void> writePostgresql(String serverDirectory) async {
    /// Write new Yaml, using booted template
    final file = File('$serverDirectory/lib/src/utils/postgresql.dart');
    final template = PostgresqlSample.content;
    DirectoryUtil.createFile(file, template);
  }

  static Future<void> writeDatabaseUtil(String serverDirectory) async {
    /// Write new Yaml, using booted template
    final file = File('$serverDirectory/lib/src/utils/database_util.dart');
    final template = DatabaseUtilSample.content;
    DirectoryUtil.createFile(file, template);
  }

  static Future<void> writeCustomErrorHandler(String serverDirectory) async {
    /// Write new Yaml, using booted template
    final file =
        File('$serverDirectory/lib/src/utils/custom_error_handler.dart');
    final template = CustomErrorHandlerSample.content;
    DirectoryUtil.createFile(file, template);
  }

  static Future<void> writeApi(String serverDirectory) async {
    /// Write new Yaml, using booted template
    final file = File('$serverDirectory/lib/src/app/api.dart');
    final template = ApiSample.content;
    DirectoryUtil.createFile(file, template);
  }

  static Future<void> writeHttp(String serverDirectory) async {
    /// Write new Yaml, using booted template
    final file = File('$serverDirectory/lib/src/app/http.dart');
    final template = HttpSample.content;
    DirectoryUtil.createFile(file, template);
  }

  static Future<void> writeModels(String serverDirectory) async {
    final createUser = File(
      '$serverDirectory/lib/src/app/models/user.dart',
    );
    final createUserScript = UserSample.content;
    DirectoryUtil.createFile(createUser, createUserScript);
  }

  static Future<void> writeUseCases(String serverDirectory) async {
    final createUser = File(
      '$serverDirectory/lib/src/app/usecases/create_user.dart',
    );
    final createUserScript = CreateUserSample.content;
    DirectoryUtil.createFile(createUser, createUserScript);

    final retrieveUser = File(
      '$serverDirectory/lib/src/app/usecases/retrieve_user.dart',
    );
    final retrieveUserScript = RetrieveUserSample.content;
    DirectoryUtil.createFile(retrieveUser, retrieveUserScript);

    final updateUser = File(
      '$serverDirectory/lib/src/app/usecases/update_user.dart',
    );
    final updateUserScript = UpdateUserSample.content;
    DirectoryUtil.createFile(updateUser, updateUserScript);

    final deleteUser = File(
      '$serverDirectory/lib/src/app/usecases/delete_user.dart',
    );
    final deleteUserScript = DeleteUserSample.content;
    DirectoryUtil.createFile(deleteUser, deleteUserScript);
  }

  static Future<void> writeUserController(String serverDirectory) async {
    /// Write new Yaml, using booted template
    final file = File(
      '$serverDirectory/lib/src/app/controllers/user_controller.dart',
    );
    final template = UserControllerSample.content;
    DirectoryUtil.createFile(file, template);
  }

  static Future<ProcessResult> updateDependencies(String serverDirectory) {
    /// Delete Yaml
    return Process.run(
      'dart',
      ['pub', 'get'],
      workingDirectory: serverDirectory,
    );
  }
}
