import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/drawer_bloc.dart';
import '../utils/app_images.dart';
import '../utils/hex_color.dart';
import 'drawer_list_tile.dart';

class AppDrawer extends StatefulWidget {
  final VoidCallback closeDrawer;
  const AppDrawer({
    super.key,
    required this.closeDrawer,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late DrawerBloc _drawerBloc;

  @override
  void initState() {
    _drawerBloc = BlocProvider.of<DrawerBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        AppImages.profile,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome",
                        style:
                            TextStyle(fontSize: 14, color: HexColor("#929292")),
                      ),
                      Text(
                        "Tony Roshdy",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: HexColor("#181818")),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    AppImages.arrow,
                    height: 30,
                  )
                ],
              )),
          Expanded(child:
              BlocBuilder<DrawerBloc, DrawerState>(builder: (context, state) {
            return ListView.builder(
                itemCount: _drawerBloc.drawerItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return DrawerListTile(
                    onPress: () {
                      widget.closeDrawer();
                      _drawerBloc.add(ChangeDrawerIndexEvent(
                        index: index,
                      ));
                      Navigator.pushNamed(context,
                          _drawerBloc.drawerItems[index].routeNavigation);
                    },
                    drawerItem: _drawerBloc.drawerItems[index],
                  );
                });
          }))
        ],
      ),
    );
  }
}
