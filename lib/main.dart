import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/demo_01.dart';
import 'package:flutter_demo/widgets/navigator_demo.dart';

void main() {
  runApp(MyApp());
}

// 输入 stss 回车
// Widget 分为两种：有状态得Widget和无状态得Widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 去掉右上角得debug水印
      // home: HomePage(),
      // home: LoginPage(), // 有了router，就不用写home了

      routes: {
        "/": (context) => LoginPage(),
        "menu": (context) => MenuPage(),
      },
      // 默认以"/"当首页，如果想以别的路由当首页，修改下面配置
      // initialRoute: "menu",

      onGenerateInitialRoutes: (RouteSettings s) {
        print(s.name);
        switch (s.name) {
          case "menu":
            return MaterialPageRoute(
                builder: (context) {
                  return MenuPage();
                },
                settings: s);
            break;
          default:
        }
      },
    ); // 需要调用这个当做首个Widget，因为这个包含了主题，路由一些东西
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的标题"),
        elevation: 10.0, // 阴影
        centerTitle: true,
      ), // 导航栏（页面头）

      // body: TextDemo(),
      // body: CountPage(), // AppBody
      body: InputDemo(),
    ); // 每个界面用这个
  }
}

// 创建有状态的Widget快捷键： stf
class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$count"),
        ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Text("点击"))
      ],
    );
    // return Container();
  }
}
