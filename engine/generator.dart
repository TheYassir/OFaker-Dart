import 'dart:math';

import 'dictionary.dart';

class Generator {
  static void generate(List<String> properties, String lang, int count) {
    // Generate the code

    // Generate the code

    if (lang == 'json') {
      _generateJson(properties, count);
    } else if (lang == 'sql') {
      _generateSql(properties, count);
    } else {
      print('Language not supported');
    }
  }

  static void _generateSql(List<String> properties, int count) {
    // TODO Bonus générer les éléments en requête INSERT INTO
    // INSERT INTO user (ID,NAME,AGE,ADDRESS,SALARY) VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 ), (5, 'Hardik', 27, 'Bhopal', 8500.00 ), (6, 'Komal', 22, 'MP', 4500.00 );
    print('Generating SQL');
    List<int> alreadyUsed = <int>[];
    String strprop = properties.map((e) => e.toUpperCase()).join(',');
    // print('INSERT INTO user ($strprop) VALUES ');
    String req_sql = "INSERT INTO user ($strprop) VALUES ";

    for (int i = 0; i < count; i++) {
      Dictionnary dictionnary = Dictionnary();
      int randomInt = -1;
      do {
        randomInt = _generateRandomInt();
      } while (alreadyUsed.contains(randomInt));

      alreadyUsed.add(randomInt);
      var randomUser = dictionnary.data[randomInt];

      int propertyCount = properties.length;
      int currentProperty = 0;
      String value = "(";

      for (String property in properties) {
        currentProperty++;

        if (currentProperty == propertyCount) {
          if (property == 'password') {
            value += "'${getRandomString(10)}')";
          } else {
            value += "'${randomUser[property]}')";
          }
        } else {
          if (property == 'password') {
            value += "'${getRandomString(10)}', ";
          } else {
            value += "'${randomUser[property]}', ";
          }
        }
      }
      if (i == count - 1) {
        value += ";";
      } else {
        value += ", ";
      }
      req_sql += value;
    }
    print(req_sql);
  }

  static void _generateJson(List<String> properties, int count) {
    // Generate the code
    print('Generating JSON');
    List<int> alreadyUsed = <int>[];
    print('[');
    for (int i = 0; i < count; i++) {
      Dictionnary dictionnary = Dictionnary();
      int randomInt = -1;
      do {
        randomInt = _generateRandomInt();
      } while (alreadyUsed.contains(randomInt));

      alreadyUsed.add(randomInt);
      var randomUser = dictionnary.data[randomInt];

      int propertyCount = properties.length;
      int currentProperty = 0;

      print('  {');
      for (String property in properties) {
        currentProperty++;

        if (currentProperty == propertyCount) {
          if (property == 'password') {
            print('    "$property": "${getRandomString(10)}"');
          } else {
            print('    "$property": "${randomUser[property]}"');
          }
        } else {
          if (property == 'password') {
            print('    "$property": "${getRandomString(10)}",');
          } else {
            print('    "$property": "${randomUser[property]}",');
          }
        }
      }

      if (i == count - 1) {
        print('  }');
      } else {
        print('  },');
      }
    }

    print(']');
  }

  static int _generateRandomInt() {
    var rng = Random();
    return (rng.nextInt(999));
  }

  static String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
