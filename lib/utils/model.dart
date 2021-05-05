class Input{

  String title;
  String description;
  Input({this.title,this.description});

  factory Input.fromJson(Map<String,dynamic>json){
    return Input(
      title: json["title"],
      description: json['description']
    );
  }

  Map<String,dynamic> toJson() =>{
    'title':title,
    'description':description,
    
  };
}

