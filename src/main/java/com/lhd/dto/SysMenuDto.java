package com.lhd.dto;

/**
 * Created by lhd on 2017/5/16.
 * 提供ztree使用
 */
public class SysMenuDto {


    /**
     * 菜单唯一标识
     */
    private String id;

    /**
     * 父菜单id
     */
    private String pId;

    /**
     * 菜单名字
     */
    private String name;

    /**
     * 是否选中
     */
    private boolean checked;

    /**
     * 是否展开
     */
    private boolean open;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    @Override
    public String toString() {
        return "SysMenuDto{" +
                "id='" + id + '\'' +
                ", pId='" + pId + '\'' +
                ", name='" + name + '\'' +
                ", checked=" + checked +
                ", open=" + open +
                '}';
    }
}
