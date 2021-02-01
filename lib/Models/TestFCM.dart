class TestFCM {
  int code;
  String message;

  TestFCM( {
    this.code,
    this.message,
  });

  factory TestFCM.fromJson(Map<String, dynamic> parsedJson){

    return TestFCM(
        code:parsedJson['code'],
        message:parsedJson['message']
    );
  }
}