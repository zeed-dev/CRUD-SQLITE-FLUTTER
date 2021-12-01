class District {
    int id;
    int provinsi_id;
    String name;

    District({required this.id, required this.provinsi_id, required this.name});

    factory District.fromJson(Map<String, dynamic> json) {
        return District(
            id: json['id'],
            provinsi_id: json['provinsi_id'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['provinsi_id'] = this.provinsi_id;
        data['name'] = this.name;
        return data;
    }

    static List<District> fromJsonList(List list) {
        return list.map((item) => District.fromJson(item)).toList();
    }

    ///this method will prevent the override of toString
    String userAsString() {
        return '#${this.id} ${this.provinsi_id} ${this.name}';
    }

    ///this method will prevent the override of toString
    // bool? userFilterByCreationDate(String filter) {
    //     return this.createdAt?.toString().contains(filter);
    // }

    ///custom comparing function to check if two users are equal
    bool isEqual(District? model) {
        return this.name == model?.name;
    }

    @override
    String toString() => name;
}