package ru.itis.longpollingtokens.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.longpollingtokens.dto.UserDto;
import ru.itis.longpollingtokens.models.Token;
import ru.itis.longpollingtokens.models.User;
import ru.itis.longpollingtokens.security.details.UserDetailsImpl;
import ru.itis.longpollingtokens.services.UserService;

import java.util.Arrays;

@Controller
public class ChatController {

    @Autowired
    UserService userService;

    @GetMapping("/chat")
    public String getChatPage(Model model, Authentication authentication) {
        User currentUser = userService.getUserByLogin(((UserDetailsImpl) authentication.getPrincipal()).getUsername())
                .orElseThrow(IllegalArgumentException::new);
        Token currentToken = ((UserDetailsImpl) authentication.getPrincipal()).getCurrentToken();
        model.addAttribute("userDto", new UserDto(currentUser, currentToken));
        return "chat";
    }
}
