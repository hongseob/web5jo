const mentorName = document.getElementById("mentor");
const reviewCount = document.getElementById("reviewCount");
let one = 0;
let two = 0;
let three = 0;
let four = 0;
let five = 0;

function mentorReview() {	
	
	let mentorPkId = info[0].mentorPkId * 1;
	
	$.ajax({
		url : '/main/viewReview/ajax/viewReview.do',
		dataType : 'json',
		data : {
			mentorPkId : mentorPkId,
		},
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			mentorName.innerText = data.reviewList[0].mentorNm;
			reviewCount.innerText = data.reviewCount;
			reviewListView(data);
		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function reviewListView(data) {
	const tableBody = document.getElementById("reviewTableBody");
	const count = data.reviewCount;
	
	for(i=0; i < data.reviewList.length; i++) {
		let list = data.reviewList[i];
		let star = list.star;
		if(star == 1) {
			one++;
		} else if(star == 2) {
			two++;
		} else if(star == 3) {
			three++;
		} else if(star == 4) {
			four++;
		} else {
			five++;
		}
		
		let newRow = document.createElement("tr");
		newRow.setAttribute("id",`reviewTr${i}`);
		tableBody.appendChild(newRow);
		
		let newCell1 = document.createElement("td");
		let newCell2 = document.createElement("td");
		let newCell3 = document.createElement("td");
		let newCell4 = document.createElement("td");
		let newCell5 = document.createElement("td");
		
		let str = "";

		for(j=0; j<star; j++) {
			str += `<i class="fa fa-star active reviewStar"></i>`;
		}
		for(k=0; k<5-star; k++) {
			str += `<i class="fa fa-star reviewStar"></i>`;
		}
		
		
		
		newCell1.innerHTML = str;
		newCell2.innerText = list.uId;
		newCell3.innerText = list.cNm;
		newCell4.innerText = list.comment;
		newCell5.innerText = list.date;
		
		document.getElementById(`reviewTr${i}`).appendChild(newCell1);
		document.getElementById(`reviewTr${i}`).appendChild(newCell2);
		document.getElementById(`reviewTr${i}`).appendChild(newCell3);
		document.getElementById(`reviewTr${i}`).appendChild(newCell4);
		document.getElementById(`reviewTr${i}`).appendChild(newCell5);
		
	}
	let oneRatio = one / count * 100;
	let twoRatio = two / count * 100;
	let threeRatio = three / count * 100;
	let fourRatio = four / count * 100;
	let fiveRatio = five / count * 100;
	oneRatio += "%";
	twoRatio += "%";
	threeRatio += "%";
	fourRatio += "%";
	fiveRatio += "%";
	
	let totalNum = one + two*2 + three*3 + four*4 + five*5;
	let average = totalNum / count;
	
	document.getElementById("oneStar").style.width = oneRatio;
	document.getElementById("twoStar").style.width = twoRatio;
	document.getElementById("threeStar").style.width = threeRatio;
	document.getElementById("fourStar").style.width = fourRatio;
	document.getElementById("fiveStar").style.width = fiveRatio;
	if(Number.isInteger(average)) {
		average += ".0";
	}
	document.getElementById("starRate").innerText = average;
}

mentorReview();