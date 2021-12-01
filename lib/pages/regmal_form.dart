import 'dart:convert';

import 'package:crud_regmal/common/constants.dart';
import 'package:crud_regmal/components/alert_widget.dart';
import 'package:crud_regmal/components/textfield_widget.dart';
import 'package:crud_regmal/models/district_model.dart';
import 'package:crud_regmal/models/province_model.dart';
import 'package:crud_regmal/models/regmal.dart';
import 'package:crud_regmal/models/subdistrict_model.dart';
import 'package:crud_regmal/models/village_model.dart';
import 'package:crud_regmal/provider/regmal_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class RegmalForm extends StatefulWidget {
  static const ROUTE_NAME = '/regmal-form-satu';

  const RegmalForm({Key? key, this.regmalSatu}) : super(key: key);

  final RegmalSatu? regmalSatu;

  @override
  _RegmalFormState createState() => _RegmalFormState();
}

class _RegmalFormState extends State<RegmalForm> {
  int _activeStepIndex = 0;
  List _keys = [];
  bool _showAlert = true;
  bool _isUpdate = false;

  @override
  void initState() {
    super.initState();
    _keys = List.generate(
      5,
      (int i) => GlobalKey(),
    );

    if (widget.regmalSatu != null) {
      _isUpdate = true;
      ktpNumberCtrl.text = widget.regmalSatu!.nomor_ktp.toString();
      fullNameCtrl.text = widget.regmalSatu!.nama_lengkap;
      dateOfBirthCtrl.text = widget.regmalSatu!.tgl_lahir;
      genderCtrl.text = widget.regmalSatu!.jenis_kelamin;
      domicileCtrl.text = widget.regmalSatu!.alamat;
      provinceCtrl.text = widget.regmalSatu!.provinsi;
      domicileCtrl.text = widget.regmalSatu!.asal_penemuan_kasus;
      discoveryTypeCtrl.text = widget.regmalSatu!.jenis_penemuan;
      discoveryActivityCtrl.text = widget.regmalSatu!.kegiatan_penemuan;
      //  _parasit,
    }
  }

  final _keyFormRegister = GlobalKey<FormState>();

  TextEditingController ktpNumberCtrl = TextEditingController();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController dateOfBirthCtrl = TextEditingController();
  TextEditingController genderCtrl = TextEditingController();
  TextEditingController domicileCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();

  TextEditingController provinceCtrl = TextEditingController();
  TextEditingController districtCtrl = TextEditingController();
  TextEditingController subDistrictCtrl = TextEditingController();
  TextEditingController fasyankesCtrl = TextEditingController();
  TextEditingController villageCtrl = TextEditingController();
  TextEditingController subVillageCtrl = TextEditingController();

  TextEditingController caseFromCtrl = TextEditingController();
  TextEditingController discoveryTypeCtrl = TextEditingController();
  TextEditingController discoveryActivityCtrl = TextEditingController();
  TextEditingController labConfirmationCtrl = TextEditingController();
  TextEditingController labCheckingTypeCtrl = TextEditingController();
  TextEditingController labCheckingDateCtrl = TextEditingController();
  TextEditingController checkupResultCtrl = TextEditingController();

  TextEditingController occupationCtrl = TextEditingController();
  TextEditingController diseaseDegreeCtrl = TextEditingController();
  TextEditingController bodyTemperatureCtrl = TextEditingController();
  TextEditingController symptomaticDateCtrl = TextEditingController();
  TextEditingController symptomaticCtrl = TextEditingController();

  TextEditingController gametositCtrl = TextEditingController();
  TextEditingController parasiteDensityCtrl = TextEditingController();
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController pregnancyCtrl = TextEditingController();
  TextEditingController medicationCtrl = TextEditingController();
  TextEditingController treatmentCtrl = TextEditingController();
  TextEditingController deathWithMalariaCtrl = TextEditingController();
  TextEditingController kaderNamerCtrl = TextEditingController();

  List<String> _gender = ['Laki-laki', 'Perempuan'];
  List<String> _provinces = ['Nusa Tenggara Barat', 'Papua Barat'];
  List<String> _parasit = [];

  Logger _logger = Logger();

  Province? selectedProvince;
  District? selectedDistrict;
  SubDistrict? selectedSubDistrict;
  Village? selectedVillage;

