import 'package:diamonds/constants/size_config.dart';
import 'package:diamonds/core/graphqlclients.dart';
import 'package:diamonds/core/query.dart';
import 'package:diamonds/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var lastnamecontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var middlenamecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var obcurechek = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),title: Text("Регистрация",style: TextStyle(color: Colors.black),),backgroundColor: Colors.grey.shade50,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: geth(10),),
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
              height: geth(1150),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "* Фамилия",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 4) {
                            return "Must contains 4 symbols";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: lastnamecontroller,
                        decoration: InputDecoration(
                            hintText: "Введите Фамилия",
                            border: OutlineInputBorder()),
                      ),
                      Text(
                        "* Названия",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 4) {
                            return "Must contains 4 symbols";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: namecontroller,
                        decoration: InputDecoration(
                            hintText: "Введите Названия",
                            border: OutlineInputBorder()),
                      ),
                      Text(
                        "* Второе имя",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 4) {
                            return "Must contains 4 symbols";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: middlenamecontroller,
                        decoration: InputDecoration(
                            hintText: "Второе имя",
                            border: OutlineInputBorder()),
                      ),
                      Text(
                        "* Телефон",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 4) {
                            return "Must contains 4 symbols";
                          }
                        },
                        keyboardType: TextInputType.phone,
                        controller: phonecontroller,
                        decoration: InputDecoration(
                            hintText: "Телефон",
                            border: OutlineInputBorder()),
                      ),
                      Text(
                        "* Адрес",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 4) {
                            return "Must contains 4 symbols";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: addresscontroller,
                        decoration: InputDecoration(
                            hintText: "Адрес",
                            border: OutlineInputBorder()),
                      ),
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
                        controller: emailcontroller,
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
                        controller: passwordcontroller,
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
                            hintText: "Пароль",
                            border: OutlineInputBorder()),
                      ),
                      Text(
                        "* Подтвердите пароль",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 4) {
                            return "Must contains 4 symbols";
                          }
                        },
                        controller: confirmpasswordcontroller,
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
                            hintText: "Подтвердите пароль",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              QueryResult result =
                                  await client.value.mutate(MutationOptions(
                                document: gql(registrQuery(
                                    lastnamecontroller.text,
                                    namecontroller.text,
                                    middlenamecontroller.text,
                                    phonecontroller.text,
                                    addresscontroller.text,
                                    emailcontroller.text,
                                    passwordcontroller.text,
                                    confirmpasswordcontroller.text)),
                              ));
                              final regis = result.data?['register'];

                              if (regis == "Registration success") {
                                Navigator.pop(context);
                              } else {}
                            }
                          },
                          child: Text("Регистрация"),style: ElevatedButton.styleFrom(fixedSize: Size(getw(200), geth(50))),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
