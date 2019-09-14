<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="pageTitle" required="true" %>

<html>
<head>
    <title>${pageTitle}</title>
    <link href='http://fonts.googleapis.com/css?family=Lobster+Two' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/styles/main.css">
    <meta charset="UTF-8"/>
</head>
<body>
<header>
    <a href="${pageContext.servletContext.contextPath}/homePage">
        Biki i korovi
        ${user}
    </a>
    <c:if test="${user.authorized}">
        <div style="float: right; font-size: 30px; color: #d44179 ; background: aqua">
            <a href="${pageContext.servletContext.contextPath}/createRoom">
                Create Room
            </a>
        </div>
        <div style="float: right; font-size: 30px; color: #d44179 ; background: aqua">
            <a href="${pageContext.servletContext.contextPath}/rooms">
                Rooms
            </a>
        </div>
    </c:if>
    <div style="float: right">
        <button>
            <c:if test="${!user.authorized}">
                <a href="${pageContext.servletContext.contextPath}/signIn">
                    <p>Sign in</p>
                </a>
            </c:if>
            <c:if test="${user.authorized}">
                <form method="post">
                    <button formaction="${pageContext.servletContext.contextPath}/homePage">

                        <p>Log Off</p>
                    </button>
                </form>
            </c:if>
        </button>
    </div>
</header>
<main>
    <jsp:doBody/>
</main>
<footer>
    <p>(c) Create Game 2019</p>
</footer>
</body>
</html>