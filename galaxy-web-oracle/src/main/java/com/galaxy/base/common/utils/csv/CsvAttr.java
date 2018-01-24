package com.galaxy.base.common.utils.csv;

/**
 * @author 疯信子
 * @version 1.0
 * @date 2018/1/14.
 */
public class CsvAttr {
    
    /**
    * 变量名
    */
    private String  name;
    
    /**
    *属性值
    */
    private String  type;



    public CsvAttr(String name, String type) {
        this.name = name;
        this.type = type;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
