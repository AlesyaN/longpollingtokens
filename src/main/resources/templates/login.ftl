<html>
<head>
    <title>Long polling</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <#--<script src="login.js"></script>-->
</head>
<body>
    <input type="text" name="login" id="login"><br>
    <input type="password" name="password" id="password"><br>
    <input onclick="login()" type="submit" value="Sign Up"><br>
    <a href="/register">Don't have an account? Register!</a>

<script>
    window.onload = function() {
        if (window.localStorage.getItem("AUTH") !== null) {
            var headers = {
                "AUTH": window.localStorage.getItem("AUTH")
            };

            $.ajax({
                url: "/api/login-token",
                method: "post",
                contentType: "application/json",
                headers: JSON.stringify(headers),
                success: function() {
                    alert("heeey");
                }
            })
        }
    };

    function login() {
        var login = document.getElementById("login").value;
        var password = document.getElementById("password").value;
        // var body = {
        //     login: login,
        //     password: password
        // };
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
                alert(token.value);
                window.location.href = '/chat'
            }
            // error: function (msg) {
            //     console.log("error " + msg);
            // }
        });
    }
</script>
</body>
</html>