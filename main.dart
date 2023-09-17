import 'engine/generator.dart';
import 'dart:io';

void main() {
  String? nb_generate_string = null;
  int? nb_generate;
  String? lang = null;
  String? choose = null;

  final List<String> prop = [
    'index',
    'isActive',
    'picture',
    'age',
    'name',
    'company',
    'email',
    'phone',
    'address',
    'password'
  ];

  print('====================================================');
  print('              Bienvenue dans O\'Faker        ');
  print('====================================================');

  while (nb_generate_string == null || nb_generate_string.isEmpty) {
    print("Nombre de données à générer ? (max 100)");
    nb_generate_string = stdin.readLineSync();
  }
  nb_generate = int.parse(nb_generate_string);
  // print(nb_generate);

  while (lang == null || lang.isEmpty) {
    print("Dans quel langage (json ou sql)");
    lang = stdin.readLineSync();
  }
  // print(nb_generate + lang);

  print('''
  Propriété disponible:
    index // entier unique
    isActive // booléen 
    picture // lien placehold.it
    age // entier
    name // combinaison nom prénom en chaîne de caractères
    company // chaîne de caractères
    email // chaîne se caractères
    phone // chaîne de caractères
    address // chaîne de caractères
    password // chaîne de caractères
  ''');

  while (choose == null || choose.isEmpty) {
    print("Quelles propriété à gérérer ? (ex: index, picture, age)");
    choose = stdin.readLineSync();
  }

  print(choose);
  List<String> choose_split = choose.split(",");
  print(choose_split);

  Generator.generate(choose_split, lang, nb_generate);
}
