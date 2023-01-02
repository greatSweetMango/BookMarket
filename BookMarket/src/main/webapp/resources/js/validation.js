function CheckAddBook() {

	var bookId = document.getElementById("bookId");
	var name = document.getElementById("name");
	var bookPrice = document.getElementById("bookPrice");
	var booksInStock = document.getElementById("booksInStock");
	
	//도서코드검사
	if (!check(/^ISBN[0-9]{4,11}$/, bookId,
			"[도서 코드]\ISBN과 숫자를 조합하여 5~12자까지 입력하세요\n처음은 반드시 ISBN로 시작하세요"))
		return false;
	//도서명검사
	if (name.value.length < 4 || name.value.length > 12) {
		alert("[도서명]\n최소 4자에서 최대 50자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	//도서가격 검사
	if (bookPrice.value.length == 0 || isNaN(bookPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		bookPrice.select();
		bookPrice.focus();
		return false;
	}

	if (bookPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		bookPrice.select();
		bookPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, bookPrice,
			"[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;

	//재고수검사
	if (isNaN(booksInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		booksInStock.select();
		booksInStock.focus();
		return false;
	}

	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newBoook.submit()
}
