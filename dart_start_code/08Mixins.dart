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
// 在多个类层次结构中重用代码的方法  https://dart.dev/language#mixins 
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

void main(){

}
