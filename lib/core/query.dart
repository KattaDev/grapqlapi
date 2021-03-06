import 'package:intl/intl.dart';

String loginQuery(email, password) {
  return """
    mutation {
  login(loginInput:{
    email:"$email",
    password:"$password"
  }){
    accessToken
    message
  }
}
  """;
}

String registrQuery(
    String lastname,
    String name,
    String middlename,
    String phone,
    String address,
    String email,
    String password,
    String confirmpassword) {
  return """mutation {
  register(registerInput:{
    lastname:"$lastname"
    name:"$name"
    middlename:"$middlename"
    phone:"$phone"
    address:"$address"
    email:"$email",
    password:"$password"
    confirmPassword:"$confirmpassword"
  })
}""";
}

String ordersAllQuery(String sort) {
  List<String> queryList = [];
  return """{orders(first:50,order_by:{
    $sort
  }){
  edges{
    node{
      productId
      dateOrder
      id
      amount
      status
      product{
        nameModel
        article
      }
    }
  }
}}""";
}

String getProductAll() {
  return """
query products{
  productsType{
  id
  nameModel
  barCode
  description
  photo
}
}""";
}

String getWithArticleP(String search) {
  return """{
   productsType(where:{
     article_starts_with: "$search"
   }){
     nameModel
     article
     id
     description
    photo
   }
 }""";
}

String createOrderQuery(int id, int couterpartyId, int productId, int ammount) {
  return """mutation{
  createOrder(
    input:{
      id: $id
      dateOrder: "${DateTime.now().toIso8601String()}",
      counterpartyId:$couterpartyId,
      productId:$productId,
      document: null,
      status:"WAITING",
      amount: $ammount
    }
  ){
    dateOrder
    amount
  }
  
}""";
}

createorderarray(int couterpartyId, List array) {
  print(couterpartyId.toString());
  print(array.toString());
  return """mutation{
  createArrayOrder(arrayInput:{
    
    dateOrder:"${DateTime.now().toIso8601String()}",
    counterpartyId:$couterpartyId,
    arrays:$array}){
      id
    }
}
""";
}

String moneycomentsQuery() {
  return """{moneyComments(last:10){
  edges{
    node{
      user{
        userName
        id
        email
      }
      userId
      commentsText
      id
      photo
      counterpartyId
      replyId
      status
    }
  }
}
}""";
}

getUser() {
  return """{
  user(id:1){
    id
    userName
    email
    counterpartyId
  }
}""";
}

String orderAllComments() {
  return """{orderComments(last:20){
  edges{
    node{
      user{
        userName
        id
        email
      }
      userId
      commentsText
      id
      photo
      counterpartyId
      replyId
      status
    }
  }
}
}""";
}

sendMessae([String? text, String? image]) {
  return """mutation createOrderComment{
 createOrderComment(input:{
   commentsText:"$text",
   photo:null
 }){
   commentsText
   id


 }
}""";
}

sendMessagemoney([String? text, String? image]) {
  return """mutation createMoneyComment{
 createMoneyComment(input:{
   commentsText:"$text",
   photo:null
 }){
   commentsText
   id
   counterpartyId

 }
}""";
}
