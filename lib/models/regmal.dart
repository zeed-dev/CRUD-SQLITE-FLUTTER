class RegmalSatu {
  final int nomor_ktp;
  final String nama_lengkap;
  final String tgl_lahir;
  final String jenis_kelamin;
  final String alamat;
  final String provinsi;
  final String asal_penemuan_kasus;
  final String jenis_penemuan;
  final String kegiatan_penemuan;
  final List<String> parasit;

  RegmalSatu({
    required this.nomor_ktp,
    required this.nama_lengkap,
    required this.tgl_lahir,
    required this.jenis_kelamin,
    required this.alamat,
    required this.provinsi,
    required this.asal_penemuan_kasus,
    required this.jenis_penemuan,
    required this.kegiatan_penemuan,
    required this.parasit,
  });

  Map<String, dynamic> toMap() {
    return {
      'nomor_ktp': nomor_ktp,
      'nama_lengkap': nama_lengkap,
      'tgl_lahir': tgl_lahir,
      'jenis_kelamin': jenis_kelamin,
      'alamat': alamat,
      'provinsi': provinsi,
      'asal_penemuan_kasus': asal_penemuan_kasus,
      'jenis_penemuan': jenis_penemuan,
      'kegiatan_penemuan': kegiatan_penemuan,
      'parasit': parasit.join(", "),
    };
  }

  factory RegmalSatu.fromMap(Map<String, dynamic> map) {
    return RegmalSatu(
      nomor_ktp: map['nomor_ktp'],
      nama_lengkap: map['nama_lengkap'],
      tgl_lahir: map['tgl_lahir'],
      jenis_kelamin: map['jenis_kelamin'],
      alamat: map['alamat'],
      provinsi: map['provinsi'],
      asal_penemuan_kasus: map['asal_penemuan_kasus'],
      jenis_penemuan: map['jenis_penemuan'],
      kegiatan_penemuan: map['kegiatan_penemuan'],
      parasit: List<String>.from(map['parasit'].toString().split(",")),
    );
  }
}
