<%@ page contentType="text/html;charset=utf-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>

        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>BHS.COM</title>
            <link rel="stylesheet" type="text/css" href="/css/list.css">
            <link rel="stylesheet" href="/css/style.css" />
            <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
            <script src="/js/bootstrap.js"></script>
            <script src="/js/trim.js"></script>
            <script src="/js/star.js"></script>
            <script language="javascript">
                function check_apply(co, co_no, re_no) {
                    var is_apply = confirm('[ ' + co + ' ] 사로 지원하시겠습니까?');
                    if (is_apply) {
                        location.href = "../apply/" + co_no + "/" + re_no;
                        return true;
                    }
                    return false;
                }
                function check() {
                    if (c.content.value.trim() === "") {
                        alert("댓글을 입력하세요");
                        return;
                    } else {
                        f.submit();
                    }
                }
            </script>
        </head>


        <link rel="stylesheet" type="text/css" href="/css/nav.css" />

        <nav class="nav-main">
            <header class="nav-header" id="header">
                <h1 class="nav-header-heading">
                    <a href="/" title="메인 화면"><img src="/css/imgs/main_logo.png" class="nav-image"></a>
                </h1>
                <div class="nav-sign">
                    <ul class="nav-sign nav-sign-list">
                        <c:choose>
                            <c:when test="${empty nickname}">
                                <button id="login_button">LOGIN</button>
                            </c:when>
                            <c:otherwise>
                                <button id="logout_button" onclick="location.href='/logout.do'">LOGOUT</button>
                            </c:otherwise>
                        </c:choose>

                        <html lang="ko">

                        <head>
                            <meta charset="UTF-8">
                            <title>Tropical Night Litchi-Root : login</title>
                            <link rel="stylesheet" type="text/css" href="/css/login_join.css">
                            <link rel="stylesheet" th:href="@{/css/style.css}" />
                            <script src="/js/trim.js"></script>
                            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                            <script>
                                function check_login() {
                                    var loginEmailFoc = document.getElementById('login-email');
                                    var loginEmailVal = loginEmailFoc.value;

                                    if (loginEmailVal.length == 0) {
                                        alert("Email을 입력해 주세요");
                                        loginEmailFoc.focus();
                                        return false;
                                    } else if (!CheckEmail(loginEmailVal)) {
                                        alert('Email 형식을 맞춰주세요 ex)"--@--.--"');
                                        loginEmailFoc.focus();
                                        return false;
                                    } else if (check_login_pwd()) {
                                        lf.submit();
                                    }
                                }

                                // 비밀번호 체크(retrurn boolean)
                                function check_login_pwd() {
                                    var loginPwdFoc = document.getElementById('login-pwd');
                                    var loginPwdVal = loginPwdFoc.value;

                                    if (loginPwdVal.length == 0) {
                                        alert("Password를 입력해 주세요");
                                        loginPwdFoc.focus();
                                        return false;
                                    } else {
                                        return true;
                                    }
                                }

                                // 이메일 형식 체크 기능
                                function CheckEmail(str) {
                                    var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
                                    if (!reg_email.test(str)) {
                                        return false;
                                    } else {
                                        return true;
                                    }
                                }
                            </script>
                        </head>

                        <!--로그인 팝업창 레이어-->

                        <body>
                            <div class="login-body">
                                <div class="login-content">
                                    <span class="login-close-button">&times;</span>
                                    <div class="login-header">
                                        <img src="/css/imgs/main_logo.png" class="image-login">
                                    </div>
                                    <p></p>
                                    <form name="lf" action="/login.do" method="post">
                                        <input type="hidden" name="csrfmiddlewaretoken"
                                            value="hYuKP8jAUKrwgQYkC41ayCRLbPEGcnfbZPSBEXLJxqIAwviUQEnBFI2GQJ22BmKF">
                                        <label class="login-label" for="email">EMAIL</label>
                                        <input class="login-input" type="email" id="login-email" name="login-email"
                                            title="이메일" placeholder="이메일을 입력하세요" required="required">
                                        <label class="login-label"></label>
                                        <label class="login-label" for="password">PASSWORD</label>
                                        <input class="login-input" type="password" id="login-pwd" name="login-pwd"
                                            title="비밀번호" placeholder="비밀번호를 입력하세요" required="required" maxlength='12'>
                                        <div class="login-btn-group">
                                            <input class="login_submit" type="button" id="login-submit" value="로그인"
                                                onclick="check_login()">
                                            <input class="login_cancel" type="button" id="login-cancel" value="취소"
                                                onclick="javascript:history.go(0)" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </body>

                        <script type="text/javascript">
                            let loginButton = document.querySelector("#login_button");
                            var godal = document.querySelector(".login-body");
                            var closeButton = document.querySelector(".login-close-button");
                            var cancelButton = document.querySelector("#login-cancel");

                            function togglegodal() {
                                godal.classList.toggle("show-login");
                                console.log(1);
                            }

                            function windowOnClick(event) {
                                if (event.target === godal) {
                                    togglegodal();
                                }
                            }
                            $(document).keyup(function (event) {
                                var loginEmailFoc = document.getElementById('login-email');
                                var loginEmailVal = loginEmailFoc.value;
                                if (event.which === 13) {
                                    if (loginEmailVal.length != 0) {
                                        check_login();
                                    }
                                }
                            });
                            loginButton.addEventListener("click", togglegodal);
                            closeButton.addEventListener("click", togglegodal);
                            cancelButton.addEventListener("click", togglegodal);
                            window.addEventListener("click", windowOnClick); 
                        </script>
                    </ul>
                </div>
            </header>
            <ul class="nav-menu">
                <li class="nav-menu-item">
                    <a href="/introduce.do" class="menu-heading">ABOUT BHS</a>
                </li>
                <li class="nav-menu-item">
                    <a href="/board/list.do" class="menu-heading">게시판</a>
                </li>
                <li class="nav-menu-item">
                    <a href="/map.do" class="menu-heading">지도</a>
                </li>
            </ul>
        </nav>


        <body style="margin:0">
            <div class="list-main">
                <div class="list-title">
                    <p>${board.writer.nickname}님 글이에요</p>
                    <span></span>
                </div>
                <div class="col-lt">
                    <!DOCTYPE html>
                    <html lang="ko">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Tropical Night Litchi-Root</title>
                        <link rel="stylesheet" href="/css/bootstrap.css">
                        <link rel="stylesheet" type="text/css" href="/css/search.css">
                        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
                        <script src="/js/bootstrap.js"></script>
                        <script>
                            function onchange_fun(no) {
                                var companyId = document.getElementById("company");
                                var sectorId = document.getElementById("sector");
                                var item_company = companyId.options[companyId.selectedIndex].value;
                                var item_sector = sectorId.options[sectorId.selectedIndex].value;

                                if (no == 1) {
                                    if (item_company == "primary") {
                                        onreset_fun()
                                    } else {
                                        check_ajax(".field1-sel", "#company", ".field2-sel", ".field2-s", "직무")
                                    }
                                } else if (no == 2) {
                                    if (item_sector == "primary") {
                                        onreset_fun()
                                    } else {
                                        check_ajax(".field2-sel", "#sector", ".field1-sel", ".field1-s", "회사")
                                    }
                                }
                            }

                            function check_ajax(basic, basic_sharp, change, selec, val) {
                                get_data = $(basic_sharp).val();
                                $.ajax({
                                    type: 'post',
                                    url: '../search/',
                                    headers: {
                                        'X-CSRFTOKEN': 'hYuKP8jAUKrwgQYkC41ayCRLbPEGcnfbZPSBEXLJxqIAwviUQEnBFI2GQJ22BmKF'
                                    },
                                    data: {
                                        'get_data': get_data,
                                    },
                                    success: function (json) {
                                        const boxes = document.querySelectorAll(change);
                                        boxes.forEach(box => {
                                            box.style.display = "none";
                                        });
                                        json_data = JSON.parse(json)
                                        if (basic == ".field1-sel") {
                                            for (var i = 0; i < json_data.length; i++) {

                                                let changeStyle = document.querySelectorAll(change);
                                                changeStyle.forEach((userItem) => {
                                                    value = userItem.getAttribute("value")
                                                    if (value == json_data[i].fields.re_sector || value == "primary") {
                                                        userItem.style.display = "block";
                                                    }
                                                });
                                            }
                                        } else if (basic == ".field2-sel") {
                                            for (var i = 0; i < json_data.length; i++) {

                                                let changeStyle = document.querySelectorAll(change);
                                                changeStyle.forEach((userItem) => {
                                                    value = userItem.getAttribute("value")
                                                    if (value == json_data[i].fields.re_affiliate || value == "primary") {
                                                        userItem.style.display = "block";
                                                    }
                                                });
                                            }
                                        }
                                    },
                                    error: function (xhr, errmsg, err) {
                                        alert("실패");
                                        console.log(xhr.status + ": " + xhr.responseText);
                                    }
                                });
                            }

                            function onreset_fun() {
                                let changeStyle1 = document.querySelectorAll(".field1-sel");
                                changeStyle1.forEach((userItem) => {
                                    if (userItem.style.display == "none") {
                                        userItem.style.display = "block";
                                    }
                                });
                                let changeStyle2 = document.querySelectorAll(".field2-sel");
                                changeStyle2.forEach((userItem) => {
                                    if (userItem.style.display == "none") {
                                        userItem.style.display = "block";
                                    }
                                });
                                $('#company').val("primary");
                                $('#sector').val("primary");
                                $('#career').val("primary");
                            }
                        </script>
                    </head>

                    <script>
                        $(document).ready(function () {
                            stickyjobsSearch(); //sticky job search box
                        });

                        $(window).resize(function () {
                            if (this.resizeTO) {
                                clearTimeout(this.resizeTO);
                            }
                            this.resizeTO = setTimeout(function () {
                                $(this).trigger('resizeEnd');
                            }, 0);
                        });

                        $(window).on('resizeEnd', function () {
                            stickyjobsSearch();
                        });

                        function stickyjobsSearch() {
                            var windowW = $(window).width();
                            if ($('.jobs_search_box').length > 0) {
                                if (windowW > 900) {
                                    $(window).scroll(function () {
                                        var windowST = $(window).scrollTop();
                                        var windowSclHt = windowST + $(window).height();
                                        var ftTop = $('.footer-main').offset().top + 125;
                                        var jobslistTop = $('.accordion').offset().top - 300;

                                        if (windowSclHt > jobslistTop) {
                                            $('.jobs_search_box').addClass('sticky');
                                        }
                                        if (windowST < jobslistTop || windowSclHt > ftTop) {
                                            $('.jobs_search_box').removeClass('sticky');
                                        }
                                    });
                                } else {
                                    $(window).scroll(function () {
                                        $('.jobs_search_box').removeClass('sticky');
                                    });
                                }
                            }
                        }
                    </script>
                </div>
                <!-- 작성해야 하는곳 -->
                <style>
                    .writebutton {
                        margin: 0;
                        font-family: inherit;
                        font-size: inherit;
                        margin-left: 1233px;
                        margin-top: 14px;
                        line-height: inherit;
                    }

                    h4,
                    .h4,
                    h2,
                    .h2 {
                        margin-top: 9px;
                        margin-bottom: 0.5rem;
                        font-weight: 500;
                        line-height: 1.2;
                        color: var(--bs-heading-color);
                    }

                    .board_detail tbody th {
                        text-align: left;
                        background-color: #f9e5e1;
                        color: #3b3a3a;
                        vertical-align: middle;
                        text-align: center;
                    }
                </style>

                <body>
                    <div class="container">
                        <h2>${board.writer.nickname}님의 맛집 리뷰!</h2>
                        <table class="board_detail" style="">
                            <colgroup>
                                <col width="15%" />
                                <col width="35%" />
                                <col width="15%" />
                                <col width="35%" />
                            </colgroup>
                            <caption>게시글 상세내용</caption>
                            <tbody>
                                <tr>
                                    <th scope="row">글 번호</th>
                                    <td>${board.seq}</td>
                                    <th scope="row">맛집 이름</th>
                                    <td><a target="_blank"
                                            onClick="window.open(this.href, '', 'width=700, height=200, left=610, top=300'); return false;"
                                            href="/diner/detail.do?seq=${board.diner.seq}">${board.diner.name}</a></td>
                                </tr>
                                <tr>
                                    <th scope="row">작성자</th>
                                    <td>${board.writer.nickname}</td>
                                    <th scope="row">작성일</th>
                                    <td>${board.rdate}</td>
                                </tr>
                                <tr>
                                    <th scope="row">제목</th>
                                    <td colspan="3">
                                        <input type="text" id="title" name="title" value="${board.title}" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="view_text">
                                        <textarea title="내용" id="content" name="content"
                                            readonly>${board.content}</textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <h4>댓글</h4>
                        <c:forEach items="${board.children}" var="child">
                            <table class="board_detail">

                                <tr>
                                    <th scope="row">작성자</th>
                                    <td>${child.writer.nickname}</td>
                                    <th>작성일</th>
                                    <td>${child.rdate}</td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="view_text">
                                        ${child.content}
                                    </td>
                                </tr>
                            </table>
                        </c:forEach>
                        <h4>댓글 작성</h4>
                        <table class="board_detail">
                            <div>
                                <form name="c" action="contentwrite.do" method="post">
                                    <input type="hidden" name="email" value="${email}">
                                    <input type="hidden" name="seq" value="${board.seq}">
                                    <input type="hidden" name="diner" value="${board.diner.seq}">
                                    <input type="hidden" name="parent" value="${board.parent}">
                                    <input type="hidden" name="csrfmiddlewaretoken"
                                        value="PGcbvGv2t07gw7xUD9y0LGm3cHrMXQRQxxA2kvXb6GokMMRuRJUrSMxYRBP8mPmk">
                                    <td>
                                        <textarea colspan="4" class="view_text" title="내용" name="content" id="content"
                                            placeholder="댓글을 입력하세요" required></textarea>
                                    </td>
                                    <table>
                                        <input type="submit" class="writebutton" value="작성" />
                                    </table>
                                </form>
                            </div>
                        </table>
                        <!-- </table>
                            <table>
                                <input type="button" class="writebutton" value="작성" onclick="check()" />
                            </table> -->
                        <!-- <form>
                            <table class="board_detail">
                                <div>
                                    <td colspan="4" class="view_text">
                                        <textarea title="내용" id="content" name="content"
                                            placeholder="댓글을 입력하세요"></textarea>
                                    </td>
                                </div>
                            </table>
                            <table class="writebutton">
                                <input type="hidden" name="seq">
                                <button class="writebutton" onclick="location.href='contentwrite.do'">작성</button>
                            </table>
                        </form> -->

                        <!-- <div class="select-wrapper-content">
                            <form name="f" action="write.do" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="nickname" value="${nickname}">
                                <input type="hidden" name="email" value="${email}">
                                <input type="hidden" name="csrfmiddlewaretoken"
                                    value="PGcbvGv2t07gw7xUD9y0LGm3cHrMXQRQxxA2kvXb6GokMMRuRJUrSMxYRBP8mPmk">
                                <input type="text" name="title" class="input-title" placeholder="제목입력" required></br></br>
                                <input type="hidden" name="diner_seq">
                                <input type="text" name="diner_name" class="input-title" placeholder="맛집입력"
                                    data-bs-toggle="modal" data-bs-target="#exampleModal" readonly required></br></br>
                                <textarea name="content" class="input-content"
                                    placeholder="내용입력&#13;&#10;답변 및 처리 과정은 이메일로 확인 할 수 있습니다."></textarea></br></br>
                                <input type="button" class="select-wrapper-button" value="작성하기" onclick="check()" />
                                </from>
                        </div> -->
                    </div>
                </body>
                <link rel="stylesheet" type="text/css" href="/css/footer.css" />

                <footer class="footer-main">
                    <ul class="footer-corp">
                        <li><a href="#">홈페이지 이용약관 및 개인정보 처리방침</a></li>
                    </ul>
                    <ul class="footer-info">
                        <li><a href="#">찾아오시는 길</a></li>
                        <li><a href="#">계열사</a></li>
                    </ul>
                    <address class="footer-address">
                        <span>사업자등록번호 : 123-45-67890</span>
                        <span>(주)BHS COMPANY 대표 : 솔서ㄴ수범</span>
                        <span>TEL : 1234-1234</span>
                        <span>개인정보 책임자 : 배솔반</span>
                    </address>
                    <small class="footer-copyringt">&copy; BHS Company. All Rights Reserved.</small>
                </footer>
        </body>

        </html>