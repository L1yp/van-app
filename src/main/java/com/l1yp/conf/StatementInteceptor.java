package com.l1yp.conf;

import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;
import org.springframework.util.StringUtils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Statement;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @Author Lyp
 * @Date 2020/4/28
 * @Email l1yp@qq.com
 */
@Intercepts(
        @Signature(
                type = StatementHandler.class,
                method = "parameterize",
                args = {Statement.class}
        )
)
@Component
public class StatementInteceptor implements Interceptor, InitializingBean {

    private static final String HIKARICP = "com.zaxxer.hikari.pool.HikariProxyPreparedStatement";
    private static final String DRUID_PREPARE = "com.alibaba.druid.pool.DruidPooledPreparedStatement";
    private static final String DRUID_CALL = "com.alibaba.druid.pool.DruidPooledCallableStatement";

    private static final Logger log = LoggerFactory.getLogger(StatementInteceptor.class);

    private Set<String> ignore = new HashSet<>();

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        Object result = invocation.proceed();
        readSql(invocation.getTarget(), invocation.getArgs()[0]);
        return result;
    }

    private void readSql(Object target, Object stat) throws Throwable {
        Field field = target.getClass().getDeclaredField("delegate");
        field.setAccessible(true);
        Object delegate = ReflectionUtils.getField(field, target);
        field = delegate.getClass().getSuperclass().getDeclaredField("mappedStatement");
        field.setAccessible(true);
        MappedStatement statement = (MappedStatement)ReflectionUtils.getField(field, delegate);
        String id = statement.getId();

        //如果是启用了 StdLogImpl，该类是启用了debug级别，因此会将statement包装成代理类以便拦截并输出日志
        if (Proxy.isProxyClass(stat.getClass())){
            InvocationHandler preparedStatementLogger = Proxy.getInvocationHandler(stat);
            field = preparedStatementLogger.getClass().getDeclaredField("statement");
            field.setAccessible(true);
            stat = field.get(preparedStatementLogger);
        }
        String clazzName = stat.getClass().getName();
        String sql = null;
        switch (clazzName){
            case HIKARICP:
                sql = readHikariCPSql(stat);
                break;
            case DRUID_PREPARE:
                sql = readDruidPrepareSql(stat);
                break;
            case DRUID_CALL:
                sql = readDruidCallSql(stat);
                break;
            default:
                log.error("className: {}", clazzName);
                break;
        }
        if (sql != null && !ignore.contains(id)){
//            System.out.println("id = " + id);
            StringBuilder sb = new StringBuilder();
            sb.append("\n").append("id = ").append(id).append("\n");
            sb.append("\033[34m");
            sb.append(sql);
            sb.append("\033[0;39m");
            String str = sb.toString();
            log.info(str);
        }
    }

    @Override
    public Object plugin(Object target) {
        if (target instanceof StatementHandler) {
            return Plugin.wrap(target, this);
        }
        return target;
    }

    @Override
    public void setProperties(Properties properties) {

    }

    public String readHikariCPSql(Object pstmt) {
        try {
            Field delegate = pstmt.getClass().getSuperclass().getSuperclass().getDeclaredField("delegate");
            delegate.setAccessible(true);

            Object jdbcStat = delegate.get(pstmt);
            return asSql(jdbcStat, jdbcStat.getClass());
        } catch (Exception e) {
            log.error("readOriginalSql error: ", e);
        }
        return "";
    }

    public String readDruidPrepareSql(Object pstmt) {
        try {
            Field field = pstmt.getClass().getDeclaredField("stmt");
            field.setAccessible(true);
            Object jdbcStat = field.get(pstmt);
            return asSql(jdbcStat, jdbcStat.getClass());
        } catch (Exception e) {
            log.error("readOriginalSql error: ", e);
        }
        return "";
    }

    public String readDruidCallSql(Object pstmt) {
        try {
            Field field = pstmt.getClass().getDeclaredField("stmt");
            field.setAccessible(true);
            Object jdbcStat = field.get(pstmt);
            return asSql(jdbcStat, jdbcStat.getClass().getSuperclass());
        } catch (Exception e) {
            log.error("readOriginalSql error: ", e);
        }
        return "";
    }


    /**
     * 返回完整sql对象
     * @param jdbcStat ClientPreparedStatement 对象实例
     * @return
     * @throws NoSuchMethodException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    public String asSql(Object jdbcStat, Class<?> clazz) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        Method getQuery = clazz.getSuperclass().getDeclaredMethod("getQuery");
        Object query = getQuery.invoke(jdbcStat);

        Method method = query.getClass().getDeclaredMethod("asSql");
        method.setAccessible(true);
        String sql = (String) method.invoke(query);
        String[] lines = sql.split("\\r\\n|\\r|\\n");
        return Arrays.stream(lines).filter(StringUtils::hasText).collect(Collectors.joining("\r\n"));
    }


    private static final String SQL_IGNORE_LOG_NAME = "sql-ignore-log.txt";

    @Override
    public void afterPropertiesSet() throws Exception {
        ClassPathResource classPathResource = new ClassPathResource(SQL_IGNORE_LOG_NAME);
        if (!classPathResource.exists()) {
            return;
        }
        InputStream is = classPathResource.getInputStream();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(is))){
            String line = null;
            while ((line = reader.readLine()) != null){
                ignore.add(line);
            }
        }
    }
}
