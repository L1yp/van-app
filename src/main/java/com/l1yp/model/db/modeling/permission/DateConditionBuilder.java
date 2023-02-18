package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.DataConditionType;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.DateFieldConditionModel;
import com.l1yp.model.db.system.SimpleDept;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public class DateConditionBuilder implements IFieldCondition {

    private final Logger log = LoggerFactory.getLogger(DateConditionBuilder.class);

    @Override
    public void use(StringBuilder sb, String tableName, ModelingField field, List<SimpleDept> dptTree, List<String> selfDptIds, List<Object> args, BlockExpressionModel blockItem) {
        DateFieldConditionModel dateConditionModel = (DateFieldConditionModel) blockItem.getValue();
        DataConditionType type = dateConditionModel.getDataType();
        String fieldName = field.getField();
        if (type == DataConditionType.FIXED) {
            String strRange = dateConditionModel.getRange();
            //
            List<String> range = List.of(strRange.split(","));
            if (range.size() != 2) {
                log.warn("The range size must be equals 2: {}", blockItem);
                return;
            }

            Date startDate = new Date(Long.parseLong(range.get(0)));
            Date endDate = new Date(Long.parseLong(range.get(1)) + 86399999L);
            int startIdx = args.size();
            args.add(startDate);
            args.add(endDate);
            sb.append(" (");
            sb.append(fieldName).append(" >= #{").append(PARAM_NAME).append("[").append(startIdx).append("]}");
            sb.append(" AND ");
            sb.append(fieldName).append(" <= #{").append(PARAM_NAME).append("[").append(startIdx + 1).append("]}");
            sb.append(")");
        }
        // 变量模式
        else {
            LocalDate startDate;
            if (type == DataConditionType.DAY) {
                startDate = getCurrentDay();
            } else if (type == DataConditionType.WEEK) {
                startDate = getStartDayOfCurrentWeek();
            } else if (type == DataConditionType.MONTH) {
                startDate = getStartDayOfCurrentMonth();
            } else if (type == DataConditionType.QUARTER) {
                startDate = getStartDayOfCurrentQuarter();
            } else if (type == DataConditionType.YEAR) {
                startDate = getStartDayOfCurrentYear();
            } else {
                log.warn("date condition type is wrong: {}", dateConditionModel);
                return;
            }
            int startIdx = args.size();
            args.add(startDate);
            sb.append(fieldName).append(" >= #{").append(PARAM_NAME).append("[").append(startIdx).append("]}");
        }
    }

    private LocalDate getCurrentDay() {
        return LocalDate.now();
    }

    private LocalDate getStartDayOfCurrentWeek() {
        LocalDate now = LocalDate.now();
        DayOfWeek dayOfWeek = now.getDayOfWeek();
        int value = dayOfWeek.getValue();
        return now.minusDays(value - 1);
    }

    private LocalDate getStartDayOfCurrentMonth() {
        LocalDate now = LocalDate.now();
        int value = now.getDayOfMonth();
        return now.minusDays(value - 1);
    }

    private LocalDate getStartDayOfCurrentQuarter() {
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        int month = now.getMonth().firstMonthOfQuarter().getValue();
        return LocalDate.of(year, month, 1);
    }

    private LocalDate getStartDayOfCurrentYear() {
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        return LocalDate.of(year, 1, 1);
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
