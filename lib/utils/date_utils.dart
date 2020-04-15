import 'package:intl/intl.dart';

class DateUtils {

  static String formatTimeToString(timestamp, [format]) {
    assert(timestamp != null);
    int time = 0;
    if (timestamp is int) {
      time = timestamp;
    } else {
      time = int.parse(timestamp.toString());
    }
    if (format == null) {
      format = 'yyyy-MM-dd HH:mm';
    }
    DateFormat dateFormat = new DateFormat(format);
    var date = new DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return dateFormat.format(date);
  }

  static String formatTime(int time) {
    print('formatTime:'+time.toString());
    double createTimeDouble = strNoEmpty('$time') ? time / 1000 : 0;
    int createTime = int.parse('${stringDisposeWithDouble(createTimeDouble)}');
    return '${formatTimeToString(createTime) ?? '未知'}';
  }


  static bool strNoEmpty(String value) {
    if (value == null) return false;
    return value
        .trim()
        .isNotEmpty;
  }

  static String stringDisposeWithDouble(v, [fix = 2]) {
    double b = double.parse(v.toString());
    String vStr = b.toStringAsFixed(fix);
    int len = vStr.length;
    for (int i = 0; i < len; i++) {
      if (vStr.contains('.') && vStr.endsWith('0')) {
        vStr = vStr.substring(0, vStr.length - 1);
      } else {
        break;
      }
    }

    if (vStr.endsWith('.')) {
      vStr = vStr.substring(0, vStr.length - 1);
    }

    return vStr;
  }

}