import 'dart:math';
import 'dart:async';
import 'dart:io';

Future<void> the_async() async {
  print('\n');
  print('#' * 40);
  print('异步');
  print('#' * 40);

  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  printWithDelay1('过了1秒钟. 1');
  print('done 1.');

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  printWithDelay2('过了1秒钟. 2');
  print('done 2.');

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start Describing $object in this file.');
        print('File for $object created.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  var the_objects = ['飞机', '火箭', '铲土车'];
  createDescriptions(the_objects);

  await Future.delayed(Duration(seconds: 5));
}

Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

class Spacecraft {
  String name;

  DateTime? launchDate;
//在类型后面加上问号 ?，表示该类型的变量可以接受 null 值作为有效的取值范围。
  int? get launchYear => launchDate?.year;
  //构造函数
  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

enum PlanetType { terrestrial, gas, ice }

enum Plante {
  //枚举太阳系中的行星。

  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  const Plante(
      {required this.planetType, required this.moons, required this.hasRings});
  final PlanetType planetType;
  final int moons;
  final bool hasRings;
//箭头（=>）语法，表示这是一个单行的方法实现，可以用来简化只包含一个表达式的方法的定义
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name;

  MockSpaceship(this.name, this.launchDate);

  @override
  void describe() {
    print('Mock Spacecraft: $name');
  }

  @override
  int? get launchYear => launchDate?.year;
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('======');
    describe();
    print('======');
  }
}

void main() {
  print("hello world!");
  print("------------");

// 变量 （https://dart.cn/samples#variables）
  print("variables");
  var name1 = 'Voyager I';
  var year1 = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects1 = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  print(
      'name is $name1, year is $year1, antennaDiameter is $antennaDiameter, flybyObjects is $flybyObjects1, image is $image');

  print("------------");
  // 控制流程 (https://dart.cn/samples#control-flow-statements)
  print("control-flow-statements");
  var year = 1977;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }

  print("------------");
  // 函数 （https://dart.cn/samples#functions）
  print("functions");
  var result = fibonacci(20);
  print(' fibonacci result is $result');

  print("------------");
  // 导入 （https://dart.cn/samples#imports）
  print("imports");
  print('\n');
  print('#' * 40);
  print('导入');
  print('#' * 40);
  var mypi = pi;
  print('pi is $mypi');

  var x = pi / 4;
  var y = sin(x);
  print('sin(pi/4) is $y');

  print("------------");
  // 注释 (https://dart.cn/samples#comments)
  print("comments");
  print('\n');
  print('#' * 40);
  print('注释');
  print('#' * 40);

  /// 这是一个文档注释。
  /// 文档注释用于为库、类以及类的成员添加注释。
  /// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。
  /* 也可以像这样使用单斜杠和星号的注释方式 */
  print('comments prints nothing.');

  print("------------");
  // 类 （https://dart.cn/samples#classes）
  print("classes");
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  print("------------");
  //枚举  (https://dart.cn/samples#enums)
  print("enums");
  final yourPlante = Plante.mercury;

  if (!yourPlante.isGiant) {
    print('your planet is not a "giant planet".');
  }

  print("------------");
  // 扩展类（继承） （https://dart.cn/samples#inheritance）
  print("inheritance");
  print('\n');
  print('#' * 40);
  print('扩展类（继承）');
  print('#' * 40);

  var obt = Orbiter('天宫号', DateTime(2021, 4, 29), 389.2);
  obt.describe();

  print("------------");
  // 在多个类层次结构中重用代码的方法  https://dart.dev/language#mixins
  print("mixins ");
  var plt = PilotedCraft('神舟1号', DateTime(1999, 11, 20));
  plt.describe();
  plt.describeCrew();

  print("------------");
  //接口与抽象类   https://dart.cn/samples#interfaces-and-abstract-classes
  print("interfaces-and-abstract-classes");
  var mock = MockSpaceship('测试飞行器', null);
  mock.describe();

  print("------------");
  // 异步 https://dart.cn/samples#async
  print("async");
  the_async();

  print("------------");
  // 异常 https://dart.cn/samples#exceptions
  print("exceptions");
  var flybyObjects2 = ['飞机', '火箭', '铲土车', '手机'];
  describeFlybyObjects(flybyObjects2);
}
