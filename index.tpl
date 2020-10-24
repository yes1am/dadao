<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="icon" type="image/x-icon" href="https://img3.doubanio.com/favicon.ico">
  <title> <%= title %> </title>
  <meta name="description" content="<%= title %>">
  <style>
    * { box-sizing: border-box; }
    html, body, ul, li, h1 { margin: 0; padding: 0 }
    html, body { font-size: 16px; font-family: -apple-system,"Helvetica Neue",Helvetica,Arial,"PingFang SC","Hiragino Sans GB","WenQuanYi Micro Hei","Microsoft Yahei",sans-serif; }
    body { text-align: center; }
    ul { list-style: none; }
    .list { text-align: left; max-width: 470px; margin: 0 auto; padding-bottom: 10px; background-color: #efefef; border-radius: 5px; overflow: hidden; }
    .list li { padding: 20px 0; margin: 0 8px; transition: all .3s; border-bottom: 1px solid #e5e5e5; display: flex; flex-direction: column; }
    .list li span { color: #b9b9b9; font-size: 12px; margin-top: 20px; align-self: flex-end; }
    .list li a { line-height: 1.62; white-space: pre-wrap; }
    
    a { color: #555; text-decoration: none; transition: all .2s ease-in; }
    a:hover { color: #37a; }

    a.github-corner:hover .octo-arm { animation: octocat-wave 560ms infinite linear; }
    a.github-corner svg { fill: #f1f1f1; color: #000; position: absolute; top: 0; border: 0; right: 0; z-index: 99; width: 70px; height: 70px; }
    a.github-corner { position: fixed; z-index: 9999; top: 0; right: 0; }
    @keyframes octocat-wave {
      0%,100%{-webkit-transform:rotate(0); transform:rotate(0);}
      20%,60%{-webkit-transform:rotate(-25deg); transform:rotate(-25deg);}
      40%,80%{-webkit-transform:rotate(10deg); transform:rotate(10deg);}
    }

    .time, .footer { padding: 5px 0 2px 0; font-size: 12px; color: #adadad; }
    .footer { padding: 10px 0 30px 0; }

    .usercard {
      max-width: 470px;
      background: #fff6ed;
      padding: 18px 20px;
      margin: 0 auto;
      display: flex;
    }
    .usercard .content {
      flex: 1;
      text-align: left;
      font-size: 13px;
      color: #aaa;
    }
    .usercard .content a, .usercard .content a:visited, .usercard .content a:link {
      color: #669;
      font-size: 13px;
    }
    .usercard .content a:hover {
      color: #37a;
    }
    .usercard .content span {
      color: #444;
    }
    .usercard .img-wrapper {
      flex: 0 0 auto;
      margin-left: 20px;
    }
    .usercard .img-wrapper img {
      width: 48px;
      height: 48px;
    }
  </style>
  <style>
  </style>
</head>
<body>
  <a href="https://github.com/yes1am/dadao" target="_blank" class="github-corner">
    <svg viewBox="0 0 250 250">
      <path d="M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z"></path>
      <path class="octo-arm" fill="currentColor" style="transform-origin: 130px 106px;" d="M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2"></path>
      <path fill="currentColor" class="octo-body" d="M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z"></path>
    </svg>
  </a>
  <div class="usercard">
    <div class="content">
      <div>
        <a class="name" href="https://www.douban.com/people/auxt/" target="_blank"><%= title %></a>
        <span>(Nara, Japan)</span>
      </div>
      <p>走到高山顶上 无缘无故地挥挥帽子</p>
    </div>
    <a class='img-wrapper' href="https://www.douban.com/people/auxt/" target="_blank" title="大島">
      <img src="https://img3.doubanio.com/icon/u2608560-91.jpg" alt="">
    </a>
  </div>
  <ul class="list">
    <% sayings.forEach(function(saying, idx){ %>
    <li>
      <a href="<%=saying.url%>"><%=saying.saying%></a>
      <span><%=saying.time%></span>
    </li>
    <% }); %>
</ul>
<div class="footer">
  <div class="time"> - end - </div>
</div>
</body>
</html>