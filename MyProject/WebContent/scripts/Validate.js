	var firstname = $("#firstName").val();
		var lastname = $("#lastName").val();
		if(firstname.length == 0 && $.trim(salesId).length == 0) {
			alert("Please provide Party Name / Sales ID");
			return false;
		} else if(validateFields("#NewPayment","left", 0)) {
			var date = $("#entryDate").val();
			var payerName = $("#payerName").val();
			var mainPayer = $("#mainPayer").val();
			var amount = $("#cashReceiptAmt").val();

			$("#loading").show();
			var params = {date: date, payerName: payerName, mainPayer: mainPayer, 
						amount: amount, partyName: partyName, salesId: salesId, 
						Time: (new Date()).getTime()};
			$.ajax({
				url: "addNewPayer.action",
				method: "get",
				dataType:"json",
				data: params,
				success: function(data){
					var errorString = data.errorString;
					var resultString = data.resultString;
					if(resultString == "error") {
						$("#loading").hide();
						if(errorString.substring(errorString.length-2) == "ST") {
							alert(errorString.substring(0, errorString.length-2));
							window.location.href = "logout.action";
							return;
						} else {
							alert(errorString);
						}
						return;
					});
				});