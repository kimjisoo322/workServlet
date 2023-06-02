
        *{
            box-sizing: border-box;
            margin: 0px auto;
            list-style: none;
            text-decoration: none;
            color: black;
        }
        .wrap{
            width: 1000px;
            height: 700px;
        }

        /* 헤더영역 */
        .wrap header{
            width: 100%;
            height: 120px;
        }
        .wrap #logo {
            width: 100%;
            height: 90px;
            margin-top: 10px;
        }
        .wrap #logo #icon{
            float: left;
            width: 200px;
            height: 100%;
            text-align: center;
        }
        .wrap #logo #title{
            float: left;
            width: 800px;
            height: 100%;
            text-align: center;
        }
        
        .wrap nav ul{
            padding-left: 0px;
        }
        .wrap nav ul li{
            width: 25%;
            height: 30px;
            background-color: green;
            float: left;
        }
        .wrap nav ul a{
            display: inline-block;
            width: 100%;
            height: 100%;
            background-color: green;
            text-align: center;
            line-height: 30px;
            color: aliceblue;
        }
        .wrap nav ul a:hover{
            background-color: darkgreen;
        }

        main{
            width: 100%;
            height: 500px;
            margin-top: 40px;
        }
        

        #leftside{
            width: 200px;
            height: 100%;
            float: left;
            background: url(../images/left_img.jpg) no-repeat center center;
            background-size: cover;

        }
        #maincontent{
            width: 550px;
            height: 100%;
            float: left;
        }
        #rightside{
            width: 250px;
            height: 100%;
            float: left;
        }
        /* 오른쪽 로그인 */
        #rightside .side1{
            width: 250px;
            height: 100px;
        }
        #rightside .loginbox{
            width: 250px;
            height: 80px;
            background-color: aqua;
        }
        #rightside .loginbox #login{
            width: 150px;
            height: 80px;
            background-color: red;
            float: left;
        }
        #rightside .loginbox #login input{
            width: 150px;
            height: 40px;
        }

        #rightside .loginbox #button input{
            width: 100px;
            height: 80px;
        }
        #rightside #info{
            text-align: center;
        }
        #rightside #info a:hover{
            color: aliceblue;
        }

        #rightside .side2{
            width: 100%;
            height: 300px;
            /* background: url(images/right_img.jpg) no-repeat center;
            background-size: cover; */
            margin-top: 5px;
        }
        #rightside .side2 img{
            width: 100%;
            height: 100%;
        }
        #rightside .side3{
            width: 100%;
            height: 100px;
        }
        #rightside .side3 img{
            width: 100%;
            height: 100%;
        }


        /* -----------------------------main---------------------------------- */
        main #maincontent ul{
            padding: 0px;
            width: 550px;
            height: 500px;
        }
        main #maincontent ul li{
            width: 50%;
            height: 50%;
            float: left;
            padding: 10px;
            text-align: center;
        }
        main #maincontent ul li img{
            width: 100%;
        }
