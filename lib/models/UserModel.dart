class usermodel{
  String? userid;
  String?username;
  String?userEmail;
  String?userPassword;

  usermodel(this.userid,this.username,this.userEmail,this.userPassword);
  Map <String,dynamic> toMap(){
    var map=<String,dynamic>{
      'userid':userid,
     'username':username,
      'userEmail':userEmail,
      'userPassword':userPassword
    };
    return map;
  }
  usermodel.fromMap(Map<String,dynamic>map){
    userid = map['userid'];
    username=map['username'];
    userEmail=map['userEmail'];
    userPassword=map['userPassword'];
  }
}