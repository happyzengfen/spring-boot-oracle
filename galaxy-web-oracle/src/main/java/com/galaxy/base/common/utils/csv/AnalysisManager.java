package com.galaxy.base.common.utils.csv;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import java.io.*;
import java.util.List;
import java.util.Map;

/**
 * @author 疯信子
 * @version 1.0
 * @date 2018/1/14.
 */
public class AnalysisManager {


    /**
     * 解析csv然后生成对应的vo
     *
     * @param csvFile
     * @param <T>
     * @return
     * @throws Exception
     */
    public static <T> Map<Integer, List<CsvAttr>> getCsvContent(File csvFile) throws Exception {
        Map<Integer, List<CsvAttr>> attrMap = Maps.newHashMap();
        if (csvFile.exists()) {

            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(new FileInputStream(csvFile), "GBK"));
            String attrNames = reader.readLine();
            String line = null;
            int start = 0;
            List<CsvAttr> attrs = null;
            while ((line = reader.readLine()) != null) {
                attrs = Lists.newArrayList();
                List<String> attrlist = CsvUtils.getList(attrNames, ",");
                List<String> typelist = CsvUtils.getList(line, ",");
                // int len = Math.min(attrlist.size(), typelist.size());
                int len = attrlist.size();
                int typeLen = typelist.size();
                for (int i = 0; i < len; i++) {
                    if (len >= typeLen) {
                        if (i == typeLen) {
                            attrs.add(new CsvAttr(attrlist.get(i), ""));
                        } else {
                            attrs.add(new CsvAttr(attrlist.get(i), typelist.get(i)));
                        }
                    }

                }
                if (attrs.size() > 0) {
                    attrMap.put(start, attrs);
                    start++;
                }
            }

        } else {
            attrMap = Maps.newHashMap();
        }
        return attrMap;
    }

    public static <T> Map<Integer, List<CsvAttr>> getCsvContent(InputStream csvFile) throws Exception {
        Map<Integer, List<CsvAttr>> attrMap = Maps.newHashMap();


        BufferedReader reader = new BufferedReader(
                new InputStreamReader(csvFile,"GBK"));
        String attrNames = reader.readLine();
        String line = null;
        int start = 0;
        List<CsvAttr> attrs = null;
        while ((line = reader.readLine()) != null) {
            attrs = Lists.newArrayList();
            List<String> attrlist = CsvUtils.getList(attrNames, ",");
            List<String> typelist = CsvUtils.getList(line, ",");
            // int len = Math.min(attrlist.size(), typelist.size());
            int len = attrlist.size();
            int typeLen = typelist.size();
            for (int i = 0; i < len; i++) {
                if (len >= typeLen) {
                    if (i == typeLen) {
                        attrs.add(new CsvAttr(attrlist.get(i), ""));
                    } else {
                        attrs.add(new CsvAttr(attrlist.get(i), typelist.get(i)));
                    }
                }

            }
            if (attrs.size() > 0) {
                attrMap.put(start, attrs);
                start++;
            }
        }

        return attrMap;
    }

}
