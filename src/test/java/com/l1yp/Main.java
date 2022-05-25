package com.l1yp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Main {

    public static class Demo {
        public Integer id;
        public String name;

        public Demo(Integer id, String name) {
            this.id = id;
            this.name = name;
        }


        public Integer getId() {
            return id;
        }
    }

    public static void main(String[] args) {
        List<Demo> demos = new ArrayList<>();
        demos.add(new Demo(1, "A"));
        demos.add(new Demo(2, "B"));
        demos.add(new Demo(1, "C"));
        demos.add(new Demo(1, "D"));
        demos.add(new Demo(2, "E"));
        Map<Integer, List<Demo>> map = demos.stream().collect(Collectors.groupingBy(Demo::getId, Collectors.toList()));
        System.out.println("map = " + map);

        List<Object> arr = new ArrayList<>();
        arr.add(Long.valueOf("8"));
        arr.add(Integer.valueOf("4"));
        arr.add(Short.valueOf("2"));
        arr.add(Byte.valueOf("1"));
        for (Object obj : arr) {
            Number number = (Number) obj;
            System.out.println(number.intValue());
        }
    }
}
