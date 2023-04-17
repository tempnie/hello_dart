// 扩展类（继承） （https://dart.cn/samples#inheritance）
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

void main(){
  
}
