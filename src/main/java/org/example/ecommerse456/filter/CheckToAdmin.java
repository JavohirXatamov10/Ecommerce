package org.example.ecommerse456.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.ecommerse456.entity.User;
import org.example.ecommerse456.entity.UserRole;

import java.io.IOException;
@WebFilter(filterName = "CheckToAdmin", urlPatterns = "/admin/*")
public class CheckToAdmin  implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpServletRequest request = (HttpServletRequest) servletRequest;

        HttpSession session = request.getSession();


        Object currentUserObj = session.getAttribute("currentUser");
        if (currentUserObj!=null){
            User currentUser = (User) currentUserObj;
            if (currentUser.getRole().equals(UserRole.ADMIN)){
                filterChain.doFilter(servletRequest,servletResponse);
                return;
            }
        }



        response.sendRedirect("/404");

    }
}
