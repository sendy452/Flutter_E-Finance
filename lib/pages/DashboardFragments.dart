import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Create Dashboard Fragment. This will contains a gridview
class DashboardFragments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titles = ['PENDAPATAN TERAKHIR', 'PENGELUARAN TERAKHIR', 'SISA UANG', 'AKTIFITAS TERAKHIR'];
    final nominal = ['Rp.' + '15000', 'Rp.' + '10000', 'Rp.' + '5000', 'Jualan'];
    final keterangan = ['Total Pemasukan: Rp.' + '200000', 'Total Pengeluaran: Rp.' + '30000', '', 'Keterangan: ' + 'Pemasukan'];
    final icons = [Icons.attach_money, Icons.attach_money, Icons.attach_money, Icons.file_copy];
    final warna = [Colors.greenAccent.shade400, Colors.redAccent, Colors.blueAccent, Colors.lightBlueAccent];

    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: warna[index], width: 8))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(titles[index],
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text(nominal[index]),
                        leading: Icon(
                          icons[index],
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(keterangan[index],
                                    style: TextStyle(color: Colors.black87, fontSize: 14.0),
                                  ),
                                )],
                            ),
                          ),
                        ],
                      )],
                  ),
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
              ),
            ),
          );
        },
      );
  }
}