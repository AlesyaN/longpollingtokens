package ru.itis.longpollingtokens.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.longpollingtokens.models.User;
import ru.itis.longpollingtokens.security.details.UserDetailsImpl;
import ru.itis.longpollingtokens.services.UserService;

@Controller
public class ChatController {

    @Autowired
    UserService userService;

//    @PreAuthorize("isAuthenticated()")
    @GetMapping("/chat")
    public String getChatPage(Model model, Authentication authentication) {
        model.addAttribute("token", ((UserDetailsImpl) authentication.getDetails()).getCurrentToken());
        return "chat";
    }
}
