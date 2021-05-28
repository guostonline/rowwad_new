import 'package:get_storage/get_storage.dart';

final box = GetStorage();

saveInformation(String key, value)  {
   box.write(key, value);
}

readInformation(String key)  {
  int myValue =  box.read(key);
  return myValue;
}
