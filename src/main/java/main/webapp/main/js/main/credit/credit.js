let sum = 0;
const clearButton = document.getElementById("clearButton");
const form = document.getElementById("form");

function setResultValue() {
    let initValue = document.getElementById("initValue").innerText;
    let resultValue = document.getElementById("resultValue");

    resultValue.innerText = initValue;
}

function clearValue() {
    sum = 0;
    let input = document.getElementById("inputValue");
    let addValue = document.getElementById("addValue");

    input.value = "";
    addValue.innerText = 0;
    calcValue(0);
}

function inputValueSubmit(event) {
    event.preventDefault();

    let putValue = document.getElementById("inputValue").value;
    let addValue = document.getElementById("addValue");

    if (putValue) {
        addValue.innerText = put_comma(putValue.toString());
        calcValue(putValue);
    } else {

    }
}

function calc(button) {
    if (button) {
        sum += parseInt(button.value);
    } else {
        sum -= button.value;
    }
    document.getElementById("inputValue").value = sum;
}

function calcValue(putValue) {
    let valueSum = 0;
    let resultValue = document.getElementById("resultValue");

    let initValue = document.getElementById("initValue").innerText;
    initValue = initValue.replace(/[^0-9]/g, "");
    valueSum += parseInt(initValue);
    valueSum += parseInt(putValue);
    valueSum = put_comma(valueSum.toString());

    resultValue.innerText = valueSum;
}

function put_comma(string) {
    var str = string.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    return str
}

function selectTable() {
    const val = document.getElementById("select_sort").value;
    const rows = document.getElementById("useTableBody").getElementsByTagName("tr");
    let length = rows.length;
    for (i = 0; i < length; i++) {
        rows[i].style.display = '';
    }

    selectTableSort(val, rows, length);
}

function selectTableSort(val, rows, length) {
    if (val == "충전") {
        for (i = 0; i < length; i++) {
            let Cell = rows[i].getElementsByTagName("td")[1].innerText;
            if (Cell != val) {
                rows[i].style.display = 'none';
            }
        }
    } else if (val == "사용") {
        for (i = 0; i < length; i++) {
            let Cell = rows[i].getElementsByTagName("td")[1].innerText;
            if (Cell != val) {
                rows[i].style.display = 'none';
            }
        }
    } else if(val == "사용 취소") {
    	for (i = 0; i < length; i++) {
            let Cell = rows[i].getElementsByTagName("td")[1].innerText;
            if (Cell != val) {
                rows[i].style.display = 'none';
            }
        }
    }
    selectTableDate(rows, length);
}

function selectTableDate(rows, length) {
    const val2 = document.getElementById("select_date").value;

    let offset = new Date().getTimezoneOffset() * 60000;
    let dateOffset = new Date(Date.now() - offset);
    const now = dateOffset.toISOString().substring(0, 10);
    if (val2 == "day") {
        var yesterdayOffset = new Date(dateOffset.setDate(dateOffset.getDate() - 1));
        var yesterday = yesterdayOffset.toISOString().substring(0, 10);

        for (i = 0; i < length; i++) {
            let Cell = rows[i].getElementsByTagName("td")[2].innerText;
            if (Cell < yesterday) {
                rows[i].style.display = 'none';
            }
        }
    } else if (val2 == "week") {
        var weekOffset = new Date(dateOffset.setDate(dateOffset.getDate() - 7));
        var oneWeekAgo = weekOffset.toISOString().substring(0, 10);

        for (i = 0; i < length; i++) {
            let Cell = rows[i].getElementsByTagName("td")[2].innerText;
            if (Cell < oneWeekAgo) {
                rows[i].style.display = 'none';
            }
        }
    } else if (val2 == "month") {
        var monthOffset = new Date(dateOffset.setDate(dateOffset.getDate() - 30));
        var oneMonthAgo = monthOffset.toISOString().substring(0, 10);

        for (i = 0; i < length; i++) {
            let Cell = rows[i].getElementsByTagName("td")[2].innerText;
            if (Cell < oneMonthAgo) {
                rows[i].style.display = 'none';
            }
        }
    }
}

setResultValue();
clearButton.addEventListener("click", clearValue)
form.addEventListener("submit", inputValueSubmit);