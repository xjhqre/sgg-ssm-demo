package com.xjhqre.crud.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: xjhqre
 * @DateTime: 2022/2/10 18:22
 */
public class Msg {
    // 状态码 100：成功   200：失败
    private int code;
    // 提示信息
    private String msg;
    // 返回给用户的数据，用map存储
    private Map<String, Object> extend = new HashMap<>();

    // 返回成功方法
    public static Msg success() {
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功！");
        return result;
    }

    // 返回失败方法
    public static Msg fail() {
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败！");
        return result;
    }

    // 用于链式添加信息
    public Msg add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
