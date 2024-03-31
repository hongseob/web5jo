const reviewButton = document.getElementById("reviewButton");
let starRate = 5;

$('.fa').click(function() {
	$(this).addClass('active')
	$(this).prevAll().addClass('active')
	$(this).nextAll().removeClass('active')

	let num = $(this).index()
	starRate = num + 1
	//     //$('.print').text(starRate)
	//     if (starRate == 1) {
	//         $('.print').html("<img src='../images/star-lv1.png'>" + "별로에요")
	//     }
	//     else if (starRate == 2) {
	//         $('.print').html("<img src='../images/star-lv2.png'>" + "보통 이에요")
	//     }
	//     else if (starRate == 3) {
	//         $('.print').html("<img src='../images/star-lv3.png'>" + "그냥 그래요")
	//     }
	//     else if (starRate == 4) {
	//         $('.print').html("<img src='../images/star-lv4.png'>" + "맘에 들어요")
	//     }
	//     else {
	//         $('.print').html("<img src='../images/star-lv5.png'>" + "아주 좋아요")
	//     }
});

function reviewSubmit() {

	if (window.confirm("작성한 리뷰를 등록하시겠습니까?")) {
		let comment = document.getElementById("reviewText");

		let offset = new Date().getTimezoneOffset() * 60000;
		let dateOffset = new Date(Date.now() - offset);
		let date = dateOffset.toISOString().substring(0, 10);

		$.ajax({
			url: '/main/review/ajax/campaignReview.do',
			dataType: 'json',
			data: {
				cId: info[0].campaignId,
				cNm: info[0].campaignName,
				mentorPkId: info[0].mentorPkId,
				mentorName: info[0].mentorName,
				starRate: starRate,
				comment: comment.value,
				date: date,
			},
			contentType: "application/json; charset=utf-8",
			async: false,
			type: 'GET',
			success: function(data) {
				var msg = "리뷰등록이 완료되었습니다.";
				alert(msg);
				location.href = "/mainBTable.do";
			},
			error: function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	} else {

	}

};

function reviewCheck() {
	if (info[0].reviewCheck == 'true') {
		console.log(info[0].reviewCheck);
		var reviewText = document.getElementById("reviewText");
		reviewText.placeholder = "이미 수강평을 작성하였습니다.";
		reviewText.readOnly = true;
		reviewButton.disabled = true;
	}
}

reviewCheck();
reviewButton.addEventListener("click", reviewSubmit);
