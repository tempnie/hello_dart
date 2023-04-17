
// 导入 （https://dart.cn/samples#imports）
import 'dart:math';
// 注释 (https://dart.cn/samples#comments)
void imports() {
  print('\n');
  print('#' * 40);
  print('导入');
  print('#' * 40);

  var mypi = pi;
  print('pi is $mypi');

  var x = pi / 4;
  var y = sin(x);
  print('sin(pi/4) is $y');
}

void comments() {
  print('\n');
  print('#' * 40);
  print('注释');
  print('#' * 40);

  /// 这是一个文档注释。
  /// 文档注释用于为库、类以及类的成员添加注释。
  /// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。
  /* 也可以像这样使用单斜杠和星号的注释方式 */
  print('comments prints nothing.');
}