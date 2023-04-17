//枚举  (https://dart.cn/samples#enums)
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

void main() {
  final yourPlante = Plante.mercury;

  if (!yourPlante.isGiant) {
    print('your planet is not a "giant planet".');
  }
}
