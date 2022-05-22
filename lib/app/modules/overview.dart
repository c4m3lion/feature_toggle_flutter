import 'package:feature_toggle_flutter/app/api/api/user_service.dart';
import 'package:feature_toggle_flutter/app/api/model/userDto.dart';
import 'package:feature_toggle_flutter/app/components/change_birghtness_toggle.dart';
import 'package:feature_toggle_flutter/app/components/navigation.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  late Future<UserDto> futureUser;

  List<TableRow> generateStatistics(UserDto usr) {
    List<TableRow> rows = [];
    for (var i in usr.organizations!) {
      rows.add(TableRow(children: [
        Text(i.name),
        Text(i.role.toString()),
        Text(i.id.toString()),
        Text("5"),
      ]));
    }
    return rows;
  }

  @override
  void initState() {
    super.initState();
    futureUser = UserService().fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        return FutureBuilder<UserDto>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var usr = snapshot.data!;
              return Scaffold(
                appBar: AppBar(
                  leadingWidth: 200,
                  leading: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Image.asset(
                      'assets/img/logo.png',
                    ),
                  ),
                  title: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text("Feature Toggle App"),
                  ),
                  actions: [BrightnessChangeToggle()],
                ),
                body: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      constraints.maxWidth > 600
                          ? Container(
                              width: 280,
                              child: NavigationPanel(futureUser: futureUser),
                            )
                          : const SizedBox(),
                      VerticalDivider(),
                      Expanded(
                        child: ListView(
                          controller: ScrollController(),
                          children: [
                            Text(
                              "Hello ${usr.firstName} ${usr.lastName}! We're glad you're back.",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: const EdgeInsets.all(10),
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/overview.png',
                                    ),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(80, 20, 0, 26),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Welcome to the\nSwisscom Feature Toggle App",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "In the Swisscom Feature Toggle App\nyou can manage your feature toggles",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: const EdgeInsets.all(10),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(26, 20, 0, 26),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Statistics",
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    Divider(),
                                    Table(
                                      border: TableBorder(
                                        bottom: BorderSide(
                                          color: Theme.of(context).dividerColor,
                                        ),
                                        horizontalInside: BorderSide(
                                          width: 1,
                                          color: Theme.of(context).dividerColor,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      columnWidths: {
                                        0: FractionColumnWidth(0.30)
                                      },
                                      children: [
                                        TableRow(children: [
                                          Text('Organization',
                                              style: TextStyle(fontSize: 20.0)),
                                          Text('Memebers',
                                              style: TextStyle(fontSize: 20.0)),
                                          Text('Spaces',
                                              style: TextStyle(fontSize: 20.0)),
                                          Text('Feature Toggles',
                                              style: TextStyle(fontSize: 20.0)),
                                        ]),
                                        for (var i in usr.organizations!)
                                          TableRow(children: [
                                            Text(
                                              i.name,
                                            ),
                                            Text(
                                              '2',
                                            ),
                                            Text(
                                              '2',
                                            ),
                                            Text(
                                              '2',
                                            ),
                                          ]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: const EdgeInsets.all(10),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(26, 20, 0, 26),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Last Actions",
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    Divider(),
                                    Table(
                                      border: TableBorder(
                                        bottom: BorderSide(
                                          color: Theme.of(context).dividerColor,
                                        ),
                                        horizontalInside: BorderSide(
                                          width: 1,
                                          color: Theme.of(context).dividerColor,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      columnWidths: {
                                        0: FractionColumnWidth(0.30)
                                      },
                                      children: [
                                        TableRow(children: [
                                          Text('Author',
                                              style: TextStyle(fontSize: 20.0)),
                                          Text('Audit-info',
                                              style: TextStyle(fontSize: 20.0)),
                                          Text('Organization',
                                              style: TextStyle(fontSize: 20.0)),
                                          Text('Space',
                                              style: TextStyle(fontSize: 20.0)),
                                          Text('Timestamp',
                                              style: TextStyle(fontSize: 20.0)),
                                        ]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                drawer: constraints.maxWidth <= 600
                    ? Drawer(
                        child: NavigationPanel(futureUser: futureUser),
                      )
                    : null,
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        );
      },
    ));
  }
}
