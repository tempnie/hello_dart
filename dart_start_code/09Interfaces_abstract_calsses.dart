//接口与抽象类   https://dart.cn/samples#interfaces-and-abstract-classes
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
