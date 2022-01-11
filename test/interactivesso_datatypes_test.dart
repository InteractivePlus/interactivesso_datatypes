//import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(true,true);
    });
  });

  test("test",(){
    PhoneNumber parsed = PhoneNumber.fromRaw("+86-137-868-14367");
    print(parsed.international);
    expect(parsed.countryCode,"86");
  });
  
}
