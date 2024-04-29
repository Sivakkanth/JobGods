import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/controller/profile_controller.dart';
import 'package:jobgods/models/user_model.dart';

class AllusersScreen extends StatelessWidget {
  const AllusersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xff0d0140),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<List<UserModel>>(
            future: profileController.getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (c, index) {
                      return ListTile(
                        iconColor: Colors.blue,
                        tileColor: Colors.blue.withOpacity(0.1),
                        leading: const Icon(Icons.person),
                        title: Text("Name: ${snapshot.data![index].username}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data![index].phonenumber),
                            Text(snapshot.data![index].email),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
