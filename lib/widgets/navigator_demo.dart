import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed("menu", arguments: "333444")
              .then((value) => print(value));

          // // 实现登录之后，就没有上面的返回按钮了
          // Navigator.of(context)
          //     .popAndPushNamed("menu", arguments: "333444")
          //     .then((value) => print(value));

          // 用var接收返回值，表示await中的返回之后，才会进行下面操作
          // Navigator.of(context)
          //     .push(MaterialPageRoute(
          //       builder: (context) {
          //         return MenuPage(
          //             // title: "菜单2",
          //             );
          //       },
          //       settings: RouteSettings(
          //         name: "menu",
          //         arguments: "333444444444441",
          //       ), // 用于路由的设置
          //       maintainState: false, // 表示页面是否还存储着。对于登录界面，登录过就不需要了
          //       fullscreenDialog: false, // 表示是否启用全屏对话框模式。入场动画会不一样
          //     ))
          //     .then((value) => print(value)); // 界面返回时通过.then获取返回值。
        },
        child: Text("登录"),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  // // 接收组件传来的值
  // final String title;

  // const MenuPage({Key? key, required this.title}) : super(key: key);
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 接收路由的settings中传来的值
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    print(arguments);

    return Scaffold(
      appBar: AppBar(
        // title: Text(title),
        title: Text(arguments.toString()),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop("这里是返回值"); // 返回上一个Widget
        },
        child: Text("返回"),
      ),
    );
  }
}
