![dadao](https://github.com/yes1am/dadao/workflows/dadao/badge.svg?branch=master)

## 前言

本人是《与电风扇一起摇头》读者，出于兴趣收集豆瓣 [大岛](https://www.douban.com/people/auxt/) 段子动态，尚未获得授权，尝试与大岛沟通中。  

如大岛本人不同意该形式，将删除该仓库。

### 开发
由于获取动态需要豆瓣的登录态，因此需要设置 cookie，登录态为名为 `dbcl2` 的 cookie:  

```js
Cookie: 'dbcl2={cookie 的值}',
```
将 `dbcl2={cookie 的值}` 设置到 Github Action 的 Secrets 中, 如 `dbcl2="xxx"`