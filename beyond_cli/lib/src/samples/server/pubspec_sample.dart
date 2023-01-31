class PubspecSample {
  static String get content => '''

name: server
description: A server app using the shelf package and Docker.
version: 1.0.0
publish_to: none

environment:
  sdk: '>=2.18.4 <3.0.0'

dependencies:
  args: ^2.3.1
  shelf: ^1.4.0
  shelf_router: ^1.1.3
  postgres: ^2.5.2
  mysql1: ^0.20.0
  get_it: ^7.2.0
  encrypt: ^5.0.1
  intl: ^0.17.0
  shelf_hotreload: ^1.3.0
  beyond:
    git:
      url: https://github.com/Meruya-Techhnology/Beyond.git
      path: beyond
  shared:
    path: ../shared

dev_dependencies:
  http: ^0.13.0
  lints: ^2.0.0
  test: ^1.15.0
''';
}
