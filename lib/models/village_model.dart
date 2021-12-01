class Village {
    int id;
    int kecamatan_id;
    int kabupaten_id;
    int provinsi_id;
    String name;

    Village({required this.id, required this.kecamatan_id, required this.kabupaten_id, required this.provinsi_id, required this.name});

    factory Village.fromJson(Map<String, dynamic> json) {
        return Village(
            id: json['id'],
            kecamatan_id: json['kecamatan_id'],
            kabupaten_id: json['kabupaten_id'],
            provinsi_id: json['provinsi_id'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['kecamatan_id'] = this.kecamatan_id;
        data['kabupaten_id'] = this.kabupaten_id;
        data['provinsi_id'] = this.provinsi_id;
        data['name'] = this.name;
        return data;
    }

    static List<Village> fromJsonList(List list) {
        return list.map((item) => Village.fromJson(item)).toList();
    }

    ///this method will prevent the override of toString
    String userAsString() {
        return '#${this.id} ${this.kecamatan_id} ${this.name}';
    }

    ///this method will prevent the override of toString
    // bool? userFilterByCreationDate(String filter) {
    //     return this.createdAt?.toString().contains(filter);
    // }

    ///custom comparing function to check if two users are equal
    bool isEqual(Village? model) {
        return this.name == model?.name;
    }

    @override
    String toString() => name;
}