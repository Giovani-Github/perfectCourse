package com.giovani.perc.controller;

import java.io.File;

/**
 * @Author Giovani
 * @Create: 2018/8/28 10:25
 */
public class Test {

    @org.junit.Test
    public void demo1() {

        File file = new File("/pdf/demo");
        System.out.println(file.toString());

    }

}
