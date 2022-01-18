import 'package:diamonds/constants/size_config.dart';
import 'package:diamonds/core/graphqlclients.dart';
import 'package:diamonds/core/query.dart';
import 'package:diamonds/pages/chat/ordercoment.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int ind = 0;
  List sort = [
    "id:ASC",
    " dateOrder:ASC",
    "amount:ASC",
    "id:ASC",
    "status:ASC"
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: FutureBuilder(
      future: funkorder(sort[ind]),
      builder: (context, AsyncSnapshot<List> snapshot) {
        return snapshot.hasData
            ? ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: getw(3)),
                    width: getw(486),
                    child: Column(
                      children: [
                        SizedBox(
                          height: geth(40),
                        ),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(left: getw(1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ind = 0;
                                  if (sort[0] == "id:DESC") {
                                    sort[0] = "id:ASC";
                                  } else {
                                    sort[0] = "id:DESC";
                                  }
                                  setState(() {});
                                },
                                child: Text("ID"),
                                style: ElevatedButton.styleFrom(fixedSize: Size(getw(50),  geth(50),),
                                  minimumSize: Size(getw(50),  geth(50),),
                                   
                                   primary: Colors.grey.shade400,
                                   onPrimary: Colors.blueAccent
                                   ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  ind = 1;
                                  if (sort[1] != "dateOrder:DESC") {
                                    sort[1] = "dateOrder:DESC";
                                  } else {
                                    sort[1] = "dateOrder:ASC";
                                  }
                                  setState(() {});
                                },
                                child: Text("Дата заказа"),
                                style: ElevatedButton.styleFrom(fixedSize: Size(getw(100),  geth(50),),
                                  minimumSize: Size(getw(110),  geth(50),),
                                  
                                   primary: Colors.grey.shade400,
                                   onPrimary: Colors.blueAccent
                                   ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  ind = 2;
                                  if (sort[2] != "amount:DESC") {
                                    sort[2] = "amount:DESC";
                                  } else {
                                    sort[2] = "amount:ASC";
                                  }
                                  setState(() {});
                                },
                                child: Text("N%"), style: ElevatedButton.styleFrom(fixedSize: Size(getw(50),  geth(50),),
                                  minimumSize: Size(getw(50),  geth(50),),
                                  
                                   primary: Colors.grey.shade400,
                                   onPrimary: Colors.blueAccent
                                   ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  ind = 2;
                                  if (sort[3] != "id:DESC") {
                                    sort[3] = "id:DESC";
                                  } else {
                                    sort[3] = "id:ASC";
                                  }
                                  setState(() {});
                                },
                                child: Text("Артикул"), style: ElevatedButton.styleFrom(fixedSize: Size(getw(110),  geth(50),),
                                  minimumSize: Size(getw(110),  geth(50),),
                                 
                                   primary: Colors.grey.shade400,
                                   onPrimary: Colors.blueAccent
                                   ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  ind = 4;
                                  if (sort[4] != "status:DESC") {
                                    sort[4] = "status:DESC";
                                  } else {
                                    sort[4] = "status:ASC";
                                  }
                                  setState(() {});
                                },
                                child: Text("Статус"), style: ElevatedButton.styleFrom(fixedSize: Size(getw(90),  geth(50),),
                                  minimumSize: Size(getw(90),  geth(50),),
                                 
                                   primary: Colors.grey.shade400,
                                   onPrimary: Colors.blueAccent
                                   ),
                              ),
                               ElevatedButton(
                                onPressed: () {
                                 
                                },
                                child: Text("chat"), style: ElevatedButton.styleFrom(fixedSize: Size(getw(70),  geth(50),),
                                  minimumSize: Size(getw(70),  geth(50),),
                                 
                                   primary: Colors.grey.shade400,
                                   onPrimary: Colors.blueAccent
                                   ),
                              ),
                             
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: geth(733),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              List date = snapshot.data![index]['node']
                                      ['dateOrder']
                                  .split("T");
                              String str1 = date[0];
                              String str2 = date[1].split('.')[0];

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: geth(80),
                                    width: getw(50),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                    ),
                                    child: Text(
                                        "${snapshot.data![index]['node']['id']}"),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: geth(80),
                                    width: getw(110),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                    ),
                                    child: Text("$str1 \n $str2"),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: geth(80),
                                    width: getw(50),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                    ),
                                    child: Text(
                                        "${snapshot.data![index]['node']['amount']}"),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: geth(80),
                                    width: getw(110),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                    ),
                                    child: Text(
                                        "${snapshot.data![index]['node']['product']['article']}"),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: geth(80),
                                    width: getw(90),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                    ),
                                    child: Text(
                                        "${snapshot.data![index]['node']['status']}"),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      height: geth(80),
                                      width: getw(60),
                                      child: IconButton(
                                          icon: Icon(Icons.chat,size: 40,),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChatPageOrder()));
                                          })),
                                ],
                              );
                            },
                            itemCount: snapshot.data!.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    ));
  }

  Future<List> funkorder(String sort) async {
    QueryResult? products = await clientAll.value.mutate(MutationOptions(
      document: gql(ordersAllQuery(sort)),
    ));
    final List productlist = products.data?["orders"]['edges'];

    return productlist;
  }

  
}
