import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
// import '../models/users.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController idController;
  // late UserService userService;
  // late User user;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    idController = TextEditingController();
    // userService = UserService();
    // userService.initUsers();
  }

  // 登录文本框组件，用于快速构建文本框
  Widget loginTextField(
      {required IconData icon,
      required String hintText,
      required TextEditingController controller}) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(5),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(icon),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
    );
  }

  // 前端检测登录信息
  bool checkLogin() {
    if (usernameController.text.isEmpty) {
      showToast("姓名不能为空");
      return false;
    }
    if (!RegExp(r"^\d{11}$").hasMatch(idController.text)) {
      showToast(
        "学号是 11 位数字",
      );
      return false;
    }
    if (passwordController.text.isEmpty) {
      showToast(
        "密码不能为空",
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 300,
              height: 325,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "登录",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: loginTextField(
                          icon: Icons.person,
                          hintText: "姓名",
                          controller: usernameController)),
                  Expanded(
                    flex: 1,
                    child: loginTextField(
                        icon: Icons.account_box,
                        hintText: "学号",
                        controller: idController),
                  ),
                  Expanded(
                    flex: 1,
                    child: loginTextField(
                        icon: Icons.password,
                        hintText: "密码",
                        controller: passwordController),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                              child: const Text("取消")),
                          TextButton(
                              onPressed: () async {
                                // if (checkLogin()) {
                                //   user = User(
                                //       username: usernameController.text,
                                //       password: passwordController.text,
                                //       id: idController.text);
                                // }
                                // if (await userService.registerUser(user)) {
                                //   showToast("注册成功");
                                // } else {
                                //   showToast("已经注册过了");
                                // }
                              },
                              child: const Text("注册")),
                          TextButton(
                              onPressed: () async {
                                // if (checkLogin()) {
                                //   user = User(
                                //       username: usernameController.text,
                                //       password: passwordController.text,
                                //       id: idController.text);
                                //   if (await userService.checkLogin(user)) {
                                //     if (context.mounted) {
                                //       context.go("/home");
                                //     }
                                //   } else {
                                //     showToast("用户名或密码错误");
                                //   }
                                // }
                              },
                              child: const Text("登录"))
                        ],
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
