import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:hareesh/model/model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> employee = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: employee.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getText(index, 'ID:', employee[index].id.toString()),
                        getText(
                            index, 'Name:', employee[index].name.toString()),
                        getText(index, 'UserName',
                            employee[index].username.toString()),
                        getText(index, 'ZipCode',
                            employee[index].zipcode.toString()),
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        });
  }

  Text getText(int index, String fieldname, String content) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: fieldname,
          style: (TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      TextSpan(
        text: content,
        style: (TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      )
    ]));
  }

  Future<List<Employee>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        employee.add(Employee.fromJson(index));
      }
      return employee;
    } else {
      return employee;
    }
  }
}
