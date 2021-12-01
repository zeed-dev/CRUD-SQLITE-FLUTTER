import 'package:crud_regmal/common/constants.dart';
import 'package:crud_regmal/components/alert_widget.dart';
import 'package:crud_regmal/components/buttons_widget.dart';
import 'package:crud_regmal/components/textfield_widget.dart';
import 'package:crud_regmal/models/epidiemologi_model.dart';
import 'package:crud_regmal/models/regmal.dart';
import 'package:crud_regmal/pages/regmal_form.dart';
import 'package:crud_regmal/provider/regmal_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:provider/provider.dart';

class RegmalSatuScreen extends StatefulWidget {
  static const ROUTE_NAME = '/regmal-satu';

  const RegmalSatuScreen({Key? key}) : super(key: key);

  @override
  _RegmalSatuScreenState createState() => _RegmalSatuScreenState();
}

class _RegmalSatuScreenState extends State<RegmalSatuScreen> {
  bool _showAlert = true;
  TextEditingController searchController = TextEditingController();

  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  Epidiemologi epidiemologi = Epidiemologi();

  @override
  void initState() {
    epidiemologi.initData(100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kRichWhite,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  left: defaultMargin,
                ),
                child: Text(
                  "Data Registrasi Malaria 1",
                  style: kBodyText.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              _showAlert
                  ? allertWidget(
                      message:
                          "Pengisian data hanya sekali jika terjadi kesalahan pengisian atau kesalahan data maka lakukan edit data dan tidak mengisikan data yang sama agar tidak terjadi redudansi data.",
                      onTap: () {
                        setState(() {
                          _showAlert = !_showAlert;
                        });
                      },
                    )
                  : SizedBox(),
              textButton(
                context: context,
                title: "Tambah Data",
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => RegmalForm()));
                },
              ),
              textSearchFieldWidget(controller: searchController),
              _getBodyWidget(),
              SizedBox(
                height: 36,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBodyWidget() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.75,
      padding: EdgeInsets.fromLTRB(
        defaultMargin,
        defaultMargin,
        defaultMargin,
        0,
      ),
      child: Consumer<RegmalNotifier>(
        builder: (ctx, regmal, _) {
          return HorizontalDataTable(
            leftHandSideColumnWidth: 100,
            rightHandSideColumnWidth: 600,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: regmal.regmal.length,
            rowSeparatorWidget: const Divider(
              color: Colors.black54,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
            rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
            verticalScrollbarStyle: const ScrollbarStyle(
              thumbColor: kGrey,
              isAlwaysShown: true,
              thickness: 4.0,
              radius: Radius.circular(5.0),
            ),
            horizontalScrollbarStyle: const ScrollbarStyle(
              thumbColor: kGrey,
              isAlwaysShown: true,
              thickness: 4.0,
              radius: Radius.circular(5.0),
            ),
            enablePullToRefresh: true,
            refreshIndicator: const WaterDropHeader(),
            refreshIndicatorHeight: 60,
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 500));
              _hdtRefreshController.refreshCompleted();
            },
            htdRefreshController: _hdtRefreshController,
          );
        },
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Aksi', 100),
      _getTitleItemWidget('Nama Puskesmas', 150),
      _getTitleItemWidget('provinsi', 150),
      _getTitleItemWidget('Jumlah kasus', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Consumer<RegmalNotifier>(
      builder: (ctx, data, _) {
        return Container(
          height: 52,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  print(data.regmal[index].nomor_ktp);
                  RegmalSatu regmalSatuSelected = await data
                      .getRegmalSatuById(data.regmal[index].nomor_ktp);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => RegmalForm(
                        regmalSatu: regmalSatuSelected,
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.edit_outlined,
                  color: kYellow,
                  size: 18,
                ),
              ),
              InkWell(
                onTap: () async {
                  print(data.regmal[index].nomor_ktp);
                  await data.deleteRegmalSatu(data.regmal[index].nomor_ktp);
                },
                child: Icon(
                  Icons.remove_circle,
                  color: kYellow,
                  size: 18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Consumer<RegmalNotifier>(
      builder: (ctx, regmal, _) {
        var data = regmal.regmal;

        return Row(
          children: <Widget>[
            /// NAMA PSUKESMAS
            Container(
              child: Text(data[index].nama_lengkap),
              width: 150,
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),

            /// provinsi
            Container(
              child: Text(data[index].provinsi),
              width: 150,
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),

            /// Jumlah kasus
            Container(
              child: Text(data[index].parasit.join()),
              width: 100,
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ],
        );
      },
    );
  }
}
