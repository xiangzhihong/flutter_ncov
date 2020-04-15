class API {

  static const key = "7cfb4a16bb628d90a4043a707cbfca2f";

  //请求Baseurl
  static const rumourBaseUrl = 'http://api.tianapi.com/txapi';
  //获取谣言
  static const getRumour = '/rumour/index?key=';

  //请求Baseurl
  static const baseUrl = 'http://49.232.173.220:3001';
  // 按时间线获取事件
  static const timelineService = '/data/getTimelineService';

  // 最新辟谣
  static const getIndexRumorList = '/data/getIndexRumorList';

  // 最新防护知识
  static const getProtectList = '/data/getIndexRecommendList';

  // 最新知识百科
  static const getWikiList = '/data/getWikiList';

  // 获取整体统计信息
  static const getStatistics = '/data/getStatisticsService';

  // 获取省份信息
  static const getAreaStat = '/data/getAreaStat';

  // 诊疗信息
  static const getEntries = '/data/getEntries';

  // 版本更新
  static const update = '/app/update';
}
