package com.lhd.security;

import com.lhd.utils.EncryptUtils;
import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;

/**
 * Created by lhd on 2017/5/21.
 * 自定义加密
 */
public class MyPasswordEncode extends MessageDigestPasswordEncoder {

    private String algorithm;

    public MyPasswordEncode(String algorithm) {
        super(algorithm);
        this.algorithm = algorithm;
    }

    @Override
    // 如果返回true，则验证通过。
    public boolean isPasswordValid(String savePass, String submitPass,
                                   Object salt) {
        if ("md5".equals(algorithm)) {
            return savePass.equalsIgnoreCase(EncryptUtils.md5(submitPass,
                    salt.toString()));
        } else {
            return savePass.equalsIgnoreCase(EncryptUtils.sha(submitPass,
                    salt.toString()));
        }
    }
}
