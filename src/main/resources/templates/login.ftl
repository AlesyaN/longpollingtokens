<html>
<head>
    <title>Long polling</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
</head>
<body>
<input type="text" name="login" id="login"><br>
<input type="password" name="password" id="password"><br>
<input onclick="login()" type="submit" value="Sign in"><br>
<a href="/register">Don't have an account? Register!</a>

<script>
    window.onload = function () {
        console.log("Dorou");
        console.log(window.localStorage.getItem("AUTH"));
        if (window.localStorage.getItem("AUTH") !== null) {
            var headers = {
                "AUTH": window.localStorage.getItem("AUTH")
            };

            $.ajax({
                url: "/api/login-token",
                method: "get",
                contentType: "application/json",
                headers: headers,
                success: function () {
                    window.location.href = '/chat'
                }
            })
        }
    };

    function login() {
        var login = document.getElementById("login").value;
        var password = document.getElementById("password").value;
        $.ajax({
            url: "/api/login-cred",
            method: "get",
            contentType: "application/json",
            data: {
                login: login,
                password: password
            },
            dataType: "json",
            success: function (token) {
                window.localStorage.setItem("AUTH", token.value);
                window.location.href = '/chat'
            }
        });
    }
</script>
</body>
</html>