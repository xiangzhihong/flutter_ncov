class TextUtil {
  // isEmpty
  static bool isEmpty(String text) {
    return text == null || text.isEmpty;
  }

  // 每隔 x位 加 pattern
  static String formatDigitPattern(String text,
      {int digit = 4, String pattern = ' '}) {
    text = text?.replaceAllMapped(new RegExp("(.{$digit})"), (Match match) {
      return "${match.group(0)}$pattern";
    });
    if (text != null && text.endsWith(pattern)) {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }

  // 每隔 x位 加 pattern, 从末尾开始
  static String formatDigitPatternEnd(String text,
      {int digit = 4, String pattern = ' '}) {
    String temp = reverse(text);
    temp = formatDigitPattern(temp, digit: 3, pattern: ',');
    temp = reverse(temp);
    return temp;
  }

  // 每隔4位加空格
  static String formatSpace4(String text) {
    return formatDigitPattern(text);
  }

  // 每隔3三位加逗号,num 数字或数字字符串。int型。
  static String formatComma3(Object num) {
    return formatDigitPatternEnd(num?.toString(), digit: 3, pattern: ',');
  }

  /// hideNumber
  static String hideNumber(String phoneNo,
      {int start = 3, int end = 7, String replacement = '****'}) {
    return phoneNo?.replaceRange(start, end, replacement);
  }

  /// replace
  static String replace(String text, Pattern from, String replace) {
    return text?.replaceAll(from, replace);
  }

  /// split
  static List<String> split(String text, Pattern pattern,
      {List<String> defValue = const []}) {
    List<String> list = text?.split(pattern);
    return list ?? defValue;
  }

  /// reverse
  static String reverse(String text) {
    if (isEmpty(text)) return '';
    StringBuffer sb = StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      sb.writeCharCode(text.codeUnitAt(i));
    }
    return sb.toString();
  }

  /// 手机号正则表达式->true匹配
  bool isMobilePhoneNumber(String value) {
    RegExp mobile = new RegExp(r"(0|86|17951)?(1[0-9][0-9])[0-9]{8}");

    return mobile.hasMatch(value);
  }

  ///验证网页URl
  bool isUrl(String value) {
    RegExp url = new RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");

    return url.hasMatch(value);
  }

  ///校验身份证
  bool isIdCard(String value) {
    RegExp identity = new RegExp(r"\d{17}[\d|x]|\d{15}");

    return identity.hasMatch(value);
  }

  ///正浮点数
  bool isMoney(String value) {
    RegExp identity = new RegExp(
        r"^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$");
    return identity.hasMatch(value);
  }

  ///校验中文
  bool isChinese(String value) {
    RegExp identity = new RegExp(r"[\u4e00-\u9fa5]");

    return identity.hasMatch(value);
  }

  ///校验支付宝名称
  bool isAliPayName(String value) {
    RegExp identity = new RegExp(r"[\u4e00-\u9fa5_a-zA-Z]");

    return identity.hasMatch(value);
  }

  /// 字符串不为空
  bool strNoEmpty(String value) {
    if (value == null) return false;
    return value.trim().isNotEmpty;
  }

  /// 字符串不为空
  bool mapNoEmpty(Map value) {
    if (value == null) return false;
    return value.isNotEmpty;
  }

  ///判断List是否为空
 static bool listNoEmpty(List list) {
    if (list == null) return false;
    if (list.length == 0) return false;
    return true;
  }


  String stringAsFixed(value, num) {
    double v = double.parse(value.toString());
    String str = ((v * 100).floor() / 100).toStringAsFixed(2);
    return str;
  }

  String hiddenPhone(String phone){
    String result = '';

    if(phone != null && phone.length >= 11){
      String sub = phone.substring(0,3);
      String end = phone.substring(8,11);
      result = '$sub****$end';
    }

    return result;
  }

  ///去除后面的0
  String stringDisposeWithDouble(v, [fix = 2]) {
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

  ///去除小数点
  String removeDot(v) {
    String vStr = v.toString().replaceAll('.', '');

    return vStr;
  }

}