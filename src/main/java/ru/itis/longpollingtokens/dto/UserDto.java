package ru.itis.longpollingtokens.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.itis.longpollingtokens.models.Token;
import ru.itis.longpollingtokens.models.User;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserDto {
    private User user;
    private Token currentToken;
}
