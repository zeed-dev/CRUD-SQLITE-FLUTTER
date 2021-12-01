class Epidiemologi {
  List<EpidiemologiKasus> epidiemologiKasus = [];

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      epidiemologiKasus.add(
        EpidiemologiKasus(
          nama_puskesmas: "Puskesmas Kembar $i",
          provinsi: "Nusa Tenggara Barat $i",
          jumlah_kasus: i.toString(),
        ),
      );
    }
  }
}

class EpidiemologiKasus {
  String nama_puskesmas;
  String provinsi;
  String jumlah_kasus;

  EpidiemologiKasus({
    required this.nama_puskesmas,
    required this.provinsi,
    required this.jumlah_kasus,
  });
}
