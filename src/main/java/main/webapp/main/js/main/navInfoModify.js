 // 회원가입
$("#member_info_modify_btn").on("click", function(e){
		var subWindow = $("#member_info_modify.sub-window");
		subWindow.addClass("show");
});

// 사이드 팝업창 close 버튼
$(".closebtn").on("click", function(){
	$(".sub-window").removeClass("show");
	$(".sub-window form input").val('');
	$(".sub-window form select").val(0);
});

$(document).ready(function() {
//	input눌러도 주소 검색창 뜨게 만듬
	$("input[name='uAddr']").on("click", function () {
		$("#addressSearch").trigger("click");
	});
//	비밀번호 유효성검사 함수
	$.validator.addMethod(
		    "checkPassword",
		    function (value, element) {
		    	var pattern = RegExp(/^(?=.*[a-z])(?=.*[^A-Z])(?=.*\d)(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"])[a-z\d\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]{8,25}$/);	
		    	if(pattern.test(value)){
		    		return true;
		    	}else{
		    		return false;
		    	}
		    },
		    "6자리 이상 소문자/숫자/특수기호를 반드시 포함해주세요."
		);
//	회원정보 수정 유효성 검사
	$("#member_info_modify_form").validate({
		rules: {
			change_pw : {required: true, checkPassword: true},
			change_pwchk : {required:true, equalTo: "#change_pw"},
			uHp : {required:true, number: true, minlength: 9, maxlength:11},
			uAddr : {required:true}
				},
	    messages: {
	    	change_pw: {
	            required: "비밀번호를 입력해주세요."
	        },
	        change_pwchk: {
	            required: "입력한 비밀번호와 동일해야 합니다.",
            	equalTo: "입력한 비밀번호와 동일해야 합니다."
	        },
        	uHp : {
        		required:"휴대전화 번호를 입력해주세요.",
        		number: "숫자만 입력해야합니다.",
        		minlength:"적어도 9자리 번호를 입력해야합니다.",
        		maxlength:"휴대전화 번호는 11자리를 넘을 수 없습니다."
    		},
    		uAddr : {
    			required : "주소를 기입해주세요."
    		}
	    },
        onkeyup: function(element, event) {
            this.element(element); // triggers validation
        },
	    submitHandler: function(form) {
	    	var formData = $("#member_info_modify_form").serialize();
	    	console.log(formData);
	    	var uId=$("#pwChange_id").val();
	    	var uPw=$("#change_pw").val();
	    	$.ajax({
				url:'/member/password/history.do',
				type : 'get',		
				dataType : "json",
				async:false,
				data : {uId : CryptoJS.SHA256(uId).toString(), 
						uPw : CryptoJS.SHA256(uPw).toString()},
				contentType: "application/json; charset=UTF-8",
				success:function(data){
					if(data.cnt > 0){
						alert("입력하신 비밀번호는 이전에 사용 하시던 비밀번호와 동일합니다.\n비밀번호를 다시 입력해 주세요.");
					}else if(data.cnt < 1){
						form.submit();
						alert("회원정보가 수정되었습니다.");
					}
				}, error : function() {
				}
			});
	    }
	});	
	$("#submit_info_modify_form").on("click", function(){
		if(confirm("정보를 변경하시겠습니까?")){
			$("#member_info_modify_form").submit();
		}
	});
});




function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("uAddr").value = addr;
            var geocoder = new kakao.maps.services.Geocoder();
    		//주소로 좌표를 검색합니다
    		geocoder.addressSearch(addr, function(result, status) {//제주특별자치도 제주시 첨단로 242

    		    // 정상적으로 검색이 완료됐으면 
    		     if (status === kakao.maps.services.Status.OK) {
    			     var lon_x = result[0].x;
    			     var lat_y = result[0].y;
    			     document.getElementById("uLonX").value = lon_x;
    			     document.getElementById("uLatY").value = lat_y;
    			  /*   $('#uLonX').attr("value", lon_x);
    			     $('#uLatY').attr("value", lat_y);*/
    			     console.log($('#uLonX').val());
    			     console.log($('#uLatY').val());
    		     }else {	
    		    	 alert("주소를 정확히 입력해 주세요.");
    		    }
    		});
            // 커서를 상세주소 필드로 이동한다.
        }
    }).open();
}