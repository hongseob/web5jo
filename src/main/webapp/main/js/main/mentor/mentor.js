const nextPageButton = document.getElementById("nextButton");
const checkButtons = document.querySelectorAll(".checkButton");
const selectButtonBox = document.getElementById("selectButtonBox");
const clearButton = document.getElementById("clearButton");
const addButton = document.getElementById("fieldCheck");
const submitButton = document.getElementById("submitButton");
const field = document.getElementById("field");
const process = document.getElementById("process");
const jobCategoryNum = document.getElementById("jobCategoryNum");
const job = document.getElementById("job");
const link = document.getElementById("link");
const file = document.getElementById("file");
const information = document.getElementById("information");
const form = document.getElementById("submitButton");
const returnButton = document.getElementById("returnButton");


const swiper = new Swiper('.swiper', {
	// Optional parameters
	direction: 'vertical',
	// loop: true,

	// If we need pagination
	pagination: {
		el: '.swiper-pagination',
	},

	// Navigation arrows
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev',
	},

	// And if we need scrollbar
	scrollbar: {
		el: '.swiper-scrollbar',
	},
	allowTouchMove: false,
	mousewheel: true,
	speed: 800,
});


// 파일 이름 표출
$(document).ready(function() {
	var fileTarget = $('.fileBox .inputFile');

	fileTarget.on('change', function() {
		if (window.FileReader) {
			var filename = $(this)[0].files[0].name;
		}
		else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}

		$(this).siblings('.upload-name').val(filename);
	})
})


$('#field').keypress(function(event) {
	if (event.which == 13) {
		addCategory();
	}
});
$('#process').keypress(function(event) {
	if (event.which == 13) {
		$('#processCheck').click();
		return false;
	}
});
$('#job').keypress(function(event) {
	if (event.which == 13) {
		$('#jobCheck').click();
		return false;
	}
});
$('#link').keypress(function(event) {
	if (event.which == 13) {
		$('#linkCheck').click();
		return false;
	}
});
$('#information').keypress(function(event) {
	if (event.which == 13) {
		$('#informationCheck').click();
		return false;
	}
});

// 확인버튼 클릭시 다음페이지 이동
[].forEach.call(checkButtons, function(checkButton) {
	checkButton.addEventListener("click", moveNextPage, false);
})


function returnPage() {
	location.href = "/mainBTable.do";
}


// 카테고리 추가버튼 기능
function addCategory() {
	let addInput = document.getElementById("field");

	if (addInput.value == "") {
		return;
	} else {
		const newBtn = document.createElement('button');
		selectButtonBox.appendChild(newBtn);
		newBtn.setAttribute('class', "categoryOne");
		newBtn.innerText = addInput.value;
	}
}

$(function() {
	$("#field").on('input', function() {
		if ($("#field").val() == '') {
			$("#fieldCheck").attr("disabled", true);
		}
		else {
			$("#fieldCheck").attr("disabled", false);
		}
	})
})

// 카테고리 리셋 기능
function clearCategory() {
	while (selectButtonBox.hasChildNodes()) {
		selectButtonBox.removeChild(selectButtonBox.firstChild);
	}
}

function moveNextPage(e) {
	nextPageButton.click();
}

// 제출 버튼 조건
function mentorInfoCheck() {
	if (process.value == "" || job.value == "" || link.value == "" || information.value == "") {
		alert("필수입력정보가 누락되어있습니다.");
	} else if (jobCategoryNum.value == 0) {
		alert("카테고리를 선택해주세요.");
	} else if (file.value == "파일을 등록해주세요.") {
		alert("인증서류파일을 등록해주세요.");
	} else {
		file_upload();
		mentorApply();
	}
}

// 입력정보 제출
function mentorApply() {
	let offset = new Date().getTimezoneOffset() * 60000;
	let dateOffset = new Date(Date.now() - offset);
	const date = dateOffset.toISOString().substring(0, 10);

	var selectBtn = new Array();
	var category = $("#selectButtonBox").children('.categoryOne').each(function() {
		selectBtn.push($(this).val());
	});

	const buttons = document.querySelectorAll(".categoryOne");
	var categoryList = [];
	for (i = 0; i < buttons.length; i++) {
		categoryList[i] = buttons[i].innerText;
	}

	var jobNum = jobCategoryNum.value * 1;

	$.ajax({
		url: '/main/mentor/ajax/infoUpload.do',
		dataType: 'json',
		data: {
			category: JSON.stringify(categoryList),
			process: process.value,
			job: job.value,
			job_category: jobNum,
			link: link.value,
			information: information.value,
			regi_date: date,
		},
		contentType: "application/json; charset=utf-8",
		type: 'GET',
		success: function(data) {
			var msg = "멘토 지원내용이 제출되었습니다.";
			alert(msg);
			location.href = "/mainBTable.do";
		},
		error: function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

// 제출파일 업로드
function file_upload() {

	var form = new FormData($(".fileForm")[0]);

	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	$.ajax({
		url: "/main/mentor/ajax/fileUpload.do",
		type: "POST",
		async: false,
		data: new FormData($(".fileForm")[0]),
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		cache: false,
		success: function() {
			/*console.log("suc");*/
		},
		error: function() {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

addButton.addEventListener("click", addCategory);
clearButton.addEventListener("click", clearCategory);
submitButton.addEventListener("click", mentorInfoCheck);
returnButton.addEventListener("click", returnPage);