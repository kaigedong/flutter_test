import 'dart:developer';

import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Text(
          "文本" * 20,
          maxLines: 1, // 只能在一行内显示所有文本
          overflow: TextOverflow.ellipsis, // 如果超过了屏幕，则显示三个小点
          textDirection: TextDirection.ltr, // 文字从左到右
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0), // 设置文本属性：加粗，字号等
        ));
  }
}

class InputDemo extends StatefulWidget {
  const InputDemo({Key? key}) : super(key: key);

  @override
  _InputDemoState createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  GlobalKey _key = GlobalKey<FormState>(); // 声明全局变量
  TextEditingController _user = TextEditingController();
  TextEditingController _passwd = TextEditingController();

  FocusNode _u = FocusNode();
  FocusNode _p = FocusNode();

  // // 焦点操作需要一个全局的对象
  // FocusScopeNode _focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _user.dispose(); // 退出时注释掉这个，否则会占用内存
    _passwd.dispose();
    _u.dispose();
    _p.dispose();
    // if (_focusScopeNode != null) {
    //   _focusScopeNode.dispose();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key, // 用来保存是不是校验通过的状态
      // autovalidateMode: AutovalidateMode.always, // 开启自动校验，检查是否为空，不推荐
      child: Column(
        children: [
          TextFormField(
            autofocus: true, // 自动获取焦点，相当于进入页面自动被激活
            focusNode: _u,
            controller: _user,
            decoration: InputDecoration(
              // icon: Icon(Icons.add),// 这种图标，会在输入框下划线之外
              prefixIcon: Icon(Icons.add), // 这种图标会在输入框下划线内
              labelText: "帐号", // 提示文本， 输入框上显示
              hintText: "请输入帐号", // 输入框内显示
            ), // 想要添加图标，需要装饰器。比如输入装饰器
            onChanged: (v) {
              print(v);
            },
            // 相比TextField多了验证功能
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "帐号必须输入！";
              }
            },
            textInputAction: TextInputAction.next, // 输入完回车会跳转到下一个
            onFieldSubmitted: (v) {
              print("object");
            }, // 回车监听
          ),
          SizedBox(height: 8),
          // TextField(
          TextFormField(
            focusNode: _p,
            controller: _passwd,
            decoration: InputDecoration(
              // icon: Icon(Icons.add),// 这种图标，会在输入框下划线之外
              prefixIcon: Icon(Icons.add), // 这种图标会在输入框下划线内
              labelText: "密码", // 提示文本， 输入框上显示
              hintText: "请输入密码", // 输入框内显示
            ), // 想要添加图标，需要装饰器。比如输入装饰器
            onChanged: (v) {
              print(v);
            },
            obscureText: true, // 是否为密码框
            validator: (v) {
              if (v == null || v.length < 5) {
                return "密码长度不能小于5";
              }
            },
            textInputAction: TextInputAction.send, // .search 这种类型，键盘会显示搜索图标
          ),
          SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                // // 实现点击提交时，焦点回到第一个
                // if (_focusScopeNode == null) {
                //   _focusScopeNode = FocusScop.of(context);
                // }
                // _focusScopeNode.requestFocus(_u);
                // // 如果不想要焦点，用下面的
                // _focusScopeNode.unfocus();

                print(_user.text);
                print((_key.currentState as FormState)
                    .validate()
                    .toString()); // 检查表单是否验证通过
              },
              child: Text("提交")),
        ],
      ),
    );
  }
}
