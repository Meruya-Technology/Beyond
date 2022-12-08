class PubspecSample {
  static String get content => '''
name: server
description: A server app using the shelf package and Docker with Beyond configuration.
version: 1.0.0
publish_to: none

environment:
  sdk: '>=2.18.5 <3.0.0'

dependencies:
  args: ^2.3.1
  shelf: ^1.4.0
  shelf_router: ^1.1.3
  postgres: ^2.5.2
  mysql1: ^0.20.0
  get_it: ^7.2.0
  beyond:
    git:
      url: https://github.com/Meruya-Techhnology/Beyond.git
      path: beyond
      ref: 32d2a7bfc87c5dbc5275a45a5553da53b9a155a5

dev_dependencies:
  http: ^0.13.0
  lints: ^2.0.0
  test: ^1.15.0
''';
}
