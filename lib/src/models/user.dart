class User{
  final String userId;
  final String email;

  User({this.userId, this.email});

  Map<String, dynamic> toMap(){
    return {
      'userId' : userId,
      'email' : email,
    };
  }

  User.fromFireStore(Map<String, dynamic> firestore)
      : userId = firestore['userId'],
        email = firestore['email'];
}