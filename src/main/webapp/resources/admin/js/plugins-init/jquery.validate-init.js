jQuery(".form-valide").validate({
    rules: {
        "id": {
            required: !0,
            minlength: 4
        },
        "password": {
            required: !0,
            minlength: 6
        },
        "confirmPwd": {
            required: !0,
            equalTo: "#password"
        },
        "nickname": {
            required: !0
        },
        "emailAccount": {
            required: !0,
            // email: !0
        },
        "emailDomain": {
            required: !0
        },
        "gender": {
            required: !0
        },
        "agreeCheck": {
            required: !0
        },
        "val-suggestions": {
            required: !0,
            minlength: 5
        },
        "val-currency": {
            required: !0,
            currency: ["$", !0]
        },
        "val-website": {
            required: !0,
            url: !0
        },
        "val-phoneus": {
            required: !0,
            phoneUS: !0
        },
        "val-digits": {
            required: !0,
            digits: !0
        },
        "val-number": {
            required: !0,
            number: !0
        },
        "val-range": {
            required: !0,
            range: [1, 5]
        }
    },
    messages: {
        "id": {
            required: "아이디를 입력해주세요.",
            minlength: "4자 이상 입력해주세요."
        },
        "password": {
            required: "비밀번호를 입력해주세요.",
            minlength: "비밀번호는 6자 이상 입력해주세요."
        },
        "val-confirm-password": {
            required: "비밀번호를 입력해주세요.",
            minlength: "비밀번호는 6자 이상 입력해주세요.",
            equalTo: "비밀번호가 일치하지 않습니다"
        },
        "nickname": "사용하실 닉네임을 입력해주세요.",
        "emailAccount": "이메일을 입력해주세요.",
        "emailDomain": "이메일 도메인을 선택해주세요.",
        "gender": "성별을 선택해주세요.",
        "agreeCheck": "You must agree to the service terms!",
        "val-suggestions": "What can we do to become better?",
        "val-currency": "Please enter a price!",
        "val-website": "Please enter your website!",
        "val-phoneus": "Please enter a US phone!",
        "val-digits": "Please enter only digits!",
        "val-number": "Please enter a number!",
        "val-range": "Please enter a number between 1 and 5!"
    },

    ignore: [],
    errorClass: "invalid-feedback animated fadeInUp",
    errorElement: "div",
    errorPlacement: function(e, a) {
        jQuery(a).parents(".form-group > div").append(e)
    },
    highlight: function(e) {
        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
    },
    success: function(e) {
        jQuery(e).closest(".form-group").removeClass("is-invalid"), jQuery(e).remove()
    },
});


jQuery(".form-valide-with-icon").validate({
    rules: {
        "id": {
            required: !0,
            minlength: 4
        },
        "password": {
            required: !0,
            minlength: 6
        }
    },
    messages: {
        "id": {
            required: "아이디를 입력해주세요.",
            minlength: "4자 이상 입력해주세요."
        },
        "password": {
            required: "비밀번호를 입력해주세요.",
            minlength: "비밀번호는 6자 이상 입력해주세요."
        }
    },

    ignore: [],
    errorClass: "invalid-feedback animated fadeInUp",
    errorElement: "div",
    errorPlacement: function(e, a) {
        jQuery(a).parents(".form-group > div").append(e)
    },
    highlight: function(e) {
        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
    },
    success: function(e) {
        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-valid")
    }




});