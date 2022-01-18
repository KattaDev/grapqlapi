import 'package:diamonds/constants/size_config.dart';
import 'package:diamonds/core/graphqlclients.dart';
import 'package:diamonds/core/query.dart';
import 'package:diamonds/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<int> sonlar = List<int>.generate(10, (i) => i * 0);
  int st = 0;
  int end = 10;

  int isbook = -1;

  List? datalist = [];

  var searchController =
      TextEditingController.fromValue(TextEditingValue(text: ""));
  List orders = [];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Товар",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showAlertDialogexit();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.pink,
                  size: 30,
                )),
            SizedBox(
              width: getw(10),
            ),
          ],
        ),
        body: FutureBuilder(
            future: getproduct(searchController.text.toString()),
            builder: (context, AsyncSnapshot<List> snap) {
              if (snap.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snap.data!.length < end) {
                  if (snap.data!.length < 10) {
                    datalist = snap.data!
                        .getRange(st, snap.data!.length % 10)
                        .toList();
                  } else {
                    datalist = snap.data!
                        .getRange(st, snap.data!.length % 10 + end)
                        .toList();
                  }
                } else {
                  datalist = snap.data!.getRange(st, end).toList();
                }
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getw(10)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          hintText: "Search",
                          constraints: BoxConstraints(),
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        controller: searchController,
                        onChanged: (v) {
                          setState(() {
                            st = 0;
                            end = 10;
                          });
                        },
                        onTap: () {
                          setState(() {});
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            for (var i = 0; i < datalist!.length; i++) {
                              if (sonlar[i] != 0) {
                                orders.add({
                                  "amount": sonlar[i],
                                  "productId": datalist![i]['id']
                                });
                              }
                            }
                            if (orders.isEmpty) {
                              print("");
                            } else {
                              showAlertDialog(context, orders);
                              print(orders.toString());
                            }
                          },
                          child: Text(
                            "Заказ",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.blueAccent,
                              primary: Colors.white,
                              fixedSize: Size(getw(100), getw(30))),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            sonlar = List<int>.generate(10, (i) => i * 0);
                            if (st != 0) {
                              st = st - 10;
                              end = end - 10;
                              setState(() {});
                            }
                          },
                          child: Text(
                            "<",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              fixedSize: Size(getw(30), getw(30))),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "$st/$end",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey.shade300),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            sonlar = List<int>.generate(10, (i) => i * 0);
                            if (snap.data!.length > end + 10) {
                              st = st + 10;
                              setState(() {});
                              end = end + 10;
                            }
                          },
                          child: Text(
                            ">",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              fixedSize: Size(getw(30), getw(30))),
                        ),
                      ],
                    ),
                    Container(
                      height: geth(630),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: getw(15), vertical: geth(5)),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(geth(12)))),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: datalist![index]['photo'] == null
                                      ? Image.asset(
                                          "assets/images/placeholder.png")
                                      : Image.network(
                                          "${datalist![index]['photo']}"),
                                  title: Text(
                                      datalist![index]['nameModel'].toString()),
                                  trailing: Text(
                                      datalist![index]['article'].toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getw(50)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            if (sonlar[index] > 0) {
                                              sonlar[index] = sonlar[index] - 1;
                                              setState(() {});
                                            }
                                          },
                                          child: Text("-",
                                              style: TextStyle(
                                                  fontSize: getw(40)))),
                                      Text("${sonlar[index]}",
                                          style: TextStyle(fontSize: getw(30))),
                                      TextButton(
                                          onPressed: () {
                                            sonlar[index] = sonlar[index] + 1;
                                            setState(() {});
                                          },
                                          child: Text(
                                            "+",
                                            style:
                                                TextStyle(fontSize: getw(40)),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: datalist!.length,
                      ),
                    ),
                  ],
                );
              }
            }));
  }

  Future<List> getproduct(String serch) async {
    QueryResult? products = await clientAll.value.mutate(MutationOptions(
      document: gql(getWithArticleP(serch)),
    ));
    final List productlist = products.data?["productsType"];

    return productlist;
  }

  Future create(int productId, int amount) async {
    QueryResult? user = await clientAll.value.mutate(MutationOptions(
      document: gql(getUser()),
    ));
    final userJson = user.data?["user"];
    QueryResult? create = await clientAll.value.mutate(MutationOptions(
      document: gql(createOrderQuery(
          userJson["id"], userJson['counterpartyId'], productId, amount)),
    ));
    print(create.toString());
    return "ok";
  }

  Future createarray(List orders1) async {
    QueryResult? user = await clientAll.value.mutate(MutationOptions(
      document: gql(getUser()),
    ));
    final userJson = user.data?["user"];
    print(userJson['counterpartyId'].toString());
    print(orders1.toString());
    QueryResult? create = await clientAll.value.mutate(MutationOptions(
      document: gql(createorderarray(userJson['counterpartyId'], orders1)),
    ));
    print(create.toString());
    return "ok";
  }

  showAlertDialog(BuildContext context, List orders2) {
    // set up the buttons
    
    Widget continueButton = ElevatedButton(
      child: Text("zakaz"),
      onPressed: () async {
        print(orders2.toString());
        Navigator.pop(context);
        await createarray(orders2);
        orders.clear();
        sonlar = List<int>.generate(10, (i) => i * 0);
        setState(() {});
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Zakazlarni qo'sh"),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
       
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogexit() {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text("Exit"),
      onPressed: () async {
         box.remove("token");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
               
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      actionsAlignment: MainAxisAlignment.spaceAround,
      content: Text("Zakazlarni qo'sh"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
