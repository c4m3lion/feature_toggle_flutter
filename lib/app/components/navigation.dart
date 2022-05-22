import 'package:feature_toggle_flutter/app/api/model/userDto.dart';
import 'package:flutter/material.dart';

class NavigationPanel extends StatelessWidget {
  NavigationPanel({Key? key, required this.futureUser}) : super(key: key);
  late Future<UserDto> futureUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserDto>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var usr = snapshot.data!;
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  child: ListTile(
                    leading: Icon(
                      Icons.home_outlined,
                      size: 30,
                    ),
                    title: Text(
                      "Overview",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                    selected: true,
                  ),
                ),
                Divider(
                  indent: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(Icons.home_work_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Organization",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      iconSize: 30,
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: usr.organizations?.length,
                  padding: const EdgeInsets.fromLTRB(75, 5, 30, 5),
                  itemBuilder: (context, index) {
                    return Material(
                      child: InkWell(
                        onTap: () {},
                        child: Text(usr.organizations![index].name),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
