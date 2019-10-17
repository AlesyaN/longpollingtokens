package ru.itis.longpollingtokens.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.itis.longpollingtokens.models.Token;
import ru.itis.longpollingtokens.models.User;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findFirstByLoginIgnoreCase(String login);

    Optional<User> findUserByLogin(String login);

    Optional<User> findFirstByToken_Value(String value);

    Optional<User> findFirstByToken(Token token);
}
