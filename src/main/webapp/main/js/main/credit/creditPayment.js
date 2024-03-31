const table = document.getElementById('useTableBody');
const auth = userInfo[0].auth;

function requestPay() {
	var payValue = document.getElementById("addValue").innerText;
	payValue = payValue.replace(',', "");
	payValue *= 1;
	
	if(payValue == 0) {
		alert("충전할 금액을 입력해주세요.");
		return;
	}
	
	var balance = document.getElementById("resultValue").innerText;
	balance = balance.replace(',', "");
	balance *= 1;
	
	let offset = new Date().getTimezoneOffset() * 60000;
    let dateOffset = new Date(Date.now() - offset);
    const date = dateOffset.toISOString().substring(0, 10);
    
    /* 임시랜덤 주문번호 */
    let randomMerchantId = '';
    for (let i = 0; i < 4; i++) {
        randomMerchantId += Math.floor(Math.random() * 10)
    }
	
	IMP.init('imp50032061');  // 가맹점 식별코드
	IMP.request_pay({
		pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: randomMerchantId, // 상점에서 관리하는 주문 번호를 전달 / 주문번호가 같을시 에러(이미 이루어진 거래)
	    name : '주문명:결제테스트',
	    amount : payValue,	// 결제되는 금액
	    buyer_email : userInfo[0].id,
	    buyer_name : userInfo[0].name,
	    buyer_tel : userInfo[0].hp,
	  /*buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',*/
	    m_redirect_url : '../main/credit.do'
	}, function(rsp) {
		
		if(rsp.success) {	// 결제 성공 시 : 결제 승인 또는 가상계좌 발급에 성공 경우
			$.ajax({
				url: '/main/creditSubmit/ajax/creditSubmit.do',
				dataType : 'json',
				data : {
					imp_uid: rsp.imp_uid,
					merchant_uid: rsp.merchant_uid,
					sort: 1,
					p_dt: date,
					amount: payValue,
					newCredit: balance,
				},
				contentType : "application/json; charset=utf-8",
				type: 'GET',
				success: function(data) {
					/*console.log("ajax Success");*/
				},
				function(request, status, error) {
					console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
			var msg = "결제가 완료되었습니다.";
			alert(msg);
			if(auth == 'B') {
				location.href = "/mainBTable.do";
			} else {
				location.href = "/mainATable.do";
			}
			
		} else {
			var msg = "결제에 실패하였습니다.";
			msg += "\n에러내용 : " + rsp.error_msg;
			alert(msg);
		}
	});
}

function buttonCheck() {
	const button = document.getElementById("historyButton");
	var buttonStatus = button.innerText;
	
	if(buttonStatus == "충전내역 불러오기") {
		historyView();
	} else if(buttonStatus == "충전내역 열기") {
		historyOpen(button);
	} else if(buttonStatus == "충전내역 닫기") {
		historyClose(button);
	}
}

function historyView() {
	$.ajax({
		url: '/main/creditHistory/ajax/creditHistoryView.do',
		dataType : 'json',
		data : {
			
		},
		contentType : "application/json; charset=utf-8",
		type: 'GET',
		success: function(data) {
			const List = data.historyList;
			historyTrAdd(List);
			
		},
		function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function historyTrAdd(List) {
	
	for(i=0; i<List.length; i++) {
		let newRow = document.createElement("tr");
		table.appendChild(newRow);
		
		let newCell1 = document.createElement("td");
		let newCell2 = document.createElement("td");
		let newCell3 = document.createElement("td");
		let newCell4 = document.createElement("td");
		let newCell5 = document.createElement("td");
		
		newCell1.innerText = List[i].impUid;
		newCell3.innerText = List[i].pDt;
		newCell4.innerText = List[i].merchantUid;
		var amount = List[i].amount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		
		if(List[i].sort == 1) {
			newCell2.innerText = "충전";
			newCell5.innerText = `+${amount}`;
		} else if(List[i].sort == 2) {
			newCell2.innerText = "사용";
			newCell5.innerText = `-${amount}`;
		} else if(List[i].sort == 3) {
			newCell2.innerText = "사용 취소";
			newCell5.innerText = `+${amount}`;
		}
		
		newRow.appendChild(newCell1);
		newRow.appendChild(newCell2);
		newRow.appendChild(newCell3);
		newRow.appendChild(newCell4);
		newRow.appendChild(newCell5);
		
		const button = document.getElementById("historyButton");
		button.innerText = "충전내역 닫기";
	}
}

function historyOpen(button) {
	table.style.display = "";
	button.innerText = "충전내역 닫기";
}

function historyClose(button) {
	table.style.display = "none";
	button.innerText = "충전내역 열기";
}


