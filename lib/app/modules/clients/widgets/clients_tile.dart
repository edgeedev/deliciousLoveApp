import 'package:deliciousloveapp/app/modules/clients/clients_controller.dart';
import 'package:deliciousloveapp/app/modules/clients/models/clients_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientTile extends StatefulWidget {
  @override
  _ClientTileState createState() => _ClientTileState();
}

class _ClientTileState extends ModularState<ClientTile, ClientsController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
      child: Observer(
        builder: (_) {
          if (controller.clientsList.hasError) {
            return Center(
              child: RaisedButton(
                onPressed: controller.getList(),
                child: Text('ERROORR dasujhduashd'),
              ),
            );
          }

          if (controller.clientsList.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<ClientsModel> list = controller.clientsList.data;
          return GestureDetector(
            onLongPress: () {},
            child: Container(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    ClientsModel model = list[index];
                    return Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100,254, 201, 241),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        ),
                      ),
                      child: ListTile(
                          title: Text(
                            model.name,
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            "fone: ${model.phone}",
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Pedidos: 0",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Gastos: 0",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),

                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}