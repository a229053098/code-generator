//package com.codegen.cody.common.utils;
//
//import com.qipa.entity.Dict;
//import com.qipa.service.IDictService;
//import com.qipa.util.RedisUtil;
//import net.sf.json.JSONArray;
//import net.sf.json.JSONObject;
//import org.springframework.web.context.ContextLoader;
//import org.springframework.web.context.WebApplicationContext;
//
//import java.util.*;
//
///**
// * Created by Gend on 2017/6/22.
// */
//
//public class DictUtil {
//
//    public static final String CACHE_DICT_MAP = "CACHE_DICT_MAP";
//    private static IDictService dictService;
//
//
//    /**
//     * 通过字典类型获取字典MAP，优先缓存获取
//     *
//     * @param type
//     * @return
//     */
//    public static Map<Integer, String> getDictMap(String type) {
//        WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
//        RedisUtil redisUtil = webApplicationContext.getBean(RedisUtil.class);
//
//        //按类型组装成map，里面再一个map，code为key，name为值
//        Map<String, Map<Integer, String>> listMap = (Map<String, Map<Integer, String>>) redisUtil.get(CACHE_DICT_MAP);
//
//        if (listMap == null) {
//            listMap = new HashMap<>();
//            init();
//            //数据库取
//            List<Dict> list = dictService.selectList(new Dict());
//            //按type组装成Map<List>
//            for (Dict dict : list) {
//                String type2 = dict.getType();
//                Integer code = dict.getCode();
//                String name = dict.getName();
//                Map<Integer, String> maps = listMap.get(type2);
//                if (maps == null) {
//                    Map<Integer, String> newMap = new HashMap<>();
//                    newMap.put(code, name);
//                    listMap.put(type2, newMap);
//                } else {
//                    maps.put(code, name);
//                }
//            }
//            //存入缓存
//            redisUtil.set(CACHE_DICT_MAP, listMap);
//        }
//        return listMap.get(type);
//    }
//
//
//    /**
//     * 返回list集合
//     * 通过字典类型获取字典集合【这个用在下拉框】
//     *
//     * @param dictType
//     * @return
//     */
//    public static List<Map> getByType(String dictType) {
//        Map<Integer, String> map = getDictMap(dictType);
//        ArrayList arrayList = new ArrayList();
//        if(map != null){
//            Set<Map.Entry<Integer, String>> entries = map.entrySet();
//            for(Map.Entry entry: entries){
//                Map map1 = new HashMap();
//                map1.put("code", entry.getKey());
//                map1.put("name" , entry.getValue());
//                arrayList.add(map1);
//            }
//        }
//        return arrayList;
//    }
//
//
//
//    /**
//     * 返回list集合的json格式【用在js遍历】
//     * 通过字典类型获取字典集合
//     *
//     * @param dictType
//     * @return
//     */
//    public static String getDictListJson(String dictType) {
//        return JSONArray.fromObject(getByType(dictType)).toString();
//    }
//
//    /**
//     * 返回Map的json格式，Map<code, name>
//     * 界面字典用这里【这个用在JS通过code得到name】
//     * 返回JSONObject对象
//     *
//     * @param dictType
//     * @return
//     */
//    public static String getJSONByType(String dictType) {
//        Map<Integer, String> map = getDictMap(dictType);
//        JSONObject jsonObject = new JSONObject();
//        if(map != null){
//            Set<Map.Entry<Integer, String>> entries = map.entrySet();
//            for(Map.Entry entry: entries){
//                jsonObject.put(entry.getKey(), entry.getValue());
//            }
//        }
//        return jsonObject.toString();
//    }
//
//
//    private static void init() {
//        WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
//        dictService = webApplicationContext.getBean(IDictService.class);
//    }
//
//
//    /**
//     * 返回集合的json格式
//     * 返回字典列表（JSON）【用在JS】
//     *
//     * @param type
//     * @return
//     */
//    public static String getDictMapJson(String type) {
//        return JSONArray.fromObject(getByType(type)).toString();
//    }
//
//
//    /**
//     * 直接通过code和type得到name
//     * @param value
//     * @param type
//     * @param defaultValue
//     * @return
//     */
//    public static String getDictLabel(String value, String type, String defaultValue) {
//        if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)) {
//            Map<Integer, String> map = getDictMap(type);
//            defaultValue = map.get(Integer.valueOf(value));
//        }
//        return defaultValue;
//    }
//}