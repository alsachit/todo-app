import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String name,phone;

  UserModel({
    required this.id,
    required this.name,
    required this.phone
  });


}

class UsersScreen extends StatelessWidget {
   UsersScreen({Key? key}) : super(key: key);

  List<UserModel> users = [
    UserModel(id: 1, name: "Samer Alsachit", phone: "+9647709626526"),
    UserModel(id: 2, name: "Ali Alsachit", phone: "+96477096753"),
    UserModel(id: 3, name: "Ahmed Mohammed", phone: "+9647709626526")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
            itemBuilder: (context, index) => buildUserItem(users[index]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: users.length
        )
      ),
    );
  }

  Widget buildUserItem(UserModel user) => Row(
    children: [
      CircleAvatar(
        radius: 25,
        child: Text(
          '${user.id}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),
        ),
      ),
      SizedBox(width: 20,),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${user.name}',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            '${user.phone}',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    ],
  );
}
