import 'package:diamonds/constants/size_config.dart';
import 'package:diamonds/core/graphqlclients.dart';
import 'package:diamonds/core/query.dart';
import 'package:diamonds/pages/home/home.dart';
import 'package:diamonds/product.dart/products.dart';
import 'package:diamonds/pages/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obcurechek = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: geth(900),
          color: Colors.blueGrey.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Добро пожаловать обратно!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getw(30),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Войдите в свою учетную запись, чтобы продолжить",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: getw(15)),
              ),
              SizedBox(
                height: geth(15),
              ),
              Container(
                height: geth(420),
                width: getw(380),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        getw(15),
                      ),
                    ),
                    color: Colors.white),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getw(20), vertical: geth(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "* Э-почта",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.length < 4) {
                              return "Must contains 4 symbols";
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: "Введите адресс э-почта",
                              border: OutlineInputBorder()),
                        ),
                        Text(
                          "* Пароль",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.length < 4) {
                              return "Must contains 4 symbols";
                            }
                          },
                          controller: passwordController,
                          obscureText: obcurechek,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.visibility),
                                onPressed: () {
                                  if (obcurechek) {
                                    obcurechek = false;
                                  } else {
                                    obcurechek = true;
                                  }
                                },
                              ),
                              hintText: "Введите адресс э-почта",
                              border: OutlineInputBorder()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text("Забыли ваш пароль?")),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()));
                                },
                                child: Text("Регистрация"))
                          ],
                        ),
                        Center(
                            child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              QueryResult result =
                                  await client.value.mutate(MutationOptions(
                                document: gql(loginQuery(emailController.text,
                                    passwordController.text)),
                              ));
                              final productlist = result.data?['login'];
                              String? accesstoken = productlist['accessToken'];
                              if (accesstoken == null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: const Text(
                                    'Parol xato',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  duration: const Duration(seconds: 3),
                                  action: SnackBarAction(
                                    label: 'Qayta kiriting',
                                    onPressed: () {},
                                  ),
                                ));
                              } else {
                                 ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: const Text(
                                    'Login to\'g\'ri',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                  duration: const Duration(seconds: 3),
                                  action: SnackBarAction(
                                    label: 'Kuting',
                                    onPressed: () {},
                                  ),
                                ));
                               await box.write('token', accesstoken);

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            }
                          },
                          child: Text("Войти"),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(getw(100), geth(50))),
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