  bool isCheck = false;
  bool check = false;
  var checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kRichWhite,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                "Data Penyelidikan Epidiemologi kasus",
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
                    })
                : SizedBox(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Form(
                key: _keyFormRegister,
                child: Stepper(
                  type: StepperType.horizontal,
                  currentStep: _activeStepIndex,
                  steps: stepList(),
                  onStepContinue: () {
                    if (_keyFormRegister.currentState!.validate()) {
                      if (_activeStepIndex < (stepList().length - 1)) {
                        setState(() {
                          _activeStepIndex += 1;
                        });
                      } else {
                        if (!_isUpdate) {
                          var regmal = RegmalSatu(
                            nomor_ktp: int.tryParse(ktpNumberCtrl.text)!,
                            nama_lengkap: fullNameCtrl.text,
                            tgl_lahir: dateOfBirthCtrl.text,
                            jenis_kelamin: genderCtrl.text,
                            alamat: domicileCtrl.text,
                            provinsi: provinceCtrl.text,
                            asal_penemuan_kasus: domicileCtrl.text,
                            jenis_penemuan: discoveryTypeCtrl.text,
                            kegiatan_penemuan: discoveryActivityCtrl.text,
                            parasit: _parasit,
                          );

                          _logger.d(regmal.toMap());

                          Provider.of<RegmalNotifier>(context, listen: false)
                              .addRegmalSatu(regmal);
                        } else {
                          var regmal = RegmalSatu(
                            nomor_ktp: int.tryParse(ktpNumberCtrl.text)!,
                            nama_lengkap: fullNameCtrl.text,
                            tgl_lahir: dateOfBirthCtrl.text,
                            jenis_kelamin: genderCtrl.text,
                            alamat: domicileCtrl.text,
                            provinsi: provinceCtrl.text,
                            asal_penemuan_kasus: domicileCtrl.text,
                            jenis_penemuan: discoveryTypeCtrl.text,
                            kegiatan_penemuan: discoveryActivityCtrl.text,
                            parasit: _parasit,
                          );

                          Provider.of<RegmalNotifier>(context, listen: false)
                              .updateRegmalSatu(regmal);
                        }

                        Navigator.pop(context);
                      }
                    }
                  },
                  onStepCancel: () {
                    if (_activeStepIndex == 0) {
                      return;
                    }

                    setState(() {
                      _activeStepIndex -= 1;
                    });
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _activeStepIndex = index;
                    });
                  },
                  controlsBuilder: (context, {onStepContinue, onStepCancel}) {
                    final isLastStep =
                        _activeStepIndex == stepList().length - 1;
                    return Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onStepContinue,
                              child: (isLastStep)
                                  ? const Text('Submit')
                                  : const Text('Next'),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          if (_activeStepIndex > 0)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: onStepCancel,
                                child: const Text('Back'),
                              ),
                            )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> stepList() => [
        _step1(),
        _step2(),
      ];

  Future<List<Province>> getProvince() async {
    var response = await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/provinsi.json');

    final List data = jsonDecode(response);
    print("Dataa $data");
    return data.map((item) => Province.fromJson(item)).toList();
  }

  Future<List<District>> getDistrict() async {
    var response = await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/kabupaten.json');

    final List data = jsonDecode(response);
    print("Dataa $data");
    return data.map((item) => District.fromJson(item)).toList();
  }

  Step _step1() {
    return Step(
      state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text('Data diri'),
      content: Container(
        child: Column(
          key: _keys[_activeStepIndex],
          children: [
            textFieldWidget(
              label: 'No KTP',
              controller: ktpNumberCtrl,
              inputType: TextInputType.number,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 12,
            ),
            textFieldWidget(
              label: 'Nama Lengkap',
              controller: fullNameCtrl,
              inputType: TextInputType.name,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 12,
            ),
            dateFieldWidget(
              label: "Tanggal Lahir",
              dateController: dateOfBirthCtrl,
              context: context,
              onChanged: (value) {
                dateOfBirthCtrl.text = value;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            dropDownSearchWidget(
              label: 'Jenis Kelamin',
              controller: genderCtrl,
              items: _gender,
              onChanged: (value) {
                genderCtrl.text = value;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            textFieldWidget(
              label: 'Alamat Domisili',
              controller: domicileCtrl,
              inputType: TextInputType.text,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 12,
            ),
            dropDownSearchApiWidget(
              label: 'Provinsi',
              controller: provinceCtrl,
              getData: getProvince,
              selectedItem: selectedProvince,
              onChanged: (value) {
                selectedProvince = value;
                provinceCtrl.text = selectedProvince!.name;
              },
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Step _step2() {
    return Step(
      state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 1,
      title: const Text('Penemuan'),
      content: Container(
        child: Column(
          key: _keys[_activeStepIndex],
          children: [
            textFieldWidget(
              label: 'Asal Penemuan Kasus',
              controller: domicileCtrl,
              inputType: TextInputType.name,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 12,
            ),
            dropDownSearchWidget(
              label: 'Jenis Penemuan',
              controller: discoveryTypeCtrl,
              items: _provinces,
              onChanged: (value) {
                discoveryTypeCtrl.text = value;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            dropDownSearchWidget(
              label: 'Kegiatan Penemuan',
              controller: discoveryActivityCtrl,
              items: _provinces,
              onChanged: (value) {
                discoveryActivityCtrl.text = value;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            checkBoxWidget(
              label: "P.Falciparum",
              value: isCheck,
              onChanged: (val) {
                setState(() {
                  isCheck = val;
                  if (val) {
                    _parasit.add("P.Falciparum");
                  } else {
                    _parasit.removeWhere(
                        (element) => element.contains("P.Falciparum"));
                  }
                });
              },
            ),
            checkBoxWidget(
              label: "P.Vivax",
              value: check,
              onChanged: (val) {
                setState(() {
                  check = val;

                  if (val) {
                    _parasit.add("P.Vivax");
                  } else {
                    _parasit
                        .removeWhere((element) => element.contains("P.Vivax"));
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
