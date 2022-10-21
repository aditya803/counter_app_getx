class User_Model{
  List<Data>? data;
  int? total;
  int? page;
  int? limit;

  User_Model({this.data,this.limit,this.page,this.total});

  User_Model.fromJson(Map<String, dynamic> json){
    if(json['data']!=null){
      data = <Data>[];
      json['data'].forEach((v){
        data!.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    if(this.data!=null){
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    return data;
  }
}

class Data{
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  Data({this.title,this.id,this.firstName,this.lastName,this.picture});

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  Map<String,dynamic> toJson()=>{
    "id":id,
    "title":title,
    "firstName": firstName,
    "lastName": lastName,
    "picture": picture,
  };

}