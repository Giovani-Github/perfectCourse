/**
 * @Author Giovani
 * @Create: 2018/7/25 11:56
 */




// overhang 插件的使用。未完成
$(document).ready(function () {
    $(".login-perfect").click(function () {
        $(".perfect-container").overhang({
            type: "success",
            message: "登录成功"
        })
    })
})