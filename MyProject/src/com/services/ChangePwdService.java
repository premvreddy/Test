package com.services;

public interface ChangePwdService
{
    void addUser(String oldpassword, String newpassword , String confirmpassword);
}
