package com.l1yp.conf.constants.process;

public interface ProcessConstants {

    String PROCESS_START_FORM_KEY = "$$START_PAGE_KEY$$";

    interface PublishState {
        int PUBLISHED = 1;
        int UNPUBLISHED = 0;
    }

    interface ComponentType {
        int SINGLE_LINE_TEXT = 1;
        int MULTI_LINE_TEXT = 2;
        int SINGLE_DICT = 3;
        int MULTI_DICT = 4;
        int NUMBER = 5;
        int SINGLE_USER = 6;
        int MULTI_USER = 7;
        int EXTENSION_TAG = 8;
        int SINGLE_DEPT = 9;
        int MULTI_DEPT = 10;
        int DATETIME = 11;

        int DATE = 12;
    }



}
