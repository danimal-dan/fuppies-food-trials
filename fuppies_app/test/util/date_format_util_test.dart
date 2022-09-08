import 'package:fuppies_app/util/date_format_util.dart';
import 'package:flutter_test/flutter_test.dart';

const Duration oneDay = Duration(days: 1);
void main() {
  group('Date Format Util', () {
    test('today should display as today', () {
      expect(prettyPrintDateTime(DateTime.now()), startsWith('Today'));
    });

    test('yesterday should display as yesterday', () {
      expect(prettyPrintDateTime(DateTime.now().subtract(oneDay)),
          startsWith('Yesterday'));
    });

    test('tomorrow should display as tomorrow', () {
      expect(prettyPrintDateTime(DateTime.now().add(oneDay)),
          startsWith('Tomorrow'));
    });

    test('any other should display actual date', () {
      final date = DateTime.now().subtract(const Duration(days: 5));

      final String expectation = defaultDateTimeFormat.format(date);

      expect(prettyPrintDateTime(date), expectation);
    });
  });
}
