class SubDistrict {
    int id;
    int kabupaten_id;
    int provinsi_id;
    String name;

    SubDistrict({required this.id, required this.kabupaten_id, required this.provinsi_id, required this.name});

    factory SubDistrict.fromJson(Map<String, dynamic> json) {
        return SubDistrict(
            id: json['id'],
            kabupaten_id: json['kabupaten_id'],
            provinsi_id: json['provinsi_id'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['kabupaten_id'] = this.kabupaten_id;
        data['provinsi_id'] = this.provinsi_id;
        data['name'] = this.name;
        return data;
    }

    static List<SubDistrict> fromJsonList(List list) {
        return list.map((item) => SubDistrict.fromJson(item)).toList();
    }

    ///this method will prevent the override of toString
    String userAsString() {
        return '#${this.id} ${this.kabupaten_id} ${this.name}';
    }

    ///this method will prevent the override of toString
    // bool? userFilterByCreationDate(String filter) {
    //     return this.createdAt?.toString().contains(filter);
    // }

    ///custom comparing function to check if two users are equal
    bool isEqual(SubDistrict? model) {
        return this.name == model?.name;
    }

    @override
    String toString() => name;
}