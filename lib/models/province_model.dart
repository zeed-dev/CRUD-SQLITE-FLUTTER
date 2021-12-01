class Province {
    int id;
    String name;

    Province({required this.id, required this.name});

    factory Province.fromJson(Map<String, dynamic> json) {
        return Province(
            id: json['id'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }

    static List<Province> fromJsonList(List list) {
        return list.map((item) => Province.fromJson(item)).toList();
    }

    ///this method will prevent the override of toString
    String userAsString() {
        return '#${this.id} ${this.name}';
    }

    ///this method will prevent the override of toString
    // bool? userFilterByCreationDate(String filter) {
    //     return this.createdAt?.toString().contains(filter);
    // }

    ///custom comparing function to check if two users are equal
    bool isEqual(Province? model) {
        return this.name == model?.name;
    }

    @override
    String toString() => name;
}