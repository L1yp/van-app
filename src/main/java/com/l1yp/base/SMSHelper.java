package com.l1yp.base;

import com.l1yp.model.common.ErrorInfo;
import com.l1yp.util.JsonTool;
import com.tencentcloudapi.common.Credential;
import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.tencentcloudapi.common.profile.ClientProfile;
import com.tencentcloudapi.common.profile.HttpProfile;
import com.tencentcloudapi.sms.v20210111.SmsClient;
import com.tencentcloudapi.sms.v20210111.models.SendSmsRequest;
import com.tencentcloudapi.sms.v20210111.models.SendSmsResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * 2021/11/2 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
@Component
public class SMSHelper {

    @Value("${qcloud.sms.sdkAppId}")
    private String smsSdkId;
    @Value("${qcloud.sms.templateId}")
    private String templateId;

    @Value("${qcloud.cos.secretId}")
    private String secretId;
    @Value("${qcloud.cos.secretKey}")
    private String secretKey;

    public ErrorInfo sendSMS(String phone, String code) {
        try{
            // 实例化一个认证对象，入参需要传入腾讯云账户secretId，secretKey,此处还需注意密钥对的保密
            // 密钥可前往https://console.cloud.tencent.com/cam/capi网站进行获取
            Credential cred = new Credential(secretId, secretKey);
            // 实例化一个http选项，可选的，没有特殊需求可以跳过
            HttpProfile httpProfile = new HttpProfile();
            httpProfile.setEndpoint("sms.tencentcloudapi.com");
            // 实例化一个client选项，可选的，没有特殊需求可以跳过
            ClientProfile clientProfile = new ClientProfile();
            clientProfile.setHttpProfile(httpProfile);
            // 实例化要请求产品的client对象,clientProfile是可选的
            SmsClient client = new SmsClient(cred, "ap-guangzhou", clientProfile);
            // 实例化一个请求对象,每个接口都会对应一个request对象
            SendSmsRequest req = new SendSmsRequest();
            String[] phoneNumberSet1 = {phone};
            req.setPhoneNumberSet(phoneNumberSet1);

            req.setSmsSdkAppId(smsSdkId);
            req.setTemplateId(templateId);

            String[] templateParamSet1 = {code};
            req.setTemplateParamSet(templateParamSet1);

            // 返回的resp是一个SendSmsResponse的实例，与请求对象对应
            SendSmsResponse resp = client.SendSms(req);
            // 输出json格式的字符串回包
            String respBody = SendSmsResponse.toJsonString(resp);
            System.out.println(respBody);

            Map<String, Object> map = JsonTool.toMap(respBody);
            Map<String, Object> sendStatusSet = (Map<String, Object>) map.get("SendStatusSet");
            return sendStatusSet.get("Code").equals("OK") ? null : new ErrorInfo(500, (String) sendStatusSet.get("Message"));
        } catch (TencentCloudSDKException e) {
            e.printStackTrace();
            return new ErrorInfo(500, e.getMessage());
        }
    }

}
