package com.vole.realm;

import com.vole.entity.Manager;
import com.vole.service.ManagerService;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;

/**
 * 编写者： vole
 * Time： 2018/4/12.16:27
 * 内容：自定义 realm
 */
public class MyRealm extends AuthorizingRealm{

    @Resource
    private ManagerService managerService;

    /**
     * 为当前登录用户授予角色和权限
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * 验证当前登录的用户
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String userName=(String) token.getPrincipal();
        Manager manager=managerService.getByUserName(userName);
        if(manager!=null){
            SecurityUtils.getSubject().getSession().setAttribute("currentUser", manager);
            AuthenticationInfo authcInfo=new SimpleAuthenticationInfo(manager.getUserName(), manager.getPassword(), "xxx");
            return authcInfo;
        }else{
            return null;
        }
    }

}
