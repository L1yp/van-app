package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.BlockItem;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.DateConditionModel;
import com.l1yp.model.db.system.DeptPlain;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class DateConditionBuilder implements IFieldCondition {

    private final Logger log = LoggerFactory.getLogger(DateConditionBuilder.class);

    @Override
    public void use(StringBuilder sb, String tableName, ModelingField field, List<DeptPlain> dptTree, List<String> selfDptIds, List<Object> args, BlockItem blockItem) {
        DateConditionModel dateConditionModel = null;
        String type = dateConditionModel.getType();
        String fieldId = field.getId();
        if (type.equals("固定")) {
            List<String> range = dateConditionModel.getRange();
            if (range.size() != 2) {
                log.warn("The range size must be equals 2: {}", blockItem);
                return;
            }
            String startDate = range.get(0) + " 00:00:00";
            String endDate = range.get(1) + " 23:59:59";
            int startIdx = args.size();
            args.add(startDate);
            args.add(endDate);
            sb.append(" (");
            sb.append(fieldId).append(" >= #{").append(PARAM_NAME).append("[").append(startIdx).append("]}");
            sb.append(" AND ");
            sb.append(fieldId).append(" <= #{").append(PARAM_NAME).append("[").append(startIdx + 1).append("]}");
            sb.append(")");
        }
        // 变量模式
        else {
            String startDate;
            if (type.equals("今天")) {
                startDate = getCurrentDay();
            } else if (type.equals("本周")) {
                startDate = getStartDayOfCurrentWeek();
            } else if (type.equals("本月")) {
                startDate = getStartDayOfCurrentMonth();
            } else if (type.equals("本季度")) {
                startDate = getStartDayOfCurrentQuarter();
            } else if (type.equals("本年")) {
                startDate = getStartDayOfCurrentYear();
            } else {
                log.warn("date condition type is wrong: {}", dateConditionModel);
                return;
            }
            int startIdx = args.size();
            args.add(startDate);
            sb.append(fieldId).append(" >= #{").append(PARAM_NAME).append("[").append(startIdx).append("]}");
        }
    }

    private String getCurrentDay() {
        LocalDate now = LocalDate.now();
        return now.format(DateTimeFormatter.ISO_DATE) + " 00:00:00";
    }

    private String getStartDayOfCurrentWeek() {
        LocalDate now = LocalDate.now();
        DayOfWeek dayOfWeek = now.getDayOfWeek();
        int value = dayOfWeek.getValue();
        LocalDate localDate = now.minusDays(value - 1);
        return localDate.format(DateTimeFormatter.ISO_DATE) + " 00:00:00";
    }

    private String getStartDayOfCurrentMonth() {
        LocalDate now = LocalDate.now();
        int value = now.getDayOfMonth();
        LocalDate localDate = now.minusDays(value - 1);
        return localDate.format(DateTimeFormatter.ISO_DATE) + " 00:00:00";
    }

    private String getStartDayOfCurrentQuarter() {
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        int month = now.getMonth().firstMonthOfQuarter().getValue();
        LocalDate date = LocalDate.of(year, month, 1);
        return date.format(DateTimeFormatter.ISO_DATE) + " 00:00:00";
    }

    private String getStartDayOfCurrentYear() {
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        LocalDate date = LocalDate.of(year, 1, 1);
        return date.format(DateTimeFormatter.ISO_DATE) + " 00:00:00";
    }
//
//    public static void main(String[] args) {
//        System.out.println("今天: " + new DateConditionImpl().getCurrentDay());
//        System.out.println("本周第一天:" + new DateConditionImpl().getStartDayOfCurrentWeek());
//        System.out.println("本月第一天:" + new DateConditionImpl().getStartDayOfCurrentMonth());
//        System.out.println("季度第一天" + new DateConditionImpl().getStartDayOfCurrentQuarter());
//        System.out.println("本年第一天" + new DateConditionImpl().getStartDayOfCurrentYear());
//        /**
//         * 今天: 2022-09-30 00:00:00
//         * 本周第一天:2022-09-26 00:00:00
//         * 本月第一天:2022-09-01 00:00:00
//         * 季度第一天2022-07-01 00:00:00
//         * 本年第一天2022-01-01 00:00:00
//         */
//    }




}
