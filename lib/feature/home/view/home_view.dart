import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:refactor_flutter_aps/core/enums/database_enums.dart';
import 'package:refactor_flutter_aps/core/manager/database/database_manager_interface.dart';
import 'package:refactor_flutter_aps/core/manager/database/shared_manager.dart';
import 'package:refactor_flutter_aps/feature/home/view_model/home_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/manager/network/network_manager.dart';
import '../../../core/provider/user_context.dart';
import '../../add_user/view/add_student_view.dart';
import '../../add_user/view_model/student_view_model.dart';
import '../model/home_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    _viewModel.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>.value(
      value: _viewModel,
      child: Consumer<HomeViewModel>(builder: (context, value, child) => _bodyView(context)),
    );
  }

  Scaffold _bodyView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_viewModel.title ?? ''),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('add'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ChangeNotifierProvider(
                builder: (context, child) => StudentAddView(),
                create: (context) {
                  return OgrenciProvider();
                },
              );
            },
          ));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ...(_viewModel.resourceModel?.data ?? []).map((e) {
              return Card(
                child: ListTile(
                  leading: Container(
                    width: 10,
                    color: HexColor(e.color!),
                  ),
                  // leading: Container(
                  // color: Color(int.parse('FF${resourceModel!.data![index].color!.replaceAll('#', '')}', radix: 16))),
                  title: Text(e.name.toString()),
                ),
              );
            }).toList(),
            Text(
              'data',
              style: TextStyle(fontSize: 35),
            ),
            Divider(thickness: 5),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Text('a');
              },
            ),
            OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Text('Helloi');
                    },
                  );
                },
                child: Text('Show')),
            Text(
              'Heyo',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
            ),
            TextButton(
                onPressed: () {
                  launch("https://pub.dev/packages/url_launcher");
                },
                child: Text("Open Web")),
            TextButton(
                onPressed: () {
                  launch("tel:+1 555 010 999");
                },
                child: Container(
                    height: 46,
                    child: Center(
                        child: Text(
                      'call',
                      style: TextStyle(color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(23)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x65ff6969), offset: Offset(0, 5), blurRadius: 10, spreadRadius: 0)
                        ],
                        color: Colors.red))),
            TextButton(
                onPressed: () {
                  launch("tel:+1 555 010 999");
                },
                child: Container(
                    height: 46,
                    child: Center(
                        child: Text(
                      'call',
                      style: TextStyle(color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(23)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x65ff6969), offset: Offset(0, 5), blurRadius: 10, spreadRadius: 0)
                        ],
                        color: Colors.red)))
          ],
        ),
      ),
    );
  }
}
