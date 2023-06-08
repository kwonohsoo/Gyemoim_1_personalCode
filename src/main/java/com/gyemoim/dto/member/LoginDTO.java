package com.gyemoim.dto.member;

public class LoginDTO {

    private String email;
    private String password;
    private String ssn;
    private String name;
    private String phone;
    private boolean useCookie;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSsn() {
        return ssn;
    }

    public void setSsn(String ssn) {
        this.ssn = ssn;
    }

    public boolean isUseCookie() {return useCookie;}

    public void setUseCookie(boolean useCookie) {
        this.useCookie = useCookie;
    }

    @Override
    public String toString() {
        return "LoginDTO [email=" + email + ", password=" + password + ", useCookie="
                + useCookie + "]";
    }

}
