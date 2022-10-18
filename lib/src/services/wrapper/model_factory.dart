abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    var strType = type.toString().replaceAll("?", "");
    // if (strType == (AuthModel).toString()) {
    //   return AuthModel.fromJson(json);
    // }
    // if not implemented
    // else {
    throw UnimplementedError('`$type` factory unimplemented.');
    // }
  }
}
