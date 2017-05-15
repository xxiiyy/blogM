package com.lhd.dto;

/**
 * Created by lhd on 2017/5/14.
 */
public class Message {

    /**
     * 状态信息
     */
    private String message;

    /**
     * 是否成功
     */
    private boolean status;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Message{" +
                "message='" + message + '\'' +
                ", status=" + status +
                '}';
    }
}
