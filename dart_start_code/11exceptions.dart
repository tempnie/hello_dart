// 异常 https://dart.cn/samples#exceptions
import 'dart:async';
import 'dart:io';
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


void main() {
  var flybyObjects = ['飞机', '火箭', '铲土车', '手机'];
  describeFlybyObjects(flybyObjects);
}
